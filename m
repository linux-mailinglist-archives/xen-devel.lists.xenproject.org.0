Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 645033BD7E4
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 15:38:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151341.279703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0lHZ-0003Un-AV; Tue, 06 Jul 2021 13:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151341.279703; Tue, 06 Jul 2021 13:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0lHZ-0003Rq-6W; Tue, 06 Jul 2021 13:38:37 +0000
Received: by outflank-mailman (input) for mailman id 151341;
 Tue, 06 Jul 2021 13:38:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i6NH=L6=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1m0lHY-0003Fr-4o
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 13:38:36 +0000
Received: from MTA-11-4.privateemail.com (unknown [198.54.127.104])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45e2b9e6-4ce4-4322-b839-e88a125c7bdc;
 Tue, 06 Jul 2021 13:38:29 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id A386F800C7
 for <xen-devel@lists.xenproject.org>; Tue,  6 Jul 2021 09:38:28 -0400 (EDT)
Received: from mail-wr1-f45.google.com (unknown [10.20.151.225])
 by mta-11.privateemail.com (Postfix) with ESMTPA id 6C437800C1
 for <xen-devel@lists.xenproject.org>; Tue,  6 Jul 2021 09:38:28 -0400 (EDT)
Received: by mail-wr1-f45.google.com with SMTP id p8so26144937wrr.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jul 2021 06:38:28 -0700 (PDT)
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
X-Inumbo-ID: 45e2b9e6-4ce4-4322-b839-e88a125c7bdc
X-Gm-Message-State: AOAM5338AdTvB80sI9WByhiyZuIWTc+8jlif7i3Y+37mElRYGLw0Fsx3
	TovwXdl8mt/cLFRdVr1ZowufaTFvdVtREGOUM5k=
X-Google-Smtp-Source: ABdhPJw/9ImWBwnn8tzSBDR8GzQW68JW4j+LoPytlBLgbS/+zz+d0NngjsfeCIGYTYBNCZBo0TgBxAd0C5uPb8QXU5w=
X-Received: by 2002:a05:6000:1843:: with SMTP id c3mr22396115wri.301.1625578707119;
 Tue, 06 Jul 2021 06:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <dea13187-04ce-9c1d-aa5c-e2cd0a7d42d9@suse.com>
 <932211b2-c3aa-17f6-9fed-ca762e189786@suse.com> <CABfawhk4N-KznkFhmk3Q749tTp3X+j0fCwDXooYZEDdfQ7Fchw@mail.gmail.com>
 <a95a3f1e-afa5-30b7-f2f9-2e0ba1808b94@suse.com>
In-Reply-To: <a95a3f1e-afa5-30b7-f2f9-2e0ba1808b94@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 6 Jul 2021 09:37:51 -0400
X-Gmail-Original-Message-ID: <CABfawhmC2oTyY+=_fYu8sbb9k3zd+oLLgc5EwLmXk71vSpeVmA@mail.gmail.com>
Message-ID: <CABfawhmC2oTyY+=_fYu8sbb9k3zd+oLLgc5EwLmXk71vSpeVmA@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/mem-sharing: ensure consistent lock order in get_two_gfns()
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Jul 6, 2021 at 9:14 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 06.07.2021 14:36, Tamas K Lengyel wrote:
> > On Tue, Jun 29, 2021 at 8:54 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> While the comment validly says "Sort by domain, if same domain by gfn",
> >> the implementation also included equal domain IDs in the first part of
> >> the check, thus rending the second part entirely dead and leaving
> >> deadlock potential when there's only a single domain involved.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >
> > Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
>
> Thanks. Do you think I should queue this for backporting (once it got
> applied)?

Sure, considering it's a bugfix.

Thanks,
Tamas

