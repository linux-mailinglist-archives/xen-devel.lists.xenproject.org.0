Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3874328B278
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 12:45:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5898.15317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRvKB-0007Tz-TL; Mon, 12 Oct 2020 10:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5898.15317; Mon, 12 Oct 2020 10:45:03 +0000
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
	id 1kRvKB-0007Ta-Q2; Mon, 12 Oct 2020 10:45:03 +0000
Received: by outflank-mailman (input) for mailman id 5898;
 Mon, 12 Oct 2020 10:45:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FZzu=DT=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kRvKA-0007T2-F3
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 10:45:02 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0bc7293e-3e57-498f-b5d7-a94cd8b2eb12;
 Mon, 12 Oct 2020 10:44:55 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kRvK3-0003H5-H7; Mon, 12 Oct 2020 10:44:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kRvK3-0000L4-92; Mon, 12 Oct 2020 10:44:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kRvK3-0006Uh-8Y; Mon, 12 Oct 2020 10:44:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FZzu=DT=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kRvKA-0007T2-F3
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 10:45:02 +0000
X-Inumbo-ID: 0bc7293e-3e57-498f-b5d7-a94cd8b2eb12
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0bc7293e-3e57-498f-b5d7-a94cd8b2eb12;
	Mon, 12 Oct 2020 10:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=uoofCJNT4uV7yAn0ayHGnOnTNhX+oDwDC02VOBopb9I=; b=GggHG95A0vfct5Lm9LE4x+8Ywq
	4KYhWR/iGa8e/LhJdaxTvSwA0A8w04xleBahbzxY4I54VL10tAcGDwVCjar2k1m9ICAR8DW2c66YG
	6sa28VFgdrjXpGJrc1TI06i69XXvmX95nwl6FddPnstDM5+g6p3/1UKCUSFoOsCKvMYw=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kRvK3-0003H5-H7; Mon, 12 Oct 2020 10:44:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kRvK3-0000L4-92; Mon, 12 Oct 2020 10:44:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kRvK3-0006Uh-8Y; Mon, 12 Oct 2020 10:44:55 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155714-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 155714: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=cc942105ede58a300ba46f3df0edfa86b3abd4dd
X-Osstest-Versions-That:
    ovmf=ae511331e0fb1625ba649f377e81e487de3a5531
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 12 Oct 2020 10:44:55 +0000

flight 155714 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155714/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cc942105ede58a300ba46f3df0edfa86b3abd4dd
baseline version:
 ovmf                 ae511331e0fb1625ba649f377e81e487de3a5531

Last test of basis   155643  2020-10-10 08:15:18 Z    2 days
Testing same since   155714  2020-10-12 01:54:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chasel Chiu <chasel.chiu@intel.com>

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
   ae511331e0..cc942105ed  cc942105ede58a300ba46f3df0edfa86b3abd4dd -> xen-tested-master

