Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4DE29CB97
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 22:55:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13110.33692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXWvl-0005D8-HW; Tue, 27 Oct 2020 21:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13110.33692; Tue, 27 Oct 2020 21:55:01 +0000
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
	id 1kXWvl-0005Cj-E0; Tue, 27 Oct 2020 21:55:01 +0000
Received: by outflank-mailman (input) for mailman id 13110;
 Tue, 27 Oct 2020 21:54:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WJOX=EC=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kXWvj-0005Cc-Nd
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 21:54:59 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 088a8202-fd07-413f-9447-7ce9f517a46e;
 Tue, 27 Oct 2020 21:54:57 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kXWvg-0001uL-SR; Tue, 27 Oct 2020 21:54:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kXWvg-0002r9-L1; Tue, 27 Oct 2020 21:54:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kXWvg-0007UT-KX; Tue, 27 Oct 2020 21:54:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WJOX=EC=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kXWvj-0005Cc-Nd
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 21:54:59 +0000
X-Inumbo-ID: 088a8202-fd07-413f-9447-7ce9f517a46e
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 088a8202-fd07-413f-9447-7ce9f517a46e;
	Tue, 27 Oct 2020 21:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=lQyI3TvkIEJE9pDOox74WtGFh8q5uBHW7TID/wEMyB4=; b=EP5Tpx/ImY5lyT8iH7u48sKkWh
	kcRn7jhuG6L0L1iJbTTI1IAR4+xHtLxSahL92XB2x6BhhfPl31jrhThhkGB7YiLfW22OJhn2z/exM
	iYNq40jZucNnCt0edCjy5rmIQUB67qRaDcFh/ObrgnkpsNdE5a5WJTBkFLU+qGMlEBQo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kXWvg-0001uL-SR; Tue, 27 Oct 2020 21:54:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kXWvg-0002r9-L1; Tue, 27 Oct 2020 21:54:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kXWvg-0007UT-KX; Tue, 27 Oct 2020 21:54:56 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156260-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 156260: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=16a20963b3209788f2c0d3a3eebb7d92f03f5883
X-Osstest-Versions-That:
    xen=964781c6f162893677c50a779b7d562a299727ba
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 27 Oct 2020 21:54:56 +0000

flight 156260 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156260/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  16a20963b3209788f2c0d3a3eebb7d92f03f5883
baseline version:
 xen                  964781c6f162893677c50a779b7d562a299727ba

Last test of basis   156245  2020-10-26 16:01:22 Z    1 days
Testing same since   156260  2020-10-27 18:01:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

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
   964781c6f1..16a20963b3  16a20963b3209788f2c0d3a3eebb7d92f03f5883 -> smoke

