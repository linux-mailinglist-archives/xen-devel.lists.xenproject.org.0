Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7B3307E21
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 19:39:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77413.140197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5CBv-0003NQ-Sq; Thu, 28 Jan 2021 18:38:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77413.140197; Thu, 28 Jan 2021 18:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5CBv-0003Mr-MZ; Thu, 28 Jan 2021 18:38:51 +0000
Received: by outflank-mailman (input) for mailman id 77413;
 Thu, 28 Jan 2021 18:38:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l5CBu-0003Mj-Fk; Thu, 28 Jan 2021 18:38:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l5CBu-000434-83; Thu, 28 Jan 2021 18:38:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l5CBu-0000YE-1s; Thu, 28 Jan 2021 18:38:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l5CBu-0003Vz-1N; Thu, 28 Jan 2021 18:38:50 +0000
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
	bh=zESGFFmYYcORrpHGsvJkemrIrCE9gnVvOl4fQDfdTTE=; b=NUu9Uu760CWe11EsZOA3y8PfbD
	zpa1H3vuX+x1nbSuPuDn9mGX59LEUpZ7oUP0tAtd8fSRnR+o01m/jmsQcMypq/m17ile+Vt7hkvi7
	VpAUVxIUqu8cjwnHMS6RnZZST/11SeN36LchY502oUuTRWPkW9mfV9EZD4uKecBV+tfw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-amd64
Message-Id: <E1l5CBu-0003Vz-1N@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 28 Jan 2021 18:38:50 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-amd64
testid xen-build

Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  2b4b33ffe7d67dc677350a3e1fa7a11d7ab49fb4
  Bug not present: 6677b5a3577c16501fbc51a3341446905bd21c38
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/158746/


  commit 2b4b33ffe7d67dc677350a3e1fa7a11d7ab49fb4
  Author: Manuel Bouyer <bouyer@netbsd.org>
  Date:   Tue Jan 26 23:47:52 2021 +0100
  
      libs/foreignmemory: Implement on NetBSD
      
      Implement foreignmemory interface on NetBSD. The compat interface is now used
      only on __sun__
      
      Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build --summary-out=tmp/158746.bisection-summary --basis-template=158713 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-amd64 xen-build
Searching for failure / basis pass:
 158728 fail [host=himrod1] / 158713 [host=himrod2] 158710 [host=himrod2] 158708 [host=himrod2] 158702 ok.
Failure / basis pass flights: 158728 / 158702
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 6e2046378086d2eaf3f1fe807a2fd697f2630f40
Basis pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 464301737acfa90b46b79659b19d7f456861def3
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#464301737acfa90b46b79659b19d7f456861def3-6e2046378086d2eaf3f1fe807a2fd697f2630f40
Loaded 5001 nodes in revision graph
Searching for test results:
 158702 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 464301737acfa90b46b79659b19d7f456861def3
 158708 [host=himrod2]
 158710 [host=himrod2]
 158713 [host=himrod2]
 158724 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2b4b33ffe7d67dc677350a3e1fa7a11d7ab49fb4
 158727 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 464301737acfa90b46b79659b19d7f456861def3
 158729 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2b4b33ffe7d67dc677350a3e1fa7a11d7ab49fb4
 158732 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 75e1d599130a62f7ab04d384f22359b8e8274410
 158733 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 754865c298174560c9724bfcb2c1abb6fbc118ac
 158735 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 aa1b136ff1798a2c1a81270ccd20e7252e30ff1f
 158737 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 6677b5a3577c16501fbc51a3341446905bd21c38
 158738 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2b4b33ffe7d67dc677350a3e1fa7a11d7ab49fb4
 158739 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 6677b5a3577c16501fbc51a3341446905bd21c38
 158728 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 6e2046378086d2eaf3f1fe807a2fd697f2630f40
 158741 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2b4b33ffe7d67dc677350a3e1fa7a11d7ab49fb4
 158744 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 6677b5a3577c16501fbc51a3341446905bd21c38
 158746 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 2b4b33ffe7d67dc677350a3e1fa7a11d7ab49fb4
Searching for interesting versions
 Result found: flight 158702 (pass), for basis pass
 For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 6677b5a3577c16501fbc51a3341446905bd21c38, results HASH(0x55a0a6308500) HASH(0x55a0a630c510) HASH(0x55a0a6312250) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 aa1b136ff1798a2c1a81270ccd20e7252e30ff1f, results HASH(0x55a0a63064f8) For basis failure, parent search stopping at 3d273dd05e51e5a1\
 ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 754865c298174560c9724bfcb2c1abb6fbc118ac, results HASH(0x55a0a63052d0) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 75e1d599130a62f7ab04d384f22359b8e8274410, results HASH(0x55a0a63032c8) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 464301737acfa90b46b79659b19d7f456861de\
 f3, results HASH(0x55a0a62f8f78) HASH(0x55a0a62ff8b8) Result found: flight 158724 (fail), for basis failure (at ancestor ~928)
 Repro found: flight 158727 (pass), for basis pass
 Repro found: flight 158728 (fail), for basis failure
 0 revisions at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 6677b5a3577c16501fbc51a3341446905bd21c38
No revisions left to test, checking graph state.
 Result found: flight 158737 (pass), for last pass
 Result found: flight 158738 (fail), for first failure
 Repro found: flight 158739 (pass), for last pass
 Repro found: flight 158741 (fail), for first failure
 Repro found: flight 158744 (pass), for last pass
 Repro found: flight 158746 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  2b4b33ffe7d67dc677350a3e1fa7a11d7ab49fb4
  Bug not present: 6677b5a3577c16501fbc51a3341446905bd21c38
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/158746/


  commit 2b4b33ffe7d67dc677350a3e1fa7a11d7ab49fb4
  Author: Manuel Bouyer <bouyer@netbsd.org>
  Date:   Tue Jan 26 23:47:52 2021 +0100
  
      libs/foreignmemory: Implement on NetBSD
      
      Implement foreignmemory interface on NetBSD. The compat interface is now used
      only on __sun__
      
      Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
158746: tolerable ALL FAIL

flight 158746 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/158746/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64                   6 xen-build               fail baseline untested


jobs:
 build-amd64                                                  fail    


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


