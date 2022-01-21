Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C535B4963FF
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 18:35:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259419.447780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAxnb-0002xP-DP; Fri, 21 Jan 2022 17:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259419.447780; Fri, 21 Jan 2022 17:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAxnb-0002us-9l; Fri, 21 Jan 2022 17:34:07 +0000
Received: by outflank-mailman (input) for mailman id 259419;
 Fri, 21 Jan 2022 17:34:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VSV1=SF=citrix.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1nAxnZ-0002um-Gs
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 17:34:05 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51b7c256-7ae0-11ec-bc18-3156f6d857e4;
 Fri, 21 Jan 2022 18:34:03 +0100 (CET)
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
X-Inumbo-ID: 51b7c256-7ae0-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642786443;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VK65MgBu7gmYcHaFkcDzpB2RbWKXetKgRtqoFIU1Xuw=;
  b=f9/FtKwdj52PlPPtlU1XLIorQE+b42q7tFEfJwlUmbLxU0hUOOCn6ySu
   +SO8BPMISiV0lvPJ8Lv9DchTOv+To0gjmrD8eRUKZGmMHNxFYdjeNRmHJ
   9fBjm03M3/Rc5X5asyPu0Am65oYZL5eRsqai0iKY3M6XmDJJGPTbp1xZR
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ZdUT1Vt8SDVBdm94CQgH4nqp5IN/JiNbkDS23hYvWvzbKOvrdVcQMo7fbmgemrt1WjIKLSLBHo
 s2HWUKF/awO+vj1o+MYhA7iObF0bBcIlSzMg3+m/88uVtTBRWkd1ErpdUZh9yDB9zh5zQMh9yH
 SvhWpVT0kACtnz0Lh1ueS7E0UKnftTWqfO0rfYMKxRwJM2YyzW4R9HmLts4hc7iGMJRnszkCsH
 s+Q9OaW9Ds4ay1P9F2JAlITuSQ+8tHowtkxcUbQ43Sf+ms/TgiYHeZooMx1dKAASwhnraWCSI3
 FEPW93dbalg/LwzrxDS18sPf
X-SBRS: 5.2
X-MesageID: 62429039
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WKMM3qPe7UBLZ2HvrR3EkcFynXyQoLVcMsEvi/4bfWQNrUp2gTZVz
 GoaD22BO/fYYjHxKd9ybd6/80xT65aDmNdgQAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Eg6w7VRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYowi5rvRN7
 tBIjrKLVT1xJ/Hcg8sCdBYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrnd9lKMDkMZkAs3Vk5TrYEewnUdbIRKCiCdpwgm1s3JEWRqe2i
 8wxYis+dxfSOU10HHA0EpgbsMXrr13kSmgNwL6SjfVuuDWCpOBr65DoOcDed9jMTN1bk0KSr
 3/D12v8CxAecteYzFKt92mwrvXCkSPyRMQZE7jQ3udnhUDWymENBRk+U1y9rv+kzEmkVLp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gCmVwK3S8QefB0AeQzJBYcBgv8gzLRQy3
 0KNt8PkA3poqrL9YWmG6r6eoDe2OC4UBWwPfykJSU0C+daLiIw/kxvVQtFLEKe/jdruBXf2z
 izihDI/jLUal8JN16i98V3dmDWqjpzISAcv4UPQRG3N0+9iTNf7PcryswGdtKseatbCJrWcg
 JQas/Wu3cQyK5SIrwK2XN9VBe25/NmaFzKJ1DaDAKId3ziq/neie6VZ7zd/OFplP644RNP5X
 KPAkVgPvcEOZRNGeYcyOtvsUJpykcAMAPy8DqiMBueidKSdY+NuEMtGQUeLl17gn0E3+U3UE
 cfKKJ38ZZr25EkO8dZXewv/+eJzrszd7TmKLXwe8/hB+eDPDJJyYe1UWGZilshjsMu5TPz9q
 r6zzfeixRRFS/HZaSLK64MVJl1iBSFlWcqp85cGJ7fffFIO9IQd5xn5mutJl2tNxPw9qws11
 ivlBh8wJKTX2BUr1jlmmlg8MeiyDP6TXFowPDA2PEbA5pTQSd3H0UvrTLNuJeNP3LU6lZZcF
 qBZE+3dXKgnYmmZqlw1MMmsxKQ/JU/DrV/fYEKYjM0XIsQIq/rhoIG0J2MCNUAmU0KKiCfJi
 +Twj1yAGctaGV0K4QS/QKvH8m5ddEM1wIpaN3Yk6PEKEKk12IQ1eSH3kNEtJMQAdUfKyjeAj
 l7EChYEv+jd5YQy9YCR16yDqo6oFcp4H1ZbQDaHverna3GC8zrx25JEXcaJYSvZCDH+9pK9a
 LgH1Pr7KvAGwgpH6tIuD7ZxwKsizNLzvLsGnB98FXDGYg3zWLNtK3WLx+dVsahJyuMLsAe6Q
 BvXqNJbJa+IKIXuF1tIfFgpaeGK1Pc1nDjO7KtqfBWmtXEvpLfeCBdcJRiBjiBZPYBZCoJ9z
 LdzotMS5iy+lgEuboSMgBdL+jneNXcHSagm6M0XWde5lgoxx1heSpXAESuqsoqXYtBBP0R2c
 D+ZgK3O2+ZVykbYKidhEHHM2axWhIgUuQAMx1gHfgzblt3Aj/4x/RtQ7TVoEVgFkkQZi7p+a
 jpxKkl4BaSS5DM51sFMUlelFxxFGBDEqFf6zEEElTGBQkSlPoAXwLbR5QpZEJglzl9h
