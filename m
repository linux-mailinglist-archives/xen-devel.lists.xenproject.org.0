Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFE3A09231
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 14:37:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869620.1281066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWFCe-0001WO-Kd; Fri, 10 Jan 2025 13:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869620.1281066; Fri, 10 Jan 2025 13:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWFCe-0001Tp-Hg; Fri, 10 Jan 2025 13:37:32 +0000
Received: by outflank-mailman (input) for mailman id 869620;
 Fri, 10 Jan 2025 13:37:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qOMD=UC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tWFCd-0001Tj-1n
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 13:37:31 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07c6283b-cf58-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 14:37:28 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1736516239821980.5272888487415;
 Fri, 10 Jan 2025 05:37:19 -0800 (PST)
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
X-Inumbo-ID: 07c6283b-cf58-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1736516244; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iCniKCbNnMJYNjn/ZD0z4IMjel+Tq6tyKRIoM+H2JOvAkABs3BOYwSrNC4sq4pJSd+7+/s2A9m3xjIayK7NwZoCnj5RMMZ3m6gHFPX9+yL9nPQ/blZGo42X0Zf8I+QJqgt1s1fE+HRdPvYMsyQ3ZUw41mUSnN27NVR78JeMerAk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736516244; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lrxUF4Nr7UTugHk+71rew1iL+Fa9qU2pLi+pxaWL6/8=; 
	b=SVWNLvwQRA1eN6caqCwMD8sjJ2FdustrA/g5UhNvMyAlBN6x81ey+rIMUo6Lx1KNa0EHfTuFK7PSOsJMImghS8Z1L4ZpqMba5cZaI+n1SB1ueVqMz054QDFw9afUA07YJZftACC3xcjLebVp/nGAfW5LASNh7RDYmjQIKQL73Dg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736516244;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=lrxUF4Nr7UTugHk+71rew1iL+Fa9qU2pLi+pxaWL6/8=;
	b=LxbhPdJsxH1FkPBXM+vNXcPRWJOSMJHrSxp7x2F8Z9O9cWUq8OjPjEZFOBq3NxKM
	O5s+BUOiq61eHDqBYr0U/D0E8m0CDU+cUUmGLzrpqm4t/wiPMTJ5LR+iyCotbUAMZl4
	xNERpYu7+6HZq/tkGEcPCEc6fevXvwpIIAcdNNC8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: openxt@googlegroups.com,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH 0/2] Enable the ability to disable/remove gnttabv2
Date: Fri, 10 Jan 2025 13:37:09 +0000
Message-Id: <20250110133711.3958202-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

OpenXT has carried a patch for some time that allows the disabling and removal
of the grant table v2 capability. This is a rework of that patch in an attempt
to make an upstreamable series.

The original patch was developed under funding provided by BAE, therefore a
separate Authored-by tag to reflect that is included.

Daniel P. Smith (2):
  gnttab: introduce version agnostic macros
  gnttab: make grant table v2 support configurable

 docs/misc/xen-command-line.pandoc |   4 +-
 xen/common/Kconfig                |  18 +++
 xen/common/compat/grant_table.c   |   4 +
 xen/common/grant_table.c          | 200 +++++++++++++++++++-----------
 4 files changed, 150 insertions(+), 76 deletions(-)

-- 
2.34.1


