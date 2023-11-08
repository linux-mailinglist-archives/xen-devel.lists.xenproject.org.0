Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A497E5A00
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 16:28:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629317.981442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0kT5-0001pe-V4; Wed, 08 Nov 2023 15:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629317.981442; Wed, 08 Nov 2023 15:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0kT5-0001mh-Rn; Wed, 08 Nov 2023 15:27:47 +0000
Received: by outflank-mailman (input) for mailman id 629317;
 Wed, 08 Nov 2023 15:27:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L2E1=GV=citrix.com=prvs=669c226bb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r0kT3-0001ly-RU
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 15:27:45 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c0726d3-7e4b-11ee-98da-6d05b1d4d9a1;
 Wed, 08 Nov 2023 16:27:44 +0100 (CET)
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
X-Inumbo-ID: 5c0726d3-7e4b-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1699457264;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4qvYJ95Qmj7vNymP0W4t0jy4zi1qzcW9Flfs/fZR3q8=;
  b=iQJel6izEMc7k9p8Bo8ISf+JVvjxzxXiLkN/HhgbrpLv9a31u9/Zdodj
   DfqdY+r949jeJm+HBwAdCHoOgT8Ew1r/IrT8bbzrzI/ql5IW3KE2mmMxK
   rfIqSTydTqz2pAgDiPYgjy2xSMHspYjg4fl0OiD5BuhIw9mhuSJQ2Kflp
   o=;
X-CSE-ConnectionGUID: rtGzRFCOSGaJJVEY25MWVw==
X-CSE-MsgGUID: qPYDbZIdQjeEc228BsiRDw==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 130706603
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:QpM02643ssFRzzl6B0WWTgxRtMfHchMFZxGqfqrLsTDasY5as4F+v
 jZKUTuPPa7eZWLzfYt/Poi29UxSvZGDnNVqTgNori1mHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU355wehBtC5gZlPKkT7AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 +A3OgojRTe4qOuU4oyWe7Mxo/sdM5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmRJUIXUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxR7H/
 jyYpz+R7hcyLeSu5TC3036VhOLilnmhCKgJFYeU6as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZac8AvvsIyQT0s1
 3eKksnvCDgpt6eaIVqC8p+EoDX0PjIaRUcAeCsFQA0t89Tl5oYpgXrnRdZ5EbWpicX1FCu2y
 DSDtisWnKkal8oC3eO6+jjvjyq3o5nVTiY8/gjNQn++9QR9eZKkYIqzr1Pc6J5oDIufVEjHg
 3EClOCX9uVIBpaI/BFhW81UQuvvvazcdmSB0BgwR/HN6ghB5Va5Ya9C2h9VA3xGO+QmRxLYO
 hL2hj1Osco70GSRUUNnX26gI510nPm8TIm9CqG8gslmOMYrKFHdlM16TQvAhzqzzRJEfbQXY
 M/DKa6R4WAm5bOLJdZcb8way7Yvjhsm32LVSouTI/+PiuHGOyf9pVvoKjKzggEFAECs+l69H
 y53bZfi9vmmeLSWjtPr2YASN0sWCnMwGIr7rcdaHsbafFs3QzF7U6+OnOl+E2CAo0iyvr6Xl
 kxRp2cBlQGh7ZE5AV7iho9fhEPHAs8k8CNT0d0ENle0wXkzCbtDH49GH6bbiYIPrbQ5pdYtF
 qltRil1KqgXItgx02hHPMaVQU0LXEjDuD9iyAL8OmdmIcc+GFGSkjImFyO2nBQz4uOMnZNWi
 9WdOsnzG/LvmywK4B7qVc+S
