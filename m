Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBDAA136A2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 10:32:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873369.1284335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYMDa-00057x-0s; Thu, 16 Jan 2025 09:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873369.1284335; Thu, 16 Jan 2025 09:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYMDZ-00055u-U1; Thu, 16 Jan 2025 09:31:13 +0000
Received: by outflank-mailman (input) for mailman id 873369;
 Thu, 16 Jan 2025 09:31:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WMgP=UI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tYMDX-00055l-P7
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 09:31:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dffa93a-d3ec-11ef-99a4-01e77a169b0f;
 Thu, 16 Jan 2025 10:31:09 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id B9FED4EED422;
 Thu, 16 Jan 2025 10:31:06 +0100 (CET)
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
X-Inumbo-ID: 9dffa93a-d3ec-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1737019868; bh=VPfiKdifsI4B8yVlKwmfWHnWIVmO3aBtXYXj03GolT8=;
	h=From:To:Cc:Subject:Date:From;
	b=OXKw1ZcIH4J1+S86++YLiHdQf/RMTz5KA2m5sFoJ7eql6MNnvuZCoBUQbhi3O9+Ok
	 KJwIQhLR3YUR0pwrOwJgX4L7TrQrdv4MkgJBZKb1Y3NjxRKi9J7hBVrDAiTQPDjWZG
	 eDgR585h1EP4qcftCworH1BoMn4AbMa4ZYe3C+r40UhE8fBuVjAVtzsXHV9XHdWjWD
	 sP2M+Mg6R/pHN5Ez7zZ9h7SHvJratCvkxkKv1ESoVG+LPAPnboNhtDXhpxzauJb2TQ
	 1+q2yy3RBqKcD2I6jLHpRUsaKj1pbGZaD/uqhbGHpA9YleSkWceMtt97oakTs0xaWj
	 tpGbIwxLCf2Tw==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH] docs/misra: Document ECLAIR extension to Rule 20.7
Date: Thu, 16 Jan 2025 10:31:01 +0100
Message-ID: <77354513a986a14c37ec2dfc45cf3534b08b5e85.1736972547.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states:
"Expressions resulting from the expansion of macro parameters shall
be enclosed in parentheses".

Document the behaviour of ECLAIR with respect to the CPP extension
that allows variable macro arguments to be named.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 docs/misra/rules.rst | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index e7763795b826..13890f6d8852 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -671,7 +671,14 @@ maintainers if you want to suggest a change.
        shall be enclosed in parentheses
      - Extra parentheses are not required when macro parameters are used
        as function arguments, as macro arguments, array indices, lhs in
-       assignments or as initializers in initalizer lists.
+       assignments or as initializers in initalizer lists. In addition,
+       the use of a named variable argument in a macro that would constitute
+       a violation of the rule is allowed by ECLAIR as an extension of the
+       MISRA, since it may not always be possible to parenthesize such
+       argument and the feature is non-standard::
+
+         #define M(args...) args
+         #if M(1) + 0 
 
    * - `Rule 20.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_09.c>`_
      - Required
-- 
2.43.0


