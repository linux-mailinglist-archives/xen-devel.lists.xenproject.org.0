Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF75A8A4062
	for <lists+xen-devel@lfdr.de>; Sun, 14 Apr 2024 07:06:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.705372.1102105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvs3H-00064R-2V; Sun, 14 Apr 2024 05:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 705372.1102105; Sun, 14 Apr 2024 05:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvs3G-00062P-VW; Sun, 14 Apr 2024 05:05:14 +0000
Received: by outflank-mailman (input) for mailman id 705372;
 Sun, 14 Apr 2024 05:05:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvs3F-00062F-Hs; Sun, 14 Apr 2024 05:05:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvs3F-0007WP-0e; Sun, 14 Apr 2024 05:05:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvs3E-0005VG-Nh; Sun, 14 Apr 2024 05:05:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rvs3E-0000fK-NF; Sun, 14 Apr 2024 05:05:12 +0000
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
	bh=e9Ltcll+SjiVX5+9iRAZqse572y9rIMk0//un/gslGQ=; b=Dd7u4OYFYqnxxN+yvUdwKj+VWQ
	o0bgLbiaxGYbQKUD6Tu1Mr0afdhxsdZIj3pydvNVOH4326r9kXVdi3xb5S52Ce5gVAG2yCqIcgYdD
	jKqAR/DvH4KZWCmR9xQlGille31tmahEtOrTjLulZOhrMjb3K6vA7gEcCb2QKsVFPT1c=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.17-testing bisection] complete test-amd64-amd64-xl-vhd
Message-Id: <E1rvs3E-0000fK-NF@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 14 Apr 2024 05:05:12 +0000

branch xen-4.17-testing
xenbranch xen-4.17-testing
job test-amd64-amd64-xl-vhd
testid debian-di-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  19887194865cff7d87650c323d5c6b185dfe3ddc
  Bug not present: b8f39fd4d024ea72c586f1afd233f379c6f6230b
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/185474/


  commit 19887194865cff7d87650c323d5c6b185dfe3ddc
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Tue Mar 26 22:47:25 2024 +0000
  
      x86/spec-ctrl: Fix BTC/SRSO mitigations
      
      We were looking for SCF_entry_ibpb in the wrong variable in the top-of-stack
      block, and xen_spec_ctrl won't have had bit 5 set because Xen doesn't
      understand SPEC_CTRL_RRSBA_DIS_U yet.
      
      This is XSA-455 / CVE-2024-31142.
      
      Fixes: 53a570b28569 ("x86/spec-ctrl: Support IBPB-on-entry")
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.17-testing/test-amd64-amd64-xl-vhd.debian-di-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.17-testing/test-amd64-amd64-xl-vhd.debian-di-install --summary-out=tmp/185474.bisection-summary --basis-template=185284 --blessings=real,real-bisect,real-retry xen-4.17-testing test-amd64-amd64-xl-vhd debian-di-install
Searching for failure / basis pass:
 185400 fail [host=rimava1] / 185284 [host=pinot0] 185217 [host=pinot1] 185180 [host=elbling0] 185171 ok.
Failure / basis pass flights: 185400 / 185171
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest bf1e3b1cb1e002ed1590c91f1a24433b59322368 c530a75c1e6a472b0eb9558310b518f0dfcd8860 98f150a954b35cc74bd87ae355cf35d8c9e1580d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 5d9a931fe2c1310dbfd946bbc1e22a177add4f5c
Basis pass d7543167affd372819a94879b8b1e8b9b12547d9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cf58f47623c40a66b160face4f04e08efb4c7f5b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 1588fd1437960d94cadc30c42243671e8c0f1281 bfb69205376d94ff91b09a337c47fb665ee12da3
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#d7543167affd372819a94879b8b1e8b9b12547d9-bf1e3b1cb1e002ed1590c91f1a24433b59322368 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#cf58f47623c40a66b160face4f04e08efb4c7f5b-98f150a954b35cc74bd87ae355cf35d8c9e1580d git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#ffb451126550b22b43b62fb8731a0d78e3376c03-ffb451126550b22b43b62fb8731a0d78e3376c03 git://xenbits.xen.org/osstest/seabios.git#1588fd1437960d94cadc30c42243671e8c0f1281-c5a361c09a19e3b1a83557b01f11f04b27181a11 git://xenbits.xen.org/xen.git#bfb69205376d94ff91b09a337c47fb665ee12da3-5d9a931fe2c1310dbfd946bbc1e22a177add4f5c
Loaded 13547 nodes in revision graph
Searching for test results:
 185180 [host=elbling0]
 185171 pass d7543167affd372819a94879b8b1e8b9b12547d9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cf58f47623c40a66b160face4f04e08efb4c7f5b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 1588fd1437960d94cadc30c42243671e8c0f1281 bfb69205376d94ff91b09a337c47fb665ee12da3
 185217 [host=pinot1]
 185284 [host=pinot0]
 185300 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 963671d3801a6992d1aa06f05d86e32efa6b205e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 d530627aaa9b6e03c7f911434bb342fca3d13300
 185388 pass d7543167affd372819a94879b8b1e8b9b12547d9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cf58f47623c40a66b160face4f04e08efb4c7f5b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 1588fd1437960d94cadc30c42243671e8c0f1281 bfb69205376d94ff91b09a337c47fb665ee12da3
 185393 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 963671d3801a6992d1aa06f05d86e32efa6b205e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 d530627aaa9b6e03c7f911434bb342fca3d13300
 185318 fail irrelevant
 185397 pass 149afee5c7418ec5db9d7387b9c9a5c1eb7ea2a8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cf58f47623c40a66b160face4f04e08efb4c7f5b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 1588fd1437960d94cadc30c42243671e8c0f1281 bfb69205376d94ff91b09a337c47fb665ee12da3
 185401 fail irrelevant
 185406 pass 3070c70a3e46165e4828d519944694694d76a963 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b3871141136ac643332587f33f2e4fa78d72eb07 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 913680885350f92965d70122f6fd54406c49af7d 9bc40dbcf9eafccc1923b2555286bf6a2af03b7a
 185411 pass 9dac54f08198147f5ec0ec52fcf1bc8ac899ac05 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b3871141136ac643332587f33f2e4fa78d72eb07 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 913680885350f92965d70122f6fd54406c49af7d 9bc40dbcf9eafccc1923b2555286bf6a2af03b7a
 185418 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 c98c14576f1a93519402a8e2f4736b479ad6007c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 9bc40dbcf9eafccc1923b2555286bf6a2af03b7a
 185422 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 6b899fe735d040356ead7170e0fe10f6668624d0
 185400 fail bf1e3b1cb1e002ed1590c91f1a24433b59322368 c530a75c1e6a472b0eb9558310b518f0dfcd8860 98f150a954b35cc74bd87ae355cf35d8c9e1580d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 5d9a931fe2c1310dbfd946bbc1e22a177add4f5c
 185426 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 653560e02d40c480d08032f3cf1e450db79f5d71
 185431 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 4f7656fe8ed94d07f7de9a4274cd2a47675fb178
 185438 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 b8f39fd4d024ea72c586f1afd233f379c6f6230b
 185443 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 19887194865cff7d87650c323d5c6b185dfe3ddc
 185451 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 b8f39fd4d024ea72c586f1afd233f379c6f6230b
 185456 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 19887194865cff7d87650c323d5c6b185dfe3ddc
 185465 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 b8f39fd4d024ea72c586f1afd233f379c6f6230b
 185474 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 19887194865cff7d87650c323d5c6b185dfe3ddc
