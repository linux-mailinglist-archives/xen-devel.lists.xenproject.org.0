Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5AC69D182
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 17:41:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498237.769085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU9E0-00071q-8W; Mon, 20 Feb 2023 16:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498237.769085; Mon, 20 Feb 2023 16:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU9E0-00070F-4A; Mon, 20 Feb 2023 16:41:12 +0000
Received: by outflank-mailman (input) for mailman id 498237;
 Mon, 20 Feb 2023 16:41:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NJGl=6Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pU9Dy-0006Vi-F1
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 16:41:10 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 610e7f9e-b13d-11ed-933d-83870f6b2ba8;
 Mon, 20 Feb 2023 17:41:09 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id l8so1771380ljq.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 08:41:09 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.108.92.nat.umts.dynamic.t-mobile.pl. [46.204.108.92])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a2e6a08000000b002934d555783sm65798ljc.6.2023.02.20.08.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 08:41:09 -0800 (PST)
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
X-Inumbo-ID: 610e7f9e-b13d-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1MpbYkthmfF/j5tbT9Ls4HfPFbZX5FNFb/Z6pTJAxg=;
        b=UiIfZFboHwH67hlEPkfcEEE/34XyvkKLZ3y8Q8ltELBBsTV2cs9LT1uyKUQU3ovcXZ
         8shObelEr+mzCYJipWEmbrz7VcsdwZvJjjl2mgTRAjHrcGrLM4Fxw48XGarvD7jBhS+d
         7V2Hb4o5oHHiSR+97ncsNbwkpfDL9Y+94sFMuUzqL06Dtc1/WuXyvqSsMrYTlHOGMWlx
         a4jwBtMy6nnMYIjGtrYDgR8/4XVCRIdBaiMIuz8UbV0sgtQo5qbZrNG1JHV34jQFpATp
         b+mZKbJJw68kQhyBAtbSBrIgGy8FKizpzfUBiCKgIAowhCAAZv8cMQpmOY7GWluqz3s6
         6D9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1MpbYkthmfF/j5tbT9Ls4HfPFbZX5FNFb/Z6pTJAxg=;
        b=5xKKEqDKHOT4t2uPcqMStuA9UcgvSgf4TT1/eReTSkC5A2n691oK59sOgpnQgWu0UY
         R8jrfNVkvyUFcbfgpKwoxC9bbxPDe3bk3zl1XYRBUNet9yFTFfF1Pvtfvp86LsLpQoh0
         QK7UA9je45Jyd0AAlQXSi+Uki1GA5zz7v4oPcDy8hEGL2KWVV2/zPyYFKiCuLVYkHrTP
         VsvPf9+9GL0/B/jWcWBjPbmmzxFxtEeB6WiK/cQjKYMP+CeMjcHKYysW/zzoUAKCJLqS
         hGmQTI5CFLTTWoy1+qwnxYHMIPOTAoJaqOi1JrzAxlNT2nhaaLSThpDnkn+l4uKLbU4c
         7XVg==
X-Gm-Message-State: AO0yUKWsjCe7XGgevRr5e12BZGtQl9UBaLZJtX2SBLugLjhQHPGSB/r7
	VVf0bA9Fr3wilppcC/9CswNjhvfXPsw=
X-Google-Smtp-Source: AK7set89y+om3PEExn5kE/pMZmu/hwZFPshETVGlfRftqChwkTdlUAQ7Jc7yBHswtwsGxg9jGWk1sQ==
X-Received: by 2002:a05:651c:2128:b0:293:fea:c912 with SMTP id a40-20020a05651c212800b002930feac912mr822844ljq.13.1676911269268;
        Mon, 20 Feb 2023 08:41:09 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/4] xen: change <asm/bug.h> to <xen/bug.h>
Date: Mon, 20 Feb 2023 18:40:58 +0200
Message-Id: <e21f8b59f22cc8bdb425a5002ed6e1473090b16f.1676909088.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1676909088.git.oleksii.kurochko@gmail.com>
References: <cover.1676909088.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the generic version of bug.h stuff was introduced use <xen/bug.h>
instead of unnecessary <asm/bug.h>

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

