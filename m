Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F114D3FC761
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 14:37:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175664.319922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL30X-00085h-Se; Tue, 31 Aug 2021 12:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175664.319922; Tue, 31 Aug 2021 12:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL30X-000835-Pf; Tue, 31 Aug 2021 12:36:53 +0000
Received: by outflank-mailman (input) for mailman id 175664;
 Tue, 31 Aug 2021 12:36:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MdRD=NW=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mL30W-00082z-Ru
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 12:36:52 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d842eef-0a58-11ec-ad2e-12813bfff9fa;
 Tue, 31 Aug 2021 12:36:51 +0000 (UTC)
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
X-Inumbo-ID: 1d842eef-0a58-11ec-ad2e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630413411;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0Jpm+deE3nMBIKEvtN14lq7Lr8c6Hv61ym4Tfhly6XI=;
  b=KlYcDGe6Jn5VT4WPlZa9KGPxFopoDRimqb8azifg+8WiiY0AQVtiwmL6
   tYSUraX5mY6XoTTz06fK8KoRkRBLr54zok1rXwj/FqSOfr0P4zV2/yXFE
   6KrNKTnYTO0dqsR7mbiYLL7wvU8fURLt3VF9ApgJ0fZPSqFbF5g/iSThg
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: cUVhvcjlxuJ6YqAhUuwzLCiE/lIVjAJelXGBuvQoJufjvEfqoCjzs3opLPVufDccB15OeicG21
 DVVrQu96OIQlg4wfV/ptFLcqOXUTwIct9wHh0HBpzcOD2J1EGgopg+FtKmFQ1DHlQSidbtmH1h
 fUEEulVe4nM5zz8BDpIQG5GG2N0eclwSL3SDRiJgnJJyLHe6QZm3FuLSZ6538INZ0m0jXlObRJ
 BmaPrgrqHBwyyixYV4lzIcbL2HQqhiKy60xMuzjAIbHRYogLOHKjHyTZJ13WhnIem1Tqr673V/
 aqii1HSdIHt7Y78id4fBnO1g
X-SBRS: 5.1
X-MesageID: 51684542
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:YySUSKDC3ET+bQ/lHemm55DYdb4zR+YMi2TC1yhKJiC9Ffbo8v
 xG/c5rsiMc5wxxZJhNo7290cq7MBHhHPxOgbX5VI3KNGKNhILBFvAH0WKI+VPd8kPFmtK1rZ
 0QEJRDNA==
X-IronPort-AV: E=Sophos;i="5.84,366,1620705600"; 
   d="scan'208";a="51684542"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH] Config.mk: update OVMF to edk2-stable202108
Date: Tue, 31 Aug 2021 13:36:37 +0100
Message-ID: <20210831123637.22647-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update to the latest stable tag.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index 4d723eec1d0d..82b0c7c22743 100644
--- a/Config.mk
+++ b/Config.mk
@@ -244,7 +244,7 @@ QEMU_TRADITIONAL_URL ?= git://xenbits.xen.org/qemu-xen-traditional.git
 SEABIOS_UPSTREAM_URL ?= git://xenbits.xen.org/seabios.git
 MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
 endif
-OVMF_UPSTREAM_REVISION ?= b37cfdd2807181aed2fee1e17bd7ec1190db266a
+OVMF_UPSTREAM_REVISION ?= 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5
 QEMU_UPSTREAM_REVISION ?= master
 MINIOS_UPSTREAM_REVISION ?= 051b87bb9c19609976fb038f386920e1ce5454c5
 
-- 
Anthony PERARD


