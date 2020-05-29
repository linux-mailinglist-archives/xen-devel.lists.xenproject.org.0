Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7361E884D
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 22:01:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jelBP-0003eW-GI; Fri, 29 May 2020 20:00:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY44=7L=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jelBN-0003eR-Vh
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 20:00:46 +0000
X-Inumbo-ID: 14f8bd92-a1e7-11ea-9dbe-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14f8bd92-a1e7-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 20:00:45 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:43020
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jelBL-000i5y-JQ (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 29 May 2020 21:00:43 +0100
Subject: Re: [PATCH v2 13/14] x86/S3: Save and restore Shadow Stack
 configuration
To: Jan Beulich <jbeulich@suse.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-14-andrew.cooper3@citrix.com>
 <c1f1cb73-65f7-f2f7-161c-b505edc5959e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ec3517ca-c5b3-951f-0bbf-05414f82ca19@citrix.com>
Date: Fri, 29 May 2020 21:00:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c1f1cb73-65f7-f2f7-161c-b505edc5959e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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

On 29/05/2020 13:52, Jan Beulich wrote:
> On 27.05.2020 21:18, Andrew Cooper wrote:
>> See code for details
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Semi-RFC - I can't actually test this path.  Currently attempting to arrange
>> for someone else to.
> Nevertheless
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one question, just for my understanding:
>
>> @@ -48,6 +58,51 @@ ENTRY(s3_resume)
>>          pushq   %rax
>>          lretq
>>  1:
>> +#ifdef CONFIG_XEN_SHSTK
>> +        /*
>> +         * Restoring SSP is a little complicated, because we are intercepting
>> +         * an in-use shadow stack.  Write a temporary token under the stack,
>> +         * so SETSSBSY will successfully load a value useful for us, then
>> +         * reset MSR_PL0_SSP to its usual value and pop the temporary token.
>> +         */
>> +        mov     saved_rsp(%rip), %rdi
>> +        cmpq    $1, %rdi
>> +        je      .L_shstk_done
>> +
>> +        /* Set up MSR_S_CET. */
>> +        mov     $MSR_S_CET, %ecx
>> +        xor     %edx, %edx
>> +        mov     $CET_SHSTK_EN | CET_WRSS_EN, %eax
>> +        wrmsr
>> +
>> +        /* Construct the temporary supervisor token under SSP. */
>> +        sub     $8, %rdi
>> +
>> +        /* Load it into MSR_PL0_SSP. */
>> +        mov     $MSR_PL0_SSP, %ecx
>> +        mov     %rdi, %rdx
>> +        shr     $32, %rdx
>> +        mov     %edi, %eax
>> +        wrmsr
>> +
>> +        /* Enable CET.  MSR_INTERRUPT_SSP_TABLE is set up later in load_system_tables(). */
>> +        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ebx
>> +        mov     %rbx, %cr4
> Does this imply NMI or #MC are fatal between here and there?

Yes, but that is always the case during CPU bringup.

Only a few instructions ago, we didn't have an IDT, and we don't have
yet have an established %tr, so can't get the regular IST pointer either.

~Andrew

