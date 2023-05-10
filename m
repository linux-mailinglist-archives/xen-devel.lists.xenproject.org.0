Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 966766FDFEB
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 16:21:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532848.829192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwkgW-0005f6-At; Wed, 10 May 2023 14:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532848.829192; Wed, 10 May 2023 14:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwkgW-0005bj-6v; Wed, 10 May 2023 14:20:52 +0000
Received: by outflank-mailman (input) for mailman id 532848;
 Wed, 10 May 2023 14:20:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pRsz=A7=bounce.vates.fr=bounce-md_30504962.645ba840.v1-79b70f81d945472da965fc1d3c800edb@srs-se1.protection.inumbo.net>)
 id 1pwkgU-00050N-SL
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 14:20:50 +0000
Received: from mail179-5.suw41.mandrillapp.com
 (mail179-5.suw41.mandrillapp.com [198.2.179.5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc275159-ef3d-11ed-8611-37d641c3527e;
 Wed, 10 May 2023 16:20:49 +0200 (CEST)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-5.suw41.mandrillapp.com (Mailchimp) with ESMTP id 4QGcdD1wztzG0CPF8
 for <xen-devel@lists.xenproject.org>; Wed, 10 May 2023 14:20:48 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 79b70f81d945472da965fc1d3c800edb; Wed, 10 May 2023 14:20:48 +0000
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
X-Inumbo-ID: dc275159-ef3d-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1683728448; x=1683988948; i=yann.dirson@vates.fr;
	bh=zh8bKuTJDXhG/twy2I/iCoJrgotk0dfjxsaWcv5SUiY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=con50Mxc/lRoi20nT7KPR1TmqwK4XIu8wlbc9wkoVawOg4ybxoor6ylrPCfzDUKWe
	 8CTw+fAMTOY9Xckla4nxmyNgiIhjJu3zXcmJl9cwTnj9YHiW39WbvvsGuJ1Pq4CoJb
	 L20kIEoh1uSrjbcvX/3ZtaC53cDc2v/qCbm7qaBw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1683728448; h=From : 
 Subject : To : Cc : Message-Id : In-Reply-To : References : Date : 
 MIME-Version : Content-Type : Content-Transfer-Encoding : From : 
 Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=zh8bKuTJDXhG/twy2I/iCoJrgotk0dfjxsaWcv5SUiY=; 
 b=N3FXD+417OnrqbjigIfwiEMoA7Ugbz0IAVTDbXhkRzJ6X5h0KekRvP9oZ/ddJ4SDC6bg7o
 v+eAcmKSEIRBNEaydIpQUbVCpclEQH1G2ErQbxSowgusidN4C46/J/d2cOXGA7jYL8ns6tSy
 3JsIDF4kMeBW8QSRfcbywZ3PLXVhk=
From: Yann Dirson <yann.dirson@vates.fr>
Subject: =?utf-8?Q?[PATCH=202/3]=20docs:=20document=20~/control/feature-balloon?=
X-Mailer: git-send-email 2.30.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 9664e26d-c55d-4176-ac64-680cfb7c5564
X-Bm-Transport-Timestamp: 1683728444990
To: xen-devel@lists.xenproject.org
Cc: xihuan.yang@citrix.com, min.li1@citrix.com, Yann Dirson <yann.dirson@vates.fr>
Message-Id: <20230510142011.1120417-3-yann.dirson@vates.fr>
In-Reply-To: <20230510142011.1120417-1-yann.dirson@vates.fr>
References: <20230510142011.1120417-1-yann.dirson@vates.fr>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.79b70f81d945472da965fc1d3c800edb?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20230510:md
Date: Wed, 10 May 2023 14:20:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This flag has been in use by XAPI for a long time (was present at creation
of the github xen-api/squeezed repo in 2013), and could be used by other
toolstacks.

Signed-off-by: Yann Dirson <yann.dirson@vates.fr>
---
 docs/misc/xenstore-paths.pandoc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/misc/xenstore-paths.pandoc b/docs/misc/xenstore-paths.pandoc
index a604f6b1c6..6c4e2c3da2 100644
--- a/docs/misc/xenstore-paths.pandoc
+++ b/docs/misc/xenstore-paths.pandoc
@@ -509,6 +509,12 @@ This may be initialized to "" by the toolstack and may then be set
 to 0 or 1 by a guest to indicate whether it is capable of responding
 to a mode value written to ~/control/laptop-slate-mode.
 
+#### ~/control/feature-balloon
+
+This may be initialized to "" by the toolstack and may then be set to
+0 or 1 by a guest to indicate whether it is capable of memory
+ballooning, and responds to values written to ~/memory/target.
+
 ### Domain Controlled Paths
 
 #### ~/data/* [w]
-- 
2.30.2



Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions
w: vates.fr | xcp-ng.org | xen-orchestra.com

