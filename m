Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE8F20425E
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 23:01:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnTZF-0002aw-Lu; Mon, 22 Jun 2020 21:01:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bzxb=AD=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jnTZD-0002aa-Ko
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 21:01:23 +0000
X-Inumbo-ID: 834b92c8-b4cb-11ea-8496-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 834b92c8-b4cb-11ea-8496-bc764e2007e4;
 Mon, 22 Jun 2020 21:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SUdG+LnLv3W/YDt8N+Cr2enhbpty9uMhV6qQnjBWJOw=; b=RPCoQWmpMwW3zi6CXXu3dr+T0Y
 l1IqISr00kxwtJrKN4/KkYIeezLXw9kjBeZXB9ktcNpYmLqY3JptIqw8RN4p9QA030RkvlCyr4I6a
 ANImOrEpjXXJqWndXeBY8thXut0E9qW3e4YzdWq+geubyx/Hg5o2BY1mpJXljyVMNrK0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jnTZ5-0008Bn-Ky; Mon, 22 Jun 2020 21:01:15 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jnTZ5-0007uV-4h; Mon, 22 Jun 2020 21:01:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jnTZ5-0004rr-45; Mon, 22 Jun 2020 21:01:15 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-i386-freebsd10-amd64
Message-Id: <E1jnTZ5-0004rr-45@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 22 Jun 2020 21:01:15 +0000
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
job test-amd64-i386-freebsd10-amd64
testid guest-start

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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/151298/


  commit 81cb05732efb36971901c515b007869cc1d3a532
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Tue Jun 9 14:23:37 2020 +0200
  
      qdev: Assert devices are plugged into a bus that can take them
      
      This would have caught some of the bugs I just fixed.
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
      Message-Id: <20200609122339.937862-23-armbru@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-i386-freebsd10-amd64.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-i386-freebsd10-amd64.guest-start --summary-out=tmp/151298.bisection-summary --basis-template=151065 --blessings=real,real-bisect qemu-mainline test-amd64-i386-freebsd10-amd64 guest-start
Searching for failure / basis pass:
 151269 fail [host=chardonnay1] / 151149 [host=pinot1] 151101 [host=fiano1] 151065 [host=huxelrebe0] 151047 [host=fiano0] 150970 [host=pinot0] 150930 [host=huxelrebe1] 150916 [host=elbling0] 150909 [host=huxelrebe0] 150895 [host=debina1] 150831 [host=elbling1] 150694 [host=fiano0] 150631 ok.
Failure / basis pass flights: 151269 / 150631
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 239b50a863704f7960525799eda82de061c7c458 3c659044118e34603161457db9934a34f816d78b 06c4cc3660b366278bdc7bc8b6677032d7b1118c 2e3de6253422112ae43e608661ba94ea6b345694 3625b04991b4d6affadd99d377ab84bac48dfff4
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9 3c659044118e34603161457db9934a34f816d78b 5cc7a54c2e91d82cb6a52e4921325c511fd90712 2e3de6253422112ae43e608661ba94ea6b345694 1497e78068421d83956f8e82fb6e1bf1fc3b1199
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9-239b50a863704f7960525799eda82de061c7c458 git://xenbits.xen.org/qemu-xen-traditional.git#3c659044118e34603161457db99\
 34a34f816d78b-3c659044118e34603161457db9934a34f816d78b git://git.qemu.org/qemu.git#5cc7a54c2e91d82cb6a52e4921325c511fd90712-06c4cc3660b366278bdc7bc8b6677032d7b1118c git://xenbits.xen.org/osstest/seabios.git#2e3de6253422112ae43e608661ba94ea6b345694-2e3de6253422112ae43e608661ba94ea6b345694 git://xenbits.xen.org/xen.git#1497e78068421d83956f8e82fb6e1bf1fc3b1199-3625b04991b4d6affadd99d377ab84bac48dfff4
