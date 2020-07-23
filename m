Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3612D22AC25
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 12:08:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyY8i-00054S-9Q; Thu, 23 Jul 2020 10:07:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0L1b=BC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jyY8g-00054N-I8
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 10:07:46 +0000
X-Inumbo-ID: 59a5baac-cccc-11ea-a271-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59a5baac-cccc-11ea-a271-12813bfff9fa;
 Thu, 23 Jul 2020 10:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595498865;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bQJiS9xFZUELYjfJnG1ICjedNSkJwEqRKFaBuZQt8Ak=;
 b=A+JIpyKjrqlsK3lo4UtO1jvKoh3tbDID3TqQoOqaYuhvW5SG6WDN26Cq
 FSqmLsss4hVW5bstZhYNSG3e86XrWl9BNuLfW2Rowb+wIFwPPAXQCiXaB
 ryyEr9S7OT1FK8bVqepayZKxlPSVXefQxbREOBpgypg8Doao2bUwKPlm9 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: bZFXF6/WNJHCKqecgfm07qSYmr8C11I5LCeQYAmB2J6ejGf2BxnVqGad3IzBVSMT2qM/6xk2pb
 ZDtL6w5ZgkxccLhh7102R3+00n3DJpxz/5cS69zB4Mifr9LHVimxAlJaYuL2ZbTves9JGhmgfS
 hyY/zIBp7MqmE8LrRrMlRqmGJTRZ3yjVjnF22OwOCh8q7Mq/1ZszDTFU6HCnsfegVmI365A9Ci
 U8r8fC4kSdAqXQxnwYnpxOJWlj1y9sOn9zwWntIiUVEgJ3GagxBo2m1PoklSQqSPyxGf52wFWx
 /GY=
X-SBRS: 2.7
X-MesageID: 23357104
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,386,1589256000"; d="scan'208";a="23357104"
Date: Thu, 23 Jul 2020 12:07:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/vmce: Dispatch vmce_{rd,wr}msr() from
 guest_{rd,wr}msr()
Message-ID: <20200723100727.GA7191@Air-de-Roger>
References: <20200722101809.8389-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200722101809.8389-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 22, 2020 at 11:18:09AM +0100, Andrew Cooper wrote:
> ... rather than from the default clauses of the PV and HVM MSR handlers.
> 
> This means that we no longer take the vmce lock for any unknown MSR, and
> accesses to architectural MCE banks outside of the subset implemented for the
> guest no longer fall further through the unknown MSR path.
> 
> With the vmce calls removed, the hvm alternative_call()'s expression can be
> simplified substantially.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

LGTM, I just have one question below regarding the ranges.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/hvm/hvm.c         | 16 ++--------------
>  xen/arch/x86/msr.c             | 16 ++++++++++++++++
>  xen/arch/x86/pv/emul-priv-op.c | 15 ---------------
>  3 files changed, 18 insertions(+), 29 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 5bb47583b3..a9d1685549 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -3560,13 +3560,7 @@ int hvm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>           break;
>  
>      default:
> -        if ( (ret = vmce_rdmsr(msr, msr_content)) < 0 )
> -            goto gp_fault;
> -        /* If ret == 0 then this is not an MCE MSR, see other MSRs. */
> -        ret = ((ret == 0)
> -               ? alternative_call(hvm_funcs.msr_read_intercept,
> -                                  msr, msr_content)
> -               : X86EMUL_OKAY);
> +        ret = alternative_call(hvm_funcs.msr_read_intercept, msr, msr_content);
>          break;
>      }
>  
> @@ -3696,13 +3690,7 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t msr_content,
>          break;
>  
>      default:
> -        if ( (ret = vmce_wrmsr(msr, msr_content)) < 0 )
> -            goto gp_fault;
> -        /* If ret == 0 then this is not an MCE MSR, see other MSRs. */
> -        ret = ((ret == 0)
> -               ? alternative_call(hvm_funcs.msr_write_intercept,
> -                                  msr, msr_content)
> -               : X86EMUL_OKAY);
> +        ret = alternative_call(hvm_funcs.msr_write_intercept, msr, msr_content);
>          break;
>      }
>  
> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> index 22f921cc71..ca4307e19f 100644
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -227,6 +227,14 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>          *val = msrs->misc_features_enables.raw;
>          break;
>  
> +    case MSR_IA32_MCG_CAP     ... MSR_IA32_MCG_CTL:      /* 0x179 -> 0x17b */
> +    case MSR_IA32_MCx_CTL2(0) ... MSR_IA32_MCx_CTL2(31): /* 0x280 -> 0x29f */
> +    case MSR_IA32_MCx_CTL(0)  ... MSR_IA32_MCx_MISC(31): /* 0x400 -> 0x47f */

Where do you get the ranges from 0 to 31? It seems like the count
field in the CAP register is 8 bits, which could allow for up to 256
banks?

I'm quite sure this would then overlap with other MSRs?

> +    case MSR_IA32_MCG_EXT_CTL:                           /* 0x4d0 */
> +        if ( vmce_rdmsr(msr, val) < 0 )
> +            goto gp_fault;
> +        break;
> +
>      case MSR_X2APIC_FIRST ... MSR_X2APIC_LAST:
>          if ( !is_hvm_domain(d) || v != curr )
>              goto gp_fault;
> @@ -436,6 +444,14 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>          break;
>      }
>  
> +    case MSR_IA32_MCG_CAP     ... MSR_IA32_MCG_CTL:      /* 0x179 -> 0x17b */
> +    case MSR_IA32_MCx_CTL2(0) ... MSR_IA32_MCx_CTL2(31): /* 0x280 -> 0x29f */
> +    case MSR_IA32_MCx_CTL(0)  ... MSR_IA32_MCx_MISC(31): /* 0x400 -> 0x47f */
> +    case MSR_IA32_MCG_EXT_CTL:                           /* 0x4d0 */
> +        if ( vmce_wrmsr(msr, val) < 0 )
> +            goto gp_fault;
> +        break;
> +
>      case MSR_X2APIC_FIRST ... MSR_X2APIC_LAST:
>          if ( !is_hvm_domain(d) || v != curr )
>              goto gp_fault;
> diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
> index 254da2b849..f14552cb4b 100644
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -855,8 +855,6 @@ static int read_msr(unsigned int reg, uint64_t *val,
>  
>      switch ( reg )
>      {
> -        int rc;
> -
>      case MSR_FS_BASE:
>          if ( is_pv_32bit_domain(currd) )
>              break;
> @@ -955,12 +953,6 @@ static int read_msr(unsigned int reg, uint64_t *val,
>          }
>          /* fall through */
>      default:
> -        rc = vmce_rdmsr(reg, val);
> -        if ( rc < 0 )
> -            break;
> -        if ( rc )
> -            return X86EMUL_OKAY;
> -        /* fall through */
>      normal:

We could remove the 'normal' label and just use the default one
instead.

Thanks, Roger.

