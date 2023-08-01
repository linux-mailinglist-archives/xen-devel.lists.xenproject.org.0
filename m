Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6F876BF4C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 23:29:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574539.899902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQwvx-00024D-Iw; Tue, 01 Aug 2023 21:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574539.899902; Tue, 01 Aug 2023 21:29:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQwvx-00021V-G8; Tue, 01 Aug 2023 21:29:37 +0000
Received: by outflank-mailman (input) for mailman id 574539;
 Tue, 01 Aug 2023 21:29:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qQwvv-00021P-QP
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 21:29:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qQwvu-00007d-Vm; Tue, 01 Aug 2023 21:29:34 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qQwvu-0001JL-Pz; Tue, 01 Aug 2023 21:29:34 +0000
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
	bh=mWg3GZe2EMYm8jv+TPe6s28ff4x2p+sSJJfNamkRpVI=; b=J1+xlsNLJb81lUGUEsGg5VR+O0
	/GTVpweTIpoIAyuzkPYiKI6EBskx1bpFiILDUmgyV+02NF4TtHW3ldFNqECOWA7oEwo/cOxqWaQ8t
	r9ZnZutmfvjKmct7bR+mvl6JVSo7ROtZNmQ6vAuaBg9ASbHnKeL7ji+NARpYex44nycU=;
Message-ID: <41f92dc6-7d3f-9342-5521-cdb99d8ee405@xen.org>
Date: Tue, 1 Aug 2023 22:29:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-19-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 18/25] tools/xenstore: don't use struct node_perms in
 struct node
