Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E35365566
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 11:31:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113429.216126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYmiM-0005GR-T3; Tue, 20 Apr 2021 09:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113429.216126; Tue, 20 Apr 2021 09:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYmiM-0005G0-PT; Tue, 20 Apr 2021 09:30:38 +0000
Received: by outflank-mailman (input) for mailman id 113429;
 Tue, 20 Apr 2021 09:30:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lYmiL-0005Fs-Qa; Tue, 20 Apr 2021 09:30:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lYmiL-0005tX-FU; Tue, 20 Apr 2021 09:30:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lYmiL-00031N-7E; Tue, 20 Apr 2021 09:30:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lYmiL-0004zo-6j; Tue, 20 Apr 2021 09:30:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=CLemuXyWMwYgPNq2GQSPHBbigYxw8i5l4ONswVASeyg=; b=orJlDtjjCLFK8j+Ob0msGDdJqY
	m/yAD09Iv78Hnl+tzM3HMJlMV2T4t69509QnX3tAH2fwMwye5CJc0ZYDsyO8u1t9qi17YfAt35YJm
	oSGcXDHBscEsdHy/zoDnW8307Cb9+k0Dfx7CM7xCFbHML5Nyejy0Dn8hfaQ4C4WY2dUc=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-arm64-arm64-libvirt-xsm
Message-Id: <E1lYmiL-0004zo-6j@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 20 Apr 2021 09:30:37 +0000

branch xen-unstable
xenbranch xen-unstable
job test-arm64-arm64-libvirt-xsm
testid guest-start

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  8d17adf34f501ded65a106572740760f0a75577c
  Bug not present: e67d8e2928200e24ecb47c7be3ea8270077f2996
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/161318/


  commit 8d17adf34f501ded65a106572740760f0a75577c
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 11:16:32 2021 +0000
  
      block: remove support for using "file" driver with block/char devices
      
      The 'host_device' and 'host_cdrom' drivers must be used instead.
      
      Reviewed-by: Eric Blake <eblake@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-arm64-arm64-libvirt-xsm.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-arm64-arm64-libvirt-xsm.guest-start --summary-out=tmp/161318.bisection-summary --basis-template=152631 --blessings=real,real-bisect,real-retry qemu-mainline test-arm64-arm64-libvirt-xsm guest-start
Searching for failure / basis pass:
 161290 fail [host=rochester1] / 160125 [host=laxton0] 160119 [host=rochester0] 160113 [host=laxton1] 160104 ok.
Failure / basis pass flights: 161290 / 160104
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 99e7e48cc7117c37fc1c08a741872d0875595796 8fe9f1f891eff4e37f82622b7480ee748bf4af74 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dd22a64de7e02b48312839a15179528c8f7db5c6
Basis pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f3bdfc41866edf7c256e689deb9d091a950c8fca 5b7f5586d182b0cafb1f8d558992a14763e2953e b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee b4011741e6b39a8fd0ed5aded96c16c45ead5888
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#2c846fa6bcc11929c9fb857a22430fb9945654ad-2c846fa6bcc11929c9fb857a22430fb9945654ad https://gitlab.com/keycodemap/keycodemapdb.git#27acf0ef828bf719b2053ba398b195829413dbdd-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/linux-pvops.git#a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9-a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0\
 dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#f3bdfc41866edf7c256e689deb9d091a950c8fca-99e7e48cc7117c37fc1c08a741872d0875595796 git://git.qemu.org/qemu.git#5b7f5586d182b0cafb1f8d558992a14763e2953e-8fe9f1f891eff4e37f82622b7480ee748bf4af74 git://xenbits.xen.org/osstest/seabios.git#b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee-b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee git://xenbits.xen.org/xen.git#b4011741e6b39a8fd0ed5aded96c16c45ead5888-dd22a64de7e02b48312839a1\
 5179528c8f7db5c6
