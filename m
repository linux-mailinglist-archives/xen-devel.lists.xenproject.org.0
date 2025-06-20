Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA9DAE207C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 19:00:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021060.1397105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSf6T-0003Ii-Bf; Fri, 20 Jun 2025 17:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021060.1397105; Fri, 20 Jun 2025 17:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSf6T-0003Gb-93; Fri, 20 Jun 2025 17:00:37 +0000
Received: by outflank-mailman (input) for mailman id 1021060;
 Fri, 20 Jun 2025 17:00:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sh1O=ZD=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uSf6S-0003GV-65
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 17:00:36 +0000
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [2607:f8b0:4864:20::c36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 147fd478-4df8-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 19:00:34 +0200 (CEST)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-6113f0cafb2so1101460eaf.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jun 2025 10:00:34 -0700 (PDT)
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
X-Inumbo-ID: 147fd478-4df8-11f0-a30e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750438833; x=1751043633; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmA8q2HSTt0O1pZWJDOkj+lG0+NdHR/1w4qwRJYIHUQ=;
        b=Uc+P+YC38E1ZY1wuRxxaswHJh1TiYHpO7dSYg2Pb9vMMbpBDZZv/D71SBbvy8nV3yv
         U3eBebjRICB5QPPtvGeiI2mq6j2kHwKhuQG4QvTButSJH5lbGfTHyD7vEQ1drbVaI0pO
         k7apRcFkU5TIB96jfgnikHHvTVtsRCa8vihRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750438833; x=1751043633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmA8q2HSTt0O1pZWJDOkj+lG0+NdHR/1w4qwRJYIHUQ=;
        b=eC1g1FFmrU2rpHg/FMUcRcNUiASJ2szX7A31UequXQbxdpdd4m/nl9R8vc6l8D/7Ic
         aRRIqdobC11SKxfopvoM6gh6iy6eBqOJvCBwB37weT1AEz3YCNZWvFvmREdKuLFTTNFz
         6J5Djd1uLLkgx10aiYGQk4nbyMLl0Mk2+iSBvpKwaYHBcYxfARoFMPxCR0hjQukcVEAZ
         qa3K7Mt0zHvXQ0cg85suEb5CuimSzTN738kSi8eMeT/nR7sWNb4/Ksq1voAct3dNzis/
         p4sNZVvV1VawqiaZnzMP85SUYsTk35iauKRe/QIiyuF2lVSzEwZcIAdcxoWSLXRdsQ3r
         ew1g==
X-Forwarded-Encrypted: i=1; AJvYcCWYH8HzGZAQBowTxjgc4vCjh9Ij14BLxImeCO0V1QZwH6svreNCB08ANuXew2KsFlZWAwYtnNcDIb0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3e93KKU0nt3qzipAY+BeFkWMg0uJxczpVye7gqKA66/lIxwdA
	GLeCDy/pa22y80YA/SE9On/LrA7IrkFxi89WPVrLLyZMdztKVf5Y1mLBY8OsW+eZSfvj6WUpSH6
	i7AJzgLyNUo0XxoTazJEls7q7CCrqp/mW8WHy9LJe
X-Gm-Gg: ASbGnctdkx4CVjbAAgNwrBl92GTqGy22isJ4lVcZDl/riZRGBhQZYTFSJq8WJpbITNZ
	d0CI6eyW16cKiT/pkIw6jT8fSTiPrZmWJHOpjLb14xE7cmKw8oI4+hcZ0KWuaKveTjprNjHHjFd
	NomudH3bUEbB6yfpGADAo01dxp4dfOXD4MtpNoZopmjQ==
X-Google-Smtp-Source: AGHT+IEUtPl9HKw8cqKp9NBPRb+KHV77FeuCB3lS+kWOTzRbJxvrragzeaMkakBpfTdQgKnLGHF7K/NZwiWY1t0dc+k=
X-Received: by 2002:a05:6820:308a:b0:610:ee96:eca9 with SMTP id
 006d021491bc7-6115ba821c9mr2188417eaf.8.1750438833374; Fri, 20 Jun 2025
 10:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250611235851.167385-1-andrew.cooper3@citrix.com>
 <CAG7k0Eo3yzpUJjO-371j_h6NGrHFky9a6Sr4NWfMHfarTzpR=A@mail.gmail.com>
 <aFQgd1uSWlAcgFrr@mail-itl> <alpine.DEB.2.22.394.2506191254240.1780597@ubuntu-linux-20-04-desktop>
 <aFSJ0MS6k9QxyUVT@mail-itl>
In-Reply-To: <aFSJ0MS6k9QxyUVT@mail-itl>
From: Ross Lagerwall <ross.lagerwall@cloud.com>
Date: Fri, 20 Jun 2025 18:00:21 +0100
X-Gm-Features: Ac12FXy4r9uMRa5jx6SQcWkIJwgDTm6ay4jALFTLfx_wKwLlWtCaddOICDUUvs8
Message-ID: <CAG7k0EreK7MVPhkOG=4eVg7uK2S+N9PqqhyGkm56zBowesenUg@mail.gmail.com>
Subject: Re: [PATCH] docs: UEFI Secure Boot security policy
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, security@xen.org, 
	Juergen Gross <jgross@suse.com>, Trammell Hudson <hudson@trmm.net>, 
	Frediano Ziglio <frediano.ziglio@cloud.com>, Gerald Elder-Vass <gerald.elder-vass@cloud.com>, 
	Kevin Lampis <kevin.lampis@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 11:06=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Thu, Jun 19, 2025 at 12:56:12PM -0700, Stefano Stabellini wrote:
> > On Thu, 19 Jun 2025, Marek Marczykowski-G=C3=B3recki wrote:
> > > On Thu, Jun 19, 2025 at 03:16:51PM +0100, Ross Lagerwall wrote:
> > > > I think a section on PCI passthrough is also warranted. i.e. preven=
ting misuse
> > > > of a device to exploit Secure Boot.
> > >
> > > While I agree it makes sense, I wonder if it's in scope for UEFI
> > > Secure Boot as defined by Microsoft? It may have implication for exam=
ple
> > > on PCI passthrough to a PV domains.
> >
> > If we bring DomUs into the discussion, then I think we need to make a
> > distinction between predefined DomUs, which could have signatures
> > verified by Secure Boot (such as Dom0 and hyperlaunch/dom0less guests),
> > and other dynamically created DomUs which could be fetched from the
> > network and potentially started without signature verification or prior
> > knowledge.
>
> I think it's mostly not about what's running inside domU, but what such
> domU has access to. The obvious part is enforcing IOMMU configuration so
> that domU cannot use a PCI device as a proxy to modify hypervisor (or
> dom0) code. But there may be more subtleties like access to specific
> devices (HECI? SPI?).
> Anyway, lets figure out first _if_ we need to do something about this
> topic, and only then worry how.
>

As far as I know, Microsoft haven't specified requirements to this level
of detail. However, if userspace can break the Secure Boot principles
laid out above using a (spec compliant) PCI device to write memory, then
I don't see why it would be any different to a Secure Boot compromise
using the CPU to write memory. Linux prevents direct access to PCI
devices when lockdown mode is enabled, presumably to prevent these kinds
of attacks.

Ross

