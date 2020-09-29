Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5208A27D6A2
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 21:16:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360.1075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNL6S-0006mp-2P; Tue, 29 Sep 2020 19:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360.1075; Tue, 29 Sep 2020 19:15:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNL6R-0006mQ-VX; Tue, 29 Sep 2020 19:15:55 +0000
Received: by outflank-mailman (input) for mailman id 360;
 Tue, 29 Sep 2020 19:15:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KBKl=DG=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kNL6Q-0006mL-UE
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 19:15:54 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9febb1b9-0fb1-40fb-afad-2325b4b13cea;
 Tue, 29 Sep 2020 19:15:51 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kNL6M-0002Ng-H6; Tue, 29 Sep 2020 19:15:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kNL6M-0002Sp-9Z; Tue, 29 Sep 2020 19:15:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kNL6M-0005zQ-96; Tue, 29 Sep 2020 19:15:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=KBKl=DG=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kNL6Q-0006mL-UE
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 19:15:54 +0000
X-Inumbo-ID: 9febb1b9-0fb1-40fb-afad-2325b4b13cea
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9febb1b9-0fb1-40fb-afad-2325b4b13cea;
	Tue, 29 Sep 2020 19:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=PT/ERAIDGqywxToEv11HIw/1WZKm3+0ufJq3Oj53fYs=; b=HyNEdraAxO9GMMVQZYC2P6KtIN
	88YaSefHHvNTg4Y5AhBMoLiMeu28y9NsQ0QT0TvOfl2XHXdn4TeW1tpRMUKO7qdKMkJkY0h9cXzy2
	ZpBW6nk2odl4Mnmcl5fKe/TOLde32kjpRNs0e3WPxO1X51+sq7wyhFwzwwZdmFvIQf1U=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNL6M-0002Ng-H6; Tue, 29 Sep 2020 19:15:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNL6M-0002Sp-9Z; Tue, 29 Sep 2020 19:15:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNL6M-0005zQ-96; Tue, 29 Sep 2020 19:15:50 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.11-testing bisection] complete test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm
Message-Id: <E1kNL6M-0005zQ-96@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 29 Sep 2020 19:15:50 +0000

branch xen-4.11-testing
xenbranch xen-4.11-testing
job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm
testid debian-hvm-install

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  3def8466383ab5abd17f1436d085348c2994722b
  Bug not present: cc1561a3a4e6c1b4125953703338c545ba6d14fb
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155103/


  commit 3def8466383ab5abd17f1436d085348c2994722b
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 17:21:27 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.11-testing/test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.11-testing/test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm.debian-hvm-install --summary-out=tmp/155103.bisection-summary --basis-template=151714 --blessings=real,real-bisect xen-4.11-testing test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm debian-hvm-install
Searching for failure / basis pass:
 155013 fail [host=godello0] / 151714 [host=fiano1] 151318 [host=huxelrebe0] 151295 [host=elbling0] 151279 [host=godello1] 151260 ok.
Failure / basis pass flights: 155013 / 151260
(tree with no url: minios)
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 3263f257caf8e4465e9dca84a88fa0e68be74280
Basis pass 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 239b50a863704f7960525799eda82de061c7c458 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 2e3de6253422112ae43e608661ba94ea6b345694 2b77729888fb851ab96e7f77bc854122626b4861
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#076a2b409667dd9f716a2a2085e1ffea9d58fe8b-076a2b409667dd9f716a2a2085e1ffea9d58fe8b https://git.savannah.gnu.org/git/gnulib.git/#d6397dde2e127e246e3eeb5254a21f42cac783c8-d6397dde2e127e246e3eeb5254a21f42cac783c8 https://gitlab.com/keycodemap/keycodemapdb.git#16e5b0787687d8904dad2c026107409eb9bfcb95-16e5b0787687d8904dad2c026107409eb9bfcb95 git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc\
 7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#239b50a863704f7960525799eda82de061c7c458-dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 git://xenbits.xen.org/qemu-xen-traditional.git#c8ea0457495342c417c3dc033bba25148b279f60-c8ea0457495342c417c3dc033bba25148b279f60 git://xenbits.xen.org/qemu-xen.git#06fbdaf7d6c43b55339d4ad74c77c9be84ae41\
 ad-06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad git://xenbits.xen.org/osstest/seabios.git#2e3de6253422112ae43e608661ba94ea6b345694-155821a1990b6de78dde5f98fa5ab90e802021e0 git://xenbits.xen.org/xen.git#2b77729888fb851ab96e7f77bc854122626b4861-3263f257caf8e4465e9dca84a88fa0e68be74280
