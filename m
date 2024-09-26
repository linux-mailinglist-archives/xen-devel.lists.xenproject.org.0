Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C729873E1
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 14:54:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805430.1216523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sto0J-00013M-Dy; Thu, 26 Sep 2024 12:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805430.1216523; Thu, 26 Sep 2024 12:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sto0J-0000yn-7L; Thu, 26 Sep 2024 12:53:55 +0000
Received: by outflank-mailman (input) for mailman id 805430;
 Thu, 26 Sep 2024 12:53:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RFVp=QY=bounce.vates.tech=bounce-md_30504962.66f5595e.v1-7a9d2d34a38545abbe55566e732f249d@srs-se1.protection.inumbo.net>)
 id 1sto0H-0000wb-IU
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 12:53:53 +0000
Received: from mail180-17.suw31.mandrillapp.com
 (mail180-17.suw31.mandrillapp.com [198.2.180.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6198e9a8-7c06-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 14:53:52 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-17.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4XDtnp32StzRKMbZC
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 12:53:50 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7a9d2d34a38545abbe55566e732f249d; Thu, 26 Sep 2024 12:53:50 +0000
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
X-Inumbo-ID: 6198e9a8-7c06-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1727355230; x=1727615730;
	bh=dqVOEUMEgLvoqekBnl/uiNPh+iS1Y+lnSegp5okDHEQ=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WKIzlhWkdonUPuTKW/d8p6Y3Cu3w6l0gRvEAE4p9tejFwG4XakrFX1k9F4YocjaJC
	 lvcXtwA7DU7IpLVfvW1z9V4A3DssglXfs3i0h5gyq60VHYeepm0RSJl2ID/xVeybiU
	 /q2SUxLdf7uSPMDveS0827Kz2XSyYmqqgEpc/xqwCbVE1v51R/XAkI+xpRLamFhab0
	 TauxCdJ8cWdUi4V4g7Zt1GQE+IexJ5CXolXkXaVSl4TdrEVNAh1sJkGh6ekLh0Z78W
	 8yn9hqwG13/Jm2KKRJ6Q//5e8kc3rrmqNfh6Xh9JHRMPUdUSJPpNKWKh0foosemnUg
	 CsiA9kDurk0WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1727355230; x=1727615730; i=anthony.perard@vates.tech;
	bh=dqVOEUMEgLvoqekBnl/uiNPh+iS1Y+lnSegp5okDHEQ=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jT/fW5mRCrNGBBs7CUPuDGMfgYk7R8W9MLpzzoxJZl8Nb4RLoPTpfl9Ok4wEC+ZMw
	 +h3+wZ3TPN66IUwOPn0X5B2lTmEgfFvMMEeLOJu1a0E2miIlnKkEDGg1Y4WVCRbLMH
	 HkkqWbNpc7QUJMcw+wmUWVNMZWGw1fRRML9nKt+Irj2+Cq4D99fV5n/4nJ6Nz2fhjl
	 u4oqw88AVhN9dYBgtx2rO8IWCE5+r1IkKT0y9jlMKlmqbMUunDelUSBunFi/qSsSX4
	 oFaKUtOTNmGHBieQNimWfst9k/7tnF5nZmE8osyEFDYFWk2ri5+P73chyZK0IW/j0A
	 CKi66R3rFUO+A==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=202/2]=20blkif:=20Fix=20a=20couple=20of=20typos?=
X-Mailer: git-send-email 2.39.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1727355229754
To: xen-devel@lists.xenproject.org
Cc: =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Message-Id: <20240926125347.23738-3-anthony.perard@vates.tech>
In-Reply-To: <20240926125347.23738-1-anthony.perard@vates.tech>
References: <20240926125347.23738-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7a9d2d34a38545abbe55566e732f249d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240926:md
Date: Thu, 26 Sep 2024 12:53:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Those where fixed in OVMF's copy. (And one of them fixed in QEMU's
copy but later discarded by an update.)

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 xen/include/public/io/blkif.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/public/io/blkif.h b/xen/include/public/io/blkif.h
index 789bab65ab..8407453324 100644
--- a/xen/include/public/io/blkif.h
+++ b/xen/include/public/io/blkif.h
@@ -42,7 +42,7 @@
  * All data in the XenStore is stored as strings.  Nodes specifying numeric
  * values are encoded in decimal.  Integer value ranges listed below are
  * expressed as fixed sized integer types capable of storing the conversion
- * of a properly formated node string, without loss of information.
+ * of a properly formatted node string, without loss of information.
  *
  * Any specified default value is in effect if the corresponding XenBus node
  * is not present in the XenStore.
@@ -328,7 +328,7 @@
  *      access (even when it should be read-only). If the frontend hits the
  *      maximum number of allowed persistently mapped grants, it can fallback
  *      to non persistent mode. This will cause a performance degradation,
- *      since the the backend driver will still try to map those grants
+ *      since the backend driver will still try to map those grants
  *      persistently. Since the persistent grants protocol is compatible with
  *      the previous protocol, a frontend driver can choose to work in
  *      persistent mode even when the backend doesn't support it.
-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

