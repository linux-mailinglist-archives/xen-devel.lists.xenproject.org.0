Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEA252319C
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 13:31:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326750.549366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nokYO-0007Om-5P; Wed, 11 May 2022 11:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326750.549366; Wed, 11 May 2022 11:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nokYO-0007Li-2X; Wed, 11 May 2022 11:30:52 +0000
Received: by outflank-mailman (input) for mailman id 326750;
 Wed, 11 May 2022 11:30:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ssr4=VT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nokYL-0007Lc-V8
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 11:30:49 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd5b756d-d11d-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 13:30:48 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 165226864350095.43678669338908;
 Wed, 11 May 2022 04:30:43 -0700 (PDT)
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
X-Inumbo-ID: cd5b756d-d11d-11ec-8fc4-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1652268644; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jLoifKJAGJBbdkF/nx+OyUVapFDhoEX6IESdtTkYJO0c/8cTEZKmAJvM1SPn5xqiIMeijwNlk+1kYJ9qrcIw29yeVCtVnHgtO1fvlDF9Obh7V6Qf7Pn7/Tj6+RRTpIrMrjB+7lg/Vn4Farf26TmrRCot180q86khZ16eNT9ptFg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1652268644; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=9KX9JOgfKWP1A767M+6u3o5bxrE0Qqs6j3qcikRX04c=; 
	b=RIygfYMjXxyD6iF46I1V2YwCdjif/afVHkEFEvE48PqOQDZbmYFhFItEGE052rlfT44pQF3Il2yfOpr+NVqpKgQXDfjldvZSp4ZZ9h0aV+NDu4UfYZed7z7WfB7v1s4cpvtQInIcNrvmehCGxNmvlwvII3KuZadEKYru4W+TLek=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1652268644;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=9KX9JOgfKWP1A767M+6u3o5bxrE0Qqs6j3qcikRX04c=;
	b=a3WyQ5Z3+qA1yVjebWJBtxBgey9NE/VfFzdq+jtEWVRH9ESE4ASZ3O9JuW8lw4EA
	0L71qQT7vaqX0SDlkWE7eqrqc9CTsUGnkIWp1WQY1D9qWG4+RNc1IbB+6fAfG/8nYDM
	Q08qO5O35JhxqgCchdgIoL0bt5dnlRn7GrijiZbo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	jandryuk@gmail.com,
	christopher.clark@starlab.io
Subject: [PATCH v7 0/2] Adds starting the idle domain privileged
Date: Wed, 11 May 2022 07:30:33 -0400
Message-Id: <20220511113035.27070-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This series makes it so that the idle domain is started privileged under the
default policy, which the SILO policy inherits, and under the flask policy. It
then introduces a new one-way XSM hook, xsm_transition_running, that is hooked
by an XSM policy to transition the idle domain to its running privilege level.

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


