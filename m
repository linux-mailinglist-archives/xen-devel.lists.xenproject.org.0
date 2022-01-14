Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED34E48EB10
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 14:49:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257633.442827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8MxD-0008MA-FF; Fri, 14 Jan 2022 13:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257633.442827; Fri, 14 Jan 2022 13:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8MxD-0008JS-BY; Fri, 14 Jan 2022 13:49:19 +0000
Received: by outflank-mailman (input) for mailman id 257633;
 Fri, 14 Jan 2022 13:49:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vyuu=R6=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n8MxB-0008JL-OZ
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 13:49:17 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c35b1aac-7540-11ec-a115-11989b9578b4;
 Fri, 14 Jan 2022 14:49:16 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:48796)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n8Mx5-000rhU-1N (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 14 Jan 2022 13:49:11 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 3A8801FC09;
 Fri, 14 Jan 2022 13:49:11 +0000 (GMT)
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
X-Inumbo-ID: c35b1aac-7540-11ec-a115-11989b9578b4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <e32954d0-41b6-857e-522d-ccd35bbdffbb@srcf.net>
Date: Fri, 14 Jan 2022 13:49:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/3] x86/spec-ctrl: Fix NMI race condition with VT-x
 MSR_SPEC_CTRL handling
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <20220113163833.3831-1-andrew.cooper3@citrix.com>
 <20220113163833.3831-4-andrew.cooper3@citrix.com>
 <YeFxqOPqi/DPpugL@Air-de-Roger>
 <528354d2-9de0-fe12-20e7-b3500a5f6ad9@srcf.net>
 <YeF+CZj9p3Z6j7ts@Air-de-Roger>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <YeF+CZj9p3Z6j7ts@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/01/2022 13:43, Roger Pau Monné wrote:
> On Fri, Jan 14, 2022 at 01:08:43PM +0000, Andrew Cooper wrote:
>> On 14/01/2022 12:50, Roger Pau Monné wrote:
>>> On Thu, Jan 13, 2022 at 04:38:33PM +0000, Andrew Cooper wrote:
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
>>>> ---
>>>>  xen/arch/x86/hvm/vmx/entry.S             | 19 ++++++++++-------
>>>>  xen/arch/x86/hvm/vmx/vmx.c               | 36 +++++++++++++++++++++++++++-----
>>>>  xen/arch/x86/include/asm/msr.h           | 10 ++++++++-
>>>>  xen/arch/x86/include/asm/spec_ctrl_asm.h | 32 ++++------------------------
>>>>  4 files changed, 56 insertions(+), 41 deletions(-)
>>>>
>>>> diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
>>>> index 30139ae58e9d..297ed8685126 100644
>>>> --- a/xen/arch/x86/hvm/vmx/entry.S
>>>> +++ b/xen/arch/x86/hvm/vmx/entry.S
>>>> @@ -35,7 +35,14 @@ ENTRY(vmx_asm_vmexit_handler)
>>>>  
>>>>          /* SPEC_CTRL_ENTRY_FROM_VMX    Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
>>>>          ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
>>>> -        ALTERNATIVE "", DO_SPEC_CTRL_ENTRY_FROM_HVM, X86_FEATURE_SC_MSR_HVM
>>>> +
>>>> +        .macro restore_spec_ctrl
>>>> +            mov    $MSR_SPEC_CTRL, %ecx
>>>> +            movzbl CPUINFO_xen_spec_ctrl(%rsp), %eax
>>>> +            xor    %edx, %edx
>>>> +            wrmsr
>>>> +        .endm
>>>> +        ALTERNATIVE "", restore_spec_ctrl, X86_FEATURE_SC_MSR_HVM
>>> I assume loading the host value into SPEC_CTRL strictly needs to
>>> happen after the RSB overwrite, or else you could use a VM exit host
>>> load MSR entry to handle MSR_SPEC_CTRL.
>> We could use the host load list, but Intel warned that the lists aren't
>> as efficient as writing it like this, hence why I didn't use them
>> originally when we thought the NMI behaviour was different.  Obviously,
>> we're using them now for correctness reasons, which is more important
>> than avoiding them for (unquantified) perf reasons.
>>
>> I've got some plans for changes to how Xen handles MSR_SPEC_CTRL for its
>> own protection, which I hope will bring a substantial efficiency
>> improvements, and those would require us not to use a host load list here.
> Might be worth mentioning that further work will prevent us from using
> host load list for SPEC_CTRL has a comment here or in the commit
> message.
>
> Using host load lists would also allow us to get rid of
> X86_FEATURE_SC_MSR_HVM.

No it wouldn't.  I need to reuse this for the AMD side, and it also
encodes "admin turned it off via spec-ctrl=".

> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

~Andrew

