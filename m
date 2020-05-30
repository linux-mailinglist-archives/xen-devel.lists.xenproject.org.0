Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C139E1E8DDE
	for <lists+xen-devel@lfdr.de>; Sat, 30 May 2020 06:49:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jetPd-00029H-2w; Sat, 30 May 2020 04:48:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=74Fv=7M=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jetPb-00029C-5k
 for xen-devel@lists.xenproject.org; Sat, 30 May 2020 04:47:59 +0000
X-Inumbo-ID: b79c96ba-a230-11ea-a945-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b79c96ba-a230-11ea-a945-12813bfff9fa;
 Sat, 30 May 2020 04:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jmfSFcn9QEdYJm4zk5Ag2WBkeelZRc5vlFJOkPMdMIU=; b=Ng3foKGsfkvdtPCVkEinavUIsB
 L7ALSYQqvKURBg/tutdsyvZ5tmnAmDYXtSwjtbH6KcknAWpwg1zPWQZS15dHy175Mldj8UrChM2xz
 K5N9lqinh11R5dtJ4TL8somcjf+IkSqL2tki9+55HL5t0M4fz+m5V/DLkDTQCOIJW8IQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jetPR-0002dH-Uw; Sat, 30 May 2020 04:47:50 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jetPR-0006dO-Dj; Sat, 30 May 2020 04:47:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jetPR-0006KD-77; Sat, 30 May 2020 04:47:49 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [libvirt bisection] complete build-armhf-libvirt
Message-Id: <E1jetPR-0006KD-77@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 30 May 2020 04:47:49 +0000
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
job build-armhf-libvirt
testid libvirt-build

Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  4d5f50d86b760864240c695adc341379fb47a796
  Bug not present: a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/150521/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-armhf-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-armhf-libvirt.libvirt-build --summary-out=tmp/150521.bisection-summary --basis-template=146182 --blessings=real,real-bisect libvirt build-armhf-libvirt libvirt-build
Searching for failure / basis pass:
 150462 fail [host=cubietruck-metzinger] / 146182 [host=cubietruck-picasso] 146156 ok.
Failure / basis pass flights: 150462 / 146156
(tree in basispass but not in latest: libvirt_gnulib)
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 6f60d2a8503ce8c624bce6b53bf7b68476f5056f 27acf0ef828bf719b2053ba398b195829413dbdd 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 410cc30fdc590417ae730d635bbc70257adf6750 2e3de6253422112ae43e608661ba94ea6b345694 9f3e9139fa6c3d620eb08dff927518fc88200b8d
Basis pass 0f814c0fed420209ccb881325b854beaa7c70fcf 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#0f814c0fed420209ccb881325b854beaa7c70fcf-6f60d2a8503ce8c624bce6b53bf7b68476f5056f https://gitlab.com/keycodemap/keycodemapdb.git#317d3eeb963a515e15a63fa356d8ebcda7041a51-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/osstest/ovmf.git#70911f1f4aee0366b6122f2b90d367ec0f066beb-568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-410cc30f\
 dc590417ae730d635bbc70257adf6750 git://xenbits.xen.org/osstest/seabios.git#2f4d068645c211e309812372cd0ac58c9024e93b-2e3de6253422112ae43e608661ba94ea6b345694 git://xenbits.xen.org/xen.git#03bfe526ecadc86f31eda433b91dc90be0563919-9f3e9139fa6c3d620eb08dff927518fc88200b8d
Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.

fatal: remote error: git-cache-proxy: git remote died with error exit code 1 // Fetching origin // fatal: Unable to look up xenbits.xen.org (port 9418) (Temporary failure in name resolution) // error: Could not fetch origin
Cloning into bare repository '/home/osstest/repos/ovmf'...
Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.

