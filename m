Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AC31D7309
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 10:34:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jabEG-0006tU-6d; Mon, 18 May 2020 08:34:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k4Zq=7A=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jabEF-0006tL-Eu
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 08:34:31 +0000
X-Inumbo-ID: 643dc3ba-98e2-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 643dc3ba-98e2-11ea-ae69-bc764e2007e4;
 Mon, 18 May 2020 08:34:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 48E7AAB99;
 Mon, 18 May 2020 08:34:32 +0000 (UTC)
Subject: Re: [PATCH] public/io/netif.h: add a new extra type for XDP
To: Denis Kirjanov <kda@linux-powerpc.org>, xen-devel@lists.xenproject.org
References: <1589790285-1250-1-git-send-email-kda@linux-powerpc.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <bbd8a83a-a676-9fa1-b03b-526e5122966f@suse.com>
Date: Mon, 18 May 2020 10:34:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1589790285-1250-1-git-send-email-kda@linux-powerpc.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.05.20 10:24, Denis Kirjanov wrote:
> The patch adds a new extra type to be able to diffirentiate
> between RX responses on xen-netfront side with the adjusted offset
> required for XDP processing.
> 
> For Linux the offset value is going to be passed via xenstore.

Why? I can only see disadvantages by using a different communication
mechanism.

> 
> Signed-off-by: Denis Kirjanov <denis.kirjanov@suse.com>
> ---
>   xen/include/public/io/netif.h | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/include/public/io/netif.h b/xen/include/public/io/netif.h
> index 9fcf91a..759c88a 100644
> --- a/xen/include/public/io/netif.h
> +++ b/xen/include/public/io/netif.h
> @@ -985,7 +985,8 @@ typedef struct netif_tx_request netif_tx_request_t;
>   #define XEN_NETIF_EXTRA_TYPE_MCAST_ADD (2)  /* u.mcast */
>   #define XEN_NETIF_EXTRA_TYPE_MCAST_DEL (3)  /* u.mcast */
>   #define XEN_NETIF_EXTRA_TYPE_HASH      (4)  /* u.hash */
> -#define XEN_NETIF_EXTRA_TYPE_MAX       (5)
> +#define XEN_NETIF_EXTRA_TYPE_XDP       (5)  /* u.xdp */
> +#define XEN_NETIF_EXTRA_TYPE_MAX       (6)
>   
>   /* netif_extra_info_t flags. */
>   #define _XEN_NETIF_EXTRA_FLAG_MORE (0)
> @@ -1018,6 +1019,10 @@ struct netif_extra_info {
>               uint8_t algorithm;
>               uint8_t value[4];
>           } hash;
> +        struct {
> +            uint16_t headroom;
> +            uint32_t pad;

Please use uint16_t pad[2] in order to avoid padding holes.

Additionally you are missing the addition of the related feature
Xenstore nodes in the comment area further up in the same file.


Juergen

