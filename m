Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5AE387939
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 14:53:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129176.242495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lizCq-0006El-IC; Tue, 18 May 2021 12:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129176.242495; Tue, 18 May 2021 12:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lizCq-0006CV-En; Tue, 18 May 2021 12:52:16 +0000
Received: by outflank-mailman (input) for mailman id 129176;
 Tue, 18 May 2021 12:52:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lizCo-0006CP-QR
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 12:52:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lizCn-0002q3-PP; Tue, 18 May 2021 12:52:13 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lizCn-0004eJ-JS; Tue, 18 May 2021 12:52:13 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=4BAW2gMWNYCTUhSbN+226fa0j0oBx0VQ07FNZy+FR8E=; b=3YEdx0DzwFBhUzxEeafrMnxoX1
	8mqxeFQNhUFrqtFOzlIgqbVytnhTbD1iUdqeW3sGiJ8KHFG4SQRKXjLBjMvguZ7yu7i1t8oriuxUb
	0eQ5V1v4MDenbl12H7ZabVFlxHpR8SJmAYSsR99xr3Hhele+iSHLdWkIWjq63TnM3p1E=;
Subject: Re: [PATCH v3 2/2] tools/xenstore: simplify xenstored main loop
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210518061907.16374-1-jgross@suse.com>
 <20210518061907.16374-3-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1f3f7620-bd8a-d705-6348-136a452a0a74@xen.org>
Date: Tue, 18 May 2021 13:52:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518061907.16374-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 18/05/2021 07:19, Juergen Gross wrote:
> The main loop of xenstored is rather complicated due to different
> handling of socket and ring-page interfaces. Unify that handling by
> introducing interface type specific functions can_read() and
> can_write().
> 
> Take the opportunity to remove the empty list check before calling
> write_messages() because the function is already able to cope with an
> empty list.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

I have also committed the series.

Cheers,

> ---
> V2:
> - split off function vector introduction (Julien Grall)
> V3:
> - expand commit message (Julien Grall)
> ---
>   tools/xenstore/xenstored_core.c   | 77 +++++++++++++++----------------
>   tools/xenstore/xenstored_core.h   |  2 +
>   tools/xenstore/xenstored_domain.c |  2 +
>   3 files changed, 41 insertions(+), 40 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 856f518075..883a1a582a 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -1659,9 +1659,34 @@ static int readfd(struct connection *conn, void *data, unsigned int len)
>   	return rc;
>   }
>   
> +static bool socket_can_process(struct connection *conn, int mask)
> +{
> +	if (conn->pollfd_idx == -1)
> +		return false;
> +
> +	if (fds[conn->pollfd_idx].revents & ~(POLLIN | POLLOUT)) {
> +		talloc_free(conn);
> +		return false;
> +	}
> +
> +	return (fds[conn->pollfd_idx].revents & mask) && !conn->is_ignored;
> +}
> +
> +static bool socket_can_write(struct connection *conn)
> +{
> +	return socket_can_process(conn, POLLOUT);
> +}
> +
> +static bool socket_can_read(struct connection *conn)
> +{
> +	return socket_can_process(conn, POLLIN);
> +}
> +
>   const struct interface_funcs socket_funcs = {
>   	.write = writefd,
>   	.read = readfd,
> +	.can_write = socket_can_write,
> +	.can_read = socket_can_read,
>   };
>   
>   static void accept_connection(int sock)
> @@ -2296,47 +2321,19 @@ int main(int argc, char *argv[])
>   			if (&next->list != &connections)
>   				talloc_increase_ref_count(next);
>   
> -			if (conn->domain) {
> -				if (domain_can_read(conn))
> -					handle_input(conn);
> -				if (talloc_free(conn) == 0)
> -					continue;
> -
> -				talloc_increase_ref_count(conn);
> -				if (domain_can_write(conn) &&
> -				    !list_empty(&conn->out_list))
> -					handle_output(conn);
> -				if (talloc_free(conn) == 0)
> -					continue;
> -			} else {
> -				if (conn->pollfd_idx != -1) {
> -					if (fds[conn->pollfd_idx].revents
> -					    & ~(POLLIN|POLLOUT))
> -						talloc_free(conn);
> -					else if ((fds[conn->pollfd_idx].revents
> -						  & POLLIN) &&
> -						 !conn->is_ignored)
> -						handle_input(conn);
> -				}
> -				if (talloc_free(conn) == 0)
> -					continue;
> -
> -				talloc_increase_ref_count(conn);
> -
> -				if (conn->pollfd_idx != -1) {
> -					if (fds[conn->pollfd_idx].revents
> -					    & ~(POLLIN|POLLOUT))
> -						talloc_free(conn);
> -					else if ((fds[conn->pollfd_idx].revents
> -						  & POLLOUT) &&
> -						 !conn->is_ignored)
> -						handle_output(conn);
> -				}
> -				if (talloc_free(conn) == 0)
> -					continue;
> +			if (conn->funcs->can_read(conn))
> +				handle_input(conn);
> +			if (talloc_free(conn) == 0)
> +				continue;
>   
> -				conn->pollfd_idx = -1;
> -			}
> +			talloc_increase_ref_count(conn);
> +
> +			if (conn->funcs->can_write(conn))
> +				handle_output(conn);
> +			if (talloc_free(conn) == 0)
> +				continue;
> +
> +			conn->pollfd_idx = -1;
>   		}
>   
>   		if (delayed_requests) {
> diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
> index 6c4845c196..bb36111ecc 100644
> --- a/tools/xenstore/xenstored_core.h
> +++ b/tools/xenstore/xenstored_core.h
> @@ -90,6 +90,8 @@ struct connection;
>   struct interface_funcs {
>   	int (*write)(struct connection *, const void *, unsigned int);
>   	int (*read)(struct connection *, void *, unsigned int);
> +	bool (*can_write)(struct connection *);
> +	bool (*can_read)(struct connection *);
>   };
>   
>   struct connection
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index f3cd56050e..708bf68af0 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -175,6 +175,8 @@ static int readchn(struct connection *conn, void *data, unsigned int len)
>   static const struct interface_funcs domain_funcs = {
>   	.write = writechn,
>   	.read = readchn,
> +	.can_write = domain_can_write,
> +	.can_read = domain_can_read,
>   };
>   
>   static void *map_interface(domid_t domid)
> 

-- 
Julien Grall

