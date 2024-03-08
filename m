Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B45CC8763EC
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 13:02:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690263.1076107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riYvB-00012K-0Q; Fri, 08 Mar 2024 12:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690263.1076107; Fri, 08 Mar 2024 12:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riYvA-00010p-Ty; Fri, 08 Mar 2024 12:01:52 +0000
Received: by outflank-mailman (input) for mailman id 690263;
 Fri, 08 Mar 2024 12:01:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=41Qb=KO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1riYv9-00010j-QK
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 12:01:51 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a591b237-dd43-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 13:01:50 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5683093ffbbso622893a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Mar 2024 04:01:50 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 es14-20020a056402380e00b00566d9c8e6cesm7832390edb.21.2024.03.08.04.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Mar 2024 04:01:49 -0800 (PST)
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
X-Inumbo-ID: a591b237-dd43-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709899310; x=1710504110; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Np6OnpckeZVNGXoI0tK1G+zWIcIRU+/QyLKRbrCJ+xg=;
        b=lavU1pciln6IdO5JbcKNRGmKeCj5ZGWefTqv5SaWl2IXzajI0nBgpp3Ngbq8ZdCiam
         NksOLrmTW/M/4pjVhPYPOun4jK3d5nIs/eY6v16662T9CoPRK4zGw/dyrqO/W6ElwMsi
         tMTmZVVjix5Ve/B/kI16QmRfCI7nTRE6UlMAK3rNXkorTkPp3kcaVfzyMT9df7keYlKF
         bY96slQ7AMzsElvqcH1d6Hav9rLRB+PT40InQPV6uZg7wKHiNaCQjg2v0p1vu9rYV4X0
         APJj3M+x6C9VdljCrZnmLyEnESs1xfPfZ/My1kMNfVtmjGb8LVqKwb65n7WKBDJ/zdM6
         QPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709899310; x=1710504110;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Np6OnpckeZVNGXoI0tK1G+zWIcIRU+/QyLKRbrCJ+xg=;
        b=G+iqYl3ekIlb0+sLof1CZ2hpSmQPvo16OFJkwlIbvu8pBipdQtV9kP5yzQanN2nCU+
         mJr9VIK0VqTabEtDPWKN2+JdqY8DdhxIjYPkARo7D0DrY67xbhmrydzc7RFCg1Kwibn8
         +EdvpHClH4YMvuEG91YMr1DSiSuConh56zEQ0eQLosXfqecEDXzrl9JUZaNDf27WgDRA
         +gaL6xZ1wdBYWtkNq55TeHEYLGmp4t/Ir+gqrZp1AYfcPsRBusR3ACX1CT1BMZRhkVY6
         ZmMoPzddL4OnJbxiHl0VtcHH3KMxZppuZmFYNOzCKfiKt44Ztp9XrAj4dksD50q8rbBQ
         a9nA==
X-Forwarded-Encrypted: i=1; AJvYcCVezf1FTy8T7uLbfQf0o4OWPzJU3LRz+xKPQ33Tk5XGtYOR7XKLWO2EoS9Wel2wkW2oiVtA0I42yoIrrsxlR2c2KkQbFY17LVZnXDlCxY4=
X-Gm-Message-State: AOJu0Yw3JV2wXj1OP37y3aQyogcS4Z6Wa+NuZ4QJgPeb61gAzVAdUyXQ
	39YUebR+R5ZllpH2y0KHtFKC+9c9aq56HTKXvSvD7yZszHtjIWB4
X-Google-Smtp-Source: AGHT+IHEf4k1cAFCyBc91/yWA6kjAwmW5Cqd9qnnNfQK7YC2A/cxVifFoBV19rWf3XddzR7cbWWAZQ==
X-Received: by 2002:a50:aa9c:0:b0:567:23a2:5b1e with SMTP id q28-20020a50aa9c000000b0056723a25b1emr1833514edc.23.1709899309901;
        Fri, 08 Mar 2024 04:01:49 -0800 (PST)
Message-ID: <4343336e663ec5de6c8f322485fb65032a7c0585.camel@gmail.com>
Subject: Re: [PATCH] move __read_mostly to xen/cache.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
  Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger
 Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>,  Volodymyr Babchuk
 <volodymyr_babchuk@epam.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>,  "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Date: Fri, 08 Mar 2024 13:01:48 +0100
In-Reply-To: <b8822a77-57e6-4f72-bace-c23045fcb377@suse.com>
References: <f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com>
	 <b49777c7-c677-826f-01da-c6b5b67f5b85@citrix.com>
	 <893a5ebf-54e2-f2b2-1365-2a6d36ed3a39@suse.com>
	 <fb627eae0deb85569d3c3044154f1588e9202ec9.camel@gmail.com>
	 <64466285-35b8-497c-a12b-60fe0c998ba6@suse.com>
	 <a64b84d6759cb7daa48af5c6680e0011ed6bb113.camel@gmail.com>
	 <b8822a77-57e6-4f72-bace-c23045fcb377@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Fri, 2024-03-08 at 09:22 +0100, Jan Beulich wrote:
