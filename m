Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BEC213DEC
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 19:04:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrP6A-0004Vy-Re; Fri, 03 Jul 2020 17:03:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XYi7=AO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jrP68-0004Vd-Vp
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 17:03:37 +0000
X-Inumbo-ID: 1dfe834e-bd4f-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1dfe834e-bd4f-11ea-bb8b-bc764e2007e4;
 Fri, 03 Jul 2020 17:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hlIpXpYWoDxOmxkG9/0wpTPoZwuOL0H08cu9b9CKrRM=; b=q/qq+7ysy3PQWoLOOrvHyo4e9U
 wlATTr4WdIL7pAXKwBOU16qZqzo63l4aMMV+Mev8a90Rqsq+3KK4a7ITFpon/ZWOM5gj0PGoe31Nn
 7SXN8tGNxREztnOlJaHV8vlDWgwPPV4TIrj4CvrpbLX2Qw0L+wO8WR2ngaJTKXVXCEUw=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jrP60-0003qf-Nb; Fri, 03 Jul 2020 17:03:28 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jrP60-0003Ht-FH; Fri, 03 Jul 2020 17:03:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jrP60-0004Pp-Ea; Fri, 03 Jul 2020 17:03:28 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [libvirt bisection] complete test-amd64-amd64-libvirt-pair
Message-Id: <E1jrP60-0004Pp-Ea@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 03 Jul 2020 17:03:28 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-libvirt-pair
testid guest-migrate/src_host/dst_host

Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  7fa7f7eeb6e969e002845928e155914da2fc8cd0
  Bug not present: c3fa17cd9a158f38416a80af3e0f712bf96ebf38
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/151585/


  commit 7fa7f7eeb6e969e002845928e155914da2fc8cd0
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Wed Jul 1 17:36:51 2020 +0100
  
      util: add access check for hooks to fix running as non-root
      
      Since feb83c1e710b9ea8044a89346f4868d03b31b0f1 libvirtd will abort on
      startup if run as non-root
      
        2020-07-01 16:30:30.738+0000: 1647444: error : virDirOpenInternal:2869 : cannot open directory '/etc/libvirt/hooks/daemon.d': Permission denied
      
      The root cause flaw is that non-root libvirtd is using /etc/libvirt for
      its hooks. Traditionally that has been harmless though since we checked
      whether we could access the hook file and degraded gracefully. We need
      the same access check for iterating over the hook directory.
      
      Long term we should make it possible to have an unprivileged hook dir
      under $HOME.
      
      Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/test-amd64-amd64-libvirt-pair.guest-migrate--src_host--dst_host.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/test-amd64-amd64-libvirt-pair.guest-migrate--src_host--dst_host --summary-out=tmp/151585.bisection-summary --basis-template=151496 --blessings=real,real-bisect libvirt test-amd64-amd64-libvirt-pair guest-migrate/src_host/dst_host
Searching for failure / basis pass:
 151564 fail [dst_host=pinot1,src_host=pinot0] / 151496 [dst_host=albana0,src_host=albana1] 151469 [dst_host=fiano0,src_host=fiano1] 151417 [dst_host=albana1,src_host=albana0] 151396 [dst_host=pinot0,src_host=pinot1] 151370 [dst_host=huxelrebe0,src_host=huxelrebe1] 151352 [dst_host=huxelrebe1,src_host=huxelrebe0] 151330 [dst_host=godello0,src_host=godello1] 151308 [dst_host=godello1,src_host=godello0] 151251 [dst_host=elbling1,src_host=elbling0] 151229 [dst_host=fiano1,src_host=fiano0] 151197 ok\
 .
