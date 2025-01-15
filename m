Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A6FA123BA
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 13:28:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872440.1283409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY2V7-0006mo-4e; Wed, 15 Jan 2025 12:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872440.1283409; Wed, 15 Jan 2025 12:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY2V7-0006gt-0E; Wed, 15 Jan 2025 12:28:01 +0000
Received: by outflank-mailman (input) for mailman id 872440;
 Wed, 15 Jan 2025 12:27:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sIR8=UH=bounce.vates.tech=bounce-md_30504962.6787a9cc.v1-44f8893ad68c486d8daeed9e3a93f6d1@srs-se1.protection.inumbo.net>)
 id 1tY2V5-0006fA-Qi
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 12:27:59 +0000
Received: from mail128-16.atl41.mandrillapp.com
 (mail128-16.atl41.mandrillapp.com [198.2.128.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26681694-d33c-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 13:27:57 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-16.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4YY4yh34dlzRKLfRQ
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 12:27:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 44f8893ad68c486d8daeed9e3a93f6d1; Wed, 15 Jan 2025 12:27:56 +0000
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
X-Inumbo-ID: 26681694-d33c-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1736944076; x=1737204576;
	bh=Se/x1iatsUypc3gc3kN2O/xnGmWhnUx/0YvOnWGnfFE=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=ya1P6DKPrJE4tpEYhIpIShHEwXOD4jENg4GIgHY+uunCMJ3PLd3DC4fSdF7zZrZt8
	 k2Y53a3Qy2ml94ou2+e6sRxuWjBfP2sxMTdnS7rU8HscfAfu/eEv2V/te8eu+T+uuc
	 ptSWut1YaD0ArkgwEi3euUG7+TQSBjsCwMsd7z6xnjgJAzrHJJ9B7zO1FZW8A23vML
	 AbgNtxSsjYPBsT4P1Bi03dORT+aEEzMPN7N0SSOEvnZL+7T+3qZZv7JgSyDipAm0OB
	 zRnck5GUwRYHV13dHRhCNl4K5RKY/bq7fU2sjMrOTm1hQb2TAp0kQRQoTdf6PqTPys
	 KLJ2nbc5Rd2pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1736944076; x=1737204576; i=yann.dirson@vates.tech;
	bh=Se/x1iatsUypc3gc3kN2O/xnGmWhnUx/0YvOnWGnfFE=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=vSJsKCfUbrUFJVjW29ogjOz7vGS90H4kDDQ13Y6AYPYOShpaGoZkf3UC8PAqd7REw
	 OPmhwLEKKM6CcrxrPgMhQ9pFVLR1un/gQGhOCkFrQfNGzrLIGn04mP6Doomq5kr27D
	 u8N5fzg/12feNt2DnJZQwVAUbcXSw8aeE7bXEBXFKpciKvVMNisRZ6GyWqw7wIXPC0
	 dCY732r8g8teBn2TVyBuTy7P5S8W9DLsF2PQZyt6UJ3QO5AfRPpbrolk9X1D/kepMJ
	 mefjdemk8yASyF9FAMsnFj1s4tUuIraGXPVV8q5Jt9JpLrIuH0S2NUy2PhERRK70o7
	 CcMi9SkvpxYXQ==
From: "Yann Dirson" <yann.dirson@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v2=200/3]=20trivial=20improvements=20to=20sphinx=20doc=20tooling?=
X-Mailer: git-send-email 2.39.5
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1736944074998
To: xen-devel@lists.xenproject.org
Cc: "Yann Dirson" <yann.dirson@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <cover.1736943927.git.yann.dirson@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.44f8893ad68c486d8daeed9e3a93f6d1?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250115:md
Date: Wed, 15 Jan 2025 12:27:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

changes:
v2:
* move import up and adjust "path setup" instructions
* new patch for .gitignore rationalisation

Yann Dirson (3):
  docs/sphinx: import sys for error reporting
  docs: rationalise .gitignore
  docs/sphinx: gitignore generated files

 .gitignore      | 17 -----------------
 docs/.gitignore | 15 +++++++++++++++
 docs/conf.py    |  3 ++-
 3 files changed, 17 insertions(+), 18 deletions(-)
 create mode 100644 docs/.gitignore

-- 
2.39.5



Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

