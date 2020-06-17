Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C13671FCE4A
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 15:22:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlY1C-0004XK-7s; Wed, 17 Jun 2020 13:22:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qFwG=76=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jlY1A-0004XF-Tp
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 13:22:16 +0000
X-Inumbo-ID: 8fc44162-b09d-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fc44162-b09d-11ea-b7bb-bc764e2007e4;
 Wed, 17 Jun 2020 13:22:16 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d128so1984461wmc.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2020 06:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EULaudrOQif1rUxEpv1kEBycuTv3OmqyypseBuowOT8=;
 b=RKnczbQd0xpqb+gZiPuVDWgGpfjyE5WSj/JMylfIyEM4KseKKDg9YNHy/gKN2XO/TT
 n9Piwr2WVb+EXbK9JOTxt4N3Qqj8yfzQHlO34Qopmi2P/vbyp8C0FPBmGqcakah6HVrB
 fi0TJBE3ku0CTbHkKoeVWPKeOcd+b6cFXBp8IdqtQTuTKab9f0gEFZ0sY7bNLRgBmUpi
 LGzA5wIGbeWqwKGCVfJ/ugfXMwH8R5f/og20d2y+9NyScvx/dHm837KFQWnz4aKDSGr3
 b+1pkhDdu9LriTUyGmoHJHvzC68KPJ5+T2cQOPHwbrhDXR7u7ab4D8GGiWOd6zfjBwQJ
 qQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EULaudrOQif1rUxEpv1kEBycuTv3OmqyypseBuowOT8=;
 b=YtFYBi4pchZIVMO+JGGBr0090Dp3AUIzE0bnRAT/vVdYO/kzT4ycT4trIHACUMAxs2
 gMaB0lnLkvIcmNNgfBGyQk2PD1hisjxQXOOeXyx04Jer8h4NT43HdMNCRpzUMAtv1hwM
 thLxdvUHKlqyDbJk2+TiCEYnXAt32GRlwXzMffnW9P6Mw6yUCAqCzCPvLRbBXXRGn9YS
 kxBkec/txXC0N7XAEnGwJGVyXnqUltHMHin7G8fbNyjYK1BMFRFxG3lDecpYK+EfcF+p
 bRte8C4AQqGYWW+65xYC/QdUCdCNX0z35vRuSVojECDVYYqTc46Vvholqzq3zOnYr0mN
 lrfQ==
X-Gm-Message-State: AOAM5328o8uXuuBFMqnRwh3C12aTby1TlZEBTmM17p6+xU2K3hPjQ6mc
 stpug1yw81jNXnU3DI3eAORNru/GlzoKPHD1B1M=
X-Google-Smtp-Source: ABdhPJzCOfsTYk8sgKd6wtgFy4YpVugvFXtIPBorD3uTzVGNjr5ZAtOp8uTM0XM1uyyO4Zk2DbQ4jdeL3piIE4ydAms=
X-Received: by 2002:a1c:23d2:: with SMTP id j201mr8547150wmj.186.1592400135301; 
 Wed, 17 Jun 2020 06:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <6a2ae3bae4a4ad32bc7caecd8af2655a76a9fb19.1592335579.git.tamas.lengyel@intel.com>
 <a35d0df9-ca56-1d64-99a0-d2d744ab2186@suse.com>
 <CABfawhnXg+-HZzOhVyYreQtc6BE1xAyS5rJdQkE+1QNZA=iOnw@mail.gmail.com>
 <4b06e4f3-2b23-359a-9d80-c881016c0d91@suse.com>
In-Reply-To: <4b06e4f3-2b23-359a-9d80-c881016c0d91@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 17 Jun 2020 07:21:39 -0600
Message-ID: <CABfawh=AkBQ6iCOdWpjGvyXykePc7wVC-SZEn13_=q+P-zW4JA@mail.gmail.com>
Subject: Re: [PATCH for-4.14] x86/hap: use get_gfn_type in
 hap_update_paging_modes
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 17, 2020 at 7:04 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 17.06.2020 15:00, Tamas K Lengyel wrote:
> > On Wed, Jun 17, 2020 at 3:59 AM Jan Beulich <jbeulich@suse.com> wrote:
> >> If there are code paths of both kinds, which approach to use in
> >> vmx_load_pdptrs() may need to be chosen based on what
> >> paging_locked_by_me() returns. Or perhaps an unlocked query is
> >> fine in either case?
> >
> > Perhaps adjusting vmx_load_pdptrs to chose the unlocked query would be
> > fine. But at that point what is the reason for having the lock
> > ordering at all? Why not just have a single recursive lock and avoid
> > issues like this altogether?
>
> With just a single lock, contention problems we already know we
> have would be even worse. When the current locking model was
> introduced, there was actually a plan to make gfn_lock() more
> fine-grained (i.e. not simply "de-generate" to p2m_lock()), for
> example.

Sigh. Well, I've been checking and adjust vmx_load_pdptrs to use an
unlocked query doesn't seem as straightforward because, well, there is
no unlocked version of p2m_get_page_from_gfn which would also do the
"fixups". What seems redundant to me though is that
hap_update_paging_modes takes both the p2m_lock via get_gfn PLUS the
paging_lock. Does it really need to take the paging_lock? If it only
held the gfn_lock/p2m_lock then we would have the lock order violation
down the road.

Tamas

