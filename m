Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886451FFA6D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 19:39:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlyUd-0003XK-Uk; Thu, 18 Jun 2020 17:38:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tkY=77=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jlyUc-0003XF-P8
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 17:38:26 +0000
X-Inumbo-ID: 829af196-b18a-11ea-bad5-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 829af196-b18a-11ea-bad5-12813bfff9fa;
 Thu, 18 Jun 2020 17:38:24 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NQRoZSU6P1CbILpFQq2kWXrh4/ktG9XtP9Qh7LIo8+ZmU32IuLDP474E33WUp8GqqYKvB4BJr6
 fO29vQBeAzT0sUjEh+whlMK1O8SayV7GC5txzGTfQ2TBU1idwLhfCF83ALWZAJMEeyzfm8/+zN
 +hzMUndn0cyOJcsD1jY5Ntxi+FA9M3TV1s9MXO6tWsaKidNtZg3tLwgBg4j4Kg8MTwBR7lkX+p
 nsQZ9EmHJ2n05AvgCJubq+LTBmnJgLFgmdpST82ah/fL6QflV8btZbrQ0wt5mubIctkTvX59Cp
 YEQ=
X-SBRS: 2.7
X-MesageID: 20699660
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,252,1589256000"; d="scan'208";a="20699660"
Subject: Re: [PATCH v1 7/7] x86/vmx: switch IPT MSRs on vmentry/vmexit
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <317430261.8766476.1592321051337.JavaMail.zimbra@cert.pl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <16148f3e-6c63-6caa-30f6-50a97889284e@citrix.com>
Date: Thu, 18 Jun 2020 18:38:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <317430261.8766476.1592321051337.JavaMail.zimbra@cert.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Wei Liu <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <jbeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16/06/2020 16:24, Michał Leszczyński wrote:
> Enable IPT when entering the VM and disable it on vmexit.
> Register state is persisted using vCPU ipt_state structure.
>
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>  xen/arch/x86/hvm/vmx/vmx.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 97104c319e..01d9a7b584 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -3698,6 +3698,15 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>      __vmread(GUEST_RSP,    &regs->rsp);
>      __vmread(GUEST_RFLAGS, &regs->rflags);
>  
> +    if ( unlikely(v->arch.hvm.vmx.ipt_state) )
> +    {
> +        wrmsrl(MSR_IA32_RTIT_CTL, 0);
> +        smp_rmb();
> +
> +        rdmsrl(MSR_IA32_RTIT_STATUS, v->arch.hvm.vmx.ipt_state->status);
> +        rdmsrl(MSR_IA32_RTIT_OUTPUT_MASK, v->arch.hvm.vmx.ipt_state->output_mask);
> +    }
> +
>      hvm_invalidate_regs_fields(regs);
>  
>      if ( paging_mode_hap(v->domain) )
> @@ -4497,6 +4506,23 @@ bool vmx_vmenter_helper(const struct cpu_user_regs *regs)
>      }
>  
>   out:
> +    if ( unlikely(curr->arch.hvm.vmx.ipt_state) )
> +    {
> +        wrmsrl(MSR_IA32_RTIT_CTL, 0);
> +
> +        if (curr->arch.hvm.vmx.ipt_state->ctl)
> +        {
> +            wrmsrl(MSR_IA32_RTIT_OUTPUT_BASE, curr->arch.hvm.vmx.ipt_state->output_base);
> +            wrmsrl(MSR_IA32_RTIT_OUTPUT_MASK, curr->arch.hvm.vmx.ipt_state->output_mask);
> +            wrmsrl(MSR_IA32_RTIT_STATUS, curr->arch.hvm.vmx.ipt_state->status);
> +
> +            // MSR_IA32_RTIT_CTL is context-switched manually instead of being
> +            // stored inside VMCS, as of Q2'20 only the most recent processors
> +            // support such field in VMCS
> +            wrmsrl(MSR_IA32_RTIT_CTL, curr->arch.hvm.vmx.ipt_state->ctl);
> +        }
> +    }
> +

Some notes to help with v2.

RTIT_CTL wants managing by MSR load/save list.  See how
vmx_update_guest_efer() manages MSR_EFER for the Gen1 hardware case,
because RTIT_CTL is very similar until we get to IceLake hardware and
have a GUEST_RTIT_CTRL field.

With RTIT_CTL handled by MSR load/save list, we are now certain that
TraceEn is always clear in hypervisor context, so there's no need to
explicitly zero it before playing with other MSRs.


You don't need to save/restore the values in vmentry/exit, because that
is very expensive an unnecessary.  Instead, you can use
vmx_ctxt_switch_{from,to}() which is based on when the vcpu is switched
in/out of context.

Specifically, from your current code, it looks to be safe to leave
RTIT_STATUS/OUTPUT_MASK dirty in hardware across multiple
vmentries/exits while the vcpu is in context.

~Andrew

