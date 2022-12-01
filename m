Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A32063FA64
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 23:14:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451292.708974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0roX-0004M6-NP; Thu, 01 Dec 2022 22:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451292.708974; Thu, 01 Dec 2022 22:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0roX-0004Jg-Ji; Thu, 01 Dec 2022 22:13:53 +0000
Received: by outflank-mailman (input) for mailman id 451292;
 Thu, 01 Dec 2022 22:13:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p0roV-0004Ja-Ui
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 22:13:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0roV-0005TN-8D; Thu, 01 Dec 2022 22:13:51 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0roV-0003IW-1u; Thu, 01 Dec 2022 22:13:51 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=8LhJlnoEam1aGlTQzavjsoeMKSJPS3Ces6hlUZUWMl4=; b=N2g0bzcFwKBVNVyntefKi3ang2
	Is7E9jezHCbR0mQIdOQ/BmfHQsPFIFHYzeRSGQHy3coskeGU9UD3UJn6t12AmU6/5btxEqbc1Crc1
	hfoF3lPcX3BhtpZCtz6VkiYD2KGx+1lqGjPbFZcRfiu7W3FRioHQdE/vIEDU7uRgHaOs=;
Message-ID: <34de8b28-76d9-dcd4-8193-c327a02d94f3@xen.org>
Date: Thu, 1 Dec 2022 22:13:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 01/12] tools/xenstore: manage per-transaction domain
 accounting data in an array
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101160422.7212-1-jgross@suse.com>
 <20221101160422.7212-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221101160422.7212-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 01/11/2022 16:04, Juergen Gross wrote:
> In order to prepare keeping accounting data in an array instead of
> using independent fields, switch the struct changed_domain accounting
> data to that scheme, for now only using an array with one element.
> 
> In order to be able to extend this scheme add the needed indexing enum
> to xenstored_domain.h.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstore/xenstored_domain.c | 17 +++++++++--------
>   tools/xenstore/xenstored_domain.h |  5 +++++
>   2 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index 582b78b0ee..399fc920bb 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -99,8 +99,8 @@ struct changed_domain
>   	/* Identifier of the changed domain. */
>   	unsigned int domid;
>   
> -	/* Amount by which this domain's nbentry field has changed. */
> -	int nbentry;
> +	/* Accounting data. */
> +	int acc[ACC_TR_N];
>   };
>   
>   static struct hashtable *domhash;
> @@ -558,7 +558,7 @@ int acc_fix_domains(struct list_head *head, bool update)
>   	int cnt;
>   
>   	list_for_each_entry(cd, head, list) {
> -		cnt = domain_nbentry_fix(cd->domid, cd->nbentry, update);
> +		cnt = domain_nbentry_fix(cd->domid, cd->acc[ACC_NODES], update);
>   		if (!update) {
>   			if (cnt >= quota_nb_entry_per_domain)
>   				return ENOSPC;
> @@ -603,8 +603,8 @@ static struct changed_domain *acc_get_changed_domain(const void *ctx,
>   	return cd;
>   }
>   
> -static int acc_add_dom_nbentry(const void *ctx, struct list_head *head, int val,
> -			       unsigned int domid)
> +static int acc_add_changed_dom(const void *ctx, struct list_head *head,
> +			       unsigned int what, int val, unsigned int domid)

AFAIU "what" will be a value from the enum. So let's do some hardening 
and use the type "enum ...".

>   {
>   	struct changed_domain *cd;
>   
> @@ -613,9 +613,9 @@ static int acc_add_dom_nbentry(const void *ctx, struct list_head *head, int val,
>   		return 0;
>   
>   	errno = 0;
> -	cd->nbentry += val;

I would consider to adding an assert() (or possibly runtime check) to 
confirm the 'what' is smaller than the array size.

> +	cd->acc[what] += val;
>   
> -	return cd->nbentry;
> +	return cd->acc[what];
>   }
>   
>   static void domain_conn_reset(struct domain *domain)
> @@ -1076,7 +1076,8 @@ static int domain_nbentry_add(struct connection *conn, unsigned int domid,
>   
>   	if (conn && conn->transaction) {
>   		head = transaction_get_changed_domains(conn->transaction);
> -		ret = acc_add_dom_nbentry(conn->transaction, head, add, domid);
> +		ret = acc_add_changed_dom(conn->transaction, head, ACC_NODES,
> +					  add, domid);
>   		if (errno) {
>   			fail_transaction(conn->transaction);
>   			return -1;
> diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
> index dc4660861e..124b9e1b1e 100644
> --- a/tools/xenstore/xenstored_domain.h
> +++ b/tools/xenstore/xenstored_domain.h
> @@ -19,6 +19,11 @@
>   #ifndef _XENSTORED_DOMAIN_H
>   #define _XENSTORED_DOMAIN_H
>   
> +enum {
> +	ACC_NODES,
> +	ACC_TR_N	/* Number of elements per transaction and domain. */
> +};
> +
>   void handle_event(void);
>   
>   void check_domains(void);

Cheers,

-- 
Julien Grall

