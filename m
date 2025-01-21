Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C48A17B66
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 11:24:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875288.1285733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBQL-0005Hz-Ql; Tue, 21 Jan 2025 10:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875288.1285733; Tue, 21 Jan 2025 10:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBQL-0005Gc-Nq; Tue, 21 Jan 2025 10:23:57 +0000
Received: by outflank-mailman (input) for mailman id 875288;
 Tue, 21 Jan 2025 10:23:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb3U=UN=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1taBQJ-0005GT-MP
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 10:23:55 +0000
Received: from fforwardh-b2-smtp.messagingengine.com
 (fforwardh-b2-smtp.messagingengine.com [202.12.124.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0828c1f-d7e1-11ef-a0e4-8be0dac302b0;
 Tue, 21 Jan 2025 11:23:54 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id 2EC94174022A;
 Tue, 21 Jan 2025 05:23:53 -0500 (EST)
Received: from phl-frontend-01 ([10.202.2.160])
 by phl-compute-04.internal (MEProxy); Tue, 21 Jan 2025 05:23:53 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jan 2025 05:23:51 -0500 (EST)
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
X-Inumbo-ID: d0828c1f-d7e1-11ef-a0e4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1737455033; x=1737541433; bh=i
	YEVQqGlu6rOaDg6bu+NtoBAX9qDsxKc2/u3zO9X5Vw=; b=J8sBVHrlRXqHSHdL7
	53gX6LympSmCHzv/35ObJrcimhWJKHikXeCIGgb9HgHq0wxiwZKAQ0Nf4ma0Wa60
	wD9g5fDKJk8sGB/lOX/IOYBCtwhW6dO1CCP/fef1nIEdEvI6g3r/nD8dKSMkIQub
	sj97Ifj4wtqBNnDYvRHbXARnQwEn0ofRN0CmK4SyQqBpRJTPvMnU1+frmLW8eegw
	rcQcrjY14g4oK3sxmd2ZHU6IvwygsPTDgPEUeBIJe48VevcXbNgKvDjOlMTba0wL
	t6Q3J60b8b/g2OjvuFc0F9NohVK1dgVxNnleuPCNvqN6+W8Iwjn3D+b8KrjTHJJ5
	nOLiQ==
X-ME-Sender: <xms:uHWPZ3Mmz-rwz0TGXu5lWLz2-CIlJIvgp99gFfxLkuYXqsn3f8QpBQ>
    <xme:uHWPZx_NuIpXpR7Io4zLFMFh4f9xHXDVaah5M0sk_ZYVHk2Nxpz2E8v999PhNvJLW
    hNHt3zhkkwwDBFXg3I>
X-ME-Received: <xmr:uHWPZ2SI7Qp3t5TA7ktW9-_ELQfkp9NMeNu_3eY-LUvh3GT_kcxCZfwuis1vzYWGQdRp-9192gJRWVf3G2bcz3VWwUFLqME3JG-V1Xef2BljgCJT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejuddgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrihhkse
    gvphgrmhdrtghomheqnecuggftrfgrthhtvghrnheptdejgeegvdffkeekleefueevgfdu
    heevkedvhfdvkeeludehleegheeivedugfejnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepshgrkhhisgesuggrrhhkshhtrghrrdhsihhtvgdp
    nhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnh
    dquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohep
    shgvrhhgihihpghkihgsrhhikhesvghprghmrdgtohhmpdhrtghpthhtohepnhhitgholh
    grrdhvvghtrhhinhhisegsuhhgshgvnhhgrdgtohhmpdhrtghpthhtoheptggrrhguohgv
    segtrghrughovgdrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:uHWPZ7tWwMihqchR2xjQLwtmyGoCaqkKZNwcwVt7rzJE3g9u6nkHeA>
    <xmx:uHWPZ_ezeKLeG8pj_JhFrFth1n4M-9MmzYzqjmi1DodlKmsoXPy9Ag>
    <xmx:uHWPZ30mrzl0exOz7oE22_VN4fbuAoIGV-7PhPYLcb_oH6SiciB0NQ>
    <xmx:uHWPZ79CAUBEs0TOfC3_VILQwew_VsaVSGEwYoutti_44yQ5JONiMA>
    <xmx:uHWPZy_SRZU-jFQOGUHE_01ZwENjcNe7_kng45ilzjnZBQhk7Z6lqA>
    <xmx:uXWPZ27KKqRR88jTqEFEJ2-tpcMkGM4w5b3ZMgZtowvuRDdrbjh1giHBJY7g>
Feedback-ID: id5db7974:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 3/4] automation: rename CONFIG_MEM_ACCESS -> CONFIG_VM_EVENT
Date: Tue, 21 Jan 2025 12:23:50 +0200
Message-Id: <e43444e0cd04bf08edf47ee4c56d0aa675d19534.1737452864.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1737452864.git.Sergiy_Kibrik@epam.com>
References: <cover.1737452864.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following the renaming of Xen build option.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 automation/eclair_analysis/xen_arm_config | 2 +-
 automation/eclair_analysis/xen_x86_config | 2 +-
 automation/gitlab-ci/build.yaml           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/automation/eclair_analysis/xen_arm_config b/automation/eclair_analysis/xen_arm_config
index ef140ceb73..4b01ef51c5 100644
--- a/automation/eclair_analysis/xen_arm_config
+++ b/automation/eclair_analysis/xen_arm_config
@@ -63,7 +63,7 @@ CONFIG_HAS_DEVICE_TREE=y
 CONFIG_HAS_FAST_MULTIPLY=y
 CONFIG_HAS_PDX=y
 CONFIG_HAS_PMAP=y
-# CONFIG_MEM_ACCESS is not set
+# CONFIG_VM_EVENT is not set
 CONFIG_STATIC_MEMORY=y
 
 #
diff --git a/automation/eclair_analysis/xen_x86_config b/automation/eclair_analysis/xen_x86_config
index abc44d43e1..9da3264dd0 100644
--- a/automation/eclair_analysis/xen_x86_config
+++ b/automation/eclair_analysis/xen_x86_config
@@ -54,7 +54,7 @@ CONFIG_HAS_PDX=y
 CONFIG_HAS_SCHED_GRANULARITY=y
 CONFIG_HAS_UBSAN=y
 CONFIG_MEM_ACCESS_ALWAYS_ON=y
-CONFIG_MEM_ACCESS=y
+CONFIG_VM_EVENT=y
 CONFIG_NEEDS_LIBELF=y
 CONFIG_NUMA=y
 
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index bc4a8a5ad2..ed65e2edd7 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -741,7 +741,7 @@ debian-12-riscv64-gcc:
       CONFIG_EXPERT=y
       CONFIG_GRANT_TABLE=n
       CONFIG_LIVEPATCH=n
-      CONFIG_MEM_ACCESS=n
+      CONFIG_VM_EVENT=n
       CONFIG_QEMU_PLATFORM=y
       CONFIG_XSM=n
 
-- 
2.25.1


