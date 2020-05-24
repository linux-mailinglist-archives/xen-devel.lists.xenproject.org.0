Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFE31DFE8D
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2020 13:20:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcoeP-0007Ij-QF; Sun, 24 May 2020 11:18:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2e/K=7G=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jcoeN-0007Ie-RB
 for xen-devel@lists.xenproject.org; Sun, 24 May 2020 11:18:39 +0000
X-Inumbo-ID: 4cafd6fc-9db0-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4cafd6fc-9db0-11ea-b9cf-bc764e2007e4;
 Sun, 24 May 2020 11:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qGxQlRRf6ezwyBg27yYmb4BFcZKCCcI/Yok8naweY2o=; b=12f8oj+FROYQ3nywm50Clu2xjA
 WYkwOQDNsFQmPd1lI7Ll/nmsKV6bmd8lQ9/wsQYaLkfD0BUuC2g6DKqZbzy3wSZMY6zDtqHWbwuNv
 TfxljmD585COA2ROzYTGoRP0w5LrHzAoibVVDfZCOLe6kGKwXaL//vYbfnyogmDVRLqE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jcoeF-0000CA-14; Sun, 24 May 2020 11:18:31 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jcoeE-0006N6-Oe; Sun, 24 May 2020 11:18:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jcoeE-0005vM-O6; Sun, 24 May 2020 11:18:30 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [libvirt bisection] complete build-arm64-libvirt
Message-Id: <E1jcoeE-0005vM-O6@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 24 May 2020 11:18:30 +0000
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
job build-arm64-libvirt
testid libvirt-build

Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  810613a60efe3924c536b3663246900bc08910a5
  Bug not present: f6a750e678fb0ca3898cba08b6698f079008924c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/146332/


  commit 810613a60efe3924c536b3663246900bc08910a5
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Dec 23 15:37:26 2019 +0000
  
      src: replace strptime()/timegm()/mktime() with GDateTime APIs set
      
      All places where we use strptime/timegm()/mktime() are handling
      conversion of dates in a format compatible with ISO 8601, so we
      can use the GDateTime APIs to simplify code.
      
      Reviewed-by: Fabiano Fidêncio <fidencio@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-arm64-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-arm64-libvirt.libvirt-build --summary-out=tmp/150352.bisection-summary --basis-template=146182 --blessings=real,real-bisect libvirt build-arm64-libvirt libvirt-build
Searching for failure / basis pass:
 150347 fail [host=rochester1] / 146182 [host=laxton0] 146156 [host=rochester0] 146103 [host=rochester0] 146061 [host=laxton1] 145969 [host=laxton1] 145906 [host=rochester0] 145842 [host=laxton0] 145779 [host=laxton1] 145511 [host=laxton1] 145212 [host=rochester0] 145173 [host=laxton0] 145133 [host=laxton0] 145054 [host=laxton1] 144995 [host=laxton1] 144958 [host=laxton1] 144920 [host=laxton1] 144885 [host=laxton1] 144853 [host=laxton1] 144828 [host=laxton1] 144802 [host=laxton0] 144517 [host=la\
 xton1] 144501 [host=laxton1] 144408 [host=rochester0] 144368 [host=laxton0] 144345 [host=rochester0] 144318 [host=laxton0] 144304 [host=laxton0] 144290 [host=laxton1] 144279 [host=rochester0] 144260 [host=laxton1] 144244 [host=laxton0] 144233 [host=laxton0] 144215 [host=rochester0] 144204 [host=laxton0] 144192 [host=laxton1] 144181 [host=laxton0] 144165 [host=laxton0] 144144 [host=laxton1] 144097 [host=laxton0] 143904 [host=rochester0] 143789 [host=rochester0] 143589 [host=laxton0] 143484 [host=\
 laxton1] 143391 [host=laxton1] 143316 [host=rochester0] 143263 [host=rochester0] 143218 [host=rochester0] 143189 [host=laxton0] 143140 [host=laxton1] 143051 ok.
