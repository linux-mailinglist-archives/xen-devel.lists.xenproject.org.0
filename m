Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E31032960BF
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 16:14:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10474.27827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVbLO-0007nW-RI; Thu, 22 Oct 2020 14:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10474.27827; Thu, 22 Oct 2020 14:13:30 +0000
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
	id 1kVbLO-0007n7-Nr; Thu, 22 Oct 2020 14:13:30 +0000
Received: by outflank-mailman (input) for mailman id 10474;
 Thu, 22 Oct 2020 14:13:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A75Z=D5=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kVbLN-0007lT-H7
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 14:13:29 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b396133-0dfc-4397-a2d1-dd3b3519ca2b;
 Thu, 22 Oct 2020 14:13:22 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kVbLG-0001fn-7r; Thu, 22 Oct 2020 14:13:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kVbLG-0001Bj-0y; Thu, 22 Oct 2020 14:13:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kVbLG-0006og-0V; Thu, 22 Oct 2020 14:13:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A75Z=D5=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kVbLN-0007lT-H7
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 14:13:29 +0000
X-Inumbo-ID: 3b396133-0dfc-4397-a2d1-dd3b3519ca2b
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3b396133-0dfc-4397-a2d1-dd3b3519ca2b;
	Thu, 22 Oct 2020 14:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=kDhvUohDJ+AJnCSr+olybovtBIog6cfMkRcQapbP8WU=; b=H2PMve2s+UNkyesnv1rzfo6qZ/
	B7YVbbZM/jx7BlGOaHF+dflS8g/ZsAWxmk4VCCNsFfEwmJNwdNfvDpPzRvltlka5aW+nGi1dKYeZJ
	Xpfmi5AW9h3JGVJ7WxsYDNx1HtAhXOy1cHpjIKLcPgCDNRnnJNO9/ad3AXyyGpl9BFg0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kVbLG-0001fn-7r; Thu, 22 Oct 2020 14:13:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kVbLG-0001Bj-0y; Thu, 22 Oct 2020 14:13:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kVbLG-0006og-0V; Thu, 22 Oct 2020 14:13:22 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156065-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156065: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=26442d11e620a9e81c019a24a4ff38441c64ba10
X-Osstest-Versions-That:
    ovmf=f82b827c92f77eac8debdce6ef9689d156771871
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 22 Oct 2020 14:13:22 +0000

flight 156065 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156065/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 26442d11e620a9e81c019a24a4ff38441c64ba10
baseline version:
 ovmf                 f82b827c92f77eac8debdce6ef9689d156771871

Last test of basis   156017  2020-10-20 06:40:54 Z    2 days
Testing same since   156065  2020-10-21 06:40:48 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jian J Wang <jian.j.wang@intel.com>

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
   f82b827c92..26442d11e6  26442d11e620a9e81c019a24a4ff38441c64ba10 -> xen-tested-master

