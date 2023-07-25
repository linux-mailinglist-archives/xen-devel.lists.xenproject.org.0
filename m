Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8458876D9A7
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 23:35:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575578.901229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJUy-0005Aw-5C; Wed, 02 Aug 2023 21:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575578.901229; Wed, 02 Aug 2023 21:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJUy-00059G-2C; Wed, 02 Aug 2023 21:35:16 +0000
Received: by outflank-mailman (input) for mailman id 575578;
 Wed, 02 Aug 2023 21:35:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w0qL=DT=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qRJUw-00059A-Mu
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 21:35:14 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75fc2764-317c-11ee-b263-6b7b168915f2;
 Wed, 02 Aug 2023 23:35:12 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 372LZ28o008587
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 2 Aug 2023 17:35:07 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 372LZ2Ae008586;
 Wed, 2 Aug 2023 14:35:02 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 75fc2764-317c-11ee-b263-6b7b168915f2
Message-Id: <b26bff76b883e2b2c7c55ad9290bbaa9bef73cd0.1690990428.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1690990427.git.ehem+xen@m5p.com>
References: <cover.1690990427.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Tue, 25 Jul 2023 15:50:14 -0700
Subject: [PATCH 22/22] tools/utils: break flex/bison parser away from main
 config file
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

Potentially allowing a different parser to be substituted.

Omit libxlu_internal.h from libxlu_cfg_i.c, since it is kept in
libxlu_cfg_y.h.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/libs/util/Makefile                      |   1 +
 tools/libs/util/libxlu_cfg.c                  | 662 ------------------
 .../util/{libxlu_cfg.c => libxlu_cfg_i.c}     |  87 ---
 3 files changed, 1 insertion(+), 749 deletions(-)
 copy tools/libs/util/{libxlu_cfg.c => libxlu_cfg_i.c} (90%)

diff --git a/tools/libs/util/Makefile b/tools/libs/util/Makefile
index d2c90ced69..bfca15b9b5 100644
--- a/tools/libs/util/Makefile
+++ b/tools/libs/util/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 OBJS-y += libxlu_cfg_y.o
 OBJS-y += libxlu_cfg_l.o
+OBJS-y += libxlu_cfg_i.o
 OBJS-y += libxlu_cfg.o
 OBJS-y += libxlu_disk_l.o
 OBJS-y += libxlu_disk.o
diff --git a/tools/libs/util/libxlu_cfg.c b/tools/libs/util/libxlu_cfg.c
index 7bbedde8f6..040d3ea914 100644
--- a/tools/libs/util/libxlu_cfg.c
+++ b/tools/libs/util/libxlu_cfg.c
@@ -21,31 +21,6 @@
 #include <stdarg.h>
 
 #include "libxlu_internal.h"
