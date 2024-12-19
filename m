Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7D29F7872
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 10:27:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860967.1272958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOCo6-0002ee-Nd; Thu, 19 Dec 2024 09:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860967.1272958; Thu, 19 Dec 2024 09:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOCo6-0002cj-J5; Thu, 19 Dec 2024 09:26:58 +0000
Received: by outflank-mailman (input) for mailman id 860967;
 Thu, 19 Dec 2024 09:26:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQ2H=TM=eurecom.fr=ariel.otilibili-anieli@srs-se1.protection.inumbo.net>)
 id 1tOCo5-0002Kr-JV
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 09:26:57 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 640e82b2-bdeb-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 10:26:56 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 19 Dec 2024 10:26:56 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net
 [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id 040812261;
 Thu, 19 Dec 2024 10:26:55 +0100 (CET)
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
X-Inumbo-ID: 640e82b2-bdeb-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734600417; x=1766136417;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2jNfMnSExzRCR4OB6itmTxmQqOry4/XL6zAEczHX97Y=;
  b=z0UujdVwDUvYch3lUOVw7F9d7UdwecwMtyHLw8DlhF7oEuIWu3DzeLms
   Oi0vfdyZYZ6TVJWHluTvndPa/L6qTRGoBfbcXL6UNT1gfl/MZffuo6L8Z
   OE1bXgBl/LDiH9QTMSYu778SHkWqbFCfpxDEe+5wIsR6OSfTo8b18QrNw
   c=;
X-CSE-ConnectionGUID: Inrs7WZ5SRi1wMWtl0LWkw==
X-CSE-MsgGUID: YJsDCe/SSh2uhrdXU3LRWQ==
X-IronPort-AV: E=Sophos;i="6.12,247,1728943200"; 
   d="scan'208";a="28251766"
From: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>
To: linux-kernel@vger.kernel.org
Cc: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/1] lib: Remove dead code
Date: Thu, 19 Dec 2024 10:21:12 +0100
Message-ID: <20241219092615.644642-2-ariel.otilibili-anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241219092615.644642-1-ariel.otilibili-anieli@eurecom.fr>
References: <20241219092615.644642-1-ariel.otilibili-anieli@eurecom.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a follow up from a discussion in Xen:

The if-statement tests `res` is non-zero; meaning the case zero is never reached.

Link: https://lore.kernel.org/all/7587b503-b2ca-4476-8dc9-e9683d4ca5f0@suse.com/
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>
--
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Julien Grall <julien@xen.org>
Cc: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 lib/inflate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/lib/inflate.c b/lib/inflate.c
index fbaf03c1748d..eab886baa1b4 100644
--- a/lib/inflate.c
+++ b/lib/inflate.c
@@ -1257,8 +1257,6 @@ static int INIT gunzip(void)
     /* Decompress */
     if ((res = inflate())) {
 	    switch (res) {
-	    case 0:
-		    break;
 	    case 1:
 		    error("invalid compressed format (err=1)");
 		    break;
-- 
2.47.1


