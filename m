Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D041145EEBB
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:08:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232861.404045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxH-0007rG-Lh; Fri, 26 Nov 2021 13:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232861.404045; Fri, 26 Nov 2021 13:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxH-0007Yf-47; Fri, 26 Nov 2021 13:07:55 +0000
Received: by outflank-mailman (input) for mailman id 232861;
 Fri, 26 Nov 2021 13:07:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqaui-0003W9-Jl
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:16 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7efb2e6d-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:05:15 +0100 (CET)
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
X-Inumbo-ID: 7efb2e6d-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931914;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AtKkHK4Fn9Tibx+JcfjODOJaD4dj5WX9w5aEerifsuI=;
  b=Bqi5CYy77kAnfoq3UW9ww0q/T7daq4cURakCvLeNH9pHNPMGT3RtyF2C
   4GWfCu2VVGNzGNF5vIkc1PMsg0FCgW4mi0eGvXu+OT49P4jmypZO3RIb4
   1MAW+MIhiiP0WLXjE7nlfj9AlaBYEzD8+IUvNaaOIFCRI0Pce85VdzxAE
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: pIQJ7FhTgUrM8YBosF6BU8m+O0b8OBTcvCK/9DljwUQNqpG9tdw/V9MsO6XszAgnd+tkHMgnfy
 0jn94jvzFviXY1z7iokKWf5XE/pH0ymMXgr8uTyMaPembhSTMTGJTjI6B6A62fUHNy/ELn+nNC
 HLXtwRtZDQQgRI8mU+U17PdLTkm3m5gkNFgl9uJZ7ZuTqrjLAX4rNaHLcJuvrA/AdQkddp4RPy
 DkdkW9pI3lFuCETeK9GDdbtD11Lz63U/icDd5RHJiD2QSq00cOfT5ez9f8mme3t61w0uvJZNKo
 DQUqXwa/m4voj81LharwsjP2
X-SBRS: 5.1
X-MesageID: 58193791
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0JNBl6tYFeKRys/g1YzV9i5MaufnVJtZMUV32f8akzHdYApBsoF/q
 tZmKWvXOf+DNmb1eYp3aIS080tV7ZKEmN5nGQs+pCs3RHsT+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx24bhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpllLi9UwwXEvD1nssTUkljLyBvJolFweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DN
 5NIMmU+NXwsZTVsZWZLCpwQx965g0DDKiZkil+H9fEotj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO8we5RuG9IaJ2gC2CGlUdQJAeccCt/ZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WsQWmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQSEhRqjBNzAJrVkg
 JTis5PFhAzpJcvQ/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43aZlUJ2K2M
 RON5Vg5CHpv0J2CNvQfj2WZUZlC8EQdPY69CqC8giRmPvCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/rdROcAtUdCdjXvgbaaV/L4a+H+avI0l5Y9e5/F/rU9YNc319mria8
 3ejdFVfzVaj13TLJR/TMiJoaa/1XIY5pnU+ZHR+MVGt0nklQICu8KZAKMdnIeh5rLRunaxuU
 v0IW8ScGfATGD7JzCsQMMvmp4t4eRX12Q/XZ3i5YCIydoJLThDS/oO2ZRPm8SQDV3LltcY3r
 7C6+BncRJ4PG1ZrAMrMMar9xFKtp3kN3ul1WhKQcNVUfUzt9qlsKjDw0aBrc51dd02by2LDh
 QiMABoeqe3cmKMP8YHE1fKesoOkM+piBU4GTWPV2qm7aHvB9W25zI4eDOvRJWLBVHn58bmJb
 PlOy62uK+UOmVtHvtYuE7tvyq5itdLjq6UDk1ZhFXTPKV+qFqlhMj+N2swW7v9BwbpQuA2XX
 EOT+4YFZeXVaZ29SFNBdhA4aumj1O0PnmiA5Ps4F0z2+Str8efVSk5VJRSN1HRQIbYd3FnJG
 gv9VBr6MzCCtyc=
IronPort-HdrOrdr: A9a23:5Bs6uKCqFNqtR3blHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo7v
 xG/c5rsyMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 9dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58193791"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 48/65] x86/aepi: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:29 +0000
Message-ID: <20211126123446.32324-49-andrew.cooper3@citrix.com>
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

I was very surprised when encountering this...  AML and EFI are bad enough,
but why on earth do we need yet another firmware provided arbitrary turning
machine to be executing in Xen's context.
---
 xen/drivers/acpi/apei/apei-base.c     | 32 ++++++++++----------
 xen/drivers/acpi/apei/apei-internal.h | 20 ++++++------
 xen/drivers/acpi/apei/erst.c          | 57 +++++++++++++++++------------------
 3 files changed, 54 insertions(+), 55 deletions(-)

