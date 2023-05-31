Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BA3717D3C
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 12:36:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541715.844741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4JAj-0007nC-L5; Wed, 31 May 2023 10:35:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541715.844741; Wed, 31 May 2023 10:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4JAj-0007kd-Hs; Wed, 31 May 2023 10:35:17 +0000
Received: by outflank-mailman (input) for mailman id 541715;
 Wed, 31 May 2023 10:35:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fDuq=BU=bounce.vates.fr=bounce-md_30504962.647722de.v1-5c5b0ecf977c4fcaa1f18deb54eb672d@srs-se1.protection.inumbo.net>)
 id 1q4JAi-0007jd-3z
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 10:35:16 +0000
Received: from mail135-21.atl141.mandrillapp.com
 (mail135-21.atl141.mandrillapp.com [198.2.135.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d226c6ef-ff9e-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 12:35:12 +0200 (CEST)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-21.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4QWQdB6hWpz1XLF77
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 10:35:10 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5c5b0ecf977c4fcaa1f18deb54eb672d; Wed, 31 May 2023 10:35:10 +0000
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
X-Inumbo-ID: d226c6ef-ff9e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1685529310; x=1685789810; i=yann.dirson@vates.fr;
	bh=wnbQ9exsbh9Kc2yqTPXKL1rlSkUhURrZSz4zCQzH+Vo=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Tx/M6eHwprd474aqgqQ9ume86sYe6l78PoOyZ4I/XUGcP3LdPfGVuLDvcicLbZhlP
	 /YU4rJ+Ggt64IAkk9eYfTxz2NnXIXDzsBxOGywAMuSq3GxdqUrCmtxwJAHpHjfflHR
	 T3hW654L+Y4CvMBUB/d4IaYLt/8l9r2Hktre4abg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1685529310; h=From : 
 Subject : To : Cc : Message-Id : In-Reply-To : References : Date : 
 MIME-Version : Content-Type : Content-Transfer-Encoding : From : 
 Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=wnbQ9exsbh9Kc2yqTPXKL1rlSkUhURrZSz4zCQzH+Vo=; 
 b=aRQ1xCYORgdfXbH8v1OUaaHcsVqG8PygZghA15Ia+qR2S1MJghTdiSo9bOv3ron896AXVQ
 D9d5MjTGpZ94DfUT7F3/J/G5hbfsH5qLk1l8LZ+RWQ9npDMbXn0jFkk7PAQIqstvx+JBPbGq
 nBWFFOR/7i3jKiaR6SOJQ1tR4UOZk=
From: Yann Dirson <yann.dirson@vates.fr>
Subject: =?utf-8?Q?[PATCH=201/1]=20doc:=20clarify=20intended=20usage=20of=20~/control/=20xentore=20path?=
X-Mailer: git-send-email 2.30.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 9f954236-9dc1-4070-9d34-807dea7ccea1
X-Bm-Transport-Timestamp: 1685529309459
To: xen-devel@lists.xenproject.org
Cc: Yann Dirson <yann.dirson@vates.fr>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-Id: <20230531103427.1551719-2-yann.dirson@vates.fr>
In-Reply-To: <20230531103427.1551719-1-yann.dirson@vates.fr>
References: <20230531103427.1551719-1-yann.dirson@vates.fr>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5c5b0ecf977c4fcaa1f18deb54eb672d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20230531:md
Date: Wed, 31 May 2023 10:35:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Yann Dirson <yann.dirson@vates.fr>
---
 docs/misc/xenstore-paths.pandoc | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/docs/misc/xenstore-paths.pandoc b/docs/misc/xenstore-paths.pandoc
index f07ef90f63..5501033893 100644
--- a/docs/misc/xenstore-paths.pandoc
+++ b/docs/misc/xenstore-paths.pandoc
@@ -432,6 +432,35 @@ by udev ("0") or will be run by the toolstack directly ("1").
 
 ### Platform Feature and Control Paths
 
+#### ~/control = "" []
+
+Directory to hold feature and control paths.  This directory is not
+guest-writable, only the toolstack is allowed to create new child
+nodes under this.
+
+Children of this nodes can have one of several types:
+
+* platform features: using name pattern `platform-feature-*`, they may
+  be set by the toolstack to inform the guest, and are not writable by
+  the guest.
+
+* guest features: using name pattern `feature-*`, they may be created
+  by the toolstack with an empty value (`""`), should be set writable
+  by the guest which can then advertize to the toolstack its
+  (non-)usage of the feature with values `"0"` and `"1"` respectively.
+  The lack of update by the guest can be interpreted by the toolstack
+  as the lack of supporting software (PV driver, guest agent, ...) in
+  the guest.
+
+* control nodes: using any name not matching the above pattern, they
+  are used by the toolstack or by the guest to signal a specific
+  condition to the other end, which is expected to watch it to react
+  to changes.
+
+Note: the presence of a control node in itself advertises the
+underlying toolstack feature, it is not necessary to add an extra
+platform-feature for such cases.
+
 #### ~/control/sysrq = (""|COMMAND) [w]
 
 This is the PV SysRq control node. A toolstack can write a single character
-- 
2.30.2



Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions
w: vates.fr | xcp-ng.org | xen-orchestra.com

