Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7B276BF7B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 23:46:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574549.899922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQxC1-00056q-9l; Tue, 01 Aug 2023 21:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574549.899922; Tue, 01 Aug 2023 21:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQxC1-00053s-77; Tue, 01 Aug 2023 21:46:13 +0000
Received: by outflank-mailman (input) for mailman id 574549;
 Tue, 01 Aug 2023 21:46:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qQxBz-00053m-PA
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 21:46:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qQxBy-0000OY-R9; Tue, 01 Aug 2023 21:46:10 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qQxBy-00024c-M1; Tue, 01 Aug 2023 21:46:10 +0000
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
	bh=DfN7B1+PFgLt4NmDJOm3OKQ0rnGv+Wa/Cy3yHVp9wdw=; b=mKh8ahpKfBKWs9GK2R+scYK/4V
	LaCr05ldOgZxVh52+rBO06dKQ4wm1XsWJ7pcs9ILGBIygSYruJ9B/H8RaEG68vqRu7XOTqfWSOvtE
	tRIOMF+EzVrpSqwsXqdzHXCv19KMzf6SMMjMGXAKfx7nEdsbsZPKjbp8umdaBNA19xug=;
Message-ID: <eee34bcc-2937-4a1f-b326-4a21c9db2173@xen.org>
Date: Tue, 1 Aug 2023 22:46:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-21-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 20/25] tools/xenstore: alloc new memory in
 domain_adjust_node_perms()
In-Reply-To: <20230724110247.10520-21-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 24/07/2023 12:02, Juergen Gross wrote:
> In order to avoid modifying the node data in the data base in case a
> domain is gone, let domain_adjust_node_perms() allocate new memory for
> the permissions in case they need to be modified. As this should
> happen only in very rare cases, it is fine to do this even when having
> copied the node data already.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V3:
> - new patch
> ---
>   tools/xenstore/xenstored_core.c   | 10 +++++-----
>   tools/xenstore/xenstored_domain.c | 19 +++++++++++++++----
>   2 files changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 404ecd0c62..ea3d20a372 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -751,6 +751,11 @@ struct node *read_node(struct connection *conn, const void *ctx,
>   		goto error;
>   	}
>   
> +	/* Data is binary blob (usually ascii, no nul). */
> +	node->data = node->perms + hdr->num_perms;
> +	/* Children is strings, nul separated. */
> +	node->children = node->data + node->hdr.datalen;
> +

It took me a while to understand why you move the lines above. I tihnk 
it would be worth documenting in the code (possibly on top of the 
declaration domain_adjust_node_perms()) that domain_adjust_node_perms() 
may re-allocate the permissions.

>   	if (domain_adjust_node_perms(node))
>   		goto error;
>   
> @@ -758,11 +763,6 @@ struct node *read_node(struct connection *conn, const void *ctx,
>   	if (node->acc.domid != get_node_owner(node))
>   		node->acc.memory = 0;
>   
> -	/* Data is binary blob (usually ascii, no nul). */
> -	node->data = node->perms + hdr->num_perms;
> -	/* Children is strings, nul separated. */
> -	node->children = node->data + node->hdr.datalen;
> -
>   	if (access_node(conn, node, NODE_ACCESS_READ, NULL))
>   		goto error;
>   
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index fdf1095acb..cdef6efef4 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -1334,13 +1334,24 @@ int domain_alloc_permrefs(struct node_perms *perms)
>   int domain_adjust_node_perms(struct node *node)
>   {
>   	unsigned int i;
> +	struct xs_permissions *perms = node->perms;
> +	bool copied = false;
>   
>   	for (i = 1; i < node->hdr.num_perms; i++) {
> -		if (node->perms[i].perms & XS_PERM_IGNORE)
> +		if ((perms[i].perms & XS_PERM_IGNORE) ||
> +		    chk_domain_generation(perms[i].id, node->hdr.generation))
>   			continue;
> -		if (!chk_domain_generation(node->perms[i].id,
> -					   node->hdr.generation))
> -			node->perms[i].perms |= XS_PERM_IGNORE;
> +
> +		if (!copied) {

This wants a coment explain why you need to copy it.

> +			perms = talloc_memdup(node, node->perms,
> +					node->hdr.num_perms * sizeof(*perms));
> +			if (!perms)
> +				return ENOMEM;
> +			node->perms = perms;
> +			copied = true;
> +		}
> +
> +		perms[i].perms |= XS_PERM_IGNORE;
>   	}
>   
>   	return 0;

Cheers,

-- 
Julien Grall

