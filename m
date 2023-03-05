Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AB06AB284
	for <lists+xen-devel@lfdr.de>; Sun,  5 Mar 2023 22:29:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506606.779688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYvto-0003QB-7g; Sun, 05 Mar 2023 21:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506606.779688; Sun, 05 Mar 2023 21:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYvto-0003Nh-4T; Sun, 05 Mar 2023 21:28:08 +0000
Received: by outflank-mailman (input) for mailman id 506606;
 Sun, 05 Mar 2023 21:28:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wtgv=65=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pYvtm-0003Nb-TL
 for xen-devel@lists.xenproject.org; Sun, 05 Mar 2023 21:28:07 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d80d1b4-bb9c-11ed-96b4-2f268f93b82a;
 Sun, 05 Mar 2023 22:28:05 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id n2so10224036lfb.12
 for <xen-devel@lists.xenproject.org>; Sun, 05 Mar 2023 13:28:04 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.189.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.189]) by smtp.gmail.com with ESMTPSA id
 d17-20020ac24c91000000b004db3e445f1fsm1346234lfl.97.2023.03.05.13.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 13:28:03 -0800 (PST)
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
X-Inumbo-ID: 9d80d1b4-bb9c-11ed-96b4-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678051684;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PrAhwOfseeWKZJGnsBqfqAfxsaDQuK+jdP3GQbvRtQ8=;
        b=HwwVp8umXBzrFQ5abcOzoWUptjOEhiKSXB79gRN+EoygJZg8KMZvduho3SM32Ss9T9
         OmXAab8A5LUlSZX9U82vIl7AFC2HVh+NUXTfgulKelu0Vwamt736nk8H/YyDCIBwAlbh
         9MWwhZfign40kp0VFxDYZgEq5aDOiKu4bWLrRepED4/3WWsTNAYJnSMpINPkxZVsqbMs
         6p+AfvWo3iJ39pPXFthceoCXXwYa9vZPC9spNlkPb5cd3lt8Gg0Q9sAAdf6B1R+jySbR
         /2eEzuA8wGyZyhIAToTWAUiMlCYvalU3giOvW8tDh6Pz/fa7GCXs0snY1+JHekz1+lrw
         h73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678051684;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PrAhwOfseeWKZJGnsBqfqAfxsaDQuK+jdP3GQbvRtQ8=;
        b=Fs4DvjCCpfk6x8MHCxXQTr1LuaBM4PiQoQAA4Wl67hz567kYmm+0oC6dT4HRCsFAST
         nKUN7aa0+RbV4mHeeDfvoTcMc8bsv4Q5TIyOh/DuL/fhx7XgpioiiQ8Sj9j5/POwy56L
         Crn+3MuiZ+9CT8wg5IMSsbfTo46jl4gGP0Ju5vtsfeO/oI/Q3GdvMrtVTyxzRWYCRdy+
         /w0YFTYDQ8fFWQVlz3bRBOnU6ZZK0uaz8w1w4C1BeR68tlyoL7L+EQu+61Ozk/eB/TCR
         1hlxf2eJr7oG89PzOQ1n1LqerB+77Ej0FtpfVeZPhav37c7MFuBO91C0v31NR2CT81g7
         BjcQ==
X-Gm-Message-State: AO0yUKXFn16a2UAcSC6aKbFcF6BLlUgSVCkxuMJZr8GnS2ukFiZcUHiQ
	Mwx0lR6iO/85pS2BI+axbU0=
X-Google-Smtp-Source: AK7set+TH2BEosxrhDbUzcE2pbAKGIckf+KUlqjUARh3ot/+Zores8F8nlsNYzPmZ5833roi8C4MCQ==
X-Received: by 2002:ac2:41cd:0:b0:4db:3e2d:3efc with SMTP id d13-20020ac241cd000000b004db3e2d3efcmr2371907lfi.10.1678051684195;
        Sun, 05 Mar 2023 13:28:04 -0800 (PST)
Message-ID: <cdf18b1be34a623666808764439d50560663c574.camel@gmail.com>
Subject: Re: [PATCH v1 1/3] xen/riscv: introduce setup_initial_pages
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>
Date: Sun, 05 Mar 2023 23:28:02 +0200
In-Reply-To: <e0722b2323c78478f8fd07b515bb607ef168ef1e.camel@gmail.com>
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
	 <a145fbbfb166d9f6bd4859b669d23a1f52004b2b.1677250203.git.oleksii.kurochko@gmail.com>
	 <fca300ad-0fd1-70ed-4cd4-82e89f5c3351@xen.org>
	 <a0f3f1ca4277c1f8aeeaf6531d90c5b04c244af9.camel@gmail.com>
	 <98d45f93-b611-1016-45b5-3d7487af261f@xen.org>
	 <e0722b2323c78478f8fd07b515bb607ef168ef1e.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

>=20
> >=20
> > > >=20
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 page_addr =3D map_start;
> > > > > +=C2=A0=C2=A0=C2=A0 while ( page_addr < map_end )
> > > >=20
> > > > Looking at the loop, it looks like you are assuming that the
> > > > region
> > > > will
> > > > never cross a boundary of a page-table (either L0, L1, L2). I
> > > > am
> > > > not
> > > > convinced you can make such assumption (see below).
> > > >=20
> > > > But if you really want to make such assumption then you should
> > > > add
> > > > some
> > > > guard (either BUILD_BUG_ON(), ASSERT(), proper check) in your
> > > > code to
> > > > avoid any surprise in the future.
> > > I am not sure that I fully understand what is the problem here.
> > > The address is aligned on (1<<12) boundary and each itearation is
> > > mapped (1<<12) page so all looks fine or I misunderstood you.
> >=20
> > Let's take an example, imagine the region you want to map is 4MB.=20
> > AFAICT, you are only passing one L0 page-table. So your code will
> > end
> > up=20
> > to overwrite the previous entries in the zeroeth page-table and
> > then
> > add=20
> > another link in the L1 page-table.
> Got it. Then it looks that current approach isn't correct totally...
Or as an option we can add to xen.lds.S something like:

  ASSERT(_end - _start <=3D MB(L0_ENTRIES*PAGE_SIZE), "Xen too large")

~ Oleksii

