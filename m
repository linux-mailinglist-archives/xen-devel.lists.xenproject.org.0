Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66175C51D11
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 12:02:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159807.1488111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8bs-0005IX-Dn; Wed, 12 Nov 2025 11:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159807.1488111; Wed, 12 Nov 2025 11:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8bs-0005Gh-At; Wed, 12 Nov 2025 11:01:56 +0000
Received: by outflank-mailman (input) for mailman id 1159807;
 Wed, 12 Nov 2025 11:01:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K372=5U=bounce.vates.tech=bounce-md_30504962.691466e9.v1-1fd812512d564af1beb27716acce14a2@srs-se1.protection.inumbo.net>)
 id 1vJ8Sm-0000Wh-0L
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 10:52:32 +0000
Received: from mail136-17.atl41.mandrillapp.com
 (mail136-17.atl41.mandrillapp.com [198.2.136.17])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acca7913-bfb5-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 11:52:26 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4d60bY13JHzPm0bYq
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 10:52:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1fd812512d564af1beb27716acce14a2; Wed, 12 Nov 2025 10:52:25 +0000
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
X-Inumbo-ID: acca7913-bfb5-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1762944745; x=1763214745;
	bh=86aQGi/7GaUPH3vqhUSGrPmTwZia3vX6HeEK4SO4NAs=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=aZJVM2zfz6tLfkQtLB8W5lFwm4X3VObWKiH6VrAAFQJ7B6AQ8+CzHkZpViDKy4VJ/
	 sKWDN5iUeVPDFKbx44KuqY9TdtD16bDlKhMdKPDBpYldBe7DR2VJkti7fwNwCfqYlQ
	 juzGlIv9fY434WqzPetarbj7Z+fvgO0mSW5iHVLBXxAOzb0FuaOboF8kZiJjn8d7sh
	 38AQicU1lBkmFjtQtqtxwPwVVbs+INN+xXlmPZK4w22XQbD/xy1rK9L0wH9GuRaL++
	 8Aw35lbNxAQRYQ5CSk4yua+940v2IZTzgNnBaPAiXspXZoIIGaJY0danrFSdHc8g3K
	 bBUEhDrPF5bnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1762944745; x=1763205245; i=teddy.astie@vates.tech;
	bh=86aQGi/7GaUPH3vqhUSGrPmTwZia3vX6HeEK4SO4NAs=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gghIszI8ppzkHpmXXAoIM7qBapCg6fzPlPfORzROVnF1CKiuw3Z44G7pcgRxCTufZ
	 9DeQ3mdK6WG1dxJrIKiGBnQJ0wPZsttfclHD5QWWzm5U/YSiFqKWPe80EiOV26kW3S
	 Wu35s0+izpfdSZpBu/0wODsXIEDHc2Lv/agwLCfXTyMZghHaVt4DvzuGG0ZXQJ8W8B
	 GQRQfnhLk0CFQFL/3betC2zpl4l8HQ0qIN1lZxyfn9w6ocBrTwM+h5zINARoOGHPzT
	 n4RDZ5lUqrcBLJKh95uAqKmxh4Cpr6cdFOIWFcw1qLr4eNs22FGBsIHTopxPJvDVjV
	 5ZLxjUE8p90Mg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RESEND=20PATCH=20v2=201/3]=20x86/hvm:=20move=20hvm=5Fshadow=5Fhandle=5Fcd()=20to=20vmx=20code?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1762944743850
