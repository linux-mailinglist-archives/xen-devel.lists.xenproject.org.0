Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C914161E69A
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 22:39:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439011.692937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ornLT-0000Zf-Sg; Sun, 06 Nov 2022 21:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439011.692937; Sun, 06 Nov 2022 21:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ornLT-0000Xa-Oy; Sun, 06 Nov 2022 21:38:23 +0000
Received: by outflank-mailman (input) for mailman id 439011;
 Sun, 06 Nov 2022 21:38:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ornLR-0000XU-Rh
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 21:38:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ornLQ-0001Ub-Uv; Sun, 06 Nov 2022 21:38:20 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ornLQ-00089Q-P8; Sun, 06 Nov 2022 21:38:20 +0000
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
	bh=cUvG2Gwtx9Eyre7xUa//OC6RIbbH1cRXj0B3AFObs80=; b=1y2k0alcGywyXWMoI7J3fFQLUK
	zy7phSrjl3TIiojGeGAPbjzxxDmRLqxujRj3oUFSMGOV8qEWYEZOZ0xOdQaaMtfOPzPgp/CnKPsby
	GRFf2ZD4fxDZeEKeUg3Xbt1r1+9R0vnr/182HM7BuJg2P2Ha8FfcqpQIzvjJiVXSUyOk=;
Message-ID: <4fb428cb-242f-1ee7-2dd7-cf32b190ebd6@xen.org>
Date: Sun, 6 Nov 2022 21:38:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-10-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 09/20] tools/xenstore: introduce dummy nodes for special
 watch paths
In-Reply-To: <20221101152842.4257-10-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 01/11/2022 15:28, Juergen Gross wrote:
> Instead of special casing the permission handling and watch event
> firing for the special watch paths "@introduceDomain" and
> "@releaseDomain", use static dummy nodes added to the data base when
> starting Xenstore.

A few questions I think needs to be answered in the commit message:
   - Does this means we could write data in "@..."  node?
   - How about creating sub nodes?
   - What does it mean for the accounting? Before, it was accounted to 
no-one but now it seems to be accounted to the owner (which may not be 
dom0).

> 
> This allows to simplify quite some code.

The diff is quite nice to have, but I am not entirely convinced this is 
making the code easier to understand.

Is this patch helping you for another goal?

> 
> Note that this requires to rework the calls of fire_watches() for the
> special events in order to avoid leaking memory.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstore/xenstored_control.c |   3 -
>   tools/xenstore/xenstored_core.c    |  67 +++++++-----
>   tools/xenstore/xenstored_domain.c  | 162 ++++-------------------------
>   tools/xenstore/xenstored_domain.h  |   6 --
>   tools/xenstore/xenstored_watch.c   |  17 +--
>   5 files changed, 63 insertions(+), 192 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
> index d1aaa00bf4..41e6992591 100644
> --- a/tools/xenstore/xenstored_control.c
> +++ b/tools/xenstore/xenstored_control.c
> @@ -676,9 +676,6 @@ static const char *lu_dump_state(const void *ctx, struct connection *conn)
>   	if (ret)
>   		goto out;
>   	ret = dump_state_connections(fp);
> -	if (ret)
> -		goto out;
> -	ret = dump_state_special_nodes(fp);
>   	if (ret)
>   		goto out;
>   	ret = dump_state_nodes(fp, ctx);
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 1650821922..cadb339486 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -616,7 +616,8 @@ static void get_acc_data(TDB_DATA *key, struct node_account_data *acc)
>   static unsigned int get_acc_domid(struct connection *conn, TDB_DATA *key,
>   				  unsigned int domid)
>   {
> -	return (!conn || key->dptr[0] == '/') ? domid : conn->id;
> +	return (!conn || key->dptr[0] == '/' || key->dptr[0] == '@')

The comment above says it is sufficient to check for '/'. But now, you 
are also checking for '@'.

> +	       ? domid : conn->id;
>   }
>   
>   int do_tdb_write(struct connection *conn, TDB_DATA *key, TDB_DATA *data,
> @@ -1780,14 +1781,6 @@ static int do_set_perms(const void *ctx, struct connection *conn,
>   	if (perms.p[0].perms & XS_PERM_IGNORE)
>   		return ENOENT;
>   
> -	/* First arg is node name. */
> -	if (strstarts(in->buffer, "@")) {
> -		if (set_perms_special(conn, in->buffer, &perms))
> -			return errno;
> -		send_ack(conn, XS_SET_PERMS);
> -		return 0;
> -	}

So there are a slight change in behavior here. Before, the permission 
would be directly set even if we are in a transaction. Now, this will 
only be set if the transaction has been committed.

I am split on whether this would be considered as an ABI breakage. The 
new behavior seems better, but anyone rely on the (bogus?) previous 
behavior would have a surprise. At minimum, the change should at least 
be pointed out in the commit message.

[...]

>   static int domain_tree_remove_sub(const void *ctx, struct connection *conn,
>   				  struct node *node, void *arg)
>   {
> @@ -297,8 +273,24 @@ static void domain_tree_remove(struct domain *domain)
>   			       "error when looking for orphaned nodes\n");
>   	}
>   
> -	remove_domid_from_perm(&dom_release_perms, domain);
> -	remove_domid_from_perm(&dom_introduce_perms, domain);
> +	walk_node_tree(domain, NULL, "@releaseDomain", &walkfuncs, domain);
> +	walk_node_tree(domain, NULL, "@introduceDomain", &walkfuncs, domain);
> +}
> +
> +static void fire_special_watches(const char *name)
> +{
> +	void *ctx = talloc_new(NULL);
> +	struct node *node;

I can foresee how one may want to abuse for this function. So I would 
add an assert(name[0] == '@') to match clear this should only for 
watches starting with '@'.

> +
> +	if (!ctx)
> +		return;
> +
> +	node = read_node(NULL, ctx, name);
> +
> +	if (node)
> +		fire_watches(NULL, ctx, name, node, true, NULL);

Shouldn't we throw a message if we can't retrieve @...?

Cheers,

-- 
Julien Grall

