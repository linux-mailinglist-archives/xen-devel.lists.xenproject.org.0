Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F5C28621D
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 17:28:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3552.10171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQBLa-0003BM-PC; Wed, 07 Oct 2020 15:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3552.10171; Wed, 07 Oct 2020 15:27:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQBLa-0003Ax-LE; Wed, 07 Oct 2020 15:27:18 +0000
Received: by outflank-mailman (input) for mailman id 3552;
 Wed, 07 Oct 2020 15:27:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xB9j=DO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kQBLY-0003Ap-DE
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 15:27:16 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2efdd02-3d7d-4bfe-a141-a4c6fe8b1839;
 Wed, 07 Oct 2020 15:27:14 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kQBLV-0007N0-Sz; Wed, 07 Oct 2020 15:27:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kQBLV-0003vk-Hc; Wed, 07 Oct 2020 15:27:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kQBLV-0000C5-Gx; Wed, 07 Oct 2020 15:27:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xB9j=DO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kQBLY-0003Ap-DE
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 15:27:16 +0000
X-Inumbo-ID: d2efdd02-3d7d-4bfe-a141-a4c6fe8b1839
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d2efdd02-3d7d-4bfe-a141-a4c6fe8b1839;
	Wed, 07 Oct 2020 15:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=CpeEjilxo9u+hSrMDe3ruWDV9WxRmFMA73y+wtNuKT8=; b=m6xBndTw6WSkJCKB5KZ0xib8eQ
	whb4LaWqI+Vgut0uVV+ivhyi/JTgmsunjLAxfTrTJJEJA1JkFTanPgMQem11CBopUmPvLsspP4IEa
	jyqxonkRUAuFavfGIaTMkPq9bfeum3V9p0fCMRRBrUxJwoM31auZyVVmMMT78gkPkl6A=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQBLV-0007N0-Sz; Wed, 07 Oct 2020 15:27:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQBLV-0003vk-Hc; Wed, 07 Oct 2020 15:27:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQBLV-0000C5-Gx; Wed, 07 Oct 2020 15:27:13 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155517-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 155517: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:xen-build:fail:regression
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=e4e64408f5c755da3bf7bfd78e70ad9f6c448376
X-Osstest-Versions-That:
    xen=93508595d588afe9dca087f95200effb7cedc81f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 07 Oct 2020 15:27:13 +0000

flight 155517 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155517/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 155495

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  e4e64408f5c755da3bf7bfd78e70ad9f6c448376
baseline version:
 xen                  93508595d588afe9dca087f95200effb7cedc81f

Last test of basis   155495  2020-10-06 12:00:29 Z    1 days
Testing same since   155517  2020-10-07 12:01:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bertrand Marquis <bertrand.marquis@arm.com>
  Jan Beulich <jbeulich@suse.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  fail    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-amd64-libvirt                                     blocked 


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


Not pushing.

------------------------------------------------------------
commit e4e64408f5c755da3bf7bfd78e70ad9f6c448376
Author: Bertrand Marquis <bertrand.marquis@arm.com>
Date:   Fri Oct 2 11:42:09 2020 +0100

    build: always use BASEDIR for xen sub-directory
    
    Modify Makefiles using $(XEN_ROOT)/xen to use $(BASEDIR) instead.
    
    This is removing the dependency to xen subdirectory preventing using a
    wrong configuration file when xen subdirectory is duplicated for
    compilation tests.
    
    Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

