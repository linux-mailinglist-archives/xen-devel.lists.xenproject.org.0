Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1E3141EF8
	for <lists+xen-devel@lfdr.de>; Sun, 19 Jan 2020 17:05:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itD24-0002Li-8b; Sun, 19 Jan 2020 16:02:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4S1E=3I=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1itD22-0002Ld-59
 for xen-devel@lists.xenproject.org; Sun, 19 Jan 2020 16:02:34 +0000
X-Inumbo-ID: 11ba78b0-3ad5-11ea-8e9a-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11ba78b0-3ad5-11ea-8e9a-bc764e2007e4;
 Sun, 19 Jan 2020 16:02:19 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1itD1m-0004hC-Ef; Sun, 19 Jan 2020 16:02:18 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1itD1m-0002rn-6Y; Sun, 19 Jan 2020 16:02:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1itD1m-0006bR-5u; Sun, 19 Jan 2020 16:02:18 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1itD1m-0006bR-5u@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 19 Jan 2020 16:02:18 +0000
Subject: [Xen-devel] [libvirt bisection] complete build-amd64-libvirt
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
Content-Type: multipart/mixed; boundary="===============0832434195139415582=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0832434195139415582==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-amd64-libvirt
testid libvirt-build

Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  810613a60efe3924c536b3663246900bc08910a5
  Bug not present: f6a750e678fb0ca3898cba08b6698f079008924c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/146269/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-amd64-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-amd64-libvirt.libvirt-build --summary-out=tmp/146269.bisection-summary --basis-template=146182 --blessings=real,real-bisect libvirt build-amd64-libvirt libvirt-build
Searching for failure / basis pass:
 146240 fail [host=albana0] / 146182 [host=rimava1] 146156 [host=huxelrebe1] 146103 [host=fiano0] 146061 [host=chardonnay1] 145969 [host=godello1] 145906 [host=godello1] 145842 [host=godello1] 145779 [host=godello0] 145511 [host=huxelrebe1] 145212 [host=godello0] 145173 [host=godello0] 145133 [host=godello1] 145054 [host=godello0] 144995 [host=godello1] 144958 ok.
