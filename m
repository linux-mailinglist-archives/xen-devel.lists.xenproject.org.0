Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 104AE25EDF0
	for <lists+xen-devel@lfdr.de>; Sun,  6 Sep 2020 15:15:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEuVG-0007qq-7b; Sun, 06 Sep 2020 13:14:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AZON=CP=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kEuVE-0007ql-Jj
 for xen-devel@lists.xenproject.org; Sun, 06 Sep 2020 13:14:40 +0000
X-Inumbo-ID: ea398bba-3ce0-4b09-9065-4a4dc50ef0a0
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea398bba-3ce0-4b09-9065-4a4dc50ef0a0;
 Sun, 06 Sep 2020 13:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
 bh=eQko/RLJuFfcbIol85gWSkRqCOUZ8Zo96UFd+Mflv9A=; b=59429zwChMfs3h35h+C9z95OF3
 9eipvfokm4DKQaVW19jKUQdrUchnjgxDI8aFjp3gfwrbDF0KudnzwnvMlcy9vuQhXB9MXS3xJ/SdB
 Cw+GhWEjxka+fi27wr7xxIS0wHMWbkXIwHl5MYcv4v0qVnb6lrCYXNJfRJimqH2H456Q=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kEuVC-00043m-2Y; Sun, 06 Sep 2020 13:14:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kEuVB-00029Y-S0; Sun, 06 Sep 2020 13:14:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kEuVB-0001Ng-RY; Sun, 06 Sep 2020 13:14:37 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-i386-freebsd10-i386
Message-Id: <E1kEuVB-0001Ng-RY@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 06 Sep 2020 13:14:37 +0000
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
job test-amd64-i386-freebsd10-i386
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/153804/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-i386-freebsd10-i386.guest-saverestore.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-i386-freebsd10-i386.guest-saverestore --summary-out=tmp/153804.bisection-summary --basis-template=152877 --blessings=real,real-bisect xen-unstable test-amd64-i386-freebsd10-i386 guest-saverestore
Searching for failure / basis pass:
 153770 fail [host=chardonnay0] / 153653 [host=pinot1] 153619 [host=albana0] 153602 [host=albana1] 153591 [host=huxelrebe0] 153551 [host=elbling0] 153526 [host=fiano1] 153494 [host=rimava1] 153468 [host=huxelrebe1] 153437 ok.
Failure / basis pass flights: 153770 / 153437
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 f4c1a541fa351e4f613471bbf397931f9e1ddd27
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 afe018e041ec112d90a8b4e6ed607d22aa06f280
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc4\
 37c386260-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/xen.git#afe018e041ec112d90a8b4e6ed607d22aa06f280-f4c1a541fa351e4f613471bbf397931f9e1ddd27
Loaded 5001 nodes in revision graph
Searching for test results:
 153400 [host=pinot0]
 153437 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 afe018e041ec112d90a8b4e6ed607d22aa06f280
 153468 [host=huxelrebe1]
 153494 [host=rimava1]
 153526 [host=fiano1]
 153551 [host=elbling0]
 153591 [host=huxelrebe0]
 153602 [host=albana1]
 153619 [host=albana0]
 153653 [host=pinot1]
 153758 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 82c3d15c903aa434473dfdb570096ae5db809b94
 153769 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 afe018e041ec112d90a8b4e6ed607d22aa06f280
 153774 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 82c3d15c903aa434473dfdb570096ae5db809b94
 153779 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 4d7bcd128f11dff49b0fd8eb367a3c546a8e38af
 153782 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 7dcf89d9ec96254f69744ab6d91e8af13f4cda83
 153770 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 f4c1a541fa351e4f613471bbf397931f9e1ddd27
 153786 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 a609b6577f7867db4be1470130b7b3c686398c4f
 153790 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 696c273f3d9a169911308fb7e0a702a3eb6a150d
 153794 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 a609b6577f7867db4be1470130b7b3c686398c4f
 153798 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 696c273f3d9a169911308fb7e0a702a3eb6a150d
 153801 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 a609b6577f7867db4be1470130b7b3c686398c4f
 153804 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 696c273f3d9a169911308fb7e0a702a3eb6a150d
Searching for interesting versions
 Result found: flight 153437 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 a609b6577f7867db4be1470130b7b3c686398c4f, results HASH(0x5624fbad21d8) HASH(0x5624fbaf9720) HASH(0x5624fbb74ad8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1e\
 d79d824e605a70c3626bc437c386260 4d7bcd128f11dff49b0fd8eb367a3c546a8e38af, results HASH(0x5624fbae6ea0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 afe018e041ec112d90a8b4e6ed607d22aa06f280, results HASH(0x5624fbae0ce0) HASH(0x5624fbaeba20) Result found: flight 153758 (fail), for basis failure (at ancestor ~249)
 Repro found: flight 153769 (pass), for basis pass
 Repro found: flight 153770 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 a609b6577f7867db4be1470130b7b3c686398c4f
No revisions left to test, checking graph state.
 Result found: flight 153786 (pass), for last pass
 Result found: flight 153790 (fail), for first failure
 Repro found: flight 153794 (pass), for last pass
 Repro found: flight 153798 (fail), for first failure
 Repro found: flight 153801 (pass), for last pass
 Repro found: flight 153804 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  696c273f3d9a169911308fb7e0a702a3eb6a150d
  Bug not present: a609b6577f7867db4be1470130b7b3c686398c4f
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/153804/


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

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-i386-freebsd10-i386.guest-saverestore.{dot,ps,png,html,svg}.
----------------------------------------
153804: tolerable ALL FAIL

flight 153804 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/153804/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-freebsd10-i386 14 guest-saverestore     fail baseline untested


jobs:
 test-amd64-i386-freebsd10-i386                               fail    


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


