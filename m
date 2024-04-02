Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A358C894D59
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 10:21:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700039.1092581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrZO5-0002HM-FQ; Tue, 02 Apr 2024 08:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700039.1092581; Tue, 02 Apr 2024 08:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrZO5-0002Ek-CU; Tue, 02 Apr 2024 08:20:57 +0000
Received: by outflank-mailman (input) for mailman id 700039;
 Tue, 02 Apr 2024 08:20:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0S3j=LH=gmail.com=arthurborsboom@srs-se1.protection.inumbo.net>)
 id 1rrZO3-0002Eb-34
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 08:20:55 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb2d8125-f0c9-11ee-a1ef-f123f15fe8a2;
 Tue, 02 Apr 2024 10:20:52 +0200 (CEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2a04ac98cf7so3296203a91.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 01:20:52 -0700 (PDT)
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
X-Inumbo-ID: eb2d8125-f0c9-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712046051; x=1712650851; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MtgDNy5Ok/k3AgC4/N+aLWeQ5ZduvA0x4teM9jNjSvQ=;
        b=bPt262+4pMJhuIdwssdWQ8pcXHPshLqxxoKagA7VDs8Y+FIY68apvZmR4rL7rDlBN0
         KNpuTuJG4VmplHvvYMcjMs5E7gU1Oo1V8+OX21IRqAYKPBptNp1itX68sLfZ8KxLfKN9
         Z5w4YZBpcbaIEknGGdEb4ZnMuaV+JLiXqOUWtcYeHsLuEUypUHCckITk2Z7NWAGHIr1G
         ACS2Vybf0UN2KmCZjPJWo8xmY9jDCfQk8gDiFaz19H+pdCWuRkfzRRwqgQT7NLY7y+Ao
         6/Xfb+3KdnKTbyFa+bnRKij9XEdvQ5Zk+l9VxYq4KnP/oLE1r5cbp4HfxW7tWXw+hJvB
         +6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712046051; x=1712650851;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MtgDNy5Ok/k3AgC4/N+aLWeQ5ZduvA0x4teM9jNjSvQ=;
        b=wWSM8S1/bGA8m072JRm3ga1JpE3ID4gqam43EsEyGy3SEw2yaLFTHDrwY1wnAbUjxh
         vdQ5zuJzN6qHnI1BYUITo9x3kZ70+9ZTacJU4V6oUZ/V9coQ1vYJhFKFZlC7EOK/8c40
         pG6H9eZ9s2tUuXzvX9iYi/v+LgzfhZ+pwzzMeBYTT5fJ+MR3SwfuX/NaQt57v2/0HDhQ
         hEBpExBEK8F6OvWmVoN+KiXwV42G5n8y077h96610c+T1N/ugkgJ9Kk2oeW7Ajq5UGKu
         Q/b9SW0ChhPXuLioAPzb/ig5vBT5YeyuXbUywaNsfsY0CpdRsPBE+xBrF+rWXAu0OJuL
         7aWg==
X-Forwarded-Encrypted: i=1; AJvYcCXCcUhMRGebhfw0eU58IXlAQc2lLXWpHtIyzoFzz7/piGb9GpG561FvMsTo3P2g/GD62Od653LXKZ8rVQWz/4R4IOJn9PhxlJXGdJ/4cUk=
X-Gm-Message-State: AOJu0Yz5M43YSANyOK7merU9UbJwhpcQkgrA2+SD2BzGsjGk0dKXw4FH
	oTUjCImElE4qPshNIX7TAwNiTLONJzi+iy9PkGHV3az9+uftq7xyb+mA9jz0xoQvFVkqKAuNolU
	Ygnff9aTIbJF71dDiJ3fGILzEG6Q=
X-Google-Smtp-Source: AGHT+IFWlqMVFBoKcV6hseAJUnZ6M3BBB/Kala7LFFLA8XcpKQEImuTrHalGIK62Lr2CNcY1VdHtmKAyvR0PSWNN5kQ=
X-Received: by 2002:a17:90a:974b:b0:2a2:20d8:2110 with SMTP id
 i11-20020a17090a974b00b002a220d82110mr14057235pjw.8.1712046051136; Tue, 02
 Apr 2024 01:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <171154167446.2671062.9127105384591237363.stgit@firesoul> <CALUcmU=xOR1j9Asdv0Ny7x=o4Ckz80mDjbuEnJC0Z_Aepu0Zzw@mail.gmail.com>
In-Reply-To: <CALUcmU=xOR1j9Asdv0Ny7x=o4Ckz80mDjbuEnJC0Z_Aepu0Zzw@mail.gmail.com>
From: Arthur Borsboom <arthurborsboom@gmail.com>
Date: Tue, 2 Apr 2024 10:20:35 +0200
Message-ID: <CALUcmUkvpnq+CKSCn=cuAfxXOGU22fkBx4QD4u2nZYGM16DD6A@mail.gmail.com>
Subject: Re: [PATCH net] xen-netfront: Add missing skb_mark_for_recycle
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: netdev@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, wei.liu@kernel.org, 
	paul@xen.org, Jakub Kicinski <kuba@kernel.org>, kirjanov@gmail.com, dkirjanov@suse.de, 
	kernel-team@cloudflare.com, security@xenproject.org, 
	andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Mar 2024 at 10:47, Arthur Borsboom <arthurborsboom@gmail.com> wrote:
>
> On Wed, 27 Mar 2024 at 13:15, Jesper Dangaard Brouer <hawk@kernel.org> wrote:
> >
> > Notice that skb_mark_for_recycle() is introduced later than fixes tag in
> > 6a5bcd84e886 ("page_pool: Allow drivers to hint on SKB recycling").
> >
> > It is believed that fixes tag were missing a call to page_pool_release_page()
> > between v5.9 to v5.14, after which is should have used skb_mark_for_recycle().
> > Since v6.6 the call page_pool_release_page() were removed (in 535b9c61bdef
> > ("net: page_pool: hide page_pool_release_page()") and remaining callers
> > converted (in commit 6bfef2ec0172 ("Merge branch
> > 'net-page_pool-remove-page_pool_release_page'")).
> >
> > This leak became visible in v6.8 via commit dba1b8a7ab68 ("mm/page_pool: catch
> > page_pool memory leaks").
> >
> > Fixes: 6c5aa6fc4def ("xen networking: add basic XDP support for xen-netfront")
> > Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
> > Signed-off-by: Jesper Dangaard Brouer <hawk@kernel.org>
> > ---
> > Compile tested only, can someone please test this
>
> I have tested this patch on Xen 4.18.1 with VM (Arch Linux) kernel 6.9.0-rc1.
>
> Without the patch there are many trace traces and cloning the Linux
> mainline git repository resulted in failures (same with kernel 6.8.1).
> The patched kernel 6.9.0-rc1 performs as expected; cloning the git
> repository was successful and no kernel traces observed.
> Hereby my tested by:
>
> Tested-by: Arthur Borsboom <arthurborsboom@gmail.com>
>
>
>
> >  drivers/net/xen-netfront.c |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
> > index ad29f370034e..8d2aee88526c 100644
> > --- a/drivers/net/xen-netfront.c
> > +++ b/drivers/net/xen-netfront.c
> > @@ -285,6 +285,7 @@ static struct sk_buff *xennet_alloc_one_rx_buffer(struct netfront_queue *queue)
> >                 return NULL;
> >         }
> >         skb_add_rx_frag(skb, 0, page, 0, 0, PAGE_SIZE);
> > +       skb_mark_for_recycle(skb);
> >
> >         /* Align ip header to a 16 bytes boundary */
> >         skb_reserve(skb, NET_IP_ALIGN);
> >
> >

I don't see this patch yet in linux-next.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log

Any idea in which kernel release this patch will be included?

