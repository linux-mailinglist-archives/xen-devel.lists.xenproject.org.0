Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E3B4B5128
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:07:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271788.466536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb4C-00008H-HM; Mon, 14 Feb 2022 13:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271788.466536; Mon, 14 Feb 2022 13:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb4B-0008H9-On; Mon, 14 Feb 2022 13:06:55 +0000
Received: by outflank-mailman (input) for mailman id 271788;
 Mon, 14 Feb 2022 13:06:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb2o-0008IH-Uv
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:31 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c85ef101-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:05:29 +0100 (CET)
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
X-Inumbo-ID: c85ef101-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843928;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=yHxT60mUhe/bdOaYInkxIEHjxisfTCydkooBUoIXm1M=;
  b=gu3Y0sILdPtKjus+ehUOkt+lF5AKqkB5fkeI2gOi8tzUwmbG1+fMq4yj
   ldeJ2IXcdVfRbcCuHCxNiR6eqvJmguWXNqPNr8uU4vnrHpOEkyWbetcoG
   mOX7QdW1rLSwGRomW9KArB443+V1X9JByHIlG9kvnMyQ+xPeibTMPrNlu
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: IfyhiO4NRjvgMWsYVeStTCJbvfVis7VLr1QbwYda0dNdTcl8JdA14OmEJiDGvL5ZiRmL7+9iNz
 ybln7mX/b0K8VbX7oBwyIeHiwdD9+i2rHYZEH0/cI4VYouSJkZRWYhpdHUoMWqqvuNWny5ci+U
 W37+se8pJsY2NqMjkqd0kjDqsW3dq/J18HEttrVgZYT+TV6Wx/vbicZ4ekYURlmq8uEutugwUk
 3iKHGxZlQCwDZHYIvvpq4DI94oY/G8aEV3bgENtOey/lNSbOhE1EtbMsPcUdD/6vhz+m9SVfcG
 8ZOMzQDMBwZ9NZafczvi9Xnb
X-SBRS: 5.1
X-MesageID: 64149818
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Xwjk2a/KST9YhIf28+VrDrUDnnmTJUtcMsCJ2f8bNWPcYEJGY0x3x
 2QaXG/TMvfZMWb1c40gPtu/9UIF7J/dzoJlSgBt+yE8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rg3tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh0k
 PUKqryOSDwNFYHSissDfURzMw5haPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4SRKqPN
 5NJAdZpRDL+cRNBJ24qMYw7rP66rHflUzZy+F3A8MLb5ECMlVcsgdABKuH9atGMAMlYgEucj
 mbH5HjiRAEXMsSFzjiI+W7qgfXA9R4XQ6pLSuf+rKQzxgTOmCpDU3X6SGdXv9G80m75RPJhK
 ncw0QYwv4cs2hGAbvbiCkjQTGG/gjYQXN9ZEusf4Q6Ly7bJ7wvxOlXoXgKte/R96pZoGGVCO
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
IronPort-HdrOrdr: A9a23:UjVNE6/VeiQbj227Zatuk+DaI+orL9Y04lQ7vn2YSXRuHPBw9v
 re5cjzuiWVtN98Yh0dcJW7Scy9qBDnhPhICOsqTNSftWDd0QPCRuxfBMnZslnd8kXFh4lgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149818"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 18/70] xsm/flask/ss: CFI hardening
Date: Mon, 14 Feb 2022 12:50:35 +0000
Message-ID: <20220214125127.17985-19-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/xsm/flask/ss/avtab.c       |  4 ++--
 xen/xsm/flask/ss/conditional.c | 10 ++++----
 xen/xsm/flask/ss/conditional.h |  6 ++---
 xen/xsm/flask/ss/policydb.c    | 53 ++++++++++++++++++++++--------------------
 xen/xsm/flask/ss/services.c    |  6 ++---
 xen/xsm/flask/ss/symtab.c      |  5 ++--
 6 files changed, 44 insertions(+), 40 deletions(-)

diff --git a/xen/xsm/flask/ss/avtab.c b/xen/xsm/flask/ss/avtab.c
index bfc91c8b0c2c..55c2b4d8a46d 100644
--- a/xen/xsm/flask/ss/avtab.c
+++ b/xen/xsm/flask/ss/avtab.c
@@ -482,8 +482,8 @@ int avtab_read_item(struct avtab *a, void *fp, struct policydb *pol,
     return insertf(a, &key, &datum, p);
 }
 
-static int avtab_insertf(struct avtab *a, struct avtab_key *k,
-                                                struct avtab_datum *d, void *p)
+static int cf_check avtab_insertf(
+    struct avtab *a, struct avtab_key *k, struct avtab_datum *d, void *p)
 {
     return avtab_insert(a, k, d);
 }
