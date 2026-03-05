Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DwzBfeLqWl3/AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:58:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D7D212DFC
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:58:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246748.1545873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy9DK-0004z1-SB; Thu, 05 Mar 2026 13:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246748.1545873; Thu, 05 Mar 2026 13:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy9DK-0004rp-JO; Thu, 05 Mar 2026 13:58:06 +0000
Received: by outflank-mailman (input) for mailman id 1246748;
 Thu, 05 Mar 2026 13:58:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y0Pc=BF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vy98U-00008m-Nz
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 13:53:06 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a217b1b9-189a-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 14:53:05 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C4B155BDE2;
 Thu,  5 Mar 2026 13:53:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A8D5B3EA68;
 Thu,  5 Mar 2026 13:53:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Dg0lKMCKqWkmTwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 05 Mar 2026 13:53:04 +0000
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
X-Inumbo-ID: a217b1b9-189a-11f1-9ccf-f158ae23cfc8
Authentication-Results: smtp-out2.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 10/11] tools/xl: add xl commands for xenstore quota operations
Date: Thu,  5 Mar 2026 14:52:07 +0100
Message-ID: <20260305135208.2208663-11-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305135208.2208663-1-jgross@suse.com>
References: <20260305135208.2208663-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Queue-Id: A3D7D212DFC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.51 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[suse.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Action: no action

Add "xl xenstore-quota-get" and "xl xenstore-quota-set" commands for
retrieving and setting global and per-domain Xenstore quota.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xl/Makefile      |  1 +
 tools/xl/xl.h          |  2 +
 tools/xl/xl_cmdtable.c | 10 +++++
 tools/xl/xl_parse.c    | 25 ++++++++++++
 tools/xl/xl_parse.h    |  1 +
 tools/xl/xl_xsquota.c  | 88 ++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 127 insertions(+)
 create mode 100644 tools/xl/xl_xsquota.c

diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index 973ff0e1a2..e4eed8be13 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -24,6 +24,7 @@ XL_OBJS += xl_sched.o xl_pci.o xl_vcpu.o xl_cdrom.o xl_mem.o
 XL_OBJS += xl_info.o xl_console.o xl_misc.o
 XL_OBJS += xl_vmcontrol.o xl_saverestore.o xl_migrate.o
 XL_OBJS += xl_vdispl.o xl_vsnd.o xl_vkb.o
+XL_OBJS += xl_xsquota.o
 
 $(XL_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
 $(XL_OBJS): CFLAGS += $(CFLAGS_XL)
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 9000df00de..0efc07a6ba 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -217,6 +217,8 @@ int main_psr_mba_set(int argc, char **argv);
 int main_psr_mba_show(int argc, char **argv);
 #endif
 int main_qemu_monitor_command(int argc, char **argv);
+int main_xsquota_get(int argc, char **argv);
+int main_xsquota_set(int argc, char **argv);
 
 void help(const char *command);
 
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 06a0039718..3de12b12ae 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -649,6 +649,16 @@ const struct cmd_spec cmd_table[] = {
       "-h print this help\n"
     },
 #endif
+    { "xenstore-quota-get",
+      &main_xsquota_get, 0, 0,
+      "List global or domain specific Xenstore quota data",
+      "<Domain>|-g",
+    },
+    { "xenstore-quota-set",
+      &main_xsquota_set, 0, 1,
+      "Set global or domain specific Xenstore quota data",
+      "<Domain>|-g <quota>=<val>...",
+    },
 };
 
 const int cmdtable_len = ARRAY_SIZE(cmd_table);
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1a2ea8b5d5..934ad4eeef 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1314,6 +1314,31 @@ out:
     return ret;
 }
 
