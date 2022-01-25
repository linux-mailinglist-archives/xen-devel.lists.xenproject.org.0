Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1C849B29B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:07:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260097.449261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfg-0006dv-6B; Tue, 25 Jan 2022 11:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260097.449261; Tue, 25 Jan 2022 11:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJff-0006PZ-M9; Tue, 25 Jan 2022 11:07:31 +0000
Received: by outflank-mailman (input) for mailman id 260097;
 Tue, 25 Jan 2022 11:07:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJa9-0006Mn-KP
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:01:49 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 303aa9cf-7dce-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 12:01:47 +0100 (CET)
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
X-Inumbo-ID: 303aa9cf-7dce-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108507;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7LVYW8YWOJlXXAUd6KoKnvWUHrnrQ1R9DfyWOZvNP8c=;
  b=bW1dUCLhgpo1Zgb4sLneELhHSCRh3KzA9D5jrqidYdejnEGMafbuRm87
   EOUmi8d0Z+8AtS7hZgLNKSyaDYvdsMMJo6hSYKIRejnfVjdGU0HSOsXYv
   ik6CUaskLmPOrtbYwK6E15i4aTbZhgSeB+/yGGFQcsHcl2Rnzyedr+1nl
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: BJ5OhIWmiv5bNqa4JeEk82dycIC++1IzrapYmnxdQSAUiZr8yTZdq7T1ruyFP6VvWtbZy1iVyS
 h+Jzyb/0ZLEofJdMWNljj+/vvC6ZSh1bRhEeeGk2fkolObZMSqh/DX/UhWuowxvhzk/njaI6lX
 h0PHuLgFaeD0h5/7A2H/jKbEmIFk50Bt8+WDkUglIHeA5RwnSKTHh1/0bnDIun2tcq0SsQpcGC
 mp46fh3Fl796oHuFXmSoo4NnJ/7UfN2V7urh/WCU1WNY+UR3VgJvp3zQTPpSwI9s4jh7pW297g
 B8jA9rwRofD9Im9fUPolNDd0
X-SBRS: 5.2
X-MesageID: 63106973
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bOI9v6suCZdu7gjXSF6WY/tvHufnVKpZMUV32f8akzHdYApBsoF/q
 tZmKWuAPa7camr8fdt2atm+8RkPu8XSmIdgTgE5/ylnF38b+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYx24XhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplt8SwQwggNYz1xtseCjNCEXovHvBv5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6AP
 JNBN2swN3wsZTVJAXQUB5cdrt64rV/yTBlGlXO4gvootj27IAtZj+G2bYu9lsaxbd5Ogk+Sq
 2bC/mL4KhIXLtqSzXyC6H3ErvDLtTP2XsQVDrLQ3vx3hFyewEQDBRtQUkG0ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9haHvA+6QqN4rHJ+AvfDW8BJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1qfrreeojq5GBFLEmxbTzUGFlomvvD89dRbYg30cv5vF6u8j9vQED72w
 iyXoCVWu4j/nfLnxI3gowmZ3mvESozhC1dsu16JBj7NAhZROdb9D7FE/2Q3+hqpwGyxalCa9
 EYJlMGFhAzlJcHczXfdKAnh8VzA2hpkDNE+qQM3d3XC3270k5JGQWy2yGsiTKuOGp1cEQIFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQPsMpKF7Yo38/NBb4M4XRfK4Ey/1X1
 XCzKp7EMJrnIf4/kGreqxk1j9fHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrtR0U9wmy2Mq
 4w3H5LTk313CbSiCgGKr9J7BQ1UfBATWMCnw+QKJ7XrClc3Rwkc5wr5nOlJl3pNxfoFz48lP
 xiVBydl9bYIrSSXcFrRMiE6NuqHsFQWhStTABHA9G2AgxALCbtDJo9FH3fuVbV4puFl09BuS
 PwJJ5eJDvhVE2yV8DUBd5jt6odlcU3z1w6JOiOkZhk5foJhGFOVqoO1IFO3+XlcFDezuOs/v
 6akilHRT60cSlkwF83Rcv+ukQ+85CBPhOJoUkLUCdBPY0GwopNyIin8g6ZvccEBIBnO3BWA0
 AOSDUtKrOXBudZtotLImbqFv8GiFO4nRhhWGGzS7LCXMyjG/zX8nd8cAbjQJT2EDTH64qSvY
 +lR3srQCvxfkQYYqZd4HpZq0bk6u4nlqYhFw1k2B37MdVmqVO9teyHUwclVu6RR7bZFog/qC
 FmX89xXNLjVasPoFFkdeFgsYuiZjKxGnzDT6bI+IVng5T8x972CCB0AMx6JgS1bDb10LIJ6n
 rtx5J9Is1Sy2kgwL9KLriFI7GDdfHUPXpIuuoweHIK22BEgzUtPYMCEByL7iH1Vhw6g7qX+z
 ueouZf/
IronPort-HdrOrdr: A9a23:GPjN0qkVmsXL1bLF3kIIouQl2gbpDfIE3DAbv31ZSRFFG/Gwve
 aIodg96FvIuA88MUtQ/exo9pPgfVrw3aNYiLN9AV7PZmXbkU+JCK0n0qfY+R3HPETFltK1t5
 0QFpSWYeeYZTMRse/B3CKaP/wcqePpzEnHv4njJw4Hd3AIV0k3hD0JaDqmLg==
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="63106973"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v9 15/30] build: handle always-y and hostprogs-always-y
Date: Tue, 25 Jan 2022 11:00:48 +0000
Message-ID: <20220125110103.3527686-16-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This will be used for xen/tools/.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/Rules.mk               | 10 +++++++++-
 xen/scripts/Makefile.clean |  3 ++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 13c1943da97e..5f2368805b36 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -78,9 +78,17 @@ else
 obj-y    := $(filter-out %/, $(obj-y))
 endif
 
+# hostprogs-always-y += foo
+# ... is a shorthand for
+# hostprogs-y += foo
+# always-y  += foo
+hostprogs-y += $(hostprogs-always-y)
+always-y += $(hostprogs-always-y)
+
 # Add subdir path
 
 extra-y         := $(addprefix $(obj)/,$(extra-y))
+always-y        := $(addprefix $(obj)/,$(always-y))
 targets         := $(addprefix $(obj)/,$(targets))
 lib-y           := $(addprefix $(obj)/,$(lib-y))
 obj-y           := $(addprefix $(obj)/,$(obj-y))
@@ -283,7 +291,7 @@ targets += $(call intermediate_targets, .init.o, .o) \
 # Build
 # ---------------------------------------------------------------------------
 
-__build: $(targets-for-builtin) $(subdir-y)
+__build: $(targets-for-builtin) $(subdir-y) $(always-y)
 	@:
 
 # Descending
diff --git a/xen/scripts/Makefile.clean b/xen/scripts/Makefile.clean
index 156d6307cf83..c2689d4af5fa 100644
--- a/xen/scripts/Makefile.clean
+++ b/xen/scripts/Makefile.clean
@@ -18,7 +18,8 @@ subdir-all := $(subdir-y) $(subdir-n) $(subdir-) \
               $(patsubst %/,%, $(filter %/, $(obj-y) $(obj-n) $(obj-)))
 
 __clean-files := \
-    $(clean-files) $(hostprogs-y) $(hostprogs-)
+    $(clean-files) $(hostprogs-y) $(hostprogs-) \
+    $(hostprogs-always-y) $(hostprogs-always-)
 
 __clean-files := $(wildcard $(__clean-files))
 
-- 
Anthony PERARD


