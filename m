Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B21CC9CDDFD
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 13:02:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837305.1253305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBv1q-00026L-OK; Fri, 15 Nov 2024 12:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837305.1253305; Fri, 15 Nov 2024 12:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBv1q-00024p-Kv; Fri, 15 Nov 2024 12:02:22 +0000
Received: by outflank-mailman (input) for mailman id 837305;
 Fri, 15 Nov 2024 12:02:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBut5-0005U9-H2
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:19 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32c5a80e-a348-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 12:53:15 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso313774066b.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:53:15 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:53:14 -0800 (PST)
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
X-Inumbo-ID: 32c5a80e-a348-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MjkiLCJoZWxvIjoibWFpbC1lajEteDYyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMyYzVhODBlLWEzNDgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjcxNTk1Ljg2MjQ0Mywic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671595; x=1732276395; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+N/BoPDPF+FDyxeB8VC1PzNpWxozefZT+Maz4yXPWA=;
        b=eogdI5RyCeSJRRo3o/h6GKQaGMQgJN0kx6vEXPZ/S4j4954W5g2WxHjnIH+bllQitP
         jp38C7CLoKP2qGphLBmkkfBPVUdxSoiXPflmnANKuXGaT56cbVTlTNTDb8NiNtGi6gvU
         H+qs8RmSCfhsQJO46xM5rsi3RUW1wHuJOBSTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671595; x=1732276395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+N/BoPDPF+FDyxeB8VC1PzNpWxozefZT+Maz4yXPWA=;
        b=O/xG2wznR4JphlJpL4IQuCefGbQfCmUeNWWZMWsz1/j0SU6iCQzbj3xbswH5+hqQib
         KnYd500Hi3PDyXtLHfKFrxJ6KwyP/o3055F0H9gaaqYJH65qQoXQXbs62wk5XMrKykaR
         GV9AU1wIZDdLnwB3wXwJb+3sF/j/L2hlmsFJduSlTXQR/+M8r0MRdrrIq/Bxi8IYs6CD
         xTZhoCMLvkqGgZDLq0TZjH25c/AZsjMW9xrlRAjd1bh3OuhNTWPPoqB8QmR1hol0FMBo
         Mh0xl1blZztGAwHBEu4WmNqkPdYK3ZO9Qey3Ke0A0v0qyhPv9SKZvItYAwUrsxDnJUfn
         UxXA==
X-Gm-Message-State: AOJu0YwzvBvK+Sc9t/eTHuARhuUtcG4r63jLTJd/r0Fj8JxNX/ntHviB
	YwrcqheM2zzkR+blykLlfdgvCyWlQIRK6zTZqG92KMjTe4oSnvdkQ7W4D7ikS8NfnRa7aARRZzW
	I
X-Google-Smtp-Source: AGHT+IGKtdNpRNDLBKXGKwssmmliwCnjWY1IyAWAm+Wgg9U0l7uFgihat0PlR051i92rPrUjj6XKvA==
X-Received: by 2002:a17:907:6e94:b0:a9a:c57f:9634 with SMTP id a640c23a62f3a-aa483525e7dmr215523866b.42.1731671594834;
        Fri, 15 Nov 2024 03:53:14 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [RFC PATCH 19/25] xen: Replace hand-crafted domctl/createdomain with autogenerated version
Date: Fri, 15 Nov 2024 11:51:48 +0000
Message-ID: <20241115115200.2824-20-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With xen_arch_domainconfig and every bitmap/enum already autogenerated,
add the final piece to enable autogeneration of the createdomain
hypercall.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 .../xenbindgen/extra/domctl/createdomain.toml | 96 +++++++++++++++++++
 xen/include/public/autogen/domctl.h           | 54 +++++++++++
 xen/include/public/domctl.h                   | 56 +----------
 xen/include/public/sysctl.h                   |  1 +
 4 files changed, 152 insertions(+), 55 deletions(-)

diff --git a/tools/rust/xenbindgen/extra/domctl/createdomain.toml b/tools/rust/xenbindgen/extra/domctl/createdomain.toml
index 3a6872aa325f..f20cb8790039 100644
--- a/tools/rust/xenbindgen/extra/domctl/createdomain.toml
+++ b/tools/rust/xenbindgen/extra/domctl/createdomain.toml
@@ -87,3 +87,99 @@ typ = { tag = "u32" }
 name = "no_sharept"
 description = "Set to _NOT_ share page tables between the CPU and the IOMMU when it would be possible to do so."
 shift = 0
