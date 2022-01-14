Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E8348EA60
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 14:09:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257622.442793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8MK6-0002wU-N8; Fri, 14 Jan 2022 13:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257622.442793; Fri, 14 Jan 2022 13:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8MK6-0002ud-Jt; Fri, 14 Jan 2022 13:08:54 +0000
Received: by outflank-mailman (input) for mailman id 257622;
 Fri, 14 Jan 2022 13:08:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vyuu=R6=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n8MK5-0002uX-1j
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 13:08:53 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d9b8a7a-753b-11ec-9bbc-9dff3e4ee8c5;
 Fri, 14 Jan 2022 14:08:51 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:48248)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n8MJw-000AE3-gi (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 14 Jan 2022 13:08:44 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 0093A1FC09;
 Fri, 14 Jan 2022 13:08:43 +0000 (GMT)
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
X-Inumbo-ID: 1d9b8a7a-753b-11ec-9bbc-9dff3e4ee8c5
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <528354d2-9de0-fe12-20e7-b3500a5f6ad9@srcf.net>
Date: Fri, 14 Jan 2022 13:08:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20220113163833.3831-1-andrew.cooper3@citrix.com>
 <20220113163833.3831-4-andrew.cooper3@citrix.com>
 <YeFxqOPqi/DPpugL@Air-de-Roger>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 3/3] x86/spec-ctrl: Fix NMI race condition with VT-x
 MSR_SPEC_CTRL handling
