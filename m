Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A18C91A80B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 15:39:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750094.1158350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMpKQ-0005LC-R7; Thu, 27 Jun 2024 13:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750094.1158350; Thu, 27 Jun 2024 13:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMpKQ-0005I2-O2; Thu, 27 Jun 2024 13:38:22 +0000
Received: by outflank-mailman (input) for mailman id 750094;
 Thu, 27 Jun 2024 13:38:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h0yt=N5=outstep.com=lonnie@srs-se1.protection.inumbo.net>)
 id 1sMpKO-0005Hq-Ff
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 13:38:20 +0000
Received: from mail.outstep.net (mail.outstep.net [213.136.84.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 830264aa-348a-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 15:38:18 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 6B575234103E; Thu, 27 Jun 2024 15:38:02 +0200 (CEST)
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
X-Inumbo-ID: 830264aa-348a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outstep.com; s=dkim;
	t=1719495495; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to;
	bh=5W9ntMxDTfwHRffCk9BTmg8ZcDV+azGtDS5fbr1iB6A=;
	b=ZJhezTfPTe51m/taXqjIWwV8b+MoWj4FXYXm0xlyIzIvnZzgoiHC0XS4rxNJRlQ7MQAfd+
	6f/vGDkmTo1kqxld5nkN+mV+3SBkdTt7PpDg2yneALGcso/mnxQlHDZoPNQhXVNdYef4C4
	rkus8rAiEX5O35sqzhtudRXPZ701GXsZ8ef5HwK/raaPC6OqSiKZ3r9CQrCHOVdxvM3mAv
	hdtNFeJJmEUP12BK59EXvh25cuTAuzgviQ1yQdcoHcIO/xtS6TtoIBx7OdK0euVRLulVeD
	KGPm/P+ScmwFsLWser3fSH2DSpVsjwJPQxXAqQWt2MNkhwKfbovdVo2BMfN/0w==
From: "Lonnie" <lonnie@outstep.com>
In-Reply-To: <364e5058-ce40-482d-acf3-37f70266fdb3@vates.tech>
Content-Type: text/plain; charset="utf-8"
Date: Thu, 27 Jun 2024 15:38:02 +0200
Cc: "Juergen Gross" <jgross@suse.com>, xen-devel@lists.xenproject.org
To: "Teddy Astie" <teddy.astie@vates.tech>
MIME-Version: 1.0
Message-ID: <48-667d6b00-131-71122080@10350945>
Subject: =?utf-8?q?Re=3A?= Disaggregated (Xoar) Dom0 Building
User-Agent: SOGoMail 5.6.0
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None

Hi Teddy,

You are actually on track with what I was thinking in this area which i=
nitially gave me 2 main ideas:

1. Take the NOVA Microhypervisor (very small TCB at only 5K LOC) and tr=
y to get QEMU or Bhyve integrated as the VMM which would require a huge=
 amount of development time.  The Genode framework has a configuration/=
compile approach that uses NOVA with a custom VirtualBox, but I did not=
 want to go that route.

2. Take the Alpine XEN distro as the base and then update the dated Xoa=
r patches which effectively breaks Dom0 into 9 Service and Driver Mini/=
Nano VMs for which I was thinking about further setting them up as ultr=
a-thin Unikernels (MirageOS, IncludeOS, etc.) but still researching.

My effort is to make a purely Ultra-Thin RAM-Based Xen Hypervisor that =
boots UEFI for modern systems. Plus a number of other features if all g=
oes well.

Your ideas of QEMU as a Unikernel would probably really work for both X=
EN and NOVA (with a bit of work on the NOVA side). I actually liked NOV=
A and experimented with it a while back being able to produce a very li=
ghtweight Microhypervisor ISO that would boot and do some simple things=
 and even fire up lightweight Linux instances but with very limited cap=
abilities, of course, just to see if it worked. Unfortunately, that dir=
ection although very interesting, would definitely take too much develo=
pment to make a viable and more complete hypervisor.  I did like that y=
ou could easily start with no VM and easily start one or more and then =
use Hot-Keys to flip between consoles. That was pretty cool and is some=
thing that I would like to see about working into this XEN effort as we=
ll maybe some config file in the Xen.efi directory for that or somethin=
g but am still thinking about it.

I think that perhaps the Alpine-XEN-Xoar approach could be benefitual b=
ut XEN, plus supporting libraries is still a bit larger than I would ha=
ve hoped although you get more capabilities and more of a solid hypervi=
sor as well, I think.  Maybe we can chat more about things if you like.

Best,
Lonnie
On Thursday, June 27, 2024 14:38 CEST, Teddy Astie <teddy.astie@vates.t=
ech> wrote:

> Hi Lonnie,
>=20
> Le 27/06/2024 =C3=A0 11:33, Lonnie Cumberland a =C3=A9crit=C2=A0:
> > I am working towards is to have=20
> > everything as a RAM-based ultra-lightweight thin hypervisor.=C2=A0=C2=
=A0 I looked=20
> > over ACRN, the NOVA Microhypervisor (Headron, Beadrock Udo),=20
> > Rust-Shyper, Bareflank-MicroV, and many other development efforts b=
ut it=20
> > seems that Xen is the most advanced for my purposes here.
> >=20
>=20
> You can have a disk-less (or ramdisk based) distro supporting Xen wit=
h=20
> Alpine Linux (with Xen flavour). It does still use Dom0 with all its=20
> responsibilities though.
>=20
> >>> Currently, I am investigating and researching the ideas of=20
> >>> "Disaggregating" Dom0 and have the Xoar Xen patches ("Breaking Up=
 is=20
> >>> Hard to Do: Security and Functionality in a Commodity Hypervisor"=20
> >>> 2011) available which were developed against version 22155 of=20
> >>> xen-unstable. The Linux patches are against Linux with pvops=20
> >>> 2.6.31.13 and developed on a standard Ubuntu 10.04 install. My ef=
fort=20
> >>> would also be up update these patches.
> >>>
> >>> I have been able to locate the Xen "Dom0 Disaggregation"=20
> >>> (https://wiki.xenproject.org/wiki/Dom0=5FDisaggregation) am readi=
ng up=20
> >>> on things now but wanted to ask the developers list about any=20
> >>> experience you may have had in this area since the research objec=
tive=20
> >>> is to integrate Xoar with the latest Xen 4.20, if possible, and t=
o=20
> >>> take it further to basically eliminate Dom0 all together with=20
> >>> individual Mini-OS or Unikernel "Service and Driver VM's" instead=20
> >>> that are loaded at UEFI boot time.
>=20
> The latest stuff going on I have in mind regarding this idea of movin=
g=20
> stuff out of Dom0 is QEMU as Unikernel (using Unikraft), there were s=
ome=20
> discussions on this in Matrix and at Xen Summit, and it's currently w=
ork=20
> in progress from Unikraft side.
>=20
> Teddy
>=20
>=20
> Teddy Astie | Vates XCP-ng Intern
>=20
> XCP-ng & Xen Orchestra - Vates solutions
>=20
> web: https://vates.tech
>


