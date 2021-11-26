Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE4845EE9B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232779.403778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawN-0003KR-Md; Fri, 26 Nov 2021 13:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232779.403778; Fri, 26 Nov 2021 13:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawN-0003Cx-Ee; Fri, 26 Nov 2021 13:06:59 +0000
Received: by outflank-mailman (input) for mailman id 232779;
 Fri, 26 Nov 2021 13:06:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqav2-0003W9-E9
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:36 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 888c72f9-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:05:31 +0100 (CET)
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
X-Inumbo-ID: 888c72f9-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931931;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=+Yj6D2+acshv1iSbGPrkSTGlvdblgzXw318p1/29CF0=;
  b=Veah2gKcV38ttBvQmFkLzmkBozBXZCJYU/H9iybJ/WfzNZoPqyKRdRTI
   gBind72QHZCDhPNAMoCYeJPNb5kI5RptqXOAqyK50A1DGkQVEkuKgBadj
   v5ysAGPYgD31g2mS2ZRtnrZabVJNnbJJVfG3EKA94sPCkK0UlsZKmOXum
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ql1grrFxBgNJMIlKfOMQmI/v0TsohdDfaRuX66TyObuz6R0ci13PVAUC+9/GI4Y7hmeLZxTsiH
 hTj/QXg4hMn7nu8wYpklLkVzarHZHX8BBu3WaLsfKfLOJR9ZlEPVvA0CSfENdztgbkmWN1otEt
 qwSHKyEfgjIxRyQQ/puLGqkia+MKeRL8IZXXbhrm0l9r9ueP5U5F4Ful4y8M7dof6hbex2aBLR
 wIqVDTLJBP9ZadpPIRpEySEoDNO46k8WCthDYTXn3VvZI2VIkLsd/9jk5WxWXJ1ni3PaqykWfj
 tBFJ/sZ6uV09QzcI4maishSf
X-SBRS: 5.1
X-MesageID: 58676398
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:T9W9hKK0V8ul9+ZEFE+RCpIlxSXFcZb7ZxGr2PjKsXjdYENS0D1Rm
 GUcXWzTaP6JNjfxKIwlbYzno0wC6JDQx4M1SwdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es5xbZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3ZgvtY5
 vgSsaaaWFwlF/XhlOohbilxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gpg2J8QRqeOD
 yYfQShlUlPCckdUAA9JJp0wrN2lmynlcyIN/Tp5ooJoujOOnWSdyoPFPMLOf92WRe1chkuCu
 n/d5GP9Hw0bM9qEjzGC9xqEiuDDkCzhUaoOBba48bhsm1TVyWsNYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQnZKflkdCAZwKSbR8sVzTjPqPi+qEOoQaZm5cQ/UImZAyfxY7j
 VOgx/7lCwBSgJTAHBpx6YyohT+1PCEUK0oLaikFURYJ7rHfnW0jsv7cZo09SfDo17UZDRm1m
 mnX93Zm293/mOZSj/3jlW0rlQ5AsXQgouQdwgzMFlyo4QpiDGJOT9z5sAOLhRqswWvwc7Vgg
 JTms5TBhAztJcvU/MBofAnrNOryjxpiGGeB6WOD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNZyT6M/IoMt7vV59CIU3c+TLNDau8gj1mOMUZSeN61Hs2OR74M57FzCDAbp3Ty
 b/EKJ3xXB72+IxszSasRvd17FPY7ntW+I8nfriil07P+ePHPBa9EO5ZWHPTPrFRxP7V+239r
 ocAX/ZmPj0CCYUSlAGMqtVNRb3LRFBmba3LRzt/KrTef1E4QT55UJc8A9oJIuRYokicrc+Ql
 lnVZ6OS4ACXaaTvJVrYZ3Z9RqnoWJoj/3s3MTZ1ZQSj2mQ5YJbp56AaLsNlcb4i/e1l7Ph1U
 /haJJnQXqUREmzKq2YHcJ3wjI1+bxD31wiACDWoPWokdJl6Sg2XptK9Jlnz9DMDBzacvNclp
 +HyzRvSRJcOHlwwDMvfZP+14Um2uHwRxLB7U0fSe4EBc0Tw6ol6bSf2i6Zvcc0LLBzCwBqc1
 hqXXkhE9bWc/ddt/YCQ166eroqvH+9vJWZgHjHWveSsKC3X3mu/2oscAuyGSi/QCTHv86K4a
 OQLk/ylaK8bnExHupZXGqpwyf5s/MPmorJXw1g2HHjPaFj3WLpsLmPfgJtKv6xJgLRYpRG3S
 gSE/dwDYeeFP8bsEVgwIgs5b7vciaFIy2eKtfllcl/n4CJX/aacVRQANhaBvyVRMb9pPd532
 uwmosMXt1SyhxdC3gxqVcyIG7Bg9kA9bpg=
IronPort-HdrOrdr: A9a23:tQCXTKBlW822GqzlHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo7v
 xG/c5rsyMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 9dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58676398"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>
Subject: [PATCH 14/65] xsm/flask:  Annotate fnptr targets in the security server
Date: Fri, 26 Nov 2021 12:33:55 +0000
Message-ID: <20211126123446.32324-15-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
CC: Daniel Smith <dpsmith@apertussolutions.com>
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


