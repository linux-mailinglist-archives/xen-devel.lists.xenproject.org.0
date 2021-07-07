Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 254303BEC75
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 18:43:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152630.281948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1AdM-00053w-WE; Wed, 07 Jul 2021 16:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152630.281948; Wed, 07 Jul 2021 16:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1AdM-000511-SJ; Wed, 07 Jul 2021 16:42:48 +0000
Received: by outflank-mailman (input) for mailman id 152630;
 Wed, 07 Jul 2021 16:42:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DB7Z=L7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m1AdL-00050s-Hq
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 16:42:47 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22b1667f-18e4-4790-a736-5d9d25782186;
 Wed, 07 Jul 2021 16:42:46 +0000 (UTC)
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
X-Inumbo-ID: 22b1667f-18e4-4790-a736-5d9d25782186
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625676166;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=em/dbn601C7FX6AESIr9b+T9YsaP6aH1UAY4t5Cecxg=;
  b=bBsiixoua899ULxCiaTdf5V60ZKuvu+nqo6dG0cxpR8QgYwXcvnbHHdJ
   ONawZfTLUaNgn5H+tuLK3bFn08uNJHyPt60rBJNaDWxgrNOXv2XLCIo8k
   qJ0ayriZT4yLsnyzHXcGVDg/4HcWpkscPn8FdkqDw9v6ouMd+2jowdldV
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1PNoQvEBMHjM4eDi9YPk5qT80zOk7KTvVTqXCQq6xtqwEpnV0TDysfAeBkRSTsClCF71fnLAnl
 l7mo/CWKCqCYUUgZm2eDLpK0b+zSTTY6neaZhg07P5fpEdxSSvVipBBM6L9Y4H/LFVXwpDvLoJ
 WApRvfdYQGlYxUJLbeyOuOk60DljNrvbaedZzHOGvKe88jF74qj70QtDS83uQo7FeBRtA1VRhJ
 J8SXB5MI0AUMtjyBOwPs6X7V1FX3YCnk3B6h0vqvzf0IRp38ZILkPrXGkkCcqcQ69mJ26vxbEf
 vMA=
X-SBRS: 5.1
X-MesageID: 49394618
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:jy/6L6vA3j6FLfsw4UrG04nm7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-IronPort-AV: E=Sophos;i="5.84,220,1620705600"; 
   d="scan'208";a="49394618"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH 0/2] automation: Fix build with new qemu-xen version
Date: Wed, 7 Jul 2021 17:39:59 +0100
Message-ID: <20210707164001.894805-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.automation-add-ninja-v1

Adding ninja-build pkg when possible.

I'll push new containers soon.

Anthony PERARD (2):
  automation: Adding ninja-build to some docker images
  automation: Check if ninja is available before building QEMU

 automation/build/alpine/3.12.dockerfile        | 1 +
 automation/build/fedora/29.dockerfile          | 9 ++++++---
 automation/build/suse/opensuse-leap.dockerfile | 2 ++
 automation/build/ubuntu/bionic.dockerfile      | 2 ++
 automation/build/ubuntu/focal.dockerfile       | 2 ++
 automation/scripts/build                       | 4 +++-
 6 files changed, 16 insertions(+), 4 deletions(-)

-- 
Anthony PERARD


