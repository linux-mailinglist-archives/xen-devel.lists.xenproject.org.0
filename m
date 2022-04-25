Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3538A50E6FE
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 19:22:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313187.530665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj2QC-0001pb-IG; Mon, 25 Apr 2022 17:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313187.530665; Mon, 25 Apr 2022 17:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj2QC-0001mE-EN; Mon, 25 Apr 2022 17:22:48 +0000
Received: by outflank-mailman (input) for mailman id 313187;
 Mon, 25 Apr 2022 17:22:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sCC+=VD=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nj2QA-0001m7-NJ
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 17:22:46 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5160dcd0-c4bc-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 19:22:45 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1650907358533423.51309031262167;
 Mon, 25 Apr 2022 10:22:38 -0700 (PDT)
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
X-Inumbo-ID: 5160dcd0-c4bc-11ec-8fc2-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1650907362; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ESfvTbpA7jL2dBIsUgFquA4az2OLW0ndJHK12tWRVo9W2qaETbyVKENcDbZAZ3RR8m/61cBQAQN7u8vuPX/xaS1TPIy2xkJAFit6yBspZwbZmtkczpxAONpE4Lxbs9PkjnF32lLqxKXB+8R79VJ6HF3b7J5Xe0zRZ5IRBcxV/b0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1650907362; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=jb7DIZpJG+PpAxtH2k2IxIIsQBdNEM3UGi2u20z+AQk=; 
	b=IbLR76Jb7CgrZHul9DN0ibscjXinJU+VZyebmoMahK0O0V7mIpjahbl4rLTBinzziRbX5Oxkmw44rmvGX9CgirJPujcCINyeuB0CP0L3jgPwLmMe8dD3kHmSqT3DS+E9uyDIMFlQ8tSUfxTZsJ59P1nR5xkb2M3XJU/4xeLZteI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650907362;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=jb7DIZpJG+PpAxtH2k2IxIIsQBdNEM3UGi2u20z+AQk=;
	b=GpRypCL/1JIRBNFFROpBVuse5JNiHQjkZeARLYeaLBnj42Cv6/FcM1ODiQxEMSde
	kfBC3nkgtzbaPJHWrmmpoBFJdA05fn6+v+GBgaRJJhDYT1VaxDBD/NhxDPMUZdQErDn
	EbODTBsJUiokJk+qS1lldq0enHg0EFihOGgXZpkI=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	jandryuk@gmail.com
Subject: [PATCH v4 0/2] Adds starting the idle domain privileged
Date: Mon, 25 Apr 2022 13:22:29 -0400
Message-Id: <20220425172231.27401-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This series makes it so that the idle domain is started privileged under the
default policy, which the SILO policy inherits, and under the flask policy. It
then introduces a new one-way XSM hook, xsm_transition_running, that is hooked
by an XSM policy to transition the idle domain to its running privilege level.

Changes in v4:
- reworded patch 1 commit messaged
- fixed whitespace to coding style
- fixed comment to coding style

Changes in v3:
- renamed *_transition_running() to *_set_system_active()
- changed the XSM hook set_system_active() from void to int return
- added ASSERT check for the expected privilege level each XSM policy expected
- replaced a check against is_privileged in each arch with checking the return
  value from the call to xsm_set_system_active()

Changes in v2:
- renamed flask_domain_runtime_security() to flask_transition_running()
- added the missed assignment of self_sid

Daniel P. Smith (2):
  xsm: create idle domain privileged and demote after setup
  flask: implement xsm_set_system_active

 tools/flask/policy/modules/xen.if      |  6 ++++++
 tools/flask/policy/modules/xen.te      |  1 +
 tools/flask/policy/policy/initial_sids |  1 +
 xen/arch/arm/setup.c                   |  3 +++
 xen/arch/x86/setup.c                   |  3 +++
 xen/common/sched/core.c                |  7 ++++++-
 xen/include/xsm/dummy.h                | 17 +++++++++++++++
 xen/include/xsm/xsm.h                  |  6 ++++++
 xen/xsm/dummy.c                        |  1 +
 xen/xsm/flask/hooks.c                  | 29 +++++++++++++++++++++++++-
 xen/xsm/flask/policy/initial_sids      |  1 +
 11 files changed, 73 insertions(+), 2 deletions(-)

-- 
2.20.1


