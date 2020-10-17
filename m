Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8498529144D
	for <lists+xen-devel@lfdr.de>; Sat, 17 Oct 2020 22:30:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8440.22531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTspQ-0006kW-3i; Sat, 17 Oct 2020 20:29:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8440.22531; Sat, 17 Oct 2020 20:29:24 +0000
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
	id 1kTspQ-0006k7-03; Sat, 17 Oct 2020 20:29:24 +0000
Received: by outflank-mailman (input) for mailman id 8440;
 Sat, 17 Oct 2020 20:29:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMVr=DY=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kTspO-0006jY-Js
 for xen-devel@lists.xenproject.org; Sat, 17 Oct 2020 20:29:22 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6319132-5f38-4a52-8f39-f57169e62866;
 Sat, 17 Oct 2020 20:29:14 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kTspF-00053T-QL; Sat, 17 Oct 2020 20:29:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kTspF-0000yq-Hb; Sat, 17 Oct 2020 20:29:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kTspF-0006Qj-H3; Sat, 17 Oct 2020 20:29:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=QMVr=DY=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kTspO-0006jY-Js
	for xen-devel@lists.xenproject.org; Sat, 17 Oct 2020 20:29:22 +0000
X-Inumbo-ID: a6319132-5f38-4a52-8f39-f57169e62866
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a6319132-5f38-4a52-8f39-f57169e62866;
	Sat, 17 Oct 2020 20:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=e/DI5aPZHgxp8ytRLCCbv5Nsf6RVquWIwFbOwrgvjGk=; b=1e1f1Q28iTSCYTjTcyQxfzKQXE
	JKsd0ZmhrjMT4P7X+0iXM6mB5EsH/JhFgjCN3AUaKfeGhAJY76q8u9kDXZqMF6Ca5VI8W/BpA9JHE
	7jMIhdhQQ+8cODmDCFt55b20PSv+7GXuaFwoHoHz7hKPvrJyVUqjEfy8FMIXXZVg6aYE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kTspF-00053T-QL; Sat, 17 Oct 2020 20:29:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kTspF-0000yq-Hb; Sat, 17 Oct 2020 20:29:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kTspF-0006Qj-H3; Sat, 17 Oct 2020 20:29:13 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155921-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 155921: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-libvirt-vhd:debian-di-install:fail:regression
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=0dfddb2116e3757f77a691a3fe335173088d69dc
X-Osstest-Versions-That:
    xen=6ee2e66674f36b6d27a95f4ddf27226905cc63a4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 17 Oct 2020 20:29:13 +0000

flight 155921 xen-unstable real [real]
flight 155936 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/155921/
http://logs.test-lab.xenproject.org/osstest/logs/155936/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt-vhd 12 debian-di-install        fail REGR. vs. 155894

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 155894
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 155894
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 155894
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 155894
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 155894
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 155894
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 155894
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 155894
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 155894
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 155894
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 155894
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  0dfddb2116e3757f77a691a3fe335173088d69dc
baseline version:
 xen                  6ee2e66674f36b6d27a95f4ddf27226905cc63a4

Last test of basis   155894  2020-10-16 11:23:43 Z    1 days
Testing same since   155921  2020-10-17 04:28:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  Elliott Mitchell <ehem+xen@m5p.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Wei Liu <wl@xen.org>

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
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
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
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
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
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
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
 test-amd64-amd64-libvirt-vhd                                 fail    
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
commit 0dfddb2116e3757f77a691a3fe335173088d69dc
Author: Bertrand Marquis <bertrand.marquis@arm.com>
Date:   Thu Oct 15 10:16:09 2020 +0100

    tools/xenpmd: Fix gcc10 snprintf warning
    
    Add a check for snprintf return code and ignore the entry if we get an
    error. This should in fact never happen and is more a trick to make gcc
    happy and prevent compilation errors.
    
    This is solving the following gcc warning when compiling for arm32 host
    platforms with optimization activated:
    xenpmd.c:92:37: error: '%s' directive output may be truncated writing
    between 4 and 2147483645 bytes into a region of size 271
    [-Werror=format-truncation=]
    
    This is also solving the following Debian bug:
    https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=970802
    
    Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 17d192e0238d6c714e9f04593b59597b7090be38
Author: Elliott Mitchell <ehem+xen@m5p.com>
Date:   Sun Oct 11 18:11:39 2020 -0700

    tools/python: Pass linker to Python build process
    
    Unexpectedly the environment variable which needs to be passed is
    $LDSHARED and not $LD.  Otherwise Python may find the build `ld` instead
    of the host `ld`.
    
    Replace $(LDFLAGS) with $(SHLIB_LDFLAGS) as Python needs shared objects
    it can load at runtime, not executables.
    
    This uses $(CC) instead of $(LD) since Python distutils appends $CFLAGS
    to $LDFLAGS which breaks many linkers.
    
    Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
    Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

