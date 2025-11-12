Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC46C539E0
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 18:15:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160386.1488543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJEQh-00039C-J0; Wed, 12 Nov 2025 17:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160386.1488543; Wed, 12 Nov 2025 17:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJEQh-00037N-GK; Wed, 12 Nov 2025 17:14:47 +0000
Received: by outflank-mailman (input) for mailman id 1160386;
 Wed, 12 Nov 2025 17:14:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mOdF=5U=linux.dev=thorsten.blum@srs-se1.protection.inumbo.net>)
 id 1vJEQg-00037H-1p
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 17:14:46 +0000
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com
 [91.218.175.186]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14800c86-bfeb-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 18:14:43 +0100 (CET)
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
X-Inumbo-ID: 14800c86-bfeb-11f0-9d18-b5c5bf9af7f9
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762967681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZPcbU/HjyHzjDNdh8oZgw6FUm0OlxveuLUPT+TNJvls=;
	b=AT5U8QoU/4yVoI0kNxptJ2hvBfaaRXmzvm4o1oLcdkbjEWJmjVDR035GudP1Mt1XUGnOAU
	lfgMaWLQZWfiGWcCbAdJG0dRjyBPB9iZg+x6fbNrak6zJ9d14d3hh3FHICf1UGayxq4hLc
	aIiutbYgxmtzKZZ1giBVzcTShRrINrk=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] drivers/xen/xenbus: Simplify return statement in join()
Date: Wed, 12 Nov 2025 18:14:07 +0100
Message-ID: <20251112171410.3140-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Don't unnecessarily negate 'buffer' and simplify the return statement.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
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
2.51.1


