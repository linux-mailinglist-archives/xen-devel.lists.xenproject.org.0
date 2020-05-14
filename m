Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC921D3C24
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 21:12:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZJG2-0005Cu-61; Thu, 14 May 2020 19:11:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E/fC=64=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jZJG0-0005Cp-Ll
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 19:11:00 +0000
X-Inumbo-ID: a533391e-9616-11ea-b9cf-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a533391e-9616-11ea-b9cf-bc764e2007e4;
 Thu, 14 May 2020 19:11:00 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id c21so3603665lfb.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2020 12:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dypvJ1+qLI5BUmBlyc5qDGFYdZQzWYY+2X/7jccyaeI=;
 b=bY98bxlB75sG9EVavmm3OxWUt56pnbzmVg2k/I62sVIEFErJbowv5reyzuDkqu5Jxq
 fWeHt8P/L6KPcRX2x+9D2DsxYMw375GH/kVdcXBTJn5vxqFMA4YoWQOrVQZiBKNYsnwy
 A8TMBQJJ/5N1SYQlDvTvvnal+Wrjvg+gaOX8K1VGaAC37tP86Zbt9prQJDX9GEhui6Nv
 +vnjsyNduYAcDaUTE9CCkMCFuhS03LDYdHpS5IMdpgJMVQ7AeAmwUrCaEG2yEiHYcxmr
 URB8BA1uLbXzBq+f4rsUf8r8XF2mMH6fx23CUlEfWn3oZholLoEveCRTbUyTi7T7N0CR
 CkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dypvJ1+qLI5BUmBlyc5qDGFYdZQzWYY+2X/7jccyaeI=;
 b=SYIGEAPZ2wXdMoaSvCXrrqpjRgbKeLZmBBp1q+07PEpCXid59YexM8y/YqZsdsg4aN
 YWkH0Hbtjj+KE15Dd+FEVX/+RW/pvbRsxDYlphXOckfs+T747sGXVBEgBMKv2ekl/8mY
 TwO89zZRC5mfD6LvHUw6EJlDKYoQlAZVc7OkkBIbGpcX3afRQkEb6ePHflsBo6zua1di
 la4KUt9Oxt0tiH2fhyKKuIOob1yzxnT3RO/BUKhI+1OZ83GKG7Ig/3bpkCn4WhwurHCC
 t91p23AiVe8NXeTM/6Q3wpWMKxMsCocs7nxXUcsBKJEXQn7GlqutSRqqLgfFBDMZzkwI
 nGmQ==
X-Gm-Message-State: AOAM532NaJ8YDzCzF4TOWOryWSkgdVN+0bnCGEBRfap0WtsSHH8zpSQb
 /lHK9FxdvOkDTOiYZeAgKBoIua+LkXmlDqZstiQ=
X-Google-Smtp-Source: ABdhPJz+n4gh/+N5xD99HKj1UyCu5cbuNQisG6jqGrxNTOVKvoLHeMcJGf3Z1ddvcd3OVllUkxTleEQEVcbTZcLK7fw=
X-Received: by 2002:ac2:4c3b:: with SMTP id u27mr4235755lfq.212.1589483458831; 
 Thu, 14 May 2020 12:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <24253.30741.77867.105081@mariner.uk.xensource.com>
In-Reply-To: <24253.30741.77867.105081@mariner.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 14 May 2020 15:10:46 -0400
Message-ID: <CAKf6xptQu7Yb1RGZn+mgp_ikSe2AXm1nun6_0f_oL_r88Hvwpg@mail.gmail.com>
Subject: Re: [PATCH v5 00/21] Add support for qemu-xen runnning in a
 Linux-based stubdomain
To: Ian Jackson <ian.jackson@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Simon Gaiser <simon@invisiblethingslab.com>,
 Jan Beulich <jbeulich@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Eric Shelton <eshelton@pobox.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, May 14, 2020 at 12:55 PM Ian Jackson <ian.jackson@citrix.com> wrote:
>
> Jason Andryuk writes ("[PATCH v5 00/21] Add support for qemu-xen runnning in a Linux-based stubdomain"):
> > In coordination with Marek, I'm making a submission of his patches for Linux
> > stubdomain device-model support.  I made a few of my own additions, but Marek
> > did the heavy lifting.  Thank you, Marek.
>
> Hi.  I finished reading these patches.  Thank you very much.  They
> were nicely structured.  I found them clear and easy to read.  As
> you'll have seen I have requested only a few changes.

I haven't taken a look yet, but thanks for the review.

Marek deserves credit for the structuring and work.

> I am very hopeful that this series will make 4.14.  Codefreeze is
> Friday the 22nd of May.  Please let us know whether you think we'll
> all be able to make that...

Yes, I'm aiming for 4.14.  I plan to re-spin and re-post over the new
couple days.

Regards,
Jason

