Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7FD76BE6A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 22:21:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574495.899809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQvr3-0007ux-LW; Tue, 01 Aug 2023 20:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574495.899809; Tue, 01 Aug 2023 20:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQvr3-0007tI-IV; Tue, 01 Aug 2023 20:20:29 +0000
Received: by outflank-mailman (input) for mailman id 574495;
 Tue, 01 Aug 2023 20:20:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Rc=DS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qQvr2-0007tB-EA
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 20:20:28 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d78e14aa-30a8-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 22:20:23 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 16909212173621014.5551400025472;
 Tue, 1 Aug 2023 13:20:17 -0700 (PDT)
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
X-Inumbo-ID: d78e14aa-30a8-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1690921219; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E413ofvZPo9ecp1I5vBmTYsC5yIJ9vgdigDQfffgzj1GXG4fTxzJG+sU3eGcyeLzqgHdLOETjpd/7i27BlzU6X+FZN1XeZ2dat1euy4Ktdvnf1lGUxUoxE5No9vBk4AvB5MBKpi7BqhgKGOK/kf+CbSXDOvseZF0ugU1XZAc794=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1690921219; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=ko9U8cGQhnmgoATzcdLjAMLp8cggi3FR/MqknwYUGjw=; 
	b=XLDon0Q6hOidpC6DAmlQx5CG79Cc5StFCEvKiwXux0Fdk1Gli/nWneU4mOqG6z1l1R1n6bei2zfiwf/dMIV/F5B1Gw+lVqfjWBZGIhOxzL5ZOyPfo7W4mQvTI+vMxlGu6vBipb+2Lx67/HHjxrYmhvb1Mwgl0XRnLQF0UqpJk4g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1690921219;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=ko9U8cGQhnmgoATzcdLjAMLp8cggi3FR/MqknwYUGjw=;
	b=L8B+SkqbAs+n+BtTOmiwTj30QSvyY1S+C9oj/2NQgj9D2uCsoeu9c+/U4DBCAqFt
	r24RWirHEzRW3jB7DTK1E+d+2WIwlZ6DvroJ+x3k4yhQvOLWCePyW2oPD1HU+cjEuzt
	hHIYiraxeaUYKx0Uu46Hz9VPT+3x7LUl+0MOBmW0=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Christopher Clark <christopher.w.clark@gmail.com>,
	Rich Persaud <persaur@gmail.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [RFC 0/6] Hyperlaunch domain roles and capabilities
Date: Tue,  1 Aug 2023 16:20:00 -0400
Message-Id: <20230801202006.20322-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

A goal of the hyperlaunch effort was to solidify the concept of the different
types of domains the hypervisor has some notion around. The initial approach
was to formalize these types as roles enforced through the XSM framework. In
this RFC, a simpler approach is taken to lay a foundation of domain roles and
assignable capabilities.

The approach in this series is to collapse the relevant bools in struct domain
into a pair of bit flag entries that represent roles and capabilities that a
domain is assigned.

Daniel P. Smith (6):
  dom0: replace explict zero checks
  roles: provide abstraction for the possible domain roles
  roles: add a role for xenstore domain
  capabilities: introduce console io as a domain capability
  capabilities: add dom0 cpu faulting disable
  capabilities: convert attach debugger into a capability

 xen/arch/arm/domain_build.c     |  6 ++-
 xen/arch/x86/cpu-policy.c       |  2 +-
 xen/arch/x86/cpu/common.c       | 82 ++++++++++++++++-----------------
 xen/arch/x86/hvm/svm/svm.c      |  8 ++--
 xen/arch/x86/hvm/vmx/realmode.c |  2 +-
 xen/arch/x86/hvm/vmx/vmcs.c     |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c      | 10 ++--
 xen/arch/x86/setup.c            |  6 +++
 xen/arch/x86/traps.c            |  6 ++-
 xen/common/domain.c             | 21 +++++++--
 xen/common/domctl.c             |  6 ++-
 xen/common/sched/arinc653.c     |  2 +-
 xen/common/sched/core.c         |  4 +-
 xen/include/xen/sched.h         | 58 +++++++++++++++++++----
 xen/include/xsm/dummy.h         |  6 +--
 xen/xsm/flask/hooks.c           | 12 ++---
 16 files changed, 150 insertions(+), 83 deletions(-)

-- 
2.20.1


