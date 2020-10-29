Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6819729F2D8
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:20:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14414.35623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBb5-0003RO-S6; Thu, 29 Oct 2020 17:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14414.35623; Thu, 29 Oct 2020 17:20:23 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBb5-0003Qp-Lr; Thu, 29 Oct 2020 17:20:23 +0000
Received: by outflank-mailman (input) for mailman id 14414;
 Thu, 29 Oct 2020 17:20:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kYBb3-0003MC-L3
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:21 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.167])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2ded997-a0ba-499a-9121-66cb54d56275;
 Thu, 29 Oct 2020 17:20:16 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
 with ESMTPSA id j0b1afw9THK93f8
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 29 Oct 2020 18:20:09 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kYBb3-0003MC-L3
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:21 +0000
X-Inumbo-ID: f2ded997-a0ba-499a-9121-66cb54d56275
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.167])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f2ded997-a0ba-499a-9121-66cb54d56275;
	Thu, 29 Oct 2020 17:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603992015;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=nOFtdNXlk5HjYyxO1mkGMNqJ+Z1za/MxmXOScJ0HbPg=;
	b=K1on7XABhOD58zqU8Not3Jy8NtNKHxa7+wF/7CEvBGy0Xy50gVK77PKerWSLzU+So9
	mHzWJMuN/kN5RrPggT/TH/mZQ78+ern0VAvdGZWDY5IV2fvDrTAiXfwrrrdlvJlujlkQ
	eT8gpkyVPxNJNNRtQ+oMeJ36NHmS8EdXyNfwXvOMgR62w+fQza04ErpoIRIIAk1QJRsl
	pSXi1Id9jJK4NCWJkSJ6MXk+OpskfrVo8RhyfN0NObP4+mmVnQ1nxapFNmnWLcgw/FM4
	ehXSuTwR0ESHiKYrC3itFRjbE8b1pCFsQbUN1vauqXrs5pgQ1LUJTUosAD3b7q/8FUrR
	fr3A==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
	with ESMTPSA id j0b1afw9THK93f8
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Thu, 29 Oct 2020 18:20:09 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 03/23] tools: use xc_is_known_page_type
Date: Thu, 29 Oct 2020 18:19:43 +0100
Message-Id: <20201029172004.17219-4-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029172004.17219-1-olaf@aepfle.de>
References: <20201029172004.17219-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify pfn type on sending side, also verify incoming batch of pfns.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_restore.c | 3 +--
 tools/libs/guest/xg_sr_save.c    | 6 ++++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index b57a787519..f1c3169229 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -406,8 +406,7 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         }
 
         type = (pages->pfn[i] & PAGE_DATA_TYPE_MASK) >> 32;
-        if ( ((type >> XEN_DOMCTL_PFINFO_LTAB_SHIFT) >= 5) &&
-             ((type >> XEN_DOMCTL_PFINFO_LTAB_SHIFT) <= 8) )
+        if ( xc_is_known_page_type(type) == false )
         {
             ERROR("Invalid type %#"PRIx32" for pfn %#"PRIpfn" (index %u)",
                   type, pfn, i);
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 2ba7c3200c..044d0ae3aa 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -147,6 +147,12 @@ static int write_batch(struct xc_sr_context *ctx)
 
     for ( i = 0; i < nr_pfns; ++i )
     {
+        if ( xc_is_known_page_type(types[i]) == false )
+        {
+            ERROR("Wrong type %#"PRIpfn" for pfn %#"PRIpfn, types[i], mfns[i]);
+            goto err;
+        }
+
         switch ( types[i] )
         {
         case XEN_DOMCTL_PFINFO_BROKEN:

