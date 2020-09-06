Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FB525F0FA
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 00:48:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kF3SQ-0007MF-O1; Sun, 06 Sep 2020 22:48:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AZON=CP=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kF3SP-0007Lq-Kv
 for xen-devel@lists.xenproject.org; Sun, 06 Sep 2020 22:48:21 +0000
X-Inumbo-ID: 30e5d24e-4439-40d1-ab46-f216e2cd66f7
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 30e5d24e-4439-40d1-ab46-f216e2cd66f7;
 Sun, 06 Sep 2020 22:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
 bh=OTj4Qo/26IEmeJz8fpehrc8i+hLIxKewAB3rOjTK4NQ=; b=ZJKViPH+dt7XHd7GDhJGbqe4Uv
 n0B87iOYdyfON+4O2XfuW7hmjw18m7XqyiBm0UE70ViBzjoYwsQrngFpp/9DjWI+14okfx/qRS3kF
 jb77psL5z093TaF3bry7tMMeKL7Gcyt3kPH8dowz59+4qg9zubUWfkSafQuTQnNNyvKg=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kF3SG-00085A-FB; Sun, 06 Sep 2020 22:48:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kF3SG-00007g-8L; Sun, 06 Sep 2020 22:48:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kF3SG-0000mV-7s; Sun, 06 Sep 2020 22:48:12 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-i386-xl-shadow
Message-Id: <E1kF3SG-0000mV-7s@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 06 Sep 2020 22:48:12 +0000
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
job test-amd64-i386-xl-shadow
testid guest-saverestore

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  696c273f3d9a169911308fb7e0a702a3eb6a150d
  Bug not present: a609b6577f7867db4be1470130b7b3c686398c4f
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/153833/


  commit 696c273f3d9a169911308fb7e0a702a3eb6a150d
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Fri Sep 4 11:13:01 2020 +0200
  
      x86: generalize padding field handling
      
      The original intention was to ignore padding fields, but the pattern
      matched only ones whose names started with an underscore. Also match
      fields whose names are in line with the C spec by not having a leading
      underscore. (Note that the leading ^ in the sed regexps was pointless
      and hence get dropped.)
      
      This requires adjusting some vNUMA macros, to avoid triggering
      "enumeration value ... not handled in switch" warnings, which - due to
      -Werror - would cause the build to fail. (I have to admit that I find
      these padding fields odd, when translation of the containing structure
      is needed anyway.)
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-i386-xl-shadow.guest-saverestore.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-shadow.guest-saverestore --summary-out=tmp/153833.bisection-summary --basis-template=152877 --blessings=real,real-bisect xen-unstable test-amd64-i386-xl-shadow guest-saverestore
Searching for failure / basis pass:
 153788 fail [host=huxelrebe1] / 153653 [host=chardonnay0] 153619 [host=elbling1] 153602 [host=chardonnay1] 153591 [host=fiano1] 153551 [host=rimava1] 153526 [host=albana1] 153494 [host=huxelrebe0] 153468 [host=fiano0] 153437 [host=pinot0] 153400 [host=pinot1] 153363 [host=chardonnay1] 153321 [host=fiano1] 153280 [host=chardonnay0] 153109 ok.
Failure / basis pass flights: 153788 / 153109
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 f4c1a541fa351e4f613471bbf397931f9e1ddd27
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 d400dc5729e4e132d61c2e7df57d81aaed762044
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc4\
 37c386260-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/xen.git#d400dc5729e4e132d61c2e7df57d81aaed762044-f4c1a541fa351e4f613471bbf397931f9e1ddd27
Loaded 5001 nodes in revision graph
Searching for test results:
 152985 []
 153004 [host=elbling1]
 153028 [host=albana1]
 153065 [host=albana0]
 153109 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 d400dc5729e4e132d61c2e7df57d81aaed762044
 153280 [host=chardonnay0]
 153321 [host=fiano1]
 153363 [host=chardonnay1]
 153400 [host=pinot1]
 153437 [host=pinot0]
 153468 [host=fiano0]
 153494 [host=huxelrebe0]
 153526 [host=albana1]
 153551 [host=rimava1]
 153591 [host=fiano1]
 153602 [host=chardonnay1]
 153619 [host=elbling1]
 153653 [host=chardonnay0]
 153758 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 82c3d15c903aa434473dfdb570096ae5db809b94
 153770 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 f4c1a541fa351e4f613471bbf397931f9e1ddd27
 153808 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 d400dc5729e4e132d61c2e7df57d81aaed762044
 153788 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 f4c1a541fa351e4f613471bbf397931f9e1ddd27
 153811 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 f4c1a541fa351e4f613471bbf397931f9e1ddd27
 153815 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 7dcd33d562ee8a8177c843f42721d5345f796fe8
 153820 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 7dcf89d9ec96254f69744ab6d91e8af13f4cda83
 153821 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 a609b6577f7867db4be1470130b7b3c686398c4f
 153824 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 696c273f3d9a169911308fb7e0a702a3eb6a150d
 153825 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 a609b6577f7867db4be1470130b7b3c686398c4f
 153829 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 696c273f3d9a169911308fb7e0a702a3eb6a150d
 153830 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 a609b6577f7867db4be1470130b7b3c686398c4f
 153833 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 696c273f3d9a169911308fb7e0a702a3eb6a150d
Searching for interesting versions
 Result found: flight 153109 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 a609b6577f7867db4be1470130b7b3c686398c4f, results HASH(0x55593787f360) HASH(0x55593790ed70) HASH(0x555937327e80) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1e\
 d79d824e605a70c3626bc437c386260 7dcd33d562ee8a8177c843f42721d5345f796fe8, results HASH(0x55593787a5a8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 d400dc5729e4e132d61c2e7df57d81aaed762044, results HASH(0x555937874568) HASH(0x555937887890) Result found: flight 153758 (fail), for basis failure (at ancestor ~249)
 Repro found: flight 153808 (pass), for basis pass
 Repro found: flight 153811 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 a609b6577f7867db4be1470130b7b3c686398c4f
No revisions left to test, checking graph state.
 Result found: flight 153821 (pass), for last pass
 Result found: flight 153824 (fail), for first failure
 Repro found: flight 153825 (pass), for last pass
 Repro found: flight 153829 (fail), for first failure
 Repro found: flight 153830 (pass), for last pass
 Repro found: flight 153833 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  696c273f3d9a169911308fb7e0a702a3eb6a150d
  Bug not present: a609b6577f7867db4be1470130b7b3c686398c4f
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/153833/


  commit 696c273f3d9a169911308fb7e0a702a3eb6a150d
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Fri Sep 4 11:13:01 2020 +0200
  
      x86: generalize padding field handling
      
      The original intention was to ignore padding fields, but the pattern
      matched only ones whose names started with an underscore. Also match
      fields whose names are in line with the C spec by not having a leading
      underscore. (Note that the leading ^ in the sed regexps was pointless
      and hence get dropped.)
      
      This requires adjusting some vNUMA macros, to avoid triggering
      "enumeration value ... not handled in switch" warnings, which - due to
      -Werror - would cause the build to fail. (I have to admit that I find
      these padding fields odd, when translation of the containing structure
      is needed anyway.)
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-shadow.guest-saverestore.{dot,ps,png,html,svg}.
----------------------------------------
153833: tolerable ALL FAIL

flight 153833 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/153833/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-shadow    15 guest-saverestore       fail baseline untested


jobs:
 test-amd64-i386-xl-shadow                                    fail    


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


