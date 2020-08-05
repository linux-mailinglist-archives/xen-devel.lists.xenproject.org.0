Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A35A323CBFA
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 18:14:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3M3G-0005vC-KM; Wed, 05 Aug 2020 16:14:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7mHh=BP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3M3F-0005v7-RU
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 16:14:01 +0000
X-Inumbo-ID: fd00bafe-f279-4562-9c3b-4e9c79ca9580
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd00bafe-f279-4562-9c3b-4e9c79ca9580;
 Wed, 05 Aug 2020 16:14:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6942FAC65;
 Wed,  5 Aug 2020 16:14:16 +0000 (UTC)
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a052e9ad-b6a9-ac61-ec04-4daa4bcd39f2@suse.com>
Date: Wed, 5 Aug 2020 18:13:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.08.2020 20:21, Oleksandr Tyshchenko wrote:
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -713,14 +713,14 @@ static XSM_INLINE int xsm_pmu_op (XSM_DEFAULT_ARG struct domain *d, unsigned int
>      }
>  }
>  
> +#endif /* CONFIG_X86 */
> +
>  static XSM_INLINE int xsm_dm_op(XSM_DEFAULT_ARG struct domain *d)
>  {
>      XSM_ASSERT_ACTION(XSM_DM_PRIV);
>      return xsm_default_action(action, current->domain, d);
>  }
>  
> -#endif /* CONFIG_X86 */
> -
>  #ifdef CONFIG_ARGO
>  static XSM_INLINE int xsm_argo_enable(const struct domain *d)
>  {
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index a80bcf3..2a9b39d 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -177,8 +177,8 @@ struct xsm_operations {
>      int (*ioport_permission) (struct domain *d, uint32_t s, uint32_t e, uint8_t allow);
>      int (*ioport_mapping) (struct domain *d, uint32_t s, uint32_t e, uint8_t allow);
>      int (*pmu_op) (struct domain *d, unsigned int op);
> -    int (*dm_op) (struct domain *d);
>  #endif
> +    int (*dm_op) (struct domain *d);
>      int (*xen_version) (uint32_t cmd);
>      int (*domain_resource_map) (struct domain *d);
>  #ifdef CONFIG_ARGO
> @@ -688,13 +688,13 @@ static inline int xsm_pmu_op (xsm_default_t def, struct domain *d, unsigned int
>      return xsm_ops->pmu_op(d, op);
>  }
>  
> +#endif /* CONFIG_X86 */
> +
>  static inline int xsm_dm_op(xsm_default_t def, struct domain *d)
>  {
>      return xsm_ops->dm_op(d);
>  }
>  
> -#endif /* CONFIG_X86 */
> -
>  static inline int xsm_xen_version (xsm_default_t def, uint32_t op)
>  {
>      return xsm_ops->xen_version(op);
> diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
> index d4cce68..e3afd06 100644
> --- a/xen/xsm/dummy.c
> +++ b/xen/xsm/dummy.c
> @@ -148,8 +148,8 @@ void __init xsm_fixup_ops (struct xsm_operations *ops)
>      set_to_dummy_if_null(ops, ioport_permission);
>      set_to_dummy_if_null(ops, ioport_mapping);
>      set_to_dummy_if_null(ops, pmu_op);
> -    set_to_dummy_if_null(ops, dm_op);
>  #endif
> +    set_to_dummy_if_null(ops, dm_op);
>      set_to_dummy_if_null(ops, xen_version);
>      set_to_dummy_if_null(ops, domain_resource_map);
>  #ifdef CONFIG_ARGO
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index a314bf8..645192a 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1662,14 +1662,13 @@ static int flask_pmu_op (struct domain *d, unsigned int op)
>          return -EPERM;
>      }
>  }
> +#endif /* CONFIG_X86 */
>  
>  static int flask_dm_op(struct domain *d)
>  {
>      return current_has_perm(d, SECCLASS_HVM, HVM__DM);
>  }
>  
> -#endif /* CONFIG_X86 */
> -
>  static int flask_xen_version (uint32_t op)
>  {
>      u32 dsid = domain_sid(current->domain);
> @@ -1872,8 +1871,8 @@ static struct xsm_operations flask_ops = {
>      .ioport_permission = flask_ioport_permission,
>      .ioport_mapping = flask_ioport_mapping,
>      .pmu_op = flask_pmu_op,
> -    .dm_op = flask_dm_op,
>  #endif
> +    .dm_op = flask_dm_op,
>      .xen_version = flask_xen_version,
>      .domain_resource_map = flask_domain_resource_map,
>  #ifdef CONFIG_ARGO

All of this looks to belong into patch 2?

Jan