diff --git a/xen/xsm/flask/ss/conditional.c b/xen/xsm/flask/ss/conditional.c
index 3e58aea55147..b4b116666cf7 100644
--- a/xen/xsm/flask/ss/conditional.c
+++ b/xen/xsm/flask/ss/conditional.c
@@ -189,14 +189,14 @@ int cond_init_bool_indexes(struct policydb *p)
     return 0;
 }
 
-int cond_destroy_bool(void *key, void *datum, void *p)
+int cf_check cond_destroy_bool(void *key, void *datum, void *p)
 {
     xfree(key);
     xfree(datum);
     return 0;
 }
 
-int cond_index_bool(void *key, void *datum, void *datap)
+int cf_check cond_index_bool(void *key, void *datum, void *datap)
 {
     struct policydb *p;
     struct cond_bool_datum *booldatum;
@@ -220,7 +220,7 @@ static int bool_isvalid(struct cond_bool_datum *b)
     return 1;
 }
 
-int cond_read_bool(struct policydb *p, struct hashtab *h, void *fp)
+int cf_check cond_read_bool(struct policydb *p, struct hashtab *h, void *fp)
 {
     char *key = NULL;
     struct cond_bool_datum *booldatum;
@@ -268,8 +268,8 @@ struct cond_insertf_data
     struct cond_av_list *tail;
 };
 
