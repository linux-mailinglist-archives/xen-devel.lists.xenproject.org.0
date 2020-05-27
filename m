Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 572751E4367
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 15:20:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdvxw-0003xc-ID; Wed, 27 May 2020 13:19:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+pkZ=7J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdvxv-0003xX-An
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 13:19:27 +0000
X-Inumbo-ID: aecb59e3-a01c-11ea-a745-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aecb59e3-a01c-11ea-a745-12813bfff9fa;
 Wed, 27 May 2020 13:19:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 03E9BAFED;
 Wed, 27 May 2020 13:19:26 +0000 (UTC)
Subject: Re: [PATCH] x86/boot: Fix load_system_tables() to be NMI/#MC-safe
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200527130607.32069-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <50f66504-ab7b-2f3e-1695-003ad69ae37a@suse.com>
Date: Wed, 27 May 2020 15:19:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527130607.32069-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 27.05.2020 15:06, Andrew Cooper wrote:
> @@ -720,30 +721,26 @@ void load_system_tables(void)
>  		.limit = (IDT_ENTRIES * sizeof(idt_entry_t)) - 1,
>  	};
>  
> -	*tss = (struct tss64){
> -		/* Main stack for interrupts/exceptions. */
> -		.rsp0 = stack_bottom,
> -
> -		/* Ring 1 and 2 stacks poisoned. */
> -		.rsp1 = 0x8600111111111111ul,
> -		.rsp2 = 0x8600111111111111ul,
> -
> -		/*
> -		 * MCE, NMI and Double Fault handlers get their own stacks.
> -		 * All others poisoned.
> -		 */
> -		.ist = {
> -			[IST_MCE - 1] = stack_top + IST_MCE * PAGE_SIZE,
> -			[IST_DF  - 1] = stack_top + IST_DF  * PAGE_SIZE,
> -			[IST_NMI - 1] = stack_top + IST_NMI * PAGE_SIZE,
> -			[IST_DB  - 1] = stack_top + IST_DB  * PAGE_SIZE,
> -
> -			[IST_MAX ... ARRAY_SIZE(tss->ist) - 1] =
> -				0x8600111111111111ul,
> -		},
> -
> -		.bitmap = IOBMP_INVALID_OFFSET,
> -	};
> +	/*
> +	 * Set up the TSS.  Warning - may be live, and the NMI/#MC must remain
> +	 * valid on every instruction boundary.  (Note: these are all
> +	 * semantically ACCESS_ONCE() due to tss's volatile qualifier.)
> +	 *
> +	 * rsp0 refers to the primary stack.  #MC, #DF, NMI and #DB handlers
> +	 * each get their own stacks.  No IO Bitmap.
> +	 */
> +	tss->rsp0 = stack_bottom;
> +	tss->ist[IST_MCE - 1] = stack_top + IST_MCE * PAGE_SIZE;
> +	tss->ist[IST_DF  - 1] = stack_top + IST_DF  * PAGE_SIZE;
> +	tss->ist[IST_NMI - 1] = stack_top + IST_NMI * PAGE_SIZE;
> +	tss->ist[IST_DB  - 1] = stack_top + IST_DB  * PAGE_SIZE;
> +	tss->bitmap = IOBMP_INVALID_OFFSET;
> +
> +	/* All other stack pointers poisioned. */
> +	for ( i = IST_MAX; i < ARRAY_SIZE(tss->ist); ++i )
> +		tss->ist[i] = 0x8600111111111111ul;
> +	tss->rsp1 = 0x8600111111111111ul;
> +	tss->rsp2 = 0x8600111111111111ul;

ACCESS_ONCE() unfortunately only has one of the two needed effects:
It guarantees that each memory location gets accessed exactly once
(which I assume can also be had with just the volatile addition,
but without the moving away from using an initializer), but it does
not guarantee single-insn accesses. I consider this in particular
relevant here because all of the 64-bit fields are misaligned. By
doing it like you do, we're setting us up to have to re-do this yet
again in a couple of years time (presumably using write_atomic()
instead then).

Nevertheless it is a clear improvement, so if you want to leave it
like this
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