IronPort-HdrOrdr: A9a23:/7Th4Kish5tsMpDT1NSgRJPAZnBQX8d23DAbv31ZSRFFG/FwyP
 rDoB1L73LJYWgqMk3IwerwQZVoMkmsjaKdgLNhdItKOTOM11dAQ7sSiLcKrwePJ8S6zJ866U
 4CSdk3NDSTNykfsS+S2mDRLz9j+qjhzEnBv5ab854Hd2FXgtRbnmVE43GgYy5LrWd9ZKYRJd
 653I5qtjCgcXMYYoCSAWQEZfHKo5nmhY/rehkPAj8g8U2rgSmz4LD3PhCE1lNGOgk/i4sKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/M28ZOH8uFj+kSM3HJhhyzbIpsdrWetHQeof2p6nwtjN
 7Qyi1QdPhb2jf0RCWYsBHt0w7v3HIF8Hn502KVhnPlvIjQWC86I9Apv/MVTjLpr24b+P1s2q
 NC2GyU87BNCwnboSj779/UEzl3i0uPp2Y4m+J7tQ0SbWJeUs4fkWUsxjIVLH4yJlO71GnhKp
 gsMCjo3ocZTbpdVQGagoAg+q3oYp15JGb8fqFLgL3u79EepgEE86MVqfZv40so5dYzTYJJ6P
 /DNbktnLZSTtUOZaY4H+sZR9CrY1a9NS4kHVjiU2gPLpt3Tk7lutry+vE49euqcJsHwN87n4
 nASkpRsSo3d1j1AcOD0ZVX+lSVKV/NKwjF24Vb/dx0q7f8TL3kPWmKT00vidKpp7EaDtfAU/
 i+NZpKC7voLHfoG4xOwwriMqMiXkU2QYkQoJI2SliOqsXEJsnjsfHaau/aIP73HTMtSgrEcw
 g+tfjIVbV9B2yQKw7FaULqKgzQk2TEjOxNLJQ=
X-Talos-CUID: 9a23:WVNEam8tKQf6y1QXAgyVv1QINdIfXFb691jZAW2GJFczFZiqd0DFrQ==
X-Talos-MUID: 9a23:NAZt/gomQvvQj1OOvUcezyhaBeti0YWiMUIAvJ5c4ZmuLi1KFyjI2Q==
X-IronPort-AV: E=Sophos;i="6.03,286,1694750400"; 
   d="scan'208";a="130706603"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Christopher Clark <christopher.clark@starlab.io>, "Daniel P
 . Smith" <dpsmith@apertussolutions.com>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH for-4.18 1/3] docs/sphinx: Fix syntax issues in hyperlaunch.rst
Date: Wed, 8 Nov 2023 15:27:25 +0000
Message-ID: <20231108152727.58764-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231108152727.58764-1-andrew.cooper3@citrix.com>
References: <20231108152727.58764-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

sphinx-build reports:

  docs/designs/launch/hyperlaunch.rst:111: WARNING: Title underline too short.
  docs/designs/launch/hyperlaunch.rst:203: WARNING: Unexpected indentation.
  docs/designs/launch/hyperlaunch.rst:216: WARNING: Unexpected indentation.

Nested lists require newlines as delimiters.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Christopher Clark <christopher.clark@starlab.io>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Henry Wang <Henry.Wang@arm.com>
---
 docs/designs/launch/hyperlaunch.rst | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/docs/designs/launch/hyperlaunch.rst b/docs/designs/launch/hyperlaunch.rst
index 4c138da884cc..3bed36f97637 100644
--- a/docs/designs/launch/hyperlaunch.rst
+++ b/docs/designs/launch/hyperlaunch.rst
@@ -108,7 +108,7 @@ both modes of configuration from the same binary and when paired with its XSM
 flask, provides strong controls that enable fine grained system partitioning.
 
 Hypervisor Launch Landscape
----------
+---------------------------
 
 This comparison table presents the distinctive capabilities of Hyperlaunch with
 reference to existing launch configurations currently available in Xen and
@@ -200,11 +200,13 @@ The benefits of this structure include:
   domains.
 * Commonality: Reuses the same logic for initial basic domain building across
   diverse Xen deployments.
-	* It aligns the x86 initial domain construction with the existing Arm
-	  dom0less feature for construction of multiple domains at boot.
-	* The boot domain implementation may vary significantly with different
-	  deployment use cases, whereas the hypervisor implementation is
-	  common.
+
+  * It aligns the x86 initial domain construction with the existing Arm
+    dom0less feature for construction of multiple domains at boot.
+
+  * The boot domain implementation may vary significantly with different
+    deployment use cases, whereas the hypervisor implementation is common.
+
 * Correctness: Increases confidence in the implementation of domain
   construction, since it is performed by the hypervisor in well maintained and
   centrally tested logic.
@@ -213,8 +215,9 @@ The benefits of this structure include:
 * Capability: Supports launch of advanced configurations where a sequenced
   start of multiple domains is required, or multiple domains are involved in
   startup of the running system configuration
-	* eg. for PCI passthrough on systems where the toolstack runs in a
-	  separate domain to the hardware management.
+
+  * eg. for PCI passthrough on systems where the toolstack runs in a separate
+    domain to the hardware management.
 
 Please, see the ‘Hyperlaunch Device Tree’ design document, which describes the
 configuration module that is provided to the hypervisor by the bootloader.
-- 
2.30.2


