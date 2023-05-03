Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E78DF6F588E
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 15:08:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529213.823359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puCDI-00050Z-Jx; Wed, 03 May 2023 13:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529213.823359; Wed, 03 May 2023 13:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puCDI-0004yJ-HC; Wed, 03 May 2023 13:08:08 +0000
Received: by outflank-mailman (input) for mailman id 529213;
 Wed, 03 May 2023 13:08:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1puCDG-0004yB-NV
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 13:08:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puCDF-0002mb-Vj; Wed, 03 May 2023 13:08:05 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puCDF-0003zY-PD; Wed, 03 May 2023 13:08:05 +0000
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
	bh=YtF1M7NzKn1kvI4rH1OiF33P+f9VuzkgDiqImSOPZ5g=; b=twKI5E1Z5r7GYXTFVie4BcJYus
	/0FFJdFrAHh/OudyAVF9ZcYwMwZmFFjcPFaG9DuZkb+uygS7v6M5g8+D7JwJkF1cER3lZCIG2Kc2U
	x4XJForuSvE4COwaBet9eeEvDAETZa0VJkPWC9CXOVIf4nJ4lbE/OWMlFFyqUAPE8bqE=;
Message-ID: <f6af4f23-cd32-51b9-b805-6bfb114f3468@xen.org>
Date: Wed, 3 May 2023 14:08:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 08/13] tools/xenstore: remove unused events list
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230330085011.9170-1-jgross@suse.com>
 <20230330085011.9170-9-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230330085011.9170-9-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/03/2023 09:50, Juergen Gross wrote:
> struct watch contains an used struct list_head events. Remove it.

Typo: s/used/unused/?

> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   tools/xenstore/xenstored_watch.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
> index e8eb35de02..4195c59e17 100644
> --- a/tools/xenstore/xenstored_watch.c
> +++ b/tools/xenstore/xenstored_watch.c
> @@ -36,9 +36,6 @@ struct watch
>   	/* Watches on this connection */
>   	struct list_head list;
>   
> -	/* Current outstanding events applying to this watch. */
> -	struct list_head events;
> -
>   	/* Offset into path for skipping prefix (used for relative paths). */
>   	unsigned int prefix_len;
>   
> @@ -205,8 +202,6 @@ static struct watch *add_watch(struct connection *conn, char *path, char *token,
>   
>   	watch->prefix_len = relative ? strlen(get_implicit_path(conn)) + 1 : 0;
>   
> -	INIT_LIST_HEAD(&watch->events);
> -
>   	domain_watch_inc(conn);
>   	list_add_tail(&watch->list, &conn->watches);
>   	talloc_set_destructor(watch, destroy_watch);

-- 
Julien Grall

