Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D831E3257A7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 21:30:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89956.170010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFNHS-0007yk-Ha; Thu, 25 Feb 2021 20:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89956.170010; Thu, 25 Feb 2021 20:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFNHS-0007yN-DV; Thu, 25 Feb 2021 20:30:38 +0000
Received: by outflank-mailman (input) for mailman id 89956;
 Thu, 25 Feb 2021 20:30:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3W+l=H3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lFNHR-0007y5-Ak
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 20:30:37 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35a11dac-1e2c-4877-81e7-fe1842d1a6e1;
 Thu, 25 Feb 2021 20:30:36 +0000 (UTC)
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
X-Inumbo-ID: 35a11dac-1e2c-4877-81e7-fe1842d1a6e1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614285036;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Uh5oHWzLVTHvmw2rDj/q17q9Xcu+TPFKLKfwevnoXC8=;
  b=AITUxbUocgEviIzCCwYAq50YRcXa8d58YdV2pzBf4T0OBmh/stsbvQ7p
   ujJSGJTRP+vUaSN252jc+FfYqb3y2E113RYLeST7GtzOZQV2FWVPMtj3Z
   t3L86WBrkxECpOfc1vEQH419lsvwzxPBMV1kZZvCZZPE1MgXWmS86o3Ev
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Y8IWb4cUrWteqAlcWBAK+2LHedV+A/E1UxLdUap5ImM4kz9rgw0Gt3n0pmPyXuORQI5cMMpqC2
 KmEtPczrqvo3dz9E6Ze+oNtkEVRXHYs3Rs+emr2vaEY9xYmdOdL2CubNmXa3P+8sLKcKWIxr2l
 bngbeERHmjiRt632rRAx9DNj7IAYZlccC8+lqa1VI4vZhb3nye11T9WOXVCe+1DpyVu98LgaBw
 tRtWI8rW7+e/7DpuK5HINrlSEaVcHn/ntfIFKkGiNMozU2+Tgpz7xKrKmOSAvHtrtCKGhmZqkf
 638=
X-SBRS: 5.2
X-MesageID: 38246981
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,207,1610427600"; 
   d="scan'208";a="38246981"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH for-4.15 0/3] Build firmware as freestanding
Date: Thu, 25 Feb 2021 20:30:06 +0000
Message-ID: <20210225203010.11378-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This fixes a bug we've had for ages, which even ended up being documented as
an inappropriate build dependency.

For 4.15.  I'm tempted to suggest that it wants backporting to the stable
branches as well.

Andrew Cooper (3):
  tools/hvmloader: Drop machelf include as well
  tools/firmware: Build firmware as -ffreestanding
  automation: Annotate that a 32bit libc is no longer a dependency

 .travis.yml                                          | 1 -
 README                                               | 3 ---
 automation/build/archlinux/current.dockerfile        | 1 +
 automation/build/centos/7.2.dockerfile               | 1 +
 automation/build/centos/7.dockerfile                 | 1 +
 automation/build/debian/jessie.dockerfile            | 1 +
 automation/build/debian/stretch.dockerfile           | 1 +
 automation/build/debian/unstable.dockerfile          | 1 +
 automation/build/fedora/29.dockerfile                | 1 +
 automation/build/suse/opensuse-leap.dockerfile       | 1 +
 automation/build/suse/opensuse-tumbleweed.dockerfile | 1 +
 automation/build/ubuntu/bionic.dockerfile            | 1 +
 automation/build/ubuntu/focal.dockerfile             | 1 +
 automation/build/ubuntu/trusty.dockerfile            | 1 +
 automation/build/ubuntu/xenial.dockerfile            | 1 +
 tools/firmware/Rules.mk                              | 2 +-
 tools/firmware/hvmloader/32bitbios_support.c         | 5 +----
 17 files changed, 15 insertions(+), 9 deletions(-)

-- 
2.11.0


