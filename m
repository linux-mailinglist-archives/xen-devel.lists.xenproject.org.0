Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 190D3C09E2B
	for <lists+xen-devel@lfdr.de>; Sat, 25 Oct 2025 20:11:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1151199.1481887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCiid-0006La-2R; Sat, 25 Oct 2025 18:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151199.1481887; Sat, 25 Oct 2025 18:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCiic-0006Jw-Vw; Sat, 25 Oct 2025 18:10:22 +0000
Received: by outflank-mailman (input) for mailman id 1151199;
 Sat, 25 Oct 2025 18:10:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vYYd=5C=bounce.vates.tech=bounce-md_30504962.68fd1285.v1-befac1088e9f4280b9041a139ae034aa@srs-se1.protection.inumbo.net>)
 id 1vCiib-0006Jq-Hp
 for xen-devel@lists.xenproject.org; Sat, 25 Oct 2025 18:10:21 +0000
Received: from mail187-33.suw11.mandrillapp.com
 (mail187-33.suw11.mandrillapp.com [198.2.187.33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da768a5a-b1cd-11f0-980a-7dc792cee155;
 Sat, 25 Oct 2025 20:10:15 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-33.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4cv7911NzwzBsThR4
 for <xen-devel@lists.xenproject.org>; Sat, 25 Oct 2025 18:10:13 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 befac1088e9f4280b9041a139ae034aa; Sat, 25 Oct 2025 18:10:13 +0000
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
X-Inumbo-ID: da768a5a-b1cd-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761415813; x=1761685813;
	bh=UROwWJJex9hr+E0Pstr7k3l3mLjCNT/PysfNOKnSM/o=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=sic4UEW6pqn2oZyWcEvjAvH0tJdNDyUsQ7jSccXVHcCZqxtfwEXBMYlR4dYCTw1cQ
	 sc3MnQiIoLPY07jKFqyEB7gZ+j56xj+KYGYtjB6FRTeHT5Miio+YV2Hkk+EtTH9JrC
	 8hgDBy25EAMEK57jGwrL/u4LTkykxtNzZJ/i87v/zLYp/vzd9Jla2h6EZwc46E7gJy
	 buX+2MqbozWOBa8ZlkDypuDdTDb7YBj1d1s3IwNlyz3Vrh3HDvyv0uhlWHliHZebHz
	 dEhjjDfToxZqdkaQNSHrG/C/PoBWi043nI5HXhEbpVPIUidTiqq9gj0T/xtQ93hawd
	 YeLfIAQzUYxXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761415813; x=1761676313; i=teddy.astie@vates.tech;
	bh=UROwWJJex9hr+E0Pstr7k3l3mLjCNT/PysfNOKnSM/o=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=MHEo7oRGa3g9XVemyqbZi4ur2SvibGsf41Z+XRcC+r9QGlbU9+BITJp/QrNcc9iic
	 WsIZ0VYcZN/pEE7l2MK5iktjoSLnZXBmpCsQjPtoBpZRE9bIbtgg7KPdWWB5WTORkl
	 Nw6k/JyMagSLZ89A+dUWeBsKLSyrpRJDAIndMe3V7+4WgN7tWs1vVtPQD5ZB8G95yj
	 Wd3vcVAUTOYb3nDZwHStbgKK23upLTokyqWf9326T+DUAkO63gwsHFWztKJlbXSQTI
	 EEYf3uH3NptsgGUH8vt8KrY7tT1sN+38OPduHorUqsengEoO/OMI1WXmCdIxQfblwE
	 xPlfr8+dexP5w==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN][PATCH]=20x86/hvm:=20move=20hvm=5Fshadow=5Fhandle=5Fcd()=20under=20CONFIG=5FINTEL=5FVMX=20ifdef?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761415812020
Message-Id: <eaf5e6bd-e7b8-4a3d-8b5b-33d1a9630619@vates.tech>
To: "Grygorii Strashko" <grygorii_strashko@epam.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <20251023151903.560947-1-grygorii_strashko@epam.com>
In-Reply-To: <20251023151903.560947-1-grygorii_strashko@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.befac1088e9f4280b9041a139ae034aa?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251025:md
Date: Sat, 25 Oct 2025 18:10:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 23/10/2025 =C3=A0 17:22, Grygorii Strashko a =C3=A9crit=C2=A0:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Functions:
>   hvm_shadow_handle_cd()
>   hvm_set_uc_mode()
>   domain_exit_uc_mode()
> are used only by Intel VMX code, so move them under CONFIG_INTEL_VMX ifde=
f.
> 

If they are actually Intel VMX specific, they should rather be moved to 
VMX code (and named appropriately) rather than if-defed in shared hvm 
code. If AMD code happens to need these functions in the future, it 
would make things break pretty confusingly (as headers are not updated 
consistently).

> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
>   xen/arch/x86/hvm/hvm.c | 50 ++++++++++++++++++++++--------------------
>   1 file changed, 26 insertions(+), 24 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index f1035fc9f645..3a30404d9940 100644
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
> @@ -2273,6 +2249,31 @@ int hvm_mov_from_cr(unsigned int cr, unsigned int =
gpr)
>       return X86EMUL_UNHANDLEABLE;
>   }
>   
> +#ifdef CONFIG_INTEL_VMX
> +/* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fi=
ll. */
> +static bool domain_exit_uc_mode(struct vcpu *v)
> +{
> +    struct domain *d =3D v->domain;
> +    struct vcpu *vs;
> +
> +    for_each_vcpu ( d, vs )
> +    {
> +        if ( (vs =3D=3D v) || !vs->is_initialised )
> +            continue;
> +        if ( (vs->arch.hvm.cache_mode =3D=3D NO_FILL_CACHE_MODE) ||
> +             mtrr_pat_not_equal(vs, v) )
> +            return 0;
> +    }
> +
> +    return 1;
> +}
> +
> +static void hvm_set_uc_mode(struct vcpu *v, bool is_in_uc_mode)
> +{
> +    v->domain->arch.hvm.is_in_uc_mode =3D is_in_uc_mode;
> +    shadow_blow_tables_per_domain(v->domain);
> +}
> +
>   void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value)
>   {
>       if ( value & X86_CR0_CD )
> @@ -2306,6 +2307,7 @@ void hvm_shadow_handle_cd(struct vcpu *v, unsigned =
long value)
>           spin_unlock(&v->domain->arch.hvm.uc_lock);
>       }
>   }
> +#endif
>   
>   static void hvm_update_cr(struct vcpu *v, unsigned int cr, unsigned lon=
g value)
>   {

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



