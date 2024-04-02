Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A28895D8D
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 22:26:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700237.1093052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrkhL-00021W-IX; Tue, 02 Apr 2024 20:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700237.1093052; Tue, 02 Apr 2024 20:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrkhL-0001zt-Fw; Tue, 02 Apr 2024 20:25:35 +0000
Received: by outflank-mailman (input) for mailman id 700237;
 Tue, 02 Apr 2024 20:25:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0S3j=LH=gmail.com=arthurborsboom@srs-se1.protection.inumbo.net>)
 id 1rrkhJ-0001zn-Pn
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 20:25:33 +0000
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [2607:f8b0:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2673081e-f12f-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 22:25:32 +0200 (CEST)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5cfd95130c6so3502291a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 13:25:31 -0700 (PDT)
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
X-Inumbo-ID: 2673081e-f12f-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712089530; x=1712694330; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qzQQHoJQ11iL4ZRq1RRJUHfxyNKqnhQT5F/85QjSLyE=;
        b=l7PsDzlk6SbPGghN6twOYqHjoRrigFG/+fvzfcEYbtADIZdC98cmDl4csqGP9UVROo
         FqNVgNfLgP5PGBEa7cZYbCn/ib9s52cbmuVAqtKquNDq1Lha7M+yC5Vu7pAlZMfDKuTo
         ezeOZOIykxl/o/MHtx4SyORXZJZ0gEs//w8MilBtJ042CPnxNKOqCkPyrW3WH55JrYKB
         WhgT/zk9mu4b3ZO2aeaDqQBFKieNqn2Q+LcfTzcEb9sEs5fu9ZTwh0lrJcpfv4l2ZR4r
         0kESUNirXWifeXyMMfIE16gy5m8e53La0f6FQKskoVnibeF8pMbneOyMvrbIMDEhkH7K
         F4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712089530; x=1712694330;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzQQHoJQ11iL4ZRq1RRJUHfxyNKqnhQT5F/85QjSLyE=;
        b=Gkx8QNntJdkPS2vxixQYy66LyP2+eyArz+zdKhdQluDbSrYQDTbGjdoiAb8NHCkck8
         PeLgxVixTZ+dujD3NzS6HkR90V4Bolcps1k0AbBPMfsb57qY4Bug4sUdIkl9z410ky68
         KtvCXJi+1WerehMktCvH2mVX/EG6Wh2CI5B+VUmmM7fsVstlLFA/KsWrx/9kL5AWRgL9
         Sa/Eax1/GB4AiUZG3aAaxye6bLns+Q1oMJCBvIj14reJYPCZLvurhk1W8EybZes/67Of
         br/JT9m6IlM5Bj9rdg+KJb6fcKqbQqdNaYLRASR1dLBpKTQXf5dO2xD77gbjGdEO8cbg
         Cmag==
X-Forwarded-Encrypted: i=1; AJvYcCU4ZDODvDMQOrgRtK5XuSifKOz20t10LHPqjC26DAN45/jgKDVFnI3mQIgNUKgukrrsCdRU4N39OhKrzTPCgf/twEFhZ8mbk16THGBhFYI=
X-Gm-Message-State: AOJu0Yyws3d8FG1wUFX6k4BnWofoSSFB1J8ctKOUruT3cpS9RqvCox/7
	7i6DRsTYw21EKOKpJ352c1Vmb8cDlnya6liBblnaJ5QLwgeFQQT277enOGfkC80o2TNbUy1a+dO
	EF2GNGV7GEZlPbGmEbbXXIbIPVZ8=
X-Google-Smtp-Source: AGHT+IGngoKDuzCxvM9UepNkHp+ktQwyY9hfan6KLWWtdcJSgo7qrvIRP29btItHDsGC+UTo303GrDgOttbuu2r8lCQ=
X-Received: by 2002:a17:90a:db49:b0:29f:c827:bc8c with SMTP id
 u9-20020a17090adb4900b0029fc827bc8cmr11617961pjx.18.1712089529894; Tue, 02
 Apr 2024 13:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <171154167446.2671062.9127105384591237363.stgit@firesoul>
 <CALUcmU=xOR1j9Asdv0Ny7x=o4Ckz80mDjbuEnJC0Z_Aepu0Zzw@mail.gmail.com> <CALUcmUkvpnq+CKSCn=cuAfxXOGU22fkBx4QD4u2nZYGM16DD6A@mail.gmail.com>
In-Reply-To: <CALUcmUkvpnq+CKSCn=cuAfxXOGU22fkBx4QD4u2nZYGM16DD6A@mail.gmail.com>
From: Arthur Borsboom <arthurborsboom@gmail.com>
Date: Tue, 2 Apr 2024 22:25:13 +0200
Message-ID: <CALUcmUn0__izGAS-8gDL2h2Ceg9mdkFnLmdOgvAfO7sqxXK1-Q@mail.gmail.com>
Subject: Re: [PATCH net] xen-netfront: Add missing skb_mark_for_recycle
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: netdev@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, wei.liu@kernel.org, 
	paul@xen.org, Jakub Kicinski <kuba@kernel.org>, kirjanov@gmail.com, dkirjanov@suse.de, 
	kernel-team@cloudflare.com, security@xenproject.org, 
	andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

After having a better look, I have found the patch in linux-next

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=0cd74ffcf4fb0536718241d59d2c124578624d83

On Tue, 2 Apr 2024 at 10:20, Arthur Borsboom <arthurborsboom@gmail.com> wrote:
>
> On Fri, 29 Mar 2024 at 10:47, Arthur Borsboom <arthurborsboom@gmail.com> wrote:
> >
> > On Wed, 27 Mar 2024 at 13:15, Jesper Dangaard Brouer <hawk@kernel.org> wrote:
> > >
> > > Notice that skb_mark_for_recycle() is introduced later than fixes tag in
> > > 6a5bcd84e886 ("page_pool: Allow drivers to hint on SKB recycling").
> > >
> > > It is believed that fixes tag were missing a call to page_pool_release_page()
> > > between v5.9 to v5.14, after which is should have used skb_mark_for_recycle().
> > > Since v6.6 the call page_pool_release_page() were removed (in 535b9c61bdef
> > > ("net: page_pool: hide page_pool_release_page()") and remaining callers
> > > converted (in commit 6bfef2ec0172 ("Merge branch
> > > 'net-page_pool-remove-page_pool_release_page'")).
> > >
> > > This leak became visible in v6.8 via commit dba1b8a7ab68 ("mm/page_pool: catch
> > > page_pool memory leaks").
> > >
> > > Fixes: 6c5aa6fc4def ("xen networking: add basic XDP support for xen-netfront")
> > > Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
> > > Signed-off-by: Jesper Dangaard Brouer <hawk@kernel.org>
> > > ---
> > > Compile tested only, can someone please test this
> >
> > I have tested this patch on Xen 4.18.1 with VM (Arch Linux) kernel 6.9.0-rc1.
> >
> > Without the patch there are many trace traces and cloning the Linux
> > mainline git repository resulted in failures (same with kernel 6.8.1).
> > The patched kernel 6.9.0-rc1 performs as expected; cloning the git
> > repository was successful and no kernel traces observed.
> > Hereby my tested by:
> >
> > Tested-by: Arthur Borsboom <arthurborsboom@gmail.com>
> >
> >
> >
> > >  drivers/net/xen-netfront.c |    1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
> > > index ad29f370034e..8d2aee88526c 100644
> > > --- a/drivers/net/xen-netfront.c
> > > +++ b/drivers/net/xen-netfront.c
> > > @@ -285,6 +285,7 @@ static struct sk_buff *xennet_alloc_one_rx_buffer(struct netfront_queue *queue)
> > >                 return NULL;
> > >         }
> > >         skb_add_rx_frag(skb, 0, page, 0, 0, PAGE_SIZE);
> > > +       skb_mark_for_recycle(skb);
> > >
> > >         /* Align ip header to a 16 bytes boundary */
> > >         skb_reserve(skb, NET_IP_ALIGN);
> > >
> > >
>
> I don't see this patch yet in linux-next.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log
>
> Any idea in which kernel release this patch will be included?