In-Reply-To: <20230724110247.10520-19-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 24/07/2023 12:02, Juergen Gross wrote:
> Open code struct node_perms in struct node in order to prepare using
> struct node_hdr in struct node.
> 
> Add two helpers to transfer permissions between struct node and struct
> node_perms.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - new patch
> ---
>   tools/xenstore/xenstored_core.c        | 76 ++++++++++++++------------
>   tools/xenstore/xenstored_core.h        | 21 ++++++-
>   tools/xenstore/xenstored_domain.c      | 13 ++---
>   tools/xenstore/xenstored_transaction.c |  8 +--
>   tools/xenstore/xenstored_watch.c       |  7 ++-
>   5 files changed, 75 insertions(+), 50 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 86b7c9bf36..c72fc0c725 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -735,7 +735,7 @@ struct node *read_node(struct connection *conn, const void *ctx,
>   
>   	/* Datalen, childlen, number of permissions */
>   	node->generation = hdr->generation;
> -	node->perms.num = hdr->num_perms;
> +	node->num_perms = hdr->num_perms;
>   	node->datalen = hdr->datalen;
>   	node->childlen = hdr->childlen;
>   	node->acc.domid = perms_from_node_hdr(hdr)->id;
> @@ -743,8 +743,8 @@ struct node *read_node(struct connection *conn, const void *ctx,
>   
>   	/* Copy node data to new memory area, starting with permissions. */
>   	size -= sizeof(*hdr);
> -	node->perms.p = talloc_memdup(node, perms_from_node_hdr(hdr), size);
> -	if (node->perms.p == NULL) {
> +	node->perms = talloc_memdup(node, perms_from_node_hdr(hdr), size);
> +	if (node->perms == NULL) {
>   		errno = ENOMEM;
>   		goto error;
>   	}
> @@ -757,7 +757,7 @@ struct node *read_node(struct connection *conn, const void *ctx,
>   		node->acc.memory = 0;
>   
>   	/* Data is binary blob (usually ascii, no nul). */
> -	node->data = node->perms.p + hdr->num_perms;
> +	node->data = node->perms + hdr->num_perms;
>   	/* Children is strings, nul separated. */
>   	node->children = node->data + node->datalen;
>   
> @@ -796,7 +796,7 @@ int write_node_raw(struct connection *conn, const char *db_name,
>   		return errno;
>   
>   	size = sizeof(*hdr)
> -		+ node->perms.num * sizeof(node->perms.p[0])
> +		+ node->num_perms * sizeof(node->perms[0])
>   		+ node->datalen + node->childlen;
>   
>   	/* Call domain_max_chk() in any case in order to record max values. */
> @@ -813,13 +813,13 @@ int write_node_raw(struct connection *conn, const char *db_name,
>   
>   	hdr = data;
>   	hdr->generation = node->generation;
> -	hdr->num_perms = node->perms.num;
> +	hdr->num_perms = node->num_perms;
>   	hdr->datalen = node->datalen;
>   	hdr->childlen = node->childlen;
>   
>   	p = perms_from_node_hdr(hdr);
> -	memcpy(p, node->perms.p, node->perms.num * sizeof(*node->perms.p));
> -	p += node->perms.num * sizeof(*node->perms.p);
> +	memcpy(p, node->perms, node->num_perms * sizeof(*node->perms));
> +	p += node->num_perms * sizeof(*node->perms);
>   	memcpy(p, node->data, node->datalen);
>   	p += node->datalen;
>   	memcpy(p, node->children, node->childlen);
> @@ -900,6 +900,7 @@ static int ask_parents(struct connection *conn, const void *ctx,
>   		       const char *name, unsigned int *perm)
>   {
>   	struct node *node;
> +	struct node_perms perms;
>   
>   	do {
>   		name = get_parent(ctx, name);
> @@ -919,7 +920,8 @@ static int ask_parents(struct connection *conn, const void *ctx,
>   		return 0;
>   	}
>   
> -	*perm = perm_for_conn(conn, &node->perms);
> +	node_to_node_perms(node, &perms);
> +	*perm = perm_for_conn(conn, &perms);

This seems to be a common pattern. Can you introduce a wrapper?

>   	return 0;
>   }
>   
> @@ -956,11 +958,13 @@ static struct node *get_node(struct connection *conn,
>   			     unsigned int perm)
>   {
>   	struct node *node;
> +	struct node_perms perms;
>   
>   	node = read_node(conn, ctx, name);
>   	/* If we don't have permission, we don't have node. */
>   	if (node) {
> -		if ((perm_for_conn(conn, &node->perms) & perm) != perm) {
> +		node_to_node_perms(node, &perms);
> +		if ((perm_for_conn(conn, &perms) & perm) != perm) {
>   			errno = EACCES;
>   			node = NULL;
>   		}
> @@ -1434,14 +1438,14 @@ static struct node *construct_node(struct connection *conn, const void *ctx,
>   		node->name = talloc_steal(node, names[levels - 1]);
>   
>   		/* Inherit permissions, unpriv domains own what they create. */
> -		node->perms.num = parent->perms.num;
> -		node->perms.p = talloc_memdup(node, parent->perms.p,
> -					      node->perms.num *
> -					      sizeof(*node->perms.p));
> -		if (!node->perms.p)
> +		node->num_perms = parent->num_perms;
> +		node->perms = talloc_memdup(node, parent->perms,
> +					    node->num_perms *
> +					    sizeof(*node->perms));
> +		if (!node->perms)
>   			goto nomem;
>   		if (domain_is_unprivileged(conn))
> -			node->perms.p[0].id = conn->id;
> +			node->perms[0].id = conn->id;
>   
>   		/* No children, no data */
>   		node->children = node->data = NULL;
> @@ -1764,12 +1768,14 @@ static int do_get_perms(const void *ctx, struct connection *conn,
>   	struct node *node;
>   	char *strings;
>   	unsigned int len;
> +	struct node_perms perms;
>   
>   	node = get_spec_node(conn, ctx, onearg(in), NULL, XS_PERM_READ);
>   	if (!node)
>   		return errno;
>   
> -	strings = perms_to_strings(node, &node->perms, &len);
> +	node_to_node_perms(node, &perms);
> +	strings = perms_to_strings(node, &perms, &len);

This is the only user of perms_to_strings(). So can we just pass the 
node rather than the perms? This would avoid the call to 
node_to_node_perms().

>   	if (!strings)
>   		return errno;
>   
> @@ -1818,10 +1824,10 @@ static int do_set_perms(const void *ctx, struct connection *conn,
>   	    perms.p[0].id != get_node_owner(node))
>   		return EPERM;
>   
> -	old_perms = node->perms;
> +	node_to_node_perms(node, &old_perms);
>   	if (domain_nbentry_dec(conn, get_node_owner(node)))
>   		return ENOMEM;
> -	node->perms = perms;
> +	node_perms_to_node(&perms, node);
>   	if (domain_nbentry_inc(conn, get_node_owner(node)))
>   		return ENOMEM;

Cheers,

-- 
Julien Grall