diff --git a/xen/drivers/acpi/apei/apei-base.c b/xen/drivers/acpi/apei/apei-base.c
index 6f81e7fa366a..de75c1cef992 100644
--- a/xen/drivers/acpi/apei/apei-base.c
+++ b/xen/drivers/acpi/apei/apei-base.c
@@ -80,8 +80,8 @@ int __apei_exec_read_register(struct acpi_whea_header *entry, u64 *val)
 	return 0;
 }
 
-int apei_exec_read_register(struct apei_exec_context *ctx,
-			    struct acpi_whea_header *entry)
+int cf_check apei_exec_read_register(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry)
 {
 	int rc;
 	u64 val = 0;
@@ -94,8 +94,8 @@ int apei_exec_read_register(struct apei_exec_context *ctx,
 	return 0;
 }
 
-int apei_exec_read_register_value(struct apei_exec_context *ctx,
-				  struct acpi_whea_header *entry)
+int cf_check apei_exec_read_register_value(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry)
 {
 	int rc;
 
@@ -126,14 +126,14 @@ int __apei_exec_write_register(struct acpi_whea_header *entry, u64 val)
 	return rc;
 }
 
-int apei_exec_write_register(struct apei_exec_context *ctx,
-			     struct acpi_whea_header *entry)
+int cf_check apei_exec_write_register(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry)
 {
 	return __apei_exec_write_register(entry, ctx->value);
 }
 
-int apei_exec_write_register_value(struct apei_exec_context *ctx,
-				   struct acpi_whea_header *entry)
+int cf_check apei_exec_write_register_value(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry)
 {
 	int rc;
 
@@ -143,8 +143,8 @@ int apei_exec_write_register_value(struct apei_exec_context *ctx,
 	return rc;
 }
 
-int apei_exec_noop(struct apei_exec_context *ctx,
-		   struct acpi_whea_header *entry)
+int cf_check apei_exec_noop(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry)
 {
 	return 0;
 }
@@ -230,9 +230,9 @@ static int __init apei_exec_for_each_entry(struct apei_exec_context *ctx,
 	return 0;
 }
 
-static int __init pre_map_gar_callback(struct apei_exec_context *ctx,
-				       struct acpi_whea_header *entry,
-				       void *data)
+static int __init cf_check pre_map_gar_callback(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry,
+	void *data)
 {
 	u8 ins = entry->instruction;
 
@@ -259,9 +259,9 @@ int __init apei_exec_pre_map_gars(struct apei_exec_context *ctx)
 	return rc;
 }
 
-static int __init post_unmap_gar_callback(struct apei_exec_context *ctx,
-					  struct acpi_whea_header *entry,
-					  void *data)
+static int __init cf_check post_unmap_gar_callback(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry,
+	void *data)
 {
 	u8 ins = entry->instruction;
 
diff --git a/xen/drivers/acpi/apei/apei-internal.h b/xen/drivers/acpi/apei/apei-internal.h
index b813d55b92a9..360e94b9c877 100644
--- a/xen/drivers/acpi/apei/apei-internal.h
+++ b/xen/drivers/acpi/apei/apei-internal.h
@@ -68,16 +68,16 @@ static inline int apei_exec_run_optional(struct apei_exec_context *ctx, u8 actio
 
 int __apei_exec_read_register(struct acpi_whea_header *entry, u64 *val);
 int __apei_exec_write_register(struct acpi_whea_header *entry, u64 val);
-int apei_exec_read_register(struct apei_exec_context *ctx,
-			    struct acpi_whea_header *entry);
-int apei_exec_read_register_value(struct apei_exec_context *ctx,
-				  struct acpi_whea_header *entry);
-int apei_exec_write_register(struct apei_exec_context *ctx,
-			     struct acpi_whea_header *entry);
-int apei_exec_write_register_value(struct apei_exec_context *ctx,
-				   struct acpi_whea_header *entry);
-int apei_exec_noop(struct apei_exec_context *ctx,
-		   struct acpi_whea_header *entry);
+int cf_check apei_exec_read_register(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry);
+int cf_check apei_exec_read_register_value(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry);
+int cf_check apei_exec_write_register(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry);
+int cf_check apei_exec_write_register_value(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry);
+int cf_check apei_exec_noop(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry);
 int apei_exec_pre_map_gars(struct apei_exec_context *ctx);
 int apei_exec_post_unmap_gars(struct apei_exec_context *ctx);
 
diff --git a/xen/drivers/acpi/apei/erst.c b/xen/drivers/acpi/apei/erst.c
index c5df512b9838..40d8f00270d0 100644
--- a/xen/drivers/acpi/apei/erst.c
+++ b/xen/drivers/acpi/apei/erst.c
@@ -114,40 +114,40 @@ static int erst_timedout(u64 *t, u64 spin_unit)
 	return 0;
 }
 
-static int erst_exec_load_var1(struct apei_exec_context *ctx,
-			       struct acpi_whea_header *entry)
+static int cf_check erst_exec_load_var1(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry)
 {
 	return __apei_exec_read_register(entry, &ctx->var1);
 }
 
-static int erst_exec_load_var2(struct apei_exec_context *ctx,
-			       struct acpi_whea_header *entry)
+static int cf_check erst_exec_load_var2(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry)
 {
 	return __apei_exec_read_register(entry, &ctx->var2);
 }
 
-static int erst_exec_store_var1(struct apei_exec_context *ctx,
-				struct acpi_whea_header *entry)
+static int cf_check erst_exec_store_var1(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry)
 {
 	return __apei_exec_write_register(entry, ctx->var1);
 }
 
-static int erst_exec_add(struct apei_exec_context *ctx,
-			 struct acpi_whea_header *entry)
+static int cf_check erst_exec_add(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry)
 {
 	ctx->var1 += ctx->var2;
 	return 0;
 }
 
-static int erst_exec_subtract(struct apei_exec_context *ctx,
-			      struct acpi_whea_header *entry)
+static int cf_check erst_exec_subtract(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry)
 {
 	ctx->var1 -= ctx->var2;
 	return 0;
 }
 
-static int erst_exec_add_value(struct apei_exec_context *ctx,
-			       struct acpi_whea_header *entry)
+static int cf_check erst_exec_add_value(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry)
 {
 	int rc;
 	u64 val;
@@ -160,8 +160,8 @@ static int erst_exec_add_value(struct apei_exec_context *ctx,
 	return rc;
 }
 
-static int erst_exec_subtract_value(struct apei_exec_context *ctx,
-				    struct acpi_whea_header *entry)
+static int cf_check erst_exec_subtract_value(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry)
 {
 	int rc;
 	u64 val;
@@ -174,8 +174,8 @@ static int erst_exec_subtract_value(struct apei_exec_context *ctx,
 	return rc;
 }
 
-static int erst_exec_stall(struct apei_exec_context *ctx,
-			   struct acpi_whea_header *entry)
+static int cf_check erst_exec_stall(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry)
 {
 	udelay((ctx->var1 > FIRMWARE_MAX_STALL) ? 
 			FIRMWARE_MAX_STALL : 
@@ -183,8 +183,8 @@ static int erst_exec_stall(struct apei_exec_context *ctx,
 	return 0;
 }
 
-static int erst_exec_stall_while_true(struct apei_exec_context *ctx,
-				      struct acpi_whea_header *entry)
+static int cf_check erst_exec_stall_while_true(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry)
 {
 	int rc;
 	u64 val;
@@ -205,9 +205,8 @@ static int erst_exec_stall_while_true(struct apei_exec_context *ctx,
 	return 0;
 }
 
-static int erst_exec_skip_next_instruction_if_true(
-	struct apei_exec_context *ctx,
-	struct acpi_whea_header *entry)
+static int cf_check erst_exec_skip_next_instruction_if_true(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry)
 {
 	int rc;
 	u64 val;
@@ -223,27 +222,27 @@ static int erst_exec_skip_next_instruction_if_true(
 	return 0;
 }
 
-static int erst_exec_goto(struct apei_exec_context *ctx,
-			  struct acpi_whea_header *entry)
+static int cf_check erst_exec_goto(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry)
 {
 	ctx->ip = ctx->value;
 	return APEI_EXEC_SET_IP;
 }
 
-static int erst_exec_set_src_address_base(struct apei_exec_context *ctx,
-					  struct acpi_whea_header *entry)
+static int cf_check erst_exec_set_src_address_base(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry)
 {
 	return __apei_exec_read_register(entry, &ctx->src_base);
 }
 
-static int erst_exec_set_dst_address_base(struct apei_exec_context *ctx,
-					  struct acpi_whea_header *entry)
+static int cf_check erst_exec_set_dst_address_base(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry)
 {
 	return __apei_exec_read_register(entry, &ctx->dst_base);
 }
 
-static int erst_exec_move_data(struct apei_exec_context *ctx,
-			       struct acpi_whea_header *entry)
+static int cf_check erst_exec_move_data(
+	struct apei_exec_context *ctx, struct acpi_whea_header *entry)
 {
 	int rc;
 	u64 offset;
-- 
2.11.0


