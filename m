Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 179006BD0AF
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 14:22:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510593.788536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcnYy-0004qh-I3; Thu, 16 Mar 2023 13:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510593.788536; Thu, 16 Mar 2023 13:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcnYy-0004nP-Ew; Thu, 16 Mar 2023 13:22:36 +0000
Received: by outflank-mailman (input) for mailman id 510593;
 Thu, 16 Mar 2023 13:22:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NB6E=7I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcnYx-0004ls-EO
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 13:22:35 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c4a11b7-c3fd-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 14:22:33 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id ek18so7581830edb.6
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 06:22:33 -0700 (PDT)
Received: from fedora.. (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 u20-20020a50d514000000b004bd1fe2cc02sm3861728edi.16.2023.03.16.06.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 06:22:32 -0700 (PDT)
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
X-Inumbo-ID: 9c4a11b7-c3fd-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678972953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6IyJ7MXAQ+HTPg+dViNbR1hcc1rH6+rGQc4QTHNc1DY=;
        b=URkM0Vw7perMI/rpEQvsXvlwczqH+nO98aaalGr1PXPMqhJPAs3Pil44+hYR7QVFrq
         fGMMw6k3KmfeDx4L+qjF6HHU41jFUIx4f4pZVpjHJHWNbYWLXjSe2cwx3+RwMR9dalpG
         Y2JYYdfNhNNat0pB2fygUF/wWPdgeFDg6KLZ8Q6MEiK02twuzquPNCdV1MN8vScs++iD
         V/Ixs3e6efcAM+PxA05D8SkqWycVU6yI1gAFefta1D6B5q6xlw2aNYxhhSPf9ANvFI0n
         ivr12zEWvsXI1TVTikp27byuuSVv5r2I+rCJ39VtcxezfX23lAdH6YLV0xFGMA4n5kUs
         SAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678972953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6IyJ7MXAQ+HTPg+dViNbR1hcc1rH6+rGQc4QTHNc1DY=;
        b=yTtJ7Zd26+zU2NWeVVVPO0sMKfJyKYiuugWZ8VglcLFcIecWe92tAAWVZGv/9h7rA1
         Mf76Vu9YYWYA9QRItwGzTwFBAQ3eN6I+TFAVeiemaZ0GiSeH9cX7FqPHg+THhzFX5G1z
         U1G4slkljdwxDz4HSxxhGgsl1RT2EJvDlnvOHYxlk7lDIkWOQ+VaySIIGY3x4r/4XIwL
         0Fe0rb4IeSpVX9QUl5ZSI9L7sl1K0CFuQL4k3kNYJxlq3JtxhGz+E9Uc8BUuNLmpqxG8
         pklASpuzWapkbhppMUushh9H53i+0G8Qf4v85+JJStJEpe3GyN/3aRd78k6XY399DFxi
         uvfQ==
X-Gm-Message-State: AO0yUKVI5deaaXK0SWXLeNFKZGwHF4yYznTD2zC+x95d7Bvj7K/wJTmU
	NTX6db8faTYBmRnGP1IVFIAF0eRdQdN7lg==
X-Google-Smtp-Source: AK7set9Llyn42OM3Ke9cC7KLN3s7QhJh5DZcryfjWp/tpI+E9/00mSNdDE0K7uNr08GDuhw0sxAl9A==
X-Received: by 2002:aa7:c04f:0:b0:4fa:b302:84d0 with SMTP id k15-20020aa7c04f000000b004fab30284d0mr6618089edo.15.1678972952694;
        Thu, 16 Mar 2023 06:22:32 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 2/2] xen/riscv: add explicit check that .got{.plt} is empty
Date: Thu, 16 Mar 2023 15:22:25 +0200
Message-Id: <7c066d6dcc0618749df04785b34b93819148087d.1678970065.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678970065.git.oleksii.kurochko@gmail.com>
References: <cover.1678970065.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GOT sections usage should be avoided in the hypervisor
so to catch such use cases earlier when GOT things are
produced the patch introduces .got and .got.plt sections
and adds asserts that they're empty.

The sections won't be created until they remain
empty otherwise the asserts would cause early failure.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 * the patch was introduced in patch series v2.
---
 xen/arch/riscv/xen.lds.S | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index ca57cce75c..f299ea8422 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -1,3 +1,4 @@
+#include <xen/lib.h>
 #include <xen/xen.lds.h>
 
 #undef ENTRY
@@ -123,6 +124,15 @@ SECTIONS
         *(SORT(.init_array.*))
         __ctors_end = .;
     } :text
+
+    .got : {
+        *(.got)
+    } : text
+
+    .got.plt : {
+        *(.got.plt)
+    } : text
+
     . = ALIGN(POINTER_ALIGN);
     __init_end = .;
 
@@ -156,3 +166,6 @@ SECTIONS
 
     ELF_DETAILS_SECTIONS
 }
+
+ASSERT(!SIZEOF(.got),      ".got non-empty")
+ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
-- 
2.39.2


