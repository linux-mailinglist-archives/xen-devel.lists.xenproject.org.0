Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C74C61E88E6
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 22:29:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jelc2-0005mI-NT; Fri, 29 May 2020 20:28:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY44=7L=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jelc1-0005mC-1P
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 20:28:17 +0000
X-Inumbo-ID: ec9667d8-a1ea-11ea-81bc-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec9667d8-a1ea-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 20:28:15 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:43814
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jelbw-000xwg-M4 (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 29 May 2020 21:28:12 +0100
Subject: Re: [PATCH v2 14/14] x86/shstk: Activate Supervisor Shadow Stacks
To: Jan Beulich <jbeulich@suse.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-15-andrew.cooper3@citrix.com>
 <886eccd3-e2d4-fdc5-f1cd-e8671a5271e2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e544c9da-1a58-a79c-5017-ccda40fc56eb@citrix.com>
Date: Fri, 29 May 2020 21:28:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <886eccd3-e2d4-fdc5-f1cd-e8671a5271e2@suse.com>
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

On 29/05/2020 14:09, Jan Beulich wrote:
> On 27.05.2020 21:18, Andrew Cooper wrote:
>> With all other plumbing in place, activate shadow stacks when possible.  Note
>> that this requires prohibiting the use of PV32.  Compatibility can be
>> maintained if necessary via PV-Shim.
> In the revision log you say "Discuss CET-SS disabling PV32", and I
> agree both here and in the command line doc you mention the "that"
> aspect. But what about the "why"? Aiui "is incompatible" or
> "requires" are too strong statements: It could be made work (by
> disabling / enabling CET on the way out of / back into Xen), but
> besides losing some of the intended protection that way, it would
> be quite a bit of overhead. So it's more like a design decision,
> and it would be nice to express it like this at least in the
> commit message.

For starters, the guest kernel and Xen share the single
MSR_S_CET.SHSKT_EN bit, as they are both supervisor in the eyes of the
processor.

We can't use the PV32_CR4 trick to turn CET.SS off on return to guest
kernel context, because (unlike SMAP/SMEP), the race condition with a
late NMI would manifest as #CP against the IRET, not a spurious page fault.

Furthermore, an IRET to Ring 3 and an IRET to Ring 1 now differ by three
words on the shadow stack.  An IRET to Ring 1 is a supervisor return, so
performs consistency checks on %cs/%lip/SSP on the shadow stack.  We
could in theory shuffle the shadow stack by 3 words on context switch.

It might theoretically be possible to make something which functioned
correctly with a PV guest kernel which doesn't understand a
paravirtualised version of supervisor shadow stacks, but I quickly
concluded that it isn't even worth the effort to figure for certain.

>
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -664,6 +664,13 @@ static void __init noreturn reinit_bsp_stack(void)
>>      stack_base[0] = stack;
>>      memguard_guard_stack(stack);
>>  
>> +    if ( cpu_has_xen_shstk )
>> +    {
>> +        wrmsrl(MSR_PL0_SSP, (unsigned long)stack + 0x5ff8);
> Please replace this remaining literal number accordingly.
>
>> @@ -1801,6 +1823,10 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>  
>>      alternative_branches();
>>  
>> +    /* Defer CR4.CET until alternatives have finished playing with CR4.WP */
>> +    if ( cpu_has_xen_shstk )
>> +        set_in_cr4(X86_CR4_CET);
> Nit: The comment still wants changing to CR0.WP.
>
> With these taken care of in some form
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

