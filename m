Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF182AD2E1
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 10:54:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23150.49724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcQLB-0007Cz-5W; Tue, 10 Nov 2020 09:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23150.49724; Tue, 10 Nov 2020 09:53:29 +0000
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
	id 1kcQLB-0007Ca-2T; Tue, 10 Nov 2020 09:53:29 +0000
Received: by outflank-mailman (input) for mailman id 23150;
 Tue, 10 Nov 2020 09:53:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pxmX=EQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kcQLA-0007CV-Bv
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 09:53:28 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7271080d-aca9-4905-a532-2d23383e0a6c;
 Tue, 10 Nov 2020 09:53:24 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kcQL6-0004LI-FY; Tue, 10 Nov 2020 09:53:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kcQL6-00088A-4q; Tue, 10 Nov 2020 09:53:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kcQL6-0001yg-4N; Tue, 10 Nov 2020 09:53:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pxmX=EQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kcQLA-0007CV-Bv
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 09:53:28 +0000
X-Inumbo-ID: 7271080d-aca9-4905-a532-2d23383e0a6c
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7271080d-aca9-4905-a532-2d23383e0a6c;
	Tue, 10 Nov 2020 09:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=do39fy9ZKrWFC90uIWh8uTlCZl2PJFqwObbqRGZDNng=; b=eAQpnAsUw3/jEj/EjnfKx++IIK
	m5oJdLXtlKyRGwIxw9djV7yizL4sHhah+jDnPhYUujl5Aah4nglO6XEftoc0Z2b/DrlndF/YPycoi
	euptiEBQ/pH11MYfTel1SVYjNP/I9xaZoLqDw54B0j7BL12Xv9ue3EWpzUXFtcWb0PEg=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcQL6-0004LI-FY; Tue, 10 Nov 2020 09:53:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcQL6-00088A-4q; Tue, 10 Nov 2020 09:53:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcQL6-0001yg-4N; Tue, 10 Nov 2020 09:53:24 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156594-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.14-testing test] 156594: regressions - FAIL
X-Osstest-Failures:
    xen-4.14-testing:test-armhf-armhf-xl-multivcpu:debian-fixup:fail:regression
    xen-4.14-testing:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    xen-4.14-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.14-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=a38060ece699f22cd317219bec53c0d27279155b
X-Osstest-Versions-That:
    xen=0c96e4297da07944525729ddbe438b0131ab5b7e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 10 Nov 2020 09:53:24 +0000

flight 156594 xen-4.14-testing real [real]
flight 156615 xen-4.14-testing real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/156594/
http://logs.test-lab.xenproject.org/osstest/logs/156615/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-multivcpu 13 debian-fixup            fail REGR. vs. 156525
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 156525

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 156525
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 156525
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 156525
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 156525
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 156525
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 156525
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 156525
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 156525
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 156525
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 156525
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 156525
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  a38060ece699f22cd317219bec53c0d27279155b
baseline version:
 xen                  0c96e4297da07944525729ddbe438b0131ab5b7e

Last test of basis   156525  2020-11-06 16:01:25 Z    3 days
Testing same since   156594  2020-11-09 18:08:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bertrand Marquis <bertrand.marquis@arm.com>
  David Woodhouse <dwmw@amazon.co.uk>
  Juergen Gross <jgross@suse.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Olaf Hering <olaf@aepfle.de>
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
 test-armhf-armhf-xl-multivcpu                                fail    
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
commit a38060ece699f22cd317219bec53c0d27279155b
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
    (cherry picked from commit 40fe714ca4245a9716264fcb3ee8df42c3650cf6)

commit 78a53f0ee04bfd14dc21dabd3a0d79343c3b642f
Author: Bertrand Marquis <bertrand.marquis@arm.com>
Date:   Wed Oct 7 14:57:02 2020 +0100

    tool/libs/light: Fix libxenlight gcc warning
    
    Fix gcc10 compilation warning about uninitialized variable by setting
    it to 0.
    
    Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Wei Liu <wl@xen.org>
    (cherry picked from commit 0241809bf838875615797f52af34222e5ab8e98f)

commit 89ae1b185a193fea8e86840c48a2711f04042415
Author: Olaf Hering <olaf@aepfle.de>
Date:   Wed Sep 23 08:48:40 2020 +0200

    tools/libxc: report malloc errors in writev_exact
    
    The caller of writev_exact should be notified about malloc errors
    when dealing with partial writes.
    
    Signed-off-by: Olaf Hering <olaf@aepfle.de>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Wei Liu <wl@xen.org>
    (cherry picked from commit 0d8d289af7a679c028462c4ed5d98586f9ef9648)

commit 7398a44e8636c99f6b06fb16d05a64ee06980d10
Author: Juergen Gross <jgross@suse.com>
Date:   Sat Sep 12 15:08:36 2020 +0200

    tools/libs/stat: fix broken build
    
    Making getBridge() static triggered a build error with some gcc versions:
    
    error: 'strncpy' output may be truncated copying 15 bytes from a string of
    length 255 [-Werror=stringop-truncation]
    
    Fix that by using a buffer with 256 bytes instead.
    
    Fixes: 6d0ec053907794 ("tools: split libxenstat into new tools/libs/stat directory")
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Wei Liu <wl@xen.org>
    (cherry picked from commit c8099e48c3dbb8c7399551a265756ecf354eece2)

