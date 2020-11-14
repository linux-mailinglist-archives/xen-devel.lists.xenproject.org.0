Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F862B2C78
	for <lists+xen-devel@lfdr.de>; Sat, 14 Nov 2020 10:50:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.27169.55929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdsBG-0005Lo-2x; Sat, 14 Nov 2020 09:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27169.55929; Sat, 14 Nov 2020 09:49:14 +0000
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
	id 1kdsBF-0005LP-W8; Sat, 14 Nov 2020 09:49:13 +0000
Received: by outflank-mailman (input) for mailman id 27169;
 Sat, 14 Nov 2020 09:49:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2JWW=EU=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kdsBE-0005LK-Mh
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2020 09:49:12 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d02b0c4-9aef-4f39-a746-60a8ef199210;
 Sat, 14 Nov 2020 09:49:10 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kdsBB-0002DG-OI; Sat, 14 Nov 2020 09:49:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kdsBB-0003W0-FE; Sat, 14 Nov 2020 09:49:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kdsBB-0005t2-El; Sat, 14 Nov 2020 09:49:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2JWW=EU=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kdsBE-0005LK-Mh
	for xen-devel@lists.xenproject.org; Sat, 14 Nov 2020 09:49:12 +0000
X-Inumbo-ID: 8d02b0c4-9aef-4f39-a746-60a8ef199210
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8d02b0c4-9aef-4f39-a746-60a8ef199210;
	Sat, 14 Nov 2020 09:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=dFD1xZnOXcnI5IouskBzVrbmtEeibCCZ/NvqsJUMcQQ=; b=vzEMI+oFzJZzckt9tm6Lr47Xe0
	X4Ce9eNb1bmV0lLiYuZ3sOjHjN726uM/V/Tnd2kyFMYpKEsV9BttYK/QY/YaCRrf3YoteAWubkyKJ
	pQ+fW1CN06vwjXsIog+Itvgg6ArKEE/gs5v+u7nzILx14dCSm1b5i09hblBHvQxW3lXg=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kdsBB-0002DG-OI; Sat, 14 Nov 2020 09:49:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kdsBB-0003W0-FE; Sat, 14 Nov 2020 09:49:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kdsBB-0005t2-El; Sat, 14 Nov 2020 09:49:09 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156786-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156786: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5e9a8a6dfb152472c5d12a3940069b16c774f0fc
X-Osstest-Versions-That:
    ovmf=662b42db76a5b195c3aa94ab2946e342a15cd185
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 14 Nov 2020 09:49:09 +0000

flight 156786 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156786/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5e9a8a6dfb152472c5d12a3940069b16c774f0fc
baseline version:
 ovmf                 662b42db76a5b195c3aa94ab2946e342a15cd185

Last test of basis   156742  2020-11-13 11:32:54 Z    0 days
Testing same since   156786  2020-11-14 01:09:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Peter Grehan <grehan@freebsd.org>
  Rebecca Cran <rebecca@bsdio.com>

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
   662b42db76..5e9a8a6dfb  5e9a8a6dfb152472c5d12a3940069b16c774f0fc -> xen-tested-master

