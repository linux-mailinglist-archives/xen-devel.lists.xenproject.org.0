Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A52026161C3
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 12:29:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435804.689600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqBvc-0001nQ-8B; Wed, 02 Nov 2022 11:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435804.689600; Wed, 02 Nov 2022 11:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqBvc-0001lg-0q; Wed, 02 Nov 2022 11:29:04 +0000
Received: by outflank-mailman (input) for mailman id 435804;
 Wed, 02 Nov 2022 11:29:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2cji=3C=citrix.com=prvs=298722737=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oqBva-0001la-Ks
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 11:29:02 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8adafbb8-5aa1-11ed-91b5-6bf2151ebd3b;
 Wed, 02 Nov 2022 12:29:00 +0100 (CET)
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
X-Inumbo-ID: 8adafbb8-5aa1-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667388539;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Q3hcdcZDvwBPZ68PKud/zS5YU2lxoxIAcF5oBaqlgss=;
  b=QPu4AzWy4kEJ23UeXVL8wCm60H6ufkzQvR1xAeLZd6TxuADB+PTA1Wo3
   ECN/dOql63fSviwh/+1jbt7KY7+hjAiqafHe3O0Z+UMsEs3Hqn+aztWaZ
   QG4jYOnuLcbbXtfnZb6Wd6QmYAMt4swvVTesjReBtdtsJrG2BdVRBNS98
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 84426188
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GUflZqg/eEi4awlmjgryQet/X161rRAKZh0ujC45NGQN5FlHY01je
 htvD2vXafyKM2H2f9ojboW+/U5VvZ7cnNUxSAJqrys3QyMb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWv0N8klgZmP6oS5QeEzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQnBBsyYRq8m96L3b3lT8ByqpsnJ+T0adZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQthbE+
 jiYpjSpav0cHIa11COBo0yPvN3exQb/YZwPHeCTxMc/1TV/wURMUUZLBDNXu8KRiESzRtZeI
 Ew84Tc1oO4580nDZsb5dw21pjiDpBF0c9hNF+w37imdx6yS5ByWbkAkQzhbeZoZvck5bTUw0
 xmCmNaBLSxitviZRGyQ8p+QrCiuIm4FIGkafygGQAAZpd75r+kblQnTR9xuFKq0iNzdGjzqx
 T2O6i8kiN0uYdUjjvvhuwqd2nT1+8aPHlVdChjrsnyN0S9SW4GvWJCU1EXUs/NpMqrGSlKso
 y1R8ySB19wmAZaInS2LZewCGrC1+vqIWAHhbU5T84oJrGr0pSP6FWxEyHQnfRoybJ5YEdP8S
 BWL0T698qO/K5dDgUVfR4uqQ/onwqH7fTgOfqCFN4EeCnSdmeLuwc2PWaJy9zqz+KTPuftlU
 Xt+TSpLJS9DYZmLNBLsG48gPUYDn0jSP1/7S5Hh1AiA2rGDfnOTQrptGALQML9itvzb+FSEq
 oo32y62J/J3CbOWX8Uq2dRLcQBiwYYTWPgaVPC7hsbce1E7SQnN+tfawK87epwNokimvr6gw
 51JYWcBkQKXuJEyAV/VApyVQO+wAM0XQLNSFXBEAGtELFB6P9j/t/9PJsVpFVTlncQ6pcNJo
 zA+U53oKpxypv7volzxsbGVQFReSSmW
IronPort-HdrOrdr: A9a23:2H7z9q4RJyP/TY5rugPXwMLXdLJyesId70hD6qhwISY7TiX+rb
 HKoB17726StN9/YhAdcLy7VZVoIkmsl6Kdg7NwAV7KZmCP0wGVxelZnO/fKlbbdREWmNQw6U
 4ZSdkcNOHN
X-IronPort-AV: E=Sophos;i="5.95,232,1661832000"; 
   d="scan'208";a="84426188"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall
	<julien@xen.org>
Subject: [XEN PATCH for-4.17 0/4] Fixing some licences issue in public headers
Date: Wed, 2 Nov 2022 11:28:50 +0000
Message-ID: <20221102112854.49020-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.licences-fix-public-headers-v1

Hi,

Andrew pointed out some licences issue:

https://lore.kernel.org/xen-devel/b58f5340-d4fa-df9d-89de-6137005add77@citrix.com/T/#u
tracked here: https://gitlab.com/xen-project/xen/-/issues/35

So I attempt to fix them with this series.

For 4.17:
    This mostly change "documentation" so little risk for those patch, except
    "xen-foreign: Capture licences from the input headers" which changes
    "mkheader.py" which could generate broken headers.

Anthony PERARD (4):
  xen: Add licence information to public/errno.h
  tools/include/xen-foreign: Capture licences from the input headers
  xen: Add licence header to device_tree_defs.h
  Rework COPYING installed in /usr/include/xen/, due to several licences

 tools/include/Makefile                |  1 -
 xen/include/public/device_tree_defs.h |  6 ++++++
 xen/include/public/errno.h            |  2 ++
 tools/include/xen-foreign/mkheader.py | 15 +++++++++++++--
 tools/include/xen/COPYING             | 26 ++++++++++++++++++++++++++
 5 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 tools/include/xen/COPYING

-- 
Anthony PERARD


