Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1C8142DCA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 15:40:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itYB9-0004Tt-CD; Mon, 20 Jan 2020 14:37:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l8ur=3J=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1itYB8-0004To-LF
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 14:37:22 +0000
X-Inumbo-ID: 57250394-3b92-11ea-b987-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57250394-3b92-11ea-b987-12813bfff9fa;
 Mon, 20 Jan 2020 14:37:10 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1itYAv-0000Wi-SZ; Mon, 20 Jan 2020 14:37:09 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1itYAv-0007F1-Fm; Mon, 20 Jan 2020 14:37:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1itYAv-0004CQ-Dt; Mon, 20 Jan 2020 14:37:09 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1itYAv-0004CQ-Dt@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 20 Jan 2020 14:37:09 +0000
Subject: [Xen-devel] [libvirt bisection] complete build-arm64-libvirt
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5894033209016664240=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5894033209016664240==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-arm64-libvirt
testid libvirt-build

Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
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
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-arm64-libvirt.libvirt-build --summary-out=tmp/146332.bisection-summary --basis-template=146182 --blessings=real,real-bisect libvirt build-arm64-libvirt libvirt-build
Searching for failure / basis pass:
 146299 fail [host=rochester1] / 146182 [host=laxton0] 146156 [host=rochester0] 146103 [host=rochester0] 146061 [host=laxton1] 145969 [host=laxton1] 145906 [host=rochester0] 145842 [host=laxton0] 145779 [host=laxton1] 145511 [host=laxton1] 145212 [host=rochester0] 145173 [host=laxton0] 145133 [host=laxton0] 145054 [host=laxton1] 144995 [host=laxton1] 144958 [host=laxton1] 144920 [host=laxton1] 144885 [host=laxton1] 144853 [host=laxton1] 144828 [host=laxton1] 144802 [host=laxton0] 144517 [host=la\
 xton1] 144501 [host=laxton1] 144408 [host=rochester0] 144368 [host=laxton0] 144345 [host=rochester0] 144318 [host=laxton0] 144304 [host=laxton0] 144290 [host=laxton1] 144279 [host=rochester0] 144260 [host=laxton1] 144244 [host=laxton0] 144233 [host=laxton0] 144215 [host=rochester0] 144204 [host=laxton0] 144192 [host=laxton1] 144181 [host=laxton0] 144165 [host=laxton0] 144144 [host=laxton1] 144097 [host=laxton0] 143904 [host=rochester0] 143789 [host=rochester0] 143589 [host=laxton0] 143484 [host=\
 laxton1] 143391 [host=laxton1] 143316 [host=rochester0] 143263 [host=rochester0] 143218 [host=rochester0] 143189 [host=laxton0] 143140 [host=laxton1] 143051 ok.
