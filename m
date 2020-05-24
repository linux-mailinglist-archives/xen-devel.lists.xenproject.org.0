Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D79EC1DFE02
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2020 11:45:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcnBX-0007zG-D9; Sun, 24 May 2020 09:44:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2e/K=7G=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jcnBW-0007zB-6K
 for xen-devel@lists.xenproject.org; Sun, 24 May 2020 09:44:46 +0000
X-Inumbo-ID: 2f1b169a-9da3-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f1b169a-9da3-11ea-b07b-bc764e2007e4;
 Sun, 24 May 2020 09:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y2Y93Z/UETto/LR+IAtl5PuITCBuqhJSr8NFFCflDSM=; b=Zq1t2mAlkPc07o7XwUiGH3dQOe
 8XwVY/CgsyEA7lSaNgLCrQktwt9E/Qf2ITJmvi3pOdpevGtcyEHWKX/7luGIPdNsGrEVDrkZDRVad
 +Pg5EAzmVD/uVFHHT0CViZ3gNOVBuDdASwLbPIuuqumrN4piTaIP0YUBpSfoZ3GM1VLo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jcnBN-0006bG-VE; Sun, 24 May 2020 09:44:38 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jcnBN-0002d8-O0; Sun, 24 May 2020 09:44:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jcnBN-0008VN-NK; Sun, 24 May 2020 09:44:37 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [libvirt bisection] complete build-i386-libvirt
Message-Id: <E1jcnBN-0008VN-NK@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 24 May 2020 09:44:37 +0000
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
job build-i386-libvirt
testid libvirt-build

Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  4d5f50d86b760864240c695adc341379fb47a796
  Bug not present: a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/148912/


  commit 4d5f50d86b760864240c695adc341379fb47a796
  Author: Pavel Hrdina <phrdina@redhat.com>
  Date:   Wed Jan 8 22:54:31 2020 +0100
  
      bootstrap.conf: stop creating AUTHORS file
      
      The existence of AUTHORS file is required for GNU projects but since
      commit <8bfb36db40f38e92823b657b5a342652064b5adc> we do not require
      these files to exist.
      
      Signed-off-by: Pavel Hrdina <phrdina@redhat.com>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-i386-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-i386-libvirt.libvirt-build --summary-out=tmp/150350.bisection-summary --basis-template=146182 --blessings=real,real-bisect libvirt build-i386-libvirt libvirt-build
Searching for failure / basis pass:
 150347 fail [host=italia0] / 146182 [host=pinot1] 146156 [host=huxelrebe0] 146103 [host=pinot1] 146061 ok.
