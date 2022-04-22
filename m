Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFC950BD34
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 18:35:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311089.528103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhwFX-0001xI-VY; Fri, 22 Apr 2022 16:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311089.528103; Fri, 22 Apr 2022 16:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhwFX-0001ua-SA; Fri, 22 Apr 2022 16:35:15 +0000
Received: by outflank-mailman (input) for mailman id 311089;
 Fri, 22 Apr 2022 16:35:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JQBp=VA=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nhwFV-0001uU-VV
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 16:35:14 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d330861-c25a-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 18:35:12 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 165064530579532.33830211828172;
 Fri, 22 Apr 2022 09:35:05 -0700 (PDT)
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
X-Inumbo-ID: 2d330861-c25a-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1650645307; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bK8uyusoRSJV5H320EKGuHoz8gIx0Fd7V/1YuPBcZAhiPz3GDzQqpvFeFNwMmG5bCvAX5vGlOeL5I7Emiuxjn/uDQSl94pxwAL7LKPgO9biWgyHjEnK8UUyJz3+eI6I5+uSzobrgsSvnQAAqlM1hKjpz/7lxVbxPDd/Kcp1H2NA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1650645307; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=JmUJd8m1+kH1LBV6rKljJnSt9maxgAY7fiPqIijmhQs=; 
	b=mvjiPdtyYITCcPzEvApk65R1T9Wg3FiapdmwzGsK/HDKiQkYzBfJH0mwUO4i/4xySZuWCxFGo42IiOVzf6m27Wt5OwvNz7quPOrqiDtwjjmZtmDc4JrYGXtGvnmH4QC+Rk29e14l6JiuJ6p5uLZT54bmsiiG/MBMd/n7T+UGbdY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650645307;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=JmUJd8m1+kH1LBV6rKljJnSt9maxgAY7fiPqIijmhQs=;
	b=FK+/UeqpK2uc4EZAT5CnPWGmI5kivBzaq+RW+ZAFdXOU9PQxQGVNneWELIZXNGOk
	UnCiG2b8T8efp1fU5JmHvzt8t/CfIVe265U1/OvgnjRAxOJ6Qz7jj4RUWdISHFNlp9B
	nC2i/F9SdHpqyAl1LsOGQNSPoB+s8ka/pvAaArf8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	jandryuk@gmail.com
Subject: [PATCH v3 0/2] Adds starting the idle domain privileged
Date: Fri, 22 Apr 2022 12:34:56 -0400
Message-Id: <20220422163458.30170-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This series makes it so that the idle domain is started privileged under the
default policy, which the SILO policy inherits, and under the flask policy. It
then introduces a new one-way XSM hook, xsm_transition_running, that is hooked
by an XSM policy to transition the idle domain to its running privilege level.

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


