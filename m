Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257BD753B74
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 15:04:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563624.880936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKITB-0008Mf-Ss; Fri, 14 Jul 2023 13:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563624.880936; Fri, 14 Jul 2023 13:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKITB-0008Kd-Q3; Fri, 14 Jul 2023 13:04:25 +0000
Received: by outflank-mailman (input) for mailman id 563624;
 Fri, 14 Jul 2023 13:04:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIDz=DA=citrix.com=prvs=552896509=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qKITA-0008KX-7c
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 13:04:24 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f24652f6-2246-11ee-b239-6b7b168915f2;
 Fri, 14 Jul 2023 15:04:22 +0200 (CEST)
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
X-Inumbo-ID: f24652f6-2246-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689339862;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IcQi58JOw5H4SaYEOAtieBCdxWJz52I4A+zCxyg1iLs=;
  b=gWfyq3d9uP/UqiK+asIQF902OkJQy2Or1HuMNe0FoqPNAPmMl3TTNjKP
   BsoH+LK6NmMEAi3ASqV1/ddonpbw88Fiuqnw1iKqCr4ludK1nNgpuwiOI
   Engl2ghPeGYn1dbUNKYOIhoirYFQYZq3pdgsGlRq9RDfWy1ej9QQn7cu/
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 116656760
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:8u7o1KhrUxc/wDq+rBn2Ine2X161gBAKZh0ujC45NGQN5FlHY01je
 htvWG+BO/zZMGDwc9Bwbo/g8h8Ov5fRxoJjTQtvq31jEykb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT4waCzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQadAEyfgufgt62mreEQdBQqth9D8nkadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 zyYojqmXEly2Nq3lWeirV+vguTzgHnZB5wSBYaDqPNguQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ9r9M/TzEu0
 l6PnvvqCCZpvbnTTmiSnp+LqRuiNC5TKnUNDQcGUA8E7t/LsIw1yBXVQb5LCqm/g8fpHnf6y
 j+MpTI3r78OgtUG0ar99lfC6xqqp5POSgdz+AjLRGOj7ytzeYG+aoqnr1Pc6J59wJ2xFwfb+
 iJewo7Hsb5IVMvW/MCQfAkTNLP11smVKyHZvV41GqYqzgiB5yCAfY8FtVmSO3xV3tY4lS7BO
 RGD6FgLvM8LYxNGfocsPdvvVp1CIbzIUI28C6uKNocmjo1ZLlfvwc14WaKHM4kBemAImLp3B
 5qUeN3E4Z0yWfU+l2reqwvwPNYWKsECKYD7H8qTI+yPi+b2WZJsYe5t3KGyRu449riYhw7e7
 sxSMcCHoz0GDr2vOHaMqdFPcw1aRZTeOXwQg5YMHgJkClM2cFzN9teLme9xE2Cbt/k9ehj0E
 oGVBRYDlQuXaYzvIgSWcHFzAI4Drr4mxU/XyRcEZA7ys1B6ONbH0UvqX8dvFVXR3LA5nKEco
 jhsU5noP8mjvRyaoGlBNcam/N0KmdbCrVvmAhdJqQMXJ/ZILzElMPe+Fucz3EHi1haKiPY=
IronPort-HdrOrdr: A9a23:+0KnRKA5EIWAV6zlHej7sceALOsnbusQ8zAXPo5KOHtom7+j5q
 WTdZMgpGXJYVcqKQodcL+7WZVof0msv6KdjbNhRItKGTOWwFdBwulZnP3fKxOJIVy3ygd279
 YVT0BGYOeARGSTZ67BkUKF+q8bsa66GcOT5ds2rU0CcegwUdAU0+4RMG/yeScaKGZ76IICZe
 ehD4h81lydkFssH4mG7xI+Lor+TrPw5fbbiFI9dn0aAMjnt0La1FZ0eyLorCs2Ynd02L8nx2
 DOjgz+4cyYwoGG4y6Z7Xba66JckMCJ8Ko8OOW8zvINIjHbkQqwYp99MofyzQwdkaWU8V4vps
 PHpQwtVv4DlE/5TyWOuBPo7RPr1i0j3X/k1Daj8AfenfA=
X-Talos-CUID: 9a23:cTalPWDS0yhNyuv6Eys7xXEEAdwgTn2HyUjbGnOUFThKSLLAHA==
X-Talos-MUID: 9a23:1ilHhAkp1/yJpDslSH0Ydno+aeA3zqeqA3wQy7dZpcmVDhcuNj2k2WE=
X-IronPort-AV: E=Sophos;i="6.01,205,1684814400"; 
   d="scan'208";a="116656760"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>, "Nicola
 Vetrini" <nicola.vetrini@bugseng.com>
