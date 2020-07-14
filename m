Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7E121F991
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2020 20:37:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvPn9-0008HZ-Dx; Tue, 14 Jul 2020 18:36:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDy+=AZ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jvPn8-0008H9-Og
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2020 18:36:34 +0000
X-Inumbo-ID: ecc7b876-c600-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ecc7b876-c600-11ea-bb8b-bc764e2007e4;
 Tue, 14 Jul 2020 18:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q61d333kC4dEd+BnB92LNG+p7/LsgGt+WJHqqOQgvew=; b=0uuSzbTgSdxgXDFIoNkun73wI4
 Q3co2M4FDgBxWRjKIFXDr2kifCSXxH+uxSg8LPr7KBIycm4tlXYtNCsxVX3/72Z1E/OvmFuBBOWaw
 kbeReF/HO9ykzNSXhjLjWdvJt25A8BJBYYMkvW+/3USm+cjfZAnrW/EGckiW7DXLo8B8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jvPmz-0004f1-Tr; Tue, 14 Jul 2020 18:36:25 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jvPmz-0003D3-Ge; Tue, 14 Jul 2020 18:36:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jvPmz-0005II-Eh; Tue, 14 Jul 2020 18:36:25 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-amd64-qemuu-nested-intel
Message-Id: <E1jvPmz-0005II-Eh@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 14 Jul 2020 18:36:25 +0000
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
job test-amd64-amd64-qemuu-nested-intel
testid debian-hvm-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  81cb05732efb36971901c515b007869cc1d3a532
  Bug not present: d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/151897/


  commit 81cb05732efb36971901c515b007869cc1d3a532
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Tue Jun 9 14:23:37 2020 +0200
  
      qdev: Assert devices are plugged into a bus that can take them
      
      This would have caught some of the bugs I just fixed.
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
      Message-Id: <20200609122339.937862-23-armbru@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install --summary-out=tmp/151897.bisection-summary --basis-template=151065 --blessings=real,real-bisect qemu-mainline test-amd64-amd64-qemuu-nested-intel debian-hvm-install
Searching for failure / basis pass:
 151874 fail [host=albana0] / 151149 ok.
