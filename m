Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3208C6ED1
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 00:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722645.1126797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7NTo-0002e7-Ny; Wed, 15 May 2024 22:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722645.1126797; Wed, 15 May 2024 22:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7NTo-0002bl-LF; Wed, 15 May 2024 22:52:12 +0000
Received: by outflank-mailman (input) for mailman id 722645;
 Wed, 15 May 2024 22:52:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kF2M=MS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7NTm-0002bf-J6
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 22:52:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c23560c1-130d-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 00:52:09 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 48DF1614C5;
 Wed, 15 May 2024 22:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FAACC116B1;
 Wed, 15 May 2024 22:52:06 +0000 (UTC)
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
X-Inumbo-ID: c23560c1-130d-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715813528;
	bh=yq9aJoe7mPRaP2y/18GJw006zYIktPsyCWvFrHtNf4A=;
	h=Date:From:To:cc:Subject:From;
	b=R9VgG3rV/tBB+KTwEnCAO5FBDL+EkermOybBCbWvtQf5M488en5V+KzpmwGX+TmJA
	 xC02yINB2owbuDPAPY/M+i2flFh/PALWXQuVfG3O92BYNprK6qhEYRANSwmL4xL85A
	 MdG//8imY7VVhhGMsnVoYyzAj5e9OJDgzgRDjS5kqhih9owTmMWBxeC79M++BtScdy
	 f5ZJJ74ZAaWlJT2QrSEiRGDg9oHmkLlkgJ4BOi18dJC6dV7ev1h1tiHCdMao8cLyeu
	 SxVHNaZdJyzoK8GKZH9DtcUUatfpzlSbAJ08fR9GESxfL7BjiW71Wfnwjg/dP1Z79w
	 cLihdRBv9wjUw==
Date: Wed, 15 May 2024 15:52:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    nicola.vetrini@bugseng.com, consulting@bugseng.com, jbeulich@suse.com
Subject: [PATCH v2] include/ctype.h: fix MISRA R10.2 violation 
Message-ID: <alpine.DEB.2.22.394.2405151549020.2544314@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

The value returned by __toupper is used in arithmetic operations causing
MISRA C 10.2 violations. Cast to plain char in the toupper macro. Also
do the same in tolower for consistency.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- fix the toupper macro instead

diff --git a/xen/include/xen/ctype.h b/xen/include/xen/ctype.h
index 6dec944a37..773ac27aa4 100644
--- a/xen/include/xen/ctype.h
+++ b/xen/include/xen/ctype.h
@@ -48,7 +48,7 @@ static inline unsigned char __toupper(unsigned char c)
 	return c;
 }
 
-#define tolower(c) __tolower(c)
-#define toupper(c) __toupper(c)
+#define tolower(c) ((char)__tolower(c))
+#define toupper(c) ((char)__toupper(c))
 
 #endif

