Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC64A9742FB
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 21:06:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795996.1205533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so6Bs-0006sI-PC; Tue, 10 Sep 2024 19:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795996.1205533; Tue, 10 Sep 2024 19:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so6Bs-0006qs-La; Tue, 10 Sep 2024 19:06:16 +0000
Received: by outflank-mailman (input) for mailman id 795996;
 Tue, 10 Sep 2024 19:06:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1so6Bq-0006Mx-Kz
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 19:06:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcef6b9e-6fa7-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 21:06:09 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-37-206-90.retail.telecomitalia.it [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id C43614EE07CB;
 Tue, 10 Sep 2024 21:06:07 +0200 (CEST)
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
X-Inumbo-ID: bcef6b9e-6fa7-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725995168; bh=XraIlLmHoqL8tB8p3EmDTIaa7v8NPVzgfTbatkx2Rwg=;
	h=From:To:Cc:Subject:Date:From;
	b=rCjyK/yqOksRBVoeGd5TlDTLpZ//0X8n1sq09N4uYxF3z11MsFdjlvAzRAZN+TWmA
	 WvoReacK436K4uM5JF5r9dbkn+rH0K2b4qz9KBKdaLVvHTeEckfhfE3UWTqdlxWQi8
	 QVevNI3atqc9HA81njhzM9zg0uQJrU6ZqOXcSkCNNTwq8axhpTS27eDTLmFdNhgG7V
	 /sUbcv/I8og9pnw1PwGXArz/H6m8JYS8bH/Zkplo/EejelomKS4G9vGZ8NvpcBC3wX
	 iEDZcbEtwTXxzrccCV7/S39w8BxJ8cN55/8ealrEttcmXJF3I/q5bVWs85AmBG36xc
	 8TBEgj9RJRMsw==
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
Subject: [XEN PATCH 0/3] xen: address violations of MISRA C Rule 13.6
Date: Tue, 10 Sep 2024 21:05:59 +0200
Message-Id: <cover.1725994633.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
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
2.34.1


