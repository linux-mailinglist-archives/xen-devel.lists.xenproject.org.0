Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B06D4F7EB7
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 14:06:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300745.513053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncQuP-0007wD-3M; Thu, 07 Apr 2022 12:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300745.513053; Thu, 07 Apr 2022 12:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncQuO-0007tK-W4; Thu, 07 Apr 2022 12:06:40 +0000
Received: by outflank-mailman (input) for mailman id 300745;
 Thu, 07 Apr 2022 12:06:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mzit=UR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ncQuN-0007tE-Uw
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 12:06:39 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b6b0a45-b66b-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 14:06:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C4B5F1F85A;
 Thu,  7 Apr 2022 12:06:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 851E113485;
 Thu,  7 Apr 2022 12:06:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1/lNH87TTmIFBQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 07 Apr 2022 12:06:38 +0000
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
X-Inumbo-ID: 2b6b0a45-b66b-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1649333198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UpuTzjjU3dwrDNlWUgU1m4VL7JE5wjWtlut0wOZ6+Us=;
	b=bamm/WXnOVYE8ZOho6XQUe7FCEZovOUuJfhlzWNhhXeUA04h7c/K9EahBbNmRzY3a1B0GV
	PYCeX6iSGlyPLVgg+TcAICaXy7ccBN1LFAaAz/36KVQU1wVrrWfK5NFQkqu3UV7fDyUDHl
	I7ddY451v2TFm/p8DP18Y42M5VrwxQE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	stable@vger.kernel.org,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v2] mm, page_alloc: fix build_zonerefs_node()
Date: Thu,  7 Apr 2022 14:06:37 +0200
Message-Id: <20220407120637.9035-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit 6aa303defb74 ("mm, vmscan: only allocate and reclaim from
zones with pages managed by the buddy allocator") only zones with free
memory are included in a built zonelist. This is problematic when e.g.
all memory of a zone has been ballooned out when zonelists are being
rebuilt.

The decision whether to rebuild the zonelists when onlining new memory
is done based on populated_zone() returning 0 for the zone the memory
will be added to. The new zone is added to the zonelists only, if it
has free memory pages (managed_zone() returns a non-zero value) after
the memory has been onlined. This implies, that onlining memory will
always free the added pages to the allocator immediately, but this is
not true in all cases: when e.g. running as a Xen guest the onlined
new memory will be added only to the ballooned memory list, it will be
freed only when the guest is being ballooned up afterwards.

Another problem with using managed_zone() for the decision whether a
zone is being added to the zonelists is, that a zone with all memory
used will in fact be removed from all zonelists in case the zonelists
happen to be rebuilt.

Use populated_zone() when building a zonelist as it has been done
before that commit.

Cc: stable@vger.kernel.org
Fixes: 6aa303defb74 ("mm, vmscan: only allocate and reclaim from zones with pages managed by the buddy allocator")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Michal Hocko <mhocko@suse.com>
---
V2:
- updated commit message (Michal Hocko)
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