Loaded 84118 nodes in revision graph
Searching for test results:
 150631 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9 3c659044118e34603161457db9934a34f816d78b 5cc7a54c2e91d82cb6a52e4921325c511fd90712 2e3de6253422112ae43e608661ba94ea6b345694 1497e78068421d83956f8e82fb6e1bf1fc3b1199
 150694 [host=fiano0]
 150831 [host=elbling1]
 150909 [host=huxelrebe0]
 150930 [host=huxelrebe1]
 150916 [host=elbling0]
 150895 [host=debina1]
 150899 []
 150970 [host=pinot0]
 151047 [host=fiano0]
 151101 [host=fiano1]
 151065 [host=huxelrebe0]
 151149 [host=pinot1]
 151244 pass irrelevant
 151221 fail irrelevant
 151239 blocked irrelevant
 151253 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 567bc4b4ae8a975791382dd30ac413bc0d3ce88c 3c659044118e34603161457db9934a34f816d78b eea8f5df4ecc607d64f091b8d916fcc11a697541 2e3de6253422112ae43e608661ba94ea6b345694 2995d0afdf2d3fb44d07eada088db3613741db1e
 151175 fail irrelevant
 151257 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 567bc4b4ae8a975791382dd30ac413bc0d3ce88c 3c659044118e34603161457db9934a34f816d78b 3575b0aea983ad57804c9af739ed8ff7bc168393 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea81484a8b7fce
 151240 fail irrelevant
 151250 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e1d24410da356731da70b3334f86343e11e207d2 3c659044118e34603161457db9934a34f816d78b 470dd165d152ff7ceac61c7b71c2b89220b3aad7 2e3de6253422112ae43e608661ba94ea6b345694 6a49b9a7920c82015381740905582b666160d955
 151242 fail irrelevant
 151222 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9 3c659044118e34603161457db9934a34f816d78b 5cc7a54c2e91d82cb6a52e4921325c511fd90712 2e3de6253422112ae43e608661ba94ea6b345694 1497e78068421d83956f8e82fb6e1bf1fc3b1199
 151238 fail irrelevant
 151243 pass irrelevant
 151247 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3ee4f6cb360a877d171f2f9bb76b0d46d2cfa985 3c659044118e34603161457db9934a34f816d78b 9f1f264edbdf5516d6f208497310b3eedbc7b74c 2e3de6253422112ae43e608661ba94ea6b345694 2995d0afdf2d3fb44d07eada088db3613741db1e
 151256 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6ff7c838d09224dd4e4c9b5b93152d8db1b19740 3c659044118e34603161457db9934a34f816d78b 86e8c353f705f14f2f2fd7a6195cefa431aa24d9 2e3de6253422112ae43e608661ba94ea6b345694 058023b343d4e366864831db46e9b438e9e3a178
 151258 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6ff7c838d09224dd4e4c9b5b93152d8db1b19740 3c659044118e34603161457db9934a34f816d78b 49ee11555262a256afec592dfed7c5902d5eefd2 2e3de6253422112ae43e608661ba94ea6b345694 726c78d14dfe6ec76f5e4c7756821a91f0a04b34
 151259 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8035edbe12f0f2a58e8fa9b06d05c8ee1c69ffae 3c659044118e34603161457db9934a34f816d78b 5d2f557b47dfbf8f23277a5bdd8473d4607c681a 2e3de6253422112ae43e608661ba94ea6b345694 51ca66c37371b10b378513af126646de22eddb17
 151267 fail irrelevant
 151261 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8035edbe12f0f2a58e8fa9b06d05c8ee1c69ffae 3c659044118e34603161457db9934a34f816d78b 7d2410cea154bf915fb30179ebda3b17ac36e70e 2e3de6253422112ae43e608661ba94ea6b345694 780aba2779b834f19b2a6f0dcdea0e7e0b5e1622
 151241 fail irrelevant
 151262 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8035edbe12f0f2a58e8fa9b06d05c8ee1c69ffae 3c659044118e34603161457db9934a34f816d78b d64c1bd6ca0323e9e5e848c6a8193dc12ab1273e 2e3de6253422112ae43e608661ba94ea6b345694 51ca66c37371b10b378513af126646de22eddb17
 151266 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9 3c659044118e34603161457db9934a34f816d78b 5cc7a54c2e91d82cb6a52e4921325c511fd90712 2e3de6253422112ae43e608661ba94ea6b345694 1497e78068421d83956f8e82fb6e1bf1fc3b1199
 151297 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151270 fail irrelevant
 151298 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 81cb05732efb36971901c515b007869cc1d3a532 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151272 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 58ae92a993687d913aa6dd00ef3497a1bc5f6c40 3c659044118e34603161457db9934a34f816d78b 54cdfe511219b8051046be55a6e156c4f08ff7ff 2e3de6253422112ae43e608661ba94ea6b345694 3625b04991b4d6affadd99d377ab84bac48dfff4
 151274 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a2433243fbe471c250d7eddc2c7da325d91265fd 3c659044118e34603161457db9934a34f816d78b 6675a653d2e57ab09c32c0ea7b44a1d6c40a7f58 2e3de6253422112ae43e608661ba94ea6b345694 3625b04991b4d6affadd99d377ab84bac48dfff4
 151275 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 53550e81e2cafe7c03a39526b95cd21b5194d9b1 2e3de6253422112ae43e608661ba94ea6b345694 3625b04991b4d6affadd99d377ab84bac48dfff4
 151277 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 250bc43a406f7d46e319abe87c19548d4f027828 2e3de6253422112ae43e608661ba94ea6b345694 3371ced37ced359167b5a71abee2062854371323
 151278 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 567bc4b4ae8a975791382dd30ac413bc0d3ce88c 3c659044118e34603161457db9934a34f816d78b 23374a84c5f08e20ec2506a6322330d51f9134c5 2e3de6253422112ae43e608661ba94ea6b345694 2995d0afdf2d3fb44d07eada088db3613741db1e
 151280 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b da9630c57ee386f8beb571ba6bb4a98d546c42ca 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151281 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 7d3660e79830a069f1848bb4fa1cdf8f666424fb 2e3de6253422112ae43e608661ba94ea6b345694 b91825f628c9a62cf2a3a0d972ea81484a8b7fce
 151282 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b efa0559547e7e2c10dee16a78066176c1ea75e97 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151269 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 239b50a863704f7960525799eda82de061c7c458 3c659044118e34603161457db9934a34f816d78b 06c4cc3660b366278bdc7bc8b6677032d7b1118c 2e3de6253422112ae43e608661ba94ea6b345694 3625b04991b4d6affadd99d377ab84bac48dfff4
 151284 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 75a6ed875ff0a2eb6b2971ae2098ed09963d7329 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151285 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9 3c659044118e34603161457db9934a34f816d78b 5cc7a54c2e91d82cb6a52e4921325c511fd90712 2e3de6253422112ae43e608661ba94ea6b345694 1497e78068421d83956f8e82fb6e1bf1fc3b1199
 151287 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 239b50a863704f7960525799eda82de061c7c458 3c659044118e34603161457db9934a34f816d78b 06c4cc3660b366278bdc7bc8b6677032d7b1118c 2e3de6253422112ae43e608661ba94ea6b345694 3625b04991b4d6affadd99d377ab84bac48dfff4
 151289 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 007d1dbf72536ec1b847a944832e4de1546af2ac 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151291 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151293 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 81cb05732efb36971901c515b007869cc1d3a532 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151294 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
 151296 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b 81cb05732efb36971901c515b007869cc1d3a532 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
