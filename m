Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB392EF4AB
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 16:19:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63620.112920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxtXI-0003Iq-Pp; Fri, 08 Jan 2021 15:18:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63620.112920; Fri, 08 Jan 2021 15:18:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxtXI-0003IR-ML; Fri, 08 Jan 2021 15:18:44 +0000
Received: by outflank-mailman (input) for mailman id 63620;
 Fri, 08 Jan 2021 15:18:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tJ2=GL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kxtXH-0003IM-LO
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 15:18:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a52ea1b-c269-4874-9f89-b6bd64503f44;
 Fri, 08 Jan 2021 15:18:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9349EAF37;
 Fri,  8 Jan 2021 15:18:41 +0000 (UTC)
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
X-Inumbo-ID: 0a52ea1b-c269-4874-9f89-b6bd64503f44
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610119121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DgWzJiRQMhVTvPHp1dlotPc5Br4Vm0S8AN35N+U4JUk=;
	b=CKbAIrPDvS/3rX/P6TUF7moZquiMSlvA5gIN+iI9N0kcg/miM2tBAZGoEN9wsAp39ns7N/
	30MVEaZkB+YL4YR+3j7sC0Z/Fgr2TZnlqFMT0dscf8qDP3whyT74V1JPXX7I8xLHeZonXt
	qK6LythAacnGU75egRLVseHHjNzS/7M=
Subject: Re: [PATCH 3/4] x86: Allow non-faulting accesses to non-emulated MSRs
 if policy permits this
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, jun.nakajima@intel.com,
 kevin.tian@intel.com, xen-devel@lists.xenproject.org
References: <1610051698-23675-1-git-send-email-boris.ostrovsky@oracle.com>
 <1610051698-23675-4-git-send-email-boris.ostrovsky@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0e5c0b85-5e3c-676c-e402-fa06e09cf5cb@suse.com>
Date: Fri, 8 Jan 2021 16:18:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1610051698-23675-4-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.01.2021 21:34, Boris Ostrovsky wrote:
> Starting with commit 84e848fd7a16 ("x86/hvm: disallow access to unknown MSRs")
> accesses to unhandled MSRs result in #GP sent to the guest. This caused a
> regression for Solaris who tries to acccess MSR_RAPL_POWER_UNIT and (unlike,

Nit: One c too many.

> for example, Linux) does not catch exceptions when accessing MSRs that
> potentially may not be present.

Just to re-raise the question raised by Andrew already earlier
on: Has Solaris been fixed in the meantime, or is this at least
firmly planned to happen?

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -1965,8 +1965,8 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>          break;
>  
>      default:
> -        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
> -        goto gpf;
> +        if ( guest_unhandled_msr(v, msr, msr_content, false) )
> +            goto gpf;
>      }
>  
>      HVM_DBG_LOG(DBG_LEVEL_MSR, "returns: ecx=%x, msr_value=%"PRIx64,
> @@ -2151,10 +2151,8 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>          break;
>  
>      default:
> -        gdprintk(XENLOG_WARNING,
> -                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
> -                 msr, msr_content);
> -        goto gpf;
> +        if ( guest_unhandled_msr(v, msr, &msr_content, true) )
> +            goto gpf;
>      }
>  
>      return X86EMUL_OKAY;
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -3017,8 +3017,8 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>              break;
>          }
>  
> -        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
> -        goto gp_fault;
> +        if ( guest_unhandled_msr(curr, msr, msr_content, false) )
> +            goto gp_fault;
>      }
>  
>  done:
> @@ -3319,10 +3319,8 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>               is_last_branch_msr(msr) )
>              break;
>  
> -        gdprintk(XENLOG_WARNING,
> -                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
> -                 msr, msr_content);
> -        goto gp_fault;
> +        if ( guest_unhandled_msr(v, msr, &msr_content, true) )
> +            goto gp_fault;
>      }
>  
>      return X86EMUL_OKAY;

These functions also get used from the insn emulator, when it
needs to fetch an MSR value (not necessarily in the context of
emulating RDMSR or WRMSR). I wonder whether applying this
behavior in that case is actually correct. It would only be if
we would settle on it being a requirement that any such MSRs
have to have emulation present in one of the handlers.

> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -164,6 +164,26 @@ int init_vcpu_msr_policy(struct vcpu *v)
>      return 0;
>  }
>  
> +/* Returns true if policy requires #GP to the guest. */
> +bool guest_unhandled_msr(const struct vcpu *v, uint32_t msr,
> +                         uint64_t *val, bool is_write)
> +{
> +    const struct msr_policy *mp = v->domain->arch.msr;
> +
> +    if ( unlikely(mp->ignore_msrs != MSR_UNHANDLED_NEVER) && !is_write )
> +        *val = 0;

I'd recommend to drop the left side of the && - there's no harm
in storing zero in this extra case.

> +    if ( likely(mp->ignore_msrs != MSR_UNHANDLED_SILENT) ) {

Nit: Brace on its own line please.

> --- a/xen/include/asm-x86/msr.h
> +++ b/xen/include/asm-x86/msr.h
> @@ -345,5 +345,6 @@ int init_vcpu_msr_policy(struct vcpu *v);
>   */
>  int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val);
>  int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val);
> -
> +bool guest_unhandled_msr(const struct vcpu *v, uint32_t msr,
> +                         uint64_t *val, bool is_write);
>  #endif /* __ASM_MSR_H */

Please retain the blank line that was there.

Jan

