Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F271A2ED13A
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 14:58:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62911.111601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxVo4-0001gE-KS; Thu, 07 Jan 2021 13:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62911.111601; Thu, 07 Jan 2021 13:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxVo4-0001fo-H8; Thu, 07 Jan 2021 13:58:28 +0000
Received: by outflank-mailman (input) for mailman id 62911;
 Thu, 07 Jan 2021 13:58:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PbtA=GK=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1kxVo2-0001fj-MK
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 13:58:26 +0000
Received: from MTA-06-3.privateemail.com (unknown [198.54.127.59])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90f7c023-136d-4236-a3cc-c6f455259e80;
 Thu, 07 Jan 2021 13:58:25 +0000 (UTC)
Received: from MTA-06.privateemail.com (localhost [127.0.0.1])
 by MTA-06.privateemail.com (Postfix) with ESMTP id F208360071
 for <xen-devel@lists.xenproject.org>; Thu,  7 Jan 2021 08:58:24 -0500 (EST)
Received: from mail-wm1-f49.google.com (unknown [10.20.151.227])
 by MTA-06.privateemail.com (Postfix) with ESMTPA id B9A3D60066
 for <xen-devel@lists.xenproject.org>; Thu,  7 Jan 2021 13:58:24 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id c124so5228673wma.5
 for <xen-devel@lists.xenproject.org>; Thu, 07 Jan 2021 05:58:24 -0800 (PST)
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
X-Inumbo-ID: 90f7c023-136d-4236-a3cc-c6f455259e80
X-Gm-Message-State: AOAM5302Wu9qS7ibEBZarbOGDisRPru61yL48/ix+0eRahpx3wzCy/pu
	XcNPrfqn6AG0OuEtyOgMugKdaHJtJbRj9VmZ/uo=
X-Google-Smtp-Source: ABdhPJwTfBXrWo9IbYcqE/9Xw+NCvJwmWd/snn45i+25Gk4jJ/pFVQylQUgqKqLSrQPF1d+VcT1J0LpYhwriharp+4k=
X-Received: by 2002:a7b:c246:: with SMTP id b6mr8314805wmj.154.1610027903234;
 Thu, 07 Jan 2021 05:58:23 -0800 (PST)
MIME-Version: 1.0
References: <253be1190a5cdc452611b3741d852d1c7d2bc8d4.1610025394.git.tamas.lengyel@intel.com>
 <355cf640-6027-816d-70c5-9a4ed445eb9c@suse.com>
In-Reply-To: <355cf640-6027-816d-70c5-9a4ed445eb9c@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 7 Jan 2021 08:57:46 -0500
X-Gmail-Original-Message-ID: <CABfawhkznKs7i9J2y_PwrkD4mKvwg95g3uF9jmDvKZ1At4jS=Q@mail.gmail.com>
Message-ID: <CABfawhkznKs7i9J2y_PwrkD4mKvwg95g3uF9jmDvKZ1At4jS=Q@mail.gmail.com>
Subject: Re: [PATCH v2] x86/mem_sharing: Resolve mm-lock order violations when
 forking VMs with nested p2m
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Jan 7, 2021 at 8:55 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 07.01.2021 14:23, Tamas K Lengyel wrote:
> > Several lock-order violations have been encountered while attempting to fork
> > VMs with nestedhvm=1 set. This patch resolves the issues.
> >
> > The order violations stems from a call to p2m_flush_nestedp2m being performed
> > whenever the hostp2m changes. This functions always takes the p2m lock for the
> > nested_p2m. However, with sharing the p2m locks always have to be taken before
> > the sharing lock. To resolve this issue we avoid taking the sharing lock where
> > possible (and was actually unecessary to begin with). But we also make
> > p2m_flush_nestedp2m aware that the p2m lock may have already been taken and
> > preemptively take all nested_p2m locks before unsharing a page where taking the
> > sharing lock is necessary.
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks,
Tamas

