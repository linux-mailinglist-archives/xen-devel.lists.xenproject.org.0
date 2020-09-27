Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 191ED27A1A7
	for <lists+xen-devel@lfdr.de>; Sun, 27 Sep 2020 17:38:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMYjf-00006n-II; Sun, 27 Sep 2020 15:37:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u3DK=DE=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kMYjd-00006i-Uk
 for xen-devel@lists.xenproject.org; Sun, 27 Sep 2020 15:37:10 +0000
X-Inumbo-ID: 88ad5daa-f603-400f-b3ca-16fa491a7b1e
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88ad5daa-f603-400f-b3ca-16fa491a7b1e;
 Sun, 27 Sep 2020 15:37:09 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C01065C015C;
 Sun, 27 Sep 2020 11:37:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 27 Sep 2020 11:37:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=79UcSB
 +VIGzs7dqFBdpd3ozz/3DgC8kB5fgkb+XEKpQ=; b=UtMyWNx2nQ+KilyrxIWHWD
 TRB5DW2/DStcNjFIxwGnJNPVfhWibJXpUEU/xqpk87a3YOuDrepuLVydYfWu/yKq
 jQ2zk5pUutSTNkEOxQQNnAzm8Njm5MOI+wttZL7Ia2ukzrPQNV+SHLIFixnji8Hu
 QHvwQOkv/MnfgnwdEMj5Ih8xYE9eOD2Zw8DJcBAXoFv7gGtp6iI9FmMPccVo1E09
 f9rkR4FdSq0GIJnxTTChirped6B3cC6o3THVrei/df6sXbb4yVQHu12M0F1q7sie
 Lqryvl1qnvbQSYAPkcvQ09gJCp6vrmfJYqb8GgfihNIVKUmnp05J1ZvJab51X6YA
 ==
X-ME-Sender: <xms:pLFwX1y66SK--LFHLuXI-OXba2rf9_-anP5V37Xz8j1XL7uvETWM5w>
 <xme:pLFwX1QdubdkUCo6QSHx0ox-nfymLyii9EY__f3s4vIr-5hWPIYsUGkKSEWYkpRqt
 1yPDExc99_wTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeggdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtghogfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgefhieel
 ieevveeiheetvdeghedvgfejfffhjeehleegueeuiefhieejgeeliedtnecuffhomhgrih
 hnpehprhhothdrshgsnecukfhppeeluddrieegrddujedtrdekleenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:pLFwX_VM-2Lwr_VJbCCdY-ZXWMS4cNfh6LxbiOVl9K-jPxHRa1zoaQ>
 <xmx:pLFwX3hO45jWNpNA2uSH3JgNcWlwrlGuHivnxLvPEeFTEAQ7P7trGw>
 <xmx:pLFwX3D9K_R-2zpTfkdoqJyk-zLk-BqyXp5AZ1ccfqN_KQj2ZOfO-Q>
 <xmx:pLFwX6NID7qiuSvAwLRmdnL_N_37yPunfiUlUL9932SEze9glHkwNQ>
Received: from localhost.localdomain (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 905A73280063;
 Sun, 27 Sep 2020 11:37:07 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>
Subject: [PATCH] x86/S3: Fix Shadow Stack resume path
Date: Sun, 27 Sep 2020 17:36:57 +0200
Message-Id: <20200927153657.304553-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Invisible Things Lab
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Fix the resume path to load the shadow stack pointer from saved_ssp (not
saved_rsp), to match what suspend path does.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Fixes: 633ecc4a7cb2 ("x86/S3: Save and restore Shadow Stack configuration")
Backport: 4.14
---
 xen/arch/x86/acpi/wakeup_prot.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/acpi/wakeup_prot.S b/xen/arch/x86/acpi/wakeup_prot.S
index a2c41c4f3f26..c6b3fcc93d93 100644
--- a/xen/arch/x86/acpi/wakeup_prot.S
+++ b/xen/arch/x86/acpi/wakeup_prot.S
@@ -69,7 +69,7 @@ ENTRY(s3_resume)
          * so SETSSBSY will successfully load a value useful for us, then
          * reset MSR_PL0_SSP to its usual value and pop the temporary token.
          */
-        mov     saved_rsp(%rip), %rdi
+        mov     saved_ssp(%rip), %rdi
         cmpq    $1, %rdi
         je      .L_shstk_done
 
-- 
2.25.4


