Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DDE9ED36D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 18:28:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855080.1268151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQVJ-0008Iz-1O; Wed, 11 Dec 2024 17:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855080.1268151; Wed, 11 Dec 2024 17:28:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQVI-0008Gn-Ph; Wed, 11 Dec 2024 17:28:04 +0000
Received: by outflank-mailman (input) for mailman id 855080;
 Wed, 11 Dec 2024 17:28:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntru=TE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tLQVG-0007J6-TG
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 17:28:02 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4589c99e-b7e5-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 18:28:01 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9f1d76dab1so1011026766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 09:28:01 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6656f306csm687297466b.61.2024.12.11.09.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 09:27:59 -0800 (PST)
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
X-Inumbo-ID: 4589c99e-b7e5-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733938080; x=1734542880; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kV5fnGT+IURuJB8/ySzjdk0FAfLfvbDV4kQWrHvyXVA=;
        b=dqXcSD42gGbIpSEY8fo7L/WBDY0yi3/qqbp0eAH7QW4fLn4TDCb0zxH/NQ51/aOPkY
         lYkBVAT1cHIz5z6beiFQyOqAujQb6lqb7aizduXHtmT6WaQ240U65gnNBjCl/S8rbaeN
         4G0k+NB2WNLqIP5MJ7/pWkeWDQ/NU7+mnhWxqbSEVH60guKjezPzgW0nG5gK2JRFcpxS
         N92kbD5UaTC6FCHACAIaYH0kxJ4oAcCylS2EydAm3zma19m1KV7PbG8JQ1HaKFc1975+
         qv9sULAUkty44r2mkNuu4UL0Wf1OG3KNmUEE2LB3Ajc21i+vgyTDBnewzK5GE0Y0NMmY
         yQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733938080; x=1734542880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kV5fnGT+IURuJB8/ySzjdk0FAfLfvbDV4kQWrHvyXVA=;
        b=FDICHEwAsUK2bsbqCQc7VeZozNV8auFqA2Iy2XyRDEda0Hg8tkjLMYFyX0jwYnwDmZ
         XKNBXd2XSEI3JwmEkDPQpYpXBwFS3WooIWHbAKHkPLXC6Lo5ROM/7XnPfsqGB1B4OECr
         JBPR4s0W+nP+Rff9ubMLJumVjHpM2NjtF9bQvmrIM2FRTX4nakr+IAvWxSDkCUEqqq0o
         yrJsPJ4yKndZVYExzDoRwx7jhkuXUa+CTfDTUnHRWZFlPmJcvazMe68bJr6MoLnzx7cl
         JnDPDflm5hCXeKKkmDEkv38e8b90GFL1KK/atbjw2Ep440xs2pldaqCDUbJQcuYaEZ8V
         /drQ==
X-Gm-Message-State: AOJu0YwtJ95DRMKK6MgeK3s1jkbocK4cmFuUwlfdPCdXMXt8CtmVhFpO
	6ovkQXvb4JbiITQiJiFSKxz8mHQXlDjXiwS6kPgw/nf2ByeNdp3qAG0W7cbl
X-Gm-Gg: ASbGncuiHaQVzSe1DquEdfuUPw0vAn2Ryn4avEvKSN2XmS+TFIdgb21CoWeZy4pXrtJ
	4m2mFUENWSBzTRor4Up9k8zP/v5f1YQ8/45pO50wDWZN7IFGHGn+xlmFyYcqeqsGej12g7eqY7o
	JgrESNf5UOeyb/Z93nh7T7uX5ugQVQQLvI/X5NzsVae/aqeOE4BflEFWTRYw4prbL79yp+XufKz
	biVpvhmK5cz6bLzq+jRTjRaswegRfNoZSOAfjVyYgYxBXg2kUeMJqA=
X-Google-Smtp-Source: AGHT+IEPTLL+WUKby+ninBNWHjY1Dl2NtcLd1rZlicn1EDp6HPCuCO5wX72e+3d1olMJCiXIrwYWnA==
X-Received: by 2002:a17:907:61a7:b0:aa6:715a:75b5 with SMTP id a640c23a62f3a-aa6b139781emr309980866b.46.1733938079661;
        Wed, 11 Dec 2024 09:27:59 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 4/7] xen/riscv: add {set,clear}_fixmap() functions for managing fixmap entries
Date: Wed, 11 Dec 2024 18:27:48 +0100
Message-ID: <3d34dbc7a8af373b799d1e0c1c99acfa3798f37d.1733937787.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733937787.git.oleksii.kurochko@gmail.com>
References: <cover.1733937787.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce set_fixmap() and clear_fixmap() functions to manage mappings
in the fixmap region. The set_fixmap() function maps a 4k page ( as only L0
is expected to be updated; look at setup_fixmap_mappings() ) at a specified
fixmap entry using map_pages_to_xen(), while clear_fixmap() removes the
mapping from a fixmap entry by calling destroy_xen_mappings().

Both functions ensure that the operations succeed by asserting that their
respective calls (map_pages_to_xen() and destroy_xen_mappings()) return 0.
`BUG()` is added to trigger a failure if any issues occur during
the mapping or unmapping process.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V2:
 - Update the commit message.
 - drop local variables from {set, clear}_fixmap(); use if (... != 0) + BUG().
---
 xen/arch/riscv/include/asm/fixmap.h |  5 +++++
 xen/arch/riscv/pt.c                 | 17 +++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/xen/arch/riscv/include/asm/fixmap.h b/xen/arch/riscv/include/asm/fixmap.h
index 818c8ce07b..e399a15f53 100644
--- a/xen/arch/riscv/include/asm/fixmap.h
+++ b/xen/arch/riscv/include/asm/fixmap.h
@@ -32,6 +32,11 @@
  */
 extern pte_t xen_fixmap[];
 
+/* Map a page in a fixmap entry */
+void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags);
+/* Remove a mapping from a fixmap entry */
+void clear_fixmap(unsigned int map);
+
 #define fix_to_virt(slot) ((void *)FIXMAP_ADDR(slot))
 
 static inline unsigned int virt_to_fix(vaddr_t vaddr)
diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
index 86bd9ea613..3407fda937 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -8,6 +8,7 @@
 #include <xen/pmap.h>
 #include <xen/spinlock.h>
 
+#include <asm/fixmap.h>
 #include <asm/flushtlb.h>
 #include <asm/page.h>
 
@@ -433,3 +434,19 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
 {
     return pt_update(virt, INVALID_MFN, nr_mfns, PTE_POPULATE);
 }
+
+/* Map a 4k page in a fixmap entry */
+void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags)
+{
+    if ( map_pages_to_xen(FIXMAP_ADDR(map), mfn, 1, flags | PTE_SMALL) != 0 )
+        BUG();
+}
+
+/* Remove a mapping from a fixmap entry */
+void clear_fixmap(unsigned int map)
+{
+    if ( destroy_xen_mappings(
+            FIXMAP_ADDR(map),
+            FIXMAP_ADDR(map) + PAGE_SIZE) != 0 )
+        BUG();
+}
-- 
2.47.1


