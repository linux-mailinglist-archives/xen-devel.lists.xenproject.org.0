Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97679AE5825
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 01:47:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022858.1398718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTqri-0000oX-EZ; Mon, 23 Jun 2025 23:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022858.1398718; Mon, 23 Jun 2025 23:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTqri-0000lQ-Ba; Mon, 23 Jun 2025 23:46:18 +0000
Received: by outflank-mailman (input) for mailman id 1022858;
 Mon, 23 Jun 2025 23:46:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Rx=ZG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uTqrg-0000lK-FZ
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 23:46:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37d401bc-508c-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 01:46:02 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 926265C5D54;
 Mon, 23 Jun 2025 23:43:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB553C4CEEA;
 Mon, 23 Jun 2025 23:45:58 +0000 (UTC)
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
X-Inumbo-ID: 37d401bc-508c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750722359;
	bh=3BTFfLfGn5OuY5t/PSSuT86s2TgeHkTuuV4slV83vyY=;
	h=Date:From:To:cc:Subject:From;
	b=l7B4N3fC+ibv8i3i9b3PudMM7ok7YOSv8xLQYG6WKUWjZiEEy+jIJnHYveKHKslkv
	 4cgwwIuptjvcDaI1spoFYxhEtP68/w8/xPQrpj1S4qu4cZbhG2erkYDRhkjzZXd+ns
	 voc/eHXpGNRSuAdyMF+3r44cHuAjQYbrNMgExJJGjVly1q95Cv63KSgbvANHxOVny2
	 jm8Nu/T3nhDYLdRKREyYwtkXaheqlZKUWLBzmltyvulghM8/cbakwfXo+eNVa3QR/3
	 y0mDa3NUtCLxJY37U+/w97Rx2KIm+df25CgHZuCZqdQsDQK2gOmb8L4HTRu+t+QdoX
	 zuRIla2ZAYYyA==
Date: Mon, 23 Jun 2025 16:45:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, michal.orzel@amd.com, 
    jbeulich@suse.com, julien@xen.org, roger.pau@citrix.com, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] docs/misra/rules.rst: allow string literals with memcmp
Message-ID: <alpine.DEB.2.22.394.2506231642450.862517@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Rule 21.16 is about the types of arguments allowed for memcpy. Add
string literals to the allow-list under specific conditions.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index e1c26030e8..3e014a6298 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -813,7 +813,9 @@ maintainers if you want to suggest a change.
        shall point to either a pointer type, an essentially signed type,
        an essentially unsigned type, an essentially Boolean type or an
        essentially enum type
-     - void* arguments are allowed
+     - void* arguments are allowed. string literal arguments are allowed
+       when the last argument passed for the comparison is less or equal
+       to the size of the string.
 
    * - `Rule 21.17 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_17.c>`_
      - Mandatory

