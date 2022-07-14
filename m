Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0532B5750F7
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 16:40:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367662.598744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBzzq-0002XL-DI; Thu, 14 Jul 2022 14:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367662.598744; Thu, 14 Jul 2022 14:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBzzq-0002UQ-AW; Thu, 14 Jul 2022 14:39:18 +0000
Received: by outflank-mailman (input) for mailman id 367662;
 Thu, 14 Jul 2022 14:39:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SkWo=XT=citrix.com=prvs=1879e8f0d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oBzzo-0002UF-NF
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 14:39:16 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b98e8788-0382-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 16:39:13 +0200 (CEST)
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
X-Inumbo-ID: b98e8788-0382-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657809552;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dQODjwmva5Xst8eJxHRwQB5vT+181m4vKnymdYgFv3w=;
  b=LWROWe4EUcDr6f9rSfL+cnnVNuXehkSGHuxgsAFe+ff3eMl9fTE8yXhh
   DyjDn6wVAfCTTRmMH+uF27scjEfM9PvzgCM6E/FUGSUL6pu+7Efdu5chX
   281pcuigRKjd65QTrFat2aF/9eyLPBe6I1R5Hy7bFbnzuG9TdPjQosZq7
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 76233198
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KLKSWqukjaWcl2wmx+3d8PmOLufnVHBeMUV32f8akzHdYApBsoF/q
 tZmKTvUPfaLZWrwLdEjOo+1oE8HvMDXmIRqHgdoriA0FC4Q+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzh8B56r8ks15qyt4W9A5DTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FYhbxNYsHEBvz
 vAndykDfC282tiS3YvuH4GAhux7RCXqFIYWu3UmxjDFF/c2B5vERs0m5/cBgm123JoXW6+DO
 YxJMlKDbzyZC/FLEl4RFJI5mvbunnTleidUgFmUubA28y7YywkZPL3Fb4SPIYfTFJU9ckCwn
 kbmvD6oP0kmG5+ikwijy3Xyne3tpHauMG4VPOLhraM76LGJ/UQRFRkXWF2TsfS/zEmkVLp3M
 FcI8yAjqawz8k2DTdTnWRC85nmesXY0WdBdDuk74wGl0bfP7kCSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaJiw9PWIEIygeQmM4D8LL+d9pyEiVF5A6TfDz3oad9SzML
 y6iqWsAt+4OrO8w25rk5F7Vvg3xnLzUd1tgjunIZV5J/j+Vdab8OdH3tAmDsK8YRGqKZgLf5
 SZZwqBy+MhLVMjQz3LVHY3hCZnzv5643CvgbUmD9nXL3xCk4DadcI9Z+1mSz285Y59fKVcFj
 KI+0D69BaO/31PwNMebm6rrV6wXIVHITLwJrMz8YNtUeYRWfwSa5ixobkP49zmzzRdzyv5jY
 cjBKZ3E4ZMm5UNPlWDeegvg+eVzmnBWKZ37H/gXMChLIZLBPSXIGN/pwXOFb/wj7bPsnTg5B
 +13bpPQoz0GCbWWSnCOoeY7cAFRRVBmVM+eliCiXrPaSuaQMDp6UKG5LHJIU9ENopm5Yc+So
 irkABYImACg7ZAFQC3TAk1ehHrUdc4XhRoG0eYEZD5EB1BLjV6T0Zoi
IronPort-HdrOrdr: A9a23:HhLAa6qdCYPsPZIQ8itg7vAaV5usL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossSkb6K290dq7MA/hHP9OkMMs1NKZPTUO11HYVb2KgbGSoQEIXheOjNK1tp
 0QPpSWaueAdWSS5PySiGLTfrZQo+VvsprY/ts2pE0dKT2CHpsQiTuRfTzrdXGeKjM2YKYRJd
 653I5qtjCgcXMYYoCQHX8eRdXOoNXNidbPfQMGLwRP0njDsRqYrJrBVzSI1BYXVD1ChZ0493
 LergD/7qK/99mm1x7n0XPJ5Zg+oqqv9jIDPr3DtiEmEESttu+aXvUjZ1REhkF2nAib0idqrD
 ALmWZkAy080QKUQoj/m2qT5+Cp6kdR15al8y7evZMmyvaJHQ7TzKF69MRkm1LimjsdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KcuZlFkIPwjgYVq3Poi1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369MwM/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MFrxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhN15c2kI
 SpaiItiYfzQTOaNSSj5uw5zvmWehTMYd3E8LAt26RE
X-IronPort-AV: E=Sophos;i="5.92,271,1650945600"; 
   d="scan'208";a="76233198"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [XEN PATCH 0/2] xen: check-endbr.sh fix and improvement
Date: Thu, 14 Jul 2022 15:39:05 +0100
Message-ID: <20220714143907.25938-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.check-endbr-fix-v1

Hi.

Anthony PERARD (2):
  xen: Fix check-endbr with mawk
  xen: Introduce $AWK in check-endbr

 xen/tools/check-endbr.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
Anthony PERARD


