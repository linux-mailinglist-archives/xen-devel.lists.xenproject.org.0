Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA52AA869C
	for <lists+xen-devel@lfdr.de>; Sun,  4 May 2025 15:57:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975569.1362958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBZpR-0003lH-E9; Sun, 04 May 2025 13:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975569.1362958; Sun, 04 May 2025 13:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBZpR-0003jd-B7; Sun, 04 May 2025 13:56:25 +0000
Received: by outflank-mailman (input) for mailman id 975569;
 Sun, 04 May 2025 13:56:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hwa9=XU=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uBZpO-0003jW-HQ
 for xen-devel@lists.xenproject.org; Sun, 04 May 2025 13:56:23 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e3c7962-28ef-11f0-9eb4-5ba50f476ded;
 Sun, 04 May 2025 15:56:19 +0200 (CEST)
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
X-Inumbo-ID: 8e3c7962-28ef-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1746366978; x=1746626178;
	bh=BAs05A9tNZO9zdDHA65HFjLKHnUIRzqLHxkHq69nJCM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=V+Kgf/vyk2Pt3L4cOMuvwWtB4T7u/cVFzSnXNjCM/OuaLbgy8E4K7TN3NzgfkmsGb
	 3x4h90EDzfRwvHAlr8xiH5VLrXZx+BI913uyS8itwibKTZdyMD46nSLhsTj4PKfWTz
	 DKBc11542pTGwlN4B8mmoiLHlrkJBOQUkTrXnnLrk6FsfPMUEjqADxFbgwN+Fk+WzR
	 N4fx1FOAkVlUzorv8uMx7WvHrGH5YlFZl4UnWvhYkUxxUyKsrwtFhWd3mFyvoFGwcl
	 7fdkyXdk0mZ3bTy2UlhQyNX+iz0hKsfIPLnCXB9Gf2hyMwZdcLtlhGtzeGzNh7ci3p
	 /397mbkrFGnww==
Date: Sun, 04 May 2025 13:56:11 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v5 0/2] xen/domain: domain ID allocation
Message-ID: <20250504135544.730906-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 66f71772ddeb5757fde42b88c51bd87d1f9b7931
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The patch series adds new library calls for allocating domain IDs.
Patch 1 introduces new domid_{init,alloc,free} calls.
Patch 2 adjusts hardware domain ID treatment on Arm.

Link to v4: https://lore.kernel.org/xen-devel/20250422215322.521464-1-dmukh=
in@ford.com/
Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1=
799395667

Denis Mukhin (2):
  xen/domain: unify domain ID allocation
  xen/domain: adjust domain ID allocation for Arm

 xen/arch/arm/dom0less-build.c | 17 ++++----
 xen/arch/arm/domain_build.c   | 17 +++++---
 xen/arch/arm/setup.c          |  2 +
 xen/arch/x86/setup.c          | 13 +++++--
 xen/common/domain.c           | 73 +++++++++++++++++++++++++++++++++++
 xen/common/domctl.c           | 41 ++------------------
 xen/include/xen/domain.h      |  4 ++
 7 files changed, 112 insertions(+), 55 deletions(-)

--=20
2.34.1



