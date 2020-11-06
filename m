Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C51132A9618
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 13:19:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20726.46733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb0hY-0008OJ-Jw; Fri, 06 Nov 2020 12:18:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20726.46733; Fri, 06 Nov 2020 12:18:44 +0000
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
	id 1kb0hY-0008Nu-Gm; Fri, 06 Nov 2020 12:18:44 +0000
Received: by outflank-mailman (input) for mailman id 20726;
 Fri, 06 Nov 2020 12:18:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pfqN=EM=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kb0hW-0008NM-G5
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 12:18:42 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0b9e5bc-4b64-4c8f-a261-b18fd0210ed0;
 Fri, 06 Nov 2020 12:18:35 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kb0hO-0001zs-W9; Fri, 06 Nov 2020 12:18:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kb0hO-0003sD-N5; Fri, 06 Nov 2020 12:18:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kb0hO-0004ir-Mb; Fri, 06 Nov 2020 12:18:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pfqN=EM=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kb0hW-0008NM-G5
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 12:18:42 +0000
X-Inumbo-ID: d0b9e5bc-4b64-4c8f-a261-b18fd0210ed0
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d0b9e5bc-4b64-4c8f-a261-b18fd0210ed0;
	Fri, 06 Nov 2020 12:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=QofY3N9C3RVicqPHDN09y/199t+HLZrkoqc2OK2bktE=; b=dbr0tw0bXyEHWXGxGoNmgIhFZX
	NKVMERL1J9CsKgl0TRPxqQmTH5vZuzVbcZGUsq/kW67/Com830MgAO989FMci7hoyr79JsQBEe19z
	bDWZ1MPZJqZ06IgTaEAWMf5GFBwxOfKzHbVpaLsq2mCZZIwnqpkvPU69DyyoykqtfFlE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kb0hO-0001zs-W9; Fri, 06 Nov 2020 12:18:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kb0hO-0003sD-N5; Fri, 06 Nov 2020 12:18:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kb0hO-0004ir-Mb; Fri, 06 Nov 2020 12:18:34 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156523-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 156523: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=2a5f9f6a6932214fda76b9b3c03e024772882d34
X-Osstest-Versions-That:
    xen=957708c2d1ae25d7375abd5e5e70c3043d64f1f1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 06 Nov 2020 12:18:34 +0000

flight 156523 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156523/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  2a5f9f6a6932214fda76b9b3c03e024772882d34
baseline version:
 xen                  957708c2d1ae25d7375abd5e5e70c3043d64f1f1

Last test of basis   156502  2020-11-06 03:01:22 Z    0 days
Testing same since   156523  2020-11-06 10:00:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Juergen Gross <jgross@suse.com>

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
   957708c2d1..2a5f9f6a69  2a5f9f6a6932214fda76b9b3c03e024772882d34 -> smoke

