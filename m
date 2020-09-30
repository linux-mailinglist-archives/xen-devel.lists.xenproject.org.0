Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E54A27E7B5
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 13:34:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603.2009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNaNX-0006vl-NT; Wed, 30 Sep 2020 11:34:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603.2009; Wed, 30 Sep 2020 11:34:35 +0000
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
	id 1kNaNX-0006vM-Ja; Wed, 30 Sep 2020 11:34:35 +0000
Received: by outflank-mailman (input) for mailman id 603;
 Wed, 30 Sep 2020 11:34:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZS8s=DH=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kNaNV-0006uZ-Ro
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 11:34:33 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34c19c03-300a-4613-9cdb-7ce7b14c1452;
 Wed, 30 Sep 2020 11:34:27 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kNaNP-0008L4-5P; Wed, 30 Sep 2020 11:34:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kNaNO-0007L1-U3; Wed, 30 Sep 2020 11:34:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kNaNO-0001St-Tc; Wed, 30 Sep 2020 11:34:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ZS8s=DH=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kNaNV-0006uZ-Ro
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 11:34:33 +0000
X-Inumbo-ID: 34c19c03-300a-4613-9cdb-7ce7b14c1452
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 34c19c03-300a-4613-9cdb-7ce7b14c1452;
	Wed, 30 Sep 2020 11:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=i+EHbSfumWBCBpmKpzJyAEhzaHB6LzbzbIrGGRK1y+M=; b=Qz+y04nEL7xJ+huX1AbSkmnp4Y
	QYNldnvRKqQBo0a5e/reHh2IRBcUDJrNvjC15H2TKsRMbTlxPXfgNAFdkO5r5XGvuRhXFkkqmzmcr
	1wpYLZAhLFrWn6cWWFF9UyxVy3rup6qs2HPeigyk8ALwWM+mkodJbv0+yMFizLFDNZ0c=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNaNP-0008L4-5P; Wed, 30 Sep 2020 11:34:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNaNO-0007L1-U3; Wed, 30 Sep 2020 11:34:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNaNO-0001St-Tc; Wed, 30 Sep 2020 11:34:26 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155128-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 155128: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=c73952831f0fc63a984e0d07dff1d20f8617b81f
X-Osstest-Versions-That:
    xen=5dba8c2f23049aa68b777a9e7e9f76c12dd00012
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 30 Sep 2020 11:34:26 +0000

flight 155128 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155128/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  c73952831f0fc63a984e0d07dff1d20f8617b81f
baseline version:
 xen                  5dba8c2f23049aa68b777a9e7e9f76c12dd00012

Last test of basis   155089  2020-09-29 13:00:29 Z    0 days
Testing same since   155128  2020-09-30 08:01:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Trammell Hudson <hudson@trmm.net>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     pass    


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


Pushing revision :

To xenbits.xen.org:/home/xen/git/xen.git
   5dba8c2f23..c73952831f  c73952831f0fc63a984e0d07dff1d20f8617b81f -> smoke