commit 59b83663f925092f60f699147390c6cb77b55e43
Author: David Woodhouse <dwmw@amazon.co.uk>
Date:   Thu Mar 19 20:40:24 2020 +0000

    tools/xenstore: Do not abort xenstore-ls if a node disappears while iterating
    
    The do_ls() function has somewhat inconsistent handling of errors.
    
    If reading the node's contents with xs_read() fails, then do_ls() will
    just quietly not display the contents.
    
    If reading the node's permissions with xs_get_permissions() fails, then
    do_ls() will print a warning, continue, and ultimately won't exit with
    an error code (unless another error happens).
    
    If recursing into the node with xs_directory() fails, then do_ls() will
    abort immediately, not printing any further nodes.
    
    For persistent failure modes — such as ENOENT because a node has been
    removed, or EACCES because it has had its permisions changed since the
    xs_directory() on the parent directory returned its name — it's
    obviously quite likely that if either of the first two errors occur for
    a given node, then so will the third and thus xenstore-ls will abort.
    
    The ENOENT one is actually a fairly common case, and has caused tools to
    fail to clean up a network device because it *apparently* already
    doesn't exist in xenstore.
    
    There is a school of thought that says, "Well, xenstore-ls returned an
    error. So the tools should not trust its output."
    
    The natural corollary of this would surely be that the tools must re-run
    xenstore-ls as many times as is necessary until its manages to exit
    without hitting the race condition. I am not keen on that conclusion.
    
    For the specific case of ENOENT it seems reasonable to declare that,
    but for the timing, we might as well just not have seen that node at
    all when calling xs_directory() for the parent. By ignoring the error,
    we give acceptable output.
    
    The issue can be reproduced as follows:
    
    (dom0) # for a in `seq 1 1000` ; do
                  xenstore-write /local/domain/2/foo/$a $a ;
             done
    
    Now simultaneously:
    
    (dom0) # for a in `seq 1 999` ; do
                  xenstore-rm /local/domain/2/foo/$a ;
             done
    (dom2) # while true ; do
                  ./xenstore-ls -p /local/domain/2/foo | grep -c 1000 ;
             done
    
    We should expect to see node 1000 in the output, every time.
    
    Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
    Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
    (cherry picked from commit beb105af19cc3e58e2ed49224cfe190a736e5fa0)

commit 1f9f1cb3a0216a7d41ded3090b4bb2735cc8a8e6
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
    (cherry picked from commit 0dfddb2116e3757f77a691a3fe335173088d69dc)

commit f728b2d69f426258f37709de9efac5245a597d0d
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Wed Aug 19 04:00:36 2020 +0200

    libxl: fix -Werror=stringop-truncation in libxl__prepare_sockaddr_un
    
    In file included from /usr/include/string.h:495,
                     from libxl_internal.h:38,
                     from libxl_utils.c:20:
    In function 'strncpy',
        inlined from 'libxl__prepare_sockaddr_un' at libxl_utils.c:1262:5:
    /usr/include/bits/string_fortified.h:106:10: error: '__builtin_strncpy' specified bound 108 equals destination size [-Werror=stringop-truncation]
      106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest));
          |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    cc1: all warnings being treated as errors
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
    (cherry picked from commit fff1b7f50e75ad9535c86f3fcf425b4945c50a1c)

commit 71a12a97988c516a17aba40bb5df9274133e9e92
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Wed Aug 19 04:00:35 2020 +0200

    libxl: workaround gcc 10.2 maybe-uninitialized warning
    
    It seems xlu_pci_parse_bdf has a state machine that is too complex for
    gcc to understand. The build fails with:
    
        libxlu_pci.c: In function 'xlu_pci_parse_bdf':
        libxlu_pci.c:32:18: error: 'func' may be used uninitialized in this function [-Werror=maybe-uninitialized]
           32 |     pcidev->func = func;
              |     ~~~~~~~~~~~~~^~~~~~
        libxlu_pci.c:51:29: note: 'func' was declared here
           51 |     unsigned dom, bus, dev, func, vslot = 0;
              |                             ^~~~
        libxlu_pci.c:31:17: error: 'dev' may be used uninitialized in this function [-Werror=maybe-uninitialized]
           31 |     pcidev->dev = dev;
              |     ~~~~~~~~~~~~^~~~~
        libxlu_pci.c:51:24: note: 'dev' was declared here
           51 |     unsigned dom, bus, dev, func, vslot = 0;
              |                        ^~~
        libxlu_pci.c:30:17: error: 'bus' may be used uninitialized in this function [-Werror=maybe-uninitialized]
           30 |     pcidev->bus = bus;
              |     ~~~~~~~~~~~~^~~~~
        libxlu_pci.c:51:19: note: 'bus' was declared here
           51 |     unsigned dom, bus, dev, func, vslot = 0;
              |                   ^~~
        libxlu_pci.c:29:20: error: 'dom' may be used uninitialized in this function [-Werror=maybe-uninitialized]
           29 |     pcidev->domain = domain;
              |     ~~~~~~~~~~~~~~~^~~~~~~~
        libxlu_pci.c:51:14: note: 'dom' was declared here
           51 |     unsigned dom, bus, dev, func, vslot = 0;
              |              ^~~
        cc1: all warnings being treated as errors
    
    Workaround it by setting the initial value to invalid value (0xffffffff)
    and then assert on each value being set. This way we mute the gcc
    warning, while still detecting bugs in the parse code.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
    (cherry picked from commit d25cc3ec93ebda030349045d2c7fa14ffde07ed7)
(qemu changes not included)

