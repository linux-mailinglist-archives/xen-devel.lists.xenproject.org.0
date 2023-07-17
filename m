Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA2B756F0F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 23:41:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564861.882600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLVxZ-0007ij-Na; Mon, 17 Jul 2023 21:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564861.882600; Mon, 17 Jul 2023 21:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLVxZ-0007h4-Km; Mon, 17 Jul 2023 21:40:49 +0000
Received: by outflank-mailman (input) for mailman id 564861;
 Mon, 17 Jul 2023 21:40:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qLVxX-0007gy-Rr
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 21:40:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLVxW-00041j-RR; Mon, 17 Jul 2023 21:40:46 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLVxW-0000aQ-LA; Mon, 17 Jul 2023 21:40:46 +0000
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
	bh=LEj/+BmcgpJrKV+CFhomaeEd1/O5kI/2Eyv9HxX8JFw=; b=qOUR8gkVZIVB5d6/u15eVww9on
	kJvCOVwoHYidSPMx9tEINbSyxJxbezv77S+uu4TwJjgXoBF62S9gfDVpckTZzxVd6kl5a42XI7RbF
	0uA1RF8PQdM486o4yhkclWxX5fhXcS+HKsAF+f4GKErLeCIhckxekr4PWVcEqSPpi048=;
Message-ID: <b8220443-3d9a-671f-b18e-011a761bc771@xen.org>
Date: Mon, 17 Jul 2023 22:40:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230710065947.4201-1-jgross@suse.com>
 <20230710065947.4201-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 01/18] tools/xenstore: explicitly specify create or
 modify for tdb_store()
In-Reply-To: <20230710065947.4201-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/07/2023 07:59, Juergen Gross wrote:
> Instead of using TDB_REPLACE for either creating or modifying a TDB
> entry, use either TDB_INSERT or TDB_MODIFY when calling tdb_store().
> 
> At higher function levels use the abstract flag values NODE_CREATE

Were you meant to replace 'flag' with 'mode'?

[...]

> diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
> index 334f1609f1..0655073de7 100644
> --- a/tools/xenstore/xenstored_transaction.c
> +++ b/tools/xenstore/xenstored_transaction.c
> @@ -290,7 +290,8 @@ int access_node(struct connection *conn, struct node *node,
>   			i->check_gen = true;
>   			if (node->generation != NO_GENERATION) {
>   				set_tdb_key(i->trans_name, &local_key);
> -				ret = write_node_raw(conn, &local_key, node, true);
> +				ret = write_node_raw(conn, &local_key, node,
> +						     NODE_CREATE, true);
>   				if (ret)
>   					goto err;
>   				i->ta_node = true;
> @@ -363,6 +364,7 @@ static int finalize_transaction(struct connection *conn,
>   	TDB_DATA key, ta_key, data;
>   	struct xs_tdb_record_hdr *hdr;
>   	uint64_t gen;
> +	int flag;

I think this should be 'enum write_node_mode mode'. Also, can't the 
variable be defined a bit below in the if ( ... )?

>   
>   	list_for_each_entry_safe(i, n, &trans->accessed, list) {
>   		if (i->check_gen) {
> @@ -405,8 +407,10 @@ static int finalize_transaction(struct connection *conn,
>   					  ta_key.dsize + data.dsize);
>   				hdr = (void *)data.dptr;
>   				hdr->generation = ++generation;
> +				flag = (i->generation == NO_GENERATION)
> +				       ? NODE_CREATE : NODE_MODIFY;
>   				*is_corrupt |= do_tdb_write(conn, &key, &data,
> -							    NULL, true);
> +							    NULL, flag, true);
>   				talloc_free(data.dptr);
>   				if (do_tdb_delete(conn, &ta_key, NULL))
>   					*is_corrupt = true;

Cheers,

-- 
Julien Grall

