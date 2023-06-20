Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BB7736CB2
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 15:03:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551838.861573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBb1I-0002Oj-U7; Tue, 20 Jun 2023 13:03:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551838.861573; Tue, 20 Jun 2023 13:03:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBb1I-0002Mk-R7; Tue, 20 Jun 2023 13:03:40 +0000
Received: by outflank-mailman (input) for mailman id 551838;
 Tue, 20 Jun 2023 13:03:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBb1H-0002MZ-7T
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 13:03:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBb1F-0006Gl-Np; Tue, 20 Jun 2023 13:03:37 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.9.99])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBb1F-0007sA-HS; Tue, 20 Jun 2023 13:03:37 +0000
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
	bh=iZ6LyilsGI2IByzUZDL+ayNCSUDA7Oyp3F3SNNY93ds=; b=JGrI3ru3yuxn7RCiTGvbtDfTQK
	43moHjw9JufMYIS2wa/q4Wu+EugygYpW4T4gY0r4VpdDyAEH6tmVibwdDifMQGhVdQhhdkwStloyv
	9P/I7ApnDoyNqWo+dP4kEbc+UJPW/4yg9/IzCWtnAnxz0TRRoeEBsvrD4ySSR974/bdg=;
Message-ID: <a183e00e-2c2e-a2dd-092a-ea51b6bbc699@xen.org>
Date: Tue, 20 Jun 2023 14:03:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 07/11] tools/xenstore: add wrapper for tdb_fetch()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-8-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530091333.7678-8-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

One more remark as I was reviewing patch #10.

On 30/05/2023 10:13, Juergen Gross wrote:
> Add a wrapper function for tdb_fetch taking the name of the node in
> the data base as a parameter. Let it return a data pointer and the
> length of the data via a length pointer provided as additional
> parameter.
> 
> This enables to make set_tdb_key() static again.
> 
> This is in preparation to replace TDB with a more simple data storage.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstore/xenstored_core.c        | 55 ++++++++++++++++----------
>   tools/xenstore/xenstored_core.h        |  3 +-
>   tools/xenstore/xenstored_transaction.c | 34 ++++++++--------
>   3 files changed, 51 insertions(+), 41 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 522b2bbf5f..12c584f09b 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -85,7 +85,7 @@ bool keep_orphans = false;
>   static int reopen_log_pipe[2];
>   static int reopen_log_pipe0_pollfd_idx = -1;
>   char *tracefile = NULL;
> -TDB_CONTEXT *tdb_ctx = NULL;
> +static TDB_CONTEXT *tdb_ctx = NULL;
>   unsigned int trace_flags = TRACE_OBJ | TRACE_IO;
>   
>   static const char *sockmsg_string(enum xsd_sockmsg_type type);
> @@ -556,7 +556,7 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
>   	}
>   }
>   
> -void set_tdb_key(const char *name, TDB_DATA *key)
> +static void set_tdb_key(const char *name, TDB_DATA *key)
>   {
>   	/*
>   	 * Dropping const is fine here, as the key will never be modified
> @@ -566,25 +566,39 @@ void set_tdb_key(const char *name, TDB_DATA *key)
>   	key->dsize = strlen(name);
>   }
>   
> +void *db_fetch(const char *db_name, size_t *size)

Should not this return xs_tdb_record_hdr?

> +{
> +	TDB_DATA key, data;
> +
> +	set_tdb_key(db_name, &key);
> +	data = tdb_fetch(tdb_ctx, key);
> +	if (!data.dptr)
> +		errno = (tdb_error(tdb_ctx) == TDB_ERR_NOEXIST) ? ENOENT : EIO;
> +	else
> +		*size = data.dsize;
> +
> +	return data.dptr;
> +}

-- 
Julien Grall

