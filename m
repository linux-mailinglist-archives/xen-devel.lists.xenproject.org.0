Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3DB560F13
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 04:21:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358150.587184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6jo8-0007G9-CS; Thu, 30 Jun 2022 02:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358150.587184; Thu, 30 Jun 2022 02:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6jo8-0007DZ-9P; Thu, 30 Jun 2022 02:21:28 +0000
Received: by outflank-mailman (input) for mailman id 358150;
 Thu, 30 Jun 2022 02:21:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o6jo6-0007DT-8p
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 02:21:26 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 554a0329-f81b-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 04:21:23 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1656555678871523.7411028246486;
 Wed, 29 Jun 2022 19:21:18 -0700 (PDT)
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
X-Inumbo-ID: 554a0329-f81b-11ec-bdce-3d151da133c5
ARC-Seal: i=1; a=rsa-sha256; t=1656555681; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UNFO2ZOVvqZ0pSRPMmB3nXjctdA+4dbwvaDW3lRhINC3GpGlbVGf+BMIyKtFTV9Ml5QH7qv7VbJKYQN8oPzuZUGfFJ8a8LiMXFZi1QSpiwkpmUDTnrLKoj66arx4dHeaKJS6gvzTSPcBt+JX82G8yM11jpK0UqH1pMFVUQm276I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1656555681; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=AJRi5oMb1/abWwiTsdt47QqKiOm5/WYP7pHFMGJCSio=; 
	b=jSRIg/WoiBqyl3MylTF9GhLf91LQCP2KiJO34EIam2D/lS2P1ciJMVnxBS7EkcqOgthyCynLB/zI63wETkpMkV3KRQXdtjq+2KH7KPLugAXKAnE3xeS2MUgitcFfYDQkZFgRJUtoNR5P5Rzt8WY7w+yuPuaa0WYWWVeScrdp9FE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1656555681;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=AJRi5oMb1/abWwiTsdt47QqKiOm5/WYP7pHFMGJCSio=;
	b=HsqqUoe/4KHEm1IhkKExHxQUXFy9KCIhRXf4i9BguShj5YF6qpIWI+XZVBAPdUeM
	DdyjJwwTBumLmMSJn9OE5mhK0pNp26wF1zEQpxnYuTg9k60dNKI+3RQshpuNxHDDQvW
	IUu/rUgNaK6JLhVTTXWJnspb3+WFtD4dtR5svAp8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	jandryuk@gmail.com,
	christopher.clark@starlab.io
Subject: [PATCH v9 0/3] Adds starting the idle domain privileged
Date: Wed, 29 Jun 2022 22:21:07 -0400
Message-Id: <20220630022110.31555-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This series makes it so that the idle domain is started privileged under the
default policy, which the SILO policy inherits, and under the flask policy. It
then introduces a new one-way XSM hook, xsm_transition_running, that is hooked
by an XSM policy to transition the idle domain to its running privilege level.

Patch 3 is an important one, as first it addresses the issue raised under an
RFC late last year by Jason Andryuk regarding the awkward entanglement of
flask_domain_alloc_security() and flask_domain_create(). Second, it helps
articulate why it is that the hypervisor should go through the access control
checks, even when it is doing the action itself. The issue at hand is not that
the hypervisor could be influenced to go around these check. The issue is these
checks provides a configurable way to express the execution flow that the
hypervisor should enforce. Specifically with this change, it is now possible
for an owner of a dom0less or hyperlaunch system to express a policy where the
hypervisor will enforce that no dom0 will be constructed, regardless of what
boot construction details were provided to it. Likewise, an owner that does not
want to see dom0less or hyperlaunch to be used can enforce that the hypervisor
will only construct a dom0 domain. This can all be accomplished without the
need to rebuild the hypervisor with these features enabled or disabled.

Changes in v9:
- added missing Rb/Tb to patch 1
- corrected the flask policy macro in patch 2 to allow domain create
- added patch 3 to address allowing the hypervisor create more than 1 domain

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

Daniel P. Smith (3):
  xsm: create idle domain privileged and demote after setup
  flask: implement xsm_set_system_active
  xsm: refactor flask sid alloc and domain check

 tools/flask/policy/modules/dom0.te     |  3 ++
 tools/flask/policy/modules/domU.te     |  3 ++
 tools/flask/policy/modules/xen.if      |  7 +++
 tools/flask/policy/modules/xen.te      |  1 +
 tools/flask/policy/policy/initial_sids |  1 +
 xen/arch/arm/setup.c                   |  3 ++
 xen/arch/x86/setup.c                   |  4 ++
 xen/common/sched/core.c                |  7 ++-
 xen/include/xsm/dummy.h                | 17 +++++++
 xen/include/xsm/xsm.h                  |  6 +++
 xen/xsm/dummy.c                        |  1 +
 xen/xsm/flask/hooks.c                  | 66 ++++++++++++++++++++------
 xen/xsm/flask/policy/initial_sids      |  1 +
 13 files changed, 104 insertions(+), 16 deletions(-)

-- 
2.20.1


