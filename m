Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ADF69E539
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 17:56:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499018.770003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUVw6-0006FQ-K2; Tue, 21 Feb 2023 16:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499018.770003; Tue, 21 Feb 2023 16:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUVw6-0006DR-GQ; Tue, 21 Feb 2023 16:56:14 +0000
Received: by outflank-mailman (input) for mailman id 499018;
 Tue, 21 Feb 2023 16:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJL1=6R=citrix.com=prvs=409c08766=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pUVw5-0006DG-4j
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 16:56:13 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fd1cedf-b208-11ed-a089-e9535cc0f9c3;
 Tue, 21 Feb 2023 17:56:05 +0100 (CET)
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
X-Inumbo-ID: 9fd1cedf-b208-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676998565;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CunKAyRcxTzgTRqFGUV8eBEdQzfnPyauV8u6JmcacUY=;
  b=K+ZnI42UG/o9S3nBnK6LizRh5AxXfsCRcjE4uBGk9KaENHlYYJf0zOwR
   tualiDEWXv9keizj2KJKvFEWxLddtXMX8N4le72sX4bG/VEicfmU+z3QT
   H3Qvtr8ynNZTxofKBEWUigCdVUfpOCBk67DGZd9JqP+SGSMmIqVfl44fr
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 96765384
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:7ghZP6L6xQKkMXaCFE+Ry5UlxSXFcZb7ZxGr2PjKsXjdYENShWMHm
 2FOUG+GPK6KYjP3e99+PYXn/U9X6sfTyYcxSQBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5AZnPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5THDsN1
 PAHcQsRLTyeofrp+OqXVOpz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TbG5oLwx3I+
 goq+Uz2Kx9DKcaOwwaU3Srrr8uUgiinWbg7QejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxaspQUAUtBdF+k77gClyafO5QudQG8eQVZpY9U8uMg7bTcjz
 FOOkpXiAjkHjVGOYSvDrPHO92r0YHVLazZYPkfoUDfp/fHHvdtwrx7QF+1/U4KoqMWqIWnc3
 TOV+X1Wa6ooseYH0KCy/Fbiij2qp4TUQgNd2jg7Tl5J/SsiOtf7OtXABUzzqK8Zcd3HFgXpU
 G0swZD20QwYMX2aeMVhqs0pFarh2fuKOSa0bbVHT8h4rGTFF5JOkOltDNBCyKVBaJtsldzBO
 hW7VeZtCHh7ZSLCUEOPS9jtY/nGNIC5fTgfatjab8BVfr96fxKd8SdlaCa4hj6yzhl1wflvZ
 s7AKa5A6Er27ow9kVKLqxo1i+d3lkjSO0uOLXwE8/hX+eXHPyPEIVv0GFCPcvo4/Mu5TPb9q
 r5i2z+x40wHCoXWO3CHmbP/2HhWdRDX87iq8Z0IHgNCSyI6cFwc5wj5m+1/JdY+xPwMzo8lP
 BiVAydl9bY2vlWfQS3iV5ypQOqHsUpXxZ7jARERAA==
IronPort-HdrOrdr: A9a23:21FyeK0YPlGvqhMFShXb1gqjBEQkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7gr5PUtLpTnuAsa9qB/nm6KdpLNhX4tKPzOW31dATrsSjrcKqgeIc0HDH6xmpM
 JdmsBFY+EYZmIK6foSjjPYLz4hquP3j5xBh43lvglQpdcBUdAQ0+97YDzrYnGfXGN9dOME/A
 L33Ls7m9KnE05nFviTNz0+cMXogcbEr57iaQ5uPW9a1OHf5QnYk4ITCnKjr20jbw8=
X-IronPort-AV: E=Sophos;i="5.97,315,1669093200"; 
   d="scan'208";a="96765384"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v2 0/7] automation: Update containers to allow HTTPS access to xenbits
Date: Tue, 21 Feb 2023 16:55:35 +0000
Message-ID: <20230221165542.7642-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.gitlab-containers-update-v2

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

I've tested the new containers but didn't updated them yet. You can see the
result in the following links (if you can access them). There are other
containers been test which didn't need dockerfile update.
(That was with v1 of the series)
    https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/777474218
    https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/778218868

Building randconfig on debian unstable seems to be an issue.

[1] https://lore.kernel.org/xen-devel/75d91def8234bceb41548147ee8af5fea52bd1d6.1675889602.git.demi@invisiblethingslab.com/

Cheers,

Anthony PERARD (7):
  automation: Remove CentOS 7.2 containers and builds
  automation: Ensure that all packages are up-to-dates in CentOS 7
    container
  automation: Remove clang-8 from Debian unstable container
  automation: Use EOL tag for Jessie container
  automation: Add more aliases in containerize
  automation: Remove testing on Debian Jessie
  automation: Remove expired root certificates used to be used by let's
    encrypt

 automation/build/centos/7.2.dockerfile        | 52 ----------------
 automation/build/centos/7.dockerfile          |  3 +-
 automation/build/centos/CentOS-7.2.repo       | 35 -----------
 .../build/debian/jessie-i386.dockerfile       |  7 ++-
 automation/build/debian/jessie.dockerfile     |  7 ++-
 automation/build/debian/unstable-llvm-8.list  |  3 -
 automation/build/debian/unstable.dockerfile   | 12 ----
 automation/build/ubuntu/trusty.dockerfile     |  5 ++
 automation/gitlab-ci/build.yaml               | 60 -------------------
 automation/scripts/containerize               |  3 +
 10 files changed, 22 insertions(+), 165 deletions(-)
 delete mode 100644 automation/build/centos/7.2.dockerfile
 delete mode 100644 automation/build/centos/CentOS-7.2.repo
 delete mode 100644 automation/build/debian/unstable-llvm-8.list

-- 
Anthony PERARD


