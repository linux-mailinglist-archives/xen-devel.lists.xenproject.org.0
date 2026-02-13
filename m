Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eD+aJqHVjmlFFQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 08:41:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 019F3133AA3
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 08:41:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230253.1535765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqnmm-0004vC-8r; Fri, 13 Feb 2026 07:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230253.1535765; Fri, 13 Feb 2026 07:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqnmm-0004sX-5c; Fri, 13 Feb 2026 07:40:20 +0000
Received: by outflank-mailman (input) for mailman id 1230253;
 Fri, 13 Feb 2026 07:40:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g1sG=AR=sony.com=shashank.mahadasyam@srs-se1.protection.inumbo.net>)
 id 1vqnmk-0004sR-OJ
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 07:40:18 +0000
Received: from jpms-ob02.noc.sony.co.jp (jpms-ob02.noc.sony.co.jp
 [2001:cf8:ace:41::5]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 368f5d6e-08af-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 08:40:09 +0100 (CET)
Received: from unknown (HELO jpmta-ob02.noc.sony.co.jp)
 ([IPv6:2001:cf8:0:6e7::7])
 by jpms-ob02.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 16:40:03 +0900
Received: from unknown (HELO JPC00244420)
 ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
 by jpmta-ob02.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 16:40:03 +0900
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
X-Inumbo-ID: 368f5d6e-08af-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1770968409; x=1802504409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pzfx5lLFbK5d4r8P3rsCdaD/raTj07tQWAB1fg3LiRQ=;
  b=m8oBftKTNKpoVopC53ILft1JMewZ008YyIHcBkiQr5WLrs0RLwllFRUw
   jXS847f/RSdw/jvD4L5xqmewkpP6riUiqtamPr2FOrvFBgUSU7vrR3YyL
   kmdMSDFsi6ztKlIdL34CkJ3203LqyiorcGGSeIITFyycoGH+flS4T2RfD
   DoJkpWZBpXLy2lKbydxWpGhNn1QXZP5mgaZWxAqFHq5i9jE8ORboeepIs
   7rTDzFKbdarphlrc1ODP1fd1AeW04aDRiwx+4V3WvZw8Os5RxKyWoQQHD
   /xoGycue3IM/9PZWY8i/C5095o8RFRRXEhM4klKD6qEjr47GpMrVWj5DJ
   Q==;
X-IronPort-AV: E=Sophos;i="6.21,288,1763391600"; 
   d="scan'208";a="581327796"
Date: Fri, 13 Feb 2026 16:39:59 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Suresh Siddha <suresh.b.siddha@intel.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
	jailhouse-dev@googlegroups.com, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org, Rahul Bukte <rahul.bukte@sony.com>,
	Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>, Sohil Mehta <sohil.mehta@intel.com>
Subject: Re: [PATCH 3/3] x86/virt: rename x2apic_available to
 x2apic_without_ir_available
Message-ID: <aY7VTwfJDREcrwJy@JPC00244420>
References: <20260202-x2apic-fix-v1-0-71c8f488a88b@sony.com>
 <20260202-x2apic-fix-v1-3-71c8f488a88b@sony.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-x2apic-fix-v1-3-71c8f488a88b@sony.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[sony.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sony.com:s=s1jp];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[31];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[shashank.mahadasyam@sony.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:suresh.b.siddha@intel.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:jan.kiszka@siemens.com,m:pbonzini@redhat.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:mingo@elte.hu,m:linux-kernel@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:jailhouse-dev@googlegroups.com,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:rahul.bukte@sony.com,m:daniel.palmer@sony.com,m:tim.bird@sony.com,m:sohil.mehta@intel.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sony.com:email,sony.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shashank.mahadasyam@sony.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sony.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 019F3133AA3
X-Rspamd-Action: no action

Hi x86 and virt folks,

I'd like some feedback on this patch. I realise that just updating the
name to x2apic_without_ir_available() with no indication in the code
suggesting that the hypervisor implementations may not be answering the
question "is x2apic availalble without IR?" is bad.

I suppose the options are:

1. Check seven hypervisor's x2apic_available() implementation to see if
the "x2apic_without_ir_available" semantic matches, and then do the
renaming

	Problem is, I don't know enough about the hypervisors to check
	the implementations. Some help from the virt folks would be
	great!

2. Add TODOs on the hypervisor implementations, hoping they'll be
audited in the future

	There's a chance the TODOs will just sit there rotting. It's
	ugly, even I don't like it

So how do we proceed?

On Mon, Feb 02, 2026 at 06:51:04PM +0900, Shashank Balaji wrote:
> No functional change.
> 
> x86_init.hyper.x2apic_available is used only in try_to_enable_x2apic to check if
> x2apic needs to be disabled if interrupt remapping support isn't present. But
> the name x2apic_available doesn't reflect that usage.
> 
> This is what x2apic_available is set to for various hypervisors:
> 
> 	acrn		boot_cpu_has(X86_FEATURE_X2APIC)
> 	mshyperv	boot_cpu_has(X86_FEATURE_X2APIC)
> 	xen		boot_cpu_has(X86_FEATURE_X2APIC) or false
> 	vmware		vmware_legacy_x2apic_available
> 	kvm		kvm_cpuid_base() != 0
> 	jailhouse	x2apic_enabled()
> 	bhyve		true
> 	default		false
> 
> Bare metal and vmware correctly check if x2apic is available without interrupt
> remapping. The rest of them check if x2apic is enabled/supported, and kvm just
> checks if the kernel is running on kvm. The other hypervisors may have to have
> their checks audited.
> 
> Also fix the backwards pr_info message printed on disabling x2apic because of
> lack of irq remapping support.
> 
> Compile tested with all the hypervisor guest support enabled.
> 
> Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> ---
>  arch/x86/include/asm/x86_init.h |  4 ++--
>  arch/x86/kernel/apic/apic.c     |  4 ++--
>  arch/x86/kernel/cpu/acrn.c      |  2 +-
>  arch/x86/kernel/cpu/bhyve.c     |  2 +-
>  arch/x86/kernel/cpu/mshyperv.c  |  2 +-
>  arch/x86/kernel/cpu/vmware.c    |  2 +-
>  arch/x86/kernel/jailhouse.c     |  2 +-
>  arch/x86/kernel/kvm.c           |  2 +-
>  arch/x86/kernel/x86_init.c      | 12 ++++++------
>  arch/x86/xen/enlighten_hvm.c    |  4 ++--
>  10 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
> index 6c8a6ead84f6..b270d9eed755 100644
> --- a/arch/x86/include/asm/x86_init.h
> +++ b/arch/x86/include/asm/x86_init.h
> @@ -116,7 +116,7 @@ struct x86_init_pci {
>   * struct x86_hyper_init - x86 hypervisor init functions
>   * @init_platform:		platform setup
>   * @guest_late_init:		guest late init
> - * @x2apic_available:		X2APIC detection
> + * @x2apic_without_ir_available: is x2apic available without irq remap?
>   * @msi_ext_dest_id:		MSI supports 15-bit APIC IDs
>   * @init_mem_mapping:		setup early mappings during init_mem_mapping()
>   * @init_after_bootmem:		guest init after boot allocator is finished
> @@ -124,7 +124,7 @@ struct x86_init_pci {
>  struct x86_hyper_init {
>  	void (*init_platform)(void);
>  	void (*guest_late_init)(void);
> -	bool (*x2apic_available)(void);
> +	bool (*x2apic_without_ir_available)(void);
>  	bool (*msi_ext_dest_id)(void);
>  	void (*init_mem_mapping)(void);
>  	void (*init_after_bootmem)(void);
> diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
> index cc64d61f82cf..8820b631f8a2 100644
> --- a/arch/x86/kernel/apic/apic.c
> +++ b/arch/x86/kernel/apic/apic.c
> @@ -1836,8 +1836,8 @@ static __init void try_to_enable_x2apic(int remap_mode)
>  		 * Using X2APIC without IR is not architecturally supported
>  		 * on bare metal but may be supported in guests.
>  		 */
> -		if (!x86_init.hyper.x2apic_available()) {
> -			pr_info("x2apic: IRQ remapping doesn't support X2APIC mode\n");
> +		if (!x86_init.hyper.x2apic_without_ir_available()) {
> +			pr_info("x2apic: Not supported without IRQ remapping\n");
>  			x2apic_disable();
>  			return;
>  		}
> diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
> index 2c5b51aad91a..9204b98d4786 100644
> --- a/arch/x86/kernel/cpu/acrn.c
> +++ b/arch/x86/kernel/cpu/acrn.c
> @@ -77,5 +77,5 @@ const __initconst struct hypervisor_x86 x86_hyper_acrn = {
>  	.detect                 = acrn_detect,
>  	.type			= X86_HYPER_ACRN,
>  	.init.init_platform     = acrn_init_platform,
> -	.init.x2apic_available  = acrn_x2apic_available,
> +	.init.x2apic_without_ir_available = acrn_x2apic_available,
>  };
> diff --git a/arch/x86/kernel/cpu/bhyve.c b/arch/x86/kernel/cpu/bhyve.c
> index f1a8ca3dd1ed..91a90a7459ce 100644
> --- a/arch/x86/kernel/cpu/bhyve.c
> +++ b/arch/x86/kernel/cpu/bhyve.c
> @@ -61,6 +61,6 @@ const struct hypervisor_x86 x86_hyper_bhyve __refconst = {
>  	.name			= "Bhyve",
>  	.detect			= bhyve_detect,
>  	.init.init_platform	= x86_init_noop,
> -	.init.x2apic_available	= bhyve_x2apic_available,
> +	.init.x2apic_without_ir_available = bhyve_x2apic_available,
>  	.init.msi_ext_dest_id	= bhyve_ext_dest_id,
>  };
> diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
> index 579fb2c64cfd..61458855094a 100644
> --- a/arch/x86/kernel/cpu/mshyperv.c
> +++ b/arch/x86/kernel/cpu/mshyperv.c
> @@ -760,7 +760,7 @@ const __initconst struct hypervisor_x86 x86_hyper_ms_hyperv = {
>  	.name			= "Microsoft Hyper-V",
>  	.detect			= ms_hyperv_platform,
>  	.type			= X86_HYPER_MS_HYPERV,
> -	.init.x2apic_available	= ms_hyperv_x2apic_available,
> +	.init.x2apic_without_ir_available = ms_hyperv_x2apic_available,
>  	.init.msi_ext_dest_id	= ms_hyperv_msi_ext_dest_id,
>  	.init.init_platform	= ms_hyperv_init_platform,
>  	.init.guest_late_init	= ms_hyperv_late_init,
> diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
> index cb3f900c46fc..46d325818797 100644
> --- a/arch/x86/kernel/cpu/vmware.c
> +++ b/arch/x86/kernel/cpu/vmware.c
> @@ -585,7 +585,7 @@ const __initconst struct hypervisor_x86 x86_hyper_vmware = {
>  	.detect				= vmware_platform,
>  	.type				= X86_HYPER_VMWARE,
>  	.init.init_platform		= vmware_platform_setup,
> -	.init.x2apic_available		= vmware_legacy_x2apic_available,
> +	.init.x2apic_without_ir_available = vmware_legacy_x2apic_available,
>  #ifdef CONFIG_AMD_MEM_ENCRYPT
>  	.runtime.sev_es_hcall_prepare	= vmware_sev_es_hcall_prepare,
>  	.runtime.sev_es_hcall_finish	= vmware_sev_es_hcall_finish,
> diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
> index 9e9a591a5fec..84a0bbe15989 100644
> --- a/arch/x86/kernel/jailhouse.c
> +++ b/arch/x86/kernel/jailhouse.c
> @@ -291,6 +291,6 @@ const struct hypervisor_x86 x86_hyper_jailhouse __refconst = {
>  	.name			= "Jailhouse",
>  	.detect			= jailhouse_detect,
>  	.init.init_platform	= jailhouse_init_platform,
> -	.init.x2apic_available	= jailhouse_x2apic_available,
> +	.init.x2apic_without_ir_available = jailhouse_x2apic_available,
>  	.ignore_nopv		= true,
>  };
> diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
> index 37dc8465e0f5..709eba87d58e 100644
> --- a/arch/x86/kernel/kvm.c
> +++ b/arch/x86/kernel/kvm.c
> @@ -1042,7 +1042,7 @@ const __initconst struct hypervisor_x86 x86_hyper_kvm = {
>  	.detect				= kvm_detect,
>  	.type				= X86_HYPER_KVM,
>  	.init.guest_late_init		= kvm_guest_init,
> -	.init.x2apic_available		= kvm_para_available,
> +	.init.x2apic_without_ir_available = kvm_para_available,
>  	.init.msi_ext_dest_id		= kvm_msi_ext_dest_id,
>  	.init.init_platform		= kvm_init_platform,
>  #if defined(CONFIG_AMD_MEM_ENCRYPT)
> diff --git a/arch/x86/kernel/x86_init.c b/arch/x86/kernel/x86_init.c
> index ebefb77c37bb..9ddf8c901ac6 100644
> --- a/arch/x86/kernel/x86_init.c
> +++ b/arch/x86/kernel/x86_init.c
> @@ -112,12 +112,12 @@ struct x86_init_ops x86_init __initdata = {
>  	},
>  
>  	.hyper = {
> -		.init_platform		= x86_init_noop,
> -		.guest_late_init	= x86_init_noop,
> -		.x2apic_available	= bool_x86_init_noop,
> -		.msi_ext_dest_id	= bool_x86_init_noop,
> -		.init_mem_mapping	= x86_init_noop,
> -		.init_after_bootmem	= x86_init_noop,
> +		.init_platform			= x86_init_noop,
> +		.guest_late_init		= x86_init_noop,
> +		.x2apic_without_ir_available	= bool_x86_init_noop,
> +		.msi_ext_dest_id		= bool_x86_init_noop,
> +		.init_mem_mapping		= x86_init_noop,
> +		.init_after_bootmem		= x86_init_noop,
>  	},
>  
>  	.acpi = {
> diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
> index fe57ff85d004..42f3d21f313d 100644
> --- a/arch/x86/xen/enlighten_hvm.c
> +++ b/arch/x86/xen/enlighten_hvm.c
> @@ -311,7 +311,7 @@ static uint32_t __init xen_platform_hvm(void)
>  		 * detect PVH and panic there.
>  		 */
>  		h->init_platform = x86_init_noop;
> -		h->x2apic_available = bool_x86_init_noop;
> +		h->x2apic_without_ir_available = bool_x86_init_noop;
>  		h->init_mem_mapping = x86_init_noop;
>  		h->init_after_bootmem = x86_init_noop;
>  		h->guest_late_init = xen_hvm_guest_late_init;
> @@ -325,7 +325,7 @@ struct hypervisor_x86 x86_hyper_xen_hvm __initdata = {
>  	.detect                 = xen_platform_hvm,
>  	.type			= X86_HYPER_XEN_HVM,
>  	.init.init_platform     = xen_hvm_guest_init,
> -	.init.x2apic_available  = xen_x2apic_available,
> +	.init.x2apic_without_ir_available = xen_x2apic_available,
>  	.init.init_mem_mapping	= xen_hvm_init_mem_mapping,
>  	.init.guest_late_init	= xen_hvm_guest_late_init,
>  	.init.msi_ext_dest_id   = msi_ext_dest_id,
> 
> -- 
> 2.43.0
> 