+int parse_xsquota_item(const char *buf, struct libxl_xs_quota_item *item)
+{
+    const char *eq;
+    char *endptr;
+
+    eq = strchr(buf, '=');
+    if (!eq) {
+        fprintf(stderr, "Quota specification \"%s\" lacks \"=\".\n", buf);
+        return ERROR_INVAL;
+    }
+    errno = 0;
+    item->name = strndup(buf, eq - buf);
+    if (!item->name)
+        return ERROR_NOMEM;
+    item->val = strtoul(eq + 1, &endptr, 0);
+    if (errno || !eq[1] || *endptr) {
+        fprintf(stderr,
+                "Quota specification \"%s\" uses illegal value \"%s\".\n",
+                buf, eq);
+        return ERROR_INVAL;
+    }
+
+    return 0;
+}
+
 void parse_config_data(const char *config_source,
                        const char *config_data,
                        int config_len,
diff --git a/tools/xl/xl_parse.h b/tools/xl/xl_parse.h
index fe0d586cdd..57bb43a067 100644
--- a/tools/xl/xl_parse.h
+++ b/tools/xl/xl_parse.h
@@ -36,6 +36,7 @@ int parse_nic_config(libxl_device_nic *nic, XLU_Config **config, char *token);
 int parse_vdispl_config(libxl_device_vdispl *vdispl, char *token);
 int parse_vsnd_item(libxl_device_vsnd *vsnd, const char *spec);
 int parse_vkb_config(libxl_device_vkb *vkb, char *token);
+int parse_xsquota_item(const char *buf, struct libxl_xs_quota_item *item);
 
 int match_option_size(const char *prefix, size_t len,
                       char *arg, char **argopt);
diff --git a/tools/xl/xl_xsquota.c b/tools/xl/xl_xsquota.c
new file mode 100644
index 0000000000..eaf19feac8
--- /dev/null
+++ b/tools/xl/xl_xsquota.c
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: LGPL-2.1-only */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <libxl.h>
+#include <libxlutil.h>
+
+#include "xl.h"
+#include "xl_utils.h"
+#include "xl_parse.h"
+
+int main_xsquota_get(int argc, char **argv)
+{
+    libxl_xs_quota_set q;
+    unsigned int i;
+    int rc;
+
+    if (argc != 2) {
+        fprintf(stderr, "Domain or \"-g\" must be specified.\n");
+        return EXIT_FAILURE;
+    }
+
+    if (!strcmp(argv[1], "-g")) {
+        rc = libxl_xsquota_global_get(ctx, &q);
+    } else {
+        uint32_t domid = find_domain(argv[1]);
+
+        rc = libxl_xsquota_domain_get(ctx, domid, &q);
+    }
+
+    if (rc) {
+        fprintf(stderr, "Quota could not be obtained.\n");
+        return EXIT_FAILURE;
+    }
+
+    printf("Quota name           Quota value\n");
+    printf("--------------------------------\n");
+    for (i = 0; i < q.num_quota; i++)
+        printf("%-20s %8u\n", q.quota[i].name, q.quota[i].val);
+
+    libxl_xs_quota_set_dispose(&q);
+
+    return EXIT_SUCCESS;
+}
+
+int main_xsquota_set(int argc, char **argv)
+{
+    unsigned int i;
+    libxl_xs_quota_set q;
+    int rc = EXIT_FAILURE;
+
+    if (argc < 3) {
+        fprintf(stderr, "Not enough parameters.\n");
+        return EXIT_FAILURE;
+    }
+
+    q.num_quota = argc - 2;
+    q.quota = calloc(q.num_quota, sizeof(*q.quota));
+    if (!q.quota) {
+        fprintf(stderr, "Memory allocation failure!\n");
+        goto err;
+    }
+
+    for (i = 2; i < argc; i++) {
+        if (parse_xsquota_item(argv[i], q.quota + i - 2))
+            goto err;
+    }
+
+    if (!strcmp(argv[1], "-g")) {
+         rc = libxl_xsquota_global_set(ctx, &q);
+    } else {
+        uint32_t domid = find_domain(argv[1]);
+
+        rc = libxl_xsquota_domain_set(ctx, domid, &q);
+    }
+
+    if (rc) {
+        fprintf(stderr, "Quota could not be set.\n");
+        rc = EXIT_FAILURE;
+    } else {
+        rc = EXIT_SUCCESS;
+    }
+
+ err:
+    libxl_xs_quota_set_dispose(&q);
+
+    return rc;
+}
-- 
2.53.0


