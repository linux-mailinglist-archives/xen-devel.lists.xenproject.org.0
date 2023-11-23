Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4D37F5DBE
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 12:24:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639618.997174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67oI-0001V3-7Z; Thu, 23 Nov 2023 11:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639618.997174; Thu, 23 Nov 2023 11:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67oI-0001TC-1a; Thu, 23 Nov 2023 11:23:54 +0000
Received: by outflank-mailman (input) for mailman id 639618;
 Thu, 23 Nov 2023 11:23:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRmN=HE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r67oG-000197-9l
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 11:23:52 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c70a7c2c-89f2-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 12:23:51 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40907b82ab9so10358825e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 03:23:51 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 o7-20020a05600c510700b0040b36ad5413sm1517433wms.46.2023.11.23.03.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 03:23:49 -0800 (PST)
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
X-Inumbo-ID: c70a7c2c-89f2-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700738630; x=1701343430; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xiZONnswDwKe9ci9BXT6f1Pl5k4kKA0IcogCCNF7rGo=;
        b=soL4yu/rlcOvZTdj0068957+rwV79PvhfYL4lje7cm6yjpq8WZmsx1M3WcRBJjO0qp
         4vArxTkw7EIZ8d0+K+GJsi547Y7EtrumvH5zZSoVOa/oRlKaE3banPzEbnmewWkDAcGW
         lqDWZzvtuOoeNp2saQSX0Bx57ddsNPvfrpgeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700738630; x=1701343430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xiZONnswDwKe9ci9BXT6f1Pl5k4kKA0IcogCCNF7rGo=;
        b=oqPbLshXr4JUWeR0Z4Y6lNmyBM8EhjDyKKhGF+nXvIP7Y/wdaQKB3tIEO+nbr+hWCE
         1smW4lu6ZC8EtAs6VfcMGh9EitjPfFI0Q4UarRE0Hb/dV818/lgrKrJsVFGwbPJi5abg
         0YVTSGJwLQrS65ODaQvWtJQgTkJG0jcn0qPOQIh3xy18aunmcF0aUwqU6dPeAZUb58OX
         kQfrcfms8Ca0hUm7yRoJKBnpRxQThMd5w+yAhpTvVmOlmV/tSJrGGaCnT8Hi/3Q3orvM
         fWy6fqS2aNnKiRvP4XoDDfD5QybmLweNI5XmEyelyvTZY8cFbxeddYUyvU10y/5Mr2gf
         Z3+g==
X-Gm-Message-State: AOJu0YzhljbV5QRkHUx2HVNGXSvKjfIrpwINvoGXgNuQhLUhTPHahk4H
	HISc4H6RUfRtk6wEPNLzFrZW40JKTHvzNhSBg5c=
X-Google-Smtp-Source: AGHT+IFg873uNCV2N+OzyDtfqrX8jTH0uhH3pweuWtn+iHtjCvPG+B22v0Vg2pBvxYLDPTBOIH4c0Q==
X-Received: by 2002:a05:600c:5124:b0:40b:2ad8:579f with SMTP id o36-20020a05600c512400b0040b2ad8579fmr2060739wms.3.1700738629858;
        Thu, 23 Nov 2023 03:23:49 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 2/3] livepatch: add a dummy hypercall for testing purposes
Date: Thu, 23 Nov 2023 12:23:37 +0100
Message-ID: <20231123112338.14477-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123112338.14477-1-roger.pau@citrix.com>
References: <20231123112338.14477-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce a dummy XEN_SYSCTL_LIVEPATCH_TEST hypercall to be used in order to
test livepatch functionality.  The hypercall fills a value in the passed
structure, which is returned to the caller.

The xen-livepatch utility is expanded to allow calling that hypercall, and
printing the returned value on stdout.

Finally, add dummy patch that changes the returned value of the hypercall from
1 to 2.  Such patch can be used with livepatch-build-tools in order to generate
a livepatch payload, that when applied to the hypervisor change the printed
value of `xen-livepatch test`.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
The whole logic is very simple now.  I think it's enough to have a skeleton we
can later expand.

