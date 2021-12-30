Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C8F481DA4
	for <lists+xen-devel@lfdr.de>; Thu, 30 Dec 2021 16:13:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252496.433546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2x7B-0003ho-Ob; Thu, 30 Dec 2021 15:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252496.433546; Thu, 30 Dec 2021 15:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2x7B-0003f4-LW; Thu, 30 Dec 2021 15:13:13 +0000
Received: by outflank-mailman (input) for mailman id 252496;
 Thu, 30 Dec 2021 15:13:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5QFl=RP=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1n2x79-0003ey-Kj
 for xen-devel@lists.xenproject.org; Thu, 30 Dec 2021 15:13:11 +0000
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff5a733c-6982-11ec-8436-837040afd3e1;
 Thu, 30 Dec 2021 16:13:10 +0100 (CET)
Received: by mail-io1-f51.google.com with SMTP id y18so21571440iob.8
 for <xen-devel@lists.xenproject.org>; Thu, 30 Dec 2021 07:13:09 -0800 (PST)
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
X-Inumbo-ID: ff5a733c-6982-11ec-8436-837040afd3e1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=n/I7Y6xKj3efjLIl+FrF0nFSDw+OsEnDfOJ2xa0q+9c=;
        b=Ub+hQ8gS5kV9qQJet+58W2XuPe7EcUTLikGRZYoCOIik4Y/R1MtqGqPeL+bYje1PPT
         T+rddhBXYTHMyRMBS3RZr41Cj7rTxhdCkoRUqDZn1BeFEEx7bqLYnsviUP3VFvaqfhEt
         4G5ajSGo2hdPL2Zv9E4iw+65vJWpEIgC0zJMHMip6bNa9JQEV9lcOMsJidE5HPjsb1BN
         6qk2WVaZBElHVhqggOOkq75oB7xIZoOxQ+kStXPRR+uHzQZbkdccgx43Sbzzjzv5LYjV
         9xvVPOBJBHttMICDBg/qrEPaoDWCADRKj2UGzjIUVaZjczfaVP6WHldKeWYZml0SNhV1
         TnAQ==
X-Gm-Message-State: AOAM5337U3hmfqgTOfKgT95mbYeXNhaOiPAEk2J39rePABQfFz776PeX
	hr2vjN0BdjlytH/bryr7OzWwy1fadD7HK9DYuf7AwBq+sRk=
X-Google-Smtp-Source: ABdhPJwCAHyc0E/nzXtZC1NAB3Ed+tLGpG9Tt79nuv3+jEC5WIkUGlgeBhbCQW3cl20f7BsFUnYl7mpkRp+U00RvErM=
X-Received: by 2002:a05:6638:2395:: with SMTP id q21mr13798083jat.313.1640877188886;
 Thu, 30 Dec 2021 07:13:08 -0800 (PST)
MIME-Version: 1.0
References: <YcInKtCNgA9v0k+c@Air-de-Roger> <CAKhsbWZMRMfrsWDcZLSS7q4ciR0UbyGE2sO-tN1dr+9juuEfsQ@mail.gmail.com>
 <YcWuCgYWestnlDSH@Air-de-Roger> <CAKhsbWZ4Xyy_7Xp4F3YWNsrBXdh4AkiQx4__7qUTd4AJiu-6bg@mail.gmail.com>
 <CAKhsbWarxwi_n3NAr81op_apyN69itUrv7f1k1ZJ6=gXuFXtGA@mail.gmail.com>
 <YcoOUw/u3SqTxWKm@Air-de-Roger> <CAKhsbWY5=vENgwgq3NV44KSZQgpOPY=33CMSZo=jweAcRDjBwg@mail.gmail.com>
 <YcwdJn/Y0yncuJ/e@Air-de-Roger> <CAKhsbWaKvMtN0v57kRuwSGnTECb8JnabhgXeO1VTyLiJa4yngg@mail.gmail.com>
 <Ycw4Jna5J2iQJyeM@Air-de-Roger> <Ycyx65BDakqWmEe+@Air-de-Roger>
In-Reply-To: <Ycyx65BDakqWmEe+@Air-de-Roger>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Thu, 30 Dec 2021 23:12:57 +0800
Message-ID: <CAKhsbWYU5_DGbGK2i_uhooXk4EzCLLO4SJGjDsvAkf2udQGsbg@mail.gmail.com>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 30, 2021 at 3:07 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Wed, Dec 29, 2021 at 11:27:50AM +0100, Roger Pau Monn=C3=A9 wrote:
> > On Wed, Dec 29, 2021 at 05:13:00PM +0800, G.R. wrote:
> > > >
> > > > I think this is hitting a KASSERT, could you paste the text printed=
 as
