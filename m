Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DDD1958EC
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 15:26:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHpt2-0001Lm-Gj; Fri, 27 Mar 2020 14:23:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hYVq=5M=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jHpt1-0001Lh-4D
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 14:23:03 +0000
X-Inumbo-ID: 767c4ab2-7036-11ea-bec1-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 767c4ab2-7036-11ea-bec1-bc764e2007e4;
 Fri, 27 Mar 2020 14:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585318980;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=6kf/NXFUIHKWXKiyfOHvDYwwwDpQgN54QMhfRrTjJgA=;
 b=GFSVQ0F/X+/H5nJpfgS0Ab0d0tVx8sSPFVT878/wpPkMty+pTlmd3VthrTG1QSImWG
 F/L7u2xKAZwh/ruzyVqb7dNPHBFfbXzhtttHDly63XPHBlaFc+UpnfpTQIx7tksBv2+k
 fu1eqa0qB9oQaa/dvjfJpCS305P04JsWUfjyhUqrqk0KGsMaGxOtVuiAqjtmaT0lyQkG
 xfDKqeL6JLco93TNX5mCHYkKO+YsRj7BiVobrf8A7UP0MarB2hTU1MWUEoGBSe0sP6B1
 t3ZNPQeYil4swKOqs/DLt3QJ4H6HzyHHpftBQETsslbmxsNWAMQ6R4WNfmgsIvTpf+3e
 37Sw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS1Wwg"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
 with ESMTPSA id 204e5fw2REMx4IP
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 27 Mar 2020 15:22:59 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Date: Fri, 27 Mar 2020 15:22:56 +0100
Message-Id: <20200327142256.3256-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v1] libxl: remove limit for default number of
 event channels
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Olaf Hering <olaf@aepfle.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The imposed limit of 1023 is too low for a three digit value of vcpus.
Remove the arbitrary value of 1023 and let Xen decide about the upper limit.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 docs/man/xl.cfg.5.pod.in   | 8 +++-----
 tools/libxl/libxl_create.c | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 0e9e58a41a..ac3fe5f35a 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1332,11 +1332,9 @@ L</vuart="uart"> to know how to enable vuart console.
 Limit the guest to using at most N event channels (PV interrupts).
 Guests use hypervisor resources for each event channel they use.
 
-The default of 1023 should be sufficient for typical guests.  The
-maximum value depends on what the guest supports.  Guests supporting the
-FIFO-based event channel ABI support up to 131,071 event channels.
-Other guests are limited to 4095 (64-bit x86 and ARM) or 1023 (32-bit
-x86).
+The maximum value depends on what the guest supports.  Guests supporting the
+FIFO-based event channel ABI support up to 131,071 event channels.  Other
+guests are limited to 4095 (64-bit x86 and ARM) or 1023 (32-bit x86).
 
 =item B<vdispl=[ "VDISPL_SPEC_STRING", "VDISPL_SPEC_STRING", ...]>
 
diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index e7cb2dbc2b..17c128bc07 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -226,7 +226,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
             b_info->iomem[i].gfn = b_info->iomem[i].start;
 
     if (!b_info->event_channels)
-        b_info->event_channels = 1023;
+        b_info->event_channels = -1U;
 
     libxl__arch_domain_build_info_setdefault(gc, b_info);
     libxl_defbool_setdefault(&b_info->dm_restrict, false);

