Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EBF2B32AB
	for <lists+xen-devel@lfdr.de>; Sun, 15 Nov 2020 07:05:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.27394.56077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keB8k-0001IZ-1C; Sun, 15 Nov 2020 06:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27394.56077; Sun, 15 Nov 2020 06:03:53 +0000
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
	id 1keB8j-0001IA-UH; Sun, 15 Nov 2020 06:03:53 +0000
Received: by outflank-mailman (input) for mailman id 27394;
 Sun, 15 Nov 2020 06:03:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t4DI=EV=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1keB8i-0001Hc-QJ
 for xen-devel@lists.xenproject.org; Sun, 15 Nov 2020 06:03:52 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef77903d-91f6-4910-a3bb-3d1250ec1607;
 Sun, 15 Nov 2020 06:03:44 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1keB8Z-0007xB-To; Sun, 15 Nov 2020 06:03:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1keB8Z-0000S9-JQ; Sun, 15 Nov 2020 06:03:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1keB8Z-0004BO-Ie; Sun, 15 Nov 2020 06:03:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=t4DI=EV=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1keB8i-0001Hc-QJ
	for xen-devel@lists.xenproject.org; Sun, 15 Nov 2020 06:03:52 +0000
X-Inumbo-ID: ef77903d-91f6-4910-a3bb-3d1250ec1607
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ef77903d-91f6-4910-a3bb-3d1250ec1607;
	Sun, 15 Nov 2020 06:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=qQ1f2n+GqvaL0w69rT68+RM1xylrJCUQeEGMr9/RsEc=; b=L3r2qKyMc0F2fttCshyGRjpfEj
	69e0GBwRuUMsbH3rTrzBw+iH5Ln8ALk2f4UOfSdlsHNxBicB8BUnzUogJNZzH12/4vkVrIgIGTUly
	bnH43f8APTuCWOxldzNeeXVI6z+0mtUeG5BEqK5pm+QCIw2VjqxTFz6Q1jcr2MjvPRHE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1keB8Z-0007xB-To; Sun, 15 Nov 2020 06:03:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1keB8Z-0000S9-JQ; Sun, 15 Nov 2020 06:03:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1keB8Z-0004BO-Ie; Sun, 15 Nov 2020 06:03:43 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156806-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156806: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d448574e73108f031ea6b02994f2579bb574785a
X-Osstest-Versions-That:
    ovmf=5e9a8a6dfb152472c5d12a3940069b16c774f0fc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 15 Nov 2020 06:03:43 +0000

flight 156806 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156806/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d448574e73108f031ea6b02994f2579bb574785a
baseline version:
 ovmf                 5e9a8a6dfb152472c5d12a3940069b16c774f0fc

Last test of basis   156786  2020-11-14 01:09:48 Z    1 days
Testing same since   156806  2020-11-15 00:39:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Maurice Ma <maurice.ma@intel.com>

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
   5e9a8a6dfb..d448574e73  d448574e73108f031ea6b02994f2579bb574785a -> xen-tested-master

