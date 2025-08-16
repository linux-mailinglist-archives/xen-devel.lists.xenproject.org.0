Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE31B28D6E
	for <lists+xen-devel@lfdr.de>; Sat, 16 Aug 2025 13:31:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1084500.1443647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unF7f-0001r8-Cm; Sat, 16 Aug 2025 11:30:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1084500.1443647; Sat, 16 Aug 2025 11:30:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unF7f-0001of-A7; Sat, 16 Aug 2025 11:30:55 +0000
Received: by outflank-mailman (input) for mailman id 1084500;
 Sat, 16 Aug 2025 11:30:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UO4R=24=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1unF1b-0008R6-0x
 for xen-devel@lists.xenproject.org; Sat, 16 Aug 2025 11:24:39 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9792924d-7a93-11f0-b898-0df219b8e170;
 Sat, 16 Aug 2025 13:24:37 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45a1b00a65fso12970895e9.0
 for <xen-devel@lists.xenproject.org>; Sat, 16 Aug 2025 04:24:37 -0700 (PDT)
Received: from MinisforumBD795m.citrite.net
 ([2a02:1748:f7df:8cb1:3992:b1e9:da8a:3f30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a27ec6b71sm13852325e9.10.2025.08.16.04.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 04:24:35 -0700 (PDT)
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
X-Inumbo-ID: 9792924d-7a93-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1755343476; x=1755948276; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wt3Ep5ObVZ9RSrrf4fRGSI8+1rgfl6o5cNaA3eQGhXk=;
        b=g1nekSbXX9b6SbxlLRKch3bi1y8sj2M60B6HKXQS5Cny3dgT1I4moic1OAzn4NXl+2
         RYS90EsPUfNoXVqvSGV1jyLCrlW7yCAm2DKgwdMhqtSuiR8xv9qEScMh5EJv3VfKJHb1
         P0tnrzcYNxJzA3vw7Q6DXmiR8OgFu87yKLC9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755343476; x=1755948276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wt3Ep5ObVZ9RSrrf4fRGSI8+1rgfl6o5cNaA3eQGhXk=;
        b=WMug1XEMNNEs00zY1w7ioj7QogON+8C/USHNyTNhdEqBK019fqwQiFdHiWjXJbQaFI
         atAqXuIqh4lOg+Jh8foY3sak2zmNw0k/2BoC7Sz2eaiRdFbgs8p65MRW1yK3PleQSB4C
         09GHXLFnMXvkfrxmYfwEt0EnpVTbaxmNEaENXsAOulovR/9R1vX2A5fOMbFTE2MNViEz
         bDomJHHpTYun7CbVcVl1Nba4RJspb47wqcSN3/rTKBp0DQYsAtnKtI9IucCnJsqCFSmn
         EPFBILijADmia/i3XQM/8jYaBvaFu8InmfLGhsy3cuSgV4Gj0vAS9FOsXU0sCnTxhn2o
         iqFA==
X-Gm-Message-State: AOJu0Yx1svJPV1mprcbF9pOaAhiMWOR+2XLGE6TklK7STMsXxYLPVUGP
	/1x3cQDCPmuT8DdzRYywH9cC+InJPHmYa3QSMSLxWyqGZVhp30wz5jZug565gDCDHaIZDzYJ/uD
	v5vlyYKQ=
X-Gm-Gg: ASbGncu/glfkXjt7POIxwRMt4+f0YxDhHP2QnImxcJctQnh9LEAZVDKuiJzocKPawlm
	NGkW9OWe/jc39Ebou4Ctc9pwiQwodywXFIqLyEldBrMVj2aaRiYd+tq9R5q5Un+QCeG4ykBR2CV
	PTDW8dfkJUVrX/WmS4U05dDSTjJTdagqV3oSDuae8ortZLUmQ2S0pJrtUcWBzw2CulFfE7VHgNt
	ILUln1KytEa++cUvQSL+Oq5mkRP+yC7Nd2qwDu6wpPtMBYBKAGjnw+xxqHjPw9BI5NyH8ypeQeP
	dSW9Fgv4zORlWIdxAYtySYD31usZ+VNKoO6wiUMqQG2RhtPcfC4ulE/39WegfcYhQzMhif9u4TJ
	Yck3kKhoQHiwDFnZd3rwaD29/T130ClYGLBLXEsCJ6NlEvERGueBQ6qw=
X-Google-Smtp-Source: AGHT+IFgURo8r1ge/HnYI3T0kx/VEtXSw1AoZBylv9ZwyhZqA6n1wDRJZ6lnLl7S0mPy4UCT+3KL/w==
X-Received: by 2002:a05:600c:198d:b0:459:e094:92cb with SMTP id 5b1f17b1804b1-45a218095eemr45110205e9.12.1755343476320;
        Sat, 16 Aug 2025 04:24:36 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: [PATCH v2 7/7] xen: New API to claim memory for a domain using XEN_DOMCTL_claim_memory
Date: Sat, 16 Aug 2025 13:19:33 +0200
Message-ID: <cc9119869fb87f02b287250d9bb33962a6d35961.1755341947.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755341947.git.bernhard.kaindl@cloud.com>
References: <cover.1755341947.git.bernhard.kaindl@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the new hypercall requested during the review of the v1 series
do not require changing the API for multi-node claims.

The hypercall receives a number of claims, intented to be one claim per
NUMA node, and limited to one claim for now. The changes to update the
NUMA claims management to handle updating the claims for multiple
NUMA nodes of a domain at once are deferred to the next series.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 tools/flask/policy/modules/dom0.te  |  1 +
 tools/flask/policy/modules/xen.if   |  1 +
 tools/include/xenctrl.h             |  4 +++
 tools/libs/ctrl/xc_domain.c         | 42 +++++++++++++++++++++++++++++
 tools/ocaml/libs/xc/xenctrl.ml      |  9 +++++++
 tools/ocaml/libs/xc/xenctrl.mli     |  9 +++++++
 tools/ocaml/libs/xc/xenctrl_stubs.c | 21 +++++++++++++++
 xen/common/domain.c                 | 30 +++++++++++++++++++++
 xen/common/domctl.c                 |  8 ++++++
 xen/include/public/domctl.h         | 17 ++++++++++++
 xen/include/xen/domain.h            |  2 ++
 xen/xsm/flask/hooks.c               |  3 +++
 xen/xsm/flask/policy/access_vectors |  2 ++
 13 files changed, 149 insertions(+)

diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te
index ad2b4f9ea7..8801cb24f2 100644
--- a/tools/flask/policy/modules/dom0.te
+++ b/tools/flask/policy/modules/dom0.te
@@ -105,6 +105,7 @@ allow dom0_t dom0_t:domain2 {
 	get_cpu_policy
 	dt_overlay
 	get_domain_state
+	claim_memory
 };
 allow dom0_t dom0_t:resource {
 	add
diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modules/xen.if
index ef7d8f438c..8e2dceb505 100644
--- a/tools/flask/policy/modules/xen.if
+++ b/tools/flask/policy/modules/xen.if
@@ -98,6 +98,7 @@ define(`create_domain_common', `
 		vuart_op
 		set_llc_colors
 		get_domain_state
+		claim_memory
 	};
 	allow $1 $2:security check_context;
 	allow $1 $2:shadow enable;
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 4955981231..1059629d94 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2660,6 +2660,10 @@ int xc_domain_set_llc_colors(xc_interface *xch, uint32_t domid,
                              const uint32_t *llc_colors,
                              uint32_t num_llc_colors);
 
+int xc_domain_claim_memory(xc_interface *xch, uint32_t domid,
+                           uint32_t nr_claims,
+                           const memory_claim_t *claims);
+
 #if defined(__arm__) || defined(__aarch64__)
 int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
                   uint32_t overlay_fdt_size, uint8_t overlay_op);
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 2ddc3f4f42..370917d877 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -2229,6 +2229,48 @@ out:
 
     return ret;
 }
+
+/*
+ * Claim memory for a domain. A Domain can only have one type of claim:
+ *
+ * If the number of claims is 0, existing claims are cancelled.
+ * Updating claims is not supported, cancel the existing claim first.
+ *
+ * Memory allocations consume the outstanding claim and if not enough memory is
+ * free, the allocation must be satisfied from the remaining outstanding claim.
+ */
+int xc_domain_claim_memory(xc_interface *xch, uint32_t domid,
+                           uint32_t nr_claims,
+                           const memory_claim_t *claims)
+{
+    struct xen_domctl domctl = {
+        .cmd = XEN_DOMCTL_claim_memory,
+        .domain = domid,
+        .u.claim_memory.nr_claims = nr_claims,
+    };
+    int ret;
+    DECLARE_HYPERCALL_BUFFER(struct xen_domctl_claim_memory, buffer);
+
+    /* Use an array to not need changes for multi-node claims in the future */
+    if ( nr_claims )
+    {
+        size_t bytes = sizeof(memory_claim_t) * nr_claims;
+
+        buffer = xc_hypercall_buffer_alloc(xch, buffer, bytes);
+        if ( buffer == NULL )
+        {
+            PERROR("Could not allocate memory for xc_domain_claim_memory");
+            return -1;
+        }
+        memcpy(buffer, claims, bytes);
+        set_xen_guest_handle(domctl.u.claim_memory.claims, buffer);
+    }
+
+    ret = do_domctl(xch, &domctl);
+    xc_hypercall_buffer_free(xch, buffer);
+    return ret;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 7e1aabad6c..cb1c18481b 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -369,6 +369,15 @@ external domain_deassign_device: handle -> domid -> (int * int * int * int) -> u
 external domain_test_assign_device: handle -> domid -> (int * int * int * int) -> bool
   = "stub_xc_domain_test_assign_device"
 
+type claim =
+  {
+    node: int;
+    nr_pages: int64;
+  }
+
+external domain_claim_memory: handle -> domid -> int -> claim array -> unit
+  = "stub_xc_domain_claim_memory"
+
 external version: handle -> version = "stub_xc_version_version"
 external version_compile_info: handle -> compile_info
   = "stub_xc_version_compile_info"
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index f44dba61ae..32786a5f7f 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -296,6 +296,15 @@ external domain_deassign_device: handle -> domid -> (int * int * int * int) -> u
 external domain_test_assign_device: handle -> domid -> (int * int * int * int) -> bool
   = "stub_xc_domain_test_assign_device"
 
+type claim =
+  {
+    node: int;
+    nr_pages: int64;
+  }
+
+external domain_claim_memory: handle -> domid -> int -> claim array -> unit
+  = "stub_xc_domain_claim_memory"
+
 external version : handle -> version = "stub_xc_version_version"
 external version_compile_info : handle -> compile_info
   = "stub_xc_version_compile_info"
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index b51fd66788..c27e6c4683 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -1424,6 +1424,27 @@ CAMLprim value stub_xc_watchdog(value xch_val, value domid, value timeout)
 	CAMLreturn(Val_int(ret));
 }
 
+/* Claim memory for a domain. See xc_domain_claim_memory() for details. */
+CAMLprim value stub_xc_domain_claim_memory(value xch_val, value domid,
+                                           value num_claims, value desc)
+{
+	CAMLparam4(xch_val, domid, num_claims, desc);
+	xc_interface *xch = xch_of_val(xch_val);
+	int i, retval, nr_claims = Int_val(num_claims);
+	memory_claim_t claim[nr_claims];
+
+	for (i = 0; i < nr_claims; i++) {
+		claim[i].node = Int_val(Field(desc, i*2));
+		claim[i].nr_pages = Int64_val(Field(desc, i*2 + 1));
+	}
+
+	retval = xc_domain_claim_memory(xch, Int_val(domid), nr_claims, claim);
+	if (retval < 0)
+		failwith_xc(xch);
+
+	CAMLreturn(Val_unit);
+}
+
 /*
  * Local variables:
  *  indent-tabs-mode: t
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 1beadb05e1..dcfad4ab15 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -267,6 +267,36 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
     return rc;
 }
 
+/* XEN_DOMCTL_claim_memory: Claim an amount of memory for a domain */
+int claim_memory(struct domain *d, const struct xen_domctl_claim_memory *uinfo)
+{
+    memory_claim_t claim;
+    int rc;
+
+    switch ( uinfo->nr_claims )
+    {
+        case 0:
+            /* Cancel existing claim. */
+            rc = domain_set_outstanding_pages(d, 0, 0);
+            break;
+
+        case 1:
+            /* Only single node claims supported at the moment. */
+            if ( copy_from_guest(&claim, uinfo->claims, 1) )
+                return -EFAULT;
+
+            rc = domain_set_outstanding_pages(d, claim.node,
+                                              claim.nr_pages);
+            break;
+
+        default:
+            rc = -EOPNOTSUPP;
+            break;
+    }
+
+    return rc;
+}
+
 static void __domain_finalise_shutdown(struct domain *d)
 {
     struct vcpu *v;
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index f2a7caaf85..e7576ae00b 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -894,6 +894,14 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         ret = get_domain_state(&op->u.get_domain_state, d, &op->domain);
         break;
 
+    case XEN_DOMCTL_claim_memory:
+        ret = xsm_claim_pages(XSM_PRIV, d);
+        if ( ret )
+            break;
+
+        ret = claim_memory(d, &op->u.claim_memory);
+        break;
+
     default:
         ret = arch_do_domctl(op, d, u_domctl);
         break;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 0c75d9d27f..5e924abd85 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1273,6 +1273,21 @@ struct xen_domctl_get_domain_state {
     uint64_t unique_id;      /* Unique domain identifier. */
 };
 
+struct xen_memory_claim {
+    unsigned int node;      /* NUMA node, XC_NUMA_NO_NODE for a host claim */
+    unsigned long nr_pages; /* Number of pages to claim */
+};
+typedef struct xen_memory_claim memory_claim_t;
+DEFINE_XEN_GUEST_HANDLE(memory_claim_t);
+
+/* XEN_DOMCTL_claim_memory: Claim an amount of memory for a domain */
+struct xen_domctl_claim_memory {
+    /* IN: array of memory claims */
+    XEN_GUEST_HANDLE_64(memory_claim_t) claims;
+    /* IN: number of claims */
+    unsigned int nr_claims;
+};
+
 struct xen_domctl {
 /* Stable domctl ops: interface_version is required to be 0.  */
     uint32_t cmd;
@@ -1365,6 +1380,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_gsi_permission                88
 #define XEN_DOMCTL_set_llc_colors                89
 #define XEN_DOMCTL_get_domain_state              90 /* stable interface */
+#define XEN_DOMCTL_claim_memory                  91
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1433,6 +1449,7 @@ struct xen_domctl {
 #endif
         struct xen_domctl_set_llc_colors    set_llc_colors;
         struct xen_domctl_get_domain_state  get_domain_state;
+        struct xen_domctl_claim_memory      claim_memory;
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index e10baf2615..bd5f37bd64 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -192,4 +192,6 @@ extern bool vmtrace_available;
 
 extern bool vpmu_is_available;
 
+int claim_memory(struct domain *d, const struct xen_domctl_claim_memory *uinfo);
+
 #endif /* __XEN_DOMAIN_H__ */
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index b0308e1b26..6b2535b666 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -853,6 +853,9 @@ static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
     case XEN_DOMCTL_set_llc_colors:
         return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__SET_LLC_COLORS);
 
+    case XEN_DOMCTL_claim_memory:
+        return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__CLAIM_MEMORY);
+
     default:
         return avc_unknown_permission("domctl", cmd);
     }
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
index 51a1577a66..87338b5c2a 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -259,6 +259,8 @@ class domain2
     set_llc_colors
 # XEN_DOMCTL_get_domain_state
     get_domain_state
+# XEN_DOMCTL_claim_memory
+    claim_memory
 }
 
 # Similar to class domain, but primarily contains domctls related to HVM domains
-- 
2.43.0


