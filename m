Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 387A8891643
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 10:48:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699308.1092063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq8q9-0000VU-Nu; Fri, 29 Mar 2024 09:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699308.1092063; Fri, 29 Mar 2024 09:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq8q9-0000Sf-LH; Fri, 29 Mar 2024 09:48:01 +0000
Received: by outflank-mailman (input) for mailman id 699308;
 Fri, 29 Mar 2024 09:48:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Z7A=LD=gmail.com=arthurborsboom@srs-se1.protection.inumbo.net>)
 id 1rq8q8-0000SZ-1Q
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 09:48:00 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b65c7dd-edb1-11ee-a1ef-f123f15fe8a2;
 Fri, 29 Mar 2024 10:47:57 +0100 (CET)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-29df3333d30so1373865a91.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 Mar 2024 02:47:57 -0700 (PDT)
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
X-Inumbo-ID: 6b65c7dd-edb1-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711705675; x=1712310475; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oh0leBodThLl+/WwZkKWIFfNI0+ZRn+gaWdkMtSiKdY=;
        b=UCWTwZkAfvzF2I6sOa/bMrIIsGL0Wh8zXvmVgCnMYF4qwy60f+AM3yBGdj8ApbrwT0
         RZDUEw1uYAiOm8flpP9Ek+RqA3FHzncW6YV/hvskaKJLJnDEmLA/O6wpDeXSo7EyKfIR
         y2PpQj/tZzJoLxqnzanLCNeEQ3q90Mft6d7wuCi+3K818TPqnR19fq2AS4Z5dPzZMcMv
         GJrWJkRyNOWkBm0btsqCI7QjFgdrmcQkWHkNnPj9adNxhL3/Hon+7BLY4GLRx6WnlaEQ
         xTulgOArNs8tC3Fhwj/YtxSrmhDmRw5GNB+gkIcd61MWH5FGdurmAm9gcLQIQAawuLAY
         JAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711705675; x=1712310475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oh0leBodThLl+/WwZkKWIFfNI0+ZRn+gaWdkMtSiKdY=;
        b=CBpKEEnMHxVlhGVmLzbjyKlXJq6csdrT8jwyhC9IPqzze6xwOJ9rfgyYGi3A2iKCyo
         fFvrBBck4u7eW+YlagHAbW9XCWoOaxWjJAfwMiaGOatensIUvtAs/0o2aJRTcBASHwEm
         VaTgCy773Hpw42pK2cNsxbAbxvccD5jPg5Aq4RqANdF4EWsaeW2M8FWo3khUIQ9lHjLL
         qDvuk0tCNRR85/YVSDANL3a48PxbWUknturBwGY/qAK+d1WiVix2yTL4fzPEfgBnV1p4
         cZYIPGaY6r/VpS5LAQ2gsTRtGYQetWGeeObsGPr1FMBvyiW8++VAtXBnA9vmT9sqQMN/
         72xQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5rrgdiRld+OUc4mGAjKma9v8MCoLncAcD/HLSVwFWuK1YYb8B+XFzCqy5HrigaccuEc520rsut4XKLq7K0Q2ouJWZM3tywq9fPtiFQIw=
X-Gm-Message-State: AOJu0Ywsg0S3xIGjCK9r9Bek6zKAuG8ZmntsbyotXQBZ9Os4cb1r5MVA
	mGLKy+gWmQtr4bTVLO/dhzaS+q2hvZDjmHBDuyK4U4CV/GDE1Yr+1hLEO7g6wOrAGH4HvYRGlUm
	OrcmxaH5jQk7nMKNq7loz0FLWXSY=
X-Google-Smtp-Source: AGHT+IHvdVFM6Yhn09w77HGK7jsfikHdUEX+kciFWiqwEiPVYac73i21jJYp0yxoHddRUojLc67TTiKVW5Q2aJI0SQo=
X-Received: by 2002:a17:90a:f3c6:b0:29f:f6c7:1ace with SMTP id
 ha6-20020a17090af3c600b0029ff6c71acemr1697823pjb.32.1711705675399; Fri, 29
 Mar 2024 02:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <171154167446.2671062.9127105384591237363.stgit@firesoul>
In-Reply-To: <171154167446.2671062.9127105384591237363.stgit@firesoul>
From: Arthur Borsboom <arthurborsboom@gmail.com>
Date: Fri, 29 Mar 2024 10:47:39 +0100
Message-ID: <CALUcmU=xOR1j9Asdv0Ny7x=o4Ckz80mDjbuEnJC0Z_Aepu0Zzw@mail.gmail.com>
Subject: Re: [PATCH net] xen-netfront: Add missing skb_mark_for_recycle
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: netdev@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, wei.liu@kernel.org, 
	paul@xen.org, Jakub Kicinski <kuba@kernel.org>, kirjanov@gmail.com, dkirjanov@suse.de, 
	kernel-team@cloudflare.com, security@xenproject.org, 
	andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Mar 2024 at 13:15, Jesper Dangaard Brouer <hawk@kernel.org> wrote:
>
> Notice that skb_mark_for_recycle() is introduced later than fixes tag in
> 6a5bcd84e886 ("page_pool: Allow drivers to hint on SKB recycling").
>
> It is believed that fixes tag were missing a call to page_pool_release_page()
> between v5.9 to v5.14, after which is should have used skb_mark_for_recycle().
> Since v6.6 the call page_pool_release_page() were removed (in 535b9c61bdef
> ("net: page_pool: hide page_pool_release_page()") and remaining callers
> converted (in commit 6bfef2ec0172 ("Merge branch
> 'net-page_pool-remove-page_pool_release_page'")).
>
> This leak became visible in v6.8 via commit dba1b8a7ab68 ("mm/page_pool: catch
> page_pool memory leaks").
>
> Fixes: 6c5aa6fc4def ("xen networking: add basic XDP support for xen-netfront")
> Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
> Signed-off-by: Jesper Dangaard Brouer <hawk@kernel.org>
> ---
> Compile tested only, can someone please test this

I have tested this patch on Xen 4.18.1 with VM (Arch Linux) kernel 6.9.0-rc1.

Without the patch there are many trace traces and cloning the Linux
mainline git repository resulted in failures (same with kernel 6.8.1).
The patched kernel 6.9.0-rc1 performs as expected; cloning the git
repository was successful and no kernel traces observed.
Hereby my tested by:

Tested-by: Arthur Borsboom <arthurborsboom@gmail.com>



>  drivers/net/xen-netfront.c |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
> index ad29f370034e..8d2aee88526c 100644
> --- a/drivers/net/xen-netfront.c
> +++ b/drivers/net/xen-netfront.c
> @@ -285,6 +285,7 @@ static struct sk_buff *xennet_alloc_one_rx_buffer(struct netfront_queue *queue)
>                 return NULL;
>         }
>         skb_add_rx_frag(skb, 0, page, 0, 0, PAGE_SIZE);
> +       skb_mark_for_recycle(skb);
>
>         /* Align ip header to a 16 bytes boundary */
>         skb_reserve(skb, NET_IP_ALIGN);
>
>