-#include "libxlu_cfg_y.h"
-#include "libxlu_cfg_l.h"
-
-struct XLU_ConfigSetting {
-    struct XLU_ConfigSetting *next;
-    char *name;
-    XLU_ConfigValue *value;
-    enum XLU_Operation op;
-    int lineno;
-};
-
-struct XLU_ConfigList {
-    int avalues; /* available slots */
-    int nvalues; /* actual occupied slots */
-    XLU_ConfigValue **values;
-};
-
-struct XLU_ConfigValue {
-    enum XLU_ConfigValueType type;
-    union {
-        char *string;
-        XLU_ConfigList list;
-    } u;
-    XLU__CFG_YYLTYPE loc;
-};
 
 struct XLU_Config {
     XLU_ConfigSetting *settings;
@@ -67,49 +42,6 @@ XLU_Config *xlu_cfg_init(FILE *report, const char *report_source) {
     return cfg;
 }
 
-static int ctx_prep(CfgParseContext *ctx, XLU_Config *cfg,
-    XLU_ConfigSetting **psettings)
-{
-    int e;
-
-    ctx->cfg= cfg;
-    ctx->psettings = psettings;
-    ctx->err= 0;
-    ctx->lexerrlineno= -1;
-    ctx->likely_python= 0;
-    ctx->scanner= 0;
-
-    e= xlu__cfg_yylex_init_extra(ctx, &ctx->scanner);
-    if (e) {
-        xlu_cfg_printf(cfg, " unable to create scanner: %s\n", strerror(e));
-        return e;
-    }
-    return 0;
-}
-
-static void ctx_dispose(CfgParseContext *ctx) {
-    if (ctx->scanner) xlu__cfg_yylex_destroy(ctx->scanner);
-}
-
-static void parse(CfgParseContext *ctx) {
-    /* On return, ctx.err will be updated with the error status. */
-    int r;
-
-    xlu__cfg_yyset_lineno(1, ctx->scanner);
-
-    r= xlu__cfg_yyparse(ctx);
-    if (r) assert(ctx->err);
-
-    if (ctx->err && ctx->likely_python) {
-        xlu_cfg_printf(ctx->cfg,
- " warning: Config file looks like it contains Python code.\n");
-        xlu_cfg_printf(ctx->cfg,
- " warning:  Arbitrary Python is no longer supported.\n");
-        xlu_cfg_printf(ctx->cfg,
- " warning:  See https://wiki.xen.org/wiki/PythonInXlConfig\n");
-    }
-}
-
 int xlu_cfg_readfile(XLU_Config *cfg, const char *name)
 {
     FILE *file;
@@ -129,85 +61,12 @@ int xlu_cfg_readfile(XLU_Config *cfg, const char *name)
     return ret;
 }
 
-int xlu__cfg_readfile(XLU_Config *cfg, FILE *msgfile, const char *msgprefix,
-    XLU_ConfigSetting **psettings, FILE *f, const char *name)
-{
-    int e;
-
-    CfgParseContext ctx;
-    e = ctx_prep(&ctx, cfg, psettings);
-    if (e) { ctx.err= e; goto xe; }
-
-    xlu__cfg_yyrestart(f, ctx.scanner);
-
-    parse(&ctx);
-
- xe:
-    ctx_dispose(&ctx);
-
-    return ctx.err;
-}
-
 int xlu_cfg_readdata(XLU_Config *cfg, const char *data, int length)
 {
     return xlu__cfg_readdata(cfg, cfg->report, cfg->config_source,
         &cfg->settings, data, length);
 }
 
-int xlu__cfg_readdata(XLU_Config *cfg, FILE *msgfile, const char *msgprefix,
-    XLU_ConfigSetting **psettings, const char *data, int length)
-{
-    int e;
-    YY_BUFFER_STATE buf= 0;
-
-    CfgParseContext ctx;
-    e = ctx_prep(&ctx, cfg, psettings);
-    if (e) { ctx.err= e; goto xe; }
-
-    buf = xlu__cfg_yy_scan_bytes(data, length, ctx.scanner);
-    if (!buf) {
-        xlu_cfg_printf(cfg, " unable to allocate scanner buffer\n");
-        ctx.err= ENOMEM;
-        goto xe;
-    }
-
-    parse(&ctx);
-
- xe:
-    if (buf) xlu__cfg_yy_delete_buffer(buf, ctx.scanner);
-    ctx_dispose(&ctx);
-
-    return ctx.err;
-}
-
-void xlu__cfg_value_free(XLU_ConfigValue *value)
-{
-    int i;
-
-    if (!value) return;
-
-    switch (value->type) {
-    case XLU_STRING:
-        free(value->u.string);
-        break;
-    case XLU_LIST:
-        for (i = 0; i < value->u.list.nvalues; i++)
-            xlu__cfg_value_free(value->u.list.values[i]);
-        free(value->u.list.values);
-    }
-    free(value);
-}
-
-void xlu__cfg_set_free(XLU_ConfigSetting *set) {
-    while(set) {
-        XLU_ConfigSetting *next = set->next;
-        free(set->name);
-        xlu__cfg_value_free(set->value);
-        free(set);
-        set = next;
-    }
-}
-
 void xlu_cfg_destroy(XLU_Config *cfg) {
     if (!cfg) return;
     xlu__cfg_set_free(cfg->settings);
@@ -237,539 +96,18 @@ int xlu_cfg_printf(const XLU_Config *cfg, const char *format, ...)
     return -errno;
 }
 
-static XLU_ConfigSetting *find(const XLU_Config *cfg, const char *n) {
-    XLU_ConfigSetting *set;
-
-    for (set = xlu__cfg_get_settings(cfg);
-         set;
-         set= set->next)
-        if (!strcmp(set->name, n))
-            return set;
-    return 0;
-}
-
-static int find_atom(const XLU_Config *cfg, const char *n,
-                     XLU_ConfigSetting **set_r, int dont_warn) {
-    XLU_ConfigSetting *set;
-
-    set= find(cfg,n);
-    if (!set) return ESRCH;
-
-    if (set->value->type!=XLU_STRING) {
-        if (!dont_warn)
-            xlu_cfg_printf(cfg,
-                    "%d: warning: parameter `%s' is"
-                    " a list but should be a single value\n",
-                    set->lineno, n);
-        return EINVAL;
-    }
-    *set_r= set;
-    return 0;
-}
-
 XLU_ConfigSetting *xlu__cfg_get_settings(const XLU_Config *cfg)
 {
     return cfg->settings;
 }
 
 
-enum XLU_ConfigValueType xlu_cfg_value_type(const XLU_ConfigValue *value)
-{
-    return value->type;
-}
-
-int xlu_cfg_value_get_string(const XLU_Config *cfg, XLU_ConfigValue *value,
-                             char **value_r, int dont_warn)
-{
-    if (value->type != XLU_STRING) {
-        if (!dont_warn)
-            xlu_cfg_printf(cfg, "%d:%d: warning: value is not a string\n",
-                    value->loc.first_line, value->loc.first_column);
-        *value_r = NULL;
-        return EINVAL;
-    }
-
-    *value_r = value->u.string;
-    return 0;
-}
-
-int xlu_cfg_value_get_list(const XLU_Config *cfg, XLU_ConfigValue *value,
-                           XLU_ConfigList **value_r, int dont_warn)
-{
-    if (value->type != XLU_LIST) {
-        if (!dont_warn)
-            xlu_cfg_printf(cfg, "%d:%d: warning: value is not a list\n",
-                    value->loc.first_line, value->loc.first_column);
-        *value_r = NULL;
-        return EINVAL;
-    }
-
-    *value_r = &value->u.list;
-    return 0;
-}
-
-XLU_ConfigValue *xlu_cfg_get_listitem2(const XLU_ConfigList *list,
-                                       int entry)
-{
-    if (entry < 0 || entry >= list->nvalues) return NULL;
-    return list->values[entry];
-}
-
-int xlu_cfg_get_string(const XLU_Config *cfg, const char *n,
-                       const char **value_r, int dont_warn) {
-    XLU_ConfigSetting *set;
-    int e;
-
-    e= find_atom(cfg,n,&set,dont_warn);  if (e) return e;
-    *value_r= set->value->u.string;
-    return 0;
-}
-
-int xlu_cfg_replace_string(const XLU_Config *cfg, const char *n,
-                           char **value_r, int dont_warn) {
-    XLU_ConfigSetting *set;
-    int e;
-
-    e= find_atom(cfg,n,&set,dont_warn);  if (e) return e;
-    free(*value_r);
-    *value_r= strdup(set->value->u.string);
-    return 0;
-}
-
-int xlu_cfg_get_bounded_long(const XLU_Config *cfg, const char *n,
-                             long min, long max, long *value_r,
-                             int dont_warn) {
-    long l;
-    XLU_ConfigSetting *set;
-    int e;
-    char *ep;
-
-    e= find_atom(cfg,n,&set,dont_warn);  if (e) return e;
-    if (set->op == XLU_OP_ADDITION) {
-        if (!dont_warn)
-            xlu_cfg_printf(cfg,
-                    "%d: warning: can't use += with numbers"
-                    " for parameter `%s'\n",
-                    set->lineno, n);
-        return EINVAL;
-    }
-    errno= 0; l= strtol(set->value->u.string, &ep, 0);
-    e= errno;
-    if (errno) {
-        e= errno;
-        assert(e==EINVAL || e==ERANGE);
-        if (!dont_warn)
-            xlu_cfg_printf(cfg,
-                    "%d: warning: parameter `%s' could not be parsed"
-                    " as a number: %s\n",
-                    set->lineno, n, strerror(e));
-        return e;
-    }
-    if (*ep || ep==set->value->u.string) {
-        if (!dont_warn)
-            xlu_cfg_printf(cfg,
-                    "%d: warning: parameter `%s' is not a valid number\n",
-                    set->lineno, n);
-        return EINVAL;
-    }
-    if (l < min) {
-        if (!dont_warn)
-            xlu_cfg_printf(cfg,
-                    "%d: warning: value `%ld' is smaller than minimum bound '%ld'\n",
-                    set->lineno, l, min);
-        return EINVAL;
-    }
-    if (l > max) {
-        if (!dont_warn)
-            xlu_cfg_printf(cfg,
-                    "%d: warning: value `%ld' is greater than maximum bound '%ld'\n",
-                    set->lineno, l, max);
-        return EINVAL;
-    }
-
-    *value_r= l;
-    return 0;
-}
-
 int xlu_cfg_get_long(const XLU_Config *cfg, const char *n,
                      long *value_r, int dont_warn) {
     return xlu_cfg_get_bounded_long(cfg, n, LONG_MIN, LONG_MAX, value_r,
                                     dont_warn);
 }
 
-int xlu_cfg_get_defbool(const XLU_Config *cfg, const char *n,
-                        libxl_defbool *value_r, int dont_warn)
-{
-    int ret;
-    long l;
-
-    ret = xlu_cfg_get_long(cfg, n, &l, dont_warn);
-    if (ret) return ret;
-    libxl_defbool_set(value_r, !!l);
-    return 0;
-}
-
-int xlu_cfg_get_list(const XLU_Config *cfg, const char *n,
-                     XLU_ConfigList **list_r, int *entries_r, int dont_warn) {
-    XLU_ConfigSetting *set;
-    set= find(cfg,n);  if (!set) return ESRCH;
-    if (set->value->type!=XLU_LIST) {
-        if (!dont_warn) {
-            xlu_cfg_printf(cfg,
-                    "%d: warning: parameter `%s' is a single value"
-                    " but should be a list\n",
-                    set->lineno, n);
-        }
-        return EINVAL;
-    }
-    if (list_r) *list_r= &set->value->u.list;
-    if (entries_r) *entries_r= set->value->u.list.nvalues;
-    return 0;
-}
-
-int xlu_cfg_get_list_as_string_list(const XLU_Config *cfg, const char *n,
-                     libxl_string_list *psl, int dont_warn) {
-    int i, rc, nr;
-    XLU_ConfigList *list;
-    libxl_string_list sl;
-
-    rc = xlu_cfg_get_list(cfg, n, &list, &nr, dont_warn);
-    if (rc)  return rc;
-
-    sl = malloc(sizeof(char*)*(nr + 1));
-    if (sl == NULL) return ENOMEM;
-
-    for (i=0; i<nr; i++) {
-        const char *a = xlu_cfg_get_listitem(list, i);
-        sl[i] = a ? strdup(a) : NULL;
-    }
-
-    sl[nr] = NULL;
-
-    *psl = sl;
-    return 0;
-}
-
-const char *xlu_cfg_get_listitem(const XLU_ConfigList *list, int entry) {
-    if (entry < 0 || entry >= list->nvalues) return 0;
-    if (list->values[entry]->type != XLU_STRING) return 0;
-    return list->values[entry]->u.string;
-}
-
-
-XLU_ConfigValue *xlu__cfg_string_mk(CfgParseContext *ctx, char *atom,
-                                    XLU__CFG_YYLTYPE *loc)
-{
-    XLU_ConfigValue *value = NULL;
-
-    if (ctx->err) goto x;
-
-    value = malloc(sizeof(*value));
-    if (!value) goto xe;
-    value->type = XLU_STRING;
-    value->u.string = atom;
-    memcpy(&value->loc, loc, sizeof(*loc));
-
-    return value;
-
- xe:
-    ctx->err= errno;
- x:
-    free(value);
-    free(atom);
-    return NULL;
-}
-
-XLU_ConfigValue *xlu__cfg_list_mk(CfgParseContext *ctx,
-                                  XLU_ConfigValue *val,
-                                  XLU__CFG_YYLTYPE *loc)
-{
-    XLU_ConfigValue *value = NULL;
-    XLU_ConfigValue **values = NULL;
-
-    if (ctx->err) goto x;
-
-    values = malloc(sizeof(*values));
-    if (!values) goto xe;
-    values[0] = val;
-
-    value = malloc(sizeof(*value));
-    if (!value) goto xe;
-    value->type = XLU_LIST;
-    value->u.list.nvalues = !!val;
-    value->u.list.avalues = 1;
-    value->u.list.values = values;
-    memcpy(&value->loc, loc, sizeof(*loc));
-
-    return value;
-
- xe:
-    ctx->err= errno;
- x:
-    free(value);
-    free(values);
-    xlu__cfg_value_free(val);
-    return NULL;
-}
-
-void xlu__cfg_list_append(CfgParseContext *ctx,
-                          XLU_ConfigValue *list,
-                          XLU_ConfigValue *val)
-{
-    if (ctx->err) return;
-
-    assert(val);
-    assert(list->type == XLU_LIST);
-
-    if (list->u.list.nvalues >= list->u.list.avalues) {
-        int new_avalues;
-        XLU_ConfigValue **new_values = NULL;
-
-        if (list->u.list.avalues > INT_MAX / 100) {
-            ctx->err = ERANGE;
-            xlu__cfg_value_free(val);
-            return;
-        }
-
-        new_avalues = list->u.list.avalues * 4;
-        new_values  = realloc(list->u.list.values,
-                              sizeof(*new_values) * new_avalues);
-        if (!new_values) {
-            ctx->err = errno;
-            xlu__cfg_value_free(val);
-            return;
-        }
-
-        list->u.list.avalues = new_avalues;
-        list->u.list.values  = new_values;
-    }
-
-    list->u.list.values[list->u.list.nvalues] = val;
-    list->u.list.nvalues++;
-}
-
-static int xlu__cfg_concat_vals(CfgParseContext *ctx,
-                                XLU_ConfigValue *prev,
-                                XLU_ConfigValue *to_add)
-{
-    int r;
-
-    if (prev->type != to_add->type) {
-        xlu__cfgl_lexicalerror(ctx,
-                           "can't add [list] to \"string\" or vice versa");
-        return EINVAL;
-    }
-
-    switch (to_add->type) {
-    case XLU_STRING: {
-        char *new_string = NULL;
-
-        r = asprintf(&new_string, "%s%s", prev->u.string,
-                     to_add->u.string);
-        if (r < 0) {
-            return errno;
-        }
-        free(to_add->u.string);
-        to_add->u.string = new_string;
-        return 0;
-    }
-    case XLU_LIST: {
-        XLU_ConfigList *const prev_list = &prev->u.list;
-        XLU_ConfigList *const cur_list = &to_add->u.list;
-        int nvalues;
-
-        if (prev->u.list.nvalues > INT_MAX - to_add->u.list.nvalues) {
-            return ERANGE;
-        }
-        nvalues = prev->u.list.nvalues + to_add->u.list.nvalues;
-
-        if (nvalues >= cur_list->avalues) {
-            XLU_ConfigValue **new_vals;
-            new_vals = realloc(cur_list->values,
-                               nvalues * sizeof(*new_vals));
-            if (!new_vals) {
-                return ENOMEM;
-            }
-            cur_list->avalues = nvalues;
-            cur_list->values = new_vals;
-        }
-
-        /* make space for `prev' into `to_add' */
-        memmove(cur_list->values + prev_list->nvalues,
-                cur_list->values,
-                cur_list->nvalues * sizeof(XLU_ConfigValue *));
-        /* move values from `prev' to `to_add' as the list in `prev' will
-         * not be reachable by find(). */
-        memcpy(cur_list->values,
-               prev_list->values,
-               prev_list->nvalues * sizeof(XLU_ConfigValue *));
-        cur_list->nvalues = nvalues;
-        prev_list->nvalues = 0;
-        memset(prev_list->values, 0,
-               prev_list->nvalues * sizeof(XLU_ConfigValue *));
-        return 0;
-    }
-    default:
-        abort();
-    }
-    return -1;
-}
-
-void xlu__cfg_set_store(CfgParseContext *ctx, char *name,
-                        enum XLU_Operation op,
-                        XLU_ConfigValue *val, int lineno) {
-    XLU_ConfigSetting *set;
-    int r;
-
-    if (ctx->err) goto out;
-
-    assert(name);
-
-    if (op == XLU_OP_ADDITION) {
-        /* If we have += concatenate with previous value with same name */
-        XLU_ConfigSetting *prev_set = find(ctx->cfg, name);
-        if (prev_set) {
-            r = xlu__cfg_concat_vals(ctx, prev_set->value, val);
-            if (r) {
-                ctx->err = r;
-                goto out;
-            }
-        }
-    }
-
-    set = malloc(sizeof(*set));
-    if (!set) {
-        ctx->err = errno;
-        goto out;
-    }
-    set->name= name;
-    set->value = val;
-    set->op = op;
-    set->lineno= lineno;
-    set->next = *ctx->psettings;
-    *ctx->psettings = set;
-    return;
-out:
-    assert(ctx->err);
-    free(name);
-    xlu__cfg_value_free(val);
-}
-
-char *xlu__cfgl_strdup(CfgParseContext *ctx, const char *src) {
-    char *result;
-
-    if (ctx->err) return 0;
-    result= strdup(src);
-    if (!result) ctx->err= errno;
-    return result;
-}
-
-char *xlu__cfgl_dequote(CfgParseContext *ctx, const char *src) {
-    char *result;
-    const char *p;
-    char *q;
-    int len, c, nc;
-
-    if (ctx->err) return 0;
-
-    len= strlen(src);
-    assert(len>=2 && src[0]==src[len-1]);
-
-    result= malloc(len-1);
-    if (!result) { ctx->err= errno; return 0; }
-
-    q= result;
-
-    for (p= src+1;
-         p < src+len-1;
-         ) {
-        c= *p++;
-        if (c=='\\') {
-            assert(p < src+len-1);
-            nc= *p++;
-            if (nc=='"' || nc=='\'' || nc=='\\') {
-                *q++= nc;
-            } else if (nc=='a') { *q++= '\007';
-            } else if (nc=='b') { *q++= '\010';
-            } else if (nc=='f') { *q++= '\014';
-            } else if (nc=='n') { *q++= '\n';
-            } else if (nc=='r') { *q++= '\r';
-            } else if (nc=='t') { *q++= '\t';
-            } else if (nc=='v') { *q++= '\013';
-            } else if (nc=='x') {
-
-#define NUMERIC_CHAR(minlen,maxlen,base,basetext) do{                        \
-                char numbuf[(maxlen)+1], *ep;                                \
-                unsigned long val;                                           \
-                                                                             \
-                strncpy(numbuf,p,(maxlen));                                  \
-                numbuf[(maxlen)]= 0;                                         \
-                val= strtoul(numbuf, &ep, (base));                           \
-                if (ep <= numbuf+(minlen)) {                                 \
-                    xlu__cfgl_lexicalerror(ctx,"invalid digit after"         \
-                         " backslash " basetext "numerical character escape" \
-                         " in quoted string");                               \
-                    ctx->err= EINVAL;                                        \
-                    goto x;                                                  \
-                }                                                            \
-                p += (ep - numbuf);                                          \
- }while(0)
-
-                p++;
-                NUMERIC_CHAR(2,2,16,"hex");
-            } else if (nc>='0' && nc<='7') {
-                NUMERIC_CHAR(1,3,10,"octal");
-            } else {
-                xlu__cfgl_lexicalerror(ctx,
-                           "invalid character after backlash in quoted string");
-                ctx->err= EINVAL;
-                goto x;
-            }
-            assert(p <= src+len-1);
-        } else {
-            *q++= c;
-        }
-    }
-
- x:
-    *q++= 0;
-    return result;
-}
-
-void xlu__cfgl_lexicalerror(CfgParseContext *ctx, char const *msg) {
-    XLU__CFG_YYLTYPE loc;
-    loc.first_line= xlu__cfg_yyget_lineno(ctx->scanner);
-    xlu__cfg_yyerror(&loc, ctx, msg);
-    ctx->lexerrlineno= loc.first_line;
-}
-
-void xlu__cfg_yyerror(XLU__CFG_YYLTYPE *loc, CfgParseContext *ctx,
-        char const *msg) {
-    const char *text, *newline;
-    int len, lineno;
-
-    lineno= loc->first_line;
-    if (lineno <= ctx->lexerrlineno) return;
-
-    text= xlu__cfg_yyget_text(ctx->scanner);
-    len= xlu__cfg_yyget_leng(ctx->scanner);
-    newline= "";
-    if (len>0 && text[len-1]=='\n') {
-        len--;
-        lineno--;
-        if (!len) {
-            newline= "<newline>";
-        }
-    }
-    while (len>0 && (text[len-1]=='\t' || text[len-1]==' ')) {
-        len--;
-    }
-
-    xlu_cfg_printf(ctx->cfg, "%d: config parsing error near %s%.*s%s%s: %s\n",
-            lineno, len?"`":"", len, text, len?"'":"", newline, msg);
-    if (!ctx->err) ctx->err= EINVAL;
-}
-
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/util/libxlu_cfg.c b/tools/libs/util/libxlu_cfg_i.c
similarity index 90%
copy from tools/libs/util/libxlu_cfg.c
copy to tools/libs/util/libxlu_cfg_i.c
index 7bbedde8f6..bf5890b273 100644
--- a/tools/libs/util/libxlu_cfg.c
+++ b/tools/libs/util/libxlu_cfg_i.c
@@ -20,7 +20,6 @@
 #include <limits.h>
 #include <stdarg.h>
 
