Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9077D6FC23D
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 11:02:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532043.828013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwJE5-0001jy-4o; Tue, 09 May 2023 09:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532043.828013; Tue, 09 May 2023 09:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwJE5-0001he-22; Tue, 09 May 2023 09:01:41 +0000
Received: by outflank-mailman (input) for mailman id 532043;
 Tue, 09 May 2023 09:01:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JiHS=A6=bounce.vates.fr=bounce-md_30504962.645a0bf0.v1-623ad5ea264e45fbb42cd0bfa6510f2e@srs-se1.protection.inumbo.net>)
 id 1pwJE3-0001hY-KP
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 09:01:39 +0000
Received: from mail179-5.suw41.mandrillapp.com
 (mail179-5.suw41.mandrillapp.com [198.2.179.5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a60effb-ee48-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 11:01:37 +0200 (CEST)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-5.suw41.mandrillapp.com (Mailchimp) with ESMTP id 4QFsbN1GZszG0CBdJ
 for <xen-devel@lists.xenproject.org>; Tue,  9 May 2023 09:01:36 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 623ad5ea264e45fbb42cd0bfa6510f2e; Tue, 09 May 2023 09:01:36 +0000
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
X-Inumbo-ID: 1a60effb-ee48-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1683622896; x=1683883396; i=yann.dirson@vates.fr;
	bh=8BqKJOEwx5qtlEBsdJyBSQKBsIITldio/65tB71HYkg=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=nEsvgiS4ZVzrK5gVS5VR5zSsuFKqphc4UzRE8FQjBGW+M/KeDbfQRuCux4jCERkRT
	 4c3KpxyyVrB/IHpXpLMV5p9rmUBSFjI7KMJMTpsMjBKCufZzPOHrXkHYNZD2dhQ0k5
	 vBoJYTXifJbmJp+uxePogjBPOH74I9z13Najcruc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1683622896; h=From : 
 Subject : To : Cc : Message-Id : Date : MIME-Version : Content-Type : 
 Content-Transfer-Encoding : From : Subject : Date : X-Mandrill-User : 
 List-Unsubscribe; bh=8BqKJOEwx5qtlEBsdJyBSQKBsIITldio/65tB71HYkg=; 
 b=YlyTa1mPIPqCxh9Eerffl1AkKLmo1rXKoqbRytSM6WSaM8+5+miHOdvMe4ATvCHCan4zt0
 JDGgL7ZgReAfK6KpRhPtU0LRpM4yOLg0aCQVKvolpdfPOZhYn3slA3nHZLKXr8D+QX2J1qhH
 vLsQPe5oFwknyW9UvjMLwr/K87gw4=
From: Yann Dirson <yann.dirson@vates.fr>
Subject: =?utf-8?Q?[PATCH]=20docs/man:=20fix=20xenstore-write=20synopsis?=
X-Mailer: git-send-email 2.30.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 9664e26d-c55d-4176-ac64-680cfb7c5564
X-Bm-Transport-Timestamp: 1683622890131
To: xen-devel@lists.xenproject.org
Cc: Yann Dirson <yann.dirson@vates.fr>, zithro <slack@rabbit.lu>
Message-Id: <20230509090123.781644-1-yann.dirson@vates.fr>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.623ad5ea264e45fbb42cd0bfa6510f2e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20230509:md
Date: Tue, 09 May 2023 09:01:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Reported-by: zithro <slack@rabbit.lu>
Signed-off-by: Yann Dirson <yann.dirson@vates.fr>
---
 docs/man/xenstore-write.1.pod | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/man/xenstore-write.1.pod b/docs/man/xenstore-write.1.pod
index a0b1bca333..74f80f7b1b 100644
--- a/docs/man/xenstore-write.1.pod
+++ b/docs/man/xenstore-write.1.pod
@@ -4,7 +4,7 @@ xenstore-write - write Xenstore values
 
 =head1 SYNOPSIS
 
-B<xenstore-read> [I<OPTION>]... I<PATH> I<VALUE>...
+B<xenstore-write> [I<OPTION>]... I<PATH> I<VALUE>...
 
 =head1 DESCRIPTION
 
-- 
2.30.2



Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions
w: vates.fr | xcp-ng.org | xen-orchestra.com

