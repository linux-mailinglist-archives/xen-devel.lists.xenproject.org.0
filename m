Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6DB289AA7
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 23:33:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5220.13643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kR00A-00029e-0b; Fri, 09 Oct 2020 21:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5220.13643; Fri, 09 Oct 2020 21:32:33 +0000
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
	id 1kR009-00029F-TG; Fri, 09 Oct 2020 21:32:33 +0000
Received: by outflank-mailman (input) for mailman id 5220;
 Fri, 09 Oct 2020 21:32:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNj9=DQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kR008-00029A-VA
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 21:32:32 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a3a0136-83fd-4827-9a2e-82c3571ccd32;
 Fri, 09 Oct 2020 21:32:30 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kR006-00074c-EJ; Fri, 09 Oct 2020 21:32:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kR006-00047s-4H; Fri, 09 Oct 2020 21:32:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kR006-0001a9-3q; Fri, 09 Oct 2020 21:32:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VNj9=DQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kR008-00029A-VA
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 21:32:32 +0000
X-Inumbo-ID: 5a3a0136-83fd-4827-9a2e-82c3571ccd32
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5a3a0136-83fd-4827-9a2e-82c3571ccd32;
	Fri, 09 Oct 2020 21:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=NyTuRXjDfm7TCuqhsiTQ17bVnMWKWbbjI9YSBB17sww=; b=Se6O5xZXf+tUufYgZqTJpeIRdI
	yuV8WevKx4hhN6qI6iFQjKlFwaHzbtJKIGH9YTwoJjde60sbV4yyJcLHtJZGfp/9YSOl+ReHnqDgD
	UKeu4X+1cTdxP8DrI5LrKqdKITymq4SONO0mny3sg4V111T4162A5ZqvYm8/dGDajzHk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kR006-00074c-EJ; Fri, 09 Oct 2020 21:32:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kR006-00047s-4H; Fri, 09 Oct 2020 21:32:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kR006-0001a9-3q; Fri, 09 Oct 2020 21:32:30 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155594-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 155594: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=091ab12b340a05c99ce0e31d29293ce58c7014e2
X-Osstest-Versions-That:
    ovmf=69e95b9efed520e643b9e5b0573180aa7c5ecaca
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 09 Oct 2020 21:32:30 +0000

flight 155594 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155594/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 091ab12b340a05c99ce0e31d29293ce58c7014e2
baseline version:
 ovmf                 69e95b9efed520e643b9e5b0573180aa7c5ecaca

Last test of basis   155548  2020-10-08 13:39:54 Z    1 days
Testing same since   155594  2020-10-09 09:11:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Maciej Rabeda <maciej.rabeda@linux.intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


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

To xenbits.xen.org:/home/xen/git/osstest/ovmf.git
   69e95b9efe..091ab12b34  091ab12b340a05c99ce0e31d29293ce58c7014e2 -> xen-tested-master

