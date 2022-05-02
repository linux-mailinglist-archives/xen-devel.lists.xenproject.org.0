Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB17517054
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 15:30:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318855.538811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlW8Y-0005qQ-1l; Mon, 02 May 2022 13:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318855.538811; Mon, 02 May 2022 13:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlW8X-0005nn-Tr; Mon, 02 May 2022 13:30:49 +0000
Received: by outflank-mailman (input) for mailman id 318855;
 Mon, 02 May 2022 13:30:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9N+v=VK=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nlW8V-0005cw-JH
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 13:30:47 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05be4eba-ca1c-11ec-8fc4-03012f2f19d4;
 Mon, 02 May 2022 15:30:26 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 165149824039777.84452248297293;
 Mon, 2 May 2022 06:30:40 -0700 (PDT)
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
X-Inumbo-ID: 05be4eba-ca1c-11ec-8fc4-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1651498243; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A9SZyvTMQzXW6GpkH8UiD+8CzJ0tVf8HFnBxvpBVl8gicNA5L8L5/j4yL73sBDBhHspXBBJA18SoK+CUo0bjrYOLcOCqlIZBGtMHkj2FinnDOmo25HjRHk11F5WFFSVyWCuXSDmkUdVKvr+Ow/tfEJ7pwgPLfYc2KJ2F8dEWBDI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1651498243; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=2OapjgK/FWZM+gj7ggK7bPexCFnX17I6AnCRzh0bsHg=; 
	b=YSJOqOGxr4w6fN0c2IysW/OTWCrUygc1pLyDaFZD7MvsNaJwWg7Myb9WZCiFyiJs0AeS7X2LKhhZgRB0pWgM2JVLXwYScgjisBdgRBwayfKgOWlXmf0FyA5LvTq1LOg6vtjUdOU1IFWh1unamxiWPY5NFgp8rbd+enivTkV9wDI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1651498243;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=2OapjgK/FWZM+gj7ggK7bPexCFnX17I6AnCRzh0bsHg=;
	b=UQrSrGsDHJLNGiCyw1kH6EIp+kllDGxeOA9hN8OTDgCsdqyWcjJjptErnQGC3OwB
	rB3XvehpRccpIYZkua50Cf4cW+Xs75xM+XAxO1/gGwa4PRYW8Ra41juNwEeekQHVCxl
	JeZW+GqbGNwv3ocmHb+eTGzDELD0U8B3YRCmTgho=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	jandryuk@gmail.com,
	christopher.clark@starlab.io
Subject: [PATCH v5 0/2] Adds starting the idle domain privileged
Date: Mon,  2 May 2022 09:30:25 -0400
Message-Id: <20220502133027.920-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This series makes it so that the idle domain is started privileged under the
default policy, which the SILO policy inherits, and under the flask policy. It
then introduces a new one-way XSM hook, xsm_transition_running, that is hooked
by an XSM policy to transition the idle domain to its running privilege level.

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

 tools/flask/policy/modules/xen.if      |  6 ++++++
 tools/flask/policy/modules/xen.te      |  1 +
 tools/flask/policy/policy/initial_sids |  1 +
 xen/arch/arm/setup.c                   |  4 ++++
 xen/arch/x86/setup.c                   |  5 +++++
 xen/common/sched/core.c                |  7 ++++++-
 xen/include/xsm/dummy.h                | 17 +++++++++++++++++
 xen/include/xsm/xsm.h                  |  6 ++++++
 xen/xsm/dummy.c                        |  1 +
 xen/xsm/flask/hooks.c                  | 22 +++++++++++++++++++++-
 xen/xsm/flask/policy/initial_sids      |  1 +
 11 files changed, 69 insertions(+), 2 deletions(-)

-- 
2.20.1


