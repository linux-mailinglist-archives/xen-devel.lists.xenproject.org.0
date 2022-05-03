Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 033C1518324
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 13:18:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319481.539734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlqXe-0007iQ-Ub; Tue, 03 May 2022 11:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319481.539734; Tue, 03 May 2022 11:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlqXe-0007fI-RG; Tue, 03 May 2022 11:18:06 +0000
Received: by outflank-mailman (input) for mailman id 319481;
 Tue, 03 May 2022 11:18:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B7qc=VL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nlqXd-0007fC-Qq
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 11:18:05 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b24f7f9d-cad2-11ec-a406-831a346695d4;
 Tue, 03 May 2022 13:18:04 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1651576664402846.4614270922928;
 Tue, 3 May 2022 04:17:44 -0700 (PDT)
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
X-Inumbo-ID: b24f7f9d-cad2-11ec-a406-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1651576666; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EzzvcKGbct+Dgc7pNKm4WmVDDRl0uZAxpuTzkeGSTSVHcTKYA4D7B8N+3v29oJHxquJY+7ERdoCGvnhdcgr5xM4RkzuwGYbSSUtxjXeaxR9NKJoUkVP1SVR9YglLpLrRtvaPxJwe0eUsASyGKTplqbkR9oxT9/d6IW7dttnu7cg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1651576666; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=MZnOucO46CLab+64HD+pm5/gkjZFJY/ODJQa7F/pUHw=; 
	b=OF4bfBMYITpuiaUzRc6fq2a/WJof/3vjfmGtOxOXt/WUkwVJ4YxMxVPBLzfav11bzmf94je2B2yFcA/3Cjsz7kJ0KWihKYCgAFJtmKapdL2FzP4Lk39QVAMqZXL0/OMVblAffJCqz3QvkqfqQqwca2DtDH3TfUC5lPtOOan91R0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1651576666;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=MZnOucO46CLab+64HD+pm5/gkjZFJY/ODJQa7F/pUHw=;
	b=Cj7OmqXzXBBlZdGS+amcaJk9b3cqYMuaRU+f0hCDXRN2GcOjBMLLAZl1QsghBJQQ
	gzxblauOaLiXNNLwM5RLCBntoktwdciwx0tVyQC39gFujrat79SkT9osHuQ6DbU3e9x
	kobfQbWxjTljHEAL98OTALfEDPYdJTP2t/5l1a88=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	jandryuk@gmail.com,
	christopher.clark@starlab.io
Subject: [PATCH v6 0/2] Adds starting the idle domain privileged
Date: Tue,  3 May 2022 07:17:29 -0400
Message-Id: <20220503111731.12642-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This series makes it so that the idle domain is started privileged under the
default policy, which the SILO policy inherits, and under the flask policy. It
then introduces a new one-way XSM hook, xsm_transition_running, that is hooked
by an XSM policy to transition the idle domain to its running privilege level.

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
 xen/arch/arm/setup.c                   |  4 ++++
 xen/arch/x86/setup.c                   |  5 ++++
 xen/common/sched/core.c                |  7 +++++-
 xen/include/xsm/dummy.h                | 17 ++++++++++++++
 xen/include/xsm/xsm.h                  |  6 +++++
 xen/xsm/dummy.c                        |  1 +
 xen/xsm/flask/hooks.c                  | 32 +++++++++++++++++++++++++-
 xen/xsm/flask/policy/initial_sids      |  1 +
 11 files changed, 79 insertions(+), 2 deletions(-)

-- 
2.20.1


