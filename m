Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F43380E96
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 19:06:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127437.239540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhbG5-0005s6-OX; Fri, 14 May 2021 17:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127437.239540; Fri, 14 May 2021 17:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhbG5-0005qF-L2; Fri, 14 May 2021 17:05:53 +0000
Received: by outflank-mailman (input) for mailman id 127437;
 Fri, 14 May 2021 17:05:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lhbG4-0005q9-4j
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 17:05:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhbG2-0005MO-PQ; Fri, 14 May 2021 17:05:50 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhbG2-0001NP-J0; Fri, 14 May 2021 17:05:50 +0000
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
	bh=vntf2DdCc7983Y0U19IZH9wHmk8GppIJ5EwyFVMxWR8=; b=UW6NKZETYki5gfgKp3aUvxhyJ6
	fJsdQorwsKLPXx88WV3RqJ1hp2aZvm2XhwD9Rg0Y1QZW6KINdDKQmsEBIl3Pf6L8Wg/HHtB8Fi96/
	H0tuegxea76fPIHg0s9avx/U8X6XCnOumRHbOYsKhKiJewxJX7tv2UFzMLvnNB+XLra8=;
Subject: Re: [PATCH v2 2/2] tools/xenstore: simplify xenstored main loop
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210514115620.32731-1-jgross@suse.com>
 <20210514115620.32731-3-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <24e89076-4440-a32e-f701-71957cc2a9e4@xen.org>
Date: Fri, 14 May 2021 18:05:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210514115620.32731-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 14/05/2021 12:56, Juergen Gross wrote:
> The main loop of xenstored is rather complicated due to different
> handling of socket and ring-page interfaces. Unify that handling by
> introducing interface type specific functions can_read() and
> can_write().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - split off function vector introduction (Julien Grall)
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

AFAICT, the check "!list_empty(&conn->out_list)" can be safely removed 
because write_messages() will check if the list is empty (list_top() 
returns NULL in this case). Is that correct?

Cheers,

-- 
Julien Grall

