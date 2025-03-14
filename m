Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 858DFA60841
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 06:23:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913749.1319652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsxVw-0004El-Af; Fri, 14 Mar 2025 05:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913749.1319652; Fri, 14 Mar 2025 05:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsxVw-0004Ch-80; Fri, 14 Mar 2025 05:23:20 +0000
Received: by outflank-mailman (input) for mailman id 913749;
 Fri, 14 Mar 2025 05:23:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HRIH=WB=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1tsxVv-0004CX-B3
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 05:23:19 +0000
Received: from fforwardh-a2-smtp.messagingengine.com
 (fforwardh-a2-smtp.messagingengine.com [103.168.172.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f68f9cb-0094-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 06:23:18 +0100 (CET)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfforwardh.phl.internal (Postfix) with ESMTP id 0BB9A292013B;
 Fri, 14 Mar 2025 01:23:17 -0400 (EDT)
Received: from phl-frontend-01 ([10.202.2.160])
 by phl-compute-11.internal (MEProxy); Fri, 14 Mar 2025 01:23:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Mar 2025 01:23:16 -0400 (EDT)
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
X-Inumbo-ID: 6f68f9cb-0094-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1741929797; x=1742016197; bh=8
	gtu3M66RCphGMRnb9LvcGgL3tCIvFU0NSfbGCgNSNk=; b=vjqOggn0UkV48q7di
	8aEmT0T/pHq3yLSL2Q9vR5z5Z/8rzjxu+MLZN9wligkzgfhdnZZtq0OqjVOGVQz/
	Xh3LI2NzmDZqlTRJMKkBlv14DxKOBVYqe8U5x+rThcwemrbEHunVsC74wONzXjsj
	KCIlYlgoCSc4osTe1O5sJMblW7QNXA6IHNLX4qeNTFvtti8LB4deCemZfvtt1Hmm
	T1kQYDAx+79VzhyCKMmMeffRFDWQN902mkfc2xeTnywwhiRErszmLwUZx/s6OkpW
	sp3teYVPvb5mOaQUYOp+M4pLJHdTkmlMo93BaSmLpKUGB35XiEg0y/WwAoAuRfVi
	A75Tw==
X-ME-Sender: <xms:RL3TZ9Q9NYz2VQxOHy9_DMwsd6cKTn5yJJ6qM9F1X3-w9JHDZHopwA>
    <xme:RL3TZ2znnacEC1eM_FOnazemZQklqlhsIFPwoYAcJp6qZsO4S_J0BrJdsjuyaN4HK
    38ebwDR5pM2lPLhk9A>
X-ME-Received: <xmr:RL3TZy3pFjMqfLDEKp4PwqmOekTLySD-Tli4BDXWkihE6YfmvG5448uFtrty-fOUT7Pwwa11uvmwW2ZyoDHw4-nSvF7sRKkdcTMv5i5vqoBw7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdelleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrih
    hksegvphgrmhdrtghomheqnecuggftrfgrthhtvghrnheptdejgeegvdffkeekleefueev
    gfduheevkedvhfdvkeeludehleegheeivedugfejnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepshgrkhhisgesuggrrhhkshhtrghrrdhsihht
    vgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgi
    gvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthht
    ohepshgvrhhgihihpghkihgsrhhikhesvghprghmrdgtohhmpdhrtghpthhtohepjhgsvg
    hulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghr
    feestghithhrihigrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrih
    igrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:RL3TZ1Ain5YkZdltNUfE7V5y4b02I2rLSku7W4M-2TbXn2ccyBl8JQ>
    <xmx:RL3TZ2hAmVjKy2qdGVuq-85CK0G3dKYCV74rcP4i8vXVJQCS3UGvSQ>
    <xmx:RL3TZ5p45HmmJwuKW3VenQZuOuh3QCm2JwnQ6DWVwEpOlOiCEk4KwA>
    <xmx:RL3TZxhHN1ddz2ouVY8kvePKN6zHToJFmaFFYujtqsbHwPUvXTDe0A>
    <xmx:RL3TZxSiOS8AjP3kCErp50AUT87oh76PkNGnD58kbZrX1Exhdliajg>
    <xmx:Rb3TZ4YCbhs19XUF900yDhxE3hMNHQ2UbsenzAIsqJYTp4gaFdQw4SQXjVOr>
Feedback-ID: if5db0626:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 2/3] x86:monitor: control monitor.c build with CONFIG_VM_EVENT option
Date: Fri, 14 Mar 2025 07:23:14 +0200
Message-Id: <39235285ffe341e446bf0fd5cc345379ae394e50.1741772330.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1741772330.git.Sergiy_Kibrik@epam.com>
References: <cover.1741772330.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace more general CONFIG_HVM option with CONFIG_VM_EVENT which is more
relevant and specific to monitoring. This is only to clarify at build level
to which subsystem this file belongs.

No functional change here, as VM_EVENT depends on HVM.

Acked-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index c763f80b0b..f59c9665fd 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -49,7 +49,7 @@ obj-$(CONFIG_PV) += ioport_emulate.o
 obj-y += irq.o
 obj-$(CONFIG_KEXEC) += machine_kexec.o
 obj-y += mm.o x86_64/mm.o
-obj-$(CONFIG_HVM) += monitor.o
+obj-$(CONFIG_VM_EVENT) += monitor.o
 obj-y += mpparse.o
 obj-y += nmi.o
 obj-y += numa.o
-- 
2.25.1


