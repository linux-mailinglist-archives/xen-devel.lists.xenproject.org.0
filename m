Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5BE697B7B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 13:09:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495923.766374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSGay-0005Ch-Km; Wed, 15 Feb 2023 12:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495923.766374; Wed, 15 Feb 2023 12:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSGay-00055O-Fx; Wed, 15 Feb 2023 12:09:08 +0000
Received: by outflank-mailman (input) for mailman id 495923;
 Wed, 15 Feb 2023 12:09:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LhbV=6L=citrix.com=prvs=4037f5ffb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pSGUd-0002d9-9T
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 12:02:35 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0da02ae-ad28-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 13:02:34 +0100 (CET)
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
X-Inumbo-ID: a0da02ae-ad28-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676462554;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CDemkNMh65A0fuGjtYCs3q9uOqRjiot5Fwy4om7WfvI=;
  b=KbDbqfcLbCIubuR4r090CwnJENhilAihYhhFfcWR504AsEAFtQSvMdHd
   HlHT9xCsYOTkfteei91/UwBJ2/zV/Vvby1bVG1OMVv/8ObfvfhHVDpGue
   Eko+24uTh3HshdDqbHzRND2K0mWEr4NSeYGFnIfs8UEyub5WTSj7YwvgM
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 95971160
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Tz0wxKKqjeiC0VDzFE+R/pUlxSXFcZb7ZxGr2PjKsXjdYENSgWYOm
 mVNWGDUOfbZNmfzfItxPI2z8hsE68TQztdmGQtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5AVjPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4mRjBS6
 sY4OQwoQQKTi6WymK+Va8ZF05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TbGJQKxx/G/
 goq+UzDRSxAK/yQ2wGG+1+1vvTugSXKY8UdQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxastRcGV91dO+Yz8g2Kx+zf5APxLnMfUjdLZdgitck3bT8nz
 FmEm5XuHzMHjVGOYSvDrPHO92r0YHVLazZYPkfoUDfp/fGy59AvkSjvX+pGP7ylgprxQSze4
 h+j+X1Wa6ooseYH0KCy/Fbiij2qp4TUQgNd2jg7Tl5J/SsiOtf7OtXABUzzqK8Zcd3HFgXpU
 G0swZD20QwYMX2aeMVhqs0pFarh2fuKOSa0bbVHT8h4rGTFF5JOkOltDNBCyKVBaJ1sldzBO
 hW7VeZtCHl7ZiPCgUhfPeqM5zwCl/SIKDgcfqm8giBySpZwbhSb2ypleFSd2Wvg+GB1z/5hY
 sbKL5z9VyZAYUiC8NZQb71FuVPM7npjrV4/uLihl0j3uVZgTCD9pUg53KumMblisfLsTPT9+
 NdDLcqaoyizo8WnChQ7BbU7dAhQRVBiXMCeliCiXrLbSuaQMD17WqC5LHJIU9ANopm5Yc+Up
 i7nABUClQGn7ZAFQC3TAk1ehHrUdc4XhRoG0eYEZD5EB1BLjV6T0Zoi
IronPort-HdrOrdr: A9a23:mOtPrK41eFY8iWwL7QPXwbOBI+orL9Y04lQ7vn2ZhyYlFvBw9v
 re6MjzsCWe5gr5N0tBpTn+Atj+fZqxz/9ICOoqTMWftXfdyQmVxehZhOOJ/9SKIVycygcy79
 YET0B0YOeAc2ST5azBjDVReLwbr+VuP8qT6Nv2/jNVaUVPVokl1gF+D2+gYzhLrMstP+tJKH
 JZjPA31AZJvB4sH7SG7wI+Lo/+juyOrovifRkFQzY/8WC1/EuVwY+/KQGcwhAdFxhSwbIumF
 K17zDR1+GYqvSmzR2Z8GfW4/1t6b3c4+oGPtWIls8WbhPzjQqyDb4RIoGqjXQOueSy71Rvqv
 ngyi1QRPhb2jfqZ2Sophmo4QX6zzo0zHfnxTaj8AHeiP28fis+F81Cwb1UaQHY7U1IhqAA7J
 52
X-IronPort-AV: E=Sophos;i="5.97,299,1669093200"; 
   d="scan'208";a="95971160"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 4/4] automation: Add more aliases in containerize
Date: Wed, 15 Feb 2023 12:02:08 +0000
Message-ID: <20230215120208.35807-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230215120208.35807-1-anthony.perard@citrix.com>
References: <20230215120208.35807-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 automation/scripts/containerize | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 9e508918bf..9b1a302d05 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -33,9 +33,12 @@ case "_${CONTAINER}" in
     _fedora) CONTAINER="${BASE}/fedora:29";;
     _focal) CONTAINER="${BASE}/ubuntu:focal" ;;
     _jessie) CONTAINER="${BASE}/debian:jessie" ;;
+    _jessie-i386) CONTAINER="${BASE}/debian:jessie-i386" ;;
     _stretch|_) CONTAINER="${BASE}/debian:stretch" ;;
+    _stretch-i386) CONTAINER="${BASE}/debian:stretch-i386" ;;
     _buster-gcc-ibt) CONTAINER="${BASE}/debian:buster-gcc-ibt" ;;
     _unstable|_) CONTAINER="${BASE}/debian:unstable" ;;
+    _unstable-i386) CONTAINER="${BASE}/debian:unstable-i386" ;;
     _unstable-arm32-gcc) CONTAINER="${BASE}/debian:unstable-arm32-gcc" ;;
     _unstable-arm64v8) CONTAINER="${BASE}/debian:unstable-arm64v8" ;;
     _trusty) CONTAINER="${BASE}/ubuntu:trusty" ;;
-- 
Anthony PERARD


