Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F20C2AF787
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 18:46:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25150.52754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcuCc-0006dj-Gn; Wed, 11 Nov 2020 17:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25150.52754; Wed, 11 Nov 2020 17:46:38 +0000
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
	id 1kcuCc-0006dK-D0; Wed, 11 Nov 2020 17:46:38 +0000
Received: by outflank-mailman (input) for mailman id 25150;
 Wed, 11 Nov 2020 17:46:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iq8f=ER=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kcuCa-0006cm-Uv
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 17:46:37 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce443ac3-4418-4fc0-be5e-3d9cfac26a02;
 Wed, 11 Nov 2020 17:46:28 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kcuCS-0001Ov-FI; Wed, 11 Nov 2020 17:46:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kcuCS-0006d5-6y; Wed, 11 Nov 2020 17:46:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kcuCS-00041g-4n; Wed, 11 Nov 2020 17:46:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Iq8f=ER=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kcuCa-0006cm-Uv
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 17:46:37 +0000
X-Inumbo-ID: ce443ac3-4418-4fc0-be5e-3d9cfac26a02
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ce443ac3-4418-4fc0-be5e-3d9cfac26a02;
	Wed, 11 Nov 2020 17:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=P0ft0nh5IDeEjN+jWD/Ewla2g4aNpZ1kSL6x/ny+wxc=; b=mLpQYxPuApHlbFDN9z8v0DjlHt
	RzO+aXfoper4aaxI6RnoejZKJo97wFr4jkedzqR+7+vyu+IpTth3Z5zmtqdZ/P3us/WNu7ULYXSwM
	qy8kd7w93TyonG0FD7GfEwhmScRzqdVcwsbzKUwIzx75Gri6kYieTkxKrkPKg6MBZeNA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcuCS-0001Ov-FI; Wed, 11 Nov 2020 17:46:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcuCS-0006d5-6y; Wed, 11 Nov 2020 17:46:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcuCS-00041g-4n; Wed, 11 Nov 2020 17:46:28 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156634-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.11-testing test] 156634: regressions - FAIL
X-Osstest-Failures:
    xen-4.11-testing:test-amd64-amd64-xl:debian-fixup:fail:regression
    xen-4.11-testing:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:regression
    xen-4.11-testing:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:nonblocking
    xen-4.11-testing:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:nonblocking
    xen-4.11-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.11-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.11-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.11-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.11-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.11-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.11-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.11-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.11-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=1447d449fab7e48c85faf83951842bb60d7dabe5
X-Osstest-Versions-That:
    xen=b5eb4956e1d2d73546f8cfdef635b6819ed7b527
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 11 Nov 2020 17:46:28 +0000

flight 156634 xen-4.11-testing real [real]
flight 156686 xen-4.11-testing real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/156634/
http://logs.test-lab.xenproject.org/osstest/logs/156686/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl          13 debian-fixup             fail REGR. vs. 156397
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 20 guest-start/debianhvm.repeat fail REGR. vs. 156397

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail like 156397
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail like 156397
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 156397
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 156397
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 156397
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 156397
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 156397
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 156397
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 156397
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 156397
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 156397
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 156397
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 156397
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  1447d449fab7e48c85faf83951842bb60d7dabe5
baseline version:
 xen                  b5eb4956e1d2d73546f8cfdef635b6819ed7b527

Last test of basis   156397  2020-11-04 09:05:50 Z    7 days
Testing same since   156634  2020-11-10 18:06:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          fail    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-xl-vhd                                      pass    


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
commit 1447d449fab7e48c85faf83951842bb60d7dabe5
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Apr 23 13:05:46 2020 +0100

    x86/msr: Disallow guest access to the RAPL MSRs
    
    Researchers have demonstrated using the RAPL interface to perform a
    differential power analysis attack to recover AES keys used by other cores in
    the system.
    
    Furthermore, even privileged guests cannot use this interface correctly, due
    to MSR scope and vcpu scheduling issues.  The interface would want to be
    paravirtualised to be used sensibly.
    
    Disallow access to the RAPL MSRs completely, as well as other MSRs which
    potentially access fine grain power information.
    
    This is part of XSA-351.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 3b5de119f0399cbe745502cb6ebd5e6633cc139c
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Tue Oct 6 18:23:27 2020 +0200

    x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL}
    
    Currently a PV hardware domain can also be given control over the CPU
    frequency, and such guest is allowed to write to MSR_IA32_PERF_CTL.
    However since commit 322ec7c89f6 the default behavior has been changed
    to reject accesses to not explicitly handled MSRs, preventing PV
    guests that manage CPU frequency from reading
    MSR_IA32_PERF_{STATUS/CTL}.
    
    Additionally some HVM guests (Windows at least) will attempt to read
    MSR_IA32_PERF_CTL and will panic if given back a #GP fault:
    
      vmx.c:3035:d8v0 RDMSR 0x00000199 unimplemented
      d8v0 VIRIDIAN CRASH: 3b c0000096 fffff806871c1651 ffffda0253683720 0
    
    Move the handling of MSR_IA32_PERF_{STATUS/CTL} to the common MSR
    handling shared between HVM and PV guests, and add an explicit case
    for reads to MSR_IA32_PERF_{STATUS/CTL}.
    
    Restore previous behavior and allow PV guests with the required
    permissions to read the contents of the mentioned MSRs. Non privileged
    guests will get 0 when trying to read those registers, as writes to
    MSR_IA32_PERF_CTL by such guest will already be silently dropped.
    
    Fixes: 322ec7c89f6 ('x86/pv: disallow access to unknown MSRs')
    Fixes: 84e848fd7a1 ('x86/hvm: disallow access to unknown MSRs')
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit 3059178798a23ba870ff86ff54d442a07e6651fc)

commit 65fad0a426db082fa4989b7c4567438bfa93b596
Author: Julien Grall <jgrall@amazon.com>
Date:   Mon Nov 9 20:28:59 2020 +0000

    xen/arm: Always trap AMU system registers
    
    The Activity Monitors Unit (AMU) has been introduced by ARMv8.4. It is
    considered to be unsafe to be expose to guests as they might expose
    information about code executed by other guests or the host.
    
    Arm provided a way to trap all the AMU system registers by setting
    CPTR_EL2.TAM to 1.
    
    Unfortunately, on older revision of the specification, the bit 30 (now
    CPTR_EL1.TAM) was RES0. Because of that, Xen is setting it to 0 and
    therefore the system registers would be exposed to the guest when it is
    run on processors with AMU.
    
    As the bit is mark as UNKNOWN at boot in Armv8.4, the only safe solution
    for us is to always set CPTR_EL1.TAM to 1.
    
    Guest trying to access the AMU system registers will now receive an
    undefined instruction. Unfortunately, this means that even well-behaved
    guest may fail to boot because we don't sanitize the ID registers.
    
    This is a known issues with other Armv8.0+ features (e.g. SVE, Pointer
    Auth). This will taken care separately.
    
    This is part of XSA-351 (or XSA-93 re-born).
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Andre Przywara <andre.przywara@arm.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    (cherry picked from commit 628e1becb6fb121475a6ce68e3f1cb4499851255)
(qemu changes not included)