Loaded 44247 nodes in revision graph
Searching for test results:
 160104 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f3bdfc41866edf7c256e689deb9d091a950c8fca 5b7f5586d182b0cafb1f8d558992a14763e2953e b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee b4011741e6b39a8fd0ed5aded96c16c45ead5888
 160113 [host=laxton1]
 160119 [host=rochester0]
 160125 [host=laxton0]
 160134 fail irrelevant
 160147 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 2e1293cbaac75e84f541f9acfa8e26749f4c3562 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160167 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca318882714080fb81fe9eb89a7b7934efc5bfae bdee969c0e65d4d509932b1d70e3a3b2ffbff6d5 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160328 fail irrelevant
 160361 fail irrelevant
 160392 fail irrelevant
 160418 fail irrelevant
 160448 fail irrelevant
 160477 fail irrelevant
 160501 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b33cf5bfcb4c941370739dfbbe1532ff508fd29d 7b9a3c9f94bcac23c534bc9f42a9e914b433b299 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee e680cc48b7184d3489873d6776f84ba1fc238ced
 160522 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b33cf5bfcb4c941370739dfbbe1532ff508fd29d 7b9a3c9f94bcac23c534bc9f42a9e914b433b299 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee e680cc48b7184d3489873d6776f84ba1fc238ced
 160541 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b33cf5bfcb4c941370739dfbbe1532ff508fd29d ec2e6e016d24bd429792d08cf607e4c5350dcdaa b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee e680cc48b7184d3489873d6776f84ba1fc238ced
 160563 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b33cf5bfcb4c941370739dfbbe1532ff508fd29d 7993b0f83fe5c3f8555e79781d5d098f99751a94 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee cead8c0d17462f3a1150b5657d3f4eaa88faf1cb
 160619 fail irrelevant
 160632 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 62bad17dcae18f55cb3bdc19909543dfdf928a2b 6ee55e1d10c25c2f6bf5ce2084ad2327e17affa5 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 90629587e16e2efdb61da77f25c25fba3c4a5fd7
 160650 fail irrelevant
 160736 fail irrelevant
 160748 fail irrelevant
 160779 fail irrelevant
 160801 fail irrelevant
 160827 fail irrelevant
 160851 fail irrelevant
 160883 fail irrelevant
 160916 fail irrelevant
 160980 fail irrelevant
 161050 fail irrelevant
 161088 fail irrelevant
 161121 fail irrelevant
 161147 fail irrelevant
 161171 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2ad22420a710dc07e3b644f91a5b55c09c39ecf3 8fe9f1f891eff4e37f82622b7480ee748bf4af74 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 264aa183ad85b2779b27d1312724a291259ccc9f
 161191 fail irrelevant
 161210 fail irrelevant
 161232 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 99e7e48cc7117c37fc1c08a741872d0875595796 8fe9f1f891eff4e37f82622b7480ee748bf4af74 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee b53173e7cdafb7a318a239d557478fd73734a86a
 161256 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 99e7e48cc7117c37fc1c08a741872d0875595796 8fe9f1f891eff4e37f82622b7480ee748bf4af74 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dd22a64de7e02b48312839a15179528c8f7db5c6
 161275 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f3bdfc41866edf7c256e689deb9d091a950c8fca 5b7f5586d182b0cafb1f8d558992a14763e2953e b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee b4011741e6b39a8fd0ed5aded96c16c45ead5888
 161277 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 99e7e48cc7117c37fc1c08a741872d0875595796 8fe9f1f891eff4e37f82622b7480ee748bf4af74 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dd22a64de7e02b48312839a15179528c8f7db5c6
 161280 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 f2a9a6c2a86570ccbf8c5c30cbb8bf723168c459 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 161283 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 8a40754bca14df63c6d2ffe473b68a270dc50679 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 161285 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 6e71c36557ed41017e634ae392fa80f03ced7fa1 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 161276 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 99e7e48cc7117c37fc1c08a741872d0875595796 8fe9f1f891eff4e37f82622b7480ee748bf4af74 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dd22a64de7e02b48312839a15179528c8f7db5c6
 161289 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 87a80dc4f2f5e51894db143685a5e39c8ce6f651 4083904bc9fe5da580f7ca397b1e828fbc322732 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 161292 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 030ba3097a6e7d08b99f8a9d19a322f61409c1f6 758b96b61d5cbc19204f340012d5a325f0a2105b b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 161295 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 571d413b5da6bc6f1c2aaca8484717642255ddb0 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 161297 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ce6c2b0016c2f68b6008acea1f24ed966b647147 56b89f455894e4628ad7994fe5dd348145d1a9c5 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 161299 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 879be3af49132d232602e0ca783ec9b4112530fa b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 161300 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3e1da158c47f3a6f5d48794f99fe01096531ec2e b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 161305 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 8d17adf34f501ded65a106572740760f0a75577c b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 161290 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 99e7e48cc7117c37fc1c08a741872d0875595796 8fe9f1f891eff4e37f82622b7480ee748bf4af74 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dd22a64de7e02b48312839a15179528c8f7db5c6
 161307 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 81cbfd5088690c53541ffd0d74851c8ab055a829 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 161309 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 e67d8e2928200e24ecb47c7be3ea8270077f2996 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 161310 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 8d17adf34f501ded65a106572740760f0a75577c b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 161313 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 e67d8e2928200e24ecb47c7be3ea8270077f2996 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 161314 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 8d17adf34f501ded65a106572740760f0a75577c b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 161316 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 e67d8e2928200e24ecb47c7be3ea8270077f2996 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 161318 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 8d17adf34f501ded65a106572740760f0a75577c b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
Searching for interesting versions
 Result found: flight 160104 (pass), for basis pass
 Result found: flight 161171 (fail), for basis failure (at ancestor ~63)
 Repro found: flight 161275 (pass), for basis pass
 Repro found: flight 161276 (fail), for basis failure
 0 revisions at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 e67d8e2928200e24ecb47c7be3ea8270077f2996 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
No revisions left to test, checking graph state.
 Result found: flight 161309 (pass), for last pass
 Result found: flight 161310 (fail), for first failure
 Repro found: flight 161313 (pass), for last pass
 Repro found: flight 161314 (fail), for first failure
 Repro found: flight 161316 (pass), for last pass
 Repro found: flight 161318 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  8d17adf34f501ded65a106572740760f0a75577c
  Bug not present: e67d8e2928200e24ecb47c7be3ea8270077f2996
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/161318/


  commit 8d17adf34f501ded65a106572740760f0a75577c
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 11:16:32 2021 +0000
  
      block: remove support for using "file" driver with block/char devices
      
      The 'host_device' and 'host_cdrom' drivers must be used instead.
      
      Reviewed-by: Eric Blake <eblake@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

pnmtopng: 231 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/test-arm64-arm64-libvirt-xsm.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
161318: tolerable FAIL

flight 161318 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/161318/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-arm64-arm64-libvirt-xsm 14 guest-start             fail baseline untested


jobs:
 build-arm64-libvirt                                          pass    
 test-arm64-arm64-libvirt-xsm                                 fail    


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


