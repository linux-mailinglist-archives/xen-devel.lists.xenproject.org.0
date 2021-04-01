Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8DB351546
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 15:39:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104466.199836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxXD-0005zX-O5; Thu, 01 Apr 2021 13:38:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104466.199836; Thu, 01 Apr 2021 13:38:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxXD-0005yf-Kk; Thu, 01 Apr 2021 13:38:55 +0000
Received: by outflank-mailman (input) for mailman id 104466;
 Thu, 01 Apr 2021 13:38:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8z4=I6=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lRxXC-0005gw-3w
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 13:38:54 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c74d724e-f2a8-4655-b977-c97b4aea5a0b;
 Thu, 01 Apr 2021 13:38:39 +0000 (UTC)
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
X-Inumbo-ID: c74d724e-f2a8-4655-b977-c97b4aea5a0b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617284319;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/nfKp65BUMpoLSwVcKTcwd3UvwPRuboxyMAbRkTKwjk=;
  b=LhpytAPG2jmsMhwYHhSbXlivxEN6+RqkmUngXvaKgU/8nfBuclkvQirJ
   owSwD1tfo2IRz99hZlNQ2HGRTB7Ff6tPblVnjDHIsSObGe8BiPscJau3N
   RHYTIl8eqTnz/T6JRq6mZpjK7nBn00BJQMCwUqSuOc18UAHZz+kNd+Dnm
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: TR3DXpggjJQChW4s+fKNp6wATEYaDhKr4u8Bk4o3QNx/qyF3yZ9F/lYE/CrPPGu7IMWPyhPew2
 zMVzLo8YXcuFDL7MJ+JCV4UFhBxbgkKwaCLMl4DORwxfG7X11uFe7ccRcUmsRlJ8c3ADitW94i
 vqrxSBMfQGuBiBtz43PuLVFtIRoPbvF8MSzhoqF4gHWM2iMoJbrFWQtagBlv0qMu5z7dCCh8aM
 zCbjA+QcW1pRpDb9kqCi3Ty/NaaC9dStwpp4k/GZ+PzG3vjjdkfce7kGXcjEFG1Bk9b00MZlSP
 72M=
X-SBRS: 5.1
X-MesageID: 40698209
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:F17nQal7291yDsMUj+YNNieQD07pDfPfimdD5ilNYBxZY6Wkvu
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/NIyKMaVI3DYCDNvmy0IIZ+qbbz2jGIIVyZysdx94
 dFN5J/Btr5EERgga/BijWQPt48zLC8n5yAqvzZyx5WIz1CS6Yl1AthDxbeL0sefnglObMcNL
 6xovVKvCChf3N/VLXdOlAgU/LYr9PG0LLKCCR2ZCIP0wWFgTO25LOSKXHxsis2aD9Bzawv9m
 LIiWXCl8Cemsq21wPG0Cvr54lW8eGL9vJ4GMeOhsIJQw+c7jqAWYIJYdy/lQFwms6DwhIAkN
 7AoxAvVv4DlE/5TyWOjjbGnyXl2DYqwXf+xVGfmmuLm72GeBsKT/BvqKgcXhzF61cxnNwU6t
 M740up86B5IDmFvCPh68PGXxtn/3DE0UYKoKoooFF0Fa49AYUh1LA3zQduP7orWB/e0sQBFt
 JjCcnNjcwmDG+yXjTikUREhOC3Um9bJGb/fmEy/va7/hJxh35Dw04R1KUk7ws93aN4cZVC6u
 jeW54Y741mf4sTZaJ5Mu8LXdG6PGzLWQ7NK2KfOz3cZds6B04=
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40698209"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<ian.jackson@citrix.com>
Subject: [PATCH for-4.15 3/7] CHANGELOG.md: Some additional affordances in various xl subcommands
Date: Thu, 1 Apr 2021 14:38:23 +0100
Message-ID: <20210401133827.362216-3-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401133827.362216-1-george.dunlap@citrix.com>
References: <20210401133827.362216-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
Signed-off-by: Ian Jackson <ian.jackson@citrix.com>
---
CC: Ian Jackson <ian.jackson@citrix.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 086a0e50d0..a12dab1c33 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -25,6 +25,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Factored out HVM-specific shadow code, improving code clarity and reducing the size of PV-only hypervisor builds
  - Added XEN_SCRIPT_DIR configuration option to specify location for Xen scripts, rather than hard-coding /etc/xen/scripts
  - xennet: Documented a way for the backend (or toolstack) to specify MTU to the frontend
+ - Some additional affordances in various xl subcommands.
 
 ### Removed / support downgraded
 
-- 
2.30.2


