Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 242B7736ACC
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 13:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551689.861333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZO5-00035u-6O; Tue, 20 Jun 2023 11:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551689.861333; Tue, 20 Jun 2023 11:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZO5-00033q-3U; Tue, 20 Jun 2023 11:19:05 +0000
Received: by outflank-mailman (input) for mailman id 551689;
 Tue, 20 Jun 2023 11:19:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBZO3-00033k-Ns
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 11:19:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBZO2-0003qA-QO; Tue, 20 Jun 2023 11:19:02 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.9.99])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBZO2-0003ex-Kf; Tue, 20 Jun 2023 11:19:02 +0000
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
	bh=SHH86srv9jawORkvd59ZKUzNgVdNxOhvf+loYuzoWsM=; b=RBq4HxVpBKicRVEMIgfH0yBuXD
	XsSD8gv+THG6hPhNR0gPn1Q7hmZe2n7Pheap3fwGSuYuGS3WZ6xczcuE2eTLhr1BQ5Id8uSLnxBEs
	W/W/z7BMXkYRv1ZMkZAodF4USwQBfFzOFiQs9CtfBVW8/TfLCLrgDXmqcLkAIvFvzTTQ=;
Message-ID: <ebd06f1a-722f-e8e6-3040-ee470359bc96@xen.org>
Date: Tue, 20 Jun 2023 12:19:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 03/11] tools/xenstore: let transaction_prepend() return
 the name for access
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-4-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530091333.7678-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 10:13, Juergen Gross wrote:
> Instead of setting the TDB key for accessing the node in the data base,
> let transaction_prepend() return the associated name instead.
> 
> This is in preparation to replace TDB with a more simple data storage.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstore/xenstored_core.c        |  4 +++-
>   tools/xenstore/xenstored_transaction.c | 11 ++++-------
>   tools/xenstore/xenstored_transaction.h |  3 +--
>   3 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index a1d5d4a419..239f8c6bc4 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -694,6 +694,7 @@ struct node *read_node(struct connection *conn, const void *ctx,
>   	TDB_DATA key, data;
>   	struct xs_tdb_record_hdr *hdr;
>   	struct node *node;
> +	const char *db_name;

NIT: At the moment the local variable seems pointless given...

>   	int err;
>   
>   	node = talloc(ctx, struct node);
> @@ -708,7 +709,8 @@ struct node *read_node(struct connection *conn, const void *ctx,
>   		return NULL;
>   	}
>   
> -	transaction_prepend(conn, name, &key);
> +	db_name = transaction_prepend(conn, name);
> +	set_tdb_key(db_name, &key);

... you only use in one place. Will this change in follow-up patch?

Anyway:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

