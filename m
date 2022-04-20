Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5995092D3
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 00:29:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309628.526005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhIoe-0004Ba-A0; Wed, 20 Apr 2022 22:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309628.526005; Wed, 20 Apr 2022 22:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhIoe-00048R-69; Wed, 20 Apr 2022 22:28:52 +0000
Received: by outflank-mailman (input) for mailman id 309628;
 Wed, 20 Apr 2022 22:28:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUyO=U6=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nhIod-00048L-Nj
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 22:28:51 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3edc8853-c0f9-11ec-8fbf-03012f2f19d4;
 Thu, 21 Apr 2022 00:28:49 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 165049372519117.4222669135022;
 Wed, 20 Apr 2022 15:28:45 -0700 (PDT)
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
X-Inumbo-ID: 3edc8853-c0f9-11ec-8fbf-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1650493726; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YNwuHO4ARecXZnsWfG9OnoU9XCq9XdxvND5KCXveA1ZQwd8377UMRhz1c5Qd1S/mudPIKIt5RLvKqMlGzv4hUV6lQBh2XA/dX91DVkaotZVNaVe2zaKEddar+gbBfgHY6aOJvmDOY7p2XIV2ux6JaVxH05Ae1UGpy+BsrrkpcMs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1650493726; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=JVD+GfaoWvDjJRBq7+oTsxIw+uQowdOcLbdplkdNJe0=; 
	b=bLnNyDKudGXBYDHlJ7v+QznK3M1jxdVg6k8+HqOVa81qt5hRlleba4MYDieCF09cM9sPHvA5YjV7kFgQ9EzDJdXwiOqdROELsF6IzzO0Rf4vs2NsQNwAtQ6/+iteYkZyY5J+mdMXP6TDN88n5dp2CwTH/5neLTa1xllXglNSU3s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650493726;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=JVD+GfaoWvDjJRBq7+oTsxIw+uQowdOcLbdplkdNJe0=;
	b=F85I6ekVUE+hSrmo7RZ2/KgZvpGfxczOogaIRavxUx3weBdOnruqbmGOpSE3KWNg
	3NfLWDpzgZh0n5pocGq65utxxFd46r8t1tamy+zeRpKftDb1JLWRJJBVE26UU0NDZuQ
	+W27tRvx8zaxKqf2vq6ijgI5psJ96ONOIPjZ7Jls=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	jandryuk@gmail.com
Subject: [PATCH v2 0/2] Adds starting the idle domain privileged
Date: Wed, 20 Apr 2022 18:28:32 -0400
Message-Id: <20220420222834.5478-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This series makes it so that the idle domain is started privileged under the
default policy, which the SILO policy inherits, and under the flask policy. It
then introduces a new one-way XSM hook, xsm_transition_running, that is hooked
by an XSM policy to transition the idle domain to its running privilege level.

Changes in v2:
- renamed flask_domain_runtime_security() to flask_transition_running()
- added the missed assignment of self_sid

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
 xen/xsm/flask/hooks.c                  | 22 +++++++++++++++++++++-
 xen/xsm/flask/policy/initial_sids      |  1 +
 11 files changed, 67 insertions(+), 2 deletions(-)

-- 
2.20.1


