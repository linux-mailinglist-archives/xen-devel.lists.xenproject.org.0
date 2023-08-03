Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C6076F4CC
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 23:47:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576635.902989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRg9S-0007kD-3v; Thu, 03 Aug 2023 21:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576635.902989; Thu, 03 Aug 2023 21:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRg9S-0007hG-12; Thu, 03 Aug 2023 21:46:34 +0000
Received: by outflank-mailman (input) for mailman id 576635;
 Thu, 03 Aug 2023 21:46:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRg9Q-0007hA-EF
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 21:46:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRg9P-0002lt-6C; Thu, 03 Aug 2023 21:46:31 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRg9O-0000ai-VN; Thu, 03 Aug 2023 21:46:31 +0000
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
	bh=UI+XY8c1yZmkOGX+ChwuPScO0M2akPMjAXHhbUROwUg=; b=0ZzXJPzPtI2pi6XZDkmuiD3srk
	vBWC0lNF6PlaJXl7o/d+z4yO6vkg5yk0qoQpPRN/Qz57bJ/kOFomwDJYhpMMxUFYA+pn0VQ47Busi
	qyXF06sKSiYjalcnHHxFyZiSmrbTNGFWSxrUnFs6VS2J1tJ6z1T7PDebK5tX4KSNSH0M=;
Message-ID: <dab986c3-e875-75a9-849c-954fb84edff7@xen.org>
Date: Thu, 3 Aug 2023 22:46:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-24-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 23/25] tools/xenstore: merge is_valid_nodename() into
 canonicalize()
In-Reply-To: <20230724110247.10520-24-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/07/2023 12:02, Juergen Gross wrote:
> Today is_valid_nodename() is always called directly after calling
> canonicalize(), with the exception of do_unwatch(), where the call
> is missing (which is not correct, but results just in a wrong error
> reason being returned).

While this change makes sense...

> 
> Merge is_valid_nodename() into canonicalize(). While at it merge
> valid_chars() into it, too.

... I am not in favor of folding the code is_valid_nodename() and 
valid_chars() into canonicalize() because the code is now more difficult 
to read. Also, the keeping the split would allow to free the 'name' in 
case of an error without adding too much goto in the code.

> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V3:
> - new patch
> ---
>   tools/xenstore/xenstored_core.c  | 89 ++++++++++++++------------------
>   tools/xenstore/xenstored_core.h  |  6 +--
>   tools/xenstore/xenstored_watch.c | 16 ++----
>   3 files changed, 45 insertions(+), 66 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index ea5a1a9cce..ec20bc042d 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -1210,42 +1210,6 @@ void send_ack(struct connection *conn, enum xsd_sockmsg_type type)
>   	send_reply(conn, type, "OK", sizeof("OK"));
>   }
>   
> -static bool valid_chars(const char *node)
> -{
> -	/* Nodes can have lots of crap. */
> -	return (strspn(node,
> -		       "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
> -		       "abcdefghijklmnopqrstuvwxyz"
> -		       "0123456789-/_@") == strlen(node));
> -}
> -
> -bool is_valid_nodename(const struct connection *conn, const char *node,
> -		       bool allow_special)
> -{
> -	int local_off = 0;
> -	unsigned int domid;
> -
> -	/* Must start in / or - if special nodes are allowed - in @. */
> -	if (!strstarts(node, "/") && (!allow_special || !strstarts(node, "@")))
> -		return false;
> -
> -	/* Cannot end in / (unless it's just "/"). */
> -	if (strends(node, "/") && !streq(node, "/"))
> -		return false;
> -
> -	/* No double //. */
> -	if (strstr(node, "//"))
> -		return false;
> -
> -	if (sscanf(node, "/local/domain/%5u/%n", &domid, &local_off) != 1)
> -		local_off = 0;
> -
> -	if (domain_max_chk(conn, ACC_PATHLEN, strlen(node) - local_off))
> -		return false;
> -
> -	return valid_chars(node);
> -}
> -
>   /* We expect one arg in the input: return NULL otherwise.
>    * The payload must contain exactly one nul, at the end.
>    */
> @@ -1279,16 +1243,46 @@ static char *perms_to_strings(const void *ctx, const struct node_perms *perms,
>   }
>   
>   const char *canonicalize(struct connection *conn, const void *ctx,
> -			 const char *node)
> +			 const char *node, bool allow_special)
>   {
> -	const char *prefix;
> +	char *name;
> +	int local_off = 0;
> +	unsigned int domid;
>   
> -	if (!node || (node[0] == '/') || (node[0] == '@'))
> -		return node;
> -	prefix = get_implicit_path(conn);
> -	if (prefix)
> -		return talloc_asprintf(ctx, "%s/%s", prefix, node);
> -	return node;
> +	errno = EINVAL;
> +	if (!node)
> +		return NULL;
> +
> +	if (strspn(node, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
> +			 "0123456789-/_@") != strlen(node))
> +		return NULL;
> +
> +	if (node[0] == '@' && !allow_special)
> +		return NULL;
> +
> +	if (node[0] != '/' && node[0] != '@') {
> +		name = talloc_asprintf(ctx, "%s/%s", get_implicit_path(conn),
> +				       node);

This is allocated but not freed on error. I understand this is part of 
the 'ctxt' and therefore will be free later on. But this means temporary 
memory will be allocated for longer. So best to clean-up when you can.

> +		if (!name)
> +			return NULL;
> +	} else
> +		name = (char *)node;

Why does name need to be const?

> +
> +	/* Cannot end in / (unless it's just "/"). */
> +	if (strends(name, "/") && !streq(name, "/"))
> +		return NULL;
> +
> +	/* No double //. */
> +	if (strstr(name, "//"))
> +		return NULL;
> +
> +	if (sscanf(name, "/local/domain/%5u/%n", &domid, &local_off) != 1)
> +		local_off = 0;
> +
> +	if (domain_max_chk(conn, ACC_PATHLEN, strlen(name) - local_off))
> +		return NULL;
> +
> +	return name;
>   }

Cheers,

-- 
Julien Grall

