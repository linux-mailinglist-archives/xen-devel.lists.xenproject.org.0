Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E82233CBB1
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 04:11:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98168.186140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lM07M-0005J5-Mo; Tue, 16 Mar 2021 03:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98168.186140; Tue, 16 Mar 2021 03:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lM07M-0005Ig-J7; Tue, 16 Mar 2021 03:11:36 +0000
Received: by outflank-mailman (input) for mailman id 98168;
 Tue, 16 Mar 2021 03:11:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LlV3=IO=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lM07L-0005Ib-7W
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 03:11:35 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3973c1bc-fa6e-436a-9255-86840f9d0b18;
 Tue, 16 Mar 2021 03:11:34 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1615864281940780.4737021473826;
 Mon, 15 Mar 2021 20:11:21 -0700 (PDT)
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
X-Inumbo-ID: 3973c1bc-fa6e-436a-9255-86840f9d0b18
ARC-Seal: i=1; a=rsa-sha256; t=1615864286; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CLynJfaPKoeL0yAsBbuI6sDyc8bzTgo4uf5Us6uIQEWiDjsCtEoy1CIj03bZaX4wIwxrEN21OOyi5AQqxfw9BVqS89gXjEm0sOUBmRebVqydGroFUapAl4QoTmSv/1RZ4RFSnonU1FsRG3/62HnHkMXmr39urSxPpNlMaICJh8c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1615864286; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=Q7wd0dGMDbaLZj8GpMrMXLp7yDYNO5sr0dYNSJcEYXk=; 
	b=d2y/pTu5WSGc6SJ7HVJWBTD4J3QDTvD8HtFcbiuq6o7w7a7YObIgUKvky/FIIC+RXxCTxqJzFuaTPRUscwu00moWKlHgkc6TXSmhM3XP0da1zQ4SWBhYlWhVBRrzMdvVDRG1rOFY74x/RR3bhNG4AsjPs0TCdMQ6QfNj+7YmUko=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1615864286;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=Q7wd0dGMDbaLZj8GpMrMXLp7yDYNO5sr0dYNSJcEYXk=;
	b=S3+lQBNSKLNGbgiDkMkkv8f9J8+W4+D6DrzR2+Nq808XdRRqBWXlOaYXLBMLRHcx
	a8bC03NdWDn7sClqftM73/8HpwUjdDpwsbWILRhilIFTX54yX0XJ2ci7qzdtv+mIDPy
	DuQ/lyun5+HUBFMJOAT91tnAzC7pCiKxt6iAklUs=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com,
	andrew.cooper3@citrix.com,
	stefano.stabellini@xilinx.com,
	jgrall@amazon.com,
	Julien.grall.oss@gmail.com,
	iwj@xenproject.org,
	wl@xen.org,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	persaur@gmail.com,
	Bertrand.Marquis@arm.com,
	roger.pau@citrix.com,
	luca.fancellu@arm.com,
	paul@xen.org,
	adam.schwalm@starlab.io
Message-ID: <20210316031814.10311-1-dpsmith@apertussolutions.com>
Subject: [PATCH 0/2] Introducing hyperlaunch capability design (formerly: DomB mode of dom0less)
Date: Mon, 15 Mar 2021 23:18:12 -0400
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8

We are submitting for inclusion in the Xen documentation:

- the hyperlaunch design document, and
- the hyperlaunch device tree design document

to describe a new method for launching the Xen hypervisor.

The hyperlaunch feature builds upon prior dom0less work and the DomB
project to bring a flexible and security-minded means to launch a
variety of VM configurations as part of the startup of Xen.

Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
Signed-off by: Daniel P. Smith <dpsmith@apertussolutions.com>


Daniel P. Smith (2):
  docs/designs/launch: hyperlaunch design document
  docs/designs/launch: hyperlaunch device tree

 .../designs/launch/hyperlaunch-devicetree.rst | 343 +++++++
 docs/designs/launch/hyperlaunch.rst           | 900 ++++++++++++++++++
 2 files changed, 1243 insertions(+)
 create mode 100644 docs/designs/launch/hyperlaunch-devicetree.rst
 create mode 100644 docs/designs/launch/hyperlaunch.rst

--=20
2.20.1



