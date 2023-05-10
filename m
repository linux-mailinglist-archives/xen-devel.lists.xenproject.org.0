Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0D06FDFEF
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 16:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532849.829201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwkgX-0005ur-Ho; Wed, 10 May 2023 14:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532849.829201; Wed, 10 May 2023 14:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwkgX-0005sI-EI; Wed, 10 May 2023 14:20:53 +0000
Received: by outflank-mailman (input) for mailman id 532849;
 Wed, 10 May 2023 14:20:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9+Fk=A7=bounce.vates.fr=bounce-md_30504962.645ba840.v1-ff8208a920b241e18369e93a82372d38@srs-se1.protection.inumbo.net>)
 id 1pwkgV-00050N-SX
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 14:20:51 +0000
Received: from mail145-2.atl61.mandrillapp.com
 (mail145-2.atl61.mandrillapp.com [198.2.145.2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc518e69-ef3d-11ed-8611-37d641c3527e;
 Wed, 10 May 2023 16:20:49 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-2.atl61.mandrillapp.com (Mailchimp) with ESMTP id 4QGcdD3vF4zQXlPFj
 for <xen-devel@lists.xenproject.org>; Wed, 10 May 2023 14:20:48 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ff8208a920b241e18369e93a82372d38; Wed, 10 May 2023 14:20:48 +0000
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
X-Inumbo-ID: dc518e69-ef3d-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1683728448; x=1683988948; i=yann.dirson@vates.fr;
	bh=ZwL8RO7m/XPAyFca6sOKxBF5d9RSDwmjnqFvJINXGyI=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=lutkl4UF1sjyKfPv3tb8+clPcK7umW8O0rxkERBr5Uu9sLMkTZRRa7SQTLrV0ZJ5b
	 3NDfiH04If4CwUlycWr+J4d6y3dRz4J4+F0bu/8lKQvTbNrO477V0Z2dGxLoIlfT0M
	 EIzH4HwLogCUoksCcML4iXo6V9P+RgebWWLBFaRw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1683728448; h=From : 
 Subject : To : Cc : Message-Id : In-Reply-To : References : Date : 
 MIME-Version : Content-Type : Content-Transfer-Encoding : From : 
 Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=ZwL8RO7m/XPAyFca6sOKxBF5d9RSDwmjnqFvJINXGyI=; 
 b=Z6eABEsqG28450+P64bvOre/1WX7u0ACZAgBxq16N6/VIcxrbxsO20uRKO81ZJj6zRTFqi
 nLCBy20au5vShYLtS2jx6w4bS6ZR7KJP+xJGTPyywCZtAS6rYIUOCVGpGWAfl6sodB9IqpNR
 W1YWYHwVENgQchqPDUnc2UBGCuEtk=
From: Yann Dirson <yann.dirson@vates.fr>
Subject: =?utf-8?Q?[PATCH=203/3]=20libxl:=20create=20~/control/feature-balloon?=
X-Mailer: git-send-email 2.30.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 9664e26d-c55d-4176-ac64-680cfb7c5564
X-Bm-Transport-Timestamp: 1683728447378
To: xen-devel@lists.xenproject.org
Cc: xihuan.yang@citrix.com, min.li1@citrix.com, Yann Dirson <yann.dirson@vates.fr>, zithro <slack@rabbit.lu>
Message-Id: <20230510142011.1120417-4-yann.dirson@vates.fr>
In-Reply-To: <20230510142011.1120417-1-yann.dirson@vates.fr>
References: <20230510142011.1120417-1-yann.dirson@vates.fr>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ff8208a920b241e18369e93a82372d38?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20230510:md
Date: Wed, 10 May 2023 14:20:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Like other feature controls it has to be created by the toolstack before
the guest can advertise the feature.

Reported-by: zithro <slack@rabbit.lu>
Signed-off-by: Yann Dirson <yann.dirson@vates.fr>
---
 tools/libs/light/libxl_create.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index ec8eab02c2..85eccc90cd 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -863,6 +863,9 @@ retry_transaction:
     libxl__xs_mknod(gc, t,
                     GCSPRINTF("%s/control/sysrq", dom_path),
                     rwperm, ARRAY_SIZE(rwperm));
+    libxl__xs_mknod(gc, t,
+                    GCSPRINTF("%s/control/feature-balloon", dom_path),
+                    rwperm, ARRAY_SIZE(rwperm));
 
     libxl__xs_mknod(gc, t,
                     GCSPRINTF("%s/data", dom_path),
-- 
2.30.2



Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions
w: vates.fr | xcp-ng.org | xen-orchestra.com

