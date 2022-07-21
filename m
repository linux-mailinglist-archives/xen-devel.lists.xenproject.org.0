Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C11657CAE1
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 14:46:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372690.604570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEVZE-00007E-FR; Thu, 21 Jul 2022 12:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372690.604570; Thu, 21 Jul 2022 12:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEVZE-0008Vb-Ce; Thu, 21 Jul 2022 12:46:12 +0000
Received: by outflank-mailman (input) for mailman id 372690;
 Thu, 21 Jul 2022 12:46:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6kJ=X2=citrix.com=prvs=194f9e755=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oEVZC-0008VQ-NX
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 12:46:10 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16f469e2-08f3-11ed-bd2d-47488cf2e6aa;
 Thu, 21 Jul 2022 14:46:09 +0200 (CEST)
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
X-Inumbo-ID: 16f469e2-08f3-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658407568;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Uns11hYDdMSNgRjXpwobtj/xGQb5UASoHRMAOns4Ee4=;
  b=TcGm7mDb6hCdt4c5CNjkz7A4JPM96m+ZOaYR07SQ9bHp71etQrS2AwzU
   CmBTZn3pi9nUuIpitSSxGT+mWZX+uaasYj2ZfKx5VR+cwyy+dJtlzGufa
   /dmwr4su+4yIi+ZQtIjB13RkUMAKgMSZaM20pGYJBqsS1eZzBqkQmTFHD
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76321701
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:e8YWzaCoc+DaIRVW/y/jw5YqxClBgxIJ4kV8jS/XYbTApD501WQEy
 jEYXWGCOfaIN2Gmftt+Oo22oUoOv5TUz4c3QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pe31GONgWYuaDpLsfvb8nuDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJW3fg0epwK14vBpYjy/8wUFNVr
 98FFhlYO3hvh8ruqF66Yuxlh8BlJ8j3JoIP/HpnyFk1D95/H8qFGf+To4YFgnFg3aiiHt6HD
 yYdQTNpcBTHZQwJIloNAYgytOypmmP+Y3tTr1f9Sa8fvDaIllUuiOGF3Nz9c4yjZfp43Vai/
 knL723ZEioQd+zExm/Qmp6rrrCWxn6qMG4IL5Wj7eJjilCXwm0VCTUVWEG9rP3/jVSxM/pUI
 lYY/ScGpqEo+EumCNL6WnWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcpQRQ62
 1nPmMnmbQGDq5XMFyjbrO3N62rvZ25FdgfueBPoUyMJ78v8vqYslynUded6V/+HlYfWBA/Zl
 mXiQDcFu1kDsSIa//zloACd2mj9+sGhoh0dvVuOAD/8hu9tTMv8PtHztwCGhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JAVdoJiN2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa9RY+5DKmKNYsUOvCdkTNrGwk3PiatM53FyhBwwcnTx
 7/AGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvueHwP9Dz+iOL2TCPEFt843K6mNL9RAFWs/FqIq
 L6y9qKil31ibQEJSnKMqdRMcgFbdBDWx/ne8qRqSwJKGSI+cElJNhMb6elJl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23://7N2K4B/hKSP9ktpAPXwMLXdLJyesId70hD6qhwISY7TiX+rb
 HKoB17726StN9/YhAdcLy7VZVoIkmsl6Kdg7NwAV7KZmCP0wGVxelZnO/fKlbbdREWmNQw6U
 4ZSdkcNOHN
X-IronPort-AV: E=Sophos;i="5.92,289,1650945600"; 
   d="scan'208";a="76321701"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <wl@xen.org>, <andrew.cooper3@citrix.com>, <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH v2 0/4] Some improvement for gitlab CI jobs
Date: Thu, 21 Jul 2022 13:45:58 +0100
Message-ID: <20220721124602.9910-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.gitlab-ci-improvement-v2

v2:
- rebased

Allow build and test jobs to run concurently.

Avoid running "test artifact" jobs on branch "master" and other, when test jobs
aren't runned.

Anthony PERARD (4):
  automation: fix typo in .gcc-tmpl
  automation: add a templates for test jobs
  automation: only run test artifact jobs when needed
  automation: use "needs" instead of "dependencies" for test jobs

 automation/gitlab-ci/build.yaml | 20 ++++---
 automation/gitlab-ci/test.yaml  | 99 +++++++++------------------------
 2 files changed, 40 insertions(+), 79 deletions(-)

-- 
Anthony PERARD


