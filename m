Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E659652725
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 20:39:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467296.726342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7iSF-00012f-NT; Tue, 20 Dec 2022 19:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467296.726342; Tue, 20 Dec 2022 19:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7iSF-0000zw-KY; Tue, 20 Dec 2022 19:39:11 +0000
Received: by outflank-mailman (input) for mailman id 467296;
 Tue, 20 Dec 2022 19:39:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p7iSE-0000zq-6X
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 19:39:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7iSD-0002Hy-JN; Tue, 20 Dec 2022 19:39:09 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.6.189]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7iSD-0006oC-DV; Tue, 20 Dec 2022 19:39:09 +0000
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
	bh=KzVOYLORrB1biVgwrtDX7C5C9Ii7NiK98O9QDWPzOC8=; b=3jdT8/LMfO1JzvUzB6KhLs2vkD
	ZPLtS7E8FrMpFZqLQR088F6+pa3j2eiOLp3kqYmLZtnTB1M3yR1xVrSFdlREYYxiaoxuli0akFvKl
	/WBGXRWrWOZ0uwy8p0TZKg9BLp/7p52CI7op8leZLgHJaYlqN2eaSJ8u9RzWlbDjizew=;
Message-ID: <ef0ed925-5c07-a5c2-c7e6-f5a8ad21d480@xen.org>
Date: Tue, 20 Dec 2022 19:39:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 07/19] tools/xenstore: introduce dummy nodes for
 special watch paths
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-8-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221213160045.28170-8-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 13/12/2022 16:00, Juergen Gross wrote:
> Instead of special casing the permission handling and watch event
> firing for the special watch paths "@introduceDomain" and
> "@releaseDomain", use static dummy nodes added to the data base when
> starting Xenstore.
> 
> The node accounting needs to reflect that change by adding the special
> nodes in the domain_entry_fix() call in setup_structure().
> 
> Note that this requires to rework the calls of fire_watches() for the
> special events in order to avoid leaking memory.
> 
> Move the check for a valid node name from get_node() to
> get_node_canonicalized(), as it allows to use get_node() for the
> special nodes, too.
> 
> In order to avoid read and write accesses to the special nodes use a
> special variant for obtaining the current node data for the permission
> handling.
> 
> This allows to simplify quite some code. In future sub-nodes of the
> special nodes will be possible due to this change, allowing more fine
> grained permission control of special events for specific domains.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - add get_spec_node()
> - expand commit message (Julien Grall)
> ---
>   tools/xenstore/xenstored_control.c |   3 -
>   tools/xenstore/xenstored_core.c    |  92 +++++++++-------
>   tools/xenstore/xenstored_domain.c  | 162 ++++-------------------------
>   tools/xenstore/xenstored_domain.h  |   6 --
>   tools/xenstore/xenstored_watch.c   |  17 +--
>   5 files changed, 80 insertions(+), 200 deletions(-)
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
> index 1650821922..f96714e1b8 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -616,7 +616,8 @@ static void get_acc_data(TDB_DATA *key, struct node_account_data *acc)
>   static unsigned int get_acc_domid(struct connection *conn, TDB_DATA *key,
>   				  unsigned int domid)
>   {
> -	return (!conn || key->dptr[0] == '/') ? domid : conn->id;
> +	return (!conn || key->dptr[0] == '/' || key->dptr[0] == '@')

The comment on top of get_acc_domid() needs to be updated.

> +	       ? domid : conn->id;
>   }
>   

[...]

> +static void fire_special_watches(const char *name)
> +{
> +	void *ctx = talloc_new(NULL);
> +	struct node *node;
> +
> +	if (!ctx)
> +		return;
> +
> +	node = read_node(NULL, ctx, name);
> +
> +	if (node)
> +		fire_watches(NULL, ctx, name, node, true, NULL);

NIT: I would consider to log an error (maybe only once) if 'node' is 
NULL. The purpose is to help debugging Xenstored.

The rest of the code LGTM.

Cheers,

-- 
Julien Grall

