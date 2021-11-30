Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D711463F87
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 21:56:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235510.408543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msAAq-0005Sk-2U; Tue, 30 Nov 2021 20:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235510.408543; Tue, 30 Nov 2021 20:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msAAp-0005Pk-VO; Tue, 30 Nov 2021 20:56:23 +0000
Received: by outflank-mailman (input) for mailman id 235510;
 Tue, 30 Nov 2021 20:56:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ICIV=QR=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1msAAp-0005Pe-AM
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 20:56:23 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8a04aa6-521f-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 21:56:22 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:50516)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1msAAi-000joV-fy (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 30 Nov 2021 20:56:16 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id BD5E81FC17;
 Tue, 30 Nov 2021 20:56:15 +0000 (GMT)
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
X-Inumbo-ID: f8a04aa6-521f-11ec-b941-1df2895da90e
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <17bb5295-6207-0bf4-6432-426729a3a288@srcf.net>
Date: Tue, 30 Nov 2021 20:56:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <a0212d75-fc55-89c8-7ae2-c893c187ad82@suse.com>
 <aa19f4cf-6f62-3bf8-7057-7dae1cf28162@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 1/3] x86/vPMU: convert vendor hook invocations to altcall
In-Reply-To: <aa19f4cf-6f62-3bf8-7057-7dae1cf28162@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/11/2021 09:10, Jan Beulich wrote:
> --- a/xen/arch/x86/cpu/vpmu.c
> +++ b/xen/arch/x86/cpu/vpmu.c
> @@ -17,12 +17,12 @@
>   *
>   * Author: Haitao Shan <haitao.shan@intel.com>
>   */
> -#include <xen/sched.h>
> -#include <xen/xenoprof.h>
> -#include <xen/event.h>
> -#include <xen/guest_access.h>
>  #include <xen/cpu.h>
> +#include <xen/err.h>
>  #include <xen/param.h>
> +#include <xen/event.h>
> +#include <xen/guest_access.h>
> +#include <xen/sched.h>
>  #include <asm/regs.h>
>  #include <asm/types.h>
>  #include <asm/msr.h>
> @@ -49,6 +49,7 @@ CHECK_pmu_params;
>  static unsigned int __read_mostly opt_vpmu_enabled;
>  unsigned int __read_mostly vpmu_mode = XENPMU_MODE_OFF;
>  unsigned int __read_mostly vpmu_features = 0;
> +static struct arch_vpmu_ops __read_mostly vpmu_ops;

Thoughts on renaming to just struct vpmu_ops ?  The arch_ really is
quite wrong, and you touch every impacted line in this patch, other than
the main struct name itself.

[edit] there are other misuses of arch_.  Perhaps best to defer this to
a later change.

> @@ -133,14 +133,13 @@ int vpmu_do_msr(unsigned int msr, uint64
>           goto nop;
>  
>      vpmu = vcpu_vpmu(curr);
> -    ops = vpmu->arch_vpmu_ops;
> -    if ( !ops )
> +    if ( !vpmu_is_set(vpmu, VPMU_INITIALIZED) )
>          goto nop;
>  
> -    if ( is_write && ops->do_wrmsr )
> -        ret = ops->do_wrmsr(msr, *msr_content, supported);
> -    else if ( !is_write && ops->do_rdmsr )
> -        ret = ops->do_rdmsr(msr, msr_content);
> +    if ( is_write && vpmu_ops.do_wrmsr )
> +        ret = alternative_call(vpmu_ops.do_wrmsr, msr, *msr_content, supported);
> +    else if ( !is_write && vpmu_ops.do_rdmsr )
> +        ret = alternative_call(vpmu_ops.do_rdmsr, msr, msr_content);

Elsewhere, you've dropped the function pointer NULL checks.  Why not here?

> --- a/xen/include/asm-x86/vpmu.h
> +++ b/xen/include/asm-x86/vpmu.h
> @@ -61,25 +61,25 @@ struct vpmu_struct {
>      u32 hw_lapic_lvtpc;
>      void *context;      /* May be shared with PV guest */
>      void *priv_context; /* hypervisor-only */
> -    const struct arch_vpmu_ops *arch_vpmu_ops;
>      struct xen_pmu_data *xenpmu_data;
>      spinlock_t vpmu_lock;
>  };
>  
>  /* VPMU states */
> -#define VPMU_CONTEXT_ALLOCATED              0x1
> -#define VPMU_CONTEXT_LOADED                 0x2
> -#define VPMU_RUNNING                        0x4
> -#define VPMU_CONTEXT_SAVE                   0x8   /* Force context save */
> -#define VPMU_FROZEN                         0x10  /* Stop counters while VCPU is not running */
> -#define VPMU_PASSIVE_DOMAIN_ALLOCATED       0x20
> +#define VPMU_INITIALIZED                    0x1
> +#define VPMU_CONTEXT_ALLOCATED              0x2
> +#define VPMU_CONTEXT_LOADED                 0x4
> +#define VPMU_RUNNING                        0x8
> +#define VPMU_CONTEXT_SAVE                   0x10  /* Force context save */
> +#define VPMU_FROZEN                         0x20  /* Stop counters while VCPU is not running */
> +#define VPMU_PASSIVE_DOMAIN_ALLOCATED       0x40
>  /* PV(H) guests: VPMU registers are accessed by guest from shared page */
> -#define VPMU_CACHED                         0x40
> -#define VPMU_AVAILABLE                      0x80
> +#define VPMU_CACHED                         0x80
> +#define VPMU_AVAILABLE                      0x100
>  
>  /* Intel-specific VPMU features */
> -#define VPMU_CPU_HAS_DS                     0x100 /* Has Debug Store */
> -#define VPMU_CPU_HAS_BTS                    0x200 /* Has Branch Trace Store */
> +#define VPMU_CPU_HAS_DS                     0x1000 /* Has Debug Store */
> +#define VPMU_CPU_HAS_BTS                    0x2000 /* Has Branch Trace Store */

Seeing as you're shuffling each of these, how about adding some leading
0's for alignment?

~Andrew

