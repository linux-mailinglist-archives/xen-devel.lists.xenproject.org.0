Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9696D282A31
	for <lists+xen-devel@lfdr.de>; Sun,  4 Oct 2020 12:28:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2729.7786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kP1F0-0000OE-JH; Sun, 04 Oct 2020 10:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2729.7786; Sun, 04 Oct 2020 10:27:42 +0000
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
	id 1kP1F0-0000Np-G3; Sun, 04 Oct 2020 10:27:42 +0000
Received: by outflank-mailman (input) for mailman id 2729;
 Sun, 04 Oct 2020 10:27:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMX8=DL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kP1Ey-0000NN-JN
 for xen-devel@lists.xenproject.org; Sun, 04 Oct 2020 10:27:40 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03feadb1-74ad-4b80-8458-1d21f9c47593;
 Sun, 04 Oct 2020 10:27:33 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kP1Eq-0002jP-TQ; Sun, 04 Oct 2020 10:27:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kP1Eq-000290-M8; Sun, 04 Oct 2020 10:27:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kP1Eq-0003kH-Le; Sun, 04 Oct 2020 10:27:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vMX8=DL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kP1Ey-0000NN-JN
	for xen-devel@lists.xenproject.org; Sun, 04 Oct 2020 10:27:40 +0000
X-Inumbo-ID: 03feadb1-74ad-4b80-8458-1d21f9c47593
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 03feadb1-74ad-4b80-8458-1d21f9c47593;
	Sun, 04 Oct 2020 10:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=vZI5vswbISsTpqlrx3pgUhSz1+WQOnjHJBn/sAytXO0=; b=hRPmGrj9JmsGOiu7vXZPetLttG
	DKU6qasQGshwfsysumIbb/2oPFluabE/oktOdW8rX7yPDBv9I8cJpm0kh5w3/2UgyroIYZo49R+UR
	9roIIImq29S9rWfLo9/OmK4x6OP6+pKcUUQ5pMAq2uXkepYPk6c2co2HVWUWIWhnTiD8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kP1Eq-0002jP-TQ; Sun, 04 Oct 2020 10:27:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kP1Eq-000290-M8; Sun, 04 Oct 2020 10:27:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kP1Eq-0003kH-Le; Sun, 04 Oct 2020 10:27:32 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155448-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 155448: all pass - PUSHED
X-Osstest-Versions-This:
    xen=8ef6345ef557cc2c47298217635a3088eaa59893
X-Osstest-Versions-That:
    xen=5dba8c2f23049aa68b777a9e7e9f76c12dd00012
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 04 Oct 2020 10:27:32 +0000

flight 155448 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155448/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  8ef6345ef557cc2c47298217635a3088eaa59893
baseline version:
 xen                  5dba8c2f23049aa68b777a9e7e9f76c12dd00012

Last test of basis   155131  2020-09-30 09:18:28 Z    4 days
Testing same since   155448  2020-10-04 09:18:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Laurentiu Tudor <laurentiu.tudor@nxp.com>
  Olaf Hering <olaf@aepfle.de>
  Paul Durrant <paul@xen.org>
  Paul Durrant <pdurrant@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Trammell Hudson <hudson@trmm.net>
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
   5dba8c2f23..8ef6345ef5  8ef6345ef557cc2c47298217635a3088eaa59893 -> coverity-tested/smoke