Failure / basis pass flights: 150347 / 146061
(tree with no url: minios)
(tree in basispass but not in latest: libvirt_gnulib)
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest f718709431429fbb4e1fc6781f3a3752a7f43f70 27acf0ef828bf719b2053ba398b195829413dbdd 1c877c716038a862e876cac8f0929bab4a96e849 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 7e9db04923854b7f4edca33948f55abee22907b9 5e015d48a5ee68ba03addad2698364d8f015afec
Basis pass 7d608469621a3fda72dff2a89308e68cc9fb4c9a 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 03bfe526ecadc86f31eda433b91dc90be0563919
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#7d608469621a3fda72dff2a89308e68cc9fb4c9a-f718709431429fbb4e1fc6781f3a3752a7f43f70 https://gitlab.com/keycodemap/keycodemapdb.git#317d3eeb963a515e15a63fa356d8ebcda7041a51-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/osstest/ovmf.git#70911f1f4aee0366b6122f2b90d367ec0f066beb-1c877c716038a862e876cac8f0929bab4a96e849 git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876\
 798-3c659044118e34603161457db9934a34f816d78b git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-410cc30fdc590417ae730d635bbc70257adf6750 git://xenbits.xen.org/osstest/seabios.git#f21b5a4aeb020f2a5e2c6503f906a9349dd2f069-7e9db04923854b7f4edca33948f55abee22907b9 git://xenbits.xen.org/xen.git#03bfe526ecadc86f31eda433b91dc90be0563919-5e015d48a5ee68ba03addad2698364d8f015afec
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
Loaded 178548 nodes in revision graph
Searching for test results:
 146061 pass 7d608469621a3fda72dff2a89308e68cc9fb4c9a 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 03bfe526ecadc86f31eda433b91dc90be0563919
 146103 [host=pinot1]
 146182 [host=pinot1]
 146156 [host=huxelrebe0]
 146270 pass 7d608469621a3fda72dff2a89308e68cc9fb4c9a 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 03bfe526ecadc86f31eda433b91dc90be0563919
 146289 pass irrelevant
 146240 fail irrelevant
 146211 fail irrelevant
 146272 fail irrelevant
 146290 fail irrelevant
 146275 pass irrelevant
 146276 pass irrelevant
 146291 pass irrelevant
 146278 pass irrelevant
 146282 fail irrelevant
 146279 pass irrelevant
 146280 pass irrelevant
 146292 fail irrelevant
 146287 fail irrelevant
 146299 fail irrelevant
 146344 fail irrelevant
 146374 fail irrelevant
 146410 fail irrelevant
 146455 fail irrelevant
 146509 fail irrelevant
 146489 fail irrelevant
 146528 fail irrelevant
 146546 fail irrelevant
 146565 fail irrelevant
 146586 fail irrelevant
 146616 fail irrelevant
 146636 fail irrelevant
 146660 fail irrelevant
 146689 fail irrelevant
 146737 fail irrelevant
 146756 []
 146714 []
 146775 fail irrelevant
 146799 fail irrelevant
 146843 fail irrelevant
 146921 fail irrelevant
 146995 fail irrelevant
 147040 fail irrelevant
 147084 fail irrelevant
 147141 fail irrelevant
 147195 fail irrelevant
 147265 fail irrelevant
 147340 fail irrelevant
 147419 fail irrelevant
 147477 fail irrelevant
 147520 fail irrelevant
 147583 fail irrelevant
 147649 fail irrelevant
 147703 fail irrelevant
 147784 fail irrelevant
 147736 fail irrelevant
 147885 fail irrelevant
 147831 fail irrelevant
 147981 fail irrelevant
 148068 fail irrelevant
 148144 fail irrelevant
 148196 fail irrelevant
 148269 fail irrelevant
 148331 fail irrelevant
 148406 fail irrelevant
 148459 fail irrelevant
 148503 fail irrelevant
 148547 fail irrelevant
 148615 fail irrelevant
 148583 fail irrelevant
 148651 fail irrelevant
 148688 fail irrelevant
 148729 fail irrelevant
 148775 fail irrelevant
 148799 fail irrelevant
 148871 fail 0d0d60ddc5e58359cff5be8dfd6dd27e98da0282 317d3eeb963a515e15a63fa356d8ebcda7041a51 957ca63190bc2770d0383408bf87587112e84881 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 3dd724dff085e13ad520f8e35aea717db2ff07d0
 148830 fail irrelevant
 148861 pass 7d608469621a3fda72dff2a89308e68cc9fb4c9a 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 03bfe526ecadc86f31eda433b91dc90be0563919
 148875 fail 4ed55c0be11da3e7e29986a8b3b4b0a32b58be47 317d3eeb963a515e15a63fa356d8ebcda7041a51 c8b8157e126ae2fb6f65842677251d300ceff104 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d f910c3ebc6a178c5cbbc0868134be536fae7f7cf
 148883 pass 6b4140dafb6b3db9ead2e260757f1c3583936f19 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148867 fail irrelevant
 148888 fail 2feaa925bba06e77be918bcbfab63bc8201c8f19 317d3eeb963a515e15a63fa356d8ebcda7041a51 d9c919744b9b6272cdf1c81f33a09539a4bd031b d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 1eeedaf5a0d9ed6324f3bd5b700bb22eb4355341
 148876 fail 6c1dddaf97b4ef70e27961c9f79b15c79a863ac5 317d3eeb963a515e15a63fa356d8ebcda7041a51 9a1f14ad721bbcd833ec5108944c44a502392f03 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d f44a192d22a37dcb9171b95978b43637bc09718d
 148880 pass 0169f5ecdeefb91463b07a2e6f3f3b40c84323e9 317d3eeb963a515e15a63fa356d8ebcda7041a51 710ff7490ad897383eb35d1becadabd21a733f24 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 321b658847a06417b6a0b6964e939ed0ecf16551
 148894 fail d0236e2a554f2321512276b897e8a8a44f68e969 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148892 fail d0236e2a554f2321512276b897e8a8a44f68e969 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d b05ec9263e56ef0784da766e829cfe08569d1d88
 148898 pass a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148899 fail 4d5f50d86b760864240c695adc341379fb47a796 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148904 pass a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148907 fail 4d5f50d86b760864240c695adc341379fb47a796 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148887 fail irrelevant
 148909 pass a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148912 fail 4d5f50d86b760864240c695adc341379fb47a796 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148954 fail irrelevant
 149001 fail irrelevant
 149043 fail irrelevant
 149074 fail irrelevant
 149123 fail irrelevant
 149154 fail irrelevant
 149193 fail irrelevant
 149234 fail irrelevant
 149268 fail irrelevant
 149314 fail irrelevant
 149376 fail irrelevant
 149407 fail irrelevant
 149434 fail irrelevant
 149455 fail irrelevant
 149482 fail irrelevant
 149550 fail irrelevant
 149508 fail irrelevant
 149590 fail irrelevant
 149643 fail irrelevant
 149629 fail irrelevant
 149615 fail irrelevant
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
 149909 fail de7e9840e7f888f1a872c86b0cb793b283193137 317d3eeb963a515e15a63fa356d8ebcda7041a51 e54310451f1ac2ce4ccb90a110f45bb9b4f3ccd6 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 eaaf726038cb9b2d01312d6430b4e93842aa96eb 0135be8bd8cd60090298f02310691b688d95c3a8
 149902 fail de7e9840e7f888f1a872c86b0cb793b283193137 317d3eeb963a515e15a63fa356d8ebcda7041a51 e54310451f1ac2ce4ccb90a110f45bb9b4f3ccd6 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 eaaf726038cb9b2d01312d6430b4e93842aa96eb 0135be8bd8cd60090298f02310691b688d95c3a8
 149895 fail irrelevant
 150053 fail irrelevant
 150062 fail irrelevant
 150083 fail irrelevant
 150099 fail irrelevant
 150121 fail 23bf93884c6346206e87c0f14d93f905e8c81267 27acf0ef828bf719b2053ba398b195829413dbdd c8543b8d830d22882dab4ece47f0413f9c6eb431 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 eaaf726038cb9b2d01312d6430b4e93842aa96eb e0d92d9bd7997c6bcda17a19aba4f3957dd1a2e9
 150155 fail 65a12c467cd683809b4d445b8cf1c3ae250209b2 27acf0ef828bf719b2053ba398b195829413dbdd 88899a372cfc44f8612315f4b43a084d1814fe69 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 eaaf726038cb9b2d01312d6430b4e93842aa96eb a82582b1af6a4a57ca53bcfad9f71428cb5f9a54
 150131 fail 23bf93884c6346206e87c0f14d93f905e8c81267 27acf0ef828bf719b2053ba398b195829413dbdd c8543b8d830d22882dab4ece47f0413f9c6eb431 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 eaaf726038cb9b2d01312d6430b4e93842aa96eb e0d92d9bd7997c6bcda17a19aba4f3957dd1a2e9
 150146 fail irrelevant
 150170 fail irrelevant
 150210 fail irrelevant
 150228 fail 144dfe4215902b40a9d17fdb326054bbd8e07563 27acf0ef828bf719b2053ba398b195829413dbdd 9099dcbd61c8d22b5eedda783d143c222d2705a3 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 665dce17c04b574bb0ebcde4cac129c3dd9e681c 664e1bc12f8658da124a4eff7a8f16da073bd47f
 150190 fail irrelevant
 150222 fail 144dfe4215902b40a9d17fdb326054bbd8e07563 27acf0ef828bf719b2053ba398b195829413dbdd 9099dcbd61c8d22b5eedda783d143c222d2705a3 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 665dce17c04b574bb0ebcde4cac129c3dd9e681c 57880053dd24012e9f59c23b630fefe07e15dc49
 150237 fail irrelevant
 150268 fail irrelevant
 150287 fail irrelevant
 150347 fail f718709431429fbb4e1fc6781f3a3752a7f43f70 27acf0ef828bf719b2053ba398b195829413dbdd 1c877c716038a862e876cac8f0929bab4a96e849 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 7e9db04923854b7f4edca33948f55abee22907b9 5e015d48a5ee68ba03addad2698364d8f015afec
 150348 pass 7d608469621a3fda72dff2a89308e68cc9fb4c9a 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 03bfe526ecadc86f31eda433b91dc90be0563919
 150350 fail f718709431429fbb4e1fc6781f3a3752a7f43f70 27acf0ef828bf719b2053ba398b195829413dbdd 1c877c716038a862e876cac8f0929bab4a96e849 3c659044118e34603161457db9934a34f816d78b 410cc30fdc590417ae730d635bbc70257adf6750 7e9db04923854b7f4edca33948f55abee22907b9 5e015d48a5ee68ba03addad2698364d8f015afec
 150317 fail irrelevant
 150339 fail irrelevant