Failure / basis pass flights: 151564 / 151197
(tree with no url: minios)
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest d1d888a69f505922140bec292b8d208b3571f084 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8edb70945099fd35a0997d3f3db105efc144e13 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 23ca7ec0ba620db52a646d80e22f9703a6589f66
Basis pass 6f28865223292a816f1bfde589901a00156cf8a1 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea81484a8b7fce
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#6f28865223292a816f1bfde589901a00156cf8a1-d1d888a69f505922140bec292b8d208b3571f084 https://gitlab.com/keycodemap/keycodemapdb.git#27acf0ef828bf719b2053ba398b195829413dbdd-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd\
 8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#8927e2777786a43cddfaa328b0f4c41a09c629c9-c8edb70945099fd35a0997d3f3db105efc144e13 git://xenbits.xen.org/qemu-xen-traditional.git#3c659044118e34603161457db9934a34f816d78b-3c659044118e34603161457db9934a34f816d78b git://xenbits.xen.org/qemu-xen.git#410cc30fdc590417ae730d635bbc70257adf6750-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/osstest/seabios.git#2e3de6253422112ae43e608661ba94ea6b345694-88ab\
 0c15525ced2eefe39220742efe4769089ad8 git://xenbits.xen.org/xen.git#b91825f628c9a62cf2a3a0d972ea81484a8b7fce-23ca7ec0ba620db52a646d80e22f9703a6589f66
From git://cache:9419/git://libvirt.org/libvirt
   c203b8fee1..201f8d1876  master     -> origin/master
Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.

From git://cache:9419/git://xenbits.xen.org/osstest/ovmf
   0622a7b1b2..f43a14e3cf  xen-tested-master -> origin/xen-tested-master
Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.

Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Loaded 17578 nodes in revision graph
Searching for test results:
 151197 pass 6f28865223292a816f1bfde589901a00156cf8a1 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea81484a8b7fce
 151251 [dst_host=elbling1,src_host=elbling0]
 151229 [dst_host=fiano1,src_host=fiano0]
 151330 [dst_host=godello0,src_host=godello1]
 151308 [dst_host=godello1,src_host=godello0]
 151352 [dst_host=huxelrebe1,src_host=huxelrebe0]
 151370 [dst_host=huxelrebe0,src_host=huxelrebe1]
 151417 [dst_host=albana1,src_host=albana0]
 151396 [dst_host=pinot0,src_host=pinot1]
 151469 [dst_host=fiano0,src_host=fiano1]
 151496 [dst_host=albana0,src_host=albana1]
 151576 fail 7fa7f7eeb6e969e002845928e155914da2fc8cd0 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00217f1919270007d7a911f89b32e39b9dcaa907 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 88ab0c15525ced2eefe39220742efe4769089ad8 23ca7ec0ba620db52a646d80e22f9703a6589f66
 151557 pass d66181c84e8fc8471476ce607f7ad321392350c3 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a4a2258a1fec66665481b0bd929b049921cb07a0 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 d11c75185276ded944f2ea0277532b7fee849bbc 20b65c15a38d98f31f212925a3e5a733dce5b477
 151542 pass 6f28865223292a816f1bfde589901a00156cf8a1 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea81484a8b7fce
 151567 pass bcc007d1b766dc59c75dad610ca75b92bd43f7d2 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00217f1919270007d7a911f89b32e39b9dcaa907 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 88ab0c15525ced2eefe39220742efe4769089ad8 23ca7ec0ba620db52a646d80e22f9703a6589f66
 151559 pass f6f745297d884453ef4ed65643d267069f778517 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a4a2258a1fec66665481b0bd929b049921cb07a0 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 d11c75185276ded944f2ea0277532b7fee849bbc 88cfd062e8318dfeb67c7d2eb50b6cd224b0738a
 151549 fail 7fa7f7eeb6e969e002845928e155914da2fc8cd0 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00217f1919270007d7a911f89b32e39b9dcaa907 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 88ab0c15525ced2eefe39220742efe4769089ad8 23ca7ec0ba620db52a646d80e22f9703a6589f66
 151564 fail d1d888a69f505922140bec292b8d208b3571f084 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8edb70945099fd35a0997d3f3db105efc144e13 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 23ca7ec0ba620db52a646d80e22f9703a6589f66
 151585 fail 7fa7f7eeb6e969e002845928e155914da2fc8cd0 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00217f1919270007d7a911f89b32e39b9dcaa907 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 88ab0c15525ced2eefe39220742efe4769089ad8 23ca7ec0ba620db52a646d80e22f9703a6589f66
 151527 fail 7fa7f7eeb6e969e002845928e155914da2fc8cd0 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00217f1919270007d7a911f89b32e39b9dcaa907 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 88ab0c15525ced2eefe39220742efe4769089ad8 23ca7ec0ba620db52a646d80e22f9703a6589f66
 151561 pass 207a5009ea8308286f6e248ac5519b072c252555 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f01cec52f4794777feb067e4fa0bfcedfdc124e 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 88ab0c15525ced2eefe39220742efe4769089ad8 da53345dd5ff7d3a34e83587fd375c0b7722f46c
 151571 pass d57f361083c5053267e6d9380c1afe2abfcae8ac 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00217f1919270007d7a911f89b32e39b9dcaa907 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 88ab0c15525ced2eefe39220742efe4769089ad8 23ca7ec0ba620db52a646d80e22f9703a6589f66
 151552 pass aef2c5ea6f04e765170565a77a0fdc5fd6a3ea47 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1a992030522622c42aa063788b3276789c56c1e1 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 2e3de6253422112ae43e608661ba94ea6b345694 fde76f895d0aa817a1207d844d793239c6639bc6
 151583 pass c3fa17cd9a158f38416a80af3e0f712bf96ebf38 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00217f1919270007d7a911f89b32e39b9dcaa907 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 88ab0c15525ced2eefe39220742efe4769089ad8 23ca7ec0ba620db52a646d80e22f9703a6589f66
 151563 pass 4268e187531eb370bc6fbac4496018bb7fef6716 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 db77d8f7ee9490138d853c4fb06e7a1e14a49148 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 88ab0c15525ced2eefe39220742efe4769089ad8 0e2e54966af556f4047c1048855c4a071028a32d
 151579 pass c3fa17cd9a158f38416a80af3e0f712bf96ebf38 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00217f1919270007d7a911f89b32e39b9dcaa907 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 88ab0c15525ced2eefe39220742efe4769089ad8 23ca7ec0ba620db52a646d80e22f9703a6589f66
 151574 pass c3fa17cd9a158f38416a80af3e0f712bf96ebf38 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00217f1919270007d7a911f89b32e39b9dcaa907 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 88ab0c15525ced2eefe39220742efe4769089ad8 23ca7ec0ba620db52a646d80e22f9703a6589f66
 151581 fail 7fa7f7eeb6e969e002845928e155914da2fc8cd0 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00217f1919270007d7a911f89b32e39b9dcaa907 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 88ab0c15525ced2eefe39220742efe4769089ad8 23ca7ec0ba620db52a646d80e22f9703a6589f66