Failure / basis pass flights: 150347 / 143051
(tree in basispass but not in latest: libvirt_gnulib)
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest f718709431429fbb4e1fc6781f3a3752a7f43f70 27acf0ef828bf719b2053ba398b195829413dbdd 1c877c716038a862e876cac8f0929bab4a96e849 410cc30fdc590417ae730d635bbc70257adf6750 7e9db04923854b7f4edca33948f55abee22907b9 5e015d48a5ee68ba03addad2698364d8f015afec
Basis pass 8e09cf1d5a6b8bcf21bfb7d409a2ecf94be54ff1 6280c94f306df6a20bbc100ba15a5a81af0366e6 f413d9bee3f6cabd4b11ad0a1ab9ff865092fb16 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#8e09cf1d5a6b8bcf21bfb7d409a2ecf94be54ff1-f718709431429fbb4e1fc6781f3a3752a7f43f70 https://gitlab.com/keycodemap/keycodemapdb.git#6280c94f306df6a20bbc100ba15a5a81af0366e6-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/osstest/ovmf.git#f413d9bee3f6cabd4b11ad0a1ab9ff865092fb16-1c877c716038a862e876cac8f0929bab4a96e849 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-410cc30f\
 dc590417ae730d635bbc70257adf6750 git://xenbits.xen.org/osstest/seabios.git#120996f147131eca8af90e30c900bc14bc824d9f-7e9db04923854b7f4edca33948f55abee22907b9 git://xenbits.xen.org/xen.git#518c935fac4d30b3ec35d4b6add82b17b7d7aca3-5e015d48a5ee68ba03addad2698364d8f015afec
Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.

Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.

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
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Loaded 126446 nodes in revision graph
Searching for test results:
 143051 pass 8e09cf1d5a6b8bcf21bfb7d409a2ecf94be54ff1 6280c94f306df6a20bbc100ba15a5a81af0366e6 f413d9bee3f6cabd4b11ad0a1ab9ff865092fb16 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143085 [host=laxton0]
 143140 [host=laxton1]
 143189 [host=laxton0]
 143218 [host=rochester0]
 143263 [host=rochester0]
 143316 [host=rochester0]
 143391 [host=laxton1]
 143484 [host=laxton1]
 143589 [host=laxton0]
 143789 [host=rochester0]
 143904 [host=rochester0]
 143957 [host=laxton1]
 143959 [host=laxton1]
 143953 [host=laxton0]
 143935 [host=laxton1]
 143954 [host=laxton1]
 143958 [host=laxton1]
 143961 [host=laxton1]
 143962 [host=laxton1]
 143963 [host=laxton1]
 143964 [host=laxton1]
 143966 [host=laxton1]
 143968 [host=laxton1]
 143969 [host=laxton1]
 143971 [host=laxton1]
 143981 [host=laxton0]
 144004 [host=laxton0]
 144038 [host=laxton0]
 144071 [host=laxton1]
 144127 [host=laxton1]
 144097 [host=laxton0]
 144132 [host=laxton1]
 144144 [host=laxton1]
 144165 [host=laxton0]
 144181 [host=laxton0]
 144187 [host=laxton1]
 144188 [host=laxton1]
 144233 [host=laxton0]
 144192 [host=laxton1]
 144196 [host=laxton0]
 144261 [host=rochester0]
 144215 [host=rochester0]
 144204 [host=laxton0]
 144248 [host=rochester0]
 144270 [host=laxton1]
 144253 [host=laxton1]
 144262 [host=laxton0]
 144254 [host=rochester0]
 144260 [host=laxton1]
 144256 [host=rochester0]
 144244 [host=laxton0]
 144263 [host=laxton1]
 144265 [host=laxton0]
 144257 pass irrelevant
 144259 [host=laxton0]
 144271 [host=laxton0]
 144266 [host=laxton1]
 144273 [host=laxton0]
 144279 [host=rochester0]
 144290 [host=laxton1]
 144304 [host=laxton0]
 144318 [host=laxton0]
 144345 [host=rochester0]
 144348 [host=laxton1]
 144368 [host=laxton0]
 144408 [host=rochester0]
 144501 [host=laxton1]
 144517 [host=laxton1]
 144526 [host=laxton1]
 144581 [host=laxton1]
 144580 [host=laxton1]
 144565 [host=laxton1]
 144567 [host=laxton1]
 144568 [host=laxton1]
 144569 [host=laxton1]
 144570 [host=laxton1]
 144571 [host=laxton1]
 144572 [host=laxton1]
 144573 [host=laxton1]
 144575 [host=laxton1]
 144576 [host=laxton1]
 144577 [host=laxton1]
 144633 [host=laxton1]
 144579 [host=laxton1]
 144615 [host=laxton1]
 144689 [host=laxton0]
 144751 [host=laxton0]
 144802 [host=laxton0]
 144778 [host=laxton1]
 144815 [host=laxton1]
 144817 [host=laxton1]
 144828 [host=laxton1]
 144853 [host=laxton1]
 144885 [host=laxton1]
 144958 [host=laxton1]
 144920 [host=laxton1]
 144995 [host=laxton1]
 145054 [host=laxton1]
 145141 pass irrelevant
 145173 [host=laxton0]
 145146 [host=laxton1]
 145133 [host=laxton0]
 145181 [host=rochester0]
 145212 [host=rochester0]
 145511 [host=laxton1]
 145597 [host=laxton0]
 145582 [host=laxton0]
 145542 [host=laxton0]
 145613 [host=laxton0]
 145584 [host=laxton0]
 145598 [host=laxton0]
 145589 [host=laxton0]
 145606 [host=laxton0]
 145600 [host=laxton0]
 145588 [host=laxton0]
 145590 [host=laxton0]
 145575 [host=laxton0]
 145579 [host=laxton0]
 145591 [host=laxton0]
 145580 [host=laxton0]
 145608 [host=laxton0]
 145593 [host=laxton0]
 145615 [host=laxton0]
 145595 [host=laxton0]
 145609 [host=laxton0]
 145596 [host=laxton0]
 145601 [host=laxton0]
 145616 [host=laxton0]
 145604 [host=laxton0]
 145611 [host=laxton0]
 145612 [host=laxton0]
 145617 [host=laxton0]
 145618 [host=laxton0]
 145619 [host=laxton0]
 145656 [host=laxton1]
 145710 [host=laxton0]
 145779 [host=laxton1]
 145842 [host=laxton0]
 145906 [host=rochester0]
 145969 [host=laxton1]
 146061 [host=laxton1]
 146066 [host=laxton1]
 146103 [host=rochester0]
 146182 [host=laxton0]
 146156 [host=rochester0]
 146240 fail irrelevant
 146211 fail irrelevant
 146298 fail irrelevant
 146314 pass 26d9748ff114a060ee751959d108d062f737f5d9 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146293 pass 8e09cf1d5a6b8bcf21bfb7d409a2ecf94be54ff1 6280c94f306df6a20bbc100ba15a5a81af0366e6 f413d9bee3f6cabd4b11ad0a1ab9ff865092fb16 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 146303 pass 4de5d01a4ee76e6ea31dc61025e26459473d1104 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 146305 fail fe1f2bfbe3ca8944df37c6b77f813eaab572a2f7 317d3eeb963a515e15a63fa356d8ebcda7041a51 49accdedf956f175041040e677163b7cbb746283 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7b3c5b70a32303b46d0d051e695f18d72cce5ed0
 146301 pass 330b55682921886dfc1709b6ab6e3c6e72c25629 317d3eeb963a515e15a63fa356d8ebcda7041a51 665afccc52e1a02ee329147e02f04b8e9cf1d571 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 146299 fail irrelevant
 146304 pass ce33c21f238206706ca62d84ffb1fcb7bba74e89 317d3eeb963a515e15a63fa356d8ebcda7041a51 ec8c74e8bcc66a43ff766254e68b0504f68e024f 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 25164571fc11ed3010c5885a98a68fac3b891d33
 146311 fail fe1f2bfbe3ca8944df37c6b77f813eaab572a2f7 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 34492a38606fe2a1a4fb9ba8f17deb3f656961ee
 146309 pass 6c6d93bc62fd2be9ccf07b579c1f10edd3de7e4c 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5abd9cc2cebe7fac001f7bb7b647c47cf54af1a 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 50ea2445f49825208439c864fecb9d9fd8791277
 146310 pass cf44ec557753c2c266c7cb9d1cf0bceb7d613bec 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146312 pass bf7d2a26a3a6c22dd1adbd144815da12f4a40db4 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146313 fail fe1f2bfbe3ca8944df37c6b77f813eaab572a2f7 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146316 fail 810613a60efe3924c536b3663246900bc08910a5 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146318 pass f6a750e678fb0ca3898cba08b6698f079008924c 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146344 [host=rochester0]
 146320 fail 810613a60efe3924c536b3663246900bc08910a5 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146325 pass f6a750e678fb0ca3898cba08b6698f079008924c 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146327 fail 810613a60efe3924c536b3663246900bc08910a5 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146329 pass f6a750e678fb0ca3898cba08b6698f079008924c 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146332 fail 810613a60efe3924c536b3663246900bc08910a5 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146374 [host=rochester0]
 146410 [host=rochester0]
 146455 [host=rochester0]
 146509 fail irrelevant
 146489 fail irrelevant
 146528 [host=rochester0]
 146546 fail irrelevant
 146565 fail irrelevant
 146586 fail irrelevant
 146616 [host=rochester0]
 146636 fail irrelevant
 146660 fail irrelevant
 146689 [host=rochester0]
 146737 [host=rochester0]
 146756 [host=rochester0]
 146714 [host=rochester0]
 146775 [host=rochester0]
 146799 [host=rochester0]
 146843 [host=rochester0]
 146921 [host=rochester0]
 146995 fail irrelevant
 147040 fail irrelevant
 147084 fail irrelevant
 147141 fail irrelevant
 147195 fail irrelevant
 147265 fail irrelevant
 147340 fail irrelevant
 147419 [host=rochester0]
 147477 fail irrelevant
 147520 [host=rochester0]
 147583 [host=rochester0]
 147649 fail irrelevant
 147703 [host=rochester0]
 147784 [host=rochester0]
 147736 [host=rochester0]
 147885 [host=rochester0]
 147831 [host=rochester0]
 147981 [host=rochester0]
 148068 [host=rochester0]
 148144 [host=rochester0]
 148196 fail irrelevant
 148269 fail irrelevant
 148331 [host=rochester0]
 148406 [host=rochester0]
 148459 fail irrelevant
 148503 fail irrelevant
 148547 [host=rochester0]
 148615 [host=rochester0]
 148583 [host=rochester0]
 148651 fail irrelevant
 148688 [host=rochester0]
 148729 [host=rochester0]
 148775 [host=rochester0]
 148799 fail irrelevant
 148830 [host=rochester0]
 148887 [host=rochester0]
 148940 [host=rochester0]
 148941 [host=rochester0]
 148943 [host=rochester0]
 148944 [host=rochester0]
 148954 fail irrelevant
 148947 [host=rochester0]
 148915 [host=rochester0]
 148948 [host=rochester0]
 148929 [host=rochester0]
 148950 [host=rochester0]
 148931 [host=rochester0]
 148934 [host=rochester0]
 148936 [host=rochester0]
 148951 [host=rochester0]
 148955 [host=rochester0]
 148956 [host=rochester0]
 148958 [host=rochester0]
 149001 [host=rochester0]
 149043 [host=rochester0]
 149074 [host=rochester0]
 149123 [host=rochester0]
 149154 [host=rochester0]
 149193 [host=rochester0]
 149234 fail irrelevant
 149268 [host=rochester0]
 149314 [host=rochester0]
 149376 [host=rochester0]
 149407 [host=rochester0]
 149434 [host=rochester0]
 149455 fail irrelevant
 149482 fail irrelevant
 149550 [host=rochester0]
 149508 [host=rochester0]
 149590 [host=rochester0]
 149643 [host=rochester0]
 149629 [host=rochester0]
 149615 [host=rochester0]
 149635 fail irrelevant
 149684 fail irrelevant
 149666 fail irrelevant
 149696 fail irrelevant
 149732 fail irrelevant
 149773 fail irrelevant
 149746 fail irrelevant
 149803 fail irrelevant
 149826 fail irrelevant
 149886 fail irrelevant
 149833 fail irrelevant
 149850 fail irrelevant
 149870 fail irrelevant
 149909 fail de7e9840e7f888f1a872c86b0cb793b283193137 317d3eeb963a515e15a63fa356d8ebcda7041a51 e54310451f1ac2ce4ccb90a110f45bb9b4f3ccd6 410cc30fdc590417ae730d635bbc70257adf6750 eaaf726038cb9b2d01312d6430b4e93842aa96eb 0135be8bd8cd60090298f02310691b688d95c3a8
 149902 fail de7e9840e7f888f1a872c86b0cb793b283193137 317d3eeb963a515e15a63fa356d8ebcda7041a51 e54310451f1ac2ce4ccb90a110f45bb9b4f3ccd6 410cc30fdc590417ae730d635bbc70257adf6750 eaaf726038cb9b2d01312d6430b4e93842aa96eb 0135be8bd8cd60090298f02310691b688d95c3a8
 149895 fail irrelevant
 150053 fail irrelevant
 150062 fail irrelevant
 150083 fail irrelevant
 150099 fail irrelevant
 150121 fail 23bf93884c6346206e87c0f14d93f905e8c81267 27acf0ef828bf719b2053ba398b195829413dbdd c8543b8d830d22882dab4ece47f0413f9c6eb431 410cc30fdc590417ae730d635bbc70257adf6750 eaaf726038cb9b2d01312d6430b4e93842aa96eb e0d92d9bd7997c6bcda17a19aba4f3957dd1a2e9
 150155 fail 65a12c467cd683809b4d445b8cf1c3ae250209b2 27acf0ef828bf719b2053ba398b195829413dbdd 88899a372cfc44f8612315f4b43a084d1814fe69 410cc30fdc590417ae730d635bbc70257adf6750 eaaf726038cb9b2d01312d6430b4e93842aa96eb a82582b1af6a4a57ca53bcfad9f71428cb5f9a54
 150131 fail 23bf93884c6346206e87c0f14d93f905e8c81267 27acf0ef828bf719b2053ba398b195829413dbdd c8543b8d830d22882dab4ece47f0413f9c6eb431 410cc30fdc590417ae730d635bbc70257adf6750 eaaf726038cb9b2d01312d6430b4e93842aa96eb e0d92d9bd7997c6bcda17a19aba4f3957dd1a2e9
 150146 fail irrelevant
 150170 fail irrelevant
 150210 fail irrelevant
 150228 fail 144dfe4215902b40a9d17fdb326054bbd8e07563 27acf0ef828bf719b2053ba398b195829413dbdd 9099dcbd61c8d22b5eedda783d143c222d2705a3 410cc30fdc590417ae730d635bbc70257adf6750 665dce17c04b574bb0ebcde4cac129c3dd9e681c 664e1bc12f8658da124a4eff7a8f16da073bd47f
 150190 []
 150222 fail 144dfe4215902b40a9d17fdb326054bbd8e07563 27acf0ef828bf719b2053ba398b195829413dbdd 9099dcbd61c8d22b5eedda783d143c222d2705a3 410cc30fdc590417ae730d635bbc70257adf6750 665dce17c04b574bb0ebcde4cac129c3dd9e681c 57880053dd24012e9f59c23b630fefe07e15dc49
 150237 fail irrelevant
 150268 fail irrelevant
 150287 fail irrelevant
 150347 fail f718709431429fbb4e1fc6781f3a3752a7f43f70 27acf0ef828bf719b2053ba398b195829413dbdd 1c877c716038a862e876cac8f0929bab4a96e849 410cc30fdc590417ae730d635bbc70257adf6750 7e9db04923854b7f4edca33948f55abee22907b9 5e015d48a5ee68ba03addad2698364d8f015afec
 150351 pass 8e09cf1d5a6b8bcf21bfb7d409a2ecf94be54ff1 6280c94f306df6a20bbc100ba15a5a81af0366e6 f413d9bee3f6cabd4b11ad0a1ab9ff865092fb16 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 150352 fail f718709431429fbb4e1fc6781f3a3752a7f43f70 27acf0ef828bf719b2053ba398b195829413dbdd 1c877c716038a862e876cac8f0929bab4a96e849 410cc30fdc590417ae730d635bbc70257adf6750 7e9db04923854b7f4edca33948f55abee22907b9 5e015d48a5ee68ba03addad2698364d8f015afec
 150317 fail irrelevant
 150339 fail irrelevant
