Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B247E569F41
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 12:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362898.593173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9OWl-00019t-7f; Thu, 07 Jul 2022 10:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362898.593173; Thu, 07 Jul 2022 10:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9OWl-00016Q-4P; Thu, 07 Jul 2022 10:14:31 +0000
Received: by outflank-mailman (input) for mailman id 362898;
 Thu, 07 Jul 2022 10:14:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A0+o=XM=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o9OWj-00016K-HZ
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 10:14:29 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94458b4d-fddd-11ec-bd2d-47488cf2e6aa;
 Thu, 07 Jul 2022 12:14:27 +0200 (CEST)
Received: from [10.10.1.164] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 165718883834873.99244568589927;
 Thu, 7 Jul 2022 03:13:58 -0700 (PDT)
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
X-Inumbo-ID: 94458b4d-fddd-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1657188864; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qvt96hhaKicFIodSwQFQMxgv6LfDuM9tS3jNCFLNE6sWLtal1waL5QnVmE2sifHAbt2D1rR68MOWt1W1m+Yq/4HQkRH80u8bkbVBOiSPV6MVnbHdqRelu5/DfqiBd5kQXihhSxJmnGUmqCQUps0Ow5kHErz6h2rXTaArEM5Cnyw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1657188864; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=ik1sa6jEG1dGJOukf4gQK4lVK5UafSRrWJqoabAvrLY=; 
	b=S3N64npI0YFJ+Dc15jAla5cAw42q9Llf7UchJwMxFQ7YpDuRhQLA2mN7d/x5ZOicpY1FjWyQmJ9IjBu68ewIvLwCRytdALJ6zEvC5VgbZf/QfCd5KKWPjZioMplqzvWBdVRAkbHqsQkVt1l63/eq19gSltMnSmw70n9I18lNB/Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657188864;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ik1sa6jEG1dGJOukf4gQK4lVK5UafSRrWJqoabAvrLY=;
	b=IPuzc0hwPPF/nJqpCVH4roqVd+/tDTeYP7X0jqI66WQTsVveeJA6M1J5E4lhp9jf
	NIBpwyY4QWp7QqnTEcvPDy2nu804rMPRpJgLtRkG9Q7wbxTS7H3ecIt1BXMG41pZ8/a
	aUT+BgLbyolGs6fjQyAhx1FfRQIH8m+2AOQcxZqQ=
Message-ID: <b689b39e-581d-01fe-c473-b585dca880eb@apertussolutions.com>
Date: Thu, 7 Jul 2022 06:12:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH] flask: Remove magic SID setting
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: anthony.perard@citrix.com, christopher.clark@starlab.io,
 dgdegra@tycho.nsa.gov, scott.davis@starlab.io, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <92644952-48be-d25b-4471-121cfa14a5c0@apertussolutions.com>
 <20220706191325.440538-1-jandryuk@gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20220706191325.440538-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/6/22 15:13, Jason Andryuk wrote:
> flask_domain_alloc_security and flask_domain_create has special code to
> magically label dom0 as dom0_t.  This can all be streamlined by making
> create_dom0 set ssidref before creating dom0.

Hmm, I wouldn't call it magical, it is the initialization policy for a 
domain labeling, which is specific to each policy module. I considered 
this approach already and my concern here is two fold. First, it now 
hard codes the concept of dom0 vs domU into the XSM API. There is an 
ever growing desire by solution providers to not have a dom0 and at most 
have a hardware domain if at all and this is a step backwards from that 
movement. Second, and related, is this now pushes the initial label 
policy up into the domain builder code away from the policy module and 
spreads it out. Hopefully Xen will evolve to have a richer set of 
initial domains and an appropriate initial label policy will be needed 
for this case. This approach will result in having to continually expand 
the XSM API for each new initial domain type.