IronPort-HdrOrdr: A9a23:GeJ3dqhqPSrGz1Ny24JPKQjF+3BQXtYji2hC6mlwRA09TySZ//
 rBoB19726RtN9xYgBHpTnuAsm9qB/nmaKdgrNhWItKPjOW21dARbsKheCJrgEIcxeOkdK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.88,306,1635220800"; 
   d="scan'208";a="62429039"
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>, Igor Druzhinin
	<igor.druzhinin@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, "Richard
 Henderson" <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>, <xen-devel@lists.xenproject.org>,
	<qemu-devel@nongnu.org>
Subject: [PATCH] xen-mapcache: Avoid entry->lock overflow
Date: Fri, 21 Jan 2022 17:33:29 +0000
Message-ID: <20220121173329.904412-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In some cases, a particular mapcache entry may be mapped 256 times
causing the lock field to wrap to 0. For example, this may happen when
using emulated NVME and the guest submits a large scatter-gather write.
At this point, the entry map be remapped causing QEMU to write the wrong
data or crash (since remap is not atomic).

Avoid this overflow by increasing the lock field to a uint16_t and also
detect it and abort rather than continuing regardless.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 hw/i386/xen/xen-mapcache.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
index bd47c3d672..82dc495a60 100644
--- a/hw/i386/xen/xen-mapcache.c
+++ b/hw/i386/xen/xen-mapcache.c
@@ -52,7 +52,7 @@ typedef struct MapCacheEntry {
     hwaddr paddr_index;
     uint8_t *vaddr_base;
     unsigned long *valid_mapping;
-    uint8_t lock;
+    uint16_t lock;
 #define XEN_MAPCACHE_ENTRY_DUMMY (1 << 0)
     uint8_t flags;
     hwaddr size;
@@ -355,6 +355,12 @@ tryagain:
     if (lock) {
         MapCacheRev *reventry = g_malloc0(sizeof(MapCacheRev));
         entry->lock++;
+        if (entry->lock == 0) {
+            fprintf(stderr,
+                    "mapcache entry lock overflow: "TARGET_FMT_plx" -> %p\n",
+                    entry->paddr_index, entry->vaddr_base);
+            abort();
+        }
         reventry->dma = dma;
         reventry->vaddr_req = mapcache->last_entry->vaddr_base + address_offset;
         reventry->paddr_index = mapcache->last_entry->paddr_index;
-- 
2.27.0