Failure / basis pass flights: 146240 / 144958
(tree with no url: minios)
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2feaa925bba06e77be918bcbfab63bc8201c8f19 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
Basis pass ce7af78e3907c7462aa88d58facdc4ce7e0acd8d 1f6fb368c04919243e2c70f2aa514a5f88e95309 317d3eeb963a515e15a63fa356d8ebcda7041a51 01b6090b75922bc72604c334bd3dc331490af3bb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 f50a4f6e244cfc8e773300c03aaf4db391f3028a
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#ce7af78e3907c7462aa88d58facdc4ce7e0acd8d-2feaa925bba06e77be918bcbfab63bc8201c8f19 https://git.savannah.gnu.org/git/gnulib.git/#1f6fb368c04919243e2c70f2aa514a5f88e95309-611869be9f1083e53305446d90a2909fc89914ef https://gitlab.com/keycodemap/keycodemapdb.git#317d3eeb963a515e15a63fa356d8ebcda7041a51-317d3eeb963a515e15a63fa356d8ebcda7041a51 git://xenbits.xen.org/osstest/ovmf.git#01b6090b75922bc72604c334bd3dc331490af3b\
 b-70911f1f4aee0366b6122f2b90d367ec0f066beb git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-933ebad2470a169504799a1d95b8e410bd9847ef git://xenbits.xen.org/osstest/seabios.git#f21b5a4aeb020f2a5e2c6503f906a9349dd2f069-2f4d068645c211e309812372cd0ac58c9024e93b git://xenbits.xen.org/xen.git#f50a4f6e244cfc8e773300c03aaf4db391f3028a-03bfe526ecadc86f\
 31eda433b91dc90be0563919
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
Loaded 32630 nodes in revision graph
Searching for test results:
 144958 pass ce7af78e3907c7462aa88d58facdc4ce7e0acd8d 1f6fb368c04919243e2c70f2aa514a5f88e95309 317d3eeb963a515e15a63fa356d8ebcda7041a51 01b6090b75922bc72604c334bd3dc331490af3bb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 f50a4f6e244cfc8e773300c03aaf4db391f3028a
 144995 [host=godello1]
 145054 [host=godello0]
 145173 [host=godello0]
 145133 [host=godello1]
 145212 [host=godello0]
 145511 [host=huxelrebe1]
 145542 [host=godello1]
 145589 [host=godello1]
 145621 [host=godello1]
 145639 [host=godello1]
 145626 [host=godello1]
 145632 [host=godello1]
 145627 [host=godello1]
 145623 [host=godello1]
 145636 [host=godello1]
 145630 [host=godello1]
 145633 [host=godello1]
 145637 [host=godello1]
 145638 [host=godello1]
 145640 [host=godello1]
 145642 [host=godello1]
 145643 [host=godello1]
 145644 [host=godello1]
 145656 [host=godello1]
 145710 [host=godello0]
 145779 [host=godello0]
 145842 [host=godello1]
 145906 [host=godello1]
 145969 [host=godello1]
 146061 [host=chardonnay1]
 146103 [host=fiano0]
 146182 [host=rimava1]
 146156 [host=huxelrebe1]
 146223 pass ce7af78e3907c7462aa88d58facdc4ce7e0acd8d 1f6fb368c04919243e2c70f2aa514a5f88e95309 317d3eeb963a515e15a63fa356d8ebcda7041a51 01b6090b75922bc72604c334bd3dc331490af3bb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 f50a4f6e244cfc8e773300c03aaf4db391f3028a
 146238 fail 2feaa925bba06e77be918bcbfab63bc8201c8f19 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 146239 pass 6c6d93bc62fd2be9ccf07b579c1f10edd3de7e4c 6bd09257a491e635aa7e42d15935747818e492f2 317d3eeb963a515e15a63fa356d8ebcda7041a51 123b720eeb371e0a31eb727bcf59255b584e355f d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 c6e2a9ff45c5c164a3d9074b0b9603c3f6ca6bd2
 146256 pass f6a750e678fb0ca3898cba08b6698f079008924c d059bd2b1bc4d3ec09eabb238f9eb28c7a2fddff 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146241 fail b570139909fd5d11d82408218a8f1f590a6386b2 a7903da07d3d18c23314aa0815adbb4058fd7cec 317d3eeb963a515e15a63fa356d8ebcda7041a51 cc617b6e1430242f8d042c71c2d923dbc6436a36 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 c4f3fc12cd9706f7593016d4daf930cd50f0af32
 146240 fail 2feaa925bba06e77be918bcbfab63bc8201c8f19 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 146211 fail 2feaa925bba06e77be918bcbfab63bc8201c8f19 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 146243 fail fe1f2bfbe3ca8944df37c6b77f813eaab572a2f7 cf73cf0f6b799dd9b1e8fb64e573d3398a34eb8f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 bf08a8a08a2ee8cef5fb7b3b274b0e09123a41bd
 146245 pass 1ed32989ea27589c34f8f3f4f79dde4bfb0b40bb 86e05effe83d629bfcb4d798c4951781387a1bfa 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5abd9cc2cebe7fac001f7bb7b647c47cf54af1a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 3a13ac3ad4d3ef399fe2c85fb09fcb7ab1cdd140
 146260 fail 810613a60efe3924c536b3663246900bc08910a5 d059bd2b1bc4d3ec09eabb238f9eb28c7a2fddff 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146249 pass cf44ec557753c2c266c7cb9d1cf0bceb7d613bec 5f62ea4ee2c43383411f895cd323e3c67db8eca7 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146250 pass f5e9bdb87feed6834977ee9813405206d26fcad0 d059bd2b1bc4d3ec09eabb238f9eb28c7a2fddff 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146264 pass f6a750e678fb0ca3898cba08b6698f079008924c d059bd2b1bc4d3ec09eabb238f9eb28c7a2fddff 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146252 pass b4d601ba87ade7fa1a3a4f9c0c268659c15a35c3 d059bd2b1bc4d3ec09eabb238f9eb28c7a2fddff 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146253 fail 810613a60efe3924c536b3663246900bc08910a5 d059bd2b1bc4d3ec09eabb238f9eb28c7a2fddff 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146265 fail 810613a60efe3924c536b3663246900bc08910a5 d059bd2b1bc4d3ec09eabb238f9eb28c7a2fddff 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146255 pass 26d9748ff114a060ee751959d108d062f737f5d9 d059bd2b1bc4d3ec09eabb238f9eb28c7a2fddff 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146266 pass f6a750e678fb0ca3898cba08b6698f079008924c d059bd2b1bc4d3ec09eabb238f9eb28c7a2fddff 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 146269 fail 810613a60efe3924c536b3663246900bc08910a5 d059bd2b1bc4d3ec09eabb238f9eb28c7a2fddff 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
Searching for interesting versions
 Result found: flight 144958 (pass), for basis pass
 Result found: flight 146211 (fail), for basis failure
 Repro found: flight 146223 (pass), for basis pass
 Repro found: flight 146238 (fail), for basis failure
 0 revisions at f6a750e678fb0ca3898cba08b6698f079008924c d059bd2b1bc4d3ec09eabb238f9eb28c7a2fddff 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
No revisions left to test, checking graph state.
 Result found: flight 146256 (pass), for last pass
 Result found: flight 146260 (fail), for first failure
 Repro found: flight 146264 (pass), for last pass
 Repro found: flight 146265 (fail), for first failure
 Repro found: flight 146266 (pass), for last pass
 Repro found: flight 146269 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  810613a60efe3924c536b3663246900bc08910a5
  Bug not present: f6a750e678fb0ca3898cba08b6698f079008924c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/146269/

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

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.677424 to fit
pnmtopng: 69 colors found
Revision graph left in /home/logs/results/bisect/libvirt/build-amd64-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
146269: tolerable ALL FAIL

flight 146269 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/146269/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64-libvirt           6 libvirt-build           fail baseline untested


jobs:
 build-amd64-libvirt                                          fail    


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



--===============0832434195139415582==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0832434195139415582==--
