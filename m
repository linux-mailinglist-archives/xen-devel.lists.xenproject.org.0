Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E4526C8BF
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 20:57:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIcbj-0002Ov-Pg; Wed, 16 Sep 2020 18:56:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJNc=CZ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kIcbi-0002Np-8h
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 18:56:42 +0000
X-Inumbo-ID: 7a640c1d-6cf1-47b8-97e0-bdef365e3644
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a640c1d-6cf1-47b8-97e0-bdef365e3644;
 Wed, 16 Sep 2020 18:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
 bh=HZnGvVbke8IGhcwGAorzpDLScms9rSM89Ky4z5vkOkI=; b=6O1M/iT59gUxejNJ4lD19FkxP8
 DT2tHyjnWwLr9tLqsoNQCEb3M/lM0tAj4oq3QPp8Xj75SSevh8HBehKwufcHNBFqnqNOrNXTuzgAj
 9ukUljUS8MMhsHs2+ptrXh8XLQz4j7/JDkt4sA96LgfFao9sBdWQeX+iLS/14lPkvqN8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kIcba-0006Ak-Fh; Wed, 16 Sep 2020 18:56:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kIcba-00048D-8v; Wed, 16 Sep 2020 18:56:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kIcba-0006Rk-8P; Wed, 16 Sep 2020 18:56:34 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-armhf-armhf-libvirt-raw
Message-Id: <E1kIcba-0006Rk-8P@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 16 Sep 2020 18:56:34 +0000
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
job test-armhf-armhf-libvirt-raw
testid guest-start

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
  Bug not present: 0b77395ef2f20058305240f2395883b1d961982a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/154394/


  commit 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri Aug 28 17:07:19 2020 +0200
  
      tools/python: drop libxenguest from setup.py
      
      There is not a single wrapper for a libxenguest function defined.
      So drop libxenguest from tools/python/setup.py.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-armhf-armhf-libvirt-raw.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-armhf-armhf-libvirt-raw.guest-start --summary-out=tmp/154394.bisection-summary --basis-template=154016 --blessings=real,real-bisect xen-unstable test-armhf-armhf-libvirt-raw guest-start
Searching for failure / basis pass:
 154090 fail [host=cubietruck-gleizes] / 154016 [host=arndale-lakeside] 153983 [host=arndale-westfield] 153957 [host=arndale-metrocentre] 153931 [host=cubietruck-braque] 153906 [host=arndale-bluewater] 153882 [host=arndale-bluewater] 153845 ok.
Failure / basis pass flights: 154090 / 153845
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 cc13835377debe4e300c5f5f11f8f78920778c4e
Basis pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 f4c1a541fa351e4f613471bbf397931f9e1ddd27
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#2c846fa6bcc11929c9fb857a22430fb9945654ad-2c846fa6bcc11929c9fb857a22430fb9945654ad https://gitlab.com/keycodemap/keycodemapdb.git#27acf0ef828bf719b2053ba398b195829413dbdd-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/linux-pvops.git#a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9-a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0\
 dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc437c386260-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/xen.git#f4c1a541fa351e4f613471bbf397931f9e1ddd27-cc13835377debe4e300c5f5f11f8f78920778c4e
Loaded 5001 nodes in revision graph
Searching for test results:
 153758 [host=arndale-lakeside]
 153770 [host=arndale-westfield]
 153788 [host=cubietruck-metzinger]
 153813 [host=cubietruck-picasso]
 153845 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 f4c1a541fa351e4f613471bbf397931f9e1ddd27
 153882 [host=arndale-bluewater]
 153917 [host=arndale-bluewater]
 153906 [host=arndale-bluewater]
 153929 [host=arndale-bluewater]
 153931 [host=cubietruck-braque]
 153957 [host=arndale-metrocentre]
 153983 [host=arndale-westfield]
 154016 [host=arndale-lakeside]
 154036 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 89002866bb6c6f26024f015820c8f52012f95cf2
 154058 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 89002866bb6c6f26024f015820c8f52012f95cf2
 154090 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 cc13835377debe4e300c5f5f11f8f78920778c4e
 154351 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 f4c1a541fa351e4f613471bbf397931f9e1ddd27
 154354 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 cc13835377debe4e300c5f5f11f8f78920778c4e
 154360 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 256920d3a232c2e6631dbd505d036c0d3046d299
 154363 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a
 154366 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 a547703b243767185d69731a922c5b77cf2b4a2b
 154368 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 bb2ea7f392348b2697c5b9140deea56b1b56776e
 154372 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
 154377 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a
 154383 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
 154390 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a
 154394 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
Searching for interesting versions
 Result found: flight 153845 (pass), for basis pass
 For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a, results HASH(0x559a8bc303b0) HASH(0x559a8bc2ac98) HASH(0x559a8bcb7168) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1db\
 affe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 f4c1a541fa351e4f613471bbf397931f9e1ddd27, results HASH(0x559a8bc1b980) HASH(0x559a8bc0fc28) Result found: flight 154036 (fail), for basis failure (at ancestor ~295)
 Repro found: flight 154351 (pass), for basis pass
 Repro found: flight 154354 (fail), for basis failure
 0 revisions at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a
No revisions left to test, checking graph state.
 Result found: flight 154363 (pass), for last pass
 Result found: flight 154372 (fail), for first failure
 Repro found: flight 154377 (pass), for last pass
 Repro found: flight 154383 (fail), for first failure
 Repro found: flight 154390 (pass), for last pass
 Repro found: flight 154394 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
  Bug not present: 0b77395ef2f20058305240f2395883b1d961982a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/154394/


  commit 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri Aug 28 17:07:19 2020 +0200
  
      tools/python: drop libxenguest from setup.py
      
      There is not a single wrapper for a libxenguest function defined.
      So drop libxenguest from tools/python/setup.py.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-armhf-armhf-libvirt-raw.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
154394: tolerable FAIL

flight 154394 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/154394/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-armhf-armhf-libvirt-raw 11 guest-start             fail baseline untested


jobs:
 build-armhf-libvirt                                          pass    
 test-armhf-armhf-libvirt-raw                                 fail    


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


