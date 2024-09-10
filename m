Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF5997312F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 12:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795236.1204495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoF-0007iF-Ge; Tue, 10 Sep 2024 10:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795236.1204495; Tue, 10 Sep 2024 10:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoF-0007XC-0E; Tue, 10 Sep 2024 10:09:19 +0000
Received: by outflank-mailman (input) for mailman id 795236;
 Tue, 10 Sep 2024 10:09:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1snxoD-0006hI-3E
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:09:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbe4c126-6f5c-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 12:09:15 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-37-206-90.retail.telecomitalia.it [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 854064EE07C0;
 Tue, 10 Sep 2024 12:09:14 +0200 (CEST)
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
X-Inumbo-ID: bbe4c126-6f5c-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725962955; bh=+464nsW1HRBa4piEv0WIwfEOU6bTSrq7mNRHB28EwBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cosY1Ij8KuLU8paMtYMWZYLxSPXziHsHz9q6yQ8ePtUUE+eTILbpb/ppQy2A8ZvG3
	 QQdtcvXKJEO/InQV2C7D0b+c4ZG129nEYhgAPiYTdGy1A9bi86HjowZNMmgbyqASpH
	 xxbc53iuBKpaTBTui0iKcfpDkzanynW0USVPK2WX7bkmQMJ9n+q7ZRiNcRYgxjRkPu
	 9SGCnobSHjkGPM7huA5cEm2FZsWecVOCOytqnc0POMSTBv7U/4yx/xDuIBUnrK8RmT
	 SSh7zlWlrV9m8wB9KpCjRT8grRCsRZZZFxoQOIdqOZatY3KYDMDUhgqDDiakZ+5BFJ
	 j74WjOwx2xMQw==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 05/12] x86/monitor: address violation of MISRA C Rule 16.3
Date: Tue, 10 Sep 2024 12:08:57 +0200
Message-Id: <c71edd14ccff27aa682476a858d39410d9907f77.1725958416.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725958416.git.federico.serafini@bugseng.com>
References: <cover.1725958416.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address a violation of MISRA C:2012 Rule 16.3:
"An unconditional `break' statement shall terminate every
switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/monitor.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/include/asm/monitor.h b/xen/arch/x86/include/asm/monitor.h
index 96e6a9d0d8..3c64d8258f 100644
--- a/xen/arch/x86/include/asm/monitor.h
+++ b/xen/arch/x86/include/asm/monitor.h
@@ -65,6 +65,7 @@ int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
 
     default:
         rc = -EOPNOTSUPP;
+        break;
     }
 
     return rc;
-- 
2.34.1


