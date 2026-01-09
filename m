Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D207ED0B6C2
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 17:58:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1199057.1515808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veFnv-00015w-0t; Fri, 09 Jan 2026 16:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1199057.1515808; Fri, 09 Jan 2026 16:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veFnu-00013T-U7; Fri, 09 Jan 2026 16:57:38 +0000
Received: by outflank-mailman (input) for mailman id 1199057;
 Fri, 09 Jan 2026 16:57:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R5y2=7O=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1veFnt-0000yu-T8
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 16:57:38 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4aed26d2-ed7c-11f0-9ccf-f158ae23cfc8;
 Fri, 09 Jan 2026 17:57:35 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1767977839225707.6571521088505;
 Fri, 9 Jan 2026 08:57:19 -0800 (PST)
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
X-Inumbo-ID: 4aed26d2-ed7c-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1767977843; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NrvQZ+WEsNu3od5jRs8K+Y25SXxrndtw+ZWhW11HsPZrx/s9uwXx7lItsm/ivCsnOMqwf20df60MbQn2HxB+TpGP61/Fyz2gbuT4jYK8qXTRKSDpMtgjx9MavZ3Djm+Khzz7T9UoVeZywRy3xlaJrbENBn4K2R0iCZKIefTigq4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767977843; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FqrQZsDWWC9rsLw4KZMTRKa+EtTjkMhOkcSh5eOTJVM=; 
	b=lV0wtzf6RQ7rQTRyqqb++1fclfwWuk47dkY1CqQErMStK7x7HcpHLgzvJa8JoYbs6TDLSaEYCuatW5Ll1Ft3f23BERG08mOVuT3zZEzDYzcY7a7eKOHTAVfbSj4h9SksP53VddCTmlzB0r0DzgYoEK1haARL7+oaA7ocZSllEw0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767977843;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=FqrQZsDWWC9rsLw4KZMTRKa+EtTjkMhOkcSh5eOTJVM=;
	b=FyC3G/FzSx0tWtm9MY+oteMphH3eYzYbdsr0uavrEtVOy0Qv1D+8zKxn3BPomTd9
	hedci016IDf9zaIbTM3hjNvJMt0hxwZz/0A1sBzF6Ljfe9YQmR3hLDrlO3jheXDRNnY
	jxcFYGoufvkurgRoUDu0Y45yQsQcNWE9mgpr0lXs=
Message-ID: <789062cc-d2e2-4aa5-b70a-384d5fa34a71@apertussolutions.com>
Date: Fri, 9 Jan 2026 11:57:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Drop xenoprofile support
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20260105195717.601500-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20260105195717.601500-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External



