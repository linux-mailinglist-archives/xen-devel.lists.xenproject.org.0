Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC4032424B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 17:40:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89428.168442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lExC2-0005VY-L0; Wed, 24 Feb 2021 16:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89428.168442; Wed, 24 Feb 2021 16:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lExC2-0005V9-He; Wed, 24 Feb 2021 16:39:18 +0000
Received: by outflank-mailman (input) for mailman id 89428;
 Wed, 24 Feb 2021 16:39:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AZg/=H2=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lExC1-0005V4-HL
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 16:39:17 +0000
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26ff7042-90a1-42f5-b87d-db081084cc33;
 Wed, 24 Feb 2021 16:39:16 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id l13so2398153wmg.5
 for <xen-devel@lists.xenproject.org>; Wed, 24 Feb 2021 08:39:16 -0800 (PST)
Received: from ?IPv6:2a00:23c5:5785:9a01:5df2:fdab:9690:bbff?
 ([2a00:23c5:5785:9a01:5df2:fdab:9690:bbff])
 by smtp.gmail.com with ESMTPSA id c11sm4217607wrs.28.2021.02.24.08.39.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 08:39:15 -0800 (PST)
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
X-Inumbo-ID: 26ff7042-90a1-42f5-b87d-db081084cc33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8/7WIkygkwXpMQwOKTWFMy/O50s2dwSmAwW3okTy7SU=;
        b=LOrFmN5sWtCCD85DZj9Q7wVk/yGY65GzHtnsqHpOkM6ZRLAPyp9GiMmMRecuCsGzyY
         rZT6u09IFlRc2LPrgttIEBF71ScZbL+aYBybAf6BDdsZD9Wb77qKYcdKp+mvNelq1L0j
         YvjulcryYuSNcXyIq2c4JbxeurukJd1xrxRKTkT+T3gyf/WQcunICYU9CDVUGxa1XtL9
         WuBBZ8ZasSzWQJag/ToTMCenroT0VAU1c82/HhiwFeyCF+2fZ/t7wJew122TkB5rYgWb
         V/2/CvUOyXv1dRprJXYPFK4LBLRpQwTbDleq3GsH6o2konedqnN8xpGdeEDfVrfzF3bH
         Xx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=8/7WIkygkwXpMQwOKTWFMy/O50s2dwSmAwW3okTy7SU=;
        b=Lfa1e1RgvegwslPHT7bDGM1ORc0q5BbkgkR8Obv+a1evzfwNq345yR8/QEbTPIbc4L
         p5qBCDAFpMkDDAmi3s7F0fUP0lWhk44uU+IyUO86Qw/FDm4P/lL26AY4NR4y1upvulch
         1D/1vAkseiqrrngCLpoMvFQ/6j9BqHHgJJo7dP+NKpkItyC6GnCSvQVSbxr2BnNedNqZ
         7A+tnjmdKBu4aqISvBXBP8gQJG5Sgvjo0pBjBUMSFXswPl1uC9xv2rLi/6OtYA9GPRVr
         BQk7YlIyxt+AFmFRZ+SoX4KXYZNShanTJO6hXHZcrBCGEJX/d+Dq/M7HNe3s4SFtYHVt
         WfoQ==
X-Gm-Message-State: AOAM530mcAYZbAFQB0pfKxrbHygvJimvIOAnizg6hluklR5kurxIiOPj
	xUNUnevWbgKQa9b4F6NbY34=
X-Google-Smtp-Source: ABdhPJxC2n4EKm35CLzWvdVGI9ph2B7GSWM9XEQYrail0xCcUGf0ffT5AqPxohOw+P230kc/FiHCoQ==
X-Received: by 2002:a05:600c:2184:: with SMTP id e4mr4435865wme.107.1614184755828;
        Wed, 24 Feb 2021 08:39:15 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH] xen-netback: correct success/error reporting for the
 SKB-with-fraglist case
To: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <4dd5b8ec-a255-7ab1-6dbf-52705acd6d62@suse.com>
Message-ID: <67bc0728-761b-c3dd-bdd5-1a850ff79fbb@xen.org>
Date: Wed, 24 Feb 2021 16:39:14 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <4dd5b8ec-a255-7ab1-6dbf-52705acd6d62@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23/02/2021 16:29, Jan Beulich wrote:
> When re-entering the main loop of xenvif_tx_check_gop() a 2nd time, the
> special considerations for the head of the SKB no longer apply. Don't
> mistakenly report ERROR to the frontend for the first entry in the list,
> even if - from all I can tell - this shouldn't matter much as the overall
> transmit will need to be considered failed anyway.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/drivers/net/xen-netback/netback.c
> +++ b/drivers/net/xen-netback/netback.c
> @@ -499,7 +499,7 @@ check_frags:
>   				 * the header's copy failed, and they are
>   				 * sharing a slot, send an error
>   				 */
> -				if (i == 0 && sharedslot)
> +				if (i == 0 && !first_shinfo && sharedslot)
>   					xenvif_idx_release(queue, pending_idx,
>   							   XEN_NETIF_RSP_ERROR);
>   				else
> 

I think this will DTRT, but to my mind it would make more sense to clear 
'sharedslot' before the 'goto check_frags' at the bottom of the function.

   Paul



