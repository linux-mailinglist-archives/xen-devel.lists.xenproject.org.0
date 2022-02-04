Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DA24AA12E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 21:32:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265787.459330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG5F6-00028P-Jl; Fri, 04 Feb 2022 20:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265787.459330; Fri, 04 Feb 2022 20:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG5F6-00026A-Fh; Fri, 04 Feb 2022 20:31:40 +0000
Received: by outflank-mailman (input) for mailman id 265787;
 Fri, 04 Feb 2022 20:31:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TTBG=ST=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nG5F5-000264-Bw
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 20:31:39 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 719347c0-85f9-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 21:31:36 +0100 (CET)
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
X-Inumbo-ID: 719347c0-85f9-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644006696;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=082Vz14r1I6zxmaXpv4d2SFEfJ6SAmTaBPQRnb2qKFg=;
  b=V2S8Qrs3wyVQb7xkon9z6Udd5YonpOlpii2CqsKIRGHjIvd3uF6pTHer
   3C5NOPU013ORItcrZ4FwIl08s9FcTWWKjxY6P7bPf+sNO7GCATK0/YQIh
   wWq9u0lkwbWUp+czGFyCLQNCkpqdrOnq5JP+ETcKr+CAyoMJGt1dVjQph
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 8G6U1+/d5W+/dXI6+OeobctVbrMFSOCzWNsLdRH/r4BHBnxquu3Fl88+wAij+jYXy5xZrI6AR4
 gFPn0d+L8MjdKsDj0Jb/I+9AyD7yNYa41l990Ki6z55XhesAsX45z8pNMQCIcX4AXNkSC7mbOg
 JQAboNz1XGKacHo+WoHY5fnpRVvySwqcJoig3ikVDjAtQ9KoH4T6LmCwrPw/r/MTln4sVovgF9
 2NI0uGLvhRvMlh/0LGoNueDYiPoxRf10POg60YA4h6TBTpkzT/R5xoZA9Roh8LuPq9+znCIMRs
 y/1b1iK3PYZqPAky50azGGWc
X-SBRS: 5.1
X-MesageID: 63449691
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jeRGMKLaWjI0vGW4FE+RlJMlxSXFcZb7ZxGr2PjKsXjdYENShWEAx
 2IdWG+OOf7cZmKje9AlO4y1pEkDscTVzdZiQAZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug7x7Zi6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3QxOhr2
 ssQh6W8VC43A/XTs/U8UgdhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Glr2pwfQ6eHD
 yYfQWpuNS7DYjAIBncGCsI5meSi3ljxcxQN/Tp5ooJoujOOnWSdyoPFMsfRe9GMbdVYmACfv
 G2u13v9KgEXMpqY0zXt2nihnPPVlCX3HocbDqSl9+VCiUeWgGcUDXU+a1y/pvWoj1+kbPhWI
 UcU5ykGoLA78QqgSdyVdz+SrWOAvxUcc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YWmG6r6eoDe2OC4UBWwPfykJSU0C+daLiIM8lBXUVf54DbW4yNbyHFnNL
 yui9XZkwe9J1IhSivv9rQuvby+QSobhF1UN/BfJA1Cc4h5QerP9eKe5yFnF1KMVRGqGdWWps
 H8BksmYyekBC5CRiSCAKNkw8KGVC+Wta2OF3wM2d3U133H0oiP4I9gMiN1rDBoxaq45lSnVj
 Fg/UO+7zLtaJzOUYKB+eOpd4Ox6nPG7RbwJuh05B+eig6SdlifapEmChmbKhggBdXTAd4llY
 v93lu73VR4n5VxPlmbeegvk+eZDKtoC7W3SX4vn6B+szKCTYnWYIZ9cbgfVPrtksv7V+1qOm
 zq6Cyds408EOAEZSnKPmbP/0HhQdSRrbXwIg5A/mhG/zvpORzh6Vq65LUIJcI15haVF/tokD
 VnmMnK0PGHX3CWdQS3TMygLQOq2Af5X8CJqVQRxbA3A8yVyPu6HsvxFH7NpJuZPyQCW5aMtJ
 xXzU57bWaonp/Wu02l1UKQRW6Q7L0Xw3VvVZXL/CNX9FrY5LzH0FhbfVlOH3EEz4uCf7KPSe
 pWsiVHWR4QtXQNnAJqEYf6j1Qrp73MchPhzTw3DJdwKIBfg941jKirQiP4rIp5TdUWfl2XCj
 wvGUw0FoeTtopMu9IWbj66zsIr0QfB1GVBXHjeH4O/uZzXa5Geq3aRJTP2MIWLGTGrx9aj7P
 bdVwvjwPecphlFPt4YgQb9nwbhnv4nkpqNAzxQiF3LONgz5BrRlK3iA/M9OqqwSmeMJ5VroA
 hqCo4AIN6+INcXpFE8qCDAkNunTh+sJnjTy7OguJBmo7iFA47faA15ZOAOBiXIBIeItYp8l2
 +oopOUf9xe71kgxKt+Dgy1ZqzaMI3gHX/l1v50WGta22A8iy1UEap3AEC7mppqIbowUYEUtJ
 zaVgovEhqhdmRWeIyZiSyCV0LoPn4kKtTBL0EQGdgaAldfyj/Mq2AFcrGYsRQNPwxQbi+9+N
 wCH7aGuyXliK9uwuPV+Yg==
IronPort-HdrOrdr: A9a23:Gj6SPqxIG5ls4WEMgE1jKrPwIL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZMmPH7P+VIssR4b+exoVJPtfZq+z+8R3WByB8bAYOCOggLBR+sO0WKL+UyHJ8SUzI9gPM
 lbHJSWcOeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.88,343,1635220800"; 
   d="scan'208";a="63449691"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>
Subject: [PATCH] xen/smp: Speed up on_selected_cpus()
Date: Fri, 4 Feb 2022 20:31:15 +0000
Message-ID: <20220204203115.13290-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

cpumask_weight() is a horribly expensive way to find if no bits are set, made
worse by the fact that the calculation is performed with the global call_lock
held.

Switch to using cpumask_empty() instead, which will short circuit as soon as
it find any set bit in the cpumask.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>

I have not done performance testing, but I would be surprised if this cannot
be measured on a busy or large box.
---
 xen/common/smp.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/xen/common/smp.c b/xen/common/smp.c
index 781bcf2c246c..a011f541f1ea 100644
--- a/xen/common/smp.c
+++ b/xen/common/smp.c
@@ -50,8 +50,6 @@ void on_selected_cpus(
     void *info,
     int wait)
 {
-    unsigned int nr_cpus;
-
     ASSERT(local_irq_is_enabled());
     ASSERT(cpumask_subset(selected, &cpu_online_map));
 
@@ -59,8 +57,7 @@ void on_selected_cpus(
 
     cpumask_copy(&call_data.selected, selected);
 
-    nr_cpus = cpumask_weight(&call_data.selected);
-    if ( nr_cpus == 0 )
+    if ( cpumask_empty(&call_data.selected) )
         goto out;
 
     call_data.func = func;
-- 
2.11.0


