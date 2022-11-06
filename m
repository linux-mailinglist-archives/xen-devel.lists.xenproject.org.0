Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9563361E649
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 22:09:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438989.692904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ormth-0003uz-Ax; Sun, 06 Nov 2022 21:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438989.692904; Sun, 06 Nov 2022 21:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ormth-0003sa-7N; Sun, 06 Nov 2022 21:09:41 +0000
Received: by outflank-mailman (input) for mailman id 438989;
 Sun, 06 Nov 2022 21:09:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ormtg-0003sU-Jf
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 21:09:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ormtg-0000sz-0Q; Sun, 06 Nov 2022 21:09:40 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ormtf-00078O-Ra; Sun, 06 Nov 2022 21:09:39 +0000
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
	bh=wZXDY8RVFdWMv2moL+3xqUfF89FKyigPP9wRKNl6MUI=; b=HAJ34EkhgAknYn4IWKg52CKXBJ
	mMJbwLoQUz9ivp5kTUFXjFk4x2nfAcT/MeXoJm/AIMiSI/TT9+OwoL3FBhvw2+AXsI8+Z/AihlElG
	/Sov4dBy1FqEpnlXCgFbmqheoIG0ziMfA7NZkl+CCauwyhMnZgVjRI5esT6wZ2LwyybA=;
Message-ID: <af4e0be2-06f3-d996-9272-3889d2d6849e@xen.org>
Date: Sun, 6 Nov 2022 21:09:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 04/20] tools/xenstore: let tdb_logger() preserve errno
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-5-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221101152842.4257-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 01/11/2022 15:28, Juergen Gross wrote:
> tdb_logger() is called by TDB for logging errors. As errno is checked
> often after doing the logging, tdb_logger() should preserve errno.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   tools/xenstore/xenstored_core.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 5a174b9881..d48208ecfe 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -2345,6 +2345,7 @@ static void tdb_logger(TDB_CONTEXT *tdb, int level, const char * fmt, ...)
>   {
>   	va_list ap;
>   	char *s;
> +	int saved_errno = errno;
>   
>   	va_start(ap, fmt);
>   	s = talloc_vasprintf(NULL, fmt, ap);
> @@ -2360,6 +2361,8 @@ static void tdb_logger(TDB_CONTEXT *tdb, int level, const char * fmt, ...)
>   		trace("talloc failure during logging\n");
>   		syslog(LOG_ERR, "talloc failure during logging\n");
>   	}
> +
> +	errno = saved_errno;
>   }
>   
>   void setup_structure(bool live_update)

-- 
Julien Grall

