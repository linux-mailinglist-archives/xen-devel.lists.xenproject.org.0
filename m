Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE33260455
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 20:14:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFLeW-0005mQ-FI; Mon, 07 Sep 2020 18:14:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1dHX=CQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kFLeV-0005le-PM
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 18:14:03 +0000
X-Inumbo-ID: 2195e30b-195d-438c-a43e-b5da3fd0b904
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2195e30b-195d-438c-a43e-b5da3fd0b904;
 Mon, 07 Sep 2020 18:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
 bh=MhIuySsse72AcCdJwsOyS/Zy9HeZJPKL/Te/YFoGpmk=; b=Nj0oSrTXTqAorZbYUg2R4YjQ+w
 lP8FAwWCd0yxDqsfM420hFffbJ9EKyVW3qQWaSCPfjOoZsxyUcZADbikYcVnzv2K3qdTKJ/UqFe/j
 5MUdSCQ5NwpW23oecFsyPx0OdJHTffbloTnRTTLgRLmwhicJAEU1iMLfvZk6vpOFfAro=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kFLeT-0007BH-5t; Mon, 07 Sep 2020 18:14:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kFLeS-0004wF-Vl; Mon, 07 Sep 2020 18:14:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kFLeS-0007Yk-VG; Mon, 07 Sep 2020 18:14:00 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-i386-freebsd10-amd64
Message-Id: <E1kFLeS-0007Yk-VG@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 07 Sep 2020 18:14:00 +0000
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/153893/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-i386-freebsd10-amd64.guest-saverestore.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-i386-freebsd10-amd64.guest-saverestore --summary-out=tmp/153893.bisection-summary --basis-template=152877 --blessings=real,real-bisect xen-unstable test-amd64-i386-freebsd10-amd64 guest-saverestore
Searching for failure / basis pass:
 153845 fail [host=chardonnay1] / 153653 [host=elbling1] 153602 [host=fiano0] 153591 [host=albana1] 153551 [host=albana0] 153526 [host=chardonnay0] 153494 [host=rimava1] 153468 [host=fiano1] 153437 [host=pinot0] 153400 [host=elbling0] 153363 [host=albana1] 153321 [host=pinot1] 153280 ok.
Failure / basis pass flights: 153845 / 153280
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
 153004 [host=chardonnay0]
 153028 [host=fiano0]
 153065 [host=huxelrebe0]
 153109 [host=huxelrebe1]
 153280 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 d400dc5729e4e132d61c2e7df57d81aaed762044
 153321 [host=pinot1]
 153363 [host=albana1]
 153400 [host=elbling0]
 153437 [host=pinot0]
 153468 [host=fiano1]
 153494 [host=rimava1]
 153526 [host=chardonnay0]
 153551 [host=albana0]
 153591 [host=albana1]
 153602 [host=fiano0]
 153619 [host=elbling1]
 153653 [host=elbling1]
 153758 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 82c3d15c903aa434473dfdb570096ae5db809b94
 153770 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 f4c1a541fa351e4f613471bbf397931f9e1ddd27
 153788 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 f4c1a541fa351e4f613471bbf397931f9e1ddd27
 153813 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 f4c1a541fa351e4f613471bbf397931f9e1ddd27
 153865 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 d400dc5729e4e132d61c2e7df57d81aaed762044
 153869 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 f4c1a541fa351e4f613471bbf397931f9e1ddd27
 153871 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 7dcd33d562ee8a8177c843f42721d5345f796fe8
 153874 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 7dcf89d9ec96254f69744ab6d91e8af13f4cda83
 153876 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 a609b6577f7867db4be1470130b7b3c686398c4f
 153879 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 696c273f3d9a169911308fb7e0a702a3eb6a150d
 153845 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 f4c1a541fa351e4f613471bbf397931f9e1ddd27
 153881 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 a609b6577f7867db4be1470130b7b3c686398c4f
 153883 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 696c273f3d9a169911308fb7e0a702a3eb6a150d
 153888 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 a609b6577f7867db4be1470130b7b3c686398c4f
 153893 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 696c273f3d9a169911308fb7e0a702a3eb6a150d
Searching for interesting versions
 Result found: flight 153280 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 a609b6577f7867db4be1470130b7b3c686398c4f, results HASH(0x56053f238b88) HASH(0x56053eccd228) HASH(0x56053ecd4450) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1e\
 d79d824e605a70c3626bc437c386260 7dcd33d562ee8a8177c843f42721d5345f796fe8, results HASH(0x56053f2343f8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 d400dc5729e4e132d61c2e7df57d81aaed762044, results HASH(0x56053f221cd0) HASH(0x56053f231dc8) Result found: flight 153758 (fail), for basis failure (at ancestor ~249)
 Repro found: flight 153865 (pass), for basis pass
 Repro found: flight 153869 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 a609b6577f7867db4be1470130b7b3c686398c4f
No revisions left to test, checking graph state.
 Result found: flight 153876 (pass), for last pass
 Result found: flight 153879 (fail), for first failure
 Repro found: flight 153881 (pass), for last pass
 Repro found: flight 153883 (fail), for first failure
 Repro found: flight 153888 (pass), for last pass
 Repro found: flight 153893 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  696c273f3d9a169911308fb7e0a702a3eb6a150d
  Bug not present: a609b6577f7867db4be1470130b7b3c686398c4f
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/153893/


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

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-i386-freebsd10-amd64.guest-saverestore.{dot,ps,png,html,svg}.
----------------------------------------
153893: tolerable ALL FAIL

flight 153893 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/153893/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-freebsd10-amd64 14 guest-saverestore    fail baseline untested


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


