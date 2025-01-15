Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F612A12363
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 13:02:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872359.1283321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY25i-00072f-6c; Wed, 15 Jan 2025 12:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872359.1283321; Wed, 15 Jan 2025 12:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY25i-0006ty-16; Wed, 15 Jan 2025 12:01:46 +0000
Received: by outflank-mailman (input) for mailman id 872359;
 Wed, 15 Jan 2025 12:01:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=upcn=UH=bounce.vates.tech=bounce-md_30504962.6787a3a4.v1-a36f03077cb44856beaf73225104620f@srs-se1.protection.inumbo.net>)
 id 1tY25g-0006sC-Ak
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 12:01:44 +0000
Received: from mail128-16.atl41.mandrillapp.com
 (mail128-16.atl41.mandrillapp.com [198.2.128.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bdbe9bc-d338-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 13:01:42 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-16.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4YY4NN5TR7zRKLkSQ
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 12:01:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a36f03077cb44856beaf73225104620f; Wed, 15 Jan 2025 12:01:40 +0000
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
X-Inumbo-ID: 7bdbe9bc-d338-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1736942500; x=1737203000;
	bh=Db/LuC4xapSUnG1ySxTlxVaodR1FXGRDI/gyqoUcYJg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VZHBEuProRzYC2QYTcXH+HHo7NwPzXVj9CuxOuSAnmyMxbawdk+UeIVKB1wz9ajCB
	 w11bOJUYZwfPTGw/YPYHzkYWHazSRcbux8Wap3CZuSyw8iFJ3yicKjpHhQhwOLduEP
	 jpaXoAne/rUxZl3q3lhZLkF7rcI+5Z0mGsWsr2bSqyZOqUg73sWiGmbhN73IUVT7aa
	 hbiVhE4xChYKdIl5tRrTd69P679hGyKRk+G3zWuBmHclW/X1qpEqm6Wk/13bIH0f1z
	 +n2d+y2C0qGz8wj5Je66ARrQNxHzz6LNBJUCcpZLOdbNZb+zbed8ei/Kl8LqzgsEa6
	 2MQRk9v0TdE/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1736942500; x=1737203000; i=yann.dirson@vates.tech;
	bh=Db/LuC4xapSUnG1ySxTlxVaodR1FXGRDI/gyqoUcYJg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=eoSdnuly8aFsDQF7mq5BYEmJDw0iZ7uk8GGaPApZ2p4SsBOY/RFaWqC1qIQhOBGrK
	 5nh2YN89ZYdWuP9OT7+7fw0hc9+NTSCLGQehyXiHyLLKeYXGcLIO6WhJE54hwuDq69
	 s87qnsFX8OwfQCmK1o79OrM0XtNLPEViHJ3kSMaYlATjN7An7NJy4Ju0jVds2R3/Sx
	 w2Yj/94b9BaQ7WhElKjuAsNUHvzB4mC9An1KTO8kKyklrQpr3+QgqxR+9RIuz35aGw
	 UcGNXoZctrraPeLpHJtLSVV2nPwMM22Sog9ZkZoozhSBm7keuZgWCu+5aQv32JHnHx
	 DaYg1oAz9Z9Gg==
From: "Yann Dirson" <yann.dirson@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=201/2]=20docs/sphinx:=20import=20sys=20for=20error=20reporting?=
X-Mailer: git-send-email 2.39.5
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1736942499555
To: xen-devel@lists.xenproject.org
Cc: "Yann Dirson" <yann.dirson@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <4b7de1b9a5b0eec8cb1803e59b0027092c43c126.1736941628.git.yann.dirson@vates.tech>
In-Reply-To: <cover.1736941628.git.yann.dirson@vates.tech>
References: <cover.1736941628.git.yann.dirson@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a36f03077cb44856beaf73225104620f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250115:md
Date: Wed, 15 Jan 2025 12:01:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Yann Dirson <yann.dirson@vates.tech>
---
 docs/conf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/conf.py b/docs/conf.py
index 5d2e979449..84bec024e7 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -21,6 +21,7 @@
 # https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information
 
 import sphinx
+import sys
 
 project = u'Xen'
 copyright = u'2019-%Y, The Xen development community'
-- 
2.39.5



Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

