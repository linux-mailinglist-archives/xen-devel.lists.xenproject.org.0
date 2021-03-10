Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C5333412F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 16:08:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96178.181739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK0RJ-00067c-KY; Wed, 10 Mar 2021 15:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96178.181739; Wed, 10 Mar 2021 15:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK0RJ-00067E-HK; Wed, 10 Mar 2021 15:07:57 +0000
Received: by outflank-mailman (input) for mailman id 96178;
 Wed, 10 Mar 2021 15:07:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RhJS=II=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lK0RH-000679-Fy
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 15:07:55 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86c03f93-bcd8-41c6-aa9d-e0b069cb2548;
 Wed, 10 Mar 2021 15:07:54 +0000 (UTC)
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
X-Inumbo-ID: 86c03f93-bcd8-41c6-aa9d-e0b069cb2548
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615388874;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=H8CeaVXjAnDjHLQdGAJ2W0DeuqpxBVGQQCRcjxJ7XTI=;
  b=fb/Xm2JGKpTF1g0nEkqhvZ9Ca/OeSs/LAYiYTCXsX8rK7CULpBc3R8U1
   Ub9S7QHFawNJ7wk8fRSoj5y0U6POOduc9ttDtf2DHyh8eVcp3qqb7/7zJ
   hJWof1qvN46R0DKkglwZ5oyTe4YgWcGBHXpY+qwLSVHrdpFcuuFa4opKe
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: AkBwGd5Ey2RN+frF5Iv39Nmoqw0SAZemf2wQN7ng9D2kDgNykfGlSuHHiQELjWVR6YdWX8u9UC
 1mV+YXVRepoza3fpurI+augkOFMahAAmOKYps8iSa4us5G57bl8cv2MeZABTEHXDKyBVVN7KVY
 5USMM9GP9KxkE+LG+QXVI94bhr78U2Hp3FyepfEO81/r8aEDT9aLsOdEDOa/HbItiic6DrDfZX
 DShJ0umqcPqA2TaYlB6lE3tcx+lIncH69QeQpfjQpjarDsU8YVzvkxLIN0pwFUTC1GP1GhWvrp
 ud0=
X-SBRS: 4.0
X-MesageID: 39328629
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/ZREaamuNTdVcEQ4QEk+Mr6Hd+fpDfPFiWdD5ilNYBxZY6Wkvu
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/4FgrU5F7GkQQXgpS+UPJhvhLGStQHINg/f0qpm1a
 lme7VjE9GYNykZse/W6BS1euxM/PCp66at7N2z815IbSVHL55t9B14DAHzKCxLbS1LH4AwGp
 bZxucvnUvWRV0tYs62BmYIUoH4zrWh/q7OWwIMBBIs9WC14w+A1biSKXel9yZbeRZ/hYwv63
 HClBb0j5/Tzc2T+1v38l6W1ZVfldf6o+Eze/Cku4w0ARGpojntSahdd5e+nBYTydvfomoCoZ
 3tiDNlF/s21F/rREGShnLWqkTd+Qdry1THjWWAiX/Gp8HkQT4hT/BKg5lUaHLimgIdleA58I
 lum1iBv55yCx7dmSjmo+fFTAtrkE2vyEBS2tI7vjhnSo0ZZ6ZWrYsDuGhcF5ANB2bG84AoHu
 V0Zfuslcp+QBeidHbesXBowNuwGk4rFhPDb0QessyRyVFt7QNE5npd/dcYmHgY8pI7Vt165/
 /ZKOBWmKpVTskQBJgNdNspcI+MJUHmBTnNN2+TJlqPLtB9B1v976TZzZ9wyOWjeJkjxIY/lp
 LbQDpjxBQPUnOrM+Ki9tlm9Q3MXXWcUF3Wu7xjzqk8gJLQbv7KNjCOU18nmcfImYRiPuTrH8
 ydFbgTJt2LFxqKJa95mzfQdrMXFFwlFOoSgdo/U0LmmLOzFqTa8tb1XdyWGKDgCl8fKwfCK0
 pGZhffDuNa4HumX3fp6SKhI0/FSwjE8ZV8HLOyxZl19KE9crBp9iAuzXqSwOalQAcywJAeTQ
 9CB5/JvryyoHW/4GrEhl8ZTiZ1PwJl6LvtVG4PiwcWP139Yd84yqCiUFEX2HOGIyl2RN/NHD
 heoExq+bm2I4b4/1FFN/u3dmiQj3Z7ngPCc6sh
