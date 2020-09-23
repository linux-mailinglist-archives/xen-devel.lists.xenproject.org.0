Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BDF27597B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 16:10:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL5SW-0004o7-Da; Wed, 23 Sep 2020 14:09:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6W+X=DA=protonmail.com=mathieu.tarral@srs-us1.protection.inumbo.net>)
 id 1kL5SU-0004o2-Si
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 14:09:23 +0000
X-Inumbo-ID: be655d3f-8794-4a3a-9554-c943fcb32bcc
Received: from mail-40134.protonmail.ch (unknown [185.70.40.134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be655d3f-8794-4a3a-9554-c943fcb32bcc;
 Wed, 23 Sep 2020 14:09:19 +0000 (UTC)
Date: Wed, 23 Sep 2020 14:09:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1600870157;
 bh=K+wlajLsRA2LV7sdHujyv9aHfWQ4vczpzsQVdblMECQ=;
 h=Date:To:From:Reply-To:Subject:From;
 b=Yqty6k33pPp6wFevOrJUtp5b5Bd0jsHZA4NrJvv5EgKGlAUbQWwaWr9otWL/8PnPN
 ogkZNZH+iaE/Hr3z9kBEv1ArsPFTyIcpbkcgZ95e57ssh6iRtxRQtezhVs5cgnCofb
 pyh1vTDdI0+8sZJVRtllfbsHfWQNX2TTGaEnPelo=
To: xen-devel <xen-devel@lists.xenproject.org>
From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Subject: [Libvirt] Failed to get udev device for syspath
 '/sys/devices/virtual/dmi/id'
Message-ID: <WBFXzWm02qaMoLNSOnDbHmebQchJ7xMXXT6ocR4SZ-6Pw8VClueBmTcHS3xHg_vttQRPdwdaHeNGskEHxHPETSSY03En7rejlTQ4lXhjlZk=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
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
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

I'm facing an issue with libvirt and the LIBXL driver, failing when searchi=
ng for DMI data in /sys.

info : libvirt version: 5.0.0, package: 4+deb10u1 (Guido G=C3=BCnther <agx@=
sigxcpu.org> Thu, 05 Dec 2019 00:22:14 +0100)
error : udevGetDMIData:1719 : internal error: Failed to get udev device for=
 syspath '/sys/devices/virtual/dmi/id' or '/sys/class/dmi/id'
error : libxlDriverConfigNew:1803 : Unable to configure libxl's memory mana=
gement parameters
error : virStateInitialize:662 : Initialization of LIBXL state driver faile=
d: internal error: Failed to get udev device for syspath '/sys/devices/virt=
ual/dmi/id' or '/sys/class/dmi/id'
error : daemonRunStateInit:799 : Driver state initialization failed

The relevant function udevGetDMIData in libvirt:
https://github.com/libvirt/libvirt/blob/cb09344a2cccc0cc9bcefa3cb53d7af45ba=
92631/src/node_device/node_device_udev.c#L1726

I don't understand what's happening, as this initialization failure only ha=
ppens when I boot on the Xen kernel.
Also, the /sys/class/dmi* paths are not exposed on Xen. (should they ?)

Note: Running on Xen 4.12.1

Any ideas ?

Thanks !

