Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C44A17B4E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 11:22:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875279.1285724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBOM-0004jf-Hq; Tue, 21 Jan 2025 10:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875279.1285724; Tue, 21 Jan 2025 10:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBOM-0004hc-EM; Tue, 21 Jan 2025 10:21:54 +0000
Received: by outflank-mailman (input) for mailman id 875279;
 Tue, 21 Jan 2025 10:21:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb3U=UN=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1taBOK-0004hS-Is
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 10:21:52 +0000
Received: from fforwardh-b2-smtp.messagingengine.com
 (fforwardh-b2-smtp.messagingengine.com [202.12.124.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86c548aa-d7e1-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 11:21:50 +0100 (CET)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id 9CC841740130;
 Tue, 21 Jan 2025 05:21:49 -0500 (EST)
Received: from phl-frontend-01 ([10.202.2.160])
 by phl-compute-07.internal (MEProxy); Tue, 21 Jan 2025 05:21:49 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jan 2025 05:21:48 -0500 (EST)
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
X-Inumbo-ID: 86c548aa-d7e1-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1737454909; x=1737541309; bh=I
	exxg0Qo4kbGg2eh3LYztUydfNJEguXN/Nl++lsTnTM=; b=Mwtfzvg8F8Bak6QlF
	ERJgm4sMuddnT+Y05HgYDF9YOnUM6XYBwMJJ1TIm7lkCvTWld0VtQ5yOBLqGlq1U
	OUw+2A0UA2r+CXu9WB3TVo4SoJ0iOJwiBBD/Dy+yMC45Fbt2rgFPrgP8vivb2Twm
	S/1zPN4+tuTdqlqM/n0LOEFAFD79eMy7bF/52tLNcU2rYGib73OqaM2uNwscTQK0
	nn6aww3qaFUBCj4qLL4bbfFrJUHzbZ1OU/9btCgFNTGdEV439OsaoU1kbXfU1qQA
	We8dzYdR1jfyCYRPwSRglQdRjuXqDg+fNROx79OwOY5//5i4OiTO8Yo4HtZ9Sg6R
	aBFYA==
X-ME-Sender: <xms:PXWPZ8LxUUGOyNoezIC86blph30I-sU3dmLiiWg_CZ5D2B8E6sf2Rw>
    <xme:PXWPZ8JX5tHCwgeA1rAvKo23Ft7DsEBYyZYZtZmKORZY-b8nyDD9_EnRfT-f1W9ah
    vVcHBhG7bwoGDaMLaU>
X-ME-Received: <xmr:PXWPZ8sBJGw6Q0_Mz-5jrqSEbpIoLmXsiVjj7zaqF0N1hFUF6cKRDq7OMh4HnIbR7ECBkbv88rSrMXRtbb2_U-ecmUEMY5Uil5zdsrz0k98iQCGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejuddgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrihhkse
    gvphgrmhdrtghomheqnecuggftrfgrthhtvghrnheptdejgeegvdffkeekleefueevgfdu
    heevkedvhfdvkeeludehleegheeivedugfejnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepshgrkhhisgesuggrrhhkshhtrghrrdhsihhtvgdp
    nhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnh
    dquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohep
    shgvrhhgihihpghkihgsrhhikhesvghprghmrdgtohhmpdhrtghpthhtohepjhgsvghulh
    hitghhsehsuhhsvgdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfees
    tghithhrihigrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrd
    gtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:PXWPZ5aR-FpoSkHSPoLXZCibCAEzXYLeaFOB6s-4UtYQAPmyK-mo7w>
    <xmx:PXWPZzaFLpXk-r9wtfKbh9nQSv1Dmv4wPntxae4komBZ4D2pXl5oxA>
    <xmx:PXWPZ1DYK3MvlcOJJ5y-7hU5aVMtuKUtiVLaJP8OyolQCX_Ceu-LkA>
    <xmx:PXWPZ5aLYKpFrUAfisMNUhe5AV3jbtwRwrCzTFYDPAMDQx-d_pBhog>
    <xmx:PXWPZ7r_fBPDgHPfXWGbAZtgp5aTn27aWzmnmBik8qPntFGTmpV-7A>
    <xmx:PXWPZ-wuRQL-Th-EgLzpjc40aiarrJPRAcB9q5j6DmN-nyam1g8oS5l3dVq8>
Feedback-ID: i57d9e29e:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/4] x86:monitor: control monitor.c build with CONFIG_VM_EVENT option
Date: Tue, 21 Jan 2025 12:21:47 +0200
Message-Id: <6fe254034570e1443a41c7dc5e3e3767b9c77f79.1737452864.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1737452864.git.Sergiy_Kibrik@epam.com>
References: <cover.1737452864.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace more general CONFIG_HVM option with CONFIG_VM_EVENT which is more
relevant and specific to monitoring. This is only to clarify at build level
to which subsystem this file belongs.

No functional change here, as VM_EVENT depends on HVM.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index b35fd5196c..8b3c17d689 100644
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