Unsure whether we should do some kind of test (with `patch -F0`) that the patch
still applies cleanly as part of Xen build.
---
 tools/include/xenctrl.h                |  3 +++
 tools/libs/ctrl/xc_misc.c              | 14 ++++++++++++++
 tools/misc/xen-livepatch.c             | 25 +++++++++++++++++++++++++
 xen/common/Makefile                    |  2 +-
 xen/common/livepatch-test.c            | 20 ++++++++++++++++++++
 xen/common/livepatch.c                 |  4 ++++
 xen/include/public/sysctl.h            |  7 +++++++
 xen/include/xen/livepatch.h            |  4 ++++
 xen/test/livepatch/patches/test1.patch | 13 +++++++++++++
 9 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 xen/common/livepatch-test.c
 create mode 100644 xen/test/livepatch/patches/test1.patch

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 2ef8b4e05422..83a00d4974dd 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2645,6 +2645,9 @@ int xc_livepatch_revert(xc_interface *xch, char *name, uint32_t timeout, uint32_
 int xc_livepatch_unload(xc_interface *xch, char *name, uint32_t timeout, uint32_t flags);
 int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32_t flags);
 
+/* Dummy hypercall to test livepatch functionality. */
+int xc_livepatch_test(xc_interface *xch, uint32_t *result);
+
 /*
  * Ensure cache coherency after memory modifications. A call to this function
  * is only required on ARM as the x86 architecture provides cache coherency
diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
index 5ecdfa2c7934..0ca86a53d097 100644
--- a/tools/libs/ctrl/xc_misc.c
+++ b/tools/libs/ctrl/xc_misc.c
@@ -1021,6 +1021,20 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
     return _xc_livepatch_action(xch, name, LIVEPATCH_ACTION_REPLACE, timeout, flags);
 }
 
+int xc_livepatch_test(xc_interface *xch, uint32_t *result)
+{
+    struct xen_sysctl sysctl = {
+        .cmd = XEN_SYSCTL_livepatch_op,
+        .u.livepatch.cmd = XEN_SYSCTL_LIVEPATCH_TEST,
+    };
+    int rc = do_sysctl(xch, &sysctl);
+
+    if ( !rc )
+        *result = sysctl.u.livepatch.u.test.result;
+
+    return rc;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/misc/xen-livepatch.c b/tools/misc/xen-livepatch.c
index 5bf9d9a32b65..5f6fd20d8814 100644
--- a/tools/misc/xen-livepatch.c
+++ b/tools/misc/xen-livepatch.c
@@ -37,6 +37,7 @@ void show_help(void)
             "  replace <name>         apply <name> patch and revert all others.\n"
             "  unload <name>          unload name <name> patch.\n"
             "  load <file> [flags]    upload and apply <file> with name as the <file> name\n"
+            "  test                   print the result of the test hypercall (for testing purposes only)\n"
             "    Supported flags:\n"
             "      --nodeps           Disable inter-module buildid dependency check.\n"
             "                         Check only against hypervisor buildid.\n",
@@ -542,6 +543,29 @@ error:
     return rc;
 }
 
+static int test_func(int argc, char *argv[])
+{
+    int rc;
+    uint32_t result = 0;
+
+    if ( argc != 0 )
+    {
+        show_help();
+        return -1;
+    }
+
+    rc = xc_livepatch_test(xch, &result);
+    if ( rc )
+    {
+        fprintf(stderr, "test operation failed: %s\n", strerror(errno));
+        return -1;
+    }
+
+    printf("%u\n", result);
+
+    return 0;
+}
+
 /*
  * These are also functions in action_options that are called in case
  * none of the ones in main_options match.
@@ -554,6 +578,7 @@ struct {
     { "list", list_func },
     { "upload", upload_func },
     { "load", load_func },
+    { "test", test_func },
 };
 
 int main(int argc, char *argv[])
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 69d6aa626c7f..ab073d41f1d2 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -23,7 +23,7 @@ obj-y += kernel.o
 obj-y += keyhandler.o
 obj-$(CONFIG_KEXEC) += kexec.o
 obj-$(CONFIG_KEXEC) += kimage.o
-obj-$(CONFIG_LIVEPATCH) += livepatch.o livepatch_elf.o
+obj-$(CONFIG_LIVEPATCH) += livepatch.o livepatch_elf.o livepatch-test.o
 obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-y += memory.o
 obj-y += multicall.o
diff --git a/xen/common/livepatch-test.c b/xen/common/livepatch-test.c
new file mode 100644
index 000000000000..05b638b2ac67
--- /dev/null
+++ b/xen/common/livepatch-test.c
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* Dummy file for testing livepatch functionality. */
+#include <xen/livepatch.h>
+
+int livepatch_test(struct xen_sysctl_livepatch_test *test)
+{
+    test->result = 1;
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 1209fea2566c..e8894db1cc93 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -2116,6 +2116,10 @@ int livepatch_op(struct xen_sysctl_livepatch_op *livepatch)
         rc = livepatch_action(&livepatch->u.action);
         break;
 
+    case XEN_SYSCTL_LIVEPATCH_TEST:
+        rc = livepatch_test(&livepatch->u.test);
+        break;
+
     default:
         rc = -EOPNOTSUPP;
         break;
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 9b19679caeb1..9c13a7fdb22c 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1137,6 +1137,12 @@ struct xen_sysctl_livepatch_action {
     uint32_t pad;                           /* IN: Always zero. */
 };
 
+/* Dummy hypercall for testing live patches. */
+#define XEN_SYSCTL_LIVEPATCH_TEST 4
+struct xen_sysctl_livepatch_test {
+    uint32_t result;                        /* OUT: dummy result for testing. */
+};
+
 struct xen_sysctl_livepatch_op {
     uint32_t cmd;                           /* IN: XEN_SYSCTL_LIVEPATCH_*. */
     uint32_t pad;                           /* IN: Always zero. */
@@ -1145,6 +1151,7 @@ struct xen_sysctl_livepatch_op {
         struct xen_sysctl_livepatch_list list;
         struct xen_sysctl_livepatch_get get;
         struct xen_sysctl_livepatch_action action;
+        struct xen_sysctl_livepatch_test test;
     } u;
 };
 
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index df339a134e40..60d11d037dfb 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -11,6 +11,8 @@ struct livepatch_elf_sec;
 struct livepatch_elf_sym;
 struct xen_sysctl_livepatch_op;
 
+#include <xen/types.h> /* For elfstructs.h */
+
 #include <xen/elfstructs.h>
 #include <xen/errno.h> /* For -ENOSYS or -EOVERFLOW */
 
@@ -165,6 +167,8 @@ static inline void common_livepatch_revert(const struct livepatch_func *func,
     arch_livepatch_revert(func, state);
     state->applied = LIVEPATCH_FUNC_NOT_APPLIED;
 }
+
+int livepatch_test(struct xen_sysctl_livepatch_test *test);
 #else
 
 /*
diff --git a/xen/test/livepatch/patches/test1.patch b/xen/test/livepatch/patches/test1.patch
new file mode 100644
index 000000000000..c07d697cc8de
--- /dev/null
+++ b/xen/test/livepatch/patches/test1.patch
@@ -0,0 +1,13 @@
+diff --git a/xen/common/livepatch-test.c b/xen/common/livepatch-test.c
+index 05b638b2ac..876173ab6f 100644
+--- a/xen/common/livepatch-test.c
++++ b/xen/common/livepatch-test.c
+@@ -5,7 +5,7 @@
+ 
+ int livepatch_test(struct xen_sysctl_livepatch_test *test)
+ {
+-    test->result = 1;
++    test->result = 2;
+     return 0;
+ }
+ 
-- 
2.43.0


