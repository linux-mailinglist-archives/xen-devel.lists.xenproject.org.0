Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06052EA041
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 23:59:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61626.108531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYon-0002CS-T3; Mon, 04 Jan 2021 22:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61626.108531; Mon, 04 Jan 2021 22:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYon-0002Aw-Ln; Mon, 04 Jan 2021 22:59:17 +0000
Received: by outflank-mailman (input) for mailman id 61626;
 Mon, 04 Jan 2021 22:59:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wh7t=GH=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kwYi9-0000oY-TA
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 22:52:25 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91638428-f27c-4490-b226-9fd16a395869;
 Mon, 04 Jan 2021 22:52:14 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 104Mq4co071457
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 4 Jan 2021 17:52:10 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 104Mq4G4071456;
 Mon, 4 Jan 2021 14:52:04 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 91638428-f27c-4490-b226-9fd16a395869
Message-Id: <b0211ac6542435ac2a2987e1e573150c21b1d719.1608663694.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1608663694.git.ehem+xen@m5p.com>
References: <cover.1608663694.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Thu, 10 Dec 2020 15:09:06 -0800
Subject: [WIP PATCH 09/16] WIP: tools/xl: Implement generalized output
 formatting for `xl list`
X-Spam-Status: No, score=2.1 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

Implement a generalized output formatting function for the `xl list`
subcommands.  Notably `xl list` and `xl vm-list` could make use of
alternative output list formats.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
I'm a bit unsure of #include <xen-tools/libs.h>.  When looking for an
implementation of ARRAY_SIZE(), that was the header I found.  I can
readily write it myself, but rather than inlining, I looked for a copy in
a header and found that.
---
 tools/xl/xl_list.c | 285 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 285 insertions(+)

diff --git a/tools/xl/xl_list.c b/tools/xl/xl_list.c
index e30536fd9a..1c04f2126b 100644
--- a/tools/xl/xl_list.c
+++ b/tools/xl/xl_list.c
@@ -14,10 +14,14 @@
 
 #define _GNU_SOURCE
 
+#include <ctype.h>
 #include <inttypes.h>
 #include <stdlib.h>
+#include <stddef.h>
 #include <unistd.h>
 
+#include <xen-tools/libs.h>
+
 #include <libxl.h>
 #include <libxl_utils.h>
 
@@ -25,6 +29,287 @@
 #include "xl_utils.h"
 
 
