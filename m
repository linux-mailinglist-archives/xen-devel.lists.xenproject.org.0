Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7AB5388FF
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 00:41:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338847.563674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvo3n-0006UG-9Y; Mon, 30 May 2022 22:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338847.563674; Mon, 30 May 2022 22:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvo3n-0006Rn-6x; Mon, 30 May 2022 22:40:27 +0000
Received: by outflank-mailman (input) for mailman id 338847;
 Mon, 30 May 2022 22:40:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=epuh=WG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nvo3m-0006Rh-28
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 22:40:26 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c6bf315-e069-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 00:40:22 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1653950416258935.3632297768722;
 Mon, 30 May 2022 15:40:16 -0700 (PDT)
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
X-Inumbo-ID: 7c6bf315-e069-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1653950418; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L3kGXoJAmUwxK01tMBFkX+e+lKNgWWpTkC9RFoe7df8hhd4P+HN9AQw7deolILP9T1ixuZ+lhe84czRVCfTN+mOrqZaPj9mCXHDTuEORASTOFpjDrhI/K5RwVj/a4CYj1vZMihWuPgATMOu5BFCuFUErOgpYDYcw2Pf7rwQU1MI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1653950418; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=qir7TLj3hUjcEYTpsw2J9YevK90J/8tO9fMu2SRDv64=; 
	b=cwikIh2dnyNjahV3EJ2rMMWM9FUe4fTbMXn2dbaCQhxrr0bHprfDFggsQ0k4SBVnKn04+aWsHuD2XD+9vwKPpiG46nnAmy/KDNHDhNb85gYsj+NlIZfSjIYc6OHd54eFYXrMXnVqDJ9zhawKz14BVM369J3KHOIYJOXJmtYLfgo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653950418;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=qir7TLj3hUjcEYTpsw2J9YevK90J/8tO9fMu2SRDv64=;
	b=NtLwsIpTIHgjBDkOCosST2XSuUAVHBwVhs9LV+ZSaSkyJgqG3KEoEvhVpqLiTB35
	lbJuy2gOe30oYT+mqqEZ9bs58debkMs6NdApZCUpSzGbBkS2S0RkrRyAhkmYEtVZzg6
	sqjOrNlbQkHwKld6NxYRxEQfzCqIsDautUs0kn1M=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io,
	jandryuk@gmail.com
Subject: [v2 0/3] xsm: refactor and optimize policy loading
Date: Mon, 30 May 2022 22:39:40 -0400
Message-Id: <20220531023945.22196-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This series was born out of some cleanup work done while crafting the
hyperlaunch boot modules patch series. The primary purpose of this series was
to stop walking all boot modules when it was not necessary, but the scope
creeped during review.

Changes in v2:
* changed init_policy to policy_file_required
* split the patch into a series
* corrected casting of policy buffer
* use IS_ENABLED() instead of #ifdef sequence
* moved #ifdef inside of braces for xsm_dt_policy_init()
* addressed lack of error handling of xsm{mb,dt}_init()

Daniel P. Smith (3):
  xsm: only search for a policy file when needed
  xsm: consolidate loading the policy buffer
  xsm: properly handle error from XSM init

 xen/arch/arm/setup.c  | 10 ++++----
 xen/arch/x86/setup.c  |  9 +++++--
 xen/include/xsm/xsm.h |  2 +-
 xen/xsm/xsm_core.c    | 56 +++++++++++++++++++++----------------------
 xen/xsm/xsm_policy.c  | 31 ++++++++++++++++++++----
 5 files changed, 68 insertions(+), 40 deletions(-)

-- 
2.20.1


