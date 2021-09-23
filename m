Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5787041682F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 00:50:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194611.346712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTXWp-00045w-FF; Thu, 23 Sep 2021 22:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194611.346712; Thu, 23 Sep 2021 22:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTXWp-00042w-Bd; Thu, 23 Sep 2021 22:49:19 +0000
Received: by outflank-mailman (input) for mailman id 194611;
 Thu, 23 Sep 2021 22:49:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ES3T=ON=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mTXWn-0003lw-9w
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 22:49:17 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb12a67f-e05c-43f5-a993-c375bc7a66ed;
 Thu, 23 Sep 2021 22:49:11 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id e15so32412173lfr.10
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 15:49:11 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id q5sm230091lfd.17.2021.09.23.15.49.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Sep 2021 15:49:10 -0700 (PDT)
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
X-Inumbo-ID: eb12a67f-e05c-43f5-a993-c375bc7a66ed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gE4WiiHg7wgQhJBYuF1By1N/OYigu0Zgyl1iqewwPA4=;
        b=CGTqXrpguxWBi8yf5FdCxBlzplGYJCWq+3fMmJjG4jX+Cu9rc4FsBC1ODT84K9B108
         aiON/rWGiimiCVqtZI4SbZO9CIuVlZvsjgpeSutGUWam4Es8ISC3a/D+v55zc5kamS2f
         CLbhqYk/5hiQGPmrjZw5jhv26yTavAHqg1kub0fK/vLD0cFhk+5PBArCdT9aSahQAz0e
         s0hEY+KlNs7eN8Q19u+geu7uJcmhWG4GywHir8eRlsik6Adh0loF+ffgpcUo8kxSIcKW
         UcPPGPctqrMDSdPS+49Rd0HklgcmErMqvLHlqknZZw4SiJUxI+SugxOILfdCQXfLkgtD
         8P4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gE4WiiHg7wgQhJBYuF1By1N/OYigu0Zgyl1iqewwPA4=;
        b=vTaqxJRLQ91H0A5NSuWpQFfex6OSw+g/G9iSx7JCuyOKtr6vfZ/2YdIuHvQcXh/Skb
         JN4Zex+vyoN4ZTtc9IuZuJHi0YE8XAG/SsbplwP/xTEfFO7/mJg0pw3A3MlHAjRWLd58
         flGjZ40PUO+LlooNV0USSjZjKO2yV6oTwLe7wQk1Ri9rcW1KAX3L4kRWJIb2qtKiVFDT
         Uq89LcFdLqgN2BPhMzNylsMBgBqdl49NazYJ1fokIphX+ohVIu5hKvqIxWW0Ao6GzG0L
         H/P9SrI3x4iMiJHLlYL3hwKVgov1CK66PgSeZeZAok1lxMcIKZtb2HTP4vYqJTiCGxqL
         0m9g==
X-Gm-Message-State: AOAM533tcbo7vDtuYJQ+2aXxnCiIiuDH1qdQgtgdhJyPkpeOJl3A3ACa
	Kww23grhkukvgrFLJ1TUOaPJ8mIjDBQ=
X-Google-Smtp-Source: ABdhPJytMCsSFFy2ebsKDlLcbHLToD8FlJYQ9mPGIj7ZUU+MPnj+f/ofxOewNKiryd4fC4+mbn6+KQ==
X-Received: by 2002:a05:6512:2210:: with SMTP id h16mr6675559lfu.598.1632437350734;
        Thu, 23 Sep 2021 15:49:10 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH V3 1/3] xen: Introduce "gpaddr_bits" field to XEN_SYSCTL_physinfo
Date: Fri, 24 Sep 2021 01:48:52 +0300
Message-Id: <1632437334-12015-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632437334-12015-1-git-send-email-olekstysh@gmail.com>
References: <1632437334-12015-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

We need to pass info about maximum supported guest address
space size to the toolstack on Arm in order to properly
calculate the base and size of the extended region (safe range)
for the guest. The extended region is unused address space which
could be safely used by domain for foreign/grant mappings on Arm.
The extended region itself will be handled by the subsequents
patch.

Use p2m_ipa_bits variable on Arm, the x86 equivalent is
hap_paddr_bits.

As we change the size of structure bump the interface version.

Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Please note, that review comments for the RFC version [1] haven't been addressed yet.
It is not forgotten, some clarification is needed. It will be addressed for the next version.

[1] https://lore.kernel.org/xen-devel/973f5344-aa10-3ad6-ff02-ad5f358ad279@citrix.com/

Changes RFC -> V2:
   - update patch subject/description
   - replace arch-specific sub-struct with common gpaddr_bits
     field and update code to reflect that

Changes V2 -> V3:
   - make the field uint8_t and add uint8_t pad[7] after
   - remove leading blanks in libxl.h
---
 tools/include/libxl.h            | 7 +++++++
 tools/libs/light/libxl.c         | 2 ++
 tools/libs/light/libxl_types.idl | 2 ++
 xen/arch/arm/sysctl.c            | 2 ++
 xen/arch/x86/sysctl.c            | 2 ++
 xen/include/public/sysctl.h      | 4 +++-
 6 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index b9ba16d..63f9550 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -856,6 +856,13 @@ typedef struct libxl__ctx libxl_ctx;
 #define LIBXL_HAVE_PHYSINFO_MAX_POSSIBLE_MFN 1
 
 /*
+ * LIBXL_HAVE_PHYSINFO_GPADDR_BITS
+ *
+ * If this is defined, libxl_physinfo has a "gpaddr_bits" field.
+ */
+#define LIBXL_HAVE_PHYSINFO_GPADDR_BITS 1
+
+/*
  * LIBXL_HAVE_DOMINFO_OUTSTANDING_MEMKB 1
  *
  * If this is defined, libxl_dominfo will contain a MemKB type field called
diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
index 204eb0b..c86624f 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -405,6 +405,8 @@ int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
     physinfo->cap_vmtrace =
         !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_vmtrace);
 
+    physinfo->gpaddr_bits = xcphysinfo.gpaddr_bits;
+
     GC_FREE;
     return 0;
 }
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 3f9fff6..bf27fe6 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -1061,6 +1061,8 @@ libxl_physinfo = Struct("physinfo", [
     ("cap_shadow", bool),
     ("cap_iommu_hap_pt_share", bool),
     ("cap_vmtrace", bool),
+
+    ("gpaddr_bits", uint8),
     ], dir=DIR_OUT)
 
 libxl_connectorinfo = Struct("connectorinfo", [
diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index f87944e..91dca4f 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -15,6 +15,8 @@
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
+
+    pi->gpaddr_bits = p2m_ipa_bits;
 }
 
 long arch_do_sysctl(struct xen_sysctl *sysctl,
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index aff52a1..7b14865 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -135,6 +135,8 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_hap;
     if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
+
+    pi->gpaddr_bits = hap_paddr_bits;
 }
 
 long arch_do_sysctl(
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 039ccf8..0450a78 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -35,7 +35,7 @@
 #include "domctl.h"
 #include "physdev.h"
 
-#define XEN_SYSCTL_INTERFACE_VERSION 0x00000013
+#define XEN_SYSCTL_INTERFACE_VERSION 0x00000014
 
 /*
  * Read console content from Xen buffer ring.
@@ -120,6 +120,8 @@ struct xen_sysctl_physinfo {
     uint64_aligned_t outstanding_pages;
     uint64_aligned_t max_mfn; /* Largest possible MFN on this host */
     uint32_t hw_cap[8];
+    uint8_t gpaddr_bits;
+    uint8_t pad[7];
 };
 
 /*
-- 
2.7.4


