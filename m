Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CB57EEFBF
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 11:07:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634999.990677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vkQ-0006OF-4A; Fri, 17 Nov 2023 10:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634999.990677; Fri, 17 Nov 2023 10:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vkQ-0006MX-13; Fri, 17 Nov 2023 10:06:50 +0000
Received: by outflank-mailman (input) for mailman id 634999;
 Fri, 17 Nov 2023 10:06:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r3vkN-0006ML-Uq
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 10:06:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3vkM-0004f8-1m; Fri, 17 Nov 2023 10:06:46 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3vkL-0000aq-P0; Fri, 17 Nov 2023 10:06:45 +0000
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
	bh=6kQfH7vTvfQy4+1miQGwQIQf8iT56DrQWwFXAaQNZLM=; b=boiq3XxFvYIIQgfj4XvVjIe6XL
	Ff8RjWUwKJEO7dlaTmn+7ga+Sbx8Np/IZC/y727dBFx+B9sueuGk0USNe0FXxK4BHb5Ym24znoOEw
	emE77wesp4+s33c2x25ls0bPfLXds/Zr1rwDsPv0oMVGG/lS6GHCfzOlQPTEkwp+Uy88=;
Message-ID: <16a320e7-3d12-4c9e-9010-ce0fe37c7e33@xen.org>
Date: Fri, 17 Nov 2023 10:06:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xenstored: print domain id in traces
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20231116205613.3796068-1-volodymyr_babchuk@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231116205613.3796068-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Volodymyr,

On 16/11/2023 20:56, Volodymyr Babchuk wrote:
> It is very helpful to see domain id why analyzing xenstored
> traces. Especially when you are trying to understand which exactly
> domain performs an action.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>   tools/xenstored/core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
> index edd07711db..311764eb0c 100644
> --- a/tools/xenstored/core.c
> +++ b/tools/xenstored/core.c
> @@ -135,8 +135,8 @@ static void trace_io(const struct connection *conn,
>   	now = time(NULL);
>   	tm = localtime(&now);
>   
> -	trace("io: %s %p %04d%02d%02d %02d:%02d:%02d %s (",
> -	      out ? "OUT" : "IN", conn,
> +	trace("io: %s %p (d%d) %04d%02d%02d %02d:%02d:%02d %s (",

AFAICT conn->id is an unsigned int. So it should be d%u. This can be 
dealt on commit.

Cheers,

-- 
Julien Grall

