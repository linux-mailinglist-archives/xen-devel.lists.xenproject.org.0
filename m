Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3988C4A7C
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 02:32:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721114.1124265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6g5X-00042f-Gc; Tue, 14 May 2024 00:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721114.1124265; Tue, 14 May 2024 00:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6g5X-00040j-D4; Tue, 14 May 2024 00:32:15 +0000
Received: by outflank-mailman (input) for mailman id 721114;
 Tue, 14 May 2024 00:32:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o5lq=MR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s6g5V-00040d-Nm
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 00:32:13 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65fffe14-1189-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 02:32:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 93397CE0FA4;
 Tue, 14 May 2024 00:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5AF4C113CC;
 Tue, 14 May 2024 00:32:04 +0000 (UTC)
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
X-Inumbo-ID: 65fffe14-1189-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715646725;
	bh=H78/7RklkbUxxfqv1CXgGuILJwFQYgVzwrybslal0WI=;
	h=Date:From:To:cc:Subject:From;
	b=m6lUVAmZkStl1bWmJ+nltMt0IKuXWwRFgyClzrLxt73uNe08ObIODo/pqqfhXCjp9
	 4fL87XZT62qAAMzYnc72s9feXjLs+9rU8GaJw6UfdA5Dl/yWChdQdjmP6YQH0P3Gsg
	 e5EcxkbkCO/jgB8UFNyhF7OKGpO0VdxSc+T1PGqCKtAkGHe+fIJVNcaSGIfP0I8Iph
	 1g6wSx9pvkE51RXgikQOe6ZOQX9mJ4CG1RJMvQKwhTsFQ7BFLBwYTBER3uTurZpXMM
	 WgvNHNzB1O1nQX+Q0LE+DHLNPI7MnNSfalTkm2VlpgQdIWNjcmWYI8UBzczNTUhN1f
	 2n2+Mql5hhWyA==
Date: Mon, 13 May 2024 17:32:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, jbeulich@suse.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>
Subject: [PATCH] lib/strtoul: fix MISRA R10.2 violation
Message-ID: <alpine.DEB.2.22.394.2405131729180.2544314@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Fix last violation of R10.2 by casting the result of toupper to plain
char. Note that we don't want to change toupper itself as it is a legacy
interface and it would cause more issues.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
I believe this is the last R10.2 violation

diff --git a/xen/lib/strtoul.c b/xen/lib/strtoul.c
index a378fe735e..345dcf9d8c 100644
--- a/xen/lib/strtoul.c
+++ b/xen/lib/strtoul.c
@@ -38,7 +38,7 @@ unsigned long simple_strtoul(
 
     while ( isxdigit(*cp) &&
             (value = isdigit(*cp) ? *cp - '0'
-                                  : toupper(*cp) - 'A' + 10) < base )
+                                  : (char)toupper(*cp) - 'A' + 10) < base )
     {
         result = result * base + value;
         cp++;

