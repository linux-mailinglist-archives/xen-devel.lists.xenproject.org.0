Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB47F1E47BB
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 17:39:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdy93-0000i5-Vq; Wed, 27 May 2020 15:39:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PV0l=7J=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jdy92-0000hv-2F
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 15:39:04 +0000
X-Inumbo-ID: 307b211d-a030-11ea-a760-12813bfff9fa
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 307b211d-a030-11ea-a760-12813bfff9fa;
 Wed, 27 May 2020 15:39:03 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:37566
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jdy8y-000MCH-KJ (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Wed, 27 May 2020 16:39:00 +0100
Subject: Re: [PATCH] x86/boot: Fix load_system_tables() to be NMI/#MC-safe
To: Jan Beulich <jbeulich@suse.com>
References: <20200527130607.32069-1-andrew.cooper3@citrix.com>
 <50f66504-ab7b-2f3e-1695-003ad69ae37a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e9efb665-2a16-4234-fb5b-4da391cc0572@citrix.com>
Date: Wed, 27 May 2020 16:38:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <50f66504-ab7b-2f3e-1695-003ad69ae37a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27/05/2020 14:19, Jan Beulich wrote:
> On 27.05.2020 15:06, Andrew Cooper wrote:
>> @@ -720,30 +721,26 @@ void load_system_tables(void)
>>  		.limit = (IDT_ENTRIES * sizeof(idt_entry_t)) - 1,
>>  	};
>>  
>> -	*tss = (struct tss64){
>> -		/* Main stack for interrupts/exceptions. */
>> -		.rsp0 = stack_bottom,
>> -
>> -		/* Ring 1 and 2 stacks poisoned. */
>> -		.rsp1 = 0x8600111111111111ul,
>> -		.rsp2 = 0x8600111111111111ul,
>> -
>> -		/*
>> -		 * MCE, NMI and Double Fault handlers get their own stacks.
>> -		 * All others poisoned.
>> -		 */
>> -		.ist = {
>> -			[IST_MCE - 1] = stack_top + IST_MCE * PAGE_SIZE,
>> -			[IST_DF  - 1] = stack_top + IST_DF  * PAGE_SIZE,
>> -			[IST_NMI - 1] = stack_top + IST_NMI * PAGE_SIZE,
>> -			[IST_DB  - 1] = stack_top + IST_DB  * PAGE_SIZE,
>> -
>> -			[IST_MAX ... ARRAY_SIZE(tss->ist) - 1] =
>> -				0x8600111111111111ul,
>> -		},
>> -
>> -		.bitmap = IOBMP_INVALID_OFFSET,
>> -	};
>> +	/*
>> +	 * Set up the TSS.  Warning - may be live, and the NMI/#MC must remain
>> +	 * valid on every instruction boundary.  (Note: these are all
>> +	 * semantically ACCESS_ONCE() due to tss's volatile qualifier.)
>> +	 *
>> +	 * rsp0 refers to the primary stack.  #MC, #DF, NMI and #DB handlers
>> +	 * each get their own stacks.  No IO Bitmap.
>> +	 */
>> +	tss->rsp0 = stack_bottom;
>> +	tss->ist[IST_MCE - 1] = stack_top + IST_MCE * PAGE_SIZE;
>> +	tss->ist[IST_DF  - 1] = stack_top + IST_DF  * PAGE_SIZE;
>> +	tss->ist[IST_NMI - 1] = stack_top + IST_NMI * PAGE_SIZE;
>> +	tss->ist[IST_DB  - 1] = stack_top + IST_DB  * PAGE_SIZE;
>> +	tss->bitmap = IOBMP_INVALID_OFFSET;
>> +
>> +	/* All other stack pointers poisioned. */
>> +	for ( i = IST_MAX; i < ARRAY_SIZE(tss->ist); ++i )
>> +		tss->ist[i] = 0x8600111111111111ul;
>> +	tss->rsp1 = 0x8600111111111111ul;
>> +	tss->rsp2 = 0x8600111111111111ul;
> ACCESS_ONCE() unfortunately only has one of the two needed effects:
> It guarantees that each memory location gets accessed exactly once
> (which I assume can also be had with just the volatile addition,
> but without the moving away from using an initializer), but it does
> not guarantee single-insn accesses.

Linux's memory-barriers.txt disagrees, and specifically gives an example
with a misaligned int (vs two shorts) and the use volatile cast (by way
of {READ,WRITE}_ONCE()) to prevent load/store tearing, as the memory
location is of a size which can be fit in a single access.

I'm fairly sure we're safe here.

>  I consider this in particular
> relevant here because all of the 64-bit fields are misaligned. By
> doing it like you do, we're setting us up to have to re-do this yet
> again in a couple of years time (presumably using write_atomic()
> instead then).
>
> Nevertheless it is a clear improvement, so if you want to leave it
> like this
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks,

~Andrew

