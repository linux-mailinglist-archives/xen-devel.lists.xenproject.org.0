Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13609497D5A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 11:46:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259831.448524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBwqg-000473-Mk; Mon, 24 Jan 2022 10:45:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259831.448524; Mon, 24 Jan 2022 10:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBwqg-00044I-JP; Mon, 24 Jan 2022 10:45:22 +0000
Received: by outflank-mailman (input) for mailman id 259831;
 Mon, 24 Jan 2022 10:45:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IDYO=SI=citrix.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1nBwqe-00044C-OE
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 10:45:20 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7f5da55-7d02-11ec-bc18-3156f6d857e4;
 Mon, 24 Jan 2022 11:45:19 +0100 (CET)
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
X-Inumbo-ID: b7f5da55-7d02-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643021119;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zaufoJxtLeaLv6fsm/av7h5s3Ob9S1OA40u/CizUiV0=;
  b=QAyIuHBeUWrrRzT0OFNNUkTC9C5Y/Rhs3tQ5ELw2BQ2WthxRXIYF+bWQ
   C4S6eRdmuO5J0PMxPl4ZFIiQrGitBwuGtkr3sq4l9Kz54fXxamaGI14ZP
   4u7q0QhdnlDur0wa7lGATV6wzRxAMuvRcH6wA9I/D2wiWD7b+Tvb7DuVx
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: agwjQFoBElyj729aO7SRYdm4ddjcICK/Vbt5KsA6VxElZCZZFARe6RSkz7N0D+mZwn2VpTke4X
 ZxYh8659465PhyN/rchPhKXvwlXP3hJKc3o15VAkvQVKdphHjgXUuFRSiE8u45uhtXPELLqyX0
 GeVeBWs49f0NIvOp3Bt7iG0GF4PzsHh+OVSm/deAb2NzMWlugdKh9PK+KE1Ag7ghEdFgSDwVOB
 VBO4bw1cwt7AE6av2mhBKmb63ZBiDU+7sjhZxiQhZb45iifpEYPzFtwItGhscV2E1iPZXBZbtJ
 cEx6M96gSkXeWz41hEUAI7F6
X-SBRS: 5.2
X-MesageID: 62529907
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8U7q7qPU716TpJbvrR33kcFynXyQoLVcMsEvi/4bfWQNrUoq0mcDz
 TFJWzrUMvmLY2r8eNwgbo2280xQ6J6EndU1GQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Eg4w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo2yJmNwo6
 eRoiYyfZFwvBZPQs+1GawYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrnd9lKMDkMZkAs3Vk5TrYEewnUdbIRKCiCdpwgm1t3JEfRam2i
 8wxYBFWXVPMQwJ0HGwNDoxlmsXwlHbDWmgNwL6SjfVuuDWCpOBr65DoOcDed9jMTN1bk0KSr
 3/D12v8CxAecteYzFKt92mwrvXCkSPyRMQZE7jQ3udnhUDWymENBRk+U1y9rv+kzEmkVLp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gCmVwK3S8QefB0AeQzJBYcBgv8gzLRQy3
 0KNt8PkA3poqrL9YWmG6r6eoDe2OC4UBWwPfykJSU0C+daLiIw/kxvVQtFLEKe/jdruBXf2z
 izihDI/jLUal8JN16i98V3dmDWqjpzISAcv4UPQRG3N0+9iTNf7PcryswGdtKseatbCJrWcg
 JQas5Ge6+xXLKCoqDyibb4LJ4+1zP/eCCKJ1DaDAKId3ziq/neie6VZ7zd/OFplP644RNP5X
 KPAkVgPvcEOZRNGeYcyOtvsUJpykcAMAPy4Dqi8UzZYXnRmmOZrFglKbFXY4W3imVNEfUoXa
 cbCKpbE4Zr35M1aINuKqwU1jOVDKsMWnzq7qXXHI/OPiuL2WZJtYe1ZWGZil8hghE9+nC3b8
 sxEK+yBwAhFXev1b0H/qNBPdwFUdiNmVMGo8qS7k9JvxSI9QAkc5wL5m+t9K+SJYYwL/gs3w
 p1NchABkweu7ZE2AQ6LdmpieNvSsWVX9hoG0dgXFQ/wgRALON/3hI9GLsdfVeR5qIRLkKAlJ
 9FYK5ToKqkeEVzvpmVCBaQRWaQ/LnxHcyrUYXr8CNX+FrY9LzH0FijMJ1u2q3JWX3Pp7KPTY
 dSIj2vmfHbKfCw6ZO6+VR5l5wrZUaE1lL0gUk3WDMNUfUmwooFmJzao1q08It0WKAWFzTyfj
 l7EDRAdrOjLgok07NiW2vzU89b3S7NzThhAAm3WzbeqLi2GrGCt9pBNDbSTdjfHWWKqpKj7P
 bdJz+vxOeEslUpRt9YuCK5iyK8zvoO9p7JTwgl+Mm/MalCnVuFpLnWchJEdvaxR3L5J/wCxX
 xvXqNVdPLyIPuLjEUIQe1V5PrjSi6lMl2CLv/ovIUj86Ctmx5a9UB1fb0uWlShQDLppK4d5k
 +0vj9Ebtl6kgR0wP9fY0i0NrzaQLmYNWrkMv40BBNO5kRIiz1xPbMCOCiLy553TOdxAPlNzf
 22RjavGwb9d2lDDYzw4En2UhbhRgpEHuRZryl4eJgvWxoqZ16FvhBABoy4qSgl1zwlc17MhM
 2dmAER5OKGS8mo6n8NERW2tR1lMCRDxFpYdELfVeLk1l3WVa1E=
IronPort-HdrOrdr: A9a23:XxqP0qot8ckHyIRabizh0UEaV5oleYIsimQD101hICG8cqSj9v
 xG+85rsiMc6QxhIU3I9urwW5VoLUmyyXcX2/h0AV7BZniFhILAFugLhuGOrwEIcxeOkNK1vp
 0BT0ERMrPN5CBB/KPH3DU=
X-IronPort-AV: E=Sophos;i="5.88,311,1635220800"; 
   d="scan'208";a="62529907"
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>, Igor Druzhinin
	<igor.druzhinin@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, "Richard
 Henderson" <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>, <xen-devel@lists.xenproject.org>,
	<qemu-devel@nongnu.org>
Subject: [PATCH v2] xen-mapcache: Avoid entry->lock overflow
Date: Mon, 24 Jan 2022 10:44:50 +0000
Message-ID: <20220124104450.152481-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In some cases, a particular mapcache entry may be mapped 256 times
causing the lock field to wrap to 0. For example, this may happen when
using emulated NVME and the guest submits a large scatter-gather write.
At this point, the entry map be remapped causing QEMU to write the wrong
data or crash (since remap is not atomic).

Avoid this overflow by increasing the lock field to a uint32_t and also
detect it and abort rather than continuing regardless.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
Changes in v2: Change type to uint32_t since there is a hole there
anyway. The struct size remains at 48 bytes on x86_64.

 hw/i386/xen/xen-mapcache.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
index bd47c3d672..f2ef977963 100644
--- a/hw/i386/xen/xen-mapcache.c
+++ b/hw/i386/xen/xen-mapcache.c
@@ -52,7 +52,7 @@ typedef struct MapCacheEntry {
     hwaddr paddr_index;
     uint8_t *vaddr_base;
     unsigned long *valid_mapping;
-    uint8_t lock;
+    uint32_t lock;
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


