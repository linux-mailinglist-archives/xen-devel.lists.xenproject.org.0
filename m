Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED44C3767B7
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 17:10:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124063.234126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lf27O-0000J7-75; Fri, 07 May 2021 15:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124063.234126; Fri, 07 May 2021 15:10:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lf27O-0000Gk-3p; Fri, 07 May 2021 15:10:18 +0000
Received: by outflank-mailman (input) for mailman id 124063;
 Fri, 07 May 2021 15:10:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kza/=KC=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lf27M-0000Ge-Ai
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 15:10:16 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04751cac-fd3c-44b1-aa93-838881fbc321;
 Fri, 07 May 2021 15:10:15 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1620400192346523.3740762787533;
 Fri, 7 May 2021 08:09:52 -0700 (PDT)
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
X-Inumbo-ID: 04751cac-fd3c-44b1-aa93-838881fbc321
ARC-Seal: i=1; a=rsa-sha256; t=1620400205; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CmoaEAsg+sWjmivXCPaJQbEOQM7ik9nSFdpkL7WxDQwG4C722qoefHgGQvSwMRz9oJIvgAMHdAIhadPRwKUN5SCo/e07V6mDqkejgyM3ac81SFxrdG48J3fWaQhgi+T4D0+8FBQSa84Ib+bwNXIYy3R6MsgkDfOZaFN9ZXo03fs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1620400205; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=WTihv1F2nV1abmzrN1LRdfqxi3o6PNbr7Kg84wpaQWw=; 
	b=hAglI96u7OMhu93D/sAjcpFk6742MTPKYpKr65TsqQJxtBZKUETdruSqgbddnQGl3/HbRHLUmz6FNDP+WN4exavOxvvYGWj+cp/BDdBKbnYzvC3H2g1RCoE9GSnuTLGY1DzZUzYkVtVUHIEz1Us9mLKpjzDMT+dTtrdV4aI8Y2U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1620400205;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WTihv1F2nV1abmzrN1LRdfqxi3o6PNbr7Kg84wpaQWw=;
	b=IrKwcN6fDDJQ6uziWzZYSKCQj0UAXKiIM7SoFKyj9tkVLtfxZIi+MdYFhG3Bxo0q
	tU/ZzlPngSXJqtoryRoIlrvo2KnM9yNVA20PqrV8G6uXy5nhN8FKmzUhx08cpLd1Vlk
	5MxKqf0F0LhCbvOtVVq+H10QeuU6qkWhrzw0V5uw=
Subject: Re: [PATCH] Argo/XSM: add SILO hooks
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <f47a6aa0-3624-5819-2e3a-43c5e492ae1b@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <ac40709a-e1a2-03ae-6d44-be811f545bca@apertussolutions.com>
Date: Fri, 7 May 2021 11:09:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <f47a6aa0-3624-5819-2e3a-43c5e492ae1b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/7/21 5:20 AM, Jan Beulich wrote:
> In SILO mode restrictions for inter-domain communication should apply
> here along the lines of those for evtchn and gnttab.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

> ---
> Really I was first thinking about the shim: Shouldn't that proxy argo
> requests just like it does for gnttab ones? It only then occurred to me
> that there's also an implication for SILO mode.
> 
> --- a/xen/xsm/silo.c
> +++ b/xen/xsm/silo.c
> @@ -81,12 +81,35 @@ static int silo_grant_copy(struct domain
>      return -EPERM;
>  }
>  
> +#ifdef CONFIG_ARGO
> +
> +static int silo_argo_register_single_source(const struct domain *d1,
> +                                            const struct domain *d2)
> +{
> +    if ( silo_mode_dom_check(d1, d2) )
> +        return xsm_argo_register_single_source(d1, d2);
> +    return -EPERM;
> +}
> +
> +static int silo_argo_send(const struct domain *d1, const struct domain *d2)
> +{
> +    if ( silo_mode_dom_check(d1, d2) )
> +        return xsm_argo_send(d1, d2);
> +    return -EPERM;
> +}
> +
> +#endif
> +
>  static struct xsm_operations silo_xsm_ops = {
>      .evtchn_unbound = silo_evtchn_unbound,
>      .evtchn_interdomain = silo_evtchn_interdomain,
>      .grant_mapref = silo_grant_mapref,
>      .grant_transfer = silo_grant_transfer,
>      .grant_copy = silo_grant_copy,
> +#ifdef CONFIG_ARGO
> +    .argo_register_single_source = silo_argo_register_single_source,
> +    .argo_send = silo_argo_send,
> +#endif
>  };
>  
>  void __init silo_init(void)
> 


