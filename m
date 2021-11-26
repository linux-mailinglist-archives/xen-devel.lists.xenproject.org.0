Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F3145EEC6
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:08:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232886.404131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxa-0003b4-6T; Fri, 26 Nov 2021 13:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232886.404131; Fri, 26 Nov 2021 13:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxZ-0003GL-2p; Fri, 26 Nov 2021 13:08:13 +0000
Received: by outflank-mailman (input) for mailman id 232886;
 Fri, 26 Nov 2021 13:08:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqavF-0002zD-KQ
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:49 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9227ff5f-4eb9-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 14:05:48 +0100 (CET)
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
X-Inumbo-ID: 9227ff5f-4eb9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931948;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LFV0YxOEuIiuCG9iI5eNKk5hv6ynkvXZ8FKbseF1zyo=;
  b=A1IyxymbTVDa9ZMeZefHQcSm+ukEKsbWVTc+HR9jZaYXlJAPLOXR15lc
   +itVk6Zjays+GiYCK3gSFo857Sap6kc7d6bamJyLvqx9N7ehSawFKOpzW
   EVsR0QxIP7WIGnMMVEx6t9Bius3JKQ5vBE178rIuGwFoswcEOooXGzNHA
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Q2YEL56UzM6ggU2Wf2ibE6MdCXcsbwTdC5Kj3RR/b0qIshnnNVIuD0y4PuDlIu7ndaSs4pYrNp
 e61zTTay7OW6wsxdA8sGVLZXojGgNEl1bCrVpvFnOMK407n93Afw75Yyb9geq4E6g71egX8nlW
 2NJUPJB/N6+ZolBXiBwdnWYObvoOOxCwS/M30UaCLkXMDqO4x91//bAtAyJVibP8qu8NdKYOFA
 Bb+7FAQwFB+fvMAujRFEUBmTwl5LA9b23XNvrEmrWvQGpGfum74NnwemIROUxy3haqKiaZM8V2
 A118EYJuLMxKhcdQMEbBhHKD
X-SBRS: 5.1
X-MesageID: 58696019
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uEGppaL1vw/jpdHZFE+RHJIlxSXFcZb7ZxGr2PjKsXjdYENShmQDx
 jQWWTqOb/fbMGuheI1xO9y2p00BusDXz9ZrHgRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es5xbZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2sho5u7
 pYTu6WCYgd5HvHJn9s/CBdXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gpg2JEQRa+PD
 yYfQWNEdx6eei9gAHEaOa8uuNannTqlczIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wh
 EjL4mD4CREyL8GExHyO9XfErv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCsmwdCRPwTTeMD2iqNmoqI5gGmJDMKQWsUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZo87SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFRONHNi2+AswGzARN8wGCxFQLpU
 J8swZX20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Lv2EgeRg4bphYIlcFh
 XM/XysKv/e/21PwMMdKj3+ZUZx2ncAM6/y5PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1ulAv7GMGgpzz6gOX2WZJgYepcWLd4Rrtit/3sTcS82
 4s3CvZmPD0DCrCjOXeOrtZIRb3IRFBiba3LRwVsXrbrCmJb9KsJUpc9GJstJN5ombp7jODN8
 i3vU0NU0gOn13bGNR+LejZob7a2BcRzqncyPCoNO1e02id8PdbzvflHL5ZnL6M68OFDzOJvS
 6VXccu3HfkSGC/M/C4QbMehodU6Jgirnw+HIwGsfCM7I8x7XwXM99K9Jlnv+SACAzCZr8w7p
 7H8hArXTYBaH1ZpDdrMaeLpxFS05CBPlOV3VkrOA99SZESzr9Q6d32v1qc6epheJw/Cyz2W0
 xetLS0Z/eSd8ZUo9NTphLyfq9v7GeVJAUcHTXLQ6qy7NHeG8zP7k5NASuuBYRvUSHjwpPe5f
 exQwvzxbK8HkVJNv9YuGrpn1/tjtd7mprscxQV4BnTbKV+sD+o4cHWB2MBOsIxLx6NY5lTqC
 h7epIECNOXbIt7hHX4QOBEhP7aK2vwjkzXP6eg4fRfh7yht8bvbCUhfMnFgUsCGwGeZ5G/9/
 dochQ==
