Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5E52AA7EB
	for <lists+xen-devel@lfdr.de>; Sat,  7 Nov 2020 21:41:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21476.47793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbV1b-00059f-Dr; Sat, 07 Nov 2020 20:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21476.47793; Sat, 07 Nov 2020 20:41:27 +0000
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
	id 1kbV1b-00059G-AA; Sat, 07 Nov 2020 20:41:27 +0000
Received: by outflank-mailman (input) for mailman id 21476;
 Sat, 07 Nov 2020 20:41:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atuI=EN=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kbV1Z-00058i-LE
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2020 20:41:25 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d80ee3f2-9c02-4c63-b888-ff52bc2f6c59;
 Sat, 07 Nov 2020 20:41:15 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kbV1P-0007BP-0R; Sat, 07 Nov 2020 20:41:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kbV1O-00032r-KD; Sat, 07 Nov 2020 20:41:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kbV1O-00057b-Jf; Sat, 07 Nov 2020 20:41:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=atuI=EN=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kbV1Z-00058i-LE
	for xen-devel@lists.xenproject.org; Sat, 07 Nov 2020 20:41:25 +0000
X-Inumbo-ID: d80ee3f2-9c02-4c63-b888-ff52bc2f6c59
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d80ee3f2-9c02-4c63-b888-ff52bc2f6c59;
	Sat, 07 Nov 2020 20:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=YV4wNHwQ6IRFjYarSFsjo1UJZ291qy2udoyLcGv65C8=; b=KkY0FDoJ53QRw2ov3yLaHYNO+B
	m/1ieK8LS56LJN/Fu3ENiYq47fEuDcK+N28ggrpLxhM3pN5X9VpWOBfLnH6Hz50bBUryflI3OXXTt
	vnR8GiuYhbuJorkdZSxLmXktkp8/jKSF1qaLqpwKhzasWY0nl1SvlN+8aAIae1tQNLcA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kbV1P-0007BP-0R; Sat, 07 Nov 2020 20:41:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kbV1O-00032r-KD; Sat, 07 Nov 2020 20:41:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kbV1O-00057b-Jf; Sat, 07 Nov 2020 20:41:14 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156533-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156533: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=dc0dae2d18d4b6f904e99e0ef9824d61ca750b3d
X-Osstest-Versions-That:
    ovmf=09af9bd9be2d3e31bba979f8cf6446017b0b863e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 07 Nov 2020 20:41:14 +0000

flight 156533 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156533/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 dc0dae2d18d4b6f904e99e0ef9824d61ca750b3d
baseline version:
 ovmf                 09af9bd9be2d3e31bba979f8cf6446017b0b863e

Last test of basis   156467  2020-11-05 19:39:48 Z    2 days
Testing same since   156533  2020-11-06 17:11:20 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Enze Zhu <zhuenze@byosoft.com.cn>
  fengyunhua <fengyunhua@byosoft.com.cn>
  Yunhua Feng <fengyunhua@byosoft.com.cn>

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
   09af9bd9be..dc0dae2d18  dc0dae2d18d4b6f904e99e0ef9824d61ca750b3d -> xen-tested-master

