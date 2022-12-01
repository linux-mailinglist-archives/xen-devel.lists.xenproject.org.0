Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D22763F9EC
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 22:35:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451224.708875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0rCt-00028A-Nz; Thu, 01 Dec 2022 21:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451224.708875; Thu, 01 Dec 2022 21:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0rCt-00025K-Ks; Thu, 01 Dec 2022 21:34:59 +0000
Received: by outflank-mailman (input) for mailman id 451224;
 Thu, 01 Dec 2022 21:34:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p0rCr-00025E-Ge
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 21:34:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0rCq-0004Tr-KO; Thu, 01 Dec 2022 21:34:56 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0rCq-0001F7-F5; Thu, 01 Dec 2022 21:34:56 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=y/Xl6y/yN3FhYD0oxvSntL3rjTbEnbIa5V4Ya8I5uBU=; b=umNdiBu6mLBc8Wu6RXreB57uq2
	WnkIqdYTnoY4aRCNymmLDdSz/n040iZOVxwWqw36SmO3euZA43XKsTduYdiZePgIthpRimovAYCIp
	4B3U2fbEurLe1vj2F4e8nBCyqnfHf+H9LdIY+CktE42I3Q5qT5vXGBzsGjOArbBLkvLc=;
Message-ID: <b0380217-09ff-1fa8-b6b3-1bc98766114b@xen.org>
Date: Thu, 1 Dec 2022 21:34:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-9-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 08/20] tools/xenstore: add hashlist for finding struct
 domain by domid
In-Reply-To: <20221101152842.4257-9-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 01/11/2022 15:28, Juergen Gross wrote:
> @@ -341,49 +339,56 @@ static bool get_domain_info(unsigned int domid, xc_dominfo_t *dominfo)
>   	       dominfo->domid == domid;
>   }
>   
> -void check_domains(void)
> +static int check_domain(void *k, void *v, void *arg)

Looking at this callback, shouldn't 'k' be const? If not, wouldn't this 
mean a caller could potentially mess up with the hashtable?

>   {
>   	xc_dominfo_t dominfo;
> -	struct domain *domain;
>   	struct connection *conn;
> -	int notify = 0;
>   	bool dom_valid;
> +	struct domain *domain = v;
> +	bool *notify = arg;
>   
> - again:
> -	list_for_each_entry(domain, &domains, list) {
> -		dom_valid = get_domain_info(domain->domid, &dominfo);
> -		if (!domain->introduced) {
> -			if (!dom_valid) {
> -				talloc_free(domain);
> -				goto again;
> -			}
> -			continue;
> -		}
> -		if (dom_valid) {
> -			if ((dominfo.crashed || dominfo.shutdown)
> -			    && !domain->shutdown) {
> -				domain->shutdown = true;
> -				notify = 1;
> -				/*
> -				 * Avoid triggering watch events when the
> -				 * domain's nodes are being deleted.
> -				 */
> -				if (domain->conn)
> -					conn_delete_all_watches(domain->conn);
> -			}
> -			if (!dominfo.dying)
> -				continue;
> +	dom_valid = get_domain_info(domain->domid, &dominfo);
> +	if (!domain->introduced) {
> +		if (!dom_valid) {
> +			talloc_free(domain);
> +			return 1;

You are only freeing one domain here. So shouldn't we return 0? If not 
please explain in a comment.

>   		}
> -		if (domain->conn) {
> -			/* domain is a talloc child of domain->conn. */
> -			conn = domain->conn;
> -			domain->conn = NULL;
> -			talloc_unlink(talloc_autofree_context(), conn);
> -			notify = 0; /* destroy_domain() fires the watch */
> -			goto again;
> +		return 0;
> +	}
> +	if (dom_valid) {
> +		if ((dominfo.crashed || dominfo.shutdown)
> +		    && !domain->shutdown) {
> +			domain->shutdown = true;
> +			*notify = true;
> +			/*
> +			 * Avoid triggering watch events when the domain's
> +			 * nodes are being deleted.
> +			 */
> +			if (domain->conn)
> +				conn_delete_all_watches(domain->conn);
>   		}
> +		if (!dominfo.dying)
> +			return 0;
> +	}
> +	if (domain->conn) {
> +		/* domain is a talloc child of domain->conn. */
> +		conn = domain->conn;
> +		domain->conn = NULL;
> +		talloc_unlink(talloc_autofree_context(), conn);
> +		*notify = false; /* destroy_domain() fires the watch */
> +		return 1;

Can you add a comment explaining why 1 is returned here? Is this because 
we may free two domains?

>   	}
>   
> +	return 0;
> +}

Cheers,

-- 
Julien Grall