Loaded 12581 nodes in revision graph
Searching for test results:
 151260 pass 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 239b50a863704f7960525799eda82de061c7c458 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 2e3de6253422112ae43e608661ba94ea6b345694 2b77729888fb851ab96e7f77bc854122626b4861
 151234 [host=chardonnay1]
 151295 [host=elbling0]
 151279 [host=godello1]
 151318 [host=huxelrebe0]
 151714 [host=fiano1]
 154619 fail irrelevant
 154649 fail 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 3263f257caf8e4465e9dca84a88fa0e68be74280
 154762 pass 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 239b50a863704f7960525799eda82de061c7c458 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 2e3de6253422112ae43e608661ba94ea6b345694 2b77729888fb851ab96e7f77bc854122626b4861
 154854 fail 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 3263f257caf8e4465e9dca84a88fa0e68be74280
 154864 pass 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4698f544d2b1330e3434c378a02fa6ef88c17c48 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad d9c812dda519a1a73e8370e1b81ddf46eb22ed16 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d
 154870 pass 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fbc9cb4c8b4fc7c6aa63f47eae33d7c9849bf6e0 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d
 154875 pass 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 503248ccdf45c14d4040ce44163facdc212e4991 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d
 154883 pass 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 416813753726bbf7c962c423246633cd703ae7c5 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d
 154740 fail 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 3263f257caf8e4465e9dca84a88fa0e68be74280
 155013 fail 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 3263f257caf8e4465e9dca84a88fa0e68be74280
 155072 pass 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 7129b9e7264b2e992845ba84a5d871a4ef6bab8b
 155076 pass 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 13f60bf98fcb3b5c5c216ee2ce536897d3a925d4
 155081 fail 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 3def8466383ab5abd17f1436d085348c2994722b
 155083 pass 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 6e9de083d801104f50a78f5d8e872778a776c682
 155086 pass 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 cc1561a3a4e6c1b4125953703338c545ba6d14fb
 155088 fail 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 3def8466383ab5abd17f1436d085348c2994722b
 155094 pass 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 cc1561a3a4e6c1b4125953703338c545ba6d14fb
 155097 fail 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 3def8466383ab5abd17f1436d085348c2994722b
 155100 pass 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 cc1561a3a4e6c1b4125953703338c545ba6d14fb
 155103 fail 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 3def8466383ab5abd17f1436d085348c2994722b
Searching for interesting versions
 Result found: flight 151260 (pass), for basis pass
 For basis failure, parent search stopping at 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 cc1561a3a4e6c1b4125953703338c545ba6d14fb, results HASH(0x56130d1b4400) HASH(0x56130c2\
 ecb68) HASH(0x56130d1e4b90) For basis failure, parent search stopping at 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 6e9de083d801104f50a78f5d8e872778a776c682, results HASH(0x5\
 6130d17aac8) For basis failure, parent search stopping at 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 13f60bf98fcb3b5c5c216ee2ce536897d3a925d4, results HASH(0x56130d18d580) Fo\
 r basis failure, parent search stopping at 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 7129b9e7264b2e992845ba84a5d871a4ef6bab8b, results HASH(0x56130d1cc8d0) For basis failure\
 , parent search stopping at 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 416813753726bbf7c962c423246633cd703ae7c5 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d, results HASH(0x56130b5a9b20) For basis failure, parent search\
  stopping at 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 503248ccdf45c14d4040ce44163facdc212e4991 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d, results HASH(0x56130d1ba718) For basis failure, parent search stopping at 07\
 6a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fbc9cb4c8b4fc7c6aa63f47eae33d7c9849bf6e0 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d, results HASH(0x56130d191eb8) For basis failure, parent search stopping at 076a2b409667dd9f7\
 16a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4698f544d2b1330e3434c378a02fa6ef88c17c48 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad d9c812dda519a1a73e8370e1b81ddf46eb22ed16 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d, results HASH(0x56130d18cf80) For basis failure, parent search stopping at 076a2b409667dd9f716a2a2085e1ffea\
 9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 239b50a863704f7960525799eda82de061c7c458 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 2e3de6253422112ae43e608661ba94ea6b345694 2b77729888fb851ab96e7f77bc854122626b4861, results HASH(0x56130d1a9188) HASH(0x56130d1b6708) Result found: flight 154649 (fail), for basis failure (at ancestor ~553\
 9)
 Repro found: flight 154762 (pass), for basis pass
 Repro found: flight 155013 (fail), for basis failure
 0 revisions at 076a2b409667dd9f716a2a2085e1ffea9d58fe8b d6397dde2e127e246e3eeb5254a21f42cac783c8 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 cc1561a3a4e6c1b4125953703338c545ba6d14fb
No revisions left to test, checking graph state.
 Result found: flight 155086 (pass), for last pass
 Result found: flight 155088 (fail), for first failure
 Repro found: flight 155094 (pass), for last pass
 Repro found: flight 155097 (fail), for first failure
 Repro found: flight 155100 (pass), for last pass
 Repro found: flight 155103 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  3def8466383ab5abd17f1436d085348c2994722b
  Bug not present: cc1561a3a4e6c1b4125953703338c545ba6d14fb
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155103/


  commit 3def8466383ab5abd17f1436d085348c2994722b
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 17:21:27 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>

pnmtopng: 129 colors found
Revision graph left in /home/logs/results/bisect/xen-4.11-testing/test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
155103: tolerable FAIL

flight 155103 xen-4.11-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/155103/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 10 debian-hvm-install fail baseline untested


jobs:
 build-amd64-libvirt                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    


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