Subject: [PATCH] xen/ACPI: Remove the acpi_string type
Date: Fri, 14 Jul 2023 14:04:11 +0100
Message-ID: <20230714130411.3055187-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Typedef-ing a naked pointer like this an anti-pattern which is best avoided.
Furthermore, it's bad to pass a string literate in a mutable type.  Delete the
type entirely, and replace it with a plain 'const char *'.

This highlights two futher bugs.  acpi_get_table() already had a mismatch in
types between it's declaration and definition, and we have declarations for
acpi_get_handle() and acpi_get_table_header() but no definition at all (nor
any callers).

This fixes violations of MISRA Rule 7.4:

  A string literal shall not be assigned to an object unless the object's type
  is "pointer to const-qualified char".

and of Rule 8.3:

  All declarations of an object or function shall use the same names and type
  qualifiers.

and of Rule 8.6:

  An identifier with external linkage shall have exactly one external
  definition.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

Roberto/Nicola: Please double check my choice of rules here, and point out any
others that I may have missed.
---
 xen/drivers/acpi/tables/tbxface.c |  4 ++--
 xen/include/acpi/acpixf.h         | 13 ++-----------
 xen/include/acpi/actypes.h        |  1 -
 3 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/xen/drivers/acpi/tables/tbxface.c b/xen/drivers/acpi/tables/tbxface.c
index 21b2e5eae1c7..204d66caea48 100644
--- a/xen/drivers/acpi/tables/tbxface.c
+++ b/xen/drivers/acpi/tables/tbxface.c
@@ -164,7 +164,7 @@ acpi_initialize_tables(struct acpi_table_desc * initial_table_array,
  *
  *****************************************************************************/
 acpi_status __init
-acpi_get_table(char *signature,
+acpi_get_table(const char *signature,
 	       acpi_native_uint instance, struct acpi_table_header **out_table)
 {
 	acpi_native_uint i;
@@ -220,7 +220,7 @@ acpi_get_table(char *signature,
  *
  *****************************************************************************/
 acpi_status __init
-acpi_get_table_phys(acpi_string signature, acpi_native_uint instance,
+acpi_get_table_phys(const char *signature, acpi_native_uint instance,
 		     acpi_physical_address *addr, acpi_native_uint *len)
 {
 	acpi_native_uint i, j;
diff --git a/xen/include/acpi/acpixf.h b/xen/include/acpi/acpixf.h
index ba74908f0478..8b70154b8f96 100644
--- a/xen/include/acpi/acpixf.h
+++ b/xen/include/acpi/acpixf.h
@@ -69,25 +69,16 @@ acpi_status acpi_load_tables(void);
 acpi_status acpi_load_table(struct acpi_table_header *table_ptr);
 
 acpi_status
-acpi_get_table_header(acpi_string signature,
-		      acpi_native_uint instance,
-		      struct acpi_table_header *out_table_header);
-
-acpi_status
-acpi_get_table(acpi_string signature,
+acpi_get_table(const char *signature,
 	       acpi_native_uint instance, struct acpi_table_header **out_table);
 
 acpi_status
-acpi_get_table_phys(acpi_string signature, acpi_native_uint instance,
+acpi_get_table_phys(const char *signature, acpi_native_uint instance,
 		     acpi_physical_address *addr, acpi_native_uint *len);
 /*
  * Namespace and name interfaces
  */
 acpi_status
-acpi_get_handle(acpi_handle parent,
-		acpi_string pathname, acpi_handle * ret_handle);
-
-acpi_status
 acpi_debug_trace(char *name, u32 debug_level, u32 debug_layer, u32 flags);
 
 acpi_status
diff --git a/xen/include/acpi/actypes.h b/xen/include/acpi/actypes.h
index f3e95abc3ab3..7023863d0349 100644
--- a/xen/include/acpi/actypes.h
+++ b/xen/include/acpi/actypes.h
@@ -281,7 +281,6 @@ typedef acpi_native_uint acpi_size;
  */
 typedef u32 acpi_status;	/* All ACPI Exceptions */
 typedef u32 acpi_name;		/* 4-byte ACPI name */
-typedef char *acpi_string;	/* Null terminated ASCII string */
 typedef void *acpi_handle;	/* Actually a ptr to a NS Node */
 
 struct uint64_struct {
-- 
2.30.2


