Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AD3BF6E12
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 15:50:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147252.1479592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBCl3-0000gN-TK; Tue, 21 Oct 2025 13:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147252.1479592; Tue, 21 Oct 2025 13:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBCl3-0000ec-QS; Tue, 21 Oct 2025 13:50:37 +0000
Received: by outflank-mailman (input) for mailman id 1147252;
 Tue, 21 Oct 2025 13:50:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7Ey=46=linux.dev=thorsten.blum@srs-se1.protection.inumbo.net>)
 id 1vBCl1-0007Ct-NJ
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 13:50:36 +0000
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [95.215.58.186]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea52ca24-ae84-11f0-9d15-b5c5bf9af7f9;
 Tue, 21 Oct 2025 15:50:34 +0200 (CEST)
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
X-Inumbo-ID: ea52ca24-ae84-11f0-9d15-b5c5bf9af7f9
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761054633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xNqnht/v7r+E+ltgWbTdV/aRGJGim2ZUKdxu9dFf+lI=;
	b=pDg8Arzpu3AtNFSqHOUAcGfvodbeXkuXnFX6VcvHp47TmBb/4LwlLAYyIl8+JtUBi0ij1B
	JiCiRe57bYeHRRyIn6OUPhK8Gs0UcKKiPclQt6PijkFhHIuCBwwOHVCJ/edPrtDJaJCd6r
	V/EoUPlP0ds6CqUeKvf9WCHFnQlYK3M=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/xen/xenbus: Simplify return statement in join()
Date: Tue, 21 Oct 2025 15:49:58 +0200
Message-ID: <20251021135002.1228-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Don't unnecessarily negate 'buffer' and simplify the return statement.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/xen/xenbus/xenbus_xs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/xenbus/xenbus_xs.c b/drivers/xen/xenbus/xenbus_xs.c
index 528682bf0c7f..7c6c12925326 100644
--- a/drivers/xen/xenbus/xenbus_xs.c
+++ b/drivers/xen/xenbus/xenbus_xs.c
@@ -407,7 +407,7 @@ static char *join(const char *dir, const char *name)
 		buffer = kasprintf(GFP_NOIO | __GFP_HIGH, "%s", dir);
 	else
 		buffer = kasprintf(GFP_NOIO | __GFP_HIGH, "%s/%s", dir, name);
-	return (!buffer) ? ERR_PTR(-ENOMEM) : buffer;
+	return buffer ?: ERR_PTR(-ENOMEM);
 }
 
 static char **split(char *strings, unsigned int len, unsigned int *num)
-- 
2.51.0


