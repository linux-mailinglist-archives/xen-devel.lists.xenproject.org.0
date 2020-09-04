Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9911B25E16A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 20:19:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEGIi-0002X6-3j; Fri, 04 Sep 2020 18:19:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YEB=CN=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kEGIh-0002Wy-2U
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 18:19:03 +0000
X-Inumbo-ID: c6ec4614-2786-43da-820c-6e1eead48624
Received: from mail2.protonmail.ch (unknown [185.70.40.22])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6ec4614-2786-43da-820c-6e1eead48624;
 Fri, 04 Sep 2020 18:19:00 +0000 (UTC)
Date: Fri, 04 Sep 2020 18:18:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1599243539;
 bh=faqPcrwc4y7c9jQ8ueecNNep+28z+yCstHlG4ZT2ehQ=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=FK59CEm+qtVxyPdKIOwG8is4UGP/8zA8QTS1133IviPy+zPbpivj8Gi5RkipEm8oj
 JpgKE9/KzfNi1gSObkA1XxxZZyg25t/rpvykIKisOHSAiDd2VWI6yAo7yYBj5Ny85N
 G2Im+O/6o2FIEOrWMVTnVTLLX4gK2DpZmzakOj8g=
To: Trammell Hudson <hudson@trmm.net>
From: Trammell Hudson <hudson@trmm.net>
Cc: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] EFI: Enable booting unified hypervisor/kernel/initrd
 images
Message-ID: <MCvbo5-dJcQ2-Sa-Rq2T7m0V2Z1WwsG2fSvBHwKL-dkI2KD5-0EMkGU9MT1VEv-tvnWhcZx3PhHp8V37pYm1l9oBO2_o--c7LMkb0QRmJXY=@trmm.net>
In-Reply-To: <qrcMU44FmSMDmicmc9i2Lxpp4zrl0q2k8jgmTB9ZMyuBnbVDp84LHi5V_mNN2IlynTrft_BlSqUotpX4avgjNgMXA51f9cZVuaEoLEzje90=@trmm.net>
References: <EGZ7EZE5F-c5YJVD9p0TtccTz06ZsdMcL21-BcB64dk9V3x8eKrB3dSDsLbGL4peCaENcp55uRsnWUONZYvrRaQh0tToALcaHRr-QMYNsH0=@trmm.net>
 <6beb3e6b-e438-caa1-5b51-836091c05ade@xen.org>
 <qrcMU44FmSMDmicmc9i2Lxpp4zrl0q2k8jgmTB9ZMyuBnbVDp84LHi5V_mNN2IlynTrft_BlSqUotpX4avgjNgMXA51f9cZVuaEoLEzje90=@trmm.net>
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

On Friday, September 4, 2020 2:05 PM, Trammell Hudson <hudson@trmm.net> wro=
te:

> On Friday, September 4, 2020 1:58 PM, Julien Grall julien@xen.org wrote:
> > On 28/08/2020 12:51, Trammell Hudson wrote:
> > > This patch adds support for bundling the xen.efi hypervisor, the xen.=
cfg
> > > configuration file, the Linux kernel and initrd, as well as the XSM, =
and
> > > CPU microcode into a single "unified" EFI executable.
> >
> > For Arm, I would also consider to add the DTB in "unified" EFI
> > executable. See efi_arch_cfg_file_early() in xen/arch/arm/efi/efi-boot.=
h.
>
> Excellent point. The DTB is critical as well. I'll add that to
> the patch on Xen's gitlab.

Here is an untested patch for loading DTB from unified image:

https://gitlab.com/xen-project/xen/-/merge_requests/4/diffs?commit_id=3De55=
336e11cc6a7ce77f0bf8ce3aa0712c7017e8b

--
trammell