IronPort-HdrOrdr: A9a23:7FEcL6/XJ8dFQCzmIj1uk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re5cjztCWE7gr5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtBD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58696019"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 35/65] x86/mtrr: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:16 +0000
Message-ID: <20211126123446.32324-36-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Most of mtrr/ looks to be compatibility for pre-64bit days.  It can probably
be pruned substantially.
---
 xen/arch/x86/cpu/mtrr/generic.c | 18 ++++++++++--------
 xen/arch/x86/cpu/mtrr/mtrr.h    |  8 ++++----
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
index 7cf4cd01f3f6..47aaf76226e0 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -287,7 +287,8 @@ static void set_fixed_range(int msr, bool *changed, unsigned int *msrwords)
 	}
 }
 
-int generic_get_free_region(unsigned long base, unsigned long size, int replace_reg)
+int cf_check generic_get_free_region(
+    unsigned long base, unsigned long size, int replace_reg)
 /*  [SUMMARY] Get a free MTRR.
     <base> The starting (base) address of the region.
     <size> The size (in bytes) of the region.
@@ -309,8 +310,8 @@ int generic_get_free_region(unsigned long base, unsigned long size, int replace_
 	return -ENOSPC;
 }
 
-static void generic_get_mtrr(unsigned int reg, unsigned long *base,
-			     unsigned long *size, mtrr_type *type)
+static void cf_check generic_get_mtrr(
+    unsigned int reg, unsigned long *base, unsigned long *size, mtrr_type *type)
 {
 	uint64_t _mask, _base;
 
@@ -499,7 +500,7 @@ static void post_set(bool pge)
 	spin_unlock(&set_atomicity_lock);
 }
 
-static void generic_set_all(void)
+static void cf_check generic_set_all(void)
 {
 	unsigned long mask, count;
 	unsigned long flags;
@@ -522,8 +523,8 @@ static void generic_set_all(void)
 	}
 }
 
-static void generic_set_mtrr(unsigned int reg, unsigned long base,
-			     unsigned long size, mtrr_type type)
+static void cf_check generic_set_mtrr(
+    unsigned int reg, unsigned long base, unsigned long size, mtrr_type type)
 /*  [SUMMARY] Set variable MTRR register on the local CPU.
     <reg> The register to set.
     <base> The base address of the region.
@@ -566,7 +567,8 @@ static void generic_set_mtrr(unsigned int reg, unsigned long base,
 	local_irq_restore(flags);
 }
 
-int generic_validate_add_page(unsigned long base, unsigned long size, unsigned int type)
+int cf_check generic_validate_add_page(
+    unsigned long base, unsigned long size, unsigned int type)
 {
 	unsigned long lbase, last;
 
@@ -584,7 +586,7 @@ int generic_validate_add_page(unsigned long base, unsigned long size, unsigned i
 }
 
 
-static int generic_have_wrcomb(void)
+static int cf_check generic_have_wrcomb(void)
 {
 	unsigned long config;
 	rdmsrl(MSR_MTRRcap, config);
diff --git a/xen/arch/x86/cpu/mtrr/mtrr.h b/xen/arch/x86/cpu/mtrr/mtrr.h
index 9a406e6f6199..c7fd44daab27 100644
--- a/xen/arch/x86/cpu/mtrr/mtrr.h
+++ b/xen/arch/x86/cpu/mtrr/mtrr.h
@@ -24,10 +24,10 @@ struct mtrr_ops {
 	int	(*have_wrcomb)(void);
 };
 
-extern int generic_get_free_region(unsigned long base, unsigned long size,
-				   int replace_reg);
-extern int generic_validate_add_page(unsigned long base, unsigned long size,
-				     unsigned int type);
+int cf_check generic_get_free_region(
+    unsigned long base, unsigned long size, int replace_reg);
+int cf_check generic_validate_add_page(
+    unsigned long base, unsigned long size, unsigned int type);
 
 extern const struct mtrr_ops generic_mtrr_ops;
 
-- 
2.11.0


