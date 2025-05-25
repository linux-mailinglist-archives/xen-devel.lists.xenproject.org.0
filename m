Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF7AAC3520
	for <lists+xen-devel@lfdr.de>; Sun, 25 May 2025 16:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997152.1378123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJCD0-0005lu-Pm; Sun, 25 May 2025 14:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997152.1378123; Sun, 25 May 2025 14:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJCD0-0005iv-Mx; Sun, 25 May 2025 14:20:14 +0000
Received: by outflank-mailman (input) for mailman id 997152;
 Sun, 25 May 2025 14:20:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3gIk=YJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uJCCz-0005ip-Hn
 for xen-devel@lists.xenproject.org; Sun, 25 May 2025 14:20:13 +0000
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c5d187f-3973-11f0-a2fb-13f23c93f187;
 Sun, 25 May 2025 16:20:09 +0200 (CEST)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 95F3325400E5;
 Sun, 25 May 2025 10:20:07 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Sun, 25 May 2025 10:20:07 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 25 May 2025 10:20:06 -0400 (EDT)
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
X-Inumbo-ID: 5c5d187f-3973-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1748182807; x=1748269207; bh=wmGTDjl+RO4WCPUxF9h21I+ISdQwEoLG
	xy64Vn/J5Fs=; b=DP+92jO7r/AlGqRiaVKSPMMPT/GekBaqn6zRv5nBX9txNmZl
	twpC1SftGOpz0vRxjnoXxNKrA7n+mqTNZFzmak2OiIltI5Yfy5wHm6ykDd4dS9h3
	5/qpB144hJCZVqM2t6376xsjkvde/5bGCNgbGsFd82iU9Ol4HsTsej1Zpf8lind6
	Bm15BHaUr3VfyTRf0omalSdxZaxp2Jz9dw7U6dkD9ct0Ptmodpid7DjbiLhrowlC
	+oaf9COPrErBbT9SDbd15wX1rfF4rNV6bnNlq08oT9iBsDNfoFcV2JvkB9iDukGb
	nDnty0QNFUmwaOHc0nr8s2hz2Y3NnmRWH9eDTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1748182807; x=1748269207; bh=wmGTDjl+RO4WCPUxF9h21I+ISdQw
	EoLGxy64Vn/J5Fs=; b=plVsI0LZxEIL7wluJyTo58e+jyd+AU5RZYw5C2bD3hGt
	0mOJbb0QZohFf3XYqb1yoJD3a/Ki2B1RsHi3066lfJSVpT5ho1rvlFmIGDtNX2OU
	Mi30uuRZGyhIL0luHAmcOMeLsnXM2/2vOV4PBi8f5XgnTW46K28foQy8cUIHYZgM
	9wwhPWdImjtNjBq+05YKlu3i8wi/EHw97LNN6y4yqBUv5Cs7ahgasgyo7gfg+D+6
	oICth3FObJNU91oILq8fgh61gd9aAkeeghPVAwDtJHtbBlzJ5rWFgV0AKAUF4aU+
	p0UIQNvMTlT8/76pb+GK+HYjbyLcVNLoT04FgOalpw==
X-ME-Sender: <xms:FyczaORNwsS12Hd12Y_JPkCExbePqFP4WEZpBhvrwQnIReaKojLX1Q>
    <xme:FyczaDwe3CZHvwId7Us5XRjXSh1Jf6Ce-EuwuXRbMpGP3h15a9HJkoJxOI6hiEnfk
    N4-LJ3-yUdWUQ>
X-ME-Received: <xmr:FyczaL0fky3r1CzPf-PWQkmd9icBOjWyLg7JsIwgG630q4iGisjMdVkaMccUFjOjerN8zqCh3p1sPN-DFxPAaz-YIgVnrDyMUl8oZleCAxvo4P_t1gN0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddugeekfeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecunecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefo
    rghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkh
    esihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhn
    peelkefhudelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgr
    rhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtth
    hopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehl
    ihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehmrghrmhgrrhgvkh
    esihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:FyczaKC9RwMG-XYxjKDx1sS-VWuI2FKgolqG4KPvmyHs3GgjD0M54Q>
    <xmx:FyczaHhBraXWRdqUbXp0uC5uKpbqAC7vckXesQB6OSPbb_uP5S7BcQ>
    <xmx:FyczaGpMHR8txsjjIZAdF3A6w14IHZfDRy-2y817Q71mdQKJbc5rsA>
    <xmx:FyczaKhWdmIeVkUrZc3rCWnnRO_pGRXxHpHEc3ZlzlxlQwfxx7GqBw>
    <xmx:FyczaMjqBH1aLayep7-aicAEaTfITKmZ4tX7Vq0-_Jw2H_1tWSgXr1Bt>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v1 0/5] Fix XHCI console on legacy MB2 boot
Date: Sun, 25 May 2025 16:15:41 +0200
Message-ID: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

XHCI console works fine with UEFI boot, as Xen doesn't relocate itself. But on
legacy boot, relocation is a problem, as the hardware is programmed with
physical addresses of structures that are moved. Fix this by adding new console
init hooks. This series includes also few minor improvements that were useful
when working on the fix.

Marek Marczykowski-Górecki (5):
  console: add relocation hook
  drivers/char: Handle Xen relocation in the XHCI console driver
  drivers/char: make dbc_uart_dump() a bit more useful
  drivers/char: remove outdated comment in xhci driver
  console: support multiple serial console simultaneously

 docs/misc/xen-command-line.pandoc |   4 +-
 xen/arch/x86/setup.c              |   8 ++-
 xen/drivers/char/Kconfig          |  11 +++-
 xen/drivers/char/console.c        | 108 ++++++++++++++++++++++++-------
 xen/drivers/char/serial.c         |  18 +++++-
 xen/drivers/char/xhci-dbc.c       |  98 +++++++++++++++++++---------
 xen/include/xen/console.h         |   2 +-
 xen/include/xen/serial.h          |   7 ++-
 8 files changed, 204 insertions(+), 52 deletions(-)

base-commit: 7ab4b392b78b5ac1c7a1fb1d085637526e67521a
-- 
git-series 0.9.1

