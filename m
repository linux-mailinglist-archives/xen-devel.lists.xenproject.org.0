Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 381852879B7
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 18:09:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4518.11819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQYSu-0006Jo-2L; Thu, 08 Oct 2020 16:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4518.11819; Thu, 08 Oct 2020 16:08:24 +0000
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
	id 1kQYSt-0006JP-VH; Thu, 08 Oct 2020 16:08:23 +0000
Received: by outflank-mailman (input) for mailman id 4518;
 Thu, 08 Oct 2020 16:08:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MKTU=DP=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kQYSs-0006JK-Fy
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 16:08:22 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95c9804f-915b-4d91-a85f-dc93422bc1fd;
 Thu, 08 Oct 2020 16:08:20 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kQYSq-0000RA-DY; Thu, 08 Oct 2020 16:08:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kQYSq-0001Bj-3f; Thu, 08 Oct 2020 16:08:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kQYSq-0001vB-39; Thu, 08 Oct 2020 16:08:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MKTU=DP=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kQYSs-0006JK-Fy
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 16:08:22 +0000
X-Inumbo-ID: 95c9804f-915b-4d91-a85f-dc93422bc1fd
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 95c9804f-915b-4d91-a85f-dc93422bc1fd;
	Thu, 08 Oct 2020 16:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=eKevr3XPbcAJqjKR7j+3cx6joG4t1vZsoURDsfk+8bY=; b=OezmghDf4oDL/x/li6GUOAY5O0
	0ZEjtW/sJZjwWjk67K2ZsqWwdHl2tDmVcT1y6gGu2aPIfUWQJQbeI/ykUSiO3Y4BwnW9eRDslJ/ld
	8xq26rcvpA8yt1lDP+WPGB1DnmUZ5i4bzGYvJQGvVWCCMY4on/5RrvFlJ7TYUkQD36I8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQYSq-0000RA-DY; Thu, 08 Oct 2020 16:08:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQYSq-0001Bj-3f; Thu, 08 Oct 2020 16:08:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQYSq-0001vB-39; Thu, 08 Oct 2020 16:08:20 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155547-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 155547: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=0241809bf838875615797f52af34222e5ab8e98f
X-Osstest-Versions-That:
    xen=7a519f8bda6f3505a4c1fbf277f002aa0c12ab9a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 08 Oct 2020 16:08:20 +0000

flight 155547 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155547/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  0241809bf838875615797f52af34222e5ab8e98f
baseline version:
 xen                  7a519f8bda6f3505a4c1fbf277f002aa0c12ab9a

Last test of basis   155521  2020-10-07 16:00:31 Z    1 days
Testing same since   155547  2020-10-08 13:01:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bertrand Marquis <bertrand.marquis@arm.com>
  Christian Lindig <christian.lindig@citrix.com>
  Edwin Török <edvin.torok@citrix.com>
  Juergen Gross <jgross@suse.com>
  Wei Liu <wl@xen.org>

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
   7a519f8bda..0241809bf8  0241809bf838875615797f52af34222e5ab8e98f -> smoke