Searching for interesting versions
 Result found: flight 151197 (pass), for basis pass
 For basis failure, parent search stopping at c3fa17cd9a158f38416a80af3e0f712bf96ebf38 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00217f1919270007d7a911f89b32e39b9dcaa907 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 88ab0c15525ced2eefe39220742efe4769089ad8 23ca7ec0ba620db52a646d80e22f9703a6589f66, results HASH(0x558084978d98) HASH(0x55808497bd88) HASH(0x558084979d38) For basis fai\
 lure, parent search stopping at d57f361083c5053267e6d9380c1afe2abfcae8ac 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00217f1919270007d7a911f89b32e39b9dcaa907 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 88ab0c15525ced2eefe39220742efe4769089ad8 23ca7ec0ba620db52a646d80e22f9703a6589f66, results HASH(0x558084981b00) For basis failure, parent search stopping at bcc007d1b766dc59c75dad61\
 0ca75b92bd43f7d2 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00217f1919270007d7a911f89b32e39b9dcaa907 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 88ab0c15525ced2eefe39220742efe4769089ad8 23ca7ec0ba620db52a646d80e22f9703a6589f66, results HASH(0x55808493bbc0) For basis failure, parent search stopping at 4268e187531eb370bc6fbac4496018bb7fef6716 27acf0ef828bf719b2053ba398b195829413dbd\
 d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 db77d8f7ee9490138d853c4fb06e7a1e14a49148 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 88ab0c15525ced2eefe39220742efe4769089ad8 0e2e54966af556f4047c1048855c4a071028a32d, results HASH(0x558084973c20) For basis failure, parent search stopping at 207a5009ea8308286f6e248ac5519b072c252555 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a4\
 72b0eb9558310b518f0dfcd8860 0f01cec52f4794777feb067e4fa0bfcedfdc124e 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 88ab0c15525ced2eefe39220742efe4769089ad8 da53345dd5ff7d3a34e83587fd375c0b7722f46c, results HASH(0x55808494e268) For basis failure, parent search stopping at f6f745297d884453ef4ed65643d267069f778517 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a4a2258a1fec66665481b0bd929b\
 049921cb07a0 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 d11c75185276ded944f2ea0277532b7fee849bbc 88cfd062e8318dfeb67c7d2eb50b6cd224b0738a, results HASH(0x558084944410) For basis failure, parent search stopping at d66181c84e8fc8471476ce607f7ad321392350c3 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a4a2258a1fec66665481b0bd929b049921cb07a0 3c659044118e34603161457db9934a34f816d78b 41\
 0cc30fdc590417ae730d635bbc70257adf6750 d11c75185276ded944f2ea0277532b7fee849bbc 20b65c15a38d98f31f212925a3e5a733dce5b477, results HASH(0x558084963e60) For basis failure, parent search stopping at aef2c5ea6f04e765170565a77a0fdc5fd6a3ea47 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1a992030522622c42aa063788b3276789c56c1e1 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 2e3de6253422112ae\
 43e608661ba94ea6b345694 fde76f895d0aa817a1207d844d793239c6639bc6, results HASH(0x558084977018) For basis failure, parent search stopping at 6f28865223292a816f1bfde589901a00156cf8a1 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea8148\
 4a8b7fce, results HASH(0x55808494c0b0) HASH(0x558084963b90) Result found: flight 151527 (fail), for basis failure (at ancestor ~10071)
 Repro found: flight 151542 (pass), for basis pass
 Repro found: flight 151564 (fail), for basis failure
 0 revisions at c3fa17cd9a158f38416a80af3e0f712bf96ebf38 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00217f1919270007d7a911f89b32e39b9dcaa907 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 88ab0c15525ced2eefe39220742efe4769089ad8 23ca7ec0ba620db52a646d80e22f9703a6589f66