> On 07.03.2024 18:08, Oleksii wrote:
> > On Fri, 2023-12-22 at 12:09 +0100, Jan Beulich wrote:
> > > On 22.12.2023 10:39, Oleksii wrote:
> > > > On Tue, 2023-08-08 at 12:32 +0200, Jan Beulich wrote:
> > > > > On 08.08.2023 12:18, Andrew Cooper wrote:
> > > > > > On 08/08/2023 10:46 am, Jan Beulich wrote:
> > > > > > > There's no need for every arch to define its own
> > > > > > > identical
> > > > > > > copy.
> > > > > > > If down
> > > > > > > the road an arch needs to customize it, we can add
> > > > > > > #ifndef
> > > > > > > around
> > > > > > > the
> > > > > > > common #define.
> > > > > > >=20
> > > > > > > To be on the safe side build-breakage-wise, change a
> > > > > > > couple
> > > > > > > of
> > > > > > > #include
> > > > > > > <asm/cache.h> to the xen/ equivalent.
> > > > > > >=20
> > > > > > > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > > > > >=20
> > > > > > Could we find a better place to put this?
> > > > > >=20
> > > > > > __read_mostly is just a section.=C2=A0 It's relationship to the
> > > > > > cache is
> > > > > > only
> > > > > > microarchitectural, and is not the same kind of information
> > > > > > as
> > > > > > the
> > > > > > rest
> > > > > > of cache.h
> > > > > >=20
> > > > > > __ro_after_init is only here because __read_mostly is here,
> > > > > > but
> > > > > > has
> > > > > > absolutely nothing to do with caches whatsoever.
> > > > > >=20
> > > > > > If we're cleaning them up, they ought to live elsewhere.
> > > > >=20
> > > > > I would be considering init.h (for having most other
> > > > > __section()
> > > > > uses,
> > > > > and for also needing __read_mostly), but that's not a great
> > > > > place
> > > > > to
> > > > > put these either. In fact I see less connection there than
> > > > > for
> > > > > cache.h.
> > > > > So the primary need is a good suggestion (I'm hesitant to
> > > > > suggest
> > > > > to
> > > > > introduce section.h just for this).
> > > > Andrew sent some suggestions here:
> > > > https://lore.kernel.org/xen-devel/3df1dad8-3476-458f-9022-160e0af57=
d39@citrix.com/
> > > >=20
> > > > Will that work for you?
> > >=20
> > > I still need to properly look at the suggested options.
> > Have you had a chance to review the suggested options?
>=20
> I'm sure you've seen
>=20
> https://lists.xen.org/archives/html/xen-devel/2024-01/msg00145.html
>=20
> To add to that - xen/linkage.h is for assembly code only right now.
> While
> I'd be happy to add C stuff there, there's an (imo) obvious issue
> with
> code churn then: All C files using __read_mostly would then need to
> be
> changed to include xen/linkage.h. And no, I don't view including the
> file
> once in a "central" other header file as a viable solution: That's
> where
> some of our really bad header dependency issues come from. Plus a
> goal
> ought to be (imo) that touching a header like this one would better
> not
> result in a full re-build of everything, when doing incremental
> builds.
>=20
> Same obviously goes for the case of introducing xen/sections.h, i.e.
> the
> other proposed alternative.
>=20
> Bottom line: Given the state of our tree, I still view my proposed
> placement as the least bad one for the time being. To change my view,
> I'd still expect a _viable_ alternative proposal to be made.
Based on your replies, I can conclude that there is no good place for
__read_mostly and __ro_after_init.

If my conclusion is correct, then an introduction of a new header is
required. I totally agree that the inclusion of the introduced header
to 'central' header only for the reason not to update all C files using
__read_mostly macros is not a good solution, but I don't see an issue
with an update of all C files which use __read_mostly/__ro_after_init
if it is required. I realize that it can be a huge amount of files, but
if the situation requires that, it looks not so bad solution. If to
look at places where <xen/cache.h> is included now, then there wouldn't
be too many places that needed to be updated.

Despite this fact, I don't think that an introduction of xen/section.h
is a bad solution, xen/cache.h can also be a good place for it as my
understanding of __read_mostly is that it is not only meant for just
read-only data, there are performance reasons for using it:
/*
* __read_mostly is used to keep rarely changing variables out of
frequently
* updated cachelines. Its use should be reserved for data that is used
* frequently in hot paths. Performance traces can help decide when to
use
* this. You want __read_mostly data to be tightly packed, so that in
the
* best case multiple frequently read variables for a hot path will be
next
* to each other in order to reduce the number of cachelines needed to
* execute a critical path.
*/

Not related to my words above, here is a little remark about the patch
changes. Does it make sense to wrap the definition of __read_mostly()
by "#ifndef __read_mostly" in case architecture decides to redefine it?

~ Oleksii

