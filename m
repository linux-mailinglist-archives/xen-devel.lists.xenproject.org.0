Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A5C603706
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 02:15:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425386.673154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okwk6-0000Xe-8h; Wed, 19 Oct 2022 00:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425386.673154; Wed, 19 Oct 2022 00:15:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okwk6-0000VM-5t; Wed, 19 Oct 2022 00:15:30 +0000
Received: by outflank-mailman (input) for mailman id 425386;
 Wed, 19 Oct 2022 00:15:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PkOC=2U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1okwk4-0000VG-Pd
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 00:15:28 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 221b3e97-4f43-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 02:15:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 84277B821A9;
 Wed, 19 Oct 2022 00:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE917C433B5;
 Wed, 19 Oct 2022 00:15:22 +0000 (UTC)
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
X-Inumbo-ID: 221b3e97-4f43-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666138524;
	bh=6i7KAYuzLBv0qf0M4B6AwUOT+eo1+bQqCOc9SAEYLRs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Io+QfxDfonOBKqwTUft1nb9xK9O8l5Hdqk61KgxQgIg41zaRWM0IPAiMV2gwUg994
	 HqKLJET0l6EZ5K6PsLUw+Atms/XdlnnUX/WC9ipkvfSn25jsGJ7yXdBJwUYWxSozIA
	 4v30wsJgiOuYdpPrmKXwDsmwEIRozJxXd6s5Fol8IP4i1HQLuZy5aQ6tZnd3++1BiW
	 9NLgdq5lagA7sJ3Za2jx8usP+KnuuiBYxMmLlOR33LOxHW+RmSu3FSOQ4q4Vl4SVDe
	 ndTZlJj6fx1tg4CjrLCgJq0+03RQ+T0lQENf+qNMWGOaw0vcA+o0LUj21bW+ShLuVN
	 IkRnjXPNk/5og==
Date: Tue, 18 Oct 2022 17:15:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org, 
    stefano.stabellini@amd.com, Peter Maydell <peter.maydell@linaro.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, 
    "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
In-Reply-To: <460a480e-4e91-8d78-60da-59b9cc98beee@xen.org>
Message-ID: <alpine.DEB.2.22.394.2210181241320.4587@ubuntu-linux-20-04-desktop>
References: <20221015050750.4185-1-vikram.garhwal@amd.com> <20221015050750.4185-11-vikram.garhwal@amd.com> <3e504b1b-197d-b77b-16e1-86530eb3d64c@xen.org> <alpine.DEB.2.22.394.2210171345450.2351079@ubuntu-linux-20-04-desktop>
 <460a480e-4e91-8d78-60da-59b9cc98beee@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Oct 2022, Julien Grall wrote:
> On 18/10/2022 02:26, Stefano Stabellini wrote:
> > On Sun, 16 Oct 2022, Julien Grall wrote:
> > > Hi,
> > > 
> > > There seem to be some missing patches on xen-devel (including the cover
> > > letter). Is that expected?
> > > 
> > > On 15/10/2022 06:07, Vikram Garhwal wrote:
> > > > Add a new machine xenpv which creates a IOREQ server to register/connect
> > > > with
> > > > Xen Hypervisor.
> > > 
> > > I don't like the name 'xenpv' because it doesn't convey the fact that some
> > > of
> > > the HW may be emulated rather than para-virtualized. In fact one may only
> > > want
> > > to use for emulating devices.
> > > 
> > > Potential name would be 'xen-arm' or re-using 'virt' but with 'accel=xen'
> > > to
> > > select a Xen layout.
> > 
> > The benefit of 'xenpv' is that it doesn't require any changes to libxl.
> 
> I am quite surprised. Looking at the code, it seems to work more by chance
> than it is intentional as the code is gated by libxl__need_xenpv_qemu(). So it
> would not start if there were no emulated devices.
> 
> > It is even backward compatible so it could be used with an older version
> > of Xen/libxl.
> We don't really gain much here. IOREQ is a tech preview and anyone that wants
> to try it should really use the latest Xen.

I think that's fair.


> > Backward compatibility aside, if we come up with a
> > different name then we'll need changes to libxl and to manage those
> > changes. For instance, if we use 'xen-arm' that would mean we would need
> > to handle per-arch QEMU machine names.
> 
> Right, so the main argument here is for simplicity in libxl

Yeah


> Looking at how 'xenpv' is built, this is really expected to deal with PV
> backend rather than emulated device. I do expect some changes as we go along
> to be able to add emulated device.
> 
> Furthermore, libxl is not the only toolstack out. So I am not convinced this
> is a good argument to keep the name the same.

Let's think some more about the naming strategy. From a QEMU point of
view we could choose any name we like (Vikram please confirm), the issue
is really on the libxl side.

Today libxl understands two QEMU "machines": xenpv and xenfv
(pc,accel=xen is the same as xenfv, I'll use xenfv in this email for
simplicity).

xenpv is for PV guests and only provides PV backends, no emulation. It
is used on both ARM and x86.

xenfv is only used on x86, and it is for HVM guests, with a full set of
emulated hardware (PIIX3, etc.).

The purpose of this series is to introduce a QEMU machine that:
- works on ARM (but could maybe work on other archs as a stretch goal)
- provides PV backends
- no emulated devices by default
- also can emulate selected devices on request

Certainly it is not xenfv or pc,accel=xen because they would with more
emulation by default. This is more like "xenpvh": an extension to PV
with also the capability of emulating one device as requested. It is not
intended to emulate a full PC and doesn't do that by default like xenfv.

If/When x86 PVH gains the ability to use QEMU as IOREQ server, I would
imagine it would run a QEMU machine similar to this one.

This is also how I would imagine it would get integrated in libxl: as a
xenpv + individual emulated devices. Not as HVM for ARM. The other QEMU
command line arguments are inline with the xenpv command line arguments
rather than xenfv command line arguments. This is why the libxl changes
are small to zero to make it work today.

So, I think the following options work:

a) call it "xenpv" because it is an extension of the old xenpv machine
b) call it "xenpvh" because it is PV + few individual emulated devices

If we call it xenpv there are fewer changes in libxl. If we call it
xenpvh there are more changes in libxl but we can distinguish xenpv from
xenpvh (I don't see why we need it right now, but I could imagine it
could turn out useful in the future.)

I would stay away from arch-specific machine names because it will make
it harder on the libxl side without immediate benefits.

