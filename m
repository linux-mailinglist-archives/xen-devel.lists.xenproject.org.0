Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 155499873E3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 14:54:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805431.1216529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sto0J-0001Aa-Mo; Thu, 26 Sep 2024 12:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805431.1216529; Thu, 26 Sep 2024 12:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sto0J-00013H-GE; Thu, 26 Sep 2024 12:53:55 +0000
Received: by outflank-mailman (input) for mailman id 805431;
 Thu, 26 Sep 2024 12:53:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Hhf=QY=bounce.vates.tech=bounce-md_30504962.66f5595e.v1-fe2bd7a58ced47f285932fb5db668bcf@srs-se1.protection.inumbo.net>)
 id 1sto0H-0000wg-Mu
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 12:53:53 +0000
Received: from mail137-23.atl71.mandrillapp.com
 (mail137-23.atl71.mandrillapp.com [198.2.137.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60ac2c48-7c06-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 14:53:51 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-23.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4XDtnp20TWz1XLGNW
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 12:53:50 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fe2bd7a58ced47f285932fb5db668bcf; Thu, 26 Sep 2024 12:53:50 +0000
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
X-Inumbo-ID: 60ac2c48-7c06-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1727355230; x=1727615730;
	bh=bqBQgdFu7ue35t1gEEJMNLjaBSVlQaaf2h4TrHlMzIA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=nFjDeqALLCe4hlD+f1a6Gu+hEzOpHcXdo87mcv9WSYOAbJq2MTvnCAViCVqL8ELeL
	 uDu1i97IH3Kown/JSCfcxZE908ZJMr8H3jcI722ufU9vNQWBCNjJ6dIt+uz95NPKhi
	 EK/33yBaA970PVUag4ZBL2YYhjGjMSK4F9QmlZz8XxdJQ/s0cmE/1RqxWYpeyJwtnn
	 wcXrhMmGTz0MAh7LeLq8SbnZ7T8oeY912DpUu9Y0dGKNX7XN3pB3uvj0D3g7+QqFzs
	 +OkwnDEmp8XwMM8b3tvM2aMzzBS83n1fXPmg3mw8odjzgK/swNKr/Ql1esi4O3QWms
	 uWFb21ZS9aFiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1727355230; x=1727615730; i=anthony.perard@vates.tech;
	bh=bqBQgdFu7ue35t1gEEJMNLjaBSVlQaaf2h4TrHlMzIA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ihqwDZRbi47tsDpw7XvJNeN2Pd7/XQ7PGDRVG5KoVrZhXfyxcDhnuOyjdYnCEiVBm
	 DiRbYR3gPaPkaKVa2tZa5I8vSuQkLKgVvW9zzrn/7yS8vUdxo7JxckTrVXimKGY72p
	 oZEUuKzLbCI1ZtePe2RAmFKVmmdEsmV/ET5EgZHQE/LWYzozEbVMeXUFrQEB6tIpBC
	 pHxji9Hy5Sy7ff3aFHs+Gbrppz4plJ8hZugreZVm+F3lEjS/gGgGbNiPba+M1neTjW
	 BL3i7mZiVd7sJgm6loXsRKNgEusvVodqgCJg9zZk9ZFJy6IZaXTRmBmX7EwbNNuWwP
	 BMRmuArHw4ykA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=201/2]=20blkif:=20Fix=20alignment=20description=20for=20discard=20request?=
X-Mailer: git-send-email 2.39.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1727355229388
To: xen-devel@lists.xenproject.org
Cc: =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Message-Id: <20240926125347.23738-2-anthony.perard@vates.tech>
In-Reply-To: <20240926125347.23738-1-anthony.perard@vates.tech>
References: <20240926125347.23738-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fe2bd7a58ced47f285932fb5db668bcf?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240926:md
Date: Thu, 26 Sep 2024 12:53:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

The discard feature have an other xenstore node to described the size
of the blocks than can be discarded, "discard-granularity", which
default to "sector-size" when absent as noted in the properties and in
note 4. So discard request should be aligned on this value.

Fixes: 221f2748e8da ("blkif: reconcile protocol specification with in-use implementations")
Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 xen/include/public/io/blkif.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/public/io/blkif.h b/xen/include/public/io/blkif.h
index 9b00d633d3..789bab65ab 100644
--- a/xen/include/public/io/blkif.h
+++ b/xen/include/public/io/blkif.h
@@ -668,7 +668,7 @@ typedef struct blkif_request blkif_request_t;
  *
  * The 'sector_number' field is in units of 512b, despite the value of the
  * 'sector-size' xenstore node.  Note however that the offset in
- * 'sector_number' must be aligned to 'sector-size'.
+ * 'sector_number' must be aligned to 'discard-granularity'.
  */
 struct blkif_request_discard {
     uint8_t        operation;    /* BLKIF_OP_DISCARD                     */
-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