+
+################################################################################
+
+[[structs]]
+name = "xen_domctl_createdomain"
+description = """
+Create a new domain with the passed parameters.
+
+IMPORTANT: The domid part of the domctl is IN/OUT. When the passed
+domid is 0 or over `DOMID_FIRST_RESERVED` a new domid is auto-allocated
+and returned."""
+
+[[structs.fields]]
+name = "ssidref"
+description = "IN: `Source Security IDentifier` (See XSM)."
+typ = { tag = "u32" }
+
+[[structs.fields]]
+name = "handle"
+description = "IN: Unique identifier for this guest given by the toolstack."
+typ = { tag = "array", args = [{ tag = "u8" }, 16]  }
+
+[[structs.fields]]
+name = "flags"
+description = "IN: Bitmap of domain features to enable/disable."
+typ = { tag = "bitmap", args = "xen_domctl_cdf" }
+
+[[structs.fields]]
+name = "iommu_opts"
+description = "IN: Bitmap of configuration settings for the IOMMU."
+typ = { tag = "bitmap", args = "xen_domctl_iommu_opts" }
+
+[[structs.fields]]
+name = "max_vcpus"
+description = "IN: Maximum number of CPUs this domain can hold, including hotplug."
+typ = { tag = "u32" }
+
+[[structs.fields]]
+name = "max_evtchn_port"
+description = "IN: Maximum number of usable event channels"
+typ = { tag = "u32" }
+
+[[structs.fields]]
+name = "max_grant_frames"
+description = '''
+IN: Maximum number of pages this domain is able
+    to grant access to for other domains.
+
+`< 0` means "use default value in the hypervisor."'''
+typ = { tag = "i32" }
+
+[[structs.fields]]
+name = "max_maptrack_frames"
+description = '''
+IN: Maximum number of pages of foreign domains
+    can be accessed via the grant mechanism.
+
+`< 0` means "use default value in the hypervisor."'''
+typ = { tag = "i32" }
+
+[[structs.fields]]
+name = "max_grant_version"
+description = "Maximum grant table version allowed for this domain"
+typ = { tag = "u8" }
+
+[[structs.fields]]
+name = "rsvd0_a"
+description = "Unused padding. Reserved to zero."
+typ = { tag = "array", args = [{ tag = "u8" }, 3]  }
+
+[[structs.fields]]
+name = "altp2m_mode"
+description = "Which mode to configure altp2m with"
+typ = { tag = "u8" }
+
+[[structs.fields]]
+name = "rsvd0_b"
+description = "Unused padding. Reserved to zero."
+typ = { tag = "array", args = [{ tag = "u8" }, 3]  }
+
+[[structs.fields]]
+name = "vmtrace_size"
+description = "IN: Per-vCPU buffer size in octets. 0 to disable."
+typ = { tag = "u32" }
+
+[[structs.fields]]
+name = "cpupool_id"
+description = "IN: CPU pool to use; 0 or an existing CPU pool."
+typ = { tag = "u32" }
+
+[[structs.fields]]
+name = "arch"
+description = """Arch-specific settings.
+
+Each architecture is free to make its fields IN/OUT/INOUT"""
+typ = { tag = "struct", args = "xen_arch_domainconfig" }
diff --git a/xen/include/public/autogen/domctl.h b/xen/include/public/autogen/domctl.h
index 276e05168688..8a0934039169 100644
--- a/xen/include/public/autogen/domctl.h
+++ b/xen/include/public/autogen/domctl.h
@@ -59,5 +59,59 @@ struct xen_domctl_iommu_opts {}; /* GREP FODDER */
 /* Mask covering all defined bits */
 #define XEN_DOMCTL_IOMMU_OPTS__ALL (0x1U)
 
