Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E44E25E14B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 20:05:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEG5d-0001DM-Ot; Fri, 04 Sep 2020 18:05:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YEB=CN=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kEG5b-0001DH-I5
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 18:05:31 +0000
X-Inumbo-ID: 9d11c037-e8da-4e2d-a1c3-0e45bab217d0
Received: from mail2.protonmail.ch (unknown [185.70.40.22])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d11c037-e8da-4e2d-a1c3-0e45bab217d0;
 Fri, 04 Sep 2020 18:05:30 +0000 (UTC)
Date: Fri, 04 Sep 2020 18:05:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1599242728;
 bh=PO9Nkocnb5Xd7RP6OXVLz+jIR06rCt0cOy9SFC6eRiE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=foF9rIU1YPzr4bAY0j0OHTAI8KmF7nQUvP6tj/4yu8YNDCTzRYssVjtBWZpKGUICP
 jgo3t3eVeJRSaoW7y5zaN/D15xMrwvHQCj5lsdPai6KfJmYyaf79l9/0ZjOOX3rXph
 35DncIeEOxdIyB8mNaqFtjrI5fiknsjmt55RGEWg=
To: Julien Grall <julien@xen.org>
From: Trammell Hudson <hudson@trmm.net>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] EFI: Enable booting unified hypervisor/kernel/initrd
 images
Message-ID: <qrcMU44FmSMDmicmc9i2Lxpp4zrl0q2k8jgmTB9ZMyuBnbVDp84LHi5V_mNN2IlynTrft_BlSqUotpX4avgjNgMXA51f9cZVuaEoLEzje90=@trmm.net>
In-Reply-To: <6beb3e6b-e438-caa1-5b51-836091c05ade@xen.org>
References: <EGZ7EZE5F-c5YJVD9p0TtccTz06ZsdMcL21-BcB64dk9V3x8eKrB3dSDsLbGL4peCaENcp55uRsnWUONZYvrRaQh0tToALcaHRr-QMYNsH0=@trmm.net>
 <6beb3e6b-e438-caa1-5b51-836091c05ade@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Friday, September 4, 2020 1:58 PM, Julien Grall <julien@xen.org> wrote:

> On 28/08/2020 12:51, Trammell Hudson wrote:
> > This patch adds support for bundling the xen.efi hypervisor, the xen.cf=
g
> > configuration file, the Linux kernel and initrd, as well as the XSM, an=
d
> > CPU microcode into a single "unified" EFI executable.
>
> For Arm, I would also consider to add the DTB in "unified" EFI
> executable. See efi_arch_cfg_file_early() in xen/arch/arm/efi/efi-boot.h.

Excellent point. The DTB is critical as well. I'll add that to
the patch on Xen's gitlab.

x86 has a similar call in efi_arch-cfg_file_early() to load
the CPU microcode from the unified image, if it exists.

> [...]
> I don't seem to be able to apply the patch using git-am:

You might try this one instead -- it has been based on the
latest staging tree and has had a few rounds of style guide
issues as well as the commit id for the systemd-boot code.

https://gitlab.com/xen-project/xen/-/merge_requests/4

--
Trammell

