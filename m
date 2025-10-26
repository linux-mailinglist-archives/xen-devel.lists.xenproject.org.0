Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A01A3C0A64C
	for <lists+xen-devel@lfdr.de>; Sun, 26 Oct 2025 11:54:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151341.1481948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCyNG-0004Ni-Bx; Sun, 26 Oct 2025 10:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151341.1481948; Sun, 26 Oct 2025 10:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCyNG-0004MH-92; Sun, 26 Oct 2025 10:53:22 +0000
Received: by outflank-mailman (input) for mailman id 1151341;
 Sun, 26 Oct 2025 10:53:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1QZq=5D=wanadoo.fr=christophe.jaillet@srs-se1.protection.inumbo.net>)
 id 1vCyND-0004M9-IX
 for xen-devel@lists.xenproject.org; Sun, 26 Oct 2025 10:53:20 +0000
Received: from smtp.smtpout.orange.fr (smtp-74.smtpout.orange.fr
 [80.12.242.74]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7cee1de-b259-11f0-980a-7dc792cee155;
 Sun, 26 Oct 2025 11:53:13 +0100 (CET)
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
 by smtp.orange.fr with ESMTPA
 id CyN1vAKxM7TjyCyN1vOFVf; Sun, 26 Oct 2025 11:53:11 +0100
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
X-Inumbo-ID: f7cee1de-b259-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1761475991;
	bh=nLTWNBJbJPgxe0pVePlYQcmuPVBtcUlK4ki+WghVXJE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=dN663kkOmoL1Yqtgf9bVfvFh8G1TTPKem18dWi4I2911mqyC5iut+ymVsKal1toGP
	 GK2J+gdGuZka/JHwzkIIsdZqTBFkb0js8kNl5iB3pR50ziH/u1rNduIQ4sO0mvhz+h
	 r0haMKkGv2xttG7+CRbFMzhDseidaiRZA0//eHz8jxK7n7Q2LEpT7ZFzk9UhGDS2vQ
	 hs7S09rfKLv1agePW2zPKkANzCpOxohm204s/HZ6MMIfoxg7+caSI+oC8vej2XXr2W
	 bFem56uVJRHEESHx87OXSlVcO7/2+dZYhcXcm0zf3u7Wkrklk7P+L1lzkkfi5Myktc
	 +gIqKDc6ftgpA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 26 Oct 2025 11:53:11 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Juergen Gross <jgross@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	xen-devel@lists.xenproject.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] xen/usb: Constify struct hc_driver
Date: Sun, 26 Oct 2025 11:51:04 +0100
Message-ID: <63241c9e857646d895ce615b998d41ee4829f9e3.1761475831.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct hc_driver' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  52065	  23176	    256	  75497	  126e9	drivers/usb/host/xen-hcd.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  52897	  22344	    256	  75497	  126e9	drivers/usb/host/xen-hcd.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/host/xen-hcd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xen-hcd.c b/drivers/usb/host/xen-hcd.c
index 1c2a95fe41e5..0a94d302911a 100644
--- a/drivers/usb/host/xen-hcd.c
+++ b/drivers/usb/host/xen-hcd.c
@@ -1388,7 +1388,7 @@ static int xenhcd_get_frame(struct usb_hcd *hcd)
 	return 0;
 }
 
-static struct hc_driver xenhcd_usb20_hc_driver = {
+static const struct hc_driver xenhcd_usb20_hc_driver = {
 	.description = "xen-hcd",
 	.product_desc = "Xen USB2.0 Virtual Host Controller",
 	.hcd_priv_size = sizeof(struct xenhcd_info),
@@ -1413,7 +1413,7 @@ static struct hc_driver xenhcd_usb20_hc_driver = {
 #endif
 };
 
-static struct hc_driver xenhcd_usb11_hc_driver = {
+static const struct hc_driver xenhcd_usb11_hc_driver = {
 	.description = "xen-hcd",
 	.product_desc = "Xen USB1.1 Virtual Host Controller",
 	.hcd_priv_size = sizeof(struct xenhcd_info),
-- 
2.51.0


