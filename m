Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B71992F49
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 16:29:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812107.1224834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxojz-00058w-4I; Mon, 07 Oct 2024 14:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812107.1224834; Mon, 07 Oct 2024 14:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxojz-00055m-0P; Mon, 07 Oct 2024 14:29:39 +0000
Received: by outflank-mailman (input) for mailman id 812107;
 Mon, 07 Oct 2024 14:29:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/gRD=RD=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sxoXO-0002dC-IW
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 14:16:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2f69c14-84b6-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 16:16:36 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.162.58.49])
 by support.bugseng.com (Postfix) with ESMTPSA id 67D704EE0746;
 Mon,  7 Oct 2024 16:16:35 +0200 (CEST)
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
X-Inumbo-ID: c2f69c14-84b6-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1728310596; bh=E7dB2FCofs9MFp7zihxh1wxnARDyNN7WgWI2FwQOK0E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xVPGjM9WjmZpi8GG7K9MaKDBHZwteFI3oEC0yibwshSbIA5MxmazJ2nlmAPH8z8XV
	 ydBaf+FQ3AAfT6hfAwEp+ksKFO0j3UVtrKrGnAda5JHB1CZ95YQ3HUS/3Q1OZ2nTxQ
	 H8syHKDPHxjy1fQyO5r4zkGDoCtrIXjXLuLv8lw5Kczd1hIT4IKijqL9g9v9qI11gI
	 +qEtVlpB+dKouWU80A4wXuR4lR6tr4lT2lzuSLkIu6ghEwCTary4FKkxx9+cdLJx3x
	 CXMSp0RmQwR08y0eiH6H9A5HEKEw+OjqeWqpyEo39l4OUfYP5eQLpvAWdO2oIA/i1I
	 0gH2S1Owz3nLA==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 3/4] xen/vpci: address violations of MISRA C Rule 16.3
Date: Mon,  7 Oct 2024 16:16:18 +0200
Message-ID: <a91c0223b827593f5c1a7ca7ece786266e5b8f52.1728308312.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1728308312.git.federico.serafini@bugseng.com>
References: <cover.1728308312.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address violations of MISRA C:2012 Rule 16.3:
"An unconditional `break' statement shall terminate every
switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes from v2:
- simply break without returning X86EMUL_UNHANDLEABLE.

As pointed out by Jan, these functions only return X86EMUL_OKAY but:
https://lists.xenproject.org/archives/html/xen-devel/2024-09/msg00727.html

Do you have any comments?
---
 xen/drivers/vpci/msix.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index fbe710ab92..5bb4444ce2 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -364,6 +364,7 @@ static int adjacent_read(const struct domain *d, const struct vpci_msix *msix,
 
     default:
         ASSERT_UNREACHABLE();
+        break;
     }
     spin_unlock(&vpci->lock);
 
@@ -512,6 +513,7 @@ static int adjacent_write(const struct domain *d, const struct vpci_msix *msix,
 
     default:
         ASSERT_UNREACHABLE();
+        break;
     }
     spin_unlock(&vpci->lock);
 
-- 
2.43.0