> > > > part of the panic (not just he backtrace)?
> > > >
> > > > Sorry this is taking a bit of time to solve.
> > > >
> > > > Thanks!
> > > >
> > > Sorry that I didn't make it clear in the first place.
> > > It is the same cross boundary assertion.
> >
> > I see. After looking at the code it seems like sglist will coalesce
> > contiguous physical ranges without taking page boundaries into
> > account, which is not suitable for our purpose here. I guess I will
> > either have to modify sglist, or switch to using bus_dma. The main
> > problem with using bus_dma is that it will require bigger changes to
> > netfront I think.
>
> I have a crappy patch to use bus_dma. It's not yet ready for upstream
> but you might want to give it a try to see if it solves the cross page
> boundary issues.
>
I think this version is better.
It fixed the mbuf cross boundary issue and allowed me to boot from one
disk image successfully.
But seems like this patch is not stable enough yet and has its own
issue -- memory is not properly released?
The stack trace is likely not useful, but anyway...

Context:
pmap_growkernel: no memory to grow kernel

<118>Dec 30 22:55:47 nas kernel[2164]: Last message 'pid 1066
(python3.9)' repeated 1 times, suppressed by syslog-ng on nas.rglab.us
<118>Dec 30 22:55:47 nas kernel: pid 2086 (python3.9), jid 0, uid 0,
was killed: out of swap space
panic: pmap_growkernel: no memory to grow kernel
cpuid =3D 1
time =3D 1640876153
KDB: stack backtrace:
db_trace_self_wrapper() at db_trace_self_wrapper+0x2b/frame 0xfffffe009b971=
210
vpanic() at vpanic+0x17b/frame 0xfffffe009b971260
panic() at panic+0x43/frame 0xfffffe009b9712c0
pmap_growkernel() at pmap_growkernel+0x2f1/frame 0xfffffe009b971300
vm_map_insert() at vm_map_insert+0x27b/frame 0xfffffe009b971390
vm_map_find() at vm_map_find+0x5ed/frame 0xfffffe009b971470
kva_import() at kva_import+0x3c/frame 0xfffffe009b9714b0
vmem_try_fetch() at vmem_try_fetch+0xde/frame 0xfffffe009b971500
vmem_xalloc() at vmem_xalloc+0x4db/frame 0xfffffe009b971580
kva_import_domain() at kva_import_domain+0x36/frame 0xfffffe009b9715b0
vmem_try_fetch() at vmem_try_fetch+0xde/frame 0xfffffe009b971600
vmem_xalloc() at vmem_xalloc+0x4db/frame 0xfffffe009b971680
vmem_alloc() at vmem_alloc+0x8a/frame 0xfffffe009b9716d0
kmem_malloc_domainset() at kmem_malloc_domainset+0x92/frame 0xfffffe009b971=
740
keg_alloc_slab() at keg_alloc_slab+0xfa/frame 0xfffffe009b9717a0
keg_fetch_slab() at keg_fetch_slab+0xfe/frame 0xfffffe009b971830
zone_fetch_slab() at zone_fetch_slab+0x61/frame 0xfffffe009b971870
zone_import() at zone_import+0x75/frame 0xfffffe009b9718f0
zone_alloc_item() at zone_alloc_item+0x56/frame 0xfffffe009b971930
abd_borrow_buf() at abd_borrow_buf+0x1f/frame 0xfffffe009b971950
vdev_geom_io_start() at vdev_geom_io_start+0x189/frame 0xfffffe009b971980
zio_vdev_io_start() at zio_vdev_io_start+0x1e4/frame 0xfffffe009b9719d0
zio_nowait() at zio_nowait+0x11a/frame 0xfffffe009b971a30
vdev_queue_io_done() at vdev_queue_io_done+0x1b8/frame 0xfffffe009b971a90
zio_vdev_io_done() at zio_vdev_io_done+0xe3/frame 0xfffffe009b971ad0
zio_execute() at zio_execute+0x6a/frame 0xfffffe009b971b20
taskqueue_run_locked() at taskqueue_run_locked+0x168/frame 0xfffffe009b971b=
80
taskqueue_thread_loop() at taskqueue_thread_loop+0x94/frame 0xfffffe009b971=
bb0
fork_exit() at fork_exit+0x80/frame 0xfffffe009b971bf0
fork_trampoline() at fork_trampoline+0xe/frame 0xfffffe009b971bf0
--- trap 0, rip =3D 0, rsp =3D 0, rbp =3D 0 ---
KDB: enter: panic