-#include "libxlu_internal.h"
 #include "libxlu_cfg_y.h"
 #include "libxlu_cfg_l.h"
 
@@ -47,26 +46,6 @@ struct XLU_ConfigValue {
     XLU__CFG_YYLTYPE loc;
 };
 
-struct XLU_Config {
-    XLU_ConfigSetting *settings;
-    FILE *report;
-    const char *config_source;
-};
-
-XLU_Config *xlu_cfg_init(FILE *report, const char *report_source) {
-    XLU_Config *cfg;
-
-    cfg= malloc(sizeof(*cfg));
-    if (!cfg) return 0;
-
-    cfg->report= report;
-    cfg->config_source= strdup(report_source);
-    if (!cfg->config_source) { free(cfg); return 0; }
-
-    cfg->settings= 0;
-    return cfg;
-}
-
 static int ctx_prep(CfgParseContext *ctx, XLU_Config *cfg,
     XLU_ConfigSetting **psettings)
 {
@@ -110,25 +89,6 @@ static void parse(CfgParseContext *ctx) {
     }
 }
 
-int xlu_cfg_readfile(XLU_Config *cfg, const char *name)
-{
-    FILE *file;
-    int ret;
-
-    file = fopen(name, "r");
-    if (file) {
-        ret = xlu__cfg_readfile(cfg, cfg->report, cfg->config_source,
-            &cfg->settings, file, name);
-        fclose(file);
-    } else {
-        ret = errno;
-        fprintf(cfg->report,"%s: unable to open configuration file: %s\n",
-                name, strerror(ret));
-    }
-
-    return ret;
-}
-
 int xlu__cfg_readfile(XLU_Config *cfg, FILE *msgfile, const char *msgprefix,
     XLU_ConfigSetting **psettings, FILE *f, const char *name)
 {
@@ -148,12 +108,6 @@ int xlu__cfg_readfile(XLU_Config *cfg, FILE *msgfile, const char *msgprefix,
     return ctx.err;
 }
 
-int xlu_cfg_readdata(XLU_Config *cfg, const char *data, int length)
-{
-    return xlu__cfg_readdata(cfg, cfg->report, cfg->config_source,
-        &cfg->settings, data, length);
-}
-
 int xlu__cfg_readdata(XLU_Config *cfg, FILE *msgfile, const char *msgprefix,
     XLU_ConfigSetting **psettings, const char *data, int length)
 {
@@ -208,35 +162,6 @@ void xlu__cfg_set_free(XLU_ConfigSetting *set) {
     }
 }
 
-void xlu_cfg_destroy(XLU_Config *cfg) {
-    if (!cfg) return;
-    xlu__cfg_set_free(cfg->settings);
-    free((void *)cfg->config_source);
-    free(cfg);
-}
-
-int xlu_cfg_printf(const XLU_Config *cfg, const char *format, ...)
-{
-    va_list args;
-    int ret;
-
-    if (!cfg || !cfg->report)
-        return EFAULT;
-
-    ret = fputs(cfg->config_source, cfg->report);
-    if (ret < 0)
-        return -errno;
-    ret = fputc(':', cfg->report);
-    if (ret < 0)
-        return -errno;
-
-    va_start(args, format);
-    ret = vfprintf(cfg->report, format, args);
-    va_end(args);
-
-    return -errno;
-}
-
 static XLU_ConfigSetting *find(const XLU_Config *cfg, const char *n) {
     XLU_ConfigSetting *set;
 
@@ -267,11 +192,6 @@ static int find_atom(const XLU_Config *cfg, const char *n,
     return 0;
 }
 
-XLU_ConfigSetting *xlu__cfg_get_settings(const XLU_Config *cfg)
-{
-    return cfg->settings;
-}
-
 
 enum XLU_ConfigValueType xlu_cfg_value_type(const XLU_ConfigValue *value)
 {
@@ -391,12 +311,6 @@ int xlu_cfg_get_bounded_long(const XLU_Config *cfg, const char *n,
     return 0;
 }
 
-int xlu_cfg_get_long(const XLU_Config *cfg, const char *n,
-                     long *value_r, int dont_warn) {
-    return xlu_cfg_get_bounded_long(cfg, n, LONG_MIN, LONG_MAX, value_r,
-                                    dont_warn);
-}
-
 int xlu_cfg_get_defbool(const XLU_Config *cfg, const char *n,
                         libxl_defbool *value_r, int dont_warn)
 {
@@ -456,7 +370,6 @@ const char *xlu_cfg_get_listitem(const XLU_ConfigList *list, int entry) {
     return list->values[entry]->u.string;
 }
 
-
 XLU_ConfigValue *xlu__cfg_string_mk(CfgParseContext *ctx, char *atom,
                                     XLU__CFG_YYLTYPE *loc)
 {
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |       ehem+sigmsg@m5p.com      PGP 87145445       |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




