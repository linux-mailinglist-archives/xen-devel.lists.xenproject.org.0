Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DC8896006
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 01:23:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700244.1093073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrnRz-0005QY-1z; Tue, 02 Apr 2024 23:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700244.1093073; Tue, 02 Apr 2024 23:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrnRy-0005NZ-UW; Tue, 02 Apr 2024 23:21:54 +0000
Received: by outflank-mailman (input) for mailman id 700244;
 Tue, 02 Apr 2024 23:21:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fe4w=LH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rrnRw-0005NT-Sh
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 23:21:52 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c75e77e7-f147-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 01:21:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 61771CE1E5D;
 Tue,  2 Apr 2024 23:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACAB8C433C7;
 Tue,  2 Apr 2024 23:21:42 +0000 (UTC)
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
X-Inumbo-ID: c75e77e7-f147-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712100103;
	bh=CxiARtPXVyYs3sl9Wqk24XA1llUNiyPjEbjht2Ja6pw=;
	h=Date:From:To:cc:Subject:From;
	b=BDdy8vtPOCL2g9E8uhMEVXNGgL8gvIV5++zjj2LXjKp0bhjIaiJliWBdz7QV/gQLs
	 rWdMfitdIzvV0i4RZHADcaUzjEtAcQL2rADcAO4D6vLz0INF03ffwr9FfdY0Xh/Rq8
	 ioPFRg9z6m8svARslwghL3afvibwTrgqgWadW6lcbYaQWNi/o2YY3HtVgIfJp8tcM4
	 rM78d/GgUYtOhuUxvNwkzM0Sdu5a0gPZun2RaR0jsbsKYbSmOvFGZazPYYkiZfNZdr
	 ZoO15flEUbtbzwNB1prDxyu51IUhP2OoOk8xuF0am8ik4v5ynzjjjw7cYG/o5wsUOX
	 VCMOLzkuhjEqg==
Date: Tue, 2 Apr 2024 16:21:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>
Subject: [PATCH] docs/misra: add 13.6 to rules.rst
Message-ID: <alpine.DEB.2.22.394.2404021618030.2245130@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

As agreed during MISRA C meetings, add Rule 13.6 to rules.rst.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
There was a request to expand the scope to also include alignof and
typeof. Depending on whether the MISRA C scanners support it, and under
which rules violations will be listed, rules.rst will be updated
accordingly (either updating the notes section of 13.6 or adding a new
entry.)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 1e134ccebc..415b5b63c3 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -445,6 +445,12 @@ maintainers if you want to suggest a change.
      - Initializer lists shall not contain persistent side effects
      -
 
+   * - `Rule 13.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_13_06.c>`_
+     - Required
+     - The operand of the sizeof operator shall not contain any
+       expression which has potential side-effects
+     -
+
    * - `Rule 14.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_01.c>`_
      - Required
      - A loop counter shall not have essentially floating type

