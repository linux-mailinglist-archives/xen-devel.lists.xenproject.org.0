Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D89AC973133
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 12:09:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795243.1204556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoL-0000wr-Hn; Tue, 10 Sep 2024 10:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795243.1204556; Tue, 10 Sep 2024 10:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoK-0000io-To; Tue, 10 Sep 2024 10:09:24 +0000
Received: by outflank-mailman (input) for mailman id 795243;
 Tue, 10 Sep 2024 10:09:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1snxoI-0006in-7Y
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:09:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd35b6c8-6f5c-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 12:09:17 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-37-206-90.retail.telecomitalia.it [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 15E9C4EE07A5;
 Tue, 10 Sep 2024 12:09:17 +0200 (CEST)
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
X-Inumbo-ID: bd35b6c8-6f5c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725962957; bh=w6dJg0N0Gwxpq3+C0w0/DqhPaRkVVEdL4S1X1KOxgVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ME5hvuBvJq2k9ROgoGEt6BEY0aKD6A3zaSHZXK4gz+k+Gm8YD7dNOp6D+z+x2NK/V
	 xpygvp88SnGTFHWs+BR5DCUStrqhbXHlr+n1Kz3YClEKH2uNtti+FIA/Kr8s5TO0/Y
	 KYPybob31mGlgIILtUKLMopiQNtsCTzvD/WnHOguWWbaaSWsyBBGO7kaVSIz79mdkO
	 wUiJ1acLbhJuSnR1f5zScmmXWPzexfivVtdTZ1ItCWS3Fse2otqEG0qpt+1M9xJRse
	 6p6RB0jmBxSdX4LYiuGx66Qx7JSFzZ4/OMeC5wUBFNVzWiOhEpCnr0pJYske+dWq+D
	 NibmBa9wn3nBA==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 11/12] xen/vpci: add defensive code
Date: Tue, 10 Sep 2024 12:09:03 +0200
Message-Id: <d65fde9a39546d0b7c8433d2f8884ddb7b039fb9.1725958417.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725958416.git.federico.serafini@bugseng.com>
References: <cover.1725958416.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add defensive code in unreachable program points.
This also meets the requirements to deviate a violation of MISRA C:2012
Rule 16.3: "An unconditional `break' statement shall terminate every
switch-clause".

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/drivers/vpci/msix.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index fbe710ab92..037f9a0449 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -364,6 +364,8 @@ static int adjacent_read(const struct domain *d, const struct vpci_msix *msix,
 
     default:
         ASSERT_UNREACHABLE();
+        spin_unlock(&vpci->lock);
+        return X86EMUL_UNHANDLEABLE;
     }
     spin_unlock(&vpci->lock);
 
@@ -512,6 +514,8 @@ static int adjacent_write(const struct domain *d, const struct vpci_msix *msix,
 
     default:
         ASSERT_UNREACHABLE();
+        spin_unlock(&vpci->lock);
+        return X86EMUL_UNHANDLEABLE;
     }
     spin_unlock(&vpci->lock);
 
-- 
2.34.1


