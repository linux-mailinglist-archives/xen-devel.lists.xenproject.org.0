Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86291A8AF77
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 07:05:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954943.1348821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4uxZ-0005yn-Ps; Wed, 16 Apr 2025 05:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954943.1348821; Wed, 16 Apr 2025 05:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4uxZ-0005wI-Mt; Wed, 16 Apr 2025 05:05:17 +0000
Received: by outflank-mailman (input) for mailman id 954943;
 Wed, 16 Apr 2025 05:05:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1z0E=XC=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u4uxX-0005wA-E4
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 05:05:16 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60a982fa-1a80-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 07:05:13 +0200 (CEST)
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
X-Inumbo-ID: 60a982fa-1a80-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744779911; x=1745039111;
	bh=6riKyEr6Sj5aHqJ/Z03PTegCIDGRfX3q2k1vTORH4Qs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=YjroKTPnXiVNMZF7odEi0VJ1LyId5pEJSJkSDgwomA28wwtj6Muv4Et9JwOTN/MC5
	 bCfrDh0EJCxWdKt4FbTlvfZdSuBPzjzabUcrJBfC+miaCMJP1QfoTSJMr/D5MhTfy/
	 sJPpeS/BDZg2/W31WwjYTnUVAPRJ607XtHL7kn+jzhckTvBWGoXXvYhmmKF8Bid0+l
	 HhSr4J+yIKLy7X/gtM2sxWPIJmDU8UDJL0x/R3UoUCcc+FWQ6aTVMBCxP3bYODlVAK
	 gsDOUAYsa6cKuyDZnwi/Hj2bXOHwCc1Wc0fGClUqoJoQQE6SPHjj7AkdO/Npho3P0r
	 XCnlheyuOytpQ==
Date: Wed, 16 Apr 2025 05:05:07 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, christopher.w.clark@gmail.com, dpsmith@apertussolutions.com, persaur@gmail.com, dmukhin@ford.com
Subject: [XTF PATCH v1 0/2] xtf: integrate argo test
Message-ID: <20250416050443.919751-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 441ee477972c3a8ab3b25633b4a4b4c125690a99
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The patch series integrates an XTF argo test available at [1].

Patch 1 is the original test.
Patch 2 adds fixups to run the test under QEMU environment in gitlab CI.

[1] https://github.com/dozylynx/meta-argo/blob/master/recipes-extended/xen/=
xtf/0001-Add-Argo-test.patch

Christopher Clark (1):
  tests/argo: Add argo test suite

Denis Mukhin (1):
  tests/argo: fixup for recent xen

 docs/all-tests.dox      |   2 +
 include/xen/argo.h      | 259 +++++++++++++++++++++++++++++
 include/xtf/hypercall.h |   1 +
 include/xtf/numbers.h   |   5 +
 tests/argo/Makefile     |   9 +
 tests/argo/main.c       | 355 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 631 insertions(+)
 create mode 100644 include/xen/argo.h
 create mode 100644 tests/argo/Makefile
 create mode 100644 tests/argo/main.c

--=20
2.34.1



