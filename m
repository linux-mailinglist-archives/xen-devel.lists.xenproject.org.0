Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E642128ED32
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 08:50:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7104.18615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSx5U-000199-2k; Thu, 15 Oct 2020 06:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7104.18615; Thu, 15 Oct 2020 06:50:08 +0000
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
	id 1kSx5T-00018k-VD; Thu, 15 Oct 2020 06:50:07 +0000
Received: by outflank-mailman (input) for mailman id 7104;
 Thu, 15 Oct 2020 06:50:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHSr=DW=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kSx5S-00018f-WB
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 06:50:07 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2c9666c-9ec0-424b-82f2-7b206ba495b4;
 Thu, 15 Oct 2020 06:50:04 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kSx5Q-0004NK-5N; Thu, 15 Oct 2020 06:50:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kSx5P-0007PQ-UZ; Thu, 15 Oct 2020 06:50:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kSx5P-0007zs-U3; Thu, 15 Oct 2020 06:50:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pHSr=DW=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kSx5S-00018f-WB
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 06:50:07 +0000
X-Inumbo-ID: b2c9666c-9ec0-424b-82f2-7b206ba495b4
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b2c9666c-9ec0-424b-82f2-7b206ba495b4;
	Thu, 15 Oct 2020 06:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=P5NQsLVuaArhw+HQ8iKfZuLQs26Kp6ixwNRImvyxkQw=; b=QwRK+MKV7qi7F0gO5JluhvNWPO
	2jgcog7uTuvOO7qElWcRyepcgYazbKa9oKitlFK0eND/RHW4RCH1877vtjwO626ymUzmwB/Zrx42e
	dvE5afcjnPuc+yoZwibkZxVtcVlpG7n75R1pw37qxaLM3FPnZgLXXNEsBTLDiPY7Sq8c=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kSx5Q-0004NK-5N; Thu, 15 Oct 2020 06:50:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kSx5P-0007PQ-UZ; Thu, 15 Oct 2020 06:50:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kSx5P-0007zs-U3; Thu, 15 Oct 2020 06:50:03 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155828-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 155828: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=f776e5fb3ee699745f6442ec8c47d0fa647e0575
X-Osstest-Versions-That:
    xen=884ef07f4f66b9d12fc4811047db95ba649db85c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 15 Oct 2020 06:50:03 +0000

flight 155828 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155828/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  f776e5fb3ee699745f6442ec8c47d0fa647e0575
baseline version:
 xen                  884ef07f4f66b9d12fc4811047db95ba649db85c

Last test of basis   155805  2020-10-14 13:00:28 Z    0 days
Testing same since   155811  2020-10-14 18:03:04 Z    0 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michal Orzel <michal.orzel@arm.com>

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
   884ef07f4f..f776e5fb3e  f776e5fb3ee699745f6442ec8c47d0fa647e0575 -> smoke