Searching for interesting versions
 Result found: flight 143051 (pass), for basis pass
 Result found: flight 150347 (fail), for basis failure
 Repro found: flight 150351 (pass), for basis pass
 Repro found: flight 150352 (fail), for basis failure
 0 revisions at f6a750e678fb0ca3898cba08b6698f079008924c 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
No revisions left to test, checking graph state.
 Result found: flight 146318 (pass), for last pass
 Result found: flight 146320 (fail), for first failure
 Repro found: flight 146325 (pass), for last pass
 Repro found: flight 146327 (fail), for first failure
 Repro found: flight 146329 (pass), for last pass
 Repro found: flight 146332 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  810613a60efe3924c536b3663246900bc08910a5
  Bug not present: f6a750e678fb0ca3898cba08b6698f079008924c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/146332/

Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.


  commit 810613a60efe3924c536b3663246900bc08910a5
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Dec 23 15:37:26 2019 +0000
  
      src: replace strptime()/timegm()/mktime() with GDateTime APIs set
      
      All places where we use strptime/timegm()/mktime() are handling
      conversion of dates in a format compatible with ISO 8601, so we
      can use the GDateTime APIs to simplify code.
      
      Reviewed-by: Fabiano Fidêncio <fidencio@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.124825 to fit
pnmtopng: 42 colors found
Revision graph left in /home/logs/results/bisect/libvirt/build-arm64-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
150352: tolerable FAIL

flight 150352 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/150352/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-arm64-libvirt           6 libvirt-build           fail baseline untested


jobs:
 build-arm64                                                  pass    
 build-arm64-libvirt                                          fail    


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