Searching for interesting versions
 Result found: flight 185171 (pass), for basis pass
 For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 b8f39fd4d024ea72c586f1afd233f379c6f6230b, results HASH(0x55ab437c4428) HASH(0x55ab43726710) HASH(0x55ab4376e408) For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 4f7656fe8ed94d07f7de9a4274cd2a47675fb178, results HASH(0x55ab437d05a0) For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 c98c14576f1a93519402a8e2f4736b479ad6007c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8\
 731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 9bc40dbcf9eafccc1923b2555286bf6a2af03b7a, results HASH(0x55ab437d16a8) For basis failure, parent search stopping at 9dac54f08198147f5ec0ec52fcf1bc8ac899ac05 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b3871141136ac643332587f33f2e4fa78d72eb07 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 913680885350f92965d70122f6fd54406c49af7d 9bc40dbcf9eafccc1923b2555286bf6a2af03b7a, results HASH(0x55ab437c3020) For basis\
  failure, parent search stopping at 3070c70a3e46165e4828d519944694694d76a963 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b3871141136ac643332587f33f2e4fa78d72eb07 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 913680885350f92965d70122f6fd54406c49af7d 9bc40dbcf9eafccc1923b2555286bf6a2af03b7a, results HASH(0x55ab437b4398) For basis failure, parent search stopping at 149afee5c7418ec5db9d7387b9c9a5c1eb7ea2a8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cf58f47623c40a66b160\
 face4f04e08efb4c7f5b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 1588fd1437960d94cadc30c42243671e8c0f1281 bfb69205376d94ff91b09a337c47fb665ee12da3, results HASH(0x55ab43790c50) For basis failure, parent search stopping at d7543167affd372819a94879b8b1e8b9b12547d9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cf58f47623c40a66b160face4f04e08efb4c7f5b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 1588fd1437960d94cadc30c42243671e8c0\
 f1281 bfb69205376d94ff91b09a337c47fb665ee12da3, results HASH(0x55ab437833d0) HASH(0x55ab43795288) Result found: flight 185300 (fail), for basis failure (at ancestor ~2024)
 Repro found: flight 185388 (pass), for basis pass
 Repro found: flight 185400 (fail), for basis failure
 0 revisions at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 c5a361c09a19e3b1a83557b01f11f04b27181a11 b8f39fd4d024ea72c586f1afd233f379c6f6230b
No revisions left to test, checking graph state.
 Result found: flight 185438 (pass), for last pass
 Result found: flight 185443 (fail), for first failure
 Repro found: flight 185451 (pass), for last pass
 Repro found: flight 185456 (fail), for first failure
 Repro found: flight 185465 (pass), for last pass
 Repro found: flight 185474 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  19887194865cff7d87650c323d5c6b185dfe3ddc
  Bug not present: b8f39fd4d024ea72c586f1afd233f379c6f6230b
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/185474/


  commit 19887194865cff7d87650c323d5c6b185dfe3ddc
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Tue Mar 26 22:47:25 2024 +0000
  
      x86/spec-ctrl: Fix BTC/SRSO mitigations
      
      We were looking for SCF_entry_ibpb in the wrong variable in the top-of-stack
      block, and xen_spec_ctrl won't have had bit 5 set because Xen doesn't
      understand SPEC_CTRL_RRSBA_DIS_U yet.
      
      This is XSA-455 / CVE-2024-31142.
      
      Fixes: 53a570b28569 ("x86/spec-ctrl: Support IBPB-on-entry")
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.586382 to fit
pnmtopng: 46 colors found
Revision graph left in /home/logs/results/bisect/xen-4.17-testing/test-amd64-amd64-xl-vhd.debian-di-install.{dot,ps,png,html,svg}.
----------------------------------------
185474: tolerable ALL FAIL

flight 185474 xen-4.17-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/185474/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-vhd      12 debian-di-install       fail baseline untested


jobs:
 test-amd64-amd64-xl-vhd                                      fail    


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