From git://cache:9419/git://xenbits.xen.org/osstest/ovmf
 * [new branch]            xen-tested-master -> origin/xen-tested-master
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
Loaded 83414 nodes in revision graph
Searching for test results:
 146182 [host=cubietruck-picasso]
 146156 pass 0f814c0fed420209ccb881325b854beaa7c70fcf 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 146240 [host=cubietruck-picasso]
 146211 fail irrelevant
 146299 [host=cubietruck-braque]
 146347 [host=cubietruck-braque]
 146366 [host=cubietruck-picasso]
 146344 [host=cubietruck-picasso]
 146348 [host=cubietruck-braque]
 146380 [host=cubietruck-braque]
 146406 [host=cubietruck-braque]
 146368 [host=cubietruck-picasso]
 146334 [host=cubietruck-braque]
 146392 [host=cubietruck-braque]
 146339 [host=cubietruck-braque]
 146341 [host=cubietruck-braque]
 146352 [host=cubietruck-picasso]
 146371 [host=cubietruck-picasso]
 146359 [host=cubietruck-picasso]
 146342 [host=cubietruck-braque]
 146411 [host=cubietruck-braque]
 146383 [host=cubietruck-braque]
 146360 [host=cubietruck-picasso]
 146364 [host=cubietruck-picasso]
 146399 [host=cubietruck-braque]
 146373 [host=cubietruck-picasso]
 146377 [host=cubietruck-picasso]
 146386 [host=cubietruck-braque]
 146374 [host=cubietruck-braque]
 146378 [host=cubietruck-picasso]
 146389 [host=cubietruck-braque]
 146410 [host=cubietruck-picasso]
 146402 [host=cubietruck-braque]
 146394 [host=cubietruck-braque]
 146404 [host=cubietruck-braque]
 146407 [host=cubietruck-braque]
 146455 fail irrelevant
 146509 [host=cubietruck-braque]
 146489 [host=cubietruck-braque]
 146528 [host=cubietruck-braque]
 146546 [host=cubietruck-braque]
 146565 [host=cubietruck-braque]
 146586 [host=cubietruck-braque]
 146616 [host=cubietruck-gleizes]
 146636 [host=cubietruck-gleizes]
 146660 fail irrelevant
 146689 [host=cubietruck-picasso]
 146737 [host=cubietruck-gleizes]
 146756 [host=cubietruck-gleizes]
 146714 [host=cubietruck-braque]
 146775 [host=cubietruck-braque]
 146799 [host=cubietruck-braque]
 146843 [host=cubietruck-picasso]
 146921 [host=cubietruck-braque]
 146995 [host=cubietruck-gleizes]
 147040 [host=cubietruck-gleizes]
 147084 [host=cubietruck-gleizes]
 147141 [host=cubietruck-gleizes]
 147195 fail irrelevant
 147265 fail irrelevant
 147340 fail irrelevant
 147419 [host=cubietruck-braque]
 147477 [host=cubietruck-braque]
 147520 [host=cubietruck-gleizes]
 147583 [host=cubietruck-braque]
 147649 [host=cubietruck-gleizes]
 147703 fail irrelevant
 147784 fail irrelevant
 147736 [host=cubietruck-braque]
 147885 [host=cubietruck-braque]
 147831 [host=cubietruck-braque]
 147981 fail irrelevant
 148068 [host=cubietruck-picasso]
 148144 [host=cubietruck-picasso]
 148196 [host=cubietruck-gleizes]
 148269 [host=cubietruck-picasso]
 148331 [host=cubietruck-braque]
 148406 [host=cubietruck-gleizes]
 148459 [host=cubietruck-gleizes]
 148503 [host=cubietruck-gleizes]
 148547 [host=cubietruck-gleizes]
 148615 [host=cubietruck-braque]
 148583 fail irrelevant
 148651 [host=cubietruck-gleizes]
 148688 fail irrelevant
 148729 fail irrelevant
 148775 fail irrelevant
 148799 [host=cubietruck-braque]
 148830 [host=cubietruck-gleizes]
 148887 [host=cubietruck-braque]
 149003 fail 153fd683681be13f380378acfc531cc3df206fd1 317d3eeb963a515e15a63fa356d8ebcda7041a51 9a1f14ad721bbcd833ec5108944c44a502392f03 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 9f27372677a68206d511de88ede22c53369a4ff7
 148954 fail irrelevant
 148990 fail irrelevant
 148997 fail 27a6edf50f121ad663ad31dbc2ebf9936fa8ead5 317d3eeb963a515e15a63fa356d8ebcda7041a51 c8b8157e126ae2fb6f65842677251d300ceff104 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 9b71d6a759a6835c7723afa3d79e1e7f10da4396
 148959 [host=cubietruck-braque]
 148967 [host=cubietruck-braque]
 148975 [host=cubietruck-braque]
 148969 [host=cubietruck-braque]
 148982 pass 0f814c0fed420209ccb881325b854beaa7c70fcf 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 148993 fail 0d0d60ddc5e58359cff5be8dfd6dd27e98da0282 317d3eeb963a515e15a63fa356d8ebcda7041a51 788421d5a766a4ce216e99e2277bb11c54e7d0f6 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 3dd724dff085e13ad520f8e35aea717db2ff07d0
 149006 pass a1cd25b919509be2645dbe6f952d5263e0d4e4e5 317d3eeb963a515e15a63fa356d8ebcda7041a51 710ff7490ad897383eb35d1becadabd21a733f24 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 149011 fail 2feaa925bba06e77be918bcbfab63bc8201c8f19 317d3eeb963a515e15a63fa356d8ebcda7041a51 4e2ac8062cbe907be9fbf6b2e6f1fc947690c4de 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 1eeedaf5a0d9ed6324f3bd5b700bb22eb4355341
 149016 pass a7f3b901aacadef269bf335c1714b45e444e78e8 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 149019 fail d0236e2a554f2321512276b897e8a8a44f68e969 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 149020 pass 6b4140dafb6b3db9ead2e260757f1c3583936f19 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 149001 [host=cubietruck-picasso]
 149022 pass a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 149025 [host=cubietruck-picasso]
 149028 [host=cubietruck-picasso]
 149032 [host=cubietruck-picasso]
 149035 [host=cubietruck-picasso]
 149043 [host=cubietruck-picasso]
 149037 [host=cubietruck-picasso]
 149041 [host=cubietruck-picasso]
 149045 [host=cubietruck-picasso]
 149074 fail irrelevant
 149123 fail irrelevant
 149154 fail irrelevant
 149193 [host=cubietruck-gleizes]
 149234 fail irrelevant
 149268 [host=cubietruck-braque]
 149314 [host=cubietruck-gleizes]
 149376 [host=cubietruck-gleizes]
 149407 fail irrelevant
 149434 [host=cubietruck-picasso]
 149455 [host=cubietruck-braque]
 149482 fail irrelevant
 149550 [host=cubietruck-braque]
 149508 [host=cubietruck-picasso]
 149590 [host=cubietruck-picasso]
 149643 [host=cubietruck-picasso]
 149629 [host=cubietruck-braque]
 149615 [host=cubietruck-braque]
 149635 fail irrelevant
 149684 fail irrelevant
 149666 fail irrelevant
 149696 [host=cubietruck-picasso]
 149732 [host=cubietruck-picasso]
 149773 [host=cubietruck-gleizes]
 149746 [host=cubietruck-gleizes]
 149803 [host=cubietruck-gleizes]
 149826 [host=cubietruck-gleizes]
 149886 [host=cubietruck-gleizes]
 149833 [host=cubietruck-gleizes]
 149850 [host=cubietruck-gleizes]
 149870 [host=cubietruck-gleizes]
 149909 [host=cubietruck-braque]
 149902 [host=cubietruck-braque]
 149895 [host=cubietruck-gleizes]
 150053 fail irrelevant
 150062 fail irrelevant
 150083 [host=cubietruck-braque]
 150099 [host=cubietruck-braque]
 150121 []
 150155 [host=cubietruck-braque]
 150131 [host=cubietruck-gleizes]
 150146 [host=cubietruck-gleizes]
 150170 [host=cubietruck-gleizes]
 150210 [host=cubietruck-gleizes]
 150228 fail 144dfe4215902b40a9d17fdb326054bbd8e07563 27acf0ef828bf719b2053ba398b195829413dbdd 9099dcbd61c8d22b5eedda783d143c222d2705a3 410cc30fdc590417ae730d635bbc70257adf6750 665dce17c04b574bb0ebcde4cac129c3dd9e681c 664e1bc12f8658da124a4eff7a8f16da073bd47f
 150190 [host=cubietruck-braque]
 150222 [host=cubietruck-gleizes]
 150237 [host=cubietruck-braque]
 150268 fail irrelevant
 150287 [host=cubietruck-braque]
 150347 [host=cubietruck-braque]
 150317 [host=cubietruck-picasso]
 150339 [host=cubietruck-picasso]
 150359 [host=cubietruck-braque]
 150374 fail irrelevant
 150404 [host=cubietruck-braque]
 150393 [host=cubietruck-braque]
 150395 [host=cubietruck-braque]
 150411 [host=cubietruck-braque]
 150405 [host=cubietruck-braque]
 150415 [host=cubietruck-braque]
 150417 [host=cubietruck-braque]
 150462 fail 6f60d2a8503ce8c624bce6b53bf7b68476f5056f 27acf0ef828bf719b2053ba398b195829413dbdd 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 410cc30fdc590417ae730d635bbc70257adf6750 2e3de6253422112ae43e608661ba94ea6b345694 9f3e9139fa6c3d620eb08dff927518fc88200b8d
 150418 [host=cubietruck-braque]
 150424 [host=cubietruck-braque]
 150429 [host=cubietruck-braque]
 150474 [host=cubietruck-picasso]
 150435 [host=cubietruck-picasso]
 150431 [host=cubietruck-braque]
 150419 [host=cubietruck-picasso]
 150434 [host=cubietruck-braque]
 150466 [host=cubietruck-picasso]
 150455 [host=cubietruck-picasso]
 150458 [host=cubietruck-picasso]
 150459 [host=cubietruck-picasso]
 150470 [host=cubietruck-picasso]
 150461 [host=cubietruck-picasso]
 150463 [host=cubietruck-picasso]
 150483 pass 0f814c0fed420209ccb881325b854beaa7c70fcf 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 150493 fail 6f60d2a8503ce8c624bce6b53bf7b68476f5056f 27acf0ef828bf719b2053ba398b195829413dbdd 568eee7cf319fa95183c8d3b5e8dcf6e078ab8b3 410cc30fdc590417ae730d635bbc70257adf6750 2e3de6253422112ae43e608661ba94ea6b345694 9f3e9139fa6c3d620eb08dff927518fc88200b8d
 150501 fail 4d5f50d86b760864240c695adc341379fb47a796 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 150506 pass a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 150511 fail 4d5f50d86b760864240c695adc341379fb47a796 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 150514 pass a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 150521 fail 4d5f50d86b760864240c695adc341379fb47a796 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
Searching for interesting versions
 Result found: flight 146156 (pass), for basis pass
 Result found: flight 150462 (fail), for basis failure
 Repro found: flight 150483 (pass), for basis pass
 Repro found: flight 150493 (fail), for basis failure
 0 revisions at a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
No revisions left to test, checking graph state.
 Result found: flight 149022 (pass), for last pass
 Result found: flight 150501 (fail), for first failure
 Repro found: flight 150506 (pass), for last pass
 Repro found: flight 150511 (fail), for first failure
 Repro found: flight 150514 (pass), for last pass
 Repro found: flight 150521 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  4d5f50d86b760864240c695adc341379fb47a796
  Bug not present: a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/150521/

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

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.203509 to fit
pnmtopng: 32 colors found
Revision graph left in /home/logs/results/bisect/libvirt/build-armhf-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
150521: tolerable ALL FAIL

flight 150521 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/150521/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-armhf-libvirt           6 libvirt-build           fail baseline untested


jobs:
 build-armhf-libvirt                                          fail    


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


