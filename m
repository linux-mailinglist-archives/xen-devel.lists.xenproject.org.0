Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C67992F1A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 16:26:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812070.1224784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoh8-0006ae-Mp; Mon, 07 Oct 2024 14:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812070.1224784; Mon, 07 Oct 2024 14:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoh8-0006Ya-JG; Mon, 07 Oct 2024 14:26:42 +0000
Received: by outflank-mailman (input) for mailman id 812070;
 Mon, 07 Oct 2024 14:26:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/gRD=RD=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sxoXK-0002yM-Tf
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 14:16:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1249571-84b6-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 16:16:33 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.162.58.49])
 by support.bugseng.com (Postfix) with ESMTPSA id 914A14EE073C;
 Mon,  7 Oct 2024 16:16:31 +0200 (CEST)
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
X-Inumbo-ID: c1249571-84b6-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1728310592; bh=Rw/6lZkUT95Q5eXiyKwB9nvEthMA7107H6dUFqAvFQw=;
	h=From:To:Cc:Subject:Date:From;
	b=PR80RBPwTk9ySh5HosVxP/egnBDn97uzlcxtiypTM+0tEi8iw531G0Et2nFuLocaS
	 2CPXIZz2w4kx6RKmlti9Ld9oVsS8ZHKHKB8hJ3DBTJPEWNv+WC3XAnfjxotlJQO2Vi
	 dvYN4x+pz5C9SyANk1QxprD+LJUqp8owQKU+gmE6uJD8npZ6k/tWWwcdFMbeuTSiFT
	 SAh67lsl1aBISFXYTDMBQa3hvI9rbLPP7aU45RZRdqKuNW5Y79x6QCJTM3vB7zHstr
	 xyGO+I747qvh5tcGWDHfhy53YkTgXVD1FXeULTzYfaaOT53/mr82oN86b3ZBl+y8bR
	 Qx0+cg8ztvjpg==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 0/4] x86: address violations of MISRA C Rule 16.3
Date: Mon,  7 Oct 2024 16:16:15 +0200
Message-ID: <cover.1728308312.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If these 4 patches will be committed, only 4 violations will be left:
these are under x86_emulate and involve some fallthrough cases.
I'll wait for instructions from x86 maintainers about the right "format" to make
the fallthrough intention explicit (i.e., a comment or the fallthrough keyword
that is not defined in x86-emulate.h at the moment).

Federico Serafini (4):
  x86/emul: add defensive code
  x86/emul: address violations of MISRA C Rule 16.3
  xen/vpci: address violations of MISRA C Rule 16.3
  xen/pci: address a violation of MISRA C Rule 16.3

 xen/arch/x86/x86_emulate/fpu.c         | 5 +++++
 xen/arch/x86/x86_emulate/x86_emulate.c | 3 +++
 xen/drivers/passthrough/pci.c          | 4 +++-
 xen/drivers/vpci/msix.c                | 2 ++
 4 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.43.0


