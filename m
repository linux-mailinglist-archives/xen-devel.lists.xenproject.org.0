Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C024214D3
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 19:07:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201615.356241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXRQh-0003jD-Rl; Mon, 04 Oct 2021 17:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201615.356241; Mon, 04 Oct 2021 17:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXRQh-0003U8-I9; Mon, 04 Oct 2021 17:07:07 +0000
Received: by outflank-mailman (input) for mailman id 201615;
 Mon, 04 Oct 2021 17:07:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mXRQe-0002pF-Sp
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 17:07:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mXRQe-0000LS-SC
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 17:07:04 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mXRQe-0005hQ-R8
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 17:07:04 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mXRQd-0006NI-3c; Mon, 04 Oct 2021 18:07:03 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=X7uAEedSKghPplBPVQkmGaLlxU/DlARIutYlzLjpc7A=; b=3RKal3uEH1ebhXOTeOIlrQyvXn
	L+qTj0n+65x4yJuO4sG15tg3VYJ5TL4PgclpAwZ2Kav7yBaIzgty+Ul53/BJPh/xoed4Uc8WIRyds
	VQ7nw4tL7tyGJxYDdowIMCrOnMmN5uuO5sTKRzM+kcgQkQ2PjWIXJmZ2LaAT00vjeMCM=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 6/6] mg-repro-setup: Check allocation feasibility at the start
Date: Mon,  4 Oct 2021 18:06:54 +0100
Message-Id: <20211004170654.21864-7-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211004170654.21864-1-iwj@xenproject.org>
References: <20211004170654.21864-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mg-repro-setup | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mg-repro-setup b/mg-repro-setup
index 56d27d4ef..895f29963 100755
--- a/mg-repro-setup
+++ b/mg-repro-setup
@@ -260,6 +260,17 @@ if [ "${alloc_idents[*]}" ]; then
                 echo >&2 'cannot hand-allocate in a way that will free'
                 exit 1
         fi
+
+	set +e
+	alloc_output=$(
+		./mg-allocate --dry-run $duration "${alloc_specs[@]}" 2>&1
+	)
+	alloc_rc=$?
+	set -e
+	test $alloc_rc = 0 ||
+	fail "requested allocation(s) infeasible:
+$alloc_output
+"
 fi
 
 flight=$(./cs-adjust-flight new:$blessing)
-- 
2.20.1