+struct format_entry;
+
+typedef void (format_function_t)(const struct format_entry *,
+                                 const void *, const char *, size_t);
+
+typedef struct format_entry {
+    char *const header;
+    char formatc[3];
+    format_function_t *formatf;
+    ptrdiff_t offset;
+    union {
+        int i;
+        unsigned long lu;
+        float f;
+        void *v;
+        char *(*xlfunc)(libxl_ctx *, uint32_t);
+    } extra;
+} format_table_t['z' - 'A' + 1];
+
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+
+static void format_normal(const struct format_entry *entry,
+                          const void *info, const char *format,
+                          size_t len)
+{
+    char *buf = alloca(len + 3);
+    memcpy(buf, format, len);
+    if (info) {
+        const char *str;
+        int i;
+        unsigned long lu;
+        float f;
+        strcpy(buf + len, entry->formatc);
+        switch (entry->formatc[0]) {
+        case 's':
+            str = ((char **)info)[entry->offset];
+            if (!str) str = "-";
+            printf(buf, str);
+            break;
+        case 'f':
+            f = ((float *)info)[entry->offset];
+            if (entry->extra.f != 0) f /= entry->extra.f;
+            printf(buf, f);
+            break;
+        case 'l':
+            lu = ((unsigned long *)info)[entry->offset];
+            if (entry->extra.lu) lu /= entry->extra.lu;
+            printf(buf, lu);
+            break;
+        case 'd':
+        default:
+            i = ((int *)info)[entry->offset];
+            if (entry->extra.i) i /= entry->extra.i;
+            printf(buf, i);
+            break;
+        }
+    } else {
+        if (entry->formatc[0] == 'f') {
+            char *tmp;
+            buf[len] = '\0';
+            if ((tmp = rindex(buf, '.')))
+                len = tmp - buf - 1;
+        }
+        strcpy(buf + len, "s");
+        printf(buf, entry->header);
+    }
+}
+
+static void format_allocstr(const struct format_entry *entry,
+                            const void *info, const char *format,
+                            size_t len)
+{
+    char *fmt = alloca(len + 2);
+    char *outbuf;
+    memcpy(fmt, format, len);
+    strcpy(fmt + len, "s");
+
+    if (info) {
+        outbuf = entry->extra.xlfunc(ctx, ((uint32_t *)info)[entry->offset]);
+        printf(fmt, outbuf);
+        free(outbuf);
+    } else printf(fmt, entry->header);
+}
+
+static void format_uuid(const struct format_entry *entry,
+                        const void *info, const char *format,
+                        size_t len)
+{
+    if (info) printf(LIBXL_UUID_FMT, LIBXL_UUID_BYTES(*(libxl_uuid *)((char *)info + entry->offset)));
+    else fputs(entry->header, stdout);
+}
+
+static void format_time(const struct format_entry *entry,
+                        const void *_info, const char *format,
+                        size_t len)
+{
+    const libxl_dominfo *info = _info;
+    char *fmt = alloca(len + 2);
+    memcpy(fmt, format, len);
+
+    if (info) {
+        strcpy(fmt + len, "f");
+        printf(fmt, ((float)info->cpu_time / 1e9));
+    } else {
+        char *tmp;
+        if (!(tmp = index(fmt, '.'))) tmp = fmt + len;
+        strcpy(tmp, "s");
+        printf(fmt, entry->header);
+    }
+}
+
+static void format_state(const struct format_entry *entry,
+                         const void *_info, const char *format,
+                         size_t len)
+{
+    const libxl_dominfo *info = _info;
+    if (info) {
+        const char shutdown_reason_letters[] = "-rscwS";
+        libxl_shutdown_reason shutdown_reason;
+        static const char letters[] = "rbps";
+        int i;
+	const bool *flags;
+
+	flags = &info->running;
+        for (i = 0; i < strlen(letters); ++i)
+            putchar(flags[i] ? letters[i] : '-');
+
+        shutdown_reason = info->shutdown ? info->shutdown_reason : 0;
+        putchar((shutdown_reason >= 0 &&
+            shutdown_reason < sizeof(shutdown_reason_letters)-1
+            ? shutdown_reason_letters[shutdown_reason] : '?'));
+
+        putchar(info->dying ? 'd' : '-');
+    } else printf("%6s", entry->header);
+}
+
+static void format_reason(const struct format_entry *entry,
+                          const void *_info, const char *format,
+                          size_t len)
+{
+    const libxl_dominfo *info = _info;
+    const char *output = entry->header;
+    if (info) {
+        if (info->shutdown) {
+            printf("%8x", info->shutdown_reason);
+            return;
+        }
+        output = "-";
+    }
+    printf("%8s", output);
+}
+
+static void format_memory(const struct format_entry *entry,
+                          const void *_info, const char *format,
+                          size_t len)
+{
+    const libxl_dominfo *info = _info;
+    char *fmt = alloca(len + 3);
+    memcpy(fmt, format, len);
+    if (info) {
+        strcpy(fmt + len, entry->formatc);
+        printf(fmt, (info->current_memkb + info->outstanding_memkb) >> 10);
+    } else {
+        strcpy(fmt + len, "s");
+        printf(fmt, "Mem");
+    }
+}
+
+static void format_node(const struct format_entry *entry,
+                        const void *_info, const char *format,
+                        size_t len)
+{
+    const libxl_dominfo *info = _info;
+    static bool need_init = true;
+    static libxl_bitmap nodemap;
+    static libxl_physinfo physinfo;
+
+    if (need_init) {
+        libxl_bitmap_init(&nodemap);
+        libxl_physinfo_init(&physinfo);
+        need_init = false;
+
+        if (libxl_node_bitmap_alloc(ctx, &nodemap, 0)) {
+            fprintf(stderr, "libxl_node_bitmap_alloc_failed.\n");
+            exit(EXIT_FAILURE);
+        }
+        if (libxl_get_physinfo(ctx, &physinfo) != 0) {
+            fprintf(stderr, "libxl_physinfo failed.\n");
+            libxl_bitmap_dispose(&nodemap);
+            exit(EXIT_FAILURE);
+        }
+    }
+
+    if (info) {
+        libxl_domain_get_nodeaffinity(ctx, info->domid, &nodemap);
+
+        putchar(' ');
+        print_bitmap(nodemap.map, physinfo.nr_nodes, stdout);
+    } else fputs(entry->header, stdout);
+
+#if 0
+    /* unfortunately these get leaked on exit */
+    libxl_bitmap_dispose(&nodemap);
+    libxl_physinfo_dispose(&physinfo);
+#endif
+}
+
+#pragma GCC diagnostic pop
+
+static bool isfmtchar(int c)
+{
+    const bool opts[] = {
+        ['0'] = true,
+        ['1'] = true,
+        ['2'] = true,
+        ['3'] = true,
+        ['4'] = true,
+        ['5'] = true,
+        ['6'] = true,
+        ['7'] = true,
+        ['8'] = true,
+        ['9'] = true,
+        ['.'] = true,
+        ['#'] = true,
+        ['-'] = true,
+        ['+'] = true,
+        [' '] = true,
+        ['\''] = true,
+    };
+    if ((unsigned int)c < ARRAY_SIZE(opts) && opts[c]) return true;
+    else return false;
+}
+
+static void format(const format_table_t fmttab, const char *fmt,
+                   const void *info)
+{
+    while (fmt[0]) {
+        if (fmt[0] == '\\') {
+            switch (fmt[1]) {
+            case 0:
+                /* Uhm... */
+                return;
+            case '0':
+                putchar(0);
+                break;
+            case 'n':
+                fputs("\n", stdout);
+                break;
+            case 't':
+                putchar('\t');
+                break;
+            default:
+                putchar(fmt[1]);
+            }
+            fmt+=2;
+        } else if (fmt[0] == '%') {
+            size_t len=1;
+            unsigned char entryn;
+
+            while (isfmtchar(fmt[len])) ++len;
+
+            entryn = fmt[len] - 'A';
+            if (entryn < sizeof(format_table_t) / sizeof(fmttab[0]) &&
+                    fmttab[entryn].formatf)
+                fmttab[entryn].formatf(fmttab + entryn, info, fmt, len);
+            else {
+                fprintf(stderr, "Invalid conversion character \'%c\'\n",
+                        entryn);
+                exit(EXIT_FAILURE);
+            }
+
+            fmt += len + 1;
+        } else {
+            putchar(*fmt);
+            ++fmt;
+        }
+    }
+}
+
+
 static void list_vm(void)
 {
     libxl_vminfo *info;
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




