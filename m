Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB53F697B59
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 13:03:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495903.766345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSGUV-0003Do-7j; Wed, 15 Feb 2023 12:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495903.766345; Wed, 15 Feb 2023 12:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSGUV-0003BT-4N; Wed, 15 Feb 2023 12:02:27 +0000
Received: by outflank-mailman (input) for mailman id 495903;
 Wed, 15 Feb 2023 12:02:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LhbV=6L=citrix.com=prvs=4037f5ffb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pSGUU-0002tE-0e
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 12:02:26 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97f057e2-ad28-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 13:02:20 +0100 (CET)
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
X-Inumbo-ID: 97f057e2-ad28-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676462540;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MVgVSQoqoX6b1cwtMgdJCX74cqDIUgNuwrGwqbwsx9c=;
  b=CLwry3HxeXdRxXQZmiNn2q1bbSGI7YhMF9XgniiPpq9ybSJYIES/9D1h
   V13c+qleQ45uMzDv9xLtyBn0i/C5U48a0Md/uGC5uSuII6MCr2w0qSkmb
   CPwoQ6OrYrPYCnri1rIPCrW/OCGNItPq28RWLo6XVZEHywUYwFG46UEKM
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97048389
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:ifiYd6LPPL29zLAdFE+R/pUlxSXFcZb7ZxGr2PjKsXjdYENS0DwAx
 2sZUW+OOvvcZjakcoglPYvgph9V7J7Xz9IwQAJlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5AVjPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5QLUxDq
 ewoJAoCSU++vM2J5+7rWs9V05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TbGp0Jzh3I9
 woq+UylIR8nF9+d7QaL92yWgcvEpB3mUaI7QejQGvlC3wTImz175ActfVCyu/W+h2a1UshTL
 EFS8S0rxYAp71CiRNT5Wxy+oVaHswQaVt4WFPc1gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHjVGOYSvDrPHO92r0YHVLazZYPkfoUDfp/fHEjKw+0gL/QuxsN/GItfLKPm2g0
 xaz+X1Wa6ooseYH0KCy/Fbiij2qp4TUQgNd2jg7Tl5J/SsiOtf7OtXABUzzqK8Zcd3HFgXpU
 G0swZD20QwYMX2aeMVhqs0pFarh2fuKOSa0bbVHT8h4rGTFF5JOkOltDNBCyKVBaJ1sldzBO
 hW7VeZtCHl7ZiPCgUhfPeqM5zwCl/SIKDgcfqm8giBySpZwbhSb2ypleFSd2Wvg+GB1z/5hY
 sbKL5z9VyZAYUiC8NZQb71FuVPM7npjrV4/uLihl0j3uVZgTCD9pUg53KumMblisfLsTPT9+
 NdDLcqaoyizo8WnChQ7BbU7dAhQRVBiXMCeliCiXrLbSuaQMD17WqC5LHJIU9ANopm5Yc+Up
 i7nABUClQGn7ZAFQC3TAk1ehHrUdc4XhRoG0eYEZz5EB1BLjV6T0Zoi
IronPort-HdrOrdr: A9a23:+vVrA6OoKs5kC8BcTv2jsMiBIKoaSvp037BL7SxMoHluGaalfq
 +V7ZcmPGDP+U4ssR0b+OxoQZPwJ080lqQb3WByB8bBYOC8ghrNEGgK1+KLrgEIfReOk9K1vZ
 0QFJSWY+efMbEVt6bHCFvSKadY/OW6
X-IronPort-AV: E=Sophos;i="5.97,299,1669093200"; 
   d="scan'208";a="97048389"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 0/4] automation: Update containers to allow HTTPS access to xenbits
Date: Wed, 15 Feb 2023 12:02:04 +0000
Message-ID: <20230215120208.35807-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.gitlab-containers-update-v1

There is work in progress [1] to update urls in our repo to use https, but
those https urls to xenbits don't work in our containers, due to an expired
root certificate. So we need to update those containers.

This series update the dockerfile where just rebuilding the container isn't enough.

I've tested the new containers but didn't updated them yet. You can see the
result in the following links (if you can access them). There are other
containers been test which didn't need dockerfile update.
    https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/777474218
    https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/778218868

Building randconfig on debian unstable seems to be an issue.

[1] https://lore.kernel.org/xen-devel/75d91def8234bceb41548147ee8af5fea52bd1d6.1675889602.git.demi@invisiblethingslab.com/

Cheers,

Anthony PERARD (4):
  automation: Remove clang-8 from Debian unstable container
  automation: Ignore package authentification issue in Jessie container
  automation: Remove expired root certificates used to be used by let's
    encrypt
  automation: Add more aliases in containerize

 automation/build/centos/7.2.dockerfile         |  5 +++++
 automation/build/centos/7.dockerfile           |  5 +++++
 automation/build/debian/jessie-i386.dockerfile |  7 +++++++
 automation/build/debian/jessie.dockerfile      |  7 +++++++
 automation/build/debian/unstable-llvm-8.list   |  3 ---
 automation/build/debian/unstable.dockerfile    | 12 ------------
 automation/build/ubuntu/trusty.dockerfile      |  5 +++++
 automation/gitlab-ci/build.yaml                | 10 ----------
 automation/scripts/containerize                |  3 +++
 9 files changed, 32 insertions(+), 25 deletions(-)
 delete mode 100644 automation/build/debian/unstable-llvm-8.list

-- 
Anthony PERARD


