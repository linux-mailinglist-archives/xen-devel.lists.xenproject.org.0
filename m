Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B0129582D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 07:59:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10181.26960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVTc2-0004Un-M8; Thu, 22 Oct 2020 05:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10181.26960; Thu, 22 Oct 2020 05:58:10 +0000
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
	id 1kVTc2-0004UO-Ih; Thu, 22 Oct 2020 05:58:10 +0000
Received: by outflank-mailman (input) for mailman id 10181;
 Thu, 22 Oct 2020 05:58:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A75Z=D5=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kVTc1-0004UJ-F0
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 05:58:09 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67bd16c3-30e9-4133-94d1-5b37df8598fe;
 Thu, 22 Oct 2020 05:58:05 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kVTbx-0007U9-By; Thu, 22 Oct 2020 05:58:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kVTbx-0002mZ-2S; Thu, 22 Oct 2020 05:58:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kVTbx-0003I1-1w; Thu, 22 Oct 2020 05:58:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A75Z=D5=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kVTc1-0004UJ-F0
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 05:58:09 +0000
X-Inumbo-ID: 67bd16c3-30e9-4133-94d1-5b37df8598fe
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 67bd16c3-30e9-4133-94d1-5b37df8598fe;
	Thu, 22 Oct 2020 05:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=a5o/HXtYbP/87yFopW7lKYRgLgB2lhJKumZ4PEewvfE=; b=d/q85zolXsOU6bxK5tjvj+3Os/
	65mjvGAl2+2bc3FaAU+qFi3dQCIbena6o4o9H5tEueQfdvx/HkDIpTLZ4Nl7zxSlDpo8SeFTdkA79
	kX/3aabSby200GcmA1dCaDqCAIzN+05T5dfTGXKsGCW4T0LCYOBDPUwAI8gKa/zOppg4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kVTbx-0007U9-By; Thu, 22 Oct 2020 05:58:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kVTbx-0002mZ-2S; Thu, 22 Oct 2020 05:58:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kVTbx-0003I1-1w; Thu, 22 Oct 2020 05:58:05 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156050-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 156050: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
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
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=0514a3a25fb9ebff5d75cc8f00a9229385300858
X-Osstest-Versions-That:
    xen=0dfddb2116e3757f77a691a3fe335173088d69dc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 22 Oct 2020 05:58:05 +0000

flight 156050 xen-unstable real [real]
flight 156084 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/156050/
http://logs.test-lab.xenproject.org/osstest/logs/156084/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 156013

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 156013
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 156013
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 156013
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 156013
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 156013
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 156013
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 156013
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 156013
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 156013
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 156013
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 156013
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  0514a3a25fb9ebff5d75cc8f00a9229385300858
baseline version:
 xen                  0dfddb2116e3757f77a691a3fe335173088d69dc

Last test of basis   156013  2020-10-20 04:30:46 Z    2 days
Failing since        156027  2020-10-20 12:37:35 Z    1 days    2 attempts
Testing same since   156050  2020-10-20 22:07:36 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  George Dunlap <george.dunlap@citrix.com>
  Hongyan Xia <hongyxia@amazon.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Wei Liu <wei.liu2@citrix.com>
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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
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
commit 0514a3a25fb9ebff5d75cc8f00a9229385300858
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Oct 20 14:23:12 2020 +0200

    AMD/IOMMU: ensure suitable ordering of DTE modifications
    
    DMA and interrupt translation should be enabled only after other
    applicable DTE fields have been written. Similarly when disabling
    translation or when moving a device between domains, translation should
    first be disabled, before other entry fields get modified. Note however
    that the "moving" aspect doesn't apply to the interrupt remapping side,
    as domain specifics are maintained in the IRTEs here, not the DTE. We
    also never disable interrupt remapping once it got enabled for a device
    (the respective argument passed is always the immutable iommu_intremap).
    
    This is part of XSA-347.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Paul Durrant <paul@xen.org>

commit 3b055121c5410e2c3105d6d06aa24ca0d58868cd
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Oct 20 14:22:52 2020 +0200

    AMD/IOMMU: update live PTEs atomically
    
    Updating a live PTE bitfield by bitfield risks the compiler re-ordering
    the individual updates as well as splitting individual updates into
    multiple memory writes. Construct the new entry fully in a local
    variable, do the check to determine the flushing needs on the thus
    established new entry, and then write the new entry by a single insn.
    
    Similarly using memset() to clear a PTE is unsafe, as the order of
    writes the function does is, at least in principle, undefined.
    
    This is part of XSA-347.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Paul Durrant <paul@xen.org>

