Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A26079F564
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 01:19:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601704.937819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgZ8O-0004hu-6q; Wed, 13 Sep 2023 23:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601704.937819; Wed, 13 Sep 2023 23:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgZ8O-0004fx-45; Wed, 13 Sep 2023 23:19:00 +0000
Received: by outflank-mailman (input) for mailman id 601704;
 Wed, 13 Sep 2023 23:18:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VxlT=E5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qgZ8M-0004fr-P7
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 23:18:58 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e91d9b9c-528b-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 01:18:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8189BCE2555;
 Wed, 13 Sep 2023 23:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9EBCC433C8;
 Wed, 13 Sep 2023 23:18:52 +0000 (UTC)
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
X-Inumbo-ID: e91d9b9c-528b-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694647133;
	bh=d6EB62DFl1E5nwSCNlnNnmsPdQLUskifviyIKLGGnfQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IzshTG4d7sofsR8Qgw2QQkp/+M0o3bYwAX3Sui+WvrHiCDzi0tkBVnDh9VwrmKI6U
	 ViC/5Pki+lBK+Mk6znMxH7XTeFl4WUo5cwy0kCA+7T+IGuhLe0x1HKbZTyu640F+on
	 ySWTZ4T3K0jIoFPp7KwqYx2jr/WNguoP/7/oLIJUpovJHUQZm1fi0Uo2VE+y8dWn1/
	 m8+SDR8kShcJV595x6dp00uwDgmuFXU2qwEUyXPHf05cKZkvSENOO5brZApu271u6h
	 fITgN094CLQH0rgPe/9Swr4v6GB1Ho4E6i4L2Av/uDJycC9o8Xvd1AC0lrfQzxyF8x
	 6bYGGqogW4KCQ==
Date: Wed, 13 Sep 2023 16:18:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: George Dunlap <george.dunlap@cloud.com>
cc: Thomas Gleixner <tglx@linutronix.de>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    Simon Gaiser <simon@invisiblethingslab.com>, 
    "committers@xenproject.org" <committers@xenproject.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
In-Reply-To: <CA+zSX=awNgMH1+5s9u9=Ai9ior4bt6iDvsoMWQrbx1szDxkLsQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2309131616450.2295162@ubuntu-linux-20-04-desktop>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com> <fa86cd2b-9670-ace7-3bcb-799f55ca283d@suse.com> <alpine.DEB.2.22.394.2309061346410.6458@ubuntu-linux-20-04-desktop> <27ae69b6-bc57-dee3-2528-8311a38decda@citrix.com>
 <874jjz3juk.ffs@tglx> <CA+zSX=awNgMH1+5s9u9=Ai9ior4bt6iDvsoMWQrbx1szDxkLsQ@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-887375711-1694647133=:2295162"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-887375711-1694647133=:2295162
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 13 Sep 2023, George Dunlap wrote:
> On Tue, Sep 12, 2023 at 8:57 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> >
> > On Mon, Sep 11 2023 at 19:24, Andrew Cooper wrote:
> > > Furthermore, cursory testing that Thomas did for the Linux topology work
> > > demonstrates that it is broken anyway for reasons unrelated to ACPI parsing.
> > >
> > > Even furthermore, it's an area of the Xen / dom0 boundary which is
> > > fundamentally broken for non-PV cases, and undocumented for the PV case,
> > > hence why it's broken in Linux.
> > >
> > > Physical CPU Hotplug does not pass the bar for being anything more than
> > > experimental.  It's absolutely not tech-preview level because the only
> > > demo it has had in an environment (admittedly virtual) which does
> > > implement the spec in a usable way demonstrates that it doesn't function.
> > >
> > > The fact no-one has noticed until now shows that the feature isn't used,
> > > which comes back around full circle to the fact that Intel never made it
> > > work and never shipped it.
> >
> > OTOH it _is_ used in virtualization. KVM supports it and it just
> > works. That's how I found out that XEN explodes in colourful ways :)
> 
> It should be pointed out that there's currently a start-up selling a
> product that specifically runs Xen under cloud providers -- Exostellar
> (was Exotanium) [1].  If cloud providers do use ACPI hotplug to allow
> on-the-fly adjustments of the number of vcpus, Exostellar will
> probably want support at some point.  (Perhaps it would be good to
> rope them into testing / maintaining it.)

Supporting CPU hotplug in a nested virtualization setting is a different
proposition compared to supporting Physical CPU Hotplug. Typically
virtual firmware (hypervisor-provided firmware) has less unexpected
behaviors compared to baremetal firmware.

Could you make the distinction in SUPPORT.md?
--8323329-887375711-1694647133=:2295162--