-static int cond_insertf(struct avtab *a, struct avtab_key *k, 
-                                            struct avtab_datum *d, void *ptr)
+static int cf_check cond_insertf(
+    struct avtab *a, struct avtab_key *k, struct avtab_datum *d, void *ptr)
 {
     struct cond_insertf_data *data = ptr;
     struct policydb *p = data->p;
diff --git a/xen/xsm/flask/ss/conditional.h b/xen/xsm/flask/ss/conditional.h
index 59ac6b4b57c1..500fe4305a03 100644
--- a/xen/xsm/flask/ss/conditional.h
+++ b/xen/xsm/flask/ss/conditional.h
@@ -63,11 +63,11 @@ int cond_policydb_init(struct policydb* p);
 void cond_policydb_destroy(struct policydb* p);
 
 int cond_init_bool_indexes(struct policydb* p);
-int cond_destroy_bool(void *key, void *datum, void *p);
+int cf_check cond_destroy_bool(void *key, void *datum, void *p);
 
-int cond_index_bool(void *key, void *datum, void *datap);
+int cf_check cond_index_bool(void *key, void *datum, void *datap);
 
-int cond_read_bool(struct policydb *p, struct hashtab *h, void *fp);
+int cf_check cond_read_bool(struct policydb *p, struct hashtab *h, void *fp);
 int cond_read_list(struct policydb *p, void *fp);
 
 void cond_compute_av(struct avtab *ctab, struct avtab_key *key, struct av_decision *avd);
diff --git a/xen/xsm/flask/ss/policydb.c b/xen/xsm/flask/ss/policydb.c
index 94261643532a..ff2103c63eab 100644
--- a/xen/xsm/flask/ss/policydb.c
+++ b/xen/xsm/flask/ss/policydb.c
@@ -257,12 +257,12 @@ static int policydb_init(struct policydb *p)
  * of a class, role, or user are needed.
  */
 
-static int common_index(void *key, void *datum, void *datap)
+static int cf_check common_index(void *key, void *datum, void *datap)
 {
     return 0;
 }
 
-static int class_index(void *key, void *datum, void *datap)
+static int cf_check class_index(void *key, void *datum, void *datap)
 {
     struct policydb *p;
     struct class_datum *cladatum;
@@ -276,7 +276,7 @@ static int class_index(void *key, void *datum, void *datap)
     return 0;
 }
 
-static int role_index(void *key, void *datum, void *datap)
+static int cf_check role_index(void *key, void *datum, void *datap)
 {
     struct policydb *p;
     struct role_datum *role;
@@ -292,7 +292,7 @@ static int role_index(void *key, void *datum, void *datap)
     return 0;
 }
 
-static int type_index(void *key, void *datum, void *datap)
+static int cf_check type_index(void *key, void *datum, void *datap)
 {
     struct policydb *p;
     struct type_datum *typdatum;
@@ -313,7 +313,7 @@ static int type_index(void *key, void *datum, void *datap)
     return 0;
 }
 
-static int user_index(void *key, void *datum, void *datap)
+static int cf_check user_index(void *key, void *datum, void *datap)
 {
     struct policydb *p;
     struct user_datum *usrdatum;
@@ -329,7 +329,7 @@ static int user_index(void *key, void *datum, void *datap)
     return 0;
 }
 
-static int sens_index(void *key, void *datum, void *datap)
+static int cf_check sens_index(void *key, void *datum, void *datap)
 {
     struct policydb *p;
     struct level_datum *levdatum;
@@ -348,7 +348,7 @@ static int sens_index(void *key, void *datum, void *datap)
     return 0;
 }
 
-static int cat_index(void *key, void *datum, void *datap)
+static int cf_check cat_index(void *key, void *datum, void *datap)
 {
     struct policydb *p;
     struct cat_datum *catdatum;
@@ -506,14 +506,14 @@ static int policydb_index_others(struct policydb *p)
  * symbol data in the policy database.
  */
 
-static int perm_destroy(void *key, void *datum, void *p)
+static int cf_check perm_destroy(void *key, void *datum, void *p)
 {
     xfree(key);
     xfree(datum);
     return 0;
 }
 
-static int common_destroy(void *key, void *datum, void *p)
+static int cf_check common_destroy(void *key, void *datum, void *p)
 {
     struct common_datum *comdatum;
 
@@ -525,7 +525,7 @@ static int common_destroy(void *key, void *datum, void *p)
     return 0;
 }
 
-static int class_destroy(void *key, void *datum, void *p)
+static int cf_check class_destroy(void *key, void *datum, void *p)
 {
     struct class_datum *cladatum;
     struct constraint_node *constraint, *ctemp;
@@ -572,7 +572,7 @@ static int class_destroy(void *key, void *datum, void *p)
     return 0;
 }
 
-static int role_destroy(void *key, void *datum, void *p)
+static int cf_check role_destroy(void *key, void *datum, void *p)
 {
     struct role_datum *role;
 
@@ -584,14 +584,14 @@ static int role_destroy(void *key, void *datum, void *p)
     return 0;
 }
 
-static int type_destroy(void *key, void *datum, void *p)
+static int cf_check type_destroy(void *key, void *datum, void *p)
 {
     xfree(key);
     xfree(datum);
     return 0;
 }
 
-static int user_destroy(void *key, void *datum, void *p)
+static int cf_check user_destroy(void *key, void *datum, void *p)
 {
     struct user_datum *usrdatum;
 
@@ -605,7 +605,7 @@ static int user_destroy(void *key, void *datum, void *p)
     return 0;
 }
 
-static int sens_destroy(void *key, void *datum, void *p)
+static int cf_check sens_destroy(void *key, void *datum, void *p)
 {
     struct level_datum *levdatum;
 
@@ -617,7 +617,7 @@ static int sens_destroy(void *key, void *datum, void *p)
     return 0;
 }
 
-static int cat_destroy(void *key, void *datum, void *p)
+static int cf_check cat_destroy(void *key, void *datum, void *p)
 {
     xfree(key);
     xfree(datum);
@@ -989,7 +989,7 @@ static int perm_read(struct policydb *p, struct hashtab *h, void *fp)
     goto out;
 }
 
-static int common_read(struct policydb *p, struct hashtab *h, void *fp)
+static int cf_check common_read(struct policydb *p, struct hashtab *h, void *fp)
 {
     char *key = NULL;
     struct common_datum *comdatum;
@@ -1151,7 +1151,7 @@ static int read_cons_helper(struct policydb *p, struct constraint_node **nodep,
     return 0;
 }
 
-static int class_read(struct policydb *p, struct hashtab *h, void *fp)
+static int cf_check class_read(struct policydb *p, struct hashtab *h, void *fp)
 {
     char *key = NULL;
     struct class_datum *cladatum;
@@ -1250,7 +1250,7 @@ static int class_read(struct policydb *p, struct hashtab *h, void *fp)
     goto out;
 }
 
-static int role_read(struct policydb *p, struct hashtab *h, void *fp)
+static int cf_check role_read(struct policydb *p, struct hashtab *h, void *fp)
 {
     char *key = NULL;
     struct role_datum *role;
@@ -1321,7 +1321,7 @@ static int role_read(struct policydb *p, struct hashtab *h, void *fp)
     goto out;
 }
 
-static int type_read(struct policydb *p, struct hashtab *h, void *fp)
+static int cf_check type_read(struct policydb *p, struct hashtab *h, void *fp)
 {
     char *key = NULL;
     struct type_datum *typdatum;
@@ -1415,7 +1415,7 @@ static int mls_read_level(struct mls_level *lp, void *fp)
     return -EINVAL;
 }
 
-static int user_read(struct policydb *p, struct hashtab *h, void *fp)
+static int cf_check user_read(struct policydb *p, struct hashtab *h, void *fp)
 {
     char *key = NULL;
     struct user_datum *usrdatum;
@@ -1479,7 +1479,7 @@ static int user_read(struct policydb *p, struct hashtab *h, void *fp)
     goto out;
 }
 
-static int sens_read(struct policydb *p, struct hashtab *h, void *fp)
+static int cf_check sens_read(struct policydb *p, struct hashtab *h, void *fp)
 {
     char *key = NULL;
     struct level_datum *levdatum;
@@ -1534,7 +1534,7 @@ static int sens_read(struct policydb *p, struct hashtab *h, void *fp)
     goto out;
 }
 
-static int cat_read(struct policydb *p, struct hashtab *h, void *fp)
+static int cf_check cat_read(struct policydb *p, struct hashtab *h, void *fp)
 {
     char *key = NULL;
     struct cat_datum *catdatum;
@@ -1591,7 +1591,8 @@ static int (*read_f[SYM_NUM]) (struct policydb *p, struct hashtab *h, void *fp)
     cat_read,
 };
 
-static int user_bounds_sanity_check(void *key, void *datum, void *datap)
+static int cf_check user_bounds_sanity_check(
+    void *key, void *datum, void *datap)
 {
     struct user_datum *upper, *user;
     struct policydb *p = datap;
@@ -1631,7 +1632,8 @@ static int user_bounds_sanity_check(void *key, void *datum, void *datap)
     return 0;
 }
 
-static int role_bounds_sanity_check(void *key, void *datum, void *datap)
+static int cf_check role_bounds_sanity_check(
+    void *key, void *datum, void *datap)
 {
     struct role_datum *upper, *role;
     struct policydb *p = datap;
@@ -1671,7 +1673,8 @@ static int role_bounds_sanity_check(void *key, void *datum, void *datap)
     return 0;
 }
 
-static int type_bounds_sanity_check(void *key, void *datum, void *datap)
+static int cf_check type_bounds_sanity_check(
+    void *key, void *datum, void *datap)
 {
     struct type_datum *upper, *type;
     struct policydb *p = datap;
diff --git a/xen/xsm/flask/ss/services.c b/xen/xsm/flask/ss/services.c
index 42686535f2c4..2f6d3d350d05 100644
--- a/xen/xsm/flask/ss/services.c
+++ b/xen/xsm/flask/ss/services.c
@@ -283,7 +283,7 @@ static int constraint_expr_eval(struct context *scontext,
  * security_dump_masked_av - dumps masked permissions during
  * security_compute_av due to RBAC, MLS/Constraint and Type bounds.
  */
-static int dump_masked_av_helper(void *k, void *d, void *args)
+static int cf_check dump_masked_av_helper(void *k, void *d, void *args)
 {
     struct perm_datum *pdatum = d;
     char **permission_names = args;
@@ -1240,7 +1240,7 @@ static int validate_classes(struct policydb *p)
 }
 
 /* Clone the SID into the new SID table. */
-static int clone_sid(u32 sid, struct context *context, void *arg)
+static int cf_check clone_sid(u32 sid, struct context *context, void *arg)
 {
     struct sidtab *s = arg;
 
@@ -1277,7 +1277,7 @@ struct convert_context_args {
  * in the policy `p->newp'.  Verify that the
  * context is valid under the new policy.
  */
-static int convert_context(u32 key, struct context *c, void *p)
+static int cf_check convert_context(u32 key, struct context *c, void *p)
 {
     struct convert_context_args *args;
     struct context oldc;
diff --git a/xen/xsm/flask/ss/symtab.c b/xen/xsm/flask/ss/symtab.c
index d98c116d5b97..0ce7e08c24ea 100644
--- a/xen/xsm/flask/ss/symtab.c
+++ b/xen/xsm/flask/ss/symtab.c
@@ -12,7 +12,7 @@
 #include <xen/errno.h>
 #include "symtab.h"
 
-static unsigned int symhash(struct hashtab *h, const void *key)
+static unsigned int cf_check symhash(struct hashtab *h, const void *key)
 {
     const char *p, *keyp;
     unsigned int size;
@@ -26,7 +26,8 @@ static unsigned int symhash(struct hashtab *h, const void *key)
     return val & (h->size - 1);
 }
 
-static int symcmp(struct hashtab *h, const void *key1, const void *key2)
+static int cf_check symcmp(
+    struct hashtab *h, const void *key1, const void *key2)
 {
     const char *keyp1, *keyp2;
 
-- 
2.11.0