No revisions left to test, checking graph state.
 Result found: flight 151574 (pass), for last pass
 Result found: flight 151576 (fail), for first failure
 Repro found: flight 151579 (pass), for last pass
 Repro found: flight 151581 (fail), for first failure
 Repro found: flight 151583 (pass), for last pass
 Repro found: flight 151585 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  7fa7f7eeb6e969e002845928e155914da2fc8cd0
  Bug not present: c3fa17cd9a158f38416a80af3e0f712bf96ebf38
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/151585/

Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.


  commit 7fa7f7eeb6e969e002845928e155914da2fc8cd0
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Wed Jul 1 17:36:51 2020 +0100
  
      util: add access check for hooks to fix running as non-root
      
      Since feb83c1e710b9ea8044a89346f4868d03b31b0f1 libvirtd will abort on
      startup if run as non-root
      
        2020-07-01 16:30:30.738+0000: 1647444: error : virDirOpenInternal:2869 : cannot open directory '/etc/libvirt/hooks/daemon.d': Permission denied
      
      The root cause flaw is that non-root libvirtd is using /etc/libvirt for
      its hooks. Traditionally that has been harmless though since we checked
      whether we could access the hook file and degraded gracefully. We need
      the same access check for iterating over the hook directory.
      
      Long term we should make it possible to have an unprivileged hook dir
      under $HOME.
      
      Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

pnmtopng: 225 colors found
Revision graph left in /home/logs/results/bisect/libvirt/test-amd64-amd64-libvirt-pair.guest-migrate--src_host--dst_host.{dot,ps,png,html,svg}.
----------------------------------------
151585: tolerable FAIL

flight 151585 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/151585/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-libvirt-pair 22 guest-migrate/src_host/dst_host fail baseline untested


jobs:
 build-amd64-libvirt                                          pass    
 test-amd64-amd64-libvirt-pair                                fail    


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary


