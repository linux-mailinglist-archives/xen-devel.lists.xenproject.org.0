Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AF469D452
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 20:47:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498352.769208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUC88-0002B3-Ce; Mon, 20 Feb 2023 19:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498352.769208; Mon, 20 Feb 2023 19:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUC88-00027W-9a; Mon, 20 Feb 2023 19:47:20 +0000
Received: by outflank-mailman (input) for mailman id 498352;
 Mon, 20 Feb 2023 19:47:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT8u=6Q=citrix.com=prvs=408b4b2b9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUC86-00026t-Em
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 19:47:18 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 602db248-b157-11ed-933d-83870f6b2ba8;
 Mon, 20 Feb 2023 20:47:16 +0100 (CET)
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
X-Inumbo-ID: 602db248-b157-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676922436;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7VQfclR45ezJQ1yrJQ2kJaN6bb0KI469e9W5ZkludMw=;
  b=AIOZrcLffhFxppJoj4xOCbEuOlC7sa/EGoavxAgXpkxLksfcsxMTZCiu
   OKG9HHvbCgUJwPmhUVBo2tiVr5nS402Y+YjNYgoWg+/o2UBnaL2MJNQm+
   gthWIDTpXUEEHq5Ir/kAvUfbhYwNLJjXnGcCFwN9khxmrd4akEFu/cezF
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97179657
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:pTM7IayVIavplnEF1yl6t+chxirEfRIJ4+MujC+fZmUNrF6WrkUEx
 2ZJXWiHOv+DN2Xxc9hwO97jpx9S6p7UzddmGgJurCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRkP6gT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVhp3
 KI1DgwBVzeGjMO6wo69S+Yxxf12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZQKxxnJ+
 D+Zl4j/Kj0dHeewjhSIzn7yhNTRwibAV508EqLto5aGh3XMnzdOWXX6T2CTvv2RmkO4HdVFJ
 CQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooL2yQuEAmkPThZadccr8sQxQFQXO
 kShxo2zQ2Y16fvMFCzbr+3Pxd+vBcQLBVYlTHEpazcJ2v7mq6A/jC7JT9k+U5fg27UZBgrM6
 zyNqSE/gZAagsgKy7i38Dj7vt68mnTaZlVrv1uKBwpJ+is8Pdf4PNLwtTA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGVb5IOi8Axkkfi+F1/ronhewO
 SfuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKlDZrXg+PR7Phju1+KTJrU3YE
 c3GGftA8F5AUfg3pNZIb7p1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYrpw3PXBt3VGJis+V2Pm
 /4Gbpvi9vmqeLGmCsUh2dJJfA9iwLlSLcyelvG7gcbZfFM2RTF+V66IqV7jEqQ895loei7z1
 inVcidlJJDX3xUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:Ic//7qgOvUfNyTTuVJAm6uCeTXBQXhoji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2RSvILBzySTV/wb57C8gcSVbeW19QYRcem9AZsQkzuQCWygYzJLrBEtP+tfKH
 IFjPA33AZJfx4sH6KG7ilsZZm7mzXT/qiWGSI7Ow==
X-IronPort-AV: E=Sophos;i="5.97,313,1669093200"; 
   d="scan'208";a="97179657"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] xen/irq: Perf improvements
Date: Mon, 20 Feb 2023 19:47:00 +0000
Message-ID: <20230220194702.2260181-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Andrew Cooper (2):
  xen/ioapic: Don't use local_irq_restore() to disable irqs
  x86/irq: Improve local_irq_restore() code generation and performance

 xen/arch/x86/include/asm/system.h | 9 ++-------
 xen/arch/x86/io_apic.c            | 5 ++---
 2 files changed, 4 insertions(+), 10 deletions(-)

-- 
2.30.2


