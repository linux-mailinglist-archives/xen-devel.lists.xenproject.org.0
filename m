Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5A7C7615F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 20:33:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167944.1494139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMAPH-0002Sl-HW; Thu, 20 Nov 2025 19:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167944.1494139; Thu, 20 Nov 2025 19:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMAPH-0002Q4-EJ; Thu, 20 Nov 2025 19:33:27 +0000
Received: by outflank-mailman (input) for mailman id 1167944;
 Thu, 20 Nov 2025 19:33:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zJ8u=54=gmail.com=nicola.vetrini@bugseng.com>)
 id 1vMAPF-0001hr-Eu
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 19:33:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7f230a1-c647-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 20:33:24 +0100 (CET)
Received: from nico-ideapad (93-44-185-120.ip98.fastwebnet.it [93.44.185.120])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id A164B4EEBF07;
 Thu, 20 Nov 2025 20:33:23 +0100 (CET)
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
X-Inumbo-ID: c7f230a1-c647-11f0-9d18-b5c5bf9af7f9
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=93.44.185.120
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1763667204;
	b=aLFB7evADIquXxgGDFc320N1zTWObCfTB7aSi+lUnGsfQd+SaDp18Y6vbBVRxtqRC2u2
	 GQo0j66pWqcnq2nANFuI1kBNEJ6LbhBwOPMdAzLa27oLi58TG5RIWmEVq4VmKD6ovG0nr
	 Wtbh+ad5NsNcJwzA1teM7TCEDjgSWAHSyZzVZZg4vKBlhyW7f+PsqxpNMf7xR8+E0H/jR
	 BMi3naKJBrPbsfyo+BLyW5nTfojY4Fzykag3LtVKJAjEZvzuPJlC70WMoAppk18RJCQE8
	 HZyiCf+ommjxFJQvvDbkvO55bT1dKl0nAbSc8pgObBOItcR1qB5HCUanIB/scbYw/3kl+
	 lbAnFa/uPQclzfXXazBaXFSEV1XlYyk7WIgN+hdO52Pj4HIgDG/6rs8B09TIj9yv1Eiix
	 OBYmJ39F8CltupKpxvxn0k5Fxb9yHzxngygGQqfvkTfClAHxubp05NFaAbVqGt0HBIf0Y
	 2gFwJwHgluX1tHWw7sTz+2KnIUwzSbNWI8x5x/Ywp6iTbCzr/ug6x2LK6wv+r/aUt5+q3
	 lvejVYMILxGmfoMGTc9zLAkKn5YsrWYKe7Jl1ybOle9wywjI2ej2nq1avKdhJ+dOmcQ0w
	 9D04TpLBK1p1iBls59JKZdw2WChzR5yUKD27PNSoX3wqQNyYpeKvWyvN9tkJM6Q=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1763667204;
	h=From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1QuMs1/9Gq1gFIiBb+i2lk9Yrl5XzVkDzoTNLAZZEJ0=;
	b=Hlyjvb/w6XumCYs1XVcDJCWR+enCCdwJe7ny51H4XAFCM+/4CbiFazH1U9OD8YzWOTdL
	 sE0i4AfdMg6uOObOZ2uL15meuLcJb/vubyQfovJLoZksg0/C4kYnbAj8UEq4l7t3QzC6N
	 b0CPWIFgoEAQwqwj7wjrDVn/3wnQfXjs9C7ABJz75yKsWbkYG72WUBMCur3L61TpFEMii
	 3jf+PNRI0Gz8uK18EUBE5N1PZX/D3uXaONx31f5nLh5ZDuUiEJG2HNVIAR0xk+z2Sm6Sj
	 yy1zV+xLv/8bCH//t8uY5nTsPlSa5LRL+7r1JZMIu8afQZeQmd2h2kP95YfTeg++v8gPK
	 QCiSPKDQf7ccnbXY3JOXy1VAHaDOP7mlwYBcLxaEFCvO9Np/APvn9CFRvm0jzoDDP4m7g
	 pKszEu1Al6ZhElN1fodEPCrz2LQepH5GoZqHVmKth+4opLlEs+Fsok2LWQm8JEpKNNd+c
	 zQ/2TBJFaUGDk357JdbqZHFq1IaecOJUbh2wmtYAMkl+wihFXmTKojdef7dlPKZe87cjn
	 sZ3uak3Wjx4xQtC2piBcdSuqe43xy0ITQDVlfY6Jn3F/23lziLXt+JL/Rk1WMGhmP2Qic
	 sgAWl63XgBtLf/Ql2r8KhILAHjayihIisOlJLjZsR3ePte5F9xoujBJIGp6bKx8=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=93.44.185.120
From: Nicola Vetrini <nicola.vetrini@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	sstabellini@kernel.org,
	Nicola Vetrini <nicola.vetrini@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 4/4] xen/param: address violation of MISRA C Rule 8.2
Date: Thu, 20 Nov 2025 20:32:56 +0100
Message-ID: <b51830acf5274dfac6a3b2b6864be775180ee673.1763642993.git.nicola.vetrini@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1763642993.git.nicola.vetrini@gmail.com>
References: <cover.1763642993.git.nicola.vetrini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

add missing parameter name in function pointer member declaration.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>
---
 xen/include/xen/param.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/param.h b/xen/include/xen/param.h
index f5a2189400..3b6f134b07 100644
--- a/xen/include/xen/param.h
+++ b/xen/include/xen/param.h
@@ -90,7 +90,7 @@ extern const struct kernel_param __setup_start[], __setup_end[];
 struct param_hypfs {
     struct hypfs_entry_leaf hypfs;
     void (*init_leaf)(struct param_hypfs *par);
-    int (*func)(const char *);
+    int (*func)(const char *s);
 };
 
 extern struct param_hypfs __paramhypfs_start[], __paramhypfs_end[];
-- 
2.51.2


