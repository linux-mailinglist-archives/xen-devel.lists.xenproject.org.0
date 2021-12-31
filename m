Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C945A482466
	for <lists+xen-devel@lfdr.de>; Fri, 31 Dec 2021 15:48:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252588.433635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n3JCW-000241-H2; Fri, 31 Dec 2021 14:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252588.433635; Fri, 31 Dec 2021 14:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n3JCW-00021z-D3; Fri, 31 Dec 2021 14:48:12 +0000
Received: by outflank-mailman (input) for mailman id 252588;
 Fri, 31 Dec 2021 14:48:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o3wb=RQ=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1n3JCV-00021t-1C
 for xen-devel@lists.xenproject.org; Fri, 31 Dec 2021 14:48:11 +0000
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab7e6611-6a48-11ec-9ce5-af14b9085ebd;
 Fri, 31 Dec 2021 15:48:09 +0100 (CET)
Received: by mail-il1-f170.google.com with SMTP id d14so21159155ila.1
 for <xen-devel@lists.xenproject.org>; Fri, 31 Dec 2021 06:48:09 -0800 (PST)
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
X-Inumbo-ID: ab7e6611-6a48-11ec-9ce5-af14b9085ebd
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ea9Uu/XtGn3JZW/wUzJplOSQDP87rGch/bHQnQPGkV8=;
        b=tF64mKI5zrpgksdm0hV8uMLYctxr15pi6B+pEetAKyrWjiyLRDARFAOhr1ShRe1502
         47+FKWiMVYiHj1c7Uzv5RNUotBOajuSzKAaGZbrzQ+SYEGGdxN7eWN5j4mthmohRz7vA
         4mN3ig4G5R/puMhbLAaFYvfAP70ErhRcNHm7MD4cPj8rl36itU7FFPgOLIBg+oaecSGu
         sk2Q6+YxZ80rnLAKWxSES7v1aLGHaWd40cvSgrMz1kvRSBK7IvKwfu8K1iqu4ijkuw60
         wjVMS4zfWK/Fxxor5QVS0lLmb1MePlOUvKZgbXRAT3Dgd5e/pnev9GJEuklzkaVMWGaw
         6Sxw==
X-Gm-Message-State: AOAM533zLATKLy6YprxbFmiXRPiRcCN/t/hAT8RNRAoXplbt72Vp/9Dv
	TA6N5zpt6mZsnrg66VV9MAXnZ0B+kpcPBt7Io1o=
X-Google-Smtp-Source: ABdhPJzEW+dyVHIlwDeSj5OUXll5gG7bsiEq6gL7N3I71S0X4tVxAut0bKbrOkWNTtZvi7JOMx0NtICvdA2OAL5KH/A=
X-Received: by 2002:a05:6e02:174b:: with SMTP id y11mr16044090ill.293.1640962088439;
 Fri, 31 Dec 2021 06:48:08 -0800 (PST)
MIME-Version: 1.0
References: <YcWuCgYWestnlDSH@Air-de-Roger> <CAKhsbWZ4Xyy_7Xp4F3YWNsrBXdh4AkiQx4__7qUTd4AJiu-6bg@mail.gmail.com>
 <CAKhsbWarxwi_n3NAr81op_apyN69itUrv7f1k1ZJ6=gXuFXtGA@mail.gmail.com>
 <YcoOUw/u3SqTxWKm@Air-de-Roger> <CAKhsbWY5=vENgwgq3NV44KSZQgpOPY=33CMSZo=jweAcRDjBwg@mail.gmail.com>
 <YcwdJn/Y0yncuJ/e@Air-de-Roger> <CAKhsbWaKvMtN0v57kRuwSGnTECb8JnabhgXeO1VTyLiJa4yngg@mail.gmail.com>
 <Ycw4Jna5J2iQJyeM@Air-de-Roger> <Ycyx65BDakqWmEe+@Air-de-Roger>
 <CAKhsbWYU5_DGbGK2i_uhooXk4EzCLLO4SJGjDsvAkf2udQGsbg@mail.gmail.com> <Yc3/ytwCHFtR1BLi@Air-de-Roger>
In-Reply-To: <Yc3/ytwCHFtR1BLi@Air-de-Roger>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Fri, 31 Dec 2021 22:47:57 +0800
Message-ID: <CAKhsbWbRinNavBq4NnQ64nVrfWoOQWV0mM3Foao4VBYUWjoSnQ@mail.gmail.com>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 31, 2021 at 2:52 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Thu, Dec 30, 2021 at 11:12:57PM +0800, G.R. wrote:
> > On Thu, Dec 30, 2021 at 3:07 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.=
com> wrote:
> > >
> > > On Wed, Dec 29, 2021 at 11:27:50AM +0100, Roger Pau Monn=C3=A9 wrote:
> > > > On Wed, Dec 29, 2021 at 05:13:00PM +0800, G.R. wrote:
> > > > > >
> > > > > > I think this is hitting a KASSERT, could you paste the text pri=
nted as
> > > > > > part of the panic (not just he backtrace)?
> > > > > >
> > > > > > Sorry this is taking a bit of time to solve.
> > > > > >
> > > > > > Thanks!
> > > > > >
> > > > > Sorry that I didn't make it clear in the first place.
> > > > > It is the same cross boundary assertion.
> > > >
> > > > I see. After looking at the code it seems like sglist will coalesce
> > > > contiguous physical ranges without taking page boundaries into
> > > > account, which is not suitable for our purpose here. I guess I will
> > > > either have to modify sglist, or switch to using bus_dma. The main
> > > > problem with using bus_dma is that it will require bigger changes t=
o
> > > > netfront I think.
> > >
> > > I have a crappy patch to use bus_dma. It's not yet ready for upstream
> > > but you might want to give it a try to see if it solves the cross pag=
e
> > > boundary issues.
> > >
> > I think this version is better.
>
> Thanks for all the testing.
>
> > It fixed the mbuf cross boundary issue and allowed me to boot from one
> > disk image successfully.
>
> It's good to know it seems to handle splitting mbufs fragments at page
> boundaries correctly.
>
> > But seems like this patch is not stable enough yet and has its own
> > issue -- memory is not properly released?
>
> I know. I've been working on improving it this morning and I'm
> attaching an updated version below.
>
Good news.
With this  new patch, the NAS domU can serve iSCSI disk without OOM
panic, at least for a little while.
I'm going to keep it up and running for a while to see if it's stable over =
time.

BTW, an irrelevant question:
What's the current status of HVM domU on top of storage driver domain?
About 7 years ago, one user on the list was able to get this setup up
and running with your help (patch).[1]
When I attempted to reproduce a similar setup two years later, I
discovered that the patch was not submitted.
And even with that patch the setup cannot be reproduced successfully.
We spent some time debugging on the problem together[2], but didn't
bottom out the root cause at that time.
In case it's still broken and you still have the interest and time, I
can launch a separate thread on this topic and provide required
testing environment.

[1] https://lists.xenproject.org/archives/html/xen-users/2014-08/msg00003.h=
tml
[2] https://xen-users.narkive.com/9ihP0QG4/hvm-domu-on-storage-driver-domai=
n

Thanks,
G.R.

> Thanks, Roger.

