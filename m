Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 347E14B511B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:06:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271719.466412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3i-0001cn-Tu; Mon, 14 Feb 2022 13:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271719.466412; Mon, 14 Feb 2022 13:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3i-0001PB-5k; Mon, 14 Feb 2022 13:06:26 +0000
Received: by outflank-mailman (input) for mailman id 271719;
 Mon, 14 Feb 2022 13:06:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb2y-0008IH-J3
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:40 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce48bf03-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:05:39 +0100 (CET)
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
X-Inumbo-ID: ce48bf03-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=tpbBQsuMzZyq6LzFUh1145Bs01ZMNWBvog9FT8SWVF0=;
  b=RmJHp55foSegsmV2b9mRd/BDKgcL3Mea9FQmwQwdx/ifgMiY/U9WUrvF
   MNuRLtM4cDtOoLXGuybezIIBY2LB+HIZ6x47ZWsDFifI4prdOLDjd1yqg
   T3PGZ3TmvFzENvqbeNfHcIB/g+n+ddW4W1CU9H4O1jg/CO5z7CCrkOgL8
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 4q+4l8ZC+4wl7Vru7sNrarw+ORF5dGXlfgKV9IUx8+NDQ86Nwv58/Pugh9w6SNG5x2bzuj1Sp1
 BcS0Frn3gJhOxcUdHnLTykY1vCz5Jo5YJIjM1UMm9mPqsKcQqbAagWxdV2cKwIeGXrAGGQMcf5
 Rxd2RDa2ih/QQlXz0NmK5eitb+1754V8qOS0YnjxUYN7QdmZ+q3fHj9Epeb1Zjlz5qfy5wIfH3
 RnB+SbCt4GKFEdqK1HNqUQLmZckI+Fv35yvm22/rEfDUY6d7T4S4QAzrkuUYoeoJ6dxRlbF1fC
 SCUT8Mn7Kjr2aGHRg9LmgtHR
X-SBRS: 5.1
X-MesageID: 63592646
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Hgl8Xq8MsvGHeZib+lalDrUDnnmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 zZMDzjQa/eMMTDzftkia9ux9kMAuJOHyIJqTwFqqis8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rg3tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPht2
 PZEq7KJSzwyZJPsletefjdpAjlXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4VQKeEO
 ZZHAdZpRFfRYTd3HFsGMZYBhr7rmkanTTxokU3A8MLb5ECMlVcsgdABKuH9atGMAMlYgEucj
 mbH5HjiRAEXMsSFzjiI+W7qgfXA9R4XQ6pLSuf+rKQzxgTOmCpDU3X6SGdXv9Glmm23RfxmK
 XcPoBQOoKdx2WKaX8HUCkjQTGG/gjYQXN9ZEusf4Q6Ly7bJ7wvxOlXoXgKte/R96pZoGGVCO
 kuh2oqwWGcx6OH9pWe1q+/MxQ5eLxT5OoPricUsaQIeq+fur4go5v4kZoYySfXl5jEZ9NyZ/
 txrkMTcr+hJ5SLo///ilbwiv95LjsKXJjPZHi2NAgqYAvpRPeZJnbCA51nB9upnJ42EVFSHt
 3Vss5HAsLxRXcHQyXTUG79l8FSVCxGtamO0vLKSN8N5q2TFF4CLIei8Hw2S1G82a51ZKFcFk
 WfYuB9L5Y87AZdZRfQfXm5FMOxzlfKIPY28Dpj8N4MSCrAsJF7v1Hw/Pia4gjGy+HXAZIliY
 P93h+73Vi1EYUmmpRLrL9ogPUgDmHxvmzOLHcqjp/lluJLHDEOopX4+GAPmRogEAGms+W05K
 v5TaJmHzQtxSur7bnWF+IIfNwlSf3M6GYr3u4pccevaelhqH2QoCvnwx7I9etM6w/QJx7mQp
 nztCFVFzFffhGHcLVnYYH5Ud76yD410qmg2PHJwMA/wiWQje4um8IwWa4AzIes87OVmwPMtF
 6sFdsyMD+5hUDPC/zhBP5DxoJY7LEaghB6UPjrjaz86JsYySwvM897iXw3u6ChRUXbn6Zpg+
 +Wtj1qJT4ACSgJuCNftRMiul17h72IAnO9SXlfTJoUBckvb74U3eTf6ieU6Ip9QJEyblCeaz
 QufHTwRufLJ/90u6NDMiK2J89WpHu95EhYIFmXX9+/rZyzT/27lyo5cSueYOzvaUTqsqqmlY
 OxUydD6MeEGwwkW49YtTe4zwPJs/cbrqp9b0h9gTSfCYFmcA799JmWLgJtUvapXy74F4Qa7V
 ypjIDWB1Wll7C89LGMsGQ==
IronPort-HdrOrdr: A9a23:7NURPq2rKbbF8K3JVS1OHAqjBLAkLtp133Aq2lEZdPRUGvb3qy
 nOpoVj6faaslYssR0b9exofZPwJE80lqQFh7X5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtsp
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="63592646"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 52/70] x86/apei: CFI hardening
Date: Mon, 14 Feb 2022 12:51:09 +0000
Message-ID: <20220214125127.17985-53-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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


