Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774DE4F7BB4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 11:32:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300572.512766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncOV7-0000ri-SA; Thu, 07 Apr 2022 09:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300572.512766; Thu, 07 Apr 2022 09:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncOV7-0000pt-P4; Thu, 07 Apr 2022 09:32:25 +0000
Received: by outflank-mailman (input) for mailman id 300572;
 Thu, 07 Apr 2022 09:32:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mzit=UR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ncOV7-0000pn-1f
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 09:32:25 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a180c455-b655-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 11:32:24 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 94A37212C2;
 Thu,  7 Apr 2022 09:32:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5B6E913A66;
 Thu,  7 Apr 2022 09:32:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5vzuFKevTmJVLgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 07 Apr 2022 09:32:23 +0000
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
X-Inumbo-ID: a180c455-b655-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1649323943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iMz/fVk+XpC4IDojCtgZdhSbgaH5sJ66FU6YyYC0dAU=;
	b=srp3svmAJ66vDcJogBKiIGdVGuq5CEJs6NzN+Dq5b4+v+huIvNyS5C2rdiaVbhfch0DbrT
	75BoiGD0hZpc6CLImwmff34i2BgedTfCkHnIdUGSlX2blYRSglJ9ApB8mrYmE1yFAMAhOC
	HK7B66ciQOpkaSSp/7AQBiyKBcgA1u8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	stable@vger.kernel.org,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] mm, page_alloc: fix build_zonerefs_node()
Date: Thu,  7 Apr 2022 11:32:21 +0200
Message-Id: <20220407093221.1090-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit 9d3be21bf9c0 ("mm, page_alloc: simplify zonelist
initialization") only zones with free memory are included in a built
zonelist. This is problematic when e.g. all memory of a zone has been
ballooned out.

Use populated_zone() when building a zonelist as it has been done
before that commit.

Cc: stable@vger.kernel.org
Fixes: 9d3be21bf9c0 ("mm, page_alloc: simplify zonelist initialization")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 mm/page_alloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index bdc8f60ae462..3d0662af3289 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6128,7 +6128,7 @@ static int build_zonerefs_node(pg_data_t *pgdat, struct zoneref *zonerefs)
 	do {
 		zone_type--;
 		zone = pgdat->node_zones + zone_type;
-		if (managed_zone(zone)) {
+		if (populated_zone(zone)) {
 			zoneref_set_zone(zone, &zonerefs[nr_zones++]);
 			check_highest_zone(zone_type);
 		}
-- 
2.34.1


