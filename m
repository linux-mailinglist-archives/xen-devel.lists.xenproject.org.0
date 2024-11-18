Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FCD9D0EF3
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 11:52:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839247.1255068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCzML-0004lo-8H; Mon, 18 Nov 2024 10:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839247.1255068; Mon, 18 Nov 2024 10:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCzML-0004k8-59; Mon, 18 Nov 2024 10:51:57 +0000
Received: by outflank-mailman (input) for mailman id 839247;
 Mon, 18 Nov 2024 10:51:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JUlN=SN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tCzMJ-0004g8-MA
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 10:51:55 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d66aff0-a59b-11ef-99a3-01e77a169b0f;
 Mon, 18 Nov 2024 11:51:50 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a9ec86a67feso788154066b.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2024 02:51:50 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df5696fsm522287766b.77.2024.11.18.02.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2024 02:51:48 -0800 (PST)
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
X-Inumbo-ID: 1d66aff0-a59b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzMiLCJoZWxvIjoibWFpbC1lajEteDYzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFkNjZhZmYwLWE1OWItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTI3MTEwLjUxODkwMiwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731927109; x=1732531909; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6E0Kaaftq1RqJE09RLDSsbeIV+RREbhQ6Fd9/Y2QUKQ=;
        b=eiE9T51wfdMn+1oFK95Wv8IjZv6V0l/khIGY15kwkq2MaAUql53TPrMB0I144e23em
         j3B3cz7RPsGW9ecPT3KtTBfKgTsbW58EVxaP09LWhXu7fNAtqmUN+8YEJdmUdAAu91yQ
         rV9qCU3Imm9vQfV4pCnPAo/jil4bQqHJyn9Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731927109; x=1732531909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6E0Kaaftq1RqJE09RLDSsbeIV+RREbhQ6Fd9/Y2QUKQ=;
        b=N1FrL6ysyFoMtSgRk7r//MLYJM6OEK1D8e46jd4oLxpstyu9VmtIb2KTCrT+yxxzEG
         PO33gwTtQ1crSu+RMHXeK3Loc+6TH5J2e7loduHAnLMHWODpHgYa1eLEEKpaDSVtCyME
         fC7rczxaleo44EhaOckxqTFsR/v2Wjpu+iIAxl3g3HhhmFDHQXKQZjQzGbJh2/izPy/6
         LbExoKxaAKXwtF7nNLbH8MXbpnMHoEAlSaZzXUw4htOdGhGHfcci8iGaN+qoDTgA79Qz
         OeVkQW4HQxnCBoPK4yczxlCq+Eb6VmLB5upE4IIdPUTxUWaZwIkCpXgFEe0zas/e0aBW
         3NdA==
X-Gm-Message-State: AOJu0YwuRC/szAlqtiXdo8JGNY3eUy5TbWUwfOcbGSuC+j33ipy42Yts
	hJOJwbDSM9VkL1Iy+cjS96UN+po/F0AlhdL1vo3Ezts5P4J51exNh0UOtaxqkEq1ucS2Y/YXrAY
	M
X-Google-Smtp-Source: AGHT+IF+7jzebJ2teRC8Kzz7grSClL0NnK2DMupouM4RPwysH2XrrfnFWseAGh4ak5FLW4WIsclcJQ==
X-Received: by 2002:a17:907:2dac:b0:a9a:ad8:fc56 with SMTP id a640c23a62f3a-aa483529cb4mr1167301866b.44.1731927108814;
        Mon, 18 Nov 2024 02:51:48 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>
Subject: [PATCH] xen/bootinfo: Include declaration for fw_unreserved_regions()
Date: Mon, 18 Nov 2024 10:51:45 +0000
Message-Id: <20241118105145.2329902-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Eclair complains that fw_unreserved_regions() can't see it's declaration.
Include <asm/setup.h> to address this.

This makes Mira Rule 8.4 clean on ARM, so tag it as such.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: consulting@bugseng.com <consulting@bugseng.com>

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1547057124
---
 automation/eclair_analysis/ECLAIR/tagging.ecl | 2 +-
 xen/common/device-tree/bootinfo.c             | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index 9318e5b10ca8..7944ce2ee3b2 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -115,7 +115,7 @@ if(string_equal(target,"x86_64"),
 )
 
 if(string_equal(target,"arm64"),
-    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.6||MC3R1.R20.7"})
+    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3R1.R8.4||MC3.R11.2||MC3R1.R16.6||MC3R1.R20.7"})
 )
 
 -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
index f2e6a1145b7c..3738eb57ff52 100644
--- a/xen/common/device-tree/bootinfo.c
+++ b/xen/common/device-tree/bootinfo.c
@@ -17,6 +17,8 @@
 #include <xen/libfdt/libfdt-xen.h>
 #include <xen/mm.h>
 
+#include <asm/setup.h>
+
 struct bootinfo __initdata bootinfo = BOOTINFO_INIT;
 
 const char * __init boot_module_kind_as_string(bootmodule_kind kind)

base-commit: 88c40dc108bfddb32a891e2e20d48bbe94949200
-- 
2.39.5


