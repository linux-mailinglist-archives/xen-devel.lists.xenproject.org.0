Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE4398A375
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 14:50:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807349.1218755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svFqb-0005yH-9o; Mon, 30 Sep 2024 12:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807349.1218755; Mon, 30 Sep 2024 12:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svFqb-0005vN-6i; Mon, 30 Sep 2024 12:49:53 +0000
Received: by outflank-mailman (input) for mailman id 807349;
 Mon, 30 Sep 2024 12:49:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LvNS=Q4=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1svFqZ-0005el-Py
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 12:49:51 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79a0f0a2-7f2a-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 14:49:48 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.161.44.57])
 by support.bugseng.com (Postfix) with ESMTPSA id 421774EE0743;
 Mon, 30 Sep 2024 14:49:45 +0200 (CEST)
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
X-Inumbo-ID: 79a0f0a2-7f2a-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1727700587; bh=Jpp1Fo55jAqnjqMINsKyso1R2+WP/wsc3J+y3xqFi0I=;
	h=From:To:Cc:Subject:Date:From;
	b=HoEzQNTtH1D1OzpR/R4NHArUoguh96jwc3JbvnZFv/qeMwkJSqikDi+8iTsKTuZLA
	 4UopYiRpzXJjTr6+t2BeUm9U0ZS4DSB/Puh9GQk4QWzU1JvRm253cw7bFg8hCCBuxN
	 Fn4glh/LoShEqinHFHivF8oet6LmJS162dcosbR5jESBpaO22t6hNI9q50Fta8f41W
	 ybCAfveKFhiO4An13N2BSF4UnMd85PtkunzcPsCweITxjU/oW8Tq4OJrZlF3h6kqZS
	 oOyWFKDxkdRp9vp2YToWJiZDThDK1AhwnGvejbrdTYDQbNsFHGHXszdbKpKc40xLYc
	 cIAA5vAUBqkoQ==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v2 0/3] xen: address violations of MISRA C Rule 13.6
Date: Mon, 30 Sep 2024 14:49:14 +0200
Message-ID: <cover.1727690180.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address remaining violations of Rule 13.6 and tag it as clean.

Federico Serafini (3):
  EFI: address violations of MISRA C Rule 13.6
  xen/gnttab: address violations of MISRA C Rule 13.6
  automation/eclair: tag Rule 13.6 as clean

 automation/eclair_analysis/ECLAIR/tagging.ecl |  1 +
 xen/common/compat/grant_table.c               | 15 +++++++++------
 xen/common/efi/runtime.c                      | 12 ++++++++++--
 3 files changed, 20 insertions(+), 8 deletions(-)

-- 
2.43.0