X-IronPort-AV: E=Sophos;i="5.81,237,1610427600"; 
   d="scan'208";a="39328629"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard from public API
Date: Wed, 10 Mar 2021 15:07:22 +0000
Message-ID: <20210310150722.27194-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Exactly as with c/s f40e1c52e4, this is inappropriate for a stable library.

That change actually broke the build with:

  include/xendevicemodel.h:52:5: error: unknown type name 'ioservid_t'
       ioservid_t *id);
       ^

as libxendevicemodel.h now uses a type it can't see a typedef for.  However,
nothing noticed because the header.chk logic is also broken (fixed
subsequently).

Strip the guard from the public header, and remove compensation from
devicemodel's private.h.  Fix the dmop design doc to discuss both reasons
behind the the ABI design.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Paul Durrant <paul@xen.org>
CC: Ian Jackson <iwj@xenproject.org>

v2:
 * Patch dmop.pandoc as well.

For 4.15.  This is a build fix, even if current staging can't spot the
breakage.

These two issues highlight that libxendevcemodel.h has never been checked
since its introduction, because the checking logic only saw an empty file.
---
 docs/designs/dmop.pandoc         | 10 +++++++---
 tools/libs/devicemodel/private.h |  2 --
 xen/include/public/hvm/dm_op.h   |  5 -----
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/docs/designs/dmop.pandoc b/docs/designs/dmop.pandoc
index 8e9f95af47..336be64397 100644
--- a/docs/designs/dmop.pandoc
+++ b/docs/designs/dmop.pandoc
@@ -4,9 +4,13 @@ DMOP
 Introduction
 ------------
 
-The aim of DMOP is to prevent a compromised device model from compromising
-domains other than the one it is providing emulation for (which is therefore
-likely already compromised).
+The DMOP hypercall has a new ABI design to solve problems in the Xen
+ecosystem.  First, the ABI is fully stable, to reduce the coupling between
+device models and the version of Xen.
+
+Secondly, for device models in userspace, the ABI is designed specifically to
+allow a kernel to audit the memory ranges used, without having to know the
+internal structure of sub-ops.
 
 The problem occurs when you a device model issues an hypercall that
 includes references to user memory other than the operation structure
diff --git a/tools/libs/devicemodel/private.h b/tools/libs/devicemodel/private.h
index c4a225f8af..c24f3396bb 100644
--- a/tools/libs/devicemodel/private.h
+++ b/tools/libs/devicemodel/private.h
@@ -1,8 +1,6 @@
 #ifndef XENDEVICEMODEL_PRIVATE_H
 #define XENDEVICEMODEL_PRIVATE_H
 
-#define __XEN_TOOLS__ 1
-
 #include <xentoollog.h>
 #include <xendevicemodel.h>
 #include <xencall.h>
diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
index ef7fbc0d3d..fa3f083fed 100644
--- a/xen/include/public/hvm/dm_op.h
+++ b/xen/include/public/hvm/dm_op.h
@@ -25,9 +25,6 @@
 #define __XEN_PUBLIC_HVM_DM_OP_H__
 
 #include "../xen.h"
-
-#if defined(__XEN__) || defined(__XEN_TOOLS__)
-
 #include "../event_channel.h"
 
 #ifndef uint64_aligned_t
@@ -491,8 +488,6 @@ struct xen_dm_op {
     } u;
 };
 
-#endif /* __XEN__ || __XEN_TOOLS__ */
-
 struct xen_dm_op_buf {
     XEN_GUEST_HANDLE(void) h;
     xen_ulong_t size;
-- 
2.11.0


