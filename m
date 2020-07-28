Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF392230650
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 11:18:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0Lkp-0001gM-D3; Tue, 28 Jul 2020 09:18:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=139A=BH=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k0Lko-0001gH-7i
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 09:18:34 +0000
X-Inumbo-ID: 4f0e0640-d0b3-11ea-8b1d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f0e0640-d0b3-11ea-8b1d-bc764e2007e4;
 Tue, 28 Jul 2020 09:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sjv/L6hz1YrCvxTOhpyWiGw3pyQEgsy/LiJEyUnsD/U=; b=FU0HNTN1iUoJ8yy8ZzYwTC6Ap7
 8/izMpkwkHS/Ft1mujCVI/UNMGzrPP8FtbfQ78o312H8gUmgiScz0nFl8EOiYy2nueAS2V2bzPZhg
 KW6vUC45EVTYIwfgxrzXnXwG6kPbI2lNUMKoHHAoVs0oAusn5SFauRpixnrvxFsjKgTU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k0Lkm-0003hk-5S; Tue, 28 Jul 2020 09:18:32 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k0Lkl-0007du-SK; Tue, 28 Jul 2020 09:18:32 +0000
From: Paul Durrant <paul@xen.org>
To: qemu-devel@nongnu.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH] configure: define CONFIG_XEN when Xen is enabled
Date: Tue, 28 Jul 2020 10:18:28 +0100
Message-Id: <20200728091828.21702-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

The recent commit da278d58a092 "accel: Move Xen accelerator code under
accel/xen/" introduced a subtle semantic change, making xen_enabled() always
return false unless CONFIG_XEN is defined prior to inclusion of sysemu/xen.h,
which appears to be the normal case. This causes various use-cases of QEMU
with Xen to break.

This patch makes sure that CONFIG_XEN is defined if --enable-xen is passed
to configure.

Fixes: da278d58a092 ("accel: Move Xen accelerator code under accel/xen/")
Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 2acc4d1465..f1b9d129fd 100755
--- a/configure
+++ b/configure
@@ -7434,6 +7434,7 @@ if test "$virglrenderer" = "yes" ; then
   echo "VIRGL_LIBS=$virgl_libs" >> $config_host_mak
 fi
 if test "$xen" = "yes" ; then
+  echo "CONFIG_XEN=y" >> $config_host_mak
   echo "CONFIG_XEN_BACKEND=y" >> $config_host_mak
   echo "CONFIG_XEN_CTRL_INTERFACE_VERSION=$xen_ctrl_version" >> $config_host_mak
 fi
-- 
2.20.1


