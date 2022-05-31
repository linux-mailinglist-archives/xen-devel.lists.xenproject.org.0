Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 387A9539373
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 16:58:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339715.564604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw3KQ-0007i4-LW; Tue, 31 May 2022 14:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339715.564604; Tue, 31 May 2022 14:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw3KQ-0007fB-Im; Tue, 31 May 2022 14:58:38 +0000
Received: by outflank-mailman (input) for mailman id 339715;
 Tue, 31 May 2022 14:58:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xfyb=WH=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nw3KP-0007f3-59
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 14:58:37 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2456b17e-e0f2-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 16:58:35 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1654009109378667.0943403791821;
 Tue, 31 May 2022 07:58:29 -0700 (PDT)
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
X-Inumbo-ID: 2456b17e-e0f2-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; t=1654009111; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dKv6CTgzmEQXPD+OSXoPuZnqX6UUKa6wmgQ9wZ2yUWy1KjYBnzLpQ/8srYxsipOjNPhfYyX+J+MEoZrY+mDHQIAgdcYyJVKzncii+iBKsZB+gEYaMYizzjTmAK+1hkyAUQQmEpyF1QuRNQ3zN6CwaYyJmmca859g7M/9GI971NM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654009111; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=exIHAbauRw6+XBT2OB/0h0ijm5e3O0CgmhlvDXicHiI=; 
	b=hxHBQfABM2HuuUpRGp2HcYE1j3drQHonX5nvOZTCy/lHIVnuNK6l1ofzf13vh6raO/faFyKSjUHnae43uVie9f8kHx7H5XWUK6Xn7vOmfFpDfmAVs/jtj9PE4/o5uukMJxENUvD/5p46lpEcs5OcuGBLq0IXgM5FtCy6rgby09Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654009111;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=exIHAbauRw6+XBT2OB/0h0ijm5e3O0CgmhlvDXicHiI=;
	b=Z/9rO0LfYvXosJTAi9opnnG94bp7zdllVLhP4Pltag4udY8fpYLZYcVTMeeqoOHi
	DppIpbc12ii3wCZwhTW4ZISlnUci2qToaw8vFYaQmfx/4Ij3b6qW0JYqA6Cl1t2uIUT
	OYvVzIUsg/otOGprJt49iSOe4QpPBYU/rgKO4EAE=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io,
	jandryuk@gmail.com
Subject: [PATCH v8 0/2] Adds starting the idle domain privileged
Date: Tue, 31 May 2022 10:56:44 -0400
Message-Id: <20220531145646.10062-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This series makes it so that the idle domain is started privileged under the
default policy, which the SILO policy inherits, and under the flask policy. It
then introduces a new one-way XSM hook, xsm_transition_running, that is hooked
by an XSM policy to transition the idle domain to its running privilege level.

Changes in v8:
- adjusted panic messages in arm and x86 setup.c to be less than 80cols
- fixed comment line that went over 80col
- added line in patch #1 commit message to clarify the need is for domain
  creation

Changes in v7:
- adjusted error message in default and flask xsm_set_system_active hooks
- merged panic messages in arm and x86 setup.c to a single line

Changes in v6:
- readded the setting of is_privileged in flask_set_system_active()
- clarified comment on is_privileged in flask_set_system_active()
- added ASSERT on is_privileged and self_sid in flask_set_system_active()
- fixed err code returned on Arm for xsm_set_system_active() panic message

Changes in v5:
- dropped setting is_privileged in flask_set_system_active()
- added err code returned by xsm_set_system_active() to panic message

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

 tools/flask/policy/modules/xen.if      |  6 +++++
 tools/flask/policy/modules/xen.te      |  1 +
 tools/flask/policy/policy/initial_sids |  1 +
 xen/arch/arm/setup.c                   |  3 +++
 xen/arch/x86/setup.c                   |  4 ++++
 xen/common/sched/core.c                |  7 +++++-
 xen/include/xsm/dummy.h                | 17 ++++++++++++++
 xen/include/xsm/xsm.h                  |  6 +++++
 xen/xsm/dummy.c                        |  1 +
 xen/xsm/flask/hooks.c                  | 32 +++++++++++++++++++++++++-
 xen/xsm/flask/policy/initial_sids      |  1 +
 11 files changed, 77 insertions(+), 2 deletions(-)

-- 
2.20.1


