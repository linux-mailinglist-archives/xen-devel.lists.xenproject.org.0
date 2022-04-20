Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C66508DE7
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 19:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309507.525809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhDj4-0000zI-Do; Wed, 20 Apr 2022 17:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309507.525809; Wed, 20 Apr 2022 17:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhDj4-0000xc-Ab; Wed, 20 Apr 2022 17:02:46 +0000
Received: by outflank-mailman (input) for mailman id 309507;
 Wed, 20 Apr 2022 17:02:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUyO=U6=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nhDj2-0000xW-NW
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 17:02:44 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b09963ae-c0cb-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 19:02:43 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1650474155979567.7828546115068;
 Wed, 20 Apr 2022 10:02:35 -0700 (PDT)
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
X-Inumbo-ID: b09963ae-c0cb-11ec-8fbf-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1650474158; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S4dDeJGdViW9gJkSXaXTBfY5V3tnpROHw8CNZvpcy6hlzDaludOzV5tI/RgzFuyBBSbAsY3gQTt23PVnm6lSv4PFoXrdwdKqLZps4ds6yidcBQ8amVav9q4WWfNLNeTEP6iAGLQb828y1lGW4aBtQ1aMGRILEhxj/q78/2TR9Hc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1650474158; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=+AF6PHlDwTTK1l0rIrxR4mBCwLUshmplkl+DA05lAQ0=; 
	b=CXhvOhMbUk3+NWyi0qCIRThAWpUQfZCrBJBa7BjvPeCHDq+mm0HOPLJjPXcZdxfAk9d1wHTOK8a9LCgNxvx8r2n1Vy+JA6TMjLBKBV9HNNtjmUjApEt5MOD+iUv89Y1UsxWDxVHjf8QzYb1H8WiOSu/h3rtUZuUe4jqibAGSxSI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650474158;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=+AF6PHlDwTTK1l0rIrxR4mBCwLUshmplkl+DA05lAQ0=;
	b=NTfXWpTa4sKnp3m07qh4M6HpRFhfGH1uO7HUGKbDnAQfEXYaBmpUDg1umOC0y7lc
	8sMTkOdEfoDsfT9m/fbnPeFWZfzZOUx4rVdT6ICe+8fnUmt03OZG4aW6HkFNq/Hl7jR
	Acx8U+0viRtirMfrGrjwaqs9F53FDWlv0RPgmDbo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	jandryuk@gmail.com
Subject: [PATCH 0/2] Adds starting the idle domain privileged
Date: Wed, 20 Apr 2022 17:04:05 -0400
Message-Id: <20220420210407.18060-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This series makes it so that the idle domain is started privileged under the
default policy, which the SILO policy inherits, and under the flask policy. It
then introduces a new one-way XSM hook, xsm_transition_running, that is hooked
by an XSM policy to transition the idle domain to its running privilege level.

Daniel P. Smith (2):
  xsm: create idle domain privieged and demote after setup
  flask: implement xsm_transtion_running

 tools/flask/policy/modules/xen.if      |  6 ++++++
 tools/flask/policy/modules/xen.te      |  1 +
 tools/flask/policy/policy/initial_sids |  1 +
 xen/arch/arm/setup.c                   |  6 ++++++
 xen/arch/x86/setup.c                   |  6 ++++++
 xen/common/sched/core.c                |  7 ++++++-
 xen/include/xsm/dummy.h                | 12 ++++++++++++
 xen/include/xsm/xsm.h                  |  6 ++++++
 xen/xsm/dummy.c                        |  1 +
 xen/xsm/flask/hooks.c                  | 21 ++++++++++++++++++++-
 xen/xsm/flask/policy/initial_sids      |  1 +
 11 files changed, 66 insertions(+), 2 deletions(-)

-- 
2.20.1