---
Changes in V2:
 * Put [PATCH v1 4/4] xen: change <asm/bug.h> to <xen/bug.h> as second patch,
   update the patch to change all <asm/bug.h> to <xen/bug.h> among the whole project
   to not break build.
 * Update the commit message.
---
 xen/arch/arm/include/asm/div64.h     | 2 +-
 xen/arch/arm/vgic/vgic-v2.c          | 2 +-
 xen/arch/arm/vgic/vgic.c             | 2 +-
 xen/arch/x86/acpi/cpufreq/cpufreq.c  | 2 +-
 xen/arch/x86/include/asm/asm_defns.h | 2 +-
 xen/drivers/cpufreq/cpufreq.c        | 2 +-
 xen/include/xen/lib.h                | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/include/asm/div64.h b/xen/arch/arm/include/asm/div64.h
index 1cd58bc51a..fc667a80f9 100644
--- a/xen/arch/arm/include/asm/div64.h
+++ b/xen/arch/arm/include/asm/div64.h
@@ -74,7 +74,7 @@
 
 #elif __GNUC__ >= 4
 
-#include <asm/bug.h>
+#include <xen/bug.h>
 
 /*
  * If the divisor happens to be constant, we determine the appropriate
diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
index 1a99d3a8b4..c90e88fddb 100644
--- a/xen/arch/arm/vgic/vgic-v2.c
+++ b/xen/arch/arm/vgic/vgic-v2.c
@@ -16,8 +16,8 @@
  */
 
 #include <asm/new_vgic.h>
-#include <asm/bug.h>
 #include <asm/gic.h>
+#include <xen/bug.h>
 #include <xen/sched.h>
 #include <xen/sizes.h>
 
diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
index f0f2ea5021..b9463a5f27 100644
--- a/xen/arch/arm/vgic/vgic.c
+++ b/xen/arch/arm/vgic/vgic.c
@@ -15,9 +15,9 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/bug.h>
 #include <xen/list_sort.h>
 #include <xen/sched.h>
-#include <asm/bug.h>
 #include <asm/event.h>
 #include <asm/new_vgic.h>
 
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index c27cbb2304..18ff2a443b 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -27,6 +27,7 @@
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
 
+#include <xen/bug.h>
 #include <xen/types.h>
 #include <xen/errno.h>
 #include <xen/delay.h>
@@ -35,7 +36,6 @@
 #include <xen/sched.h>
 #include <xen/timer.h>
 #include <xen/xmalloc.h>
-#include <asm/bug.h>
 #include <asm/msr.h>
 #include <asm/io.h>
 #include <asm/processor.h>
diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
index d9431180cf..a8526cf36c 100644
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -6,7 +6,7 @@
 /* NB. Auto-generated from arch/.../asm-offsets.c */
 #include <asm/asm-offsets.h>
 #endif
-#include <asm/bug.h>
+#include <xen/bug.h>
 #include <asm/x86-defns.h>
 #include <xen/stringify.h>
 #include <asm/cpufeature.h>
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index a94520ee57..354f78580b 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -26,6 +26,7 @@
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
 
+#include <xen/bug.h>
 #include <xen/types.h>
 #include <xen/errno.h>
 #include <xen/delay.h>
@@ -39,7 +40,6 @@
 #include <xen/guest_access.h>
 #include <xen/domain.h>
 #include <xen/cpu.h>
-#include <asm/bug.h>
 #include <asm/io.h>
 #include <asm/processor.h>
 
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 05ee1e18af..e914ccade0 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -24,12 +24,12 @@
 
 #ifndef __ASSEMBLY__
 
+#include <xen/bug.h>
 #include <xen/inttypes.h>
 #include <xen/stdarg.h>
 #include <xen/types.h>
 #include <xen/xmalloc.h>
 #include <xen/string.h>
-#include <asm/bug.h>
 
 #define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
 #define WARN_ON(p)  ({                  \
-- 
2.39.0


