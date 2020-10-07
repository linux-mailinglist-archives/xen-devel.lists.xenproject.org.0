Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FED2285C15
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 11:49:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3396.9763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ63w-0007nW-4W; Wed, 07 Oct 2020 09:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3396.9763; Wed, 07 Oct 2020 09:48:44 +0000
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
	id 1kQ63w-0007n7-1T; Wed, 07 Oct 2020 09:48:44 +0000
Received: by outflank-mailman (input) for mailman id 3396;
 Wed, 07 Oct 2020 09:48:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xB9j=DO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kQ63u-0007n1-AU
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 09:48:42 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c101a6f-d980-496a-8b27-d0e7ad41c65d;
 Wed, 07 Oct 2020 09:48:40 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kQ63s-00008s-BY; Wed, 07 Oct 2020 09:48:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kQ63s-0001cL-3w; Wed, 07 Oct 2020 09:48:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kQ63s-0001sn-3U; Wed, 07 Oct 2020 09:48:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xB9j=DO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kQ63u-0007n1-AU
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 09:48:42 +0000
X-Inumbo-ID: 3c101a6f-d980-496a-8b27-d0e7ad41c65d
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3c101a6f-d980-496a-8b27-d0e7ad41c65d;
	Wed, 07 Oct 2020 09:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=Rn+rif4NJkq47s7xHchR8O8Dk0OF7NczpqkbDmPtNz4=; b=fElZhhFDlz8pamhxozm9cDFaeS
	pwVzfYZhoOKdktZM2Ij58dWbFrZ+ar+F/7Orc2QBuPbIqXo9hwIhfCSmQnwm9xd35i0Cv9k0DAnVG
	X/j3KaGZ4fxDnbL6Zzvygfs6Pl1fDi7f5bm2AsFke1pFSebwp1JFlXi2ZeOn6RyOkgvc=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQ63s-00008s-BY; Wed, 07 Oct 2020 09:48:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQ63s-0001cL-3w; Wed, 07 Oct 2020 09:48:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQ63s-0001sn-3U; Wed, 07 Oct 2020 09:48:40 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155515-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 155515: all pass - PUSHED
X-Osstest-Versions-This:
    xen=93508595d588afe9dca087f95200effb7cedc81f
X-Osstest-Versions-That:
    xen=8ef6345ef557cc2c47298217635a3088eaa59893
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 07 Oct 2020 09:48:40 +0000

flight 155515 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155515/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  93508595d588afe9dca087f95200effb7cedc81f
baseline version:
 xen                  8ef6345ef557cc2c47298217635a3088eaa59893

Last test of basis   155448  2020-10-04 09:18:26 Z    3 days
Testing same since   155515  2020-10-07 09:19:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christian Lindig <christian.lindig@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tim Deegan <tim@xen.org>
  Wei Liu <wl@xen.org>

jobs:
 coverity-amd64                                               pass    


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
   8ef6345ef5..93508595d5  93508595d588afe9dca087f95200effb7cedc81f -> coverity-tested/smoke

