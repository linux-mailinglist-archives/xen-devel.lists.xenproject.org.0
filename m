Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937A36FDFEC
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 16:21:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532845.829171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwkgQ-000531-Oe; Wed, 10 May 2023 14:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532845.829171; Wed, 10 May 2023 14:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwkgQ-00051K-L8; Wed, 10 May 2023 14:20:46 +0000
Received: by outflank-mailman (input) for mailman id 532845;
 Wed, 10 May 2023 14:20:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2wMR=A7=bounce.vates.fr=bounce-md_30504962.645ba838.v1-8c1a117748d2476faf56e5359e5ae519@srs-se1.protection.inumbo.net>)
 id 1pwkgP-00050N-AB
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 14:20:45 +0000
Received: from mail179-5.suw41.mandrillapp.com
 (mail179-5.suw41.mandrillapp.com [198.2.179.5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7b18ecc-ef3d-11ed-8611-37d641c3527e;
 Wed, 10 May 2023 16:20:41 +0200 (CEST)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-5.suw41.mandrillapp.com (Mailchimp) with ESMTP id 4QGcd43JjKzG0CNqp
 for <xen-devel@lists.xenproject.org>; Wed, 10 May 2023 14:20:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8c1a117748d2476faf56e5359e5ae519; Wed, 10 May 2023 14:20:40 +0000
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
X-Inumbo-ID: d7b18ecc-ef3d-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1683728440; x=1683988940; i=yann.dirson@vates.fr;
	bh=AKM5zlXqg5wAV/fR8iZ6sMC6JAr9mU0kItj363ZI22Y=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=FRzrsj/K84wL8v7PuGRvopKfuePCYePd8Pms/aogvM+dNbxvyByJcJzGNd4Cz2Q0z
	 RjE7gpPaioz1hjTYaXaHqgZ4Lni07XN2gAkRpxjBP3MTkUO9C15IAcBk62Fk9H6bPo
	 CBsx3afMj4noCWrjkoR+XL5Z5VlFpPw7Z27LaVgI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1683728440; h=From : 
 Subject : To : Cc : Message-Id : Date : MIME-Version : Content-Type : 
 Content-Transfer-Encoding : From : Subject : Date : X-Mandrill-User : 
 List-Unsubscribe; bh=AKM5zlXqg5wAV/fR8iZ6sMC6JAr9mU0kItj363ZI22Y=; 
 b=IV+jiBcv2wMmTcLKczq8UJK9aOCy0OPzjZ3SSgdxEQwM5LX7YNR0SUn3ZcjOefNBAXJyHX
 ESZIxExkEHcujaTRT4UxE3hB9hPR+IuoUHejZt36TNvmL5GJb4e35gTp/ohmXKPk3S184VmB
 SsdDaz6h8wMUCnrk6LmKQxvdJAJkw=
From: Yann Dirson <yann.dirson@vates.fr>
Subject: =?utf-8?Q?[PATCH=200/3]=20officializing=20xenstore=20control/feature-balloon=20entry?=
X-Mailer: git-send-email 2.30.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 9664e26d-c55d-4176-ac64-680cfb7c5564
X-Bm-Transport-Timestamp: 1683728433184
To: xen-devel@lists.xenproject.org
Cc: xihuan.yang@citrix.com, min.li1@citrix.com, Yann Dirson <yann.dirson@vates.fr>
Message-Id: <20230510142011.1120417-1-yann.dirson@vates.fr>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8c1a117748d2476faf56e5359e5ae519?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20230510:md
Date: Wed, 10 May 2023 14:20:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

The main topic of this patch series is the ~/control/feature-balloon
entry used by XAPI, prompted by the report of xe-guest-utilities on
FreeBSD not being able to report the feature when using just libxl on
the host.

First patch is a bit off-topic, but included here because it fixes the
text from which this feature description was adapted from.

Yann Dirson (3):
  docs: fix complex-and-wrong xenstore-path wording
  docs: document ~/control/feature-balloon
  libxl: create ~/control/feature-balloon

 docs/misc/xenstore-paths.pandoc | 16 ++++++++++------
 tools/libs/light/libxl_create.c |  3 +++
 2 files changed, 13 insertions(+), 6 deletions(-)

-- 
2.30.2



Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions
w: vates.fr | xcp-ng.org | xen-orchestra.com

