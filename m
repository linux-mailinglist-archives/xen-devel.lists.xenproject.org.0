Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E7965273D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 20:43:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467305.726355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7iVs-0002S5-7X; Tue, 20 Dec 2022 19:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467305.726355; Tue, 20 Dec 2022 19:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7iVs-0002Og-4h; Tue, 20 Dec 2022 19:42:56 +0000
Received: by outflank-mailman (input) for mailman id 467305;
 Tue, 20 Dec 2022 19:42:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p7iVr-0002Oa-4S
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 19:42:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7iVq-0002MG-IB; Tue, 20 Dec 2022 19:42:54 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.6.189]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7iVq-0006wp-CP; Tue, 20 Dec 2022 19:42:54 +0000
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
	bh=mauql0ZoFN4HSE4xfBRZXKTPReS0OVJrHE4bGkOrNNM=; b=QjTzrj8HGZaE0TURfsn3PFmd74
	Jy1a9k2ncfsy8KFt6wLf/mw0JGFcIogeHXTsJnrXR09TetaO/koG6Is74ENvK4dueO2KcQPFeK6oI
	wJxFDyGsvyYct9wIYGPRf6fs83IBKPWK1lPgwNBxhUMY8mtt0MNTqmr8ihj0VjCdzwRw=;
Message-ID: <f8ae2b41-50e2-1c36-26e0-cdc0d54bd45d@xen.org>
Date: Tue, 20 Dec 2022 19:42:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 08/19] tools/xenstore: replace watch->relative_path
 with a prefix length
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-9-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221213160045.28170-9-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 13/12/2022 16:00, Juergen Gross wrote:
> @@ -313,19 +302,19 @@ const char *dump_state_watches(FILE *fp, struct connection *conn,
>   			       unsigned int conn_id)
>   {
>   	const char *ret = NULL;
> +	const char *watch_path;
>   	struct watch *watch;
>   	struct xs_state_watch sw;
>   	struct xs_state_record_header head;
> -	const char *path;
>   
>   	head.type = XS_STATE_TYPE_WATCH;
>   
>   	list_for_each_entry(watch, &conn->watches, list) {
>   		head.length = sizeof(sw);
>   
> +		watch_path = get_watch_path(watch, watch->node);

It is not clear to me why you call get_watch_path() earlier and also 
rename the variable.

I don't mind the new name, but it doesn't feel like it belongs to this 
patch as the code in duymp_state_watches() would not be changed otherwise.

Cheers,

>   		sw.conn_id = conn_id;
> -		path = get_watch_path(watch, watch->node);
> -		sw.path_length = strlen(path) + 1;
> +		sw.path_length = strlen(watch_path) + 1;
>   		sw.token_length = strlen(watch->token) + 1;
>   		head.length += sw.path_length + sw.token_length;
>   		head.length = ROUNDUP(head.length, 3);
> @@ -334,7 +323,7 @@ const char *dump_state_watches(FILE *fp, struct connection *conn,
>   		if (fwrite(&sw, sizeof(sw), 1, fp) != 1)
>   			return "Dump watch state error";
>   
> -		if (fwrite(path, sw.path_length, 1, fp) != 1)
> +		if (fwrite(watch_path, sw.path_length, 1, fp) != 1)
>   			return "Dump watch path error";
>   		if (fwrite(watch->token, sw.token_length, 1, fp) != 1)
>   			return "Dump watch token error";

Cheers,

-- 
Julien Grall

