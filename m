Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 208AD49073E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 12:43:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258131.444198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9QPt-0004OY-Hc; Mon, 17 Jan 2022 11:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258131.444198; Mon, 17 Jan 2022 11:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9QPt-0004Mi-E8; Mon, 17 Jan 2022 11:43:17 +0000
Received: by outflank-mailman (input) for mailman id 258131;
 Mon, 17 Jan 2022 11:43:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SaLw=SB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n9QPr-0004MY-TR
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 11:43:15 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7819f68-778a-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 12:43:14 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:49190)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n9QPk-000oR4-0X (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 17 Jan 2022 11:43:08 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id E80751FC70;
 Mon, 17 Jan 2022 11:43:07 +0000 (GMT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a7819f68-778a-11ec-9bbc-9dff3e4ee8c5
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <997c45b3-9346-57ce-56a5-52815edba3fb@srcf.net>
Date: Mon, 17 Jan 2022 11:43:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/3] x86/spec-ctrl: Fix NMI race condition with VT-x
 MSR_SPEC_CTRL handling
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220113163833.3831-1-andrew.cooper3@citrix.com>
 <20220113163833.3831-4-andrew.cooper3@citrix.com>
 <0745653b-6525-a7ba-f6c8-b47838559db2@srcf.net>
 <76f9d499-fabe-5d90-d769-bbd86ae421f8@srcf.net>
 <02bec1da-9ea8-3bca-519c-855332eedde1@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <02bec1da-9ea8-3bca-519c-855332eedde1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/01/2022 09:21, Jan Beulich wrote:
> On 14.01.2022 15:41, Andrew Cooper wrote:
>> On 14/01/2022 14:14, Andrew Cooper wrote:
>>> On 13/01/2022 16:38, Andrew Cooper wrote:
>>>> The logic was based on a mistaken understanding of how NMI blocking on vmexit
>>>> works.  NMIs are only blocked for EXIT_REASON_NMI, and not for general exits.
>>>> Therefore, an NMI can in general hit early in the vmx_asm_vmexit_handler path,
>>>> and the guest's value will be clobbered before it is saved.
>>>>
>>>> Switch to using MSR load/save lists.  This causes the guest value to be saved
>>>> atomically with respect to NMIs/MCEs/etc.
>>>>
>>>> First, update vmx_cpuid_policy_changed() to configure the load/save lists at
>>>> the same time as configuring the intercepts.  This function is always used in
>>>> remote context, so extend the vmx_vmcs_{enter,exit}() block to cover the whole
>>>> function, rather than having multiple remote acquisitions of the same VMCS.
>>>>
>>>> vmx_add_guest_msr() can fail, but only in ways which are entirely fatal to the
>>>> guest, so handle failures using domain_crash().  vmx_del_msr() can fail with
>>>> -ESRCH but we don't matter, and this path will be taken during domain create
>>>> on a system lacking IBRSB.
>>>>
>>>> Second, update vmx_msr_{read,write}_intercept() to use the load/save lists
>>>> rather than vcpu_msrs, and update the comment to describe the new state
>>>> location.
>>>>
>>>> Finally, adjust the entry/exit asm.  Drop DO_SPEC_CTRL_ENTRY_FROM_HVM
>>>> entirely, and use a shorter code sequence to simply reload Xen's setting from
>>>> the top-of-stack block.
>>>>
>>>> Because the guest values are loaded/saved atomically, we do not need to use
>>>> the shadowing logic to cope with late NMIs/etc, so we can omit
>>>> DO_SPEC_CTRL_EXIT_TO_GUEST entirely and VMRESUME/VMLAUNCH with Xen's value in
>>>> context.  Furthermore, we can drop the SPEC_CTRL_ENTRY_FROM_PV too, as there's
>>>> no need to switch back to Xen's context on an early failure.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>> CC: Wei Liu <wl@xen.org>
>>>> CC: Jun Nakajima <jun.nakajima@intel.com>
>>>> CC: Kevin Tian <kevin.tian@intel.com>
>>>>
>>>> Needs backporting as far as people can tolerate.
>>>>
>>>> If the entry/exit logic were in C, I'd ASSERT() that shadow tracking is off,
>>>> but this is awkard to arrange in asm.
>>> Actually, it's just occurred to me that an ASSERT is actually quite easy
>>> here.  I'm proposing this additional delta (totally untested).
>>>
>>> diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
>>> index 297ed8685126..f569c3259b32 100644
>>> --- a/xen/arch/x86/hvm/vmx/entry.S
>>> +++ b/xen/arch/x86/hvm/vmx/entry.S
>>> @@ -41,6 +41,13 @@ ENTRY(vmx_asm_vmexit_handler)
>>>              movzbl CPUINFO_xen_spec_ctrl(%rsp), %eax
>>>              xor    %edx, %edx
>>>              wrmsr
>>> +
>>> +#ifdef CONFIG_DEBUG
>>> +            testb $SCF_use_shadow, CPUINFO_spec_ctrl_flags(%rsp)
>>> +            jz 1f
>>> +            ASSERT_FAILED("MSR_SPEC_CTRL shadowing active")
>>> +1:
>>> +#endif
>>>          .endm
>>>          ALTERNATIVE "", restore_spec_ctrl, X86_FEATURE_SC_MSR_HVM
>>>          /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
>> Irritatingly this doesn't work, because the metadata associated with the
>> ud2 instruction is tied to the compiled position in
>> .altinstr_replacement, not the runtime position after alternatives have run.
> Could we have the macro "return" ZF, leaving it to the invocation
> site of the macro to act on it? ALTERNATIVE's first argument could
> easily be "xor %reg, %reg" to set ZF without much other overhead.

That's very subtle, and a substantial layering violation.  I really
don't think the complexity is worth it.

~Andrew