commit 73f62c7380edf07469581a3049aba98abd63b275
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Oct 20 14:22:26 2020 +0200

    AMD/IOMMU: convert amd_iommu_pte from struct to union
    
    This is to add a "raw" counterpart to the bitfield equivalent. Take the
    opportunity and
     - convert fields to bool / unsigned int,
     - drop the naming of the reserved field,
     - shorten the names of the ignored ones.
    
    This is part of XSA-347.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Paul Durrant <paul@xen.org>

commit 5777a3742d88ff1c0ebc626ceb4fd47f9b3dc6d5
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Oct 20 14:21:32 2020 +0200

    IOMMU: hold page ref until after deferred TLB flush
    
    When moving around a page via XENMAPSPACE_gmfn_range, deferring the TLB
    flush for the "from" GFN range requires that the page remains allocated
    to the guest until the TLB flush has actually occurred. Otherwise a
    parallel hypercall to remove the page would only flush the TLB for the
    GFN it has been moved to, but not the one is was mapped at originally.
    
    This is part of XSA-346.
    
    Fixes: cf95b2a9fd5a ("iommu: Introduce per cpu flag (iommu_dont_flush_iotlb) to avoid unnecessary iotlb... ")
    Reported-by: Julien Grall <jgrall@amazon.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit dea460d86957bf1425a8a1572626099ac3f165a8
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Oct 20 14:21:09 2020 +0200

    IOMMU: suppress "iommu_dont_flush_iotlb" when about to free a page
    
    Deferring flushes to a single, wide range one - as is done when
    handling XENMAPSPACE_gmfn_range - is okay only as long as
    pages don't get freed ahead of the eventual flush. While the only
    function setting the flag (xenmem_add_to_physmap()) suggests by its name
    that it's only mapping new entries, in reality the way
    xenmem_add_to_physmap_one() works means an unmap would happen not only
    for the page being moved (but not freed) but, if the destination GFN is
    populated, also for the page being displaced from that GFN. Collapsing
    the two flushes for this GFN into just one (end even more so deferring
    it to a batched invocation) is not correct.
    
    This is part of XSA-346.
    
    Fixes: cf95b2a9fd5a ("iommu: Introduce per cpu flag (iommu_dont_flush_iotlb) to avoid unnecessary iotlb... ")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Paul Durrant <paul@xen.org>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 1ce75e99d75907aaffae05fcf658a833802bce49
Author: Hongyan Xia <hongyxia@amazon.com>
Date:   Sat Jan 11 21:57:43 2020 +0000

    x86/mm: Prevent some races in hypervisor mapping updates
    
    map_pages_to_xen will attempt to coalesce mappings into 2MiB and 1GiB
    superpages if possible, to maximize TLB efficiency.  This means both
    replacing superpage entries with smaller entries, and replacing
    smaller entries with superpages.
    
    Unfortunately, while some potential races are handled correctly,
    others are not.  These include:
    
    1. When one processor modifies a sub-superpage mapping while another
    processor replaces the entire range with a superpage.
    
    Take the following example:
    
    Suppose L3[N] points to L2.  And suppose we have two processors, A and
    B.
    
    * A walks the pagetables, get a pointer to L2.
    * B replaces L3[N] with a 1GiB mapping.
    * B Frees L2
    * A writes L2[M] #
    
    This is race exacerbated by the fact that virt_to_xen_l[21]e doesn't
    handle higher-level superpages properly: If you call virt_xen_to_l2e
    on a virtual address within an L3 superpage, you'll either hit a BUG()
    (most likely), or get a pointer into the middle of a data page; same
    with virt_xen_to_l1 on a virtual address within either an L3 or L2
    superpage.
    
    So take the following example:
    
    * A reads pl3e and discovers it to point to an L2.
    * B replaces L3[N] with a 1GiB mapping
    * A calls virt_to_xen_l2e() and hits the BUG_ON() #
    
    2. When two processors simultaneously try to replace a sub-superpage
    mapping with a superpage mapping.
    
    Take the following example:
    
    Suppose L3[N] points to L2.  And suppose we have two processors, A and B,
    both trying to replace L3[N] with a superpage.
    
    * A walks the pagetables, get a pointer to pl3e, and takes a copy ol3e pointing to L2.
    * B walks the pagetables, gets a pointre to pl3e, and takes a copy ol3e pointing to L2.
    * A writes the new value into L3[N]
    * B writes the new value into L3[N]
    * A recursively frees all the L1's under L2, then frees L2
    * B recursively double-frees all the L1's under L2, then double-frees L2 #
    
    Fix this by grabbing a lock for the entirety of the mapping update
    operation.
    
    Rather than grabbing map_pgdir_lock for the entire operation, however,
    repurpose the PGT_locked bit from L3's page->type_info as a lock.
    This means that rather than locking the entire address space, we
    "only" lock a single 512GiB chunk of hypervisor address space at a
    time.
    
    There was a proposal for a lock-and-reverify approach, where we walk
    the pagetables to the point where we decide what to do; then grab the
    map_pgdir_lock, re-verify the information we collected without the
    lock, and finally make the change (starting over again if anything had
    changed).  Without being able to guarantee that the L2 table wasn't
    freed, however, that means every read would need to be considered
    potentially unsafe.  Thinking carefully about that is probably
    something that wants to be done on public, not under time pressure.
    
    This is part of XSA-345.
    
    Reported-by: Hongyan Xia <hongyxia@amazon.com>
    Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
    Signed-off-by: George Dunlap <george.dunlap@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit b733f8a8b8db83f2d438cab3adb38b387cecfce0
