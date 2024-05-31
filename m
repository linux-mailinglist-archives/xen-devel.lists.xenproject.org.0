Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD408D5AB6
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 08:48:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733290.1139441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCw3w-0000kg-OC; Fri, 31 May 2024 06:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733290.1139441; Fri, 31 May 2024 06:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCw3w-0000j5-LT; Fri, 31 May 2024 06:48:28 +0000
Received: by outflank-mailman (input) for mailman id 733290;
 Fri, 31 May 2024 06:48:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kOju=NC=gmail.com=idryomov@srs-se1.protection.inumbo.net>)
 id 1sCw3v-0000iz-2m
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 06:48:27 +0000
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [2607:f8b0:4864:20::c2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7512c0a-1f19-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 08:48:26 +0200 (CEST)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-5b970e90ab8so1030275eaf.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 23:48:25 -0700 (PDT)
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
X-Inumbo-ID: c7512c0a-1f19-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717138104; x=1717742904; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHfXsuY+pdYsu6JkPOmIMiIuAZ41w4yugEvYSYmSsZg=;
        b=gH2lbifJgnQb7tvPGqJY2YSPGDFzKlIsDe78WWauG21PwJ/YqOG2eFrGjXkcRA9zHw
         Yau3I3yH4NzY97Rck7ojb9nSe3zEbfwC54GtSkUIbYSZSnDJydqkf3mwzy8UlFmcjePC
         ffRqMnnfL6NbyudJ4bzyXKJF17Qkg8gw3WXHmfLliOCDchWmBwDg5g74BjLObNJj5HdE
         zF1tpsw+qCjmbpb2UumpaEYypTLIuzgKeA7Wv0yeKd8nmh2tcNFLWQ37NtbzfwfiSfnl
         up31vYtJs8H+UMzbOGXlLkaYaJ7nPL2YOhg8ufqE2ZqRZsLgyejFlwFX66LQiRtd3SZ+
         /oeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717138104; x=1717742904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHfXsuY+pdYsu6JkPOmIMiIuAZ41w4yugEvYSYmSsZg=;
        b=gDZoL9M1jMZaV7P0NF9V6DKpqhlmim4jPI2+vxY1SS5onprnri4YyX8xWjgq2aQYWI
         YF2BgCh9ph+3CynHhAt733egEyT9kFjPq0D4tlxY6gqYZwF8dlN5Usvjnurl8AZMqDkH
         1pMIPYEGsX8ock7Pzh/J/Jn+MVgAgq83Lk6FgmYOuTC8FksrRMU7CeJxsRGh5K8By4Hx
         pQ5dZZZgLLO80SScBU4rTB9GvEH+Uf3kAWoiIcHfRjfPXlG4I7SFRWEVU+GJq8P2h3EC
         P2P9vdrVGYAk0u/dzIR+dPT7MJ2+Tfj4lIqxzMP8fiCt14l0Y+j+jbsVFPQFvYixNdjW
         g3BA==
X-Forwarded-Encrypted: i=1; AJvYcCW8MBvUVyighyvONgiquhlsCCEwqixfC7NlMlYc1r7JjvL0xrNw0rrCZQM4VAyvRlrsUJ2QnhD1hjeYSgqU4l+AULr8kO0bjgwKaWAe1gE=
X-Gm-Message-State: AOJu0YwuK/qUBBFw/04KXgfxpO4q/yn6AMH0shy+vIv7GuDzI/3irZPY
	en/vGGVpid1nGqtSGrgPtUMVaEXSaMXkM/dwniRHNOd97/+UHAeez4QH6uJLKUFljG2wv2NTTk8
	B49y57UoxuAB/R5WsHKf+zGJe2SU=
X-Google-Smtp-Source: AGHT+IEkgVU5yVpc+xeOYwUOJd29bp6vThPd4yP1XUDfgboWzFw/FVhH/FxeC96crk9g7iXBffgH6P0YPBoJ35FyjnE=
X-Received: by 2002:a05:6820:151a:b0:5b9:70f8:4b82 with SMTP id
 006d021491bc7-5ba05e1f5a1mr1238669eaf.9.1717138104409; Thu, 30 May 2024
 23:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240529050507.1392041-1-hch@lst.de> <20240529050507.1392041-3-hch@lst.de>
 <CAOi1vP-F0FO4WTnrEt7FC-uu2C8NTbejvJQQGdZqT475c2G1jA@mail.gmail.com> <20240531055456.GC17396@lst.de>
In-Reply-To: <20240531055456.GC17396@lst.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Fri, 31 May 2024 08:48:12 +0200
Message-ID: <CAOi1vP-VXeOH-kShRKv-b=id1zN9tLiqOo8EKpOWoJuQp_Pm1g@mail.gmail.com>
Subject: Re: [PATCH 02/12] block: take io_opt and io_min into account for max_sectors
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Josef Bacik <josef@toxicpanda.com>, 
	Dongsheng Yang <dongsheng.yang@easystack.cn>, "Roger Pau Monn??" <roger.pau@citrix.com>, 
	linux-um@lists.infradead.org, linux-block@vger.kernel.org, 
	nbd@other.debian.org, ceph-devel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 7:54=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> On Thu, May 30, 2024 at 09:48:06PM +0200, Ilya Dryomov wrote:
> > For rbd, this change effectively lowers max_sectors from 4M to 64K or
> > less and that is definitely not desirable.  From previous interactions
> > with users we want max_sectors to match max_hw_sectors -- this has come
> > up a quite a few times over the years.  Some people just aren't aware
> > of the soft cap and the fact that it's adjustable and get frustrated
> > over the time poured into debugging their iostat numbers for workloads
> > that can send object (set) size I/Os.
> >
> > Looking at the git history, we lowered io_opt from objset_bytes to
> > opts->alloc_size in commit [1], but I guess io_opt was lowered just
> > along for the ride.  What that commit was concerned with is really
> > discard_granularity and to a smaller extent io_min.
> >
> > How much difference does io_opt make in the real world?  If what rbd
> > does stands in the way of a tree-wide cleanup, I would much rather bump
> > io_opt back to objset_bytes (i.e. what max_user_sectors is currently
> > set to).
>
> The only existing in-kernel usage is to set the readahead size.
> Based on your comments I seems like we should revert io_opt to
> objset to ->alloc_size in a prep patch?

We should revert io_opt from opts->alloc_size to objset_bytes (I think
it's what you meant to say but typoed).

How do you want to handle it?  I can put together a patch, send it to
ceph-devel and it will be picked by linux-next sometime next week.  Then
this patch would grow a contextual conflict and the description would
need to be updated to not mention a behavior change for rbd anymore.

Thanks,

                Ilya