Failure / basis pass flights: 151874 / 151149
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d9a4084544134eea50f62e88d79c466ae91f0455 3c659044118e34603161457db9934a34f816d78b 20c1df5476e1e9b5d3f5b94f9f3ce01d21f14c46 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9af1064995d479df92e399a682ba7e4b2fc78415 3c659044118e34603161457db9934a34f816d78b 7d3660e79830a069f1848bb4fa1cdf8f666424fb 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea81484a8b7fce
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#9af1064995d479df92e399a682ba7e4b2fc78415-d9a4084544134eea50f62e88d79c466ae91f0455 git://xenbits.xen.org/qemu-xen-traditional.git#3c659044118e34603161457db99\
 34a34f816d78b-3c659044118e34603161457db9934a34f816d78b git://git.qemu.org/qemu.git#7d3660e79830a069f1848bb4fa1cdf8f666424fb-20c1df5476e1e9b5d3f5b94f9f3ce01d21f14c46 git://xenbits.xen.org/osstest/seabios.git#2e3de6253422112ae43e608661ba94ea6b345694-88ab0c15525ced2eefe39220742efe4769089ad8 git://xenbits.xen.org/xen.git#b91825f628c9a62cf2a3a0d972ea81484a8b7fce-02d69864b51a4302a148c28d6d391238a6778b4b
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Loaded 125292 nodes in revision graph
Searching for test results:
 151160 pass irrelevant
 151101 pass irrelevant
 151065 [host=fiano0]
 151149 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9af1064995d479df92e399a682ba7e4b2fc78415 3c659044118e34603161457db9934a34f816d78b 7d3660e79830a069f1848bb4fa1cdf8f666424fb 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea81484a8b7fce
 151212 pass irrelevant
 151168 pass irrelevant
 151221 fail irrelevant
 151171 pass irrelevant
 151193 pass irrelevant
 151172 pass irrelevant
 151215 pass irrelevant
 151174 pass irrelevant
 151176 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9af1064995d479df92e399a682ba7e4b2fc78415 3c659044118e34603161457db9934a34f816d78b 7d3660e79830a069f1848bb4fa1cdf8f666424fb 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea81484a8b7fce
 151177 pass irrelevant
 151178 pass irrelevant
 151179 pass irrelevant
 151180 pass irrelevant
 151199 pass irrelevant
 151182 pass irrelevant
 151183 pass irrelevant
 151216 pass irrelevant
 151185 pass irrelevant
 151189 pass irrelevant
 151175 fail irrelevant
 151218 pass irrelevant
 151190 pass irrelevant
 151202 pass irrelevant
 151220 pass irrelevant
 151207 pass irrelevant
 151211 pass irrelevant
 151241 fail irrelevant
 151286 fail irrelevant
 151269 fail irrelevant
 151328 fail irrelevant
 151304 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 322969adf1fb3d6cfbd613f35121315715aff2ed 3c659044118e34603161457db9934a34f816d78b 171199f56f5f9bdf1e5d670d09ef1351d8f01bae 2e3de6253422112ae43e608661ba94ea6b345694 fde76f895d0aa817a1207d844d793239c6639bc6
 151377 fail irrelevant
 151353 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1a992030522622c42aa063788b3276789c56c1e1 3c659044118e34603161457db9934a34f816d78b d4b78317b7cf8c0c635b70086503813f79ff21ec 2e3de6253422112ae43e608661ba94ea6b345694 fde76f895d0aa817a1207d844d793239c6639bc6
 151399 fail irrelevant
 151414 fail irrelevant
 151435 fail irrelevant
 151459 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0f01cec52f4794777feb067e4fa0bfcedfdc124e 3c659044118e34603161457db9934a34f816d78b e7651153a8801dad6805d450ea8bef9b46c1adf5 88ab0c15525ced2eefe39220742efe4769089ad8 88cfd062e8318dfeb67c7d2eb50b6cd224b0738a
 151471 fail irrelevant
 151485 fail irrelevant
 151500 fail irrelevant
 151518 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00217f1919270007d7a911f89b32e39b9dcaa907 3c659044118e34603161457db9934a34f816d78b fc1bff958998910ec8d25db86cd2f53ff125f7ab 88ab0c15525ced2eefe39220742efe4769089ad8 23ca7ec0ba620db52a646d80e22f9703a6589f66
 151547 fail irrelevant
 151598 fail irrelevant
 151577 fail irrelevant
 151622 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b 7b7515702012219410802a168ae4aa45b72a44df 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
 151656 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b eb6490f544388dd24c0d054a96dd304bc7284450 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
 151634 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b eb6490f544388dd24c0d054a96dd304bc7284450 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
 151645 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b eb6490f544388dd24c0d054a96dd304bc7284450 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
 151669 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b eb6490f544388dd24c0d054a96dd304bc7284450 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
 151685 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b eb6490f544388dd24c0d054a96dd304bc7284450 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
 151704 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 627d1d6693b0594d257dbe1a3363a8d4bd4d8307 3c659044118e34603161457db9934a34f816d78b eb6490f544388dd24c0d054a96dd304bc7284450 88ab0c15525ced2eefe39220742efe4769089ad8 be63d9d47f571a60d70f8fb630c03871312d9655
 151778 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bdafda8c457eb90c65f37026589b54258300f05c 3c659044118e34603161457db9934a34f816d78b aff2caf6b3fbab1062e117a47b66d27f7fd2f272 88ab0c15525ced2eefe39220742efe4769089ad8 3fdc211b01b29f252166937238efe02d15cb5780
 151721 fail irrelevant
 151763 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bdafda8c457eb90c65f37026589b54258300f05c 3c659044118e34603161457db9934a34f816d78b 48f22ad04ead83e61b4b35871ec6f6109779b791 88ab0c15525ced2eefe39220742efe4769089ad8 3fdc211b01b29f252166937238efe02d15cb5780
 151744 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bdafda8c457eb90c65f37026589b54258300f05c 3c659044118e34603161457db9934a34f816d78b 8796c64ecdfd34be394ea277aaaaa53df0c76996 88ab0c15525ced2eefe39220742efe4769089ad8 3fdc211b01b29f252166937238efe02d15cb5780
 151804 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bdafda8c457eb90c65f37026589b54258300f05c 3c659044118e34603161457db9934a34f816d78b 45db94cc90c286a9965a285ba19450f448760a09 88ab0c15525ced2eefe39220742efe4769089ad8 3fdc211b01b29f252166937238efe02d15cb5780
 151816 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bdafda8c457eb90c65f37026589b54258300f05c 3c659044118e34603161457db9934a34f816d78b 45db94cc90c286a9965a285ba19450f448760a09 88ab0c15525ced2eefe39220742efe4769089ad8 3fdc211b01b29f252166937238efe02d15cb5780
 151833 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b 827937158b72ce2265841ff528bba3c44a1bfbc8 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b
 151882 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 589b1be07c060e583d9f758ff0cb10e0f1ff242f 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151865 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9af1064995d479df92e399a682ba7e4b2fc78415 3c659044118e34603161457db9934a34f816d78b 7d3660e79830a069f1848bb4fa1cdf8f666424fb 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea81484a8b7fce
 151885 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151866 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b d34498309cff7560ac90c422c56e3137e6a64b19 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b
 151855 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b d34498309cff7560ac90c422c56e3137e6a64b19 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b
 151841 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b 2033cc6efa98b831d7839e367aa7d5aa74d0750f 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b
 151887 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 81cb05732efb36971901c515b007869cc1d3a532 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151868 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 239b50a863704f7960525799eda82de061c7c458 3c659044118e34603161457db9934a34f816d78b eefe34ea4b82c2b47abe28af4cc7247d51553626 2e3de6253422112ae43e608661ba94ea6b345694 25636ed707cf1211ce846c7ec58f8643e435d7a7
 151897 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 81cb05732efb36971901c515b007869cc1d3a532 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151871 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 239b50a863704f7960525799eda82de061c7c458 3c659044118e34603161457db9934a34f816d78b 3f429a3400822141651486193d6af625eeab05a5 2e3de6253422112ae43e608661ba94ea6b345694 71ca0e0ad000e690899936327eb09709ab182ade
 151849 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f45e3a4afa65a45ea1a956a7c5e7410ff40190d1 3c659044118e34603161457db9934a34f816d78b d34498309cff7560ac90c422c56e3137e6a64b19 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b
 151872 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 58ae92a993687d913aa6dd00ef3497a1bc5f6c40 3c659044118e34603161457db9934a34f816d78b 54cdfe511219b8051046be55a6e156c4f08ff7ff 2e3de6253422112ae43e608661ba94ea6b345694 71ca0e0ad000e690899936327eb09709ab182ade
 151888 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151873 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a2433243fbe471c250d7eddc2c7da325d91265fd 3c659044118e34603161457db9934a34f816d78b b77b5b3dc7a4730d804090d359c57d33573cf85a 2e3de6253422112ae43e608661ba94ea6b345694 3625b04991b4d6affadd99d377ab84bac48dfff4
 151876 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b db2322469a245eb9d9aa1c98747f6d595cca8f35 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151877 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 9354eaaf16fdb98651574f131ff66ad974e50bba 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151890 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 81cb05732efb36971901c515b007869cc1d3a532 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151878 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 9940b2cfbc05cdffdf6b42227a80cb1e6d2a85c2 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151879 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 81cb05732efb36971901c515b007869cc1d3a532 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151893 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151880 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 75a6ed875ff0a2eb6b2971ae2098ed09963d7329 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151874 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d9a4084544134eea50f62e88d79c466ae91f0455 3c659044118e34603161457db9934a34f816d78b 20c1df5476e1e9b5d3f5b94f9f3ce01d21f14c46 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b
 151894 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9af1064995d479df92e399a682ba7e4b2fc78415 3c659044118e34603161457db9934a34f816d78b 7d3660e79830a069f1848bb4fa1cdf8f666424fb 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea81484a8b7fce
 151896 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d9a4084544134eea50f62e88d79c466ae91f0455 3c659044118e34603161457db9934a34f816d78b 20c1df5476e1e9b5d3f5b94f9f3ce01d21f14c46 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b
Searching for interesting versions
 Result found: flight 151149 (pass), for basis pass
 Result found: flight 151874 (fail), for basis failure
 Repro found: flight 151894 (pass), for basis pass
 Repro found: flight 151896 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
No revisions left to test, checking graph state.
 Result found: flight 151885 (pass), for last pass
 Result found: flight 151887 (fail), for first failure
 Repro found: flight 151888 (pass), for last pass
 Repro found: flight 151890 (fail), for first failure
 Repro found: flight 151893 (pass), for last pass
 Repro found: flight 151897 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  81cb05732efb36971901c515b007869cc1d3a532
  Bug not present: d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/151897/


  commit 81cb05732efb36971901c515b007869cc1d3a532
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Tue Jun 9 14:23:37 2020 +0200
  
      qdev: Assert devices are plugged into a bus that can take them
      
      This would have caught some of the bugs I just fixed.
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
      Message-Id: <20200609122339.937862-23-armbru@redhat.com>

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.765656 to fit
pnmtopng: 215 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
151897: tolerable ALL FAIL

flight 151897 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/151897/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-qemuu-nested-intel 10 debian-hvm-install fail baseline untested


jobs:
 test-amd64-amd64-qemuu-nested-intel                          fail    


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


