Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6662AFD93
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 04:50:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25467.53232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd3cJ-0004lj-QQ; Thu, 12 Nov 2020 03:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25467.53232; Thu, 12 Nov 2020 03:49:47 +0000
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
	id 1kd3cJ-0004lR-L7; Thu, 12 Nov 2020 03:49:47 +0000
Received: by outflank-mailman (input) for mailman id 25467;
 Thu, 12 Nov 2020 03:49:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44Nj=ES=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kd3cH-0004fh-Gx
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 03:49:45 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8ce2302-b450-46cc-b9e8-2f99f6070a48;
 Thu, 12 Nov 2020 03:49:38 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kd3cA-0002H4-F4; Thu, 12 Nov 2020 03:49:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kd3cA-00067y-2z; Thu, 12 Nov 2020 03:49:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kd3cA-0001PA-2W; Thu, 12 Nov 2020 03:49:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=44Nj=ES=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kd3cH-0004fh-Gx
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 03:49:45 +0000
X-Inumbo-ID: d8ce2302-b450-46cc-b9e8-2f99f6070a48
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d8ce2302-b450-46cc-b9e8-2f99f6070a48;
	Thu, 12 Nov 2020 03:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=dxLvxyA8wHPXkrb8V5v4vCxpSMnPxNl54JS6rgdz4o0=; b=lMda1o6MLXypVxDQQ0siWyVBtc
	5CYWSMzzAxc3INLYduKU8dLAG7JHsSh4ywLqpn/8iMfcQ/3vlfodEs42nl7lu+olCXMzX02/yvfLX
	wM80qm/72LDsCmkzBRssD6bnN2wMlyZhq2dsdHdAZfGpXT7Kg3TmuCOybK1zIFNTeMEY=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kd3cA-0002H4-F4; Thu, 12 Nov 2020 03:49:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kd3cA-00067y-2z; Thu, 12 Nov 2020 03:49:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kd3cA-0001PA-2W; Thu, 12 Nov 2020 03:49:38 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156689-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 156689: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=5505f5f8e7e805365cfe70b6a4af6115940bb749
X-Osstest-Versions-That:
    xen=69634224afaf84474f04e1ab050f216d66bcda68
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 12 Nov 2020 03:49:38 +0000

flight 156689 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156689/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  5505f5f8e7e805365cfe70b6a4af6115940bb749
baseline version:
 xen                  69634224afaf84474f04e1ab050f216d66bcda68

Last test of basis   156679  2020-11-11 08:00:30 Z    0 days
Testing same since   156689  2020-11-11 22:01:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Julien Grall <jgrall@amazon.com>
  Penny Zheng <penny.zheng@arm.com>
  Stefano Stabellini <sstabellini@kernel.org>

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
   69634224af..5505f5f8e7  5505f5f8e7e805365cfe70b6a4af6115940bb749 -> smoke

