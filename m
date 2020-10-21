Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1BD2945FC
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 02:22:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9847.26005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kV1tb-00036U-Ud; Wed, 21 Oct 2020 00:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9847.26005; Wed, 21 Oct 2020 00:22:27 +0000
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
	id 1kV1tb-000365-Qu; Wed, 21 Oct 2020 00:22:27 +0000
Received: by outflank-mailman (input) for mailman id 9847;
 Wed, 21 Oct 2020 00:22:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CZbQ=D4=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kV1ta-00035R-4z
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:22:26 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 798ed7bd-89dc-4a22-b1b8-ade2b8b63b48;
 Wed, 21 Oct 2020 00:22:19 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kV1tS-0001Co-Qe; Wed, 21 Oct 2020 00:22:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kV1tS-0006lU-Iz; Wed, 21 Oct 2020 00:22:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kV1tS-0002hq-I2; Wed, 21 Oct 2020 00:22:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CZbQ=D4=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kV1ta-00035R-4z
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:22:26 +0000
X-Inumbo-ID: 798ed7bd-89dc-4a22-b1b8-ade2b8b63b48
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 798ed7bd-89dc-4a22-b1b8-ade2b8b63b48;
	Wed, 21 Oct 2020 00:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=ANgK4tAH94dc+RZu6y5lbPhWmSUcul79o3yjMFLWSg4=; b=iIk+rfiNQhXYQ/MDktd8iVpzjM
	AgtE2ePzDK9QCRz0H7XyaOxmyZGbcIjV4B8haQNdHo+eJ6Vo2bkKrCFiTJiC+OqDwndXSH/+7QquP
	hryxRWL2bZU4Rk/tVMdU3nUPzEKkQi72n+bKN6/hoU+gnwXuCTGxkVHDfAA6MMAyQL+I=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kV1tS-0001Co-Qe; Wed, 21 Oct 2020 00:22:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kV1tS-0006lU-Iz; Wed, 21 Oct 2020 00:22:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kV1tS-0002hq-I2; Wed, 21 Oct 2020 00:22:18 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156047-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 156047: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=3b49791e4cc2f38dd84bf331b75217adaef636e3
X-Osstest-Versions-That:
    xen=0514a3a25fb9ebff5d75cc8f00a9229385300858
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 21 Oct 2020 00:22:18 +0000

flight 156047 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156047/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  3b49791e4cc2f38dd84bf331b75217adaef636e3
baseline version:
 xen                  0514a3a25fb9ebff5d75cc8f00a9229385300858

Last test of basis   156029  2020-10-20 13:01:23 Z    0 days
Testing same since   156047  2020-10-20 21:00:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bertrand Marquis <bertrand.marquis@arm.com>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Volodymyr Babchuk <volodymyr_babchuk@epam.com>

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
   0514a3a25f..3b49791e4c  3b49791e4cc2f38dd84bf331b75217adaef636e3 -> smoke