commit 40fe714ca4245a9716264fcb3ee8df42c3650cf6
Author: Bertrand Marquis <bertrand.marquis@arm.com>
Date:   Wed Oct 7 14:57:01 2020 +0100

    tools/libs/stat: use memcpy instead of strncpy in getBridge
    
    Use memcpy in getBridge to prevent gcc warnings about truncated
    strings. We know that we might truncate it, so the gcc warning
    here is wrong.
    Revert previous change changing buffer sizes as bigger buffers
    are not needed.
    
    Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Wei Liu <wl@xen.org>

commit a7952a320c1e202a218702bfdb14f75132f04894
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Oct 5 12:46:30 2020 +0100

    x86/smpboot: Don't unconditionally call memguard_guard_stack() in cpu_smpboot_alloc()
    
    cpu_smpboot_alloc() is designed to be idempotent with respect to partially
    initialised state.  This occurs for S3 and CPU parking, where enough state to
    handle NMIs/#MCs needs to remain valid for the entire lifetime of Xen, even
    when we otherwise want to offline the CPU.
    
    For simplicity between various configuration, Xen always uses shadow stack
    mappings (Read-only + Dirty) for the guard page, irrespective of whether
    CET-SS is enabled.
    
    Unfortunately, the CET-SS changes in memguard_guard_stack() broke idempotency
    by first writing out the supervisor shadow stack tokens with plain writes,
    then changing the mapping to being read-only.
    
    This ordering is strictly necessary to configure the BSP, which cannot have
    the supervisor tokens be written with WRSS.
    
    Instead of calling memguard_guard_stack() unconditionally, call it only when
    actually allocating a new stack.  Xenheap allocates are guaranteed to be
    writeable, and the net result is idempotency WRT configuring stack_base[].
    
    Fixes: 91d26ed304f ("x86/shstk: Create shadow stacks")
    Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 04182d8b795dcdabf4f3873d3f5c78b67cbc04b0
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Oct 12 14:58:45 2020 +0100

    x86/ucode/intel: Improve description for gathering the microcode revision
    
    Obtaining the microcode revision on Intel CPUs is complicated for backwards
    compatibility reasons.  Update apply_microcode() to use a slightly more
    efficient CPUID invocation, now that the documentation has been updated to
    confirm that any CPUID instruction is fine, not just CPUID.1
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 6065a05adf152a556fb9f11a5218c89e41b62893
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Oct 12 13:24:31 2020 +0100

    x86/traps: 'Fix' safety of read_registers() in #DF path
    
    All interrupts and exceptions pass a struct cpu_user_regs up into C.  This
    contains the legacy vm86 fields from 32bit days, which are beyond the
    hardware-pushed frame.
    
    Accessing these fields is generally illegal, as they are logically out of
    bounds for anything other than an interrupt/exception hitting ring1/3 code.
    
    show_registers() unconditionally reads these fields, but the content is
    discarded before use.  This is benign right now, as all parts of the stack are
    readable, including the guard pages.
    
    However, read_registers() in the #DF handler writes to these fields as part of
    preparing the state dump, and being IST, hits the adjacent stack frame.
    
    This has been broken forever, but c/s 6001660473 "x86/shstk: Rework the stack
    layout to support shadow stacks" repositioned the #DF stack to be adjacent to
    the guard page, which turns this OoB write into a fatal pagefault:
    
      (XEN) *** DOUBLE FAULT ***
      (XEN) ----[ Xen-4.15-unstable  x86_64  debug=y   Tainted:  C   ]----
      (XEN) ----[ Xen-4.15-unstable  x86_64  debug=y   Tainted:  C   ]----
      (XEN) CPU:    4
      (XEN) RIP:    e008:[<ffff82d04031fd4f>] traps.c#read_registers+0x29/0xc1
      (XEN) RFLAGS: 0000000000050086   CONTEXT: hypervisor (d1v0)
      ...
      (XEN) Xen call trace:
      (XEN)    [<ffff82d04031fd4f>] R traps.c#read_registers+0x29/0xc1
      (XEN)    [<ffff82d0403207b3>] F do_double_fault+0x3d/0x7e
      (XEN)    [<ffff82d04039acd7>] F double_fault+0x107/0x110
      (XEN)
      (XEN) Pagetable walk from ffff830236f6d008:
      (XEN)  L4[0x106] = 80000000bfa9b063 ffffffffffffffff
      (XEN)  L3[0x008] = 0000000236ffd063 ffffffffffffffff
      (XEN)  L2[0x1b7] = 0000000236ffc063 ffffffffffffffff
      (XEN)  L1[0x16d] = 8000000236f6d161 ffffffffffffffff
      (XEN)
      (XEN) ****************************************
      (XEN) Panic on CPU 4:
      (XEN) FATAL PAGE FAULT
      (XEN) [error_code=0003]
      (XEN) Faulting linear address: ffff830236f6d008
      (XEN) ****************************************
      (XEN)
    
    and rendering the main #DF analysis broken.
    
    The proper fix is to delete cpu_user_regs.es and later, so no
    interrupt/exception path can access OoB, but this needs disentangling from the
    PV ABI first.
    
    Not-really-fixes: 6001660473 ("x86/shstk: Rework the stack layout to support shadow stacks")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

