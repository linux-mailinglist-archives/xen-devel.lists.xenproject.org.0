Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8F63E1779
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 17:03:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164396.300684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBeu8-0007gs-Qd; Thu, 05 Aug 2021 15:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164396.300684; Thu, 05 Aug 2021 15:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBeu8-0007eO-NC; Thu, 05 Aug 2021 15:03:28 +0000
Received: by outflank-mailman (input) for mailman id 164396;
 Thu, 05 Aug 2021 15:03:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DXIG=M4=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mBeu6-0007eI-Um
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 15:03:27 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78b06695-c22f-44ac-aeb9-1519d692e89f;
 Thu, 05 Aug 2021 15:03:26 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1628175785838405.3750948474901;
 Thu, 5 Aug 2021 08:03:05 -0700 (PDT)
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
X-Inumbo-ID: 78b06695-c22f-44ac-aeb9-1519d692e89f
ARC-Seal: i=1; a=rsa-sha256; t=1628175799; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S/3c/cnMV0vzIaDaKe9GXro6wq75YJGH3CI2SjeQSAAdv6zAZxofk5XquHAa/u9AMc7hrQanTcvDG5A0+rOWZkld+RJWdJMopR1hlpGI7AmqMYtzYDJ6qTgkDtbhSAxqpX6+Nw+w8MlGXu5Sk12xAUSw4AAIh9E7zInE47dObh8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1628175799; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Rsk366i1/xGNnPbYCVhwAj8pmFJseHf8LPkQj8h0qFo=; 
	b=a4QhvV7Kz2Xv2PWKzyt7JsXjY6i4iUahM2dZ9NRcoPDLWuPd+Mk4Qla4TciL7pMmfvdSJSQUkPGNYY9dBQGepWOC4x/MGN5KFjEY1yw5e7mv4LS1+ZKF7MOeIgXRLauMeNBqpim+9hmCT4sYdOeGFCG5zbGDBhpJXe2rs38/1w4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1628175799;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Rsk366i1/xGNnPbYCVhwAj8pmFJseHf8LPkQj8h0qFo=;
	b=DQuKYWPUq+1KewWA28jx0GOqRrYcPB6T51MDhT+AmTiqD7iitJnVNDYRBFqRFM9E
	xJJg7MQ0/GMqbX0J08J8QVvMRCSVwPMkbHZjtFYkGCSS7ZVlEsxHZIdtGHrjtEiIVGS
	c2V/jamXC0bn+Z57Dvn1Pe2nh0NUWr3dgtu/2x/I=
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
Message-ID: <6e573489-ceb7-03f4-3511-e6c166b318a6@apertussolutions.com>
Date: Thu, 5 Aug 2021 11:03:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 7/28/21 12:18 PM, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

...

> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index e07bd9a..3f9b816 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1811,6 +1811,62 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>              start_extent);
>          break;
>  
> +    case XENMEM_get_unallocated_space:
> +    {
> +        struct xen_get_unallocated_space xgus;
> +        struct xen_unallocated_region *regions;
> +
> +        if ( unlikely(start_extent) )
> +            return -EINVAL;
> +
> +        if ( copy_from_guest(&xgus, arg, 1) ||
> +             !guest_handle_okay(xgus.buffer, xgus.nr_regions) )
> +            return -EFAULT;
> +
> +        d = rcu_lock_domain_by_any_id(xgus.domid);
> +        if ( d == NULL )
> +            return -ESRCH;
> +
> +        rc = xsm_get_unallocated_space(XSM_HOOK, d);

Not sure if you are aware but XSM_HOOK is a no-op check, meaning that
you are allowing any domain to do this operation on any other domain. In
most cases there is an XSM check at the beginning of the hypercall
processing to do an initial clamp down but I am pretty sure there is no
prior XSM check on this path. Based on my understanding of how this is
intended, which may be incorrect, but I think you would actually want
XSM_TARGET.

> +        if ( rc )
> +        {
> +            rcu_unlock_domain(d);
> +            return rc;
> +        }
> +
> +        if ( !xgus.nr_regions || xgus.nr_regions > XEN_MAX_UNALLOCATED_REGIONS )
> +        {
> +            rcu_unlock_domain(d);
> +            return -EINVAL;
> +        }
> +
> +        regions = xzalloc_array(struct xen_unallocated_region, xgus.nr_regions);
> +        if ( !regions )
> +        {
> +            rcu_unlock_domain(d);
> +            return -ENOMEM;
> +        }
> +
> +        rc = arch_get_unallocated_space(d, regions, &xgus.nr_regions);
> +        if ( rc )
> +            goto unallocated_out;
> +
> +        if ( __copy_to_guest(xgus.buffer, regions, xgus.nr_regions) )
> +        {
> +            rc = -EFAULT;
> +            goto unallocated_out;
> +        }
> +
> +        if ( __copy_to_guest(arg, &xgus, 1) )
> +            rc = -EFAULT;
> +
> +unallocated_out:
> +        rcu_unlock_domain(d);
> +        xfree(regions);
> +
> +        break;
> +    }
> +
>      default:
>          rc = arch_memory_op(cmd, arg);
>          break;

...

> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 363c6d7..2761fbd 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -772,3 +772,9 @@ static XSM_INLINE int xsm_domain_resource_map(XSM_DEFAULT_ARG struct domain *d)
>      XSM_ASSERT_ACTION(XSM_DM_PRIV);
>      return xsm_default_action(action, current->domain, d);
>  }
> +
> +static XSM_INLINE int xsm_get_unallocated_space(XSM_DEFAULT_ARG struct domain *d)
> +{
> +    XSM_ASSERT_ACTION(XSM_HOOK);

For completeness, if you switch to XSM_TARGET at the call site, you will
want to change it here as well.

> +    return xsm_default_action(action, current->domain, d);
> +}

V/r,
Daniel P. Smith

