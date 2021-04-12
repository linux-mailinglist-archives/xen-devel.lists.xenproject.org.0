Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2000435C885
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 16:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109228.208495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxP3-0006tZ-VJ; Mon, 12 Apr 2021 14:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109228.208495; Mon, 12 Apr 2021 14:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxP3-0006tA-Rq; Mon, 12 Apr 2021 14:19:01 +0000
Received: by outflank-mailman (input) for mailman id 109228;
 Mon, 12 Apr 2021 14:18:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qpGe=JJ=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1lVxP1-0006t5-Lr
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 14:18:59 +0000
Received: from MTA-08-3.privateemail.com (unknown [198.54.127.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5027034-09c6-4861-8a2f-ce687cff3bf2;
 Mon, 12 Apr 2021 14:18:59 +0000 (UTC)
Received: from MTA-08.privateemail.com (localhost [127.0.0.1])
 by MTA-08.privateemail.com (Postfix) with ESMTP id 263AA60056
 for <xen-devel@lists.xenproject.org>; Mon, 12 Apr 2021 10:18:58 -0400 (EDT)
Received: from mail-wm1-f53.google.com (unknown [10.20.151.210])
 by MTA-08.privateemail.com (Postfix) with ESMTPA id E484B60068
 for <xen-devel@lists.xenproject.org>; Mon, 12 Apr 2021 10:18:57 -0400 (EDT)
Received: by mail-wm1-f53.google.com with SMTP id
 5-20020a05600c0245b029011a8273f85eso6993939wmj.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Apr 2021 07:18:57 -0700 (PDT)
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
X-Inumbo-ID: f5027034-09c6-4861-8a2f-ce687cff3bf2
X-Gm-Message-State: AOAM5311tibhDYMjUg9DXZaGhegKiiVhsUVVbljbCLEz1wXDvRZ11XMp
	u8D/rRezeZcIf6Lf3Ydku7/w/4ekWt0yfNmwvgc=
X-Google-Smtp-Source: ABdhPJwest+hAawm9Cv+0Nj3pqFfCZiwuEjZwNTEp7dA1zBuwXvpxKoJqgLSEuRE5x0jnM0COymlXPlOMlq+vi81XWo=
X-Received: by 2002:a7b:c20c:: with SMTP id x12mr12715302wmi.51.1618237136689;
 Mon, 12 Apr 2021 07:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com> <26dae9ef-5fcb-f806-059d-7cdd2974ad40@suse.com>
In-Reply-To: <26dae9ef-5fcb-f806-059d-7cdd2974ad40@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 12 Apr 2021 10:18:20 -0400
X-Gmail-Original-Message-ID: <CABfawhmiBnzZ=1DgRP9HVyADzO_ustsRFQFfoiYBG3z8m2gWUA@mail.gmail.com>
Message-ID: <CABfawhmiBnzZ=1DgRP9HVyADzO_ustsRFQFfoiYBG3z8m2gWUA@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] x86: make mem-paging configuarable and default
 it to off for being unsupported
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Daniel de Graaf <dgdegra@tycho.nsa.gov>, Paul Durrant <paul@xen.org>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Alexandru Isaila <aisaila@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Apr 12, 2021 at 10:12 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> While doing so, make the option dependent upon HVM, which really is the
> main purpose of the change.

IMHO it would be better to just remove this dead code altogether.

Tamas