Searching for interesting versions
 Result found: flight 150631 (pass), for basis pass
 Result found: flight 151269 (fail), for basis failure (at ancestor ~1)
 Repro found: flight 151285 (pass), for basis pass
 Repro found: flight 151287 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 3c659044118e34603161457db9934a34f816d78b d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a 2e3de6253422112ae43e608661ba94ea6b345694 1251402caf8685f45d9d580f01583370f7e2d272
No revisions left to test, checking graph state.
 Result found: flight 151291 (pass), for last pass
 Result found: flight 151293 (fail), for first failure
 Repro found: flight 151294 (pass), for last pass
 Repro found: flight 151296 (fail), for first failure
 Repro found: flight 151297 (pass), for last pass
 Repro found: flight 151298 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  81cb05732efb36971901c515b007869cc1d3a532
  Bug not present: d6b78ac8ecf94f56dbfbecc23fb4365d8772a41a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/151298/


  commit 81cb05732efb36971901c515b007869cc1d3a532
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Tue Jun 9 14:23:37 2020 +0200
  
      qdev: Assert devices are plugged into a bus that can take them
      
      This would have caught some of the bugs I just fixed.
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
      Message-Id: <20200609122339.937862-23-armbru@redhat.com>

pnmtopng: 230 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-i386-freebsd10-amd64.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
151298: tolerable ALL FAIL

flight 151298 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/151298/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-freebsd10-amd64 11 guest-start          fail baseline untested


jobs:
 test-amd64-i386-freebsd10-amd64                              fail    


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


