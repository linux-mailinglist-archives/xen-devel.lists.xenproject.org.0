Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5746429162E
	for <lists+xen-devel@lfdr.de>; Sun, 18 Oct 2020 07:44:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8469.22610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kU1Tm-0005It-1n; Sun, 18 Oct 2020 05:43:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8469.22610; Sun, 18 Oct 2020 05:43:38 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kU1Tl-0005IU-Uw; Sun, 18 Oct 2020 05:43:37 +0000
Received: by outflank-mailman (input) for mailman id 8469;
 Sun, 18 Oct 2020 05:43:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KX+1=DZ=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1kU1Tl-0005IP-09
 for xen-devel@lists.xenproject.org; Sun, 18 Oct 2020 05:43:37 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f8e388b-a6f7-4a3f-b02f-3bb5d772b61b;
 Sun, 18 Oct 2020 05:43:36 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 781412080D;
 Sun, 18 Oct 2020 05:43:34 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=KX+1=DZ=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
	id 1kU1Tl-0005IP-09
	for xen-devel@lists.xenproject.org; Sun, 18 Oct 2020 05:43:37 +0000
X-Inumbo-ID: 5f8e388b-a6f7-4a3f-b02f-3bb5d772b61b
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5f8e388b-a6f7-4a3f-b02f-3bb5d772b61b;
	Sun, 18 Oct 2020 05:43:36 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 781412080D;
	Sun, 18 Oct 2020 05:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602999815;
	bh=xQx4tam510oViG0aS6IAIECEgE6lGctfYht63oAFTjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w5E1+nGVmBfju9sqafA7RNAyWyGXNV3glWIi0a1uVAyl5PpHYhnZwSlrCnlNiRfzs
	 cfV4uO4ZitYRPtno4rRqk/s62SY+Vkk0iEk8aerfp+YXmT6bAocVlLg03Vxy6aXm6p
	 C7/g4QRFCPJ09/zXowenG6SzN/MQpYZKW+T/2i1s=
Date: Sun, 18 Oct 2020 07:43:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: trix@redhat.com
Cc: linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-power@fi.rohmeurope.com, linux-gpio@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	spice-devel@lists.freedesktop.org, linux-iio@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	industrypack-devel@lists.sourceforge.net,
	linux-media@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
	linux-scsi@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-can@vger.kernel.org, netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, linux-nfc@lists.01.org,
	linux-nvdimm@lists.01.org, linux-pci@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, patches@opensource.cirrus.com,
	storagedev@microchip.com, devel@driverdev.osuosl.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-watchdog@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	bpf@vger.kernel.org, linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
	alsa-devel@alsa-project.org, clang-built-linux@googlegroups.com
Subject: Re: [RFC] treewide: cleanup unreachable breaks
Message-ID: <20201018054332.GB593954@kroah.com>
References: <20201017160928.12698-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201017160928.12698-1-trix@redhat.com>

On Sat, Oct 17, 2020 at 09:09:28AM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> This is a upcoming change to clean up a new warning treewide.
> I am wondering if the change could be one mega patch (see below) or
> normal patch per file about 100 patches or somewhere half way by collecting
> early acks.

Please break it up into one-patch-per-subsystem, like normal, and get it
merged that way.

Sending us a patch, without even a diffstat to review, isn't going to
get you very far...

thanks,

greg k-h

