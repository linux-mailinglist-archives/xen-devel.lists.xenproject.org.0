Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EDA414489
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 11:08:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192307.342690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSyEK-0006PG-Jg; Wed, 22 Sep 2021 09:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192307.342690; Wed, 22 Sep 2021 09:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSyEK-0006N5-Ge; Wed, 22 Sep 2021 09:07:52 +0000
Received: by outflank-mailman (input) for mailman id 192307;
 Wed, 22 Sep 2021 09:07:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mSyEJ-0006My-Aa
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 09:07:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mSyEI-0003Fe-5J; Wed, 22 Sep 2021 09:07:50 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mSyEH-0003ki-Fk; Wed, 22 Sep 2021 09:07:50 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=u/l6QLgW1GiuVPFhTbV1kN5L6Uvm5lCyXLPzB1Uke/Y=; b=6EWLhpsKjKGP09dXuwsmL2TZG8
	zbobampEv8l9WdFb6n9Ef3xlXALJIbjxxLOmUriaaQsP4LrXbpQsrWXNxK6qib41RPiLZhjx4IkM5
	UUe7IplnMsnJOG2yrTHSm0KbnMzWJIEI1Ag+HkVMeTqrDwujwARilVxXfDLPkUYIk8qw=;
Subject: Re: [PATCH v2 5/6] tools/xenstored: partially handle domains without
 a shared ring
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-6-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0aed8667-7f31-b0fb-3358-c5fd9a5734a1@xen.org>
Date: Wed, 22 Sep 2021 14:07:44 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210922082123.54374-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Roger,

On 22/09/2021 13:21, Roger Pau Monne wrote:
> Failure to map the shared ring and thus establish a xenstore
> connection with a domain shouldn't prevent the "@introduceDomain"
> watch from firing, likewise with "@releaseDomain".
> 
> In order to handle such events properly xenstored should keep track of
> the domains even if the shared communication ring cannot be mapped.
> This was partially the case due to the restore mode, which needs to
> handle domains that have been destroyed between the save and restore
> period. This patch extends on the previous limited support of
> temporary adding a domain without a valid interface ring, and modifies
> check_domains to keep domains without an interface on the list.
> 
> Handling domains without a valid shared ring is required in order to
> support domain without a grant table, since the lack of grant table
> will prevent the mapping of the xenstore ring grant reference.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> oxenstored will need a similar treatment once grant mapping is used
> there. For the time being it still works correctly because it uses
> foreign memory to map the shared ring, and that will work in the
> absence of grant tables on the domain.
> ---
> Changes since v1:
>   - New in this version.
> ---
>   tools/xenstore/xenstored_domain.c | 30 ++++++++++++++++++------------
>   1 file changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index 9fb78d5772..150c6f082e 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -119,6 +119,11 @@ static int writechn(struct connection *conn,
>   	struct xenstore_domain_interface *intf = conn->domain->interface;
>   	XENSTORE_RING_IDX cons, prod;
>   
> +	if (!intf) {
> +		errno = ENODEV;
> +		return -1;
> +	}
> +
>   	/* Must read indexes once, and before anything else, and verified. */
>   	cons = intf->rsp_cons;
>   	prod = intf->rsp_prod;
> @@ -149,6 +154,11 @@ static int readchn(struct connection *conn, void *data, unsigned int len)
>   	struct xenstore_domain_interface *intf = conn->domain->interface;
>   	XENSTORE_RING_IDX cons, prod;
>   
> +	if (!intf) {
> +		errno = ENODEV;
> +		return -1;
> +	}
> +
>   	/* Must read indexes once, and before anything else, and verified. */
>   	cons = intf->req_cons;
>   	prod = intf->req_prod;
> @@ -176,6 +186,9 @@ static bool domain_can_write(struct connection *conn)
>   {
>   	struct xenstore_domain_interface *intf = conn->domain->interface;
>   
> +	if (!intf)
> +		return false;
> +

Rather than adding an extra check, how about taking advantage of is_ignore?

>   	return ((intf->rsp_prod - intf->rsp_cons) != XENSTORE_RING_SIZE);
>   }
>   
> @@ -183,7 +196,8 @@ static bool domain_can_read(struct connection *conn)
>   {
>   	struct xenstore_domain_interface *intf = conn->domain->interface;
>   
> -	if (domain_is_unprivileged(conn) && conn->domain->wrl_credit < 0)
> +	if ((domain_is_unprivileged(conn) && conn->domain->wrl_credit < 0) ||
> +	    !intf)
>   		return false;
>   
>   	return (intf->req_cons != intf->req_prod);
> @@ -268,14 +282,7 @@ void check_domains(void)
>   				domain->shutdown = true;
>   				notify = 1;
>   			}
> -			/*
> -			 * On Restore, we may have been unable to remap the
> -			 * interface and the port. As we don't know whether
> -			 * this was because of a dying domain, we need to
> -			 * check if the interface and port are still valid.
> -			 */
> -			if (!dominfo.dying && domain->port &&
> -			    domain->interface)
> +			if (!dominfo.dying)
>   				continue;

This is mostly a revert on "tools/xenstore: handle dying domains in live 
update". However, IIRC, this check was necessary to release the 
connection if the domain has died in the middle of Live-Update.

So I think this check should stick here. Instead, I think, we should 
mark the "fake domain" so we can ignore them here.

>   		}
>   		if (domain->conn) {
> @@ -450,8 +457,6 @@ static struct domain *introduce_domain(const void *ctx,
>   	if (!domain->introduced) {
>   		interface = is_master_domain ? xenbus_map()
>   					     : map_interface(domid);
> -		if (!interface && !restore)
> -			return NULL;
>   		if (new_domain(domain, port, restore)) {
>   			rc = errno;
>   			if (interface) {
> @@ -505,7 +510,8 @@ int do_introduce(struct connection *conn, struct buffered_data *in)
>   	if (!domain)
>   		return errno;
>   
> -	domain_conn_reset(domain);
> +	if (domain->interface)
> +		domain_conn_reset(domain);
>   
>   	send_ack(conn, XS_INTRODUCE);
>   
> 

Cheers,

-- 
Julien Grall

