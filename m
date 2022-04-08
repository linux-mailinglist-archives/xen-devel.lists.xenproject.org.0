Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4513F4F8A84
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 02:10:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301062.513716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nccD5-0003NO-3b; Fri, 08 Apr 2022 00:10:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301062.513716; Fri, 08 Apr 2022 00:10:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nccD5-0003LU-08; Fri, 08 Apr 2022 00:10:43 +0000
Received: by outflank-mailman (input) for mailman id 301062;
 Fri, 08 Apr 2022 00:10:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5u+K=US=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nccD3-0003LO-Vf
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 00:10:41 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 530072a6-b6d0-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 02:10:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C6AFDB829AF;
 Fri,  8 Apr 2022 00:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27795C385A4;
 Fri,  8 Apr 2022 00:10:38 +0000 (UTC)
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
X-Inumbo-ID: 530072a6-b6d0-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649376638;
	bh=mKuPJUxAnDUNxszfqdZ+hoE5YPUItakxxFDr0vIqiMw=;
	h=Date:From:To:cc:Subject:From;
	b=usUkFlMgkV/y8OGo9a2E425NttgYS791eHy4Z08whLj6oR4MfUoFcr9AXL9pOvbj0
	 pYdja/UyKX0UO4TtwyplE7VV+r5nghbliqXclJZnDTHFbKpcrF/kz+p080cbHHEUks
	 rSQK6a/ONgmns5aRoVkHcN4HL4E7so0HRr0ulZ4ABJk1zOm5z5WW9x1teXXtGO2Ztx
	 DBRsKIm0xBa5asU17zT5enifQ9dqnPG0sOMCk5A0vCrUHH/BBBn+ikcTbmLynpTCjS
	 n3ncDbyiL5xgshcEmk7PacyEv0GQsDGKHlHMEnF5NSUq94UN/nW7Sks4YuV3HWhCyk
	 PsrxVWwJT3zIw==
Date: Thu, 7 Apr 2022 17:10:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, julien@xen.org, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org
Subject: [PATCH v3] SUPPORT.md: add Dom0less as Supported
Message-ID: <alpine.DEB.2.22.394.2204071706470.2910984@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Add Dom0less to SUPPORT.md to clarify its support status. The feature is
mature enough and small enough to make it security supported.

Clarify that dom0less DomUs memory is not scrubbed at boot when
bootscrub=on or bootscrub=off are passed as Xen command line parameters,
and no XSAs will be issued for that.

Also see XSA-372: 371347c5b64da and fd5dc41ceaed.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v3:
- improve commit messahe
- improve SUPPORT.md statement
- add Bertrand's reviewed-by

Changes in v2:
- clarify memory scrubbing
---

diff --git a/SUPPORT.md b/SUPPORT.md
index 32fb0aa8de..088dda9561 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -882,6 +882,17 @@ OVMF firmware implements the UEFI boot protocol.
 
     Status, qemu-xen: Supported
 
+## Dom0less
+
+Guest creation from the hypervisor at boot without Dom0 intervention.
+
+    Status, ARM: Supported
+
+Memory of dom0less DomUs is not scrubbed at boot when bootscrub=on or
+bootscrub=off are passed as Xen command line parameters. (Memory should
+be scrubbed with bootscrub=idle.) No XSAs will be issues due to
+unscrubbed memory.
+
 # Format and definitions
 
 This file contains prose, and machine-readable fragments.

