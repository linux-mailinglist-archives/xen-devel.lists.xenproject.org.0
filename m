Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E875B6A207B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 18:29:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501341.773028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVbsr-00007y-9g; Fri, 24 Feb 2023 17:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501341.773028; Fri, 24 Feb 2023 17:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVbsr-0008WJ-6k; Fri, 24 Feb 2023 17:29:25 +0000
Received: by outflank-mailman (input) for mailman id 501341;
 Fri, 24 Feb 2023 17:29:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+11/=6U=citrix.com=prvs=4121c3e27=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pVbsq-0008WD-Gq
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 17:29:24 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c63fe622-b468-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 18:29:23 +0100 (CET)
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
X-Inumbo-ID: c63fe622-b468-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677259762;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3m8i8hP0Ojht3qB1jKYvUIcfgvkxQ/uk2031nXKLdpg=;
  b=bWWtf8HkmynVoPqwDI8wfZtygfzuJP8UnlZc8Z9XQ9nfIihNIVFExpx9
   KwC7x0OCmQfK2mOKrlO0dG0Z/wEOp9WUOK/2P/2ZDP1x3rbcNSeGYNWSD
   mZ3kbBFG4+uvbzlr0kaBtGTtM+wPJvzO7pBZ9+hGxbpvysa4iRkeRvQtD
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97274433
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:jymK5qsbOUqfoENteokXfdVhUufnVE5eMUV32f8akzHdYApBsoF/q
 tZmKW+POfvYZ2Wgc9p2aoW38kIHsMWHx9VhSwNorSwyEiwQ+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AWEyyFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBR8VQCG+uOONzei6S81vn5QecvjLM9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WzRetFKSo7tx+2XJxRZ9+LPsLMDUapqBQsA9ckOw9
 z2coDilWUpy2Nq3xzmh9yuztMX1pQTWQ48ZD5q/5sNSqQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+Yz8g2Kx4Lf6hyVAWVCRTlEAPQ9r9M/TzEu0
 l6PnvvqCCZpvbnTTmiSnop4thvrZ3JTdzVbI3ZZE01cuYKLTJwPYgznY/l7Pp+IsdzOFGvxw
 hSJtXgD2YQzgptev0mkxmzvjzWpr5nPawc64ATLQ26ohj9EiJ6Zi5+AsgaCs6sZRGqNZhzY5
 SVfxZDChAwbJcvV/BFhVtnhC11ACxytFDTHyWBiEJA6n9hG0y7yJNsAiN2SyaoADyrlRdMLS
 BWO0e+yzMUJVJdPUUOQS9PZNijS5fK8fekJr9iNBja0XrB/dRWc4AZlblOK0mbmnSAEyP9gZ
 s7ELpzzUCdKWMyLKQZaoM9HjNcWKt0WnzuPFfgXMTz6uVZhWJJlYehcawbfBgzIxKiFvB/U4
 75i2ziikn1ivBnFSnCPq+Y7dAlaRUXX8Liq86S7gMbfeFs5cIzgYteNqY4cl3tNw/sJzbqQp
 izkMqKaoXKm7UD6xcyxQigLQNvSsVxX9BrX4QRE0Y6U5kUe
IronPort-HdrOrdr: A9a23:hYQAh6/kxmn+PnVTbbtuk+HHdr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZquz+8O3WBxB8brYOCCggeVxe5ZnOzfKlHbehEWs9QtrZ
 uIEJIOQ+EYb2IK6/oSiTPQe7lP/DDEytHQuQ609QYOcegeUdAF0+4PMHf/LqQZfml7LKt8MK
 DZyttMpjKmd3hSRsOnBkMdV+yGi8zXmIngaRsmAQdizAWVlzun5JPzDhDdh34lIn5y6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATtMr9xsBFDMmsjNFQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30l0dFvU2z0mUUnC+oBPr1QWl+i0p8WXexViRhmamidDlRRohYvAxyr5xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqrEypunAv+NRjwUC3ELFuKYO5n7Zvv3+9I61wXh4SL7pXVd
 WGOfuspMq+t2nqK0wx8FMfh+BEFU5DYytuCnJyxvB9lQIm0EyRhnFou/A3jzMO8okwRIJD4P
 mBOqN0lKtWRstTdq5lAvwdKPHHfVAlbCi8RV56G26XYJ0vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdduXQpc0zjBMWS1NkTmyq9CVmVTHDo0IVT9pJ5srrzSP7iNjCCUkknl4+lr+8ECsPWVv
 6vMNZdAuPlL2HpBYFVtjeOLaV6OD0bSokYq9w7U1WBrobCLZDrrPXSdLLJKL/kAV8fKxHC67
 s4LUvOzel7nzCWsyXD8WbsslvWCz3Cwa4=
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="97274433"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [XEN PATCH v3 0/4] automation: Update containers to allow HTTPS access to xenbits
Date: Fri, 24 Feb 2023 17:29:11 +0000
Message-ID: <20230224172915.39675-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.gitlab-containers-update-v3

v3:
- new patch which remove non-debug x86_32 builds
- don't fix root certificates in jessie containers as those won't be used
  anymore on the main branch.

v2:
- Remove CentOS 7.2
- Remove Debian Jessie test, but update container recipe for the benefit of
  older branches.
- Fix CentOS 7 containner recipe to update all packages. (Fix missing update of
  HTTPS root certificates)

There is work in progress [1] to update urls in our repo to use https, but
those https urls to xenbits don't work in our containers, due to an expired
root certificate. So we need to update those containers.

This series update the dockerfile where just rebuilding the container isn't enough.

Cheers,

Anthony PERARD (4):
  automation: Use EOL tag for Jessie container
  automation: Remove testing on Debian Jessie
  automation: Remove expired root certificates used to be used by let's
    encrypt
  automation: Remove non-debug x86_32 build jobs

 .../build/debian/jessie-i386.dockerfile       |  2 +-
 automation/build/debian/jessie.dockerfile     |  2 +-
 automation/build/ubuntu/trusty.dockerfile     |  5 ++
 automation/gitlab-ci/build.yaml               | 60 -------------------
 4 files changed, 7 insertions(+), 62 deletions(-)

-- 
Anthony PERARD