In-Reply-To: <YeFxqOPqi/DPpugL@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/01/2022 12:50, Roger Pau Monné wrote:
> On Thu, Jan 13, 2022 at 04:38:33PM +0000, Andrew Cooper wrote:
>> The logic was based on a mistaken understanding of how NMI blocking on vmexit
>> works.  NMIs are only blocked for EXIT_REASON_NMI, and not for general exits.
>> Therefore, an NMI can in general hit early in the vmx_asm_vmexit_handler path,
>> and the guest's value will be clobbered before it is saved.
>>
>> Switch to using MSR load/save lists.  This causes the guest value to be saved
>> atomically with respect to NMIs/MCEs/etc.
>>
>> First, update vmx_cpuid_policy_changed() to configure the load/save lists at
>> the same time as configuring the intercepts.  This function is always used in
>> remote context, so extend the vmx_vmcs_{enter,exit}() block to cover the whole
>> function, rather than having multiple remote acquisitions of the same VMCS.
>>
>> vmx_add_guest_msr() can fail, but only in ways which are entirely fatal to the
>> guest, so handle failures using domain_crash().  vmx_del_msr() can fail with
>> -ESRCH but we don't matter, and this path will be taken during domain create
>> on a system lacking IBRSB.
>>
>> Second, update vmx_msr_{read,write}_intercept() to use the load/save lists
>> rather than vcpu_msrs, and update the comment to describe the new state
>> location.
>>
>> Finally, adjust the entry/exit asm.  Drop DO_SPEC_CTRL_ENTRY_FROM_HVM
>> entirely, and use a shorter code sequence to simply reload Xen's setting from
>> the top-of-stack block.
>>
>> Because the guest values are loaded/saved atomically, we do not need to use
>> the shadowing logic to cope with late NMIs/etc, so we can omit
>> DO_SPEC_CTRL_EXIT_TO_GUEST entirely and VMRESUME/VMLAUNCH with Xen's value in
>> context.  Furthermore, we can drop the SPEC_CTRL_ENTRY_FROM_PV too, as there's
>> no need to switch back to Xen's context on an early failure.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Jun Nakajima <jun.nakajima@intel.com>
>> CC: Kevin Tian <kevin.tian@intel.com>
>>
>> Needs backporting as far as people can tolerate.
>>
>> If the entry/exit logic were in C, I'd ASSERT() that shadow tracking is off,
>> but this is awkard to arrange in asm.
>> ---
>>  xen/arch/x86/hvm/vmx/entry.S             | 19 ++++++++++-------
>>  xen/arch/x86/hvm/vmx/vmx.c               | 36 +++++++++++++++++++++++++++-----
>>  xen/arch/x86/include/asm/msr.h           | 10 ++++++++-
>>  xen/arch/x86/include/asm/spec_ctrl_asm.h | 32 ++++------------------------
>>  4 files changed, 56 insertions(+), 41 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
>> index 30139ae58e9d..297ed8685126 100644
>> --- a/xen/arch/x86/hvm/vmx/entry.S
>> +++ b/xen/arch/x86/hvm/vmx/entry.S
>> @@ -35,7 +35,14 @@ ENTRY(vmx_asm_vmexit_handler)
>>  
>>          /* SPEC_CTRL_ENTRY_FROM_VMX    Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
>>          ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
>> -        ALTERNATIVE "", DO_SPEC_CTRL_ENTRY_FROM_HVM, X86_FEATURE_SC_MSR_HVM
>> +
>> +        .macro restore_spec_ctrl
>> +            mov    $MSR_SPEC_CTRL, %ecx
>> +            movzbl CPUINFO_xen_spec_ctrl(%rsp), %eax
>> +            xor    %edx, %edx
>> +            wrmsr
>> +        .endm
>> +        ALTERNATIVE "", restore_spec_ctrl, X86_FEATURE_SC_MSR_HVM
> I assume loading the host value into SPEC_CTRL strictly needs to
> happen after the RSB overwrite, or else you could use a VM exit host
> load MSR entry to handle MSR_SPEC_CTRL.

We could use the host load list, but Intel warned that the lists aren't
as efficient as writing it like this, hence why I didn't use them
originally when we thought the NMI behaviour was different.  Obviously,
we're using them now for correctness reasons, which is more important
than avoiding them for (unquantified) perf reasons.

I've got some plans for changes to how Xen handles MSR_SPEC_CTRL for its
own protection, which I hope will bring a substantial efficiency
improvements, and those would require us not to use a host load list here.

> Also I don't understand why SPEC_CTRL shadowing is not cleared before
> loading Xen's value now.

Because we now don't set shadowing it in the first place, because of ...

>
>>          /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
>>  
>>          /* Hardware clears MSR_DEBUGCTL on VMExit.  Reinstate it if debugging Xen. */
>> @@ -83,7 +90,6 @@ UNLIKELY_END(realmode)
>>  
>>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
>>          /* SPEC_CTRL_EXIT_TO_VMX   Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
>> -        ALTERNATIVE "", DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_HVM
>>          ALTERNATIVE "", __stringify(verw CPUINFO_verw_sel(%rsp)), X86_FEATURE_SC_VERW_HVM

... this hunk.

Also, see the note about ASSERT() in the commit message.

I'm happy to try and make this clearer in the commit message if you have
any suggestions.

>>  
>>          mov  VCPU_hvm_guest_cr2(%rbx),%rax
>> @@ -119,12 +125,11 @@ UNLIKELY_END(realmode)
>>          SAVE_ALL
>>  
>>          /*
>> -         * PV variant needed here as no guest code has executed (so
>> -         * MSR_SPEC_CTRL can't have changed value), and NMIs/MCEs are liable
>> -         * to hit (in which case the HVM variant might corrupt things).
>> +         * SPEC_CTRL_ENTRY notes
>> +         *
>> +         * If we end up here, no guest code has executed.  We still have Xen's
>> +         * choice of MSR_SPEC_CTRL in context, and the RSB is safe.
>>           */
>> -        SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo Clob: acd */
>> -        /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
>>  
>>          call vmx_vmentry_failure
>>          jmp  .Lvmx_process_softirqs
>> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
>> index 28ee6393f11e..d7feb5f9c455 100644
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -592,6 +592,7 @@ void vmx_update_exception_bitmap(struct vcpu *v)
>>  static void vmx_cpuid_policy_changed(struct vcpu *v)
>>  {
>>      const struct cpuid_policy *cp = v->domain->arch.cpuid;
>> +    int rc = 0;
>>  
>>      if ( opt_hvm_fep ||
>>           (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
>> @@ -601,17 +602,27 @@ static void vmx_cpuid_policy_changed(struct vcpu *v)
>>  
>>      vmx_vmcs_enter(v);
>>      vmx_update_exception_bitmap(v);
>> -    vmx_vmcs_exit(v);
>>  
>>      /*
>>       * We can safely pass MSR_SPEC_CTRL through to the guest, even if STIBP
>>       * isn't enumerated in hardware, as SPEC_CTRL_STIBP is ignored.
>>       */
>>      if ( cp->feat.ibrsb )
>> +    {
>>          vmx_clear_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
>> +
>> +        rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
>> +        if ( rc )
>> +            goto err;
>> +    }
>>      else
>> +    {
>>          vmx_set_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
>>  
>> +        /* Can only fail with -ESRCH, and we don't care. */
>> +        vmx_del_msr(v, MSR_SPEC_CTRL, VMX_MSR_GUEST);
>> +    }
>> +
>>      /* MSR_PRED_CMD is safe to pass through if the guest knows about it. */
>>      if ( cp->feat.ibrsb || cp->extd.ibpb )
>>          vmx_clear_msr_intercept(v, MSR_PRED_CMD,  VMX_MSR_RW);
>> @@ -623,6 +634,15 @@ static void vmx_cpuid_policy_changed(struct vcpu *v)
>>          vmx_clear_msr_intercept(v, MSR_FLUSH_CMD, VMX_MSR_RW);
>>      else
>>          vmx_set_msr_intercept(v, MSR_FLUSH_CMD, VMX_MSR_RW);
>> +
>> + err:
> Nit: I would name this out, since it's used by both the error and the
> normal exit paths, but that's just my taste.

Ok.

>
>> +    vmx_vmcs_exit(v);
>> +
>> +    if ( rc )
>> +    {
>> +        printk(XENLOG_G_ERR "MSR load/save list error: %d", rc);
>> +        domain_crash(v->domain);
>> +    }
>>  }
>>  
>>  int vmx_guest_x86_mode(struct vcpu *v)
>> @@ -3128,7 +3148,6 @@ static int is_last_branch_msr(u32 ecx)
>>  static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>>  {
>>      struct vcpu *curr = current;
>> -    const struct vcpu_msrs *msrs = curr->arch.msrs;
>>      uint64_t tmp;
>>  
>>      HVM_DBG_LOG(DBG_LEVEL_MSR, "ecx=%#x", msr);
>> @@ -3136,7 +3155,11 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>>      switch ( msr )
>>      {
>>      case MSR_SPEC_CTRL: /* guest_rdmsr() has already performed #GP checks. */
>> -        *msr_content = msrs->spec_ctrl.raw;
>> +        if ( vmx_read_guest_msr(curr, msr, msr_content) )
>> +        {
>> +            ASSERT_UNREACHABLE();
>> +            goto gp_fault;
>> +        }
> AFAICT this is required just for Xen internal callers, as a guest
> attempt to access MSR_SPEC_CTRL will never be trapped, or if trapped it
> would be because !cp->feat.ibrsb and thus won't get here anyway.

We can end up here through FEP, or introspection caring about the MSR,
but most importantly, for moving MSR_SPEC_CTRL on migrate.

What the ASSERT_UNREACHABLE() is saying is that "if the common code
declares not #GP, then MSR_SPEC_CTRL is *definitely* exists in the MSR
list".

~Andrew

