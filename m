Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2445A9F5C0A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 02:03:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859945.1272038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNiSO-0004S8-Rp; Wed, 18 Dec 2024 01:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859945.1272038; Wed, 18 Dec 2024 01:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNiSO-0004P2-ME; Wed, 18 Dec 2024 01:02:32 +0000
Received: by outflank-mailman (input) for mailman id 859945;
 Wed, 18 Dec 2024 01:02:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uLCT=TL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tNiSN-0004Ow-AL
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 01:02:31 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf436489-bcdb-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 02:02:27 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1734483735898336.2131501847442;
 Tue, 17 Dec 2024 17:02:15 -0800 (PST)
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
X-Inumbo-ID: bf436489-bcdb-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1734483738; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nzGZhSJyEtgi4a+pP6eCgEUjHIktoI7SS2rmdXhAKCn7RF8q0uNiVuA5nhkz/NKIuwLwt/YVHuLL2I8ui8hXWsM+RP/6tIMnSunfaF7kjsB6+s7Txax1hiZ5R3u0z9J1hxPfl5XLKii37h7MG7g30mJzEfn/VWwrSEGQmgClIjg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734483738; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=al7Hvc5cQoUK6Q2+VqHu7nu8J1ScuhO7i/93I3DedLA=; 
	b=fPERXOofQkhuTqmraGjQq40Yi9ou5gF1XJiNfYnYDvygQ1nWutQ4bKSUzhHFopxhu1EY2QippdSM/q4j6Tv4h6MK6b59M3rN3kJnDpvHiF9OYdtcA5kjToK5SoYA5rMGwuqxqo254ZV6qovlJjQPwnf6GQD6zie/MojxfuJCSJs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734483738;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=al7Hvc5cQoUK6Q2+VqHu7nu8J1ScuhO7i/93I3DedLA=;
	b=bvqQJdTkqBItGVueS/ZIR5As1Rp4c+Bf+ZyXnJAv8/JN4wkNNV+Jh67eptYWN3TH
	TN/jQbHuD+oiYzSK3JzX84HcuRz4hLyvyob8JQX8+T+PeFYF/Mqci6nUlk+0HaPq+Wg
	E8qb72x/AiQo3ojrhLYMlf3FmOlEyiVweA465duI=
Message-ID: <94c494a2-863b-4597-a4df-c401fe7d5edf@apertussolutions.com>
Date: Tue, 17 Dec 2024 20:02:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] xen: add new domctl get_changed_domain
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20241217111247.2204-1-jgross@suse.com>
 <20241217111247.2204-4-jgross@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <20241217111247.2204-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/17/24 06:12, Juergen Gross wrote:
> Add a new domctl sub-function to get data of a domain having changed
> state (this is needed by Xenstore).
> 
> The returned state just contains the domid, the domain unique id,
> and some flags (existing, shutdown, dying).
> 
> In order to enable Xenstore stubdom being built for multiple Xen
> versions, make this domctl stable.  For stable domctls the
> interface_version is always 0.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V1:
> - use a domctl subop for the new interface (Jan Beulich)
> V2:
> - fix XSM hooks (Daniel P. Smith)
> - remove versioning of stable sub-ops (Jan Beulich)
> - use domctl.domain for retuning domid of a changed domain (Jan Beulich)
> - simplify locking in get_domain_state() (Jan Beulich)
> - undo stray change in event_channel.c (Jan Beulich)
> V3:
> - have disjunct states "dying" and "dead" (Jan Beulich)
> - check padding fields to be 0 (Jan Beulich)
> - drop memset() (Jan Beulich)
> V4:
> - add locking in get_domain_state() (Jan Beulich)
> - only allow querying domain having changed state by domain receiving
>    VIRQ_DOM_EXC events (Jan Beulich)
> ---
>   tools/flask/policy/modules/dom0.te     |  2 +-
>   tools/flask/policy/modules/xen.if      |  4 +-
>   tools/flask/policy/modules/xenstore.te |  1 +
>   xen/common/domain.c                    | 70 ++++++++++++++++++++++++++
>   xen/common/domctl.c                    | 18 ++++++-
>   xen/common/event_channel.c             |  9 +++-
>   xen/include/public/domctl.h            | 26 ++++++++++
>   xen/include/xen/event.h                |  7 +++
>   xen/include/xen/sched.h                |  2 +
>   xen/include/xsm/dummy.h                |  8 +++
>   xen/include/xsm/xsm.h                  |  6 +++
>   xen/xsm/dummy.c                        |  1 +
>   xen/xsm/flask/hooks.c                  |  7 +++
>   xen/xsm/flask/policy/access_vectors    |  2 +
>   14 files changed, 158 insertions(+), 5 deletions(-)
> 


> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index f8a3c4b81e..a1a5bb60e9 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -173,6 +173,7 @@ static XSM_INLINE int cf_check xsm_domctl(
>       case XEN_DOMCTL_unbind_pt_irq:
>           return xsm_default_action(XSM_DM_PRIV, current->domain, d);
>       case XEN_DOMCTL_getdomaininfo:
> +    case XEN_DOMCTL_get_domain_state:
>           return xsm_default_action(XSM_XS_PRIV, current->domain, d);
>       default:
>           return xsm_default_action(XSM_PRIV, current->domain, d);
> @@ -815,6 +816,13 @@ static XSM_INLINE int cf_check xsm_argo_send(
>   
>   #endif /* CONFIG_ARGO */
>   
> +static XSM_INLINE int cf_check xsm_get_domain_state(
> +    XSM_DEFAULT_ARG struct domain *d)
> +{
> +    XSM_ASSERT_ACTION(XSM_XS_PRIV);
> +    return xsm_default_action(action, current->domain, d);
> +}
> +
>   #include <public/version.h>
>   static XSM_INLINE int cf_check xsm_xen_version(XSM_DEFAULT_ARG uint32_t op)
>   {
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index 4dbff9d866..0689bf5c9f 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -200,6 +200,7 @@ struct xsm_ops {
>       int (*argo_register_any_source)(const struct domain *d);
>       int (*argo_send)(const struct domain *d, const struct domain *t);
>   #endif
> +    int (*get_domain_state)(struct domain *d);
>   };
>   
>   #ifdef CONFIG_XSM
> @@ -774,6 +775,11 @@ static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
>   
>   #endif /* CONFIG_ARGO */
>   
> +static inline int xsm_get_domain_state(struct domain *d)
> +{
> +    return alternative_call(xsm_ops.get_domain_state, d);
> +}
> +
>   #endif /* XSM_NO_WRAPPERS */
>   
>   #ifdef CONFIG_MULTIBOOT
> diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
> index e6ffa948f7..ce6fbdc6c5 100644
> --- a/xen/xsm/dummy.c
> +++ b/xen/xsm/dummy.c
> @@ -148,6 +148,7 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
>       .argo_register_any_source      = xsm_argo_register_any_source,
>       .argo_send                     = xsm_argo_send,
>   #endif
> +    .get_domain_state              = xsm_get_domain_state,
>   };
>   
>   void __init xsm_fixup_ops(struct xsm_ops *ops)
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index a79474ffe4..e110846ad9 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -688,6 +688,7 @@ static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
>       case XEN_DOMCTL_memory_mapping:
>       case XEN_DOMCTL_set_target:
>       case XEN_DOMCTL_vm_event_op:
> +    case XEN_DOMCTL_get_domain_state:
>   
>       /* These have individual XSM hooks (arch/../domctl.c) */
>       case XEN_DOMCTL_bind_pt_irq:
> @@ -1856,6 +1857,11 @@ static int cf_check flask_argo_send(
>   
>   #endif
>   
> +static int cf_check flask_get_domain_state(struct domain *d)
> +{
> +    return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__GET_DOMAIN_STATE);
> +}
> +
>   static const struct xsm_ops __initconst_cf_clobber flask_ops = {
>       .set_system_active = flask_set_system_active,
>       .security_domaininfo = flask_security_domaininfo,
> @@ -1992,6 +1998,7 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
>       .argo_register_any_source = flask_argo_register_any_source,
>       .argo_send = flask_argo_send,
>   #endif
> +    .get_domain_state = flask_get_domain_state,
>   };
>   
>   const struct xsm_ops *__init flask_init(
> diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
> index a35e3d4c51..c9a8eeda4e 100644
> --- a/xen/xsm/flask/policy/access_vectors
> +++ b/xen/xsm/flask/policy/access_vectors
> @@ -251,6 +251,8 @@ class domain2
>       resource_map
>   # XEN_DOMCTL_get_cpu_policy
>       get_cpu_policy
> +# XEN_DOMCTL_get_domain_state
> +    get_domain_state
>   }
>   
>   # Similar to class domain, but primarily contains domctls related to HVM domains

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

