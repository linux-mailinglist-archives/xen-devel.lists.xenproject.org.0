Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C383F75DD2C
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 17:21:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568011.887440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNEPl-0004W5-0Z; Sat, 22 Jul 2023 15:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568011.887440; Sat, 22 Jul 2023 15:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNEPk-0004UD-Tx; Sat, 22 Jul 2023 15:21:00 +0000
Received: by outflank-mailman (input) for mailman id 568011;
 Sat, 22 Jul 2023 15:20:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qNEPj-0004U7-Qs
 for xen-devel@lists.xenproject.org; Sat, 22 Jul 2023 15:20:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qNEPi-0002Vg-T1; Sat, 22 Jul 2023 15:20:58 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qNEPi-0004uf-Mi; Sat, 22 Jul 2023 15:20:58 +0000
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
	bh=RbGCztfCAISyM9SEHR7xBGOFvIfKLJrHHUgMEzl6ieg=; b=skoQcH5XefLRb0JIaDR+z25HDB
	1sCzzXB/45DK73AqGVkvo9VCwKlodFe3vxIkA2XG9G8G9fxSW7jYwcRLNx+FlYOxMqTS7XDwHTo1B
	U0+Hn2i3Kue6JPT9tEUogW0Le8iIlghMQO6CwcuvxPbJQcShgtFKrajykqgaMLDX389c=;
Message-ID: <adc0b17a-1d59-8c52-8823-64a0d9ec475b@xen.org>
Date: Sat, 22 Jul 2023 16:20:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230722081646.4136-1-jgross@suse.com>
 <20230722081646.4136-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 1/2] tools/xenstore: add const to the return type of
 canonicalize()
In-Reply-To: <20230722081646.4136-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 22/07/2023 09:16, Juergen Gross wrote:
> -static struct watch *add_watch(struct connection *conn, char *path, char *token,
> -			       bool relative, bool no_quota_check)
> +static struct watch *add_watch(struct connection *conn, const char *path,
> +			       const char *token, bool relative,
> +			       bool no_quota_check)
>   {
>   	struct watch *watch;
>   
> @@ -218,12 +219,14 @@ int do_watch(const void *ctx, struct connection *conn, struct buffered_data *in)
>   {
>   	struct watch *watch;
>   	char *vec[2];
> +	const char *path;
>   	bool relative;
>   
>   	if (get_strings(in, vec, ARRAY_SIZE(vec)) != ARRAY_SIZE(vec))
>   		return EINVAL;
>   
> -	errno = check_watch_path(conn, ctx, &(vec[0]), &relative);
> +	path = vec[0];
> +	errno = check_watch_path(conn, ctx, &path, &relative);

 From my understanding, check_watch_path() could update vec[0] which is 
then used below. But with your change, vec[0] would not be updated anymore.

I can see two possible approach:
    1) get_strings() is taking a const as well
    2) replace all use of vec[0] with path

I have a slight preference for the former. But I can also understand 
this is more work. So choose whichever you prefer.

Cheers,

-- 
Julien Grall

