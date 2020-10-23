Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 403D6296856
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 03:39:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10670.28492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVm1p-000619-VL; Fri, 23 Oct 2020 01:38:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10670.28492; Fri, 23 Oct 2020 01:38:01 +0000
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
	id 1kVm1p-00060r-Pq; Fri, 23 Oct 2020 01:38:01 +0000
Received: by outflank-mailman (input) for mailman id 10670;
 Fri, 23 Oct 2020 01:38:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vJnI=D6=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kVm1o-0005ym-Bm
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 01:38:00 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95e5b2d6-62b3-4065-8c62-00db10ac8b39;
 Fri, 23 Oct 2020 01:37:53 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kVm1h-0004VD-6L; Fri, 23 Oct 2020 01:37:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kVm1g-0005i1-Si; Fri, 23 Oct 2020 01:37:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kVm1g-0004pJ-S9; Fri, 23 Oct 2020 01:37:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vJnI=D6=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kVm1o-0005ym-Bm
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 01:38:00 +0000
X-Inumbo-ID: 95e5b2d6-62b3-4065-8c62-00db10ac8b39
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 95e5b2d6-62b3-4065-8c62-00db10ac8b39;
	Fri, 23 Oct 2020 01:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=FK85YrbrSWBtVBXwYjjoX+MRvixr/UBfCnI8Uw85/Ks=; b=vr1ozvl9nJbyLfe2ma5KkBqpGu
	HlqXlQ6no5DwX3aR6PgmZdZk2j8c9QwFLoD+OMPrJCgc7bS1UDXJrD7CDkxWfTYOvUwKC7zfdYM9O
	S8f5JhM15x7DEIu9B+Gc75Wl18ayDkHpNQvXI2XJdkewMRiOXSVaFn6AZM6Hfzeu74YY=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kVm1h-0004VD-6L; Fri, 23 Oct 2020 01:37:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kVm1g-0005i1-Si; Fri, 23 Oct 2020 01:37:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kVm1g-0004pJ-S9; Fri, 23 Oct 2020 01:37:52 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156102-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156102: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=264eccb5dfc345c2e004883f00e62959f818fafd
X-Osstest-Versions-That:
    ovmf=24cf72726564eac7ba9abb24f3d05795164d0a70
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Oct 2020 01:37:52 +0000

flight 156102 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156102/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 264eccb5dfc345c2e004883f00e62959f818fafd
baseline version:
 ovmf                 24cf72726564eac7ba9abb24f3d05795164d0a70

Last test of basis   156091  2020-10-22 14:14:55 Z    0 days
Testing same since   156102  2020-10-22 17:10:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   24cf727265..264eccb5df  264eccb5dfc345c2e004883f00e62959f818fafd -> xen-tested-master