Searching for interesting versions
 Result found: flight 146061 (pass), for basis pass
 Result found: flight 150347 (fail), for basis failure
 Repro found: flight 150348 (pass), for basis pass
 Repro found: flight 150350 (fail), for basis failure
 0 revisions at a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
No revisions left to test, checking graph state.
 Result found: flight 148898 (pass), for last pass
 Result found: flight 148899 (fail), for first failure
 Repro found: flight 148904 (pass), for last pass
 Repro found: flight 148907 (fail), for first failure
 Repro found: flight 148909 (pass), for last pass
 Repro found: flight 148912 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  4d5f50d86b760864240c695adc341379fb47a796
  Bug not present: a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/148912/

Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.


  commit 4d5f50d86b760864240c695adc341379fb47a796
  Author: Pavel Hrdina <phrdina@redhat.com>
  Date:   Wed Jan 8 22:54:31 2020 +0100
  
      bootstrap.conf: stop creating AUTHORS file
      
      The existence of AUTHORS file is required for GNU projects but since
      commit <8bfb36db40f38e92823b657b5a342652064b5adc> we do not require
      these files to exist.
      
      Signed-off-by: Pavel Hrdina <phrdina@redhat.com>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.204627 to fit
pnmtopng: 37 colors found
Revision graph left in /home/logs/results/bisect/libvirt/build-i386-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
150350: tolerable FAIL

flight 150350 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/150350/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-i386-libvirt            6 libvirt-build           fail baseline untested


jobs:
 build-i386                                                   pass    
 build-i386-libvirt                                           fail    


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