Failure / basis pass flights: 146299 / 143051
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2feaa925bba06e77be918bcbfab63bc8201c8f19 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
Basis pass 8e09cf1d5a6b8bcf21bfb7d409a2ecf94be54ff1 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 f413d9bee3f6cabd4b11ad0a1ab9ff865092fb16 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#8e09cf1d5a6b8bcf21bfb7d409a2ecf94be54ff1-2feaa925bba06e77be918bcbfab63bc8201c8f19 https://git.savannah.gnu.org/git/gnulib.git/#1f6fb368c04919243e2c70f2aa514a5f88e95309-611869be9f1083e53305446d90a2909fc89914ef https://gitlab.com/keycodemap/keycodemapdb.git#6280c94f306df6a20bbc100ba15a5a81af0366e6-317d3eeb963a515e15a63fa356d8ebcda7041a51 git://xenbits.xen.org/osstest/ovmf.git#f413d9bee3f6cabd4b11ad0a1ab9ff865092fb1\
 6-70911f1f4aee0366b6122f2b90d367ec0f066beb git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-933ebad2470a169504799a1d95b8e410bd9847ef git://xenbits.xen.org/osstest/seabios.git#120996f147131eca8af90e30c900bc14bc824d9f-2f4d068645c211e309812372cd0ac58c9024e93b git://xenbits.xen.org/xen.git#518c935fac4d30b3ec35d4b6add82b17b7d7aca3-03bfe526ecadc86f31eda433b91dc90be0563919
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
Loaded 13467 nodes in revision graph
Searching for test results:
 143051 pass 8e09cf1d5a6b8bcf21bfb7d409a2ecf94be54ff1 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 f413d9bee3f6cabd4b11ad0a1ab9ff865092fb16 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
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
 146240 fail 2feaa925bba06e77be918bcbfab63bc8201c8f19 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 146211 fail 2feaa925bba06e77be918bcbfab63bc8201c8f19 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 146298 fail 2feaa925bba06e77be918bcbfab63bc8201c8f19 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 146314 pass 26d9748ff114a060ee751959d108d062f737f5d9 d059bd2b1bc4d3ec09eabb238f9eb28c7a2fddff 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146293 pass 8e09cf1d5a6b8bcf21bfb7d409a2ecf94be54ff1 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 f413d9bee3f6cabd4b11ad0a1ab9ff865092fb16 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 146303 pass 4de5d01a4ee76e6ea31dc61025e26459473d1104 1eb6fd581f1890682ef7b39b12c5bcf37c6ee6dd 6280c94f306df6a20bbc100ba15a5a81af0366e6 c8ff8e05afb6a20b1ae66aa80bb8636b664be0b2 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 05de315b00bf2951617b8ef28811b1f1f2dd5742
 146305 fail fe1f2bfbe3ca8944df37c6b77f813eaab572a2f7 a7903da07d3d18c23314aa0815adbb4058fd7cec 317d3eeb963a515e15a63fa356d8ebcda7041a51 49accdedf956f175041040e677163b7cbb746283 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7b3c5b70a32303b46d0d051e695f18d72cce5ed0
 146301 pass 330b55682921886dfc1709b6ab6e3c6e72c25629 d66379ef8e1441ede3985288c0fb2902d02dc438 317d3eeb963a515e15a63fa356d8ebcda7041a51 665afccc52e1a02ee329147e02f04b8e9cf1d571 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 146299 fail 2feaa925bba06e77be918bcbfab63bc8201c8f19 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 146304 pass ce33c21f238206706ca62d84ffb1fcb7bba74e89 3f7d8da2ee9e513a9db318dc9c4aa91ca6ed8b3b 317d3eeb963a515e15a63fa356d8ebcda7041a51 ec8c74e8bcc66a43ff766254e68b0504f68e024f 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 25164571fc11ed3010c5885a98a68fac3b891d33
 146311 fail fe1f2bfbe3ca8944df37c6b77f813eaab572a2f7 cf73cf0f6b799dd9b1e8fb64e573d3398a34eb8f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 34492a38606fe2a1a4fb9ba8f17deb3f656961ee
 146309 pass 6c6d93bc62fd2be9ccf07b579c1f10edd3de7e4c 7d96c6af2b60538da1267528cb917bd496f95854 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5abd9cc2cebe7fac001f7bb7b647c47cf54af1a 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 50ea2445f49825208439c864fecb9d9fd8791277
 146310 pass cf44ec557753c2c266c7cb9d1cf0bceb7d613bec 5f62ea4ee2c43383411f895cd323e3c67db8eca7 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146312 pass bf7d2a26a3a6c22dd1adbd144815da12f4a40db4 d059bd2b1bc4d3ec09eabb238f9eb28c7a2fddff 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146313 fail fe1f2bfbe3ca8944df37c6b77f813eaab572a2f7 d059bd2b1bc4d3ec09eabb238f9eb28c7a2fddff 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146316 fail 810613a60efe3924c536b3663246900bc08910a5 d059bd2b1bc4d3ec09eabb238f9eb28c7a2fddff 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146318 pass f6a750e678fb0ca3898cba08b6698f079008924c d059bd2b1bc4d3ec09eabb238f9eb28c7a2fddff 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146320 fail 810613a60efe3924c536b3663246900bc08910a5 d059bd2b1bc4d3ec09eabb238f9eb28c7a2fddff 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146325 pass f6a750e678fb0ca3898cba08b6698f079008924c d059bd2b1bc4d3ec09eabb238f9eb28c7a2fddff 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146327 fail 810613a60efe3924c536b3663246900bc08910a5 d059bd2b1bc4d3ec09eabb238f9eb28c7a2fddff 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146329 pass f6a750e678fb0ca3898cba08b6698f079008924c d059bd2b1bc4d3ec09eabb238f9eb28c7a2fddff 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146332 fail 810613a60efe3924c536b3663246900bc08910a5 d059bd2b1bc4d3ec09eabb238f9eb28c7a2fddff 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
Searching for interesting versions
 Result found: flight 143051 (pass), for basis pass
 Result found: flight 146211 (fail), for basis failure
 Repro found: flight 146293 (pass), for basis pass
 Repro found: flight 146298 (fail), for basis failure
 0 revisions at f6a750e678fb0ca3898cba08b6698f079008924c d059bd2b1bc4d3ec09eabb238f9eb28c7a2fddff 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
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

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.256148 to fit
pnmtopng: 47 colors found
Revision graph left in /home/logs/results/bisect/libvirt/build-arm64-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
146332: tolerable ALL FAIL

flight 146332 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/146332/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-arm64-libvirt           6 libvirt-build           fail baseline untested


jobs:
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



--===============5894033209016664240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5894033209016664240==--