Author: Wei Liu <wei.liu2@citrix.com>
Date:   Sat Jan 11 21:57:42 2020 +0000

    x86/mm: Refactor modify_xen_mappings to have one exit path
    
    We will soon need to perform clean-ups before returning.
    
    No functional change.
    
    This is part of XSA-345.
    
    Reported-by: Hongyan Xia <hongyxia@amazon.com>
    Signed-off-by: Wei Liu <wei.liu2@citrix.com>
    Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
    Signed-off-by: George Dunlap <george.dunlap@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 08e6c6f80b018878476adc2c4e5679d2ce5cb4b1
Author: Wei Liu <wei.liu2@citrix.com>
Date:   Sat Jan 11 21:57:41 2020 +0000

    x86/mm: Refactor map_pages_to_xen to have only a single exit path
    
    We will soon need to perform clean-ups before returning.
    
    No functional change.
    
    This is part of XSA-345.
    
    Reported-by: Hongyan Xia <hongyxia@amazon.com>
    Signed-off-by: Wei Liu <wei.liu2@citrix.com>
    Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
    Signed-off-by: George Dunlap <george.dunlap@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit a7f0831e58bf4681d710e9a029644b6fa07b7cb0
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Oct 20 08:54:59 2020 +0200

    SVM: avoid VMSAVE in ctxt-switch-to
    
    Of the state saved by the insn and reloaded by the corresponding VMLOAD
    - TR and syscall state are invariant while having Xen's state loaded,
    - sysenter is unused altogether by Xen,
    - FS, GS, and LDTR are not used by Xen and get suitably set in PV
      context switch code.
    Note that state is suitably populated in _svm_cpu_up(); a minimal
    respective assertion gets added.
    
    Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit de6d188a519f9e3b7a1acc7784adf4c243865f9a
Author: Igor Druzhinin <igor.druzhinin@citrix.com>
Date:   Tue Oct 20 08:54:23 2020 +0200

    hvmloader: flip "ACPI data" to "ACPI NVS" type for ACPI table region
    
    ACPI specification contains statements describing memory marked with regular
    "ACPI data" type as reclaimable by the guest. Although the guest shouldn't
    really do it if it wants kexec or similar functionality to work, there
    could still be ambiguities in treating these regions as potentially regular
    RAM.
    
    One such example is SeaBIOS which currently reports "ACPI data" regions as
    RAM to the guest in its e801 call. Which it might have the right to do as any
    user of this is expected to be ACPI unaware. But a QEMU bootloader later seems
    to ignore that fact and is instead using e801 to find a place for initrd which
    causes the tables to be erased. While arguably QEMU bootloader or SeaBIOS need
    to be fixed / improved here, that is just one example of the potential problems
    from using a reclaimable memory type.
    
    Flip the type to "ACPI NVS" which doesn't have this ambiguity in it and is
    described by the spec as non-reclaimable (so cannot ever be treated like RAM).
    
    Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 7b36d16d21ae70a1eaabe577b7e4b42ed0f1a7d1
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Oct 20 08:53:53 2020 +0200

    xen-detect: make CPUID fallback CPUID-faulting aware
    
    Relying on presence / absence of hypervisor leaves in raw / escaped
    CPUID output cannot be used to tell apart PV and HVM on CPUID faulting
    capable hardware. Utilize a PV-only feature flag to avoid false positive
    HVM detection.
    
    While at it also short circuit the main detection loop: For PV, only
    the base group of leaves can possibly hold hypervisor information.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 25467bb5d121735af4969834a62bca752a7bfe10
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Oct 20 08:52:53 2020 +0200

    EFI: free unused boot mem in at least some cases
    
    Address at least the primary reason why 52bba67f8b87 ("efi/boot: Don't
    free ebmalloc area at all") was put in place: Make xen_in_range() aware
    of the freed range. This is in particular relevant for EFI-enabled
    builds not actually running on EFI, as the entire range will be unused
    in this case.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>
(qemu changes not included)