+/*
+ * Create a new domain with the passed parameters.
+ *
+ * IMPORTANT: The domid part of the domctl is IN/OUT. When the passed
+ * domid is 0 or over `DOMID_FIRST_RESERVED` a new domid is auto-allocated
+ * and returned.
+ */
+struct xen_domctl_createdomain {
+    /* IN: `Source Security IDentifier` (See XSM). */
+    uint32_t ssidref;
+    /* IN: Unique identifier for this guest given by the toolstack. */
+    uint8_t handle[16];
+    /* IN: Bitmap of domain features to enable/disable. */
+    uint32_t flags /* See xen_domctl_cdf */;
+    /* IN: Bitmap of configuration settings for the IOMMU. */
+    uint32_t iommu_opts /* See xen_domctl_iommu_opts */;
+    /* IN: Maximum number of CPUs this domain can hold, including hotplug. */
+    uint32_t max_vcpus;
+    /* IN: Maximum number of usable event channels */
+    uint32_t max_evtchn_port;
+    /*
+     * IN: Maximum number of pages this domain is able
+     *     to grant access to for other domains.
+     *
+     * `< 0` means "use default value in the hypervisor."
+     */
+    int32_t max_grant_frames;
+    /*
+     * IN: Maximum number of pages of foreign domains
+     *     can be accessed via the grant mechanism.
+     *
+     * `< 0` means "use default value in the hypervisor."
+     */
+    int32_t max_maptrack_frames;
+    /* Maximum grant table version allowed for this domain */
+    uint8_t max_grant_version;
+    /* Unused padding. Reserved to zero. */
+    uint8_t rsvd0_a[3];
+    /* Which mode to configure altp2m with */
+    uint8_t altp2m_mode;
+    /* Unused padding. Reserved to zero. */
+    uint8_t rsvd0_b[3];
+    /* IN: Per-vCPU buffer size in octets. 0 to disable. */
+    uint32_t vmtrace_size;
+    /* IN: CPU pool to use; 0 or an existing CPU pool. */
+    uint32_t cpupool_id;
+    /*
+     * Arch-specific settings.
+     *
+     * Each architecture is free to make its fields IN/OUT/INOUT
+     */
+    struct xen_arch_domainconfig arch;
+};
+
 #endif /* __XEN_AUTOGEN_DOMCTL_H */
 
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 2d1423f6fd91..01404cf301fa 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -33,62 +33,8 @@
  *
  * Last version bump: Xen 4.19
  */
-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
-
-/*
- * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
- * If it is specified as an invalid value (0 or >= DOMID_FIRST_RESERVED),
- * an id is auto-allocated and returned.
- */
-/* XEN_DOMCTL_createdomain */
-struct xen_domctl_createdomain {
-    /* IN parameters */
-    uint32_t ssidref;
-    xen_domain_handle_t handle;
 
-    /* See xen_domctl_cdf */
-    uint32_t flags;
-    /* See xen_domctl_iommu_opts */
-    uint32_t iommu_opts;
-
-    /*
-     * Various domain limits, which impact the quantity of resources
-     * (global mapping space, xenheap, etc) a guest may consume.  For
-     * max_grant_frames and max_maptrack_frames, < 0 means "use the
-     * default maximum value in the hypervisor".
-     */
-    uint32_t max_vcpus;
-    uint32_t max_evtchn_port;
-    int32_t max_grant_frames;
-    int32_t max_maptrack_frames;
-
-    /*
-     * Maximum grant table version the domain can be configured with.
-     *
-     * Domains always start with v1 (if CONFIG_GRANT_TABLE) and can be bumped
-     * to use up to `max_grant_version` via GNTTABOP_set_version.
-     *
-     * Must be zero iff !CONFIG_GRANT_TABLE.
-     */
-    uint8_t max_grant_version;
-
-    /* Unused. Reserved to zero. */
-    uint8_t rsvd0_a[3];
-
-    /* See xen_domctl_altp2m_mode */
-    uint8_t altp2m_mode;
-
-    /* Unused. Reserved to zero. */
-    uint8_t rsvd0_b[3];
-
-    /* Per-vCPU buffer size in bytes.  0 to disable. */
-    uint32_t vmtrace_size;
-
-    /* CPU pool to use; specify 0 or a specific existing pool */
-    uint32_t cpupool_id;
-
-    struct xen_arch_domainconfig arch;
-};
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
 
 /* XEN_DOMCTL_getdomaininfo */
 struct xen_domctl_getdomaininfo {
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 9e773490a5ac..e882c1e31059 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -17,6 +17,7 @@
 #include "xen.h"
 #include "domctl.h"
 #include "physdev.h"
+#include "autogen/sysctl.h"
 
 #include "autogen/sysctl.h"
 
-- 
2.47.0