Message-Id: <93dd7056-234d-4d3d-ae1f-d73f33a35f1a@vates.tech>
To: "Grygorii Strashko" <grygorii_strashko@epam.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>
References: <20251111200958.3576341-1-grygorii_strashko@epam.com> <20251111200958.3576341-2-grygorii_strashko@epam.com>
In-Reply-To: <20251111200958.3576341-2-grygorii_strashko@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1fd812512d564af1beb27716acce14a2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251112:md
Date: Wed, 12 Nov 2025 10:52:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 11/11/2025 =C3=A0 21:11, Grygorii Strashko a =C3=A9crit=C2=A0:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Functions:
>   hvm_shadow_handle_cd()
>   hvm_set_uc_mode()
>   domain_exit_uc_mode()
> are used only by Intel VMX code, so move them to VMX code.
> 
> While here:
> - minor format change in domain_exit_uc_mode()
> - s/(0/1)/(false/true) for bool types
> - use "struct domain *" as parameter in hvm_set_uc_mode()
> - use "struct domain *d" as local var in hvm_shadow_handle_cd()
> 
> No functional changes.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> changes in v2:
> - use "struct domain *" as parameter in hvm_set_uc_mode()
> - use "struct domain *d" as local var in hvm_shadow_handle_cd()
> - move code before vmx_handle_cd()
> 
>   xen/arch/x86/hvm/hvm.c                 | 58 ------------------------
>   xen/arch/x86/hvm/vmx/vmx.c             | 61 ++++++++++++++++++++++++++
>   xen/arch/x86/include/asm/hvm/support.h |  2 -
>   3 files changed, 61 insertions(+), 60 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index da3cde1ff0e6..9caca93e5f56 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -2168,30 +2168,6 @@ int hvm_set_efer(uint64_t value)
>       return X86EMUL_OKAY;
>   }
>   
> -/* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fi=
ll. */
> -static bool domain_exit_uc_mode(struct vcpu *v)
> -{
> -    struct domain *d =3D v->domain;
> -    struct vcpu *vs;
> -
> -    for_each_vcpu ( d, vs )
> -    {
> -        if ( (vs =3D=3D v) || !vs->is_initialised )
> -            continue;
> -        if ( (vs->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) ||
> -             mtrr_pat_not_equal(vs, v) )
> -            return 0;
> -    }
> -
> -    return 1;
> -}
> -
> -static void hvm_set_uc_mode(struct vcpu *v, bool is_in_uc_mode)
> -{
> -    v->domain->arch.hvm.is_in_uc_mode =3D is_in_uc_mode;
> -    shadow_blow_tables_per_domain(v->domain);
> -}
> -
>   int hvm_mov_to_cr(unsigned int cr, unsigned int gpr)
>   {
>       struct vcpu *curr =3D current;
> @@ -2273,40 +2249,6 @@ int hvm_mov_from_cr(unsigned int cr, unsigned int =
gpr)
>       return X86EMUL_UNHANDLEABLE;
>   }
>   
> -void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value)
> -{
> -    if ( value & X86_CR0_CD )
> -    {
> -        /* Entering no fill cache mode. */
> -        spin_lock(&v->domain->arch.hvm.uc_lock);
> -        v->arch.hvm.cache_mode =3D NO_FILL_CACHE_MODE;
> -
> -        if ( !v->domain->arch.hvm.is_in_uc_mode )
> -        {
> -            domain_pause_nosync(v->domain);
> -
> -            /* Flush physical caches. */
> -            flush_all(FLUSH_CACHE_EVICT);
> -            hvm_set_uc_mode(v, 1);
> -
> -            domain_unpause(v->domain);
> -        }
> -        spin_unlock(&v->domain->arch.hvm.uc_lock);
> -    }
> -    else if ( !(value & X86_CR0_CD) &&
> -              (v->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
> -    {
> -        /* Exit from no fill cache mode. */
> -        spin_lock(&v->domain->arch.hvm.uc_lock);
> -        v->arch.hvm.cache_mode =3D NORMAL_CACHE_MODE;
> -
> -        if ( domain_exit_uc_mode(v) )
> -            hvm_set_uc_mode(v, 0);
> -
> -        spin_unlock(&v->domain->arch.hvm.uc_lock);
> -    }
> -}
> -
>   static void hvm_update_cr(struct vcpu *v, unsigned int cr, unsigned lon=
g value)
>   {
>       v->arch.hvm.guest_cr[cr] =3D value;
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 6f2cc635e582..d7efd0a73add 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -44,6 +44,7 @@
>   #include <asm/processor.h>
>   #include <asm/prot-key.h>
>   #include <asm/regs.h>
> +#include <asm/shadow.h>
>   #include <asm/spec_ctrl.h>
>   #include <asm/stubs.h>
>   #include <asm/x86_emulate.h>
> @@ -1451,6 +1452,66 @@ static int cf_check vmx_get_guest_pat(struct vcpu =
*v, u64 *gpat)
>       return 1;
>   }
>   
> +/* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fi=
ll. */
> +static bool domain_exit_uc_mode(struct vcpu *v)
> +{
> +    struct domain *d =3D v->domain;
> +    struct vcpu *vs;
> +
> +    for_each_vcpu(d, vs)
> +    {
> +        if ( (vs =3D=3D v) || !vs->is_initialised )
> +            continue;
> +        if ( (vs->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) ||
> +             mtrr_pat_not_equal(vs, v) )
> +            return false;
> +    }
> +
> +    return true;
> +}
> +
> +static void hvm_set_uc_mode(struct domain *d, bool is_in_uc_mode)
> +{
> +    d->arch.hvm.is_in_uc_mode =3D is_in_uc_mode;
> +    shadow_blow_tables_per_domain(d);
> +}
> +
> +static void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value)
> +{
> +    struct domain *d =3D v->domain;
> +
> +    if ( value & X86_CR0_CD )
> +    {
> +        /* Entering no fill cache mode. */
> +        spin_lock(&d->arch.hvm.uc_lock);
> +        v->arch.hvm.cache_mode =3D NO_FILL_CACHE_MODE;
> +
> +        if ( !d->arch.hvm.is_in_uc_mode )
> +        {
> +            domain_pause_nosync(d);
> +
> +            /* Flush physical caches. */
> +            flush_all(FLUSH_CACHE_EVICT);
> +            hvm_set_uc_mode(d, true);
> +
> +            domain_unpause(d);
> +        }
> +        spin_unlock(&d->arch.hvm.uc_lock);
> +    }
> +    else if ( !(value & X86_CR0_CD) &&
> +              (v->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) )
> +    {
> +        /* Exit from no fill cache mode. */
> +        spin_lock(&d->arch.hvm.uc_lock);
> +        v->arch.hvm.cache_mode =3D NORMAL_CACHE_MODE;
> +
> +        if ( domain_exit_uc_mode(v) )
> +            hvm_set_uc_mode(d, false);
> +
> +        spin_unlock(&d->arch.hvm.uc_lock);
> +    }
> +}
> +

Given that these functions are now static in vmx.c, I would give them 
the vmx_* prefix instead of hvm_* (which could be confusing as it sounds 
like something that is in general code).

>   static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
>   {
>       if ( !paging_mode_hap(v->domain) )
> diff --git a/xen/arch/x86/include/asm/hvm/support.h b/xen/arch/x86/includ=
e/asm/hvm/support.h
> index 2a7ba36af06f..9e9fa6295567 100644
> --- a/xen/arch/x86/include/asm/hvm/support.h
> +++ b/xen/arch/x86/include/asm/hvm/support.h
> @@ -119,8 +119,6 @@ void hvm_rdtsc_intercept(struct cpu_user_regs *regs);
>   
>   int __must_check hvm_handle_xsetbv(u32 index, u64 new_bv);
>   
> -void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value);
> -
>   /*
>    * These functions all return X86EMUL return codes.  For hvm_set_*(), t=
he
>    * caller is responsible for injecting #GP[0] if X86EMUL_EXCEPTION is

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