> create_domU is also extended to create domains with domU_t.
> 
> xsm_ssidref_domU and xsm_ssidref_dom0 are introduced to abstract away
> the details.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> Untested on ARM.  Minimally tested on x86.  Needs your Flask permission
> changes for xenboot_t to create dom0_t and domU_t.
> 
> This is what I was thinking would be a better way to handle SID
> assignment.
> 
> Regards,
> Jason
> ---
>   xen/arch/arm/domain_build.c |  2 ++
>   xen/arch/x86/setup.c        |  1 +
>   xen/include/xsm/dummy.h     | 10 ++++++++++
>   xen/include/xsm/xsm.h       | 12 ++++++++++++
>   xen/xsm/dummy.c             |  2 ++
>   xen/xsm/flask/hooks.c       | 31 +++++++++++++++++--------------
>   6 files changed, 44 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 3fd1186b53..a7e88944c2 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3281,6 +3281,7 @@ void __init create_domUs(void)
>               .max_grant_frames = -1,
>               .max_maptrack_frames = -1,
>               .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
> +            .ssidref = xsm_ssidref_domU(),
>           };
>           unsigned int flags = 0U;
>   
> @@ -3438,6 +3439,7 @@ void __init create_dom0(void)
>           .max_grant_frames = gnttab_dom0_frames(),
>           .max_maptrack_frames = -1,
>           .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
> +        .ssidref = xsm_ssidref_dom0(),
>       };
>   
>       /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index f08b07b8de..5a6086cfe3 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -771,6 +771,7 @@ static struct domain *__init create_dom0(const module_t *image,
>           .arch = {
>               .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
>           },
> +        .ssidref = xsm_ssidref_dom0(),
>       };
>       struct domain *d;
>       char *cmdline;
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 77f27e7163..12fbc224d0 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -124,6 +124,16 @@ static XSM_INLINE void cf_check xsm_security_domaininfo(
>       return;
>   }
>   
> +static XSM_INLINE int cf_check xsm_ssidref_dom0(XSM_DEFAULT_VOID)
> +{
> +    return 0;
> +}
> +
> +static XSM_INLINE int cf_check xsm_ssidref_domU(XSM_DEFAULT_VOID)
> +{
> +    return 0;
> +}
> +
>   static XSM_INLINE int cf_check xsm_domain_create(
>       XSM_DEFAULT_ARG struct domain *d, uint32_t ssidref)
>   {
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index 8dad03fd3d..a6a4ffe05a 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -55,6 +55,8 @@ struct xsm_ops {
>       int (*set_system_active)(void);
>       void (*security_domaininfo)(struct domain *d,
>                                   struct xen_domctl_getdomaininfo *info);
> +    int (*ssidref_dom0)(void);
> +    int (*ssidref_domU)(void);
>       int (*domain_create)(struct domain *d, uint32_t ssidref);
>       int (*getdomaininfo)(struct domain *d);
>       int (*domctl_scheduler_op)(struct domain *d, int op);
> @@ -220,6 +222,16 @@ static inline void xsm_security_domaininfo(
>       alternative_vcall(xsm_ops.security_domaininfo, d, info);
>   }
>   
> +static inline int xsm_ssidref_dom0(void)
> +{
> +    return alternative_call(xsm_ops.ssidref_dom0);
> +}
> +
> +static inline int xsm_ssidref_domU(void)
> +{
> +    return alternative_call(xsm_ops.ssidref_domU);
> +}
> +
>   static inline int xsm_domain_create(
>       xsm_default_t def, struct domain *d, uint32_t ssidref)
>   {
> diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
> index e6ffa948f7..d46cfef0ec 100644
> --- a/xen/xsm/dummy.c
> +++ b/xen/xsm/dummy.c
> @@ -16,6 +16,8 @@
>   static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
>       .set_system_active             = xsm_set_system_active,
>       .security_domaininfo           = xsm_security_domaininfo,
> +    .ssidref_dom0                  = xsm_ssidref_dom0,
> +    .ssidref_domU                  = xsm_ssidref_domU,
>       .domain_create                 = xsm_domain_create,
>       .getdomaininfo                 = xsm_getdomaininfo,
>       .domctl_scheduler_op           = xsm_domctl_scheduler_op,
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 8c9cd0f297..d6f786ea84 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -544,26 +544,27 @@ static void cf_check flask_security_domaininfo(
>       info->ssidref = domain_sid(d);
>   }
>   
> +static int cf_check flask_ssidref_dom0(void)
> +{
> +    return SECINITSID_DOM0;
> +}
> +
> +static int cf_check flask_ssidref_domU(void)
> +{
> +    return SECINITSID_DOMU;
> +}
> +
>   static int cf_check flask_domain_create(struct domain *d, uint32_t ssidref)
>   {
>       int rc;
>       struct domain_security_struct *dsec = d->ssid;
> -    static int dom0_created = 0;
>   
> -    if ( is_idle_domain(current->domain) && !dom0_created )
> -    {
> -        dsec->sid = SECINITSID_DOM0;
> -        dom0_created = 1;
> -    }
> -    else
> -    {
> -        rc = avc_current_has_perm(ssidref, SECCLASS_DOMAIN,
> -                          DOMAIN__CREATE, NULL);
> -        if ( rc )
> -            return rc;
> +    rc = avc_current_has_perm(ssidref, SECCLASS_DOMAIN,
> +                      DOMAIN__CREATE, NULL);
> +    if ( rc )
> +        return rc;
>   
> -        dsec->sid = ssidref;
> -    }
> +    dsec->sid = ssidref;
>       dsec->self_sid = dsec->sid;
>   
>       rc = security_transition_sid(dsec->sid, dsec->sid, SECCLASS_DOMAIN,
> @@ -1805,6 +1806,8 @@ static int cf_check flask_argo_send(
>   static const struct xsm_ops __initconst_cf_clobber flask_ops = {
>       .set_system_active = flask_set_system_active,
>       .security_domaininfo = flask_security_domaininfo,
> +    .ssidref_dom0 = flask_ssidref_dom0,
> +    .ssidref_domU = flask_ssidref_domU,
>       .domain_create = flask_domain_create,
>       .getdomaininfo = flask_getdomaininfo,
>       .domctl_scheduler_op = flask_domctl_scheduler_op,

