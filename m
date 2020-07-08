Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B75218AE6
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jul 2020 17:13:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtBkw-0008Vy-NF; Wed, 08 Jul 2020 15:13:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sx7s=AT=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jtBku-0008V8-U9
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 15:13:05 +0000
X-Inumbo-ID: 8561223a-c12d-11ea-bca7-bc764e2007e4
Received: from mail-io1-xd2b.google.com (unknown [2607:f8b0:4864:20::d2b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8561223a-c12d-11ea-bca7-bc764e2007e4;
 Wed, 08 Jul 2020 15:13:04 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id i4so47316994iov.11
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2020 08:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xJ675J9bOACbo4EfI5RqubkWGD/0vf/sAuCPPSuqTY4=;
 b=JGYXQbkzxsX7+RxzoeG+dRD0Om4RkBNx/3ge5VfkP7Z+Su73PKgnkkmlCPAoacFAa3
 dHwi2L67aSQ+eMOoRAhAwiz6iYXjMUl8dxTMl4NdAWYaaA6zTGSimRTyaByXOA/Ns9Ms
 9o1OQDtMRI4SIGpFsz0Z6WwOTS6ZE7eotCPofyaIsKli2vP6cvNad+An29ybbHRkdhdg
 kjTH6NIgOlS7OUAUYa0QK7/yYngdR9NFClzBam5Nn2u67R6U6RYfUViOL8zRyqwM/Lqz
 JFn/1P4aS9Yj46ObJDZMY73RZjm97soWVEKRCFKNqIi52ZgvdpY0yib0YJVewh7RRCXg
 hbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xJ675J9bOACbo4EfI5RqubkWGD/0vf/sAuCPPSuqTY4=;
 b=QY8T4TECOHLOUaVQBXdseHH+PU+rVRyp90p586FJtT1UIlnlUCLpNo4wzaydf0D6Y1
 AVeNDmTC68GcDolRDcv/vb9byRty6j1pbmpPSQcuZY3WoqBp0ouvs1FOg8A0WofzACc8
 N8di7SIwQWKWKCE/KAOAJG2a05GUISOHkL0295NhOSFHb7VN+xj2d0c/94VSS8d9tU3x
 WSyn+0lJEz5hXO6cYTcc+dIo8fXdNrzzKHgMHkw0CYr0z9LzX7m3q2m/n32hPKmTkvdo
 aFzW9SGwTyh/CslmtdkgRyqGkaqop3Ks/Vni9x4kdMs1EZk3zOLrcXxD5aBWJ5URz0nw
 TRRw==
X-Gm-Message-State: AOAM532GZtGxu3uuXf+l9zJSgOMTkmqbvEy4i12T7rnMVD3vAFLGO3Lw
 U/74fc/5bMS1znBH9o+rBqHu5sqxTjF7FSEetcQ=
X-Google-Smtp-Source: ABdhPJz3+czMgC71M/Ii9yPW4uFjNbnq8Z9aQ/gKITu9QPcH06eYUuPz96o4w6exyK89HcpfjSe3XMiAgV/N1WErBDI=
X-Received: by 2002:a02:5b83:: with SMTP id g125mr66655393jab.91.1594221184028; 
 Wed, 08 Jul 2020 08:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKPFMGtDLzc2RiEZR6KCcbPL6wumm+V5SNdxNf7fAowcBQ@mail.gmail.com>
 <20200708131150.GD7191@Air-de-Roger>
 <CAKmqyKOhW=YJ-WW28v-Ddt5yDDfVfCJKwijfsXo0oWAcvfrg2w@mail.gmail.com>
 <6CE81465-9F87-486F-A3CC-08857C9C4332@citrix.com>
 <CAKmqyKP5j7tQLZ8ka=CoN93X87a1LQhnMTxSeYfFo0jviMzP-w@mail.gmail.com>
 <20200708143420.GA8562@piano>
 <alpine.DEB.2.21.2007080808420.4124@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2007080808420.4124@sstabellini-ThinkPad-T480s>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 8 Jul 2020 08:03:14 -0700
Message-ID: <CAKmqyKPrQKyz8HY00pGnS-mM8Dr5P-m69sziCJ-K8yiFoza08Q@mail.gmail.com>
Subject: Re: Xen and RISC-V Design Session
To: Stefano Stabellini <sstabellini@kernel.org>
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
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 8, 2020 at 8:10 AM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Wed, 8 Jul 2020, Bobby Eshleman wrote:
> > On Wed, Jul 08, 2020 at 06:20:47AM -0700, Alistair Francis wrote:
> > >
> > > Thanks! Just submitted the proposal.
> > >
> > > It would be really great to have Bobby attend (on CC) as he has been
> > > working on it. I'm not sure what timezone he is in though.
> > >
> >
> > Hey Alistair,
> >
> > I am on the west coast in the USA, so some of the later slots would work best
> > for me too.
>
> I'd love to attend this session. Realistically we have two sessions
> tomorrow we could use, the 7:15AM and the 8:30AM California time, we
> could use one for FuSa and the other for RISC-V.

Either of those work for me.

Alistair

