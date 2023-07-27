Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFDC765E4A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 23:34:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571273.894735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP8cB-0000DI-Bi; Thu, 27 Jul 2023 21:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571273.894735; Thu, 27 Jul 2023 21:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP8cB-0000AU-8n; Thu, 27 Jul 2023 21:33:43 +0000
Received: by outflank-mailman (input) for mailman id 571273;
 Thu, 27 Jul 2023 21:33:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qP8c9-0000AO-9a
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 21:33:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qP8c8-0000Ld-4h; Thu, 27 Jul 2023 21:33:40 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qP8c7-0001ls-VM; Thu, 27 Jul 2023 21:33:40 +0000
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
	bh=cohKhqqDMS3ElVfBhQaGl3qoieADsThFpabz7Ql1bGQ=; b=ys55/4UIPJvY0TjKZDNFrCA496
	2/9oSXiTrv/JZpYHtOxbQmLvwRSVJ8nMguJXCMfCwk/LFDNsQ+Ju91mq8B1wnxrUeYGC5E70GThYP
	/KLXKmkxHEteeocK59PxwAjKbRibP/DvGESWMnJyP3+6OVFVMP9Bx3Ht1L7vICjDjjCY=;
Message-ID: <85b2d6a2-b9ee-4c8a-3a7a-cb22934af825@xen.org>
Date: Thu, 27 Jul 2023 22:33:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-17-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 16/25] tools/xenstore: move copying of node data out of
 db_fetch()
In-Reply-To: <20230724110247.10520-17-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 24/07/2023 12:02, Juergen Gross wrote:
> Today the node data is copied in db_fetch() on each data base read in
> order to avoid accidental data base modifications when working on a
> node.
> 
> read_node() is the only caller of db_fetch() which isn't freeing the
> returned data area immediately after using it. The other callers don't
> modify the returned data, so they don't need the data to be copied.
> 
> Move copying of the data into read_node(), resulting in a speedup of
> the other callers due to no memory allocation and no copying being
> needed anymore.
> 
> This allows to let db_fetch() return a pointer to const data.
> 
> As db_fetch() can't return any error other than ENOENT now, error
> handling for the callers can be simplified.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - new patch
> V3:
> - modify return type of db_fetch() to return a pointer to const
>    (Julien Grall)
> - drop stale comment (Julien Grall)
> - fix transaction handling
> ---
>   tools/xenstore/xenstored_core.c        | 45 +++++++++++---------------
>   tools/xenstore/xenstored_core.h        |  2 +-
>   tools/xenstore/xenstored_transaction.c | 23 +++++++++----
>   3 files changed, 35 insertions(+), 35 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 9f88914149..1f5f118f1c 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -555,10 +555,9 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
>   	}
>   }
>   
> -struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size)
> +const struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size)
>   {
> -	const struct xs_tdb_record_hdr *hdr;
> -	struct xs_tdb_record_hdr *p;
> +	struct xs_tdb_record_hdr *hdr;

Can't 'hdr' stay const?

>   
>   	hdr = hashtable_search(nodes, db_name);
>   	if (!hdr) {

[...]

> @@ -388,14 +385,26 @@ static int finalize_transaction(struct connection *conn,
>   		if (i->ta_node) {
>   			hdr = db_fetch(i->trans_name, &size);
>   			if (hdr) {
> +				/*
> +				 * Delete transaction entry and write it as
> +				 * no-TA entry. As we only hold a reference
> +				 * to the data, increment its ref count, then
> +				 * delete it from the DB. Now we own it and can
> +				 * drop the const attribute for changing the

It is not great, but I understand this is another necessary evil. So I 
am ok with this cast-away const. It is also well documented.

> +				 * generation count.
> +				 */
>   				enum write_node_mode mode;
> +				struct xs_tdb_record_hdr *own;
>   
> -				hdr->generation = ++generation;
> +				talloc_increase_ref_count(hdr);
> +				db_delete(conn, i->trans_name, NULL);
> +
> +				own = (struct xs_tdb_record_hdr *)hdr;
> +				own->generation = ++generation;
>   				mode = (i->generation == NO_GENERATION)
>   				       ? NODE_CREATE : NODE_MODIFY;
> -				*is_corrupt |= db_write(conn, i->node, hdr,
> +				*is_corrupt |= db_write(conn, i->node, own,
>   							size, NULL, mode, true);
> -				db_delete(conn, i->trans_name, NULL);
>   			} else {
>   				*is_corrupt = true;
>   			}

Cheers,

-- 
Julien Grall

