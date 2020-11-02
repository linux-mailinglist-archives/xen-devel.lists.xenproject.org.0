Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501712A2652
	for <lists+xen-devel@lfdr.de>; Mon,  2 Nov 2020 09:43:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.17484.42278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZVQk-0000e7-1D; Mon, 02 Nov 2020 08:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17484.42278; Mon, 02 Nov 2020 08:43:09 +0000
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
	id 1kZVQj-0000dD-U0; Mon, 02 Nov 2020 08:43:09 +0000
Received: by outflank-mailman (input) for mailman id 17484;
 Mon, 02 Nov 2020 08:43:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7jo9=EI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kZVQh-0000ce-U8
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 08:43:07 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae49cbf0-41e5-4ee4-8bc4-147311a599d1;
 Mon, 02 Nov 2020 08:43:00 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kZVQa-0002SD-8p; Mon, 02 Nov 2020 08:43:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kZVQZ-0007sm-VB; Mon, 02 Nov 2020 08:43:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kZVQZ-00009m-Ul; Mon, 02 Nov 2020 08:42:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=7jo9=EI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kZVQh-0000ce-U8
	for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 08:43:07 +0000
X-Inumbo-ID: ae49cbf0-41e5-4ee4-8bc4-147311a599d1
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ae49cbf0-41e5-4ee4-8bc4-147311a599d1;
	Mon, 02 Nov 2020 08:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=6YY4VYvPnmHXT0IuFCI10H1kcZ8aMWxHS5MZMLSzUYY=; b=Tf35v/9ysQgTeZBlfQfZEOPvZD
	axofWXcQS6mDdFpQATpEt8MPbDCn0RadtXrl5LIS/sYZAd+g2klFTMMjDlEUqsm+eN7zoDvDWOdvo
	JjEFMx4o6y/tIPKjXsiVh4j0bQnT9OARVJqizK2wqHuLpblaAw7aSnYNc0DRQTIcP+E0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kZVQa-0002SD-8p; Mon, 02 Nov 2020 08:43:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kZVQZ-0007sm-VB; Mon, 02 Nov 2020 08:43:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kZVQZ-00009m-Ul; Mon, 02 Nov 2020 08:42:59 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156353-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156353: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2363c6926098ee5c75c8780d07f88f5c21010683
X-Osstest-Versions-That:
    ovmf=8ead7af22bc596de23cdcc46e1f1a8c4e721d6d0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 02 Nov 2020 08:42:59 +0000

flight 156353 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156353/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2363c6926098ee5c75c8780d07f88f5c21010683
baseline version:
 ovmf                 8ead7af22bc596de23cdcc46e1f1a8c4e721d6d0

Last test of basis   156329  2020-10-31 05:43:41 Z    2 days
Testing same since   156353  2020-11-02 01:40:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jeff Brasen <jbrasen@nvidia.com>
  Jon Hunter <jonathanh@nvidia.com>

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
   8ead7af22b..2363c69260  2363c6926098ee5c75c8780d07f88f5c21010683 -> xen-tested-master

