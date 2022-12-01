Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CB163FA17
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 22:52:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451231.708886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0rSn-0005O6-4n; Thu, 01 Dec 2022 21:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451231.708886; Thu, 01 Dec 2022 21:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0rSn-0005L7-1W; Thu, 01 Dec 2022 21:51:25 +0000
Received: by outflank-mailman (input) for mailman id 451231;
 Thu, 01 Dec 2022 21:51:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p0rSl-0005L1-EL
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 21:51:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0rSk-0004tk-H3; Thu, 01 Dec 2022 21:51:22 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0rSk-0001u5-AI; Thu, 01 Dec 2022 21:51:22 +0000
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
	bh=TjgdT73Go9EFyw1exspIIBBGTGvy1DNvA1kcuv13agA=; b=PupH94KySFcAL814S85HSEH9gw
	QstJu5edMT17bs7Rkan1+8EkpMz7RrACj+3pBknO1+8VCenQ2foT5hDteAS8GtKYaMcLqYYAb0CFn
	Lw9hOhvxFQEVPhLzTgkY88ETFeyAh3QtU/bp+mYW1SGQtG0mdX/H21izHLWPE/tVXN6s=;
Message-ID: <821a4970-2d21-e9c2-865a-868daeadc510@xen.org>
Date: Thu, 1 Dec 2022 21:51:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-11-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 10/20] tools/xenstore: replace watch->relative_path with a
 prefix length
In-Reply-To: <20221101152842.4257-11-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 01/11/2022 15:28, Juergen Gross wrote:
> @@ -324,8 +312,7 @@ const char *dump_state_watches(FILE *fp, struct connection *conn,
>   		head.length = sizeof(sw);
>   
>   		sw.conn_id = conn_id;
> -		path = get_watch_path(watch, watch->node);
> -		sw.path_length = strlen(path) + 1;
> +		sw.path_length = strlen(watch->node + watch->prefix_len) + 1;

Why are you open-coding get_watch_path()?

>   		sw.token_length = strlen(watch->token) + 1;
>   		head.length += sw.path_length + sw.token_length;
>   		head.length = ROUNDUP(head.length, 3);
> @@ -334,7 +321,8 @@ const char *dump_state_watches(FILE *fp, struct connection *conn,
>   		if (fwrite(&sw, sizeof(sw), 1, fp) != 1)
>   			return "Dump watch state error";
>   
> -		if (fwrite(path, sw.path_length, 1, fp) != 1)
> +		if (fwrite(watch->node + watch->prefix_len, sw.path_length,
> +			   1, fp) != 1)
>   			return "Dump watch path error";
>   		if (fwrite(watch->token, sw.token_length, 1, fp) != 1)
>   			return "Dump watch token error";

Cheers,

-- 
Julien Grall

