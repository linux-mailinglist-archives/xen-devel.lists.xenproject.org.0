Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0997C76F4A7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 23:36:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576631.902978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRfzP-0006E1-4j; Thu, 03 Aug 2023 21:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576631.902978; Thu, 03 Aug 2023 21:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRfzP-0006BV-1p; Thu, 03 Aug 2023 21:36:11 +0000
Received: by outflank-mailman (input) for mailman id 576631;
 Thu, 03 Aug 2023 21:36:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRfzN-0006BP-CM
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 21:36:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRfzM-0002bq-F3; Thu, 03 Aug 2023 21:36:08 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRfzM-0000BX-9e; Thu, 03 Aug 2023 21:36:08 +0000
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
	bh=9I4IMIR62JFUSTNFv83Hx7SnUeTpD2dVhBdbjVSIbYA=; b=JmSD+bLu9AyoiOvCUNwkVnl8Me
	iGauZ9akeEuNCg/fWzs+uq9Daqddvk6mcoiBxxIRT3ooE0K5O5JcTATbnDgCsnsC0x0Sw7ASl7POP
	GCXRSiFdRleXUM2vpof2xgeOd0ucN1lZbtxxH+aIE620qVtq5h/TcoZTT69vovbtvhCY=;
Message-ID: <bf77f848-498f-ce8a-ab4a-23995636ca81@xen.org>
Date: Thu, 3 Aug 2023 22:36:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v3 22/25] tools/xenstore: merge get_spec_node() into
 get_node_canonicalized()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-23-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230724110247.10520-23-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/07/2023 12:02, Juergen Gross wrote:
> diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
> index 86cf8322b4..2662a3fa49 100644
> --- a/tools/xenstore/xenstored_watch.c
> +++ b/tools/xenstore/xenstored_watch.c
> @@ -166,19 +166,12 @@ static int destroy_watch(void *_watch)
>   static int check_watch_path(struct connection *conn, const void *ctx,
>   			    const char **path, bool *relative)
>   {
> -	/* Check if valid event. */
> -	if (strstarts(*path, "@")) {
> -		*relative = false;
> -		if (strlen(*path) > XENSTORE_REL_PATH_MAX)
> -			goto inval;

I can't find an exact matching check in is_valid_nodename(). The call 
also seems to put more restriction on '@' node. Can you clarify?

> -	} else {
> -		*relative = !strstarts(*path, "/");
> -		*path = canonicalize(conn, ctx, *path);
> -		if (!*path)
> -			return errno;
> -		if (!is_valid_nodename(conn, *path))
> -			goto inval;
> -	}
> +	*relative = !strstarts(*path, "/") && !strstarts(*path, "@");
> +	*path = canonicalize(conn, ctx, *path);
> +	if (!*path)
> +		return errno;
> +	if (!is_valid_nodename(conn, *path, true))
> +		goto inval;
>   
>   	return 0;
>   

Cheers,

-- 
Julien Grall

