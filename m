Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 053918C5E10
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 01:16:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721832.1125509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s71N0-0007Yt-OK; Tue, 14 May 2024 23:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721832.1125509; Tue, 14 May 2024 23:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s71N0-0007Wl-LM; Tue, 14 May 2024 23:15:42 +0000
Received: by outflank-mailman (input) for mailman id 721832;
 Tue, 14 May 2024 23:15:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o5lq=MR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s71My-0007Wf-Ry
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 23:15:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0334487-1247-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 01:15:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2149061354;
 Tue, 14 May 2024 23:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4537FC2BD10;
 Tue, 14 May 2024 23:15:36 +0000 (UTC)
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
X-Inumbo-ID: e0334487-1247-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715728537;
	bh=cknac0lzprvjGuU+wJs9zjIFW4bKs7DnewDXXFJb3QY=;
	h=Date:From:To:cc:Subject:From;
	b=hZ9dRbBaeFtCayr8f8fEauC7EV/6qvvyFp+KajEZKF++thQHKTAalAUwLzIH3a+UK
	 UKC93DFyXUTl1brfrIH4SZNGULhclb7HBA+LB3GCthH4On292ASiyTN+9rBZna1/jk
	 p0PTshEj/VcH0gcBncGCtPiFdaABPOhZ5Tgk5bg9bvwy+BHnwHi3kb/t7+drb+bt3B
	 G2UQ+0YNg6ZaI7o7wDBpPdkowe2uzRn6VhO4bgsnseaMNT8S8SJTf8GYj+7D5K6qp0
	 PYFGhaM4zEWQBbx4zo13oJiNXtPkqNuygwB4xa8SiEBGzzbQsfR+KTTICPOkjnxp4T
	 sUPngWk+L3LPg==
Date: Tue, 14 May 2024 16:15:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>, 
    Michal Orzel <michal.orzel@amd.com>, roberto.bagnara@bugseng.com, 
    consulting@bugseng.com
Subject: [PATCH] docs/misra: add D4.12
Message-ID: <alpine.DEB.2.22.394.2405141611170.2544314@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Add D4.12 with the same explanation as the rules of the R21 series.
D4.12 refers to the standard library memory allocation functions and
similar third party libraries with memory allocation functions. It
doesn't refer to the in-tree implementation we have in Xen which is
subject to MISRA C rules and MISRA C scanning.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 80e5e972ad..bc8506add4 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -76,6 +76,11 @@ maintainers if you want to suggest a change.
        considered libraries from MISRA C point of view as they are
        imported in source form)
 
+   * - `Dir 4.12 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_12.c>`_
+     - Required
+     - Dynamic memory allocation shall not be used
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
    * - `Dir 4.14 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_14.c>`_
      - Required
      - The validity of values received from external sources shall be

