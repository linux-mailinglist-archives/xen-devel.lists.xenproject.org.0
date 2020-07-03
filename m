Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C5C213B6F
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 15:57:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrMAl-00057R-PX; Fri, 03 Jul 2020 13:56:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ntU=AO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jrMAk-00057M-Ex
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 13:56:10 +0000
X-Inumbo-ID: f2528e1c-bd34-11ea-bca7-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2528e1c-bd34-11ea-bca7-bc764e2007e4;
 Fri, 03 Jul 2020 13:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1593784569;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t2d9pyErofHDyiYmtc/NX4G6Sq0sIspmqxfCWwBaScA=;
 b=Wv6aHsWZpfcbkO3tSe2OcJ87I3H2j1jlNJdBvQzQ12DLa1WcV/kWmzFU
 IH4PLNzqyhnymPyiTNHWqQ7es/FCV49UsbL3bfpRw8lNTERm5+MCDbyih
 LpknOPsE39bzhOj+ThS81xa+SmV8DTYOHSh9PAM5JIdMu/BCWB2cf8MSd E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 2+zsXMfHhmfKNOlFvz9le2HA36lsPy6pIuqFOuRnuzsaAwMgs7yZ2OXtn/h4O7jTz8TCIkO2+G
 ArwZA4U1aqtlNlJ/VoUJPPW6y0cozf1c0DPgpd/OE2Jjgs6TwXheM5y9H/LcmrBWEMYM57vEjS
 QitnBZmoFIiZZGMCgrHV5HG4H4mm79GwQHe71tq0MiCfCyAFkT2syWaBRiEyyPBVZ7JfW92YLf
 g/1l+wujEZ4ewK3UyxvxF/gdPvcmJcYuz8EpK/TgDVOaJKDmUpv5+CTp4tgePA6aGi4qTllieW
 jfw=
X-SBRS: 2.7
X-MesageID: 21773974
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,308,1589256000"; d="scan'208";a="21773974"
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH for-4.14] Config: Update QEMU
Date: Fri, 3 Jul 2020 14:55:33 +0100
Message-ID: <20200703135533.336625-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Backport 2 commits to fix building QEMU without PCI passthrough
support.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index f7d10b7c4cc6..478928c178b7 100644
--- a/Config.mk
+++ b/Config.mk
@@ -245,7 +245,7 @@ SEABIOS_UPSTREAM_URL ?= git://xenbits.xen.org/seabios.git
 MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
 endif
 OVMF_UPSTREAM_REVISION ?= 20d2e5a125e34fc8501026613a71549b2a1a3e54
-QEMU_UPSTREAM_REVISION ?= 410cc30fdc590417ae730d635bbc70257adf6750
+QEMU_UPSTREAM_REVISION ?= ea6d3cd1ed79d824e605a70c3626bc437c386260
 MINIOS_UPSTREAM_REVISION ?= f57858b7e8ef8dd48394dd08cec2bef3c9fb92f5
 
 SEABIOS_UPSTREAM_REVISION ?= rel-1.13.0
-- 
Anthony PERARD