On 1/5/26 2:57 PM, Andrew Cooper wrote:
> The most recent xenoprof change was 300ef0cb4fde ("x86: Add Xenoprofile
> support for AMD Family16h") in 2013, despite there being 42 changes worth of
> other cleanup/rearranging since then.
> 
> Oprofile themselves dropped Xen support in commit 0c142c3a096d ("Remove
> opcontrol and the GUI and processor models dependent on it") in 2014, as part
> of releasing version 1.0 and switching over to using operf based on the Linux
> perf_event subsystem.  Linux's version of this patch was merged in commit
> 24880bef417f ("Merge tag 'oprofile-removal-5.12'") in 2021.
> 
> Drop xenoprof and all supporting infrastructure, including the hypercall, the
> XSM hook and flask vectors which lose their only caller, and even shrinks
> struct domain by one pointer which wasn't properly excluded in
> !CONFIG_XENOPROF builds.
> 
> Retain the public xenoprof.h header as it is ABI, but note that the
> functionality is removed.there's also a patch of 
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Despite appearing to be architecture neutral, the internals of Xenoprof were
> entirely x86-specific.  Another curiosity is that only the VMX MSR hooks
> called passive_domain_do_{rd,wr}msr(), and I can't see how this was correct
> for SVM.
> 
> The real reason for finally getting around to this is the number of MISRA
> violations reported by the eclair-x86_64-allcode job that I don't feel like
> fixing.
> ---
>   CHANGELOG.md                            |   3 +
>   docs/misc/xen-command-line.pandoc       |   6 -
>   tools/flask/policy/modules/dom0.te      |   2 -
>   xen/arch/x86/Makefile                   |   1 -
>   xen/arch/x86/cpu/vpmu_amd.c             |   7 -
>   xen/arch/x86/cpu/vpmu_intel.c           |   6 -
>   xen/arch/x86/hvm/svm/entry.S            |   1 -
>   xen/arch/x86/hvm/svm/svm.c              |   2 -
>   xen/arch/x86/hvm/vmx/vmx.c              |   9 -
>   xen/arch/x86/include/asm/xenoprof.h     |  95 ---
>   xen/arch/x86/oprofile/Makefile          |   6 -
>   xen/arch/x86/oprofile/backtrace.c       | 145 ----
>   xen/arch/x86/oprofile/nmi_int.c         | 485 ------------
>   xen/arch/x86/oprofile/op_counter.h      |  41 -
>   xen/arch/x86/oprofile/op_model_athlon.c | 547 -------------
>   xen/arch/x86/oprofile/op_model_p4.c     | 721 -----------------
>   xen/arch/x86/oprofile/op_model_ppro.c   | 348 ---------
>   xen/arch/x86/oprofile/op_x86_model.h    |  58 --
>   xen/arch/x86/oprofile/xenoprof.c        | 106 ---
>   xen/arch/x86/traps.c                    |   4 -
>   xen/common/Kconfig                      |  11 -
>   xen/common/Makefile                     |   1 -
>   xen/common/compat/xenoprof.c            |  42 -
>   xen/common/domain.c                     |   6 -
>   xen/common/xenoprof.c                   | 977 ------------------------
>   xen/include/Makefile                    |   1 -
>   xen/include/hypercall-defs.c            |   6 -
>   xen/include/public/xen.h                |   2 +-
>   xen/include/public/xenoprof.h           |   2 +-
>   xen/include/xen/sched.h                 |   3 -
>   xen/include/xen/xenoprof.h              |  49 --
>   xen/include/xsm/dummy.h                 |   7 -
>   xen/include/xsm/xsm.h                   |   7 -
>   xen/xsm/dummy.c                         |   2 -
>   xen/xsm/flask/hooks.c                   |  35 -
>   xen/xsm/flask/policy/access_vectors     |   4 -
>   36 files changed, 5 insertions(+), 3743 deletions(-)
>   delete mode 100644 xen/arch/x86/include/asm/xenoprof.h
>   delete mode 100644 xen/arch/x86/oprofile/Makefile
>   delete mode 100644 xen/arch/x86/oprofile/backtrace.c
>   delete mode 100644 xen/arch/x86/oprofile/nmi_int.c
>   delete mode 100644 xen/arch/x86/oprofile/op_counter.h
>   delete mode 100644 xen/arch/x86/oprofile/op_model_athlon.c
>   delete mode 100644 xen/arch/x86/oprofile/op_model_p4.c
>   delete mode 100644 xen/arch/x86/oprofile/op_model_ppro.c
>   delete mode 100644 xen/arch/x86/oprofile/op_x86_model.h
>   delete mode 100644 xen/arch/x86/oprofile/xenoprof.c
>   delete mode 100644 xen/common/compat/xenoprof.c
>   delete mode 100644 xen/common/xenoprof.c
>   delete mode 100644 xen/include/xen/xenoprof.h
> 

<snip/>

> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index e801dbcdbaef..b8fd7aeedd9e 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -278,13 +278,6 @@ static XSM_INLINE int cf_check xsm_console_io(
>       return xsm_default_action(XSM_PRIV, d, NULL);
>   }
>   
> -static XSM_INLINE int cf_check xsm_profile(
> -    XSM_DEFAULT_ARG struct domain *d, int op)
> -{
> -    XSM_ASSERT_ACTION(XSM_HOOK);
> -    return xsm_default_action(action, d, NULL);
> -}
> -
>   static XSM_INLINE int cf_check xsm_kexec(XSM_DEFAULT_VOID)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index 2d831d774541..cc32a6c09104 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -101,8 +101,6 @@ struct xsm_ops {
>   
>       int (*console_io)(struct domain *d, int cmd);
>   
> -    int (*profile)(struct domain *d, int op);
> -
>       int (*kexec)(void);
>       int (*schedop_shutdown)(struct domain *d1, struct domain *d2);
>   
> @@ -450,11 +448,6 @@ static inline int xsm_console_io(xsm_default_t def, struct domain *d, int cmd)
>       return alternative_call(xsm_ops.console_io, d, cmd);
>   }
>   
> -static inline int xsm_profile(xsm_default_t def, struct domain *d, int op)
> -{
> -    return alternative_call(xsm_ops.profile, d, op);
> -}
> -
>   static inline int xsm_kexec(xsm_default_t def)
>   {
>       return alternative_call(xsm_ops.kexec);
> diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
> index 96dc82ac2e29..244ef557528b 100644
> --- a/xen/xsm/dummy.c
> +++ b/xen/xsm/dummy.c
> @@ -61,8 +61,6 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
>   
>       .console_io                    = xsm_console_io,
>   
> -    .profile                       = xsm_profile,
> -
>       .kexec                         = xsm_kexec,
>       .schedop_shutdown              = xsm_schedop_shutdown,
>   
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 9f3915617cc8..b250b2706535 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -19,7 +19,6 @@
>   #include <xen/cpumask.h>
>   #include <xen/errno.h>
>   #include <xen/guest_access.h>
> -#include <xen/xenoprof.h>
>   #include <xen/iommu.h>
>   #ifdef CONFIG_HAS_PCI_MSI
>   #include <asm/msi.h>
> @@ -512,38 +511,6 @@ static int cf_check flask_console_io(struct domain *d, int cmd)
>       return domain_has_xen(d, perm);
>   }
>   
> -static int cf_check flask_profile(struct domain *d, int op)
> -{
> -    uint32_t perm;
> -
> -    switch ( op )
> -    {
> -    case XENOPROF_init:
> -    case XENOPROF_enable_virq:
> -    case XENOPROF_disable_virq:
> -    case XENOPROF_get_buffer:
> -        perm = XEN__NONPRIVPROFILE;
> -        break;
> -    case XENOPROF_reset_active_list:
> -    case XENOPROF_reset_passive_list:
> -    case XENOPROF_set_active:
> -    case XENOPROF_set_passive:
> -    case XENOPROF_reserve_counters:
> -    case XENOPROF_counter:
> -    case XENOPROF_setup_events:
> -    case XENOPROF_start:
> -    case XENOPROF_stop:
> -    case XENOPROF_release_counters:
> -    case XENOPROF_shutdown:
> -        perm = XEN__PRIVPROFILE;
> -        break;
> -    default:
> -        return avc_unknown_permission("xenoprof op", op);
> -    }
> -
> -    return domain_has_xen(d, perm);
> -}
> -
>   static int cf_check flask_kexec(void)
>   {
>       return domain_has_xen(current->domain, XEN__KEXEC);
> @@ -1930,8 +1897,6 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
>   
>       .console_io = flask_console_io,
>   
> -    .profile = flask_profile,
> -
>       .kexec = flask_kexec,
>       .schedop_shutdown = flask_schedop_shutdown,
>   
> diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
> index 51a1577a66c7..ce907d50a45e 100644
> --- a/xen/xsm/flask/policy/access_vectors
> +++ b/xen/xsm/flask/policy/access_vectors
> @@ -38,10 +38,6 @@ class xen
>       readapic
>   # PHYSDEVOP_apic_write
>       writeapic
> -# Most XENOPROF_*
> -    privprofile
> -# XENOPROF_{init,enable_virq,disable_virq,get_buffer}
> -    nonprivprofile
>   # kexec hypercall
>       kexec
>   # XENPF_firmware_info, XENPF_efi_runtime_call
> 
> base-commit: c36ddba28e314e9350f4024972023b52e34ec73e


Acked-By: Daniel P. Smith <dpsmith@apertussolutions.com>


