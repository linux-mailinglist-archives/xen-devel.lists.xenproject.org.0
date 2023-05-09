Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EE26FC3D7
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 12:25:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532076.828073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwKXA-0004av-Eh; Tue, 09 May 2023 10:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532076.828073; Tue, 09 May 2023 10:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwKXA-0004YW-BU; Tue, 09 May 2023 10:25:28 +0000
Received: by outflank-mailman (input) for mailman id 532076;
 Tue, 09 May 2023 10:25:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AIFU=A6=bounce.vates.fr=bounce-md_30504962.645a1f94.v1-67242cc3dadc44398b471f4dc25777c8@srs-se1.protection.inumbo.net>)
 id 1pwKX8-0004YQ-V1
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 10:25:26 +0000
Received: from mail179-5.suw41.mandrillapp.com
 (mail179-5.suw41.mandrillapp.com [198.2.179.5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf638322-ee53-11ed-b227-6b7b168915f2;
 Tue, 09 May 2023 12:25:25 +0200 (CEST)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-5.suw41.mandrillapp.com (Mailchimp) with ESMTP id 4QFvS42JdwzG0CJ84
 for <xen-devel@lists.xenproject.org>; Tue,  9 May 2023 10:25:24 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 67242cc3dadc44398b471f4dc25777c8; Tue, 09 May 2023 10:25:24 +0000
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
X-Inumbo-ID: cf638322-ee53-11ed-b227-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1683627924; x=1683888424; i=yann.dirson@vates.fr;
	bh=jZBGOSIKAnJ70t9c/PMfJzw/jtihIdrFNC/Fnqahdbc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=EMSyVIedVVN7Eda7PMCE6Z2miqoxqF7VWhhsvkTqx9CRmv/LJ+koLE4sFprBbLGbE
	 N+M+qLE7kh7qpuMN7q18E89BYw1p6cIaRQzTw4HHuU5SL87fjF0RyHgfq/2BH3MVvs
	 szXHl4alDd7yrLeI5gy5QFMbSVbRvaSBA7GBstOM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1683627924; h=From : 
 Subject : To : Cc : Message-Id : Date : MIME-Version : Content-Type : 
 Content-Transfer-Encoding : From : Subject : Date : X-Mandrill-User : 
 List-Unsubscribe; bh=jZBGOSIKAnJ70t9c/PMfJzw/jtihIdrFNC/Fnqahdbc=; 
 b=dutfCRvY5Ttryc0iL2/M+ohVIHq5qAV06PSoEAfksB2gV5ntY+M4SEgE2gyQZWiHPj1H/o
 tY+FsrEP9+h1pOl9EHnDwDQmz5ewjC2LZkuuEhXLkS3MWlnlOAbipQ/9kVHw/D+CmQmPhpkA
 MEpNeKxTS5alCb26w+P5yDif0aLZU=
From: Yann Dirson <yann.dirson@vates.fr>
Subject: =?utf-8?Q?[PATCH]=20docs:=20fix=20xenstore-paths=20doc=20structure?=
X-Mailer: git-send-email 2.30.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 9664e26d-c55d-4176-ac64-680cfb7c5564
X-Bm-Transport-Timestamp: 1683627922056
To: xen-devel@lists.xenproject.org
Cc: Yann Dirson <yann.dirson@vates.fr>
Message-Id: <20230509102455.813997-1-yann.dirson@vates.fr>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.67242cc3dadc44398b471f4dc25777c8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20230509:md
Date: Tue, 09 May 2023 10:25:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

We currently have "Per Domain Paths" as an empty section, whereas it
looks like "General Paths" was not indended to include all the
following sections.

Signed-off-by: Yann Dirson <yann.dirson@vates.fr>
---
 docs/misc/xenstore-paths.pandoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/misc/xenstore-paths.pandoc b/docs/misc/xenstore-paths.pandoc
index bffb8ea544..f07ef90f63 100644
--- a/docs/misc/xenstore-paths.pandoc
+++ b/docs/misc/xenstore-paths.pandoc
@@ -129,7 +129,7 @@ create writable subdirectories as necessary.
 
 ## Per Domain Paths
 
-## General Paths
+### General Paths
 
 #### ~/vm = PATH []
 
-- 
2.30.2



Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions
w: vates.fr | xcp-ng.org | xen-orchestra.com

