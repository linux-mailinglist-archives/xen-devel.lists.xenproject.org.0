Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE037A28041
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 01:45:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881922.1292092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfTWa-0007oc-CY; Wed, 05 Feb 2025 00:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881922.1292092; Wed, 05 Feb 2025 00:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfTWa-0007mn-8o; Wed, 05 Feb 2025 00:44:16 +0000
Received: by outflank-mailman (input) for mailman id 881922;
 Wed, 05 Feb 2025 00:44:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hjWk=U4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tfTWY-0007mh-Mp
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 00:44:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50016ade-e35a-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 01:44:11 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7D4A65C53A4;
 Wed,  5 Feb 2025 00:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6206C4CEDF;
 Wed,  5 Feb 2025 00:44:07 +0000 (UTC)
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
X-Inumbo-ID: 50016ade-e35a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738716249;
	bh=YNyLUvkmWPItY5T3yyBGG3IQhTO99n/z+TiNPb5Ab5E=;
	h=Date:From:To:cc:Subject:From;
	b=avlS2S333H0BTdrD0aAFLqYgZ+GJ+j5T9qvk6MGXGP3ANckOU+jEITOvJJATECbKI
	 OOadXFDW91zQz2h+YakPhN6+qmaLmQbiieQgyx9nwkn2u3BwbZwqEGC5IG1p9e/NO7
	 P6/F4l4yjTBE9MJcq+xDnpOGVthpKCpVZ6Bm+uNUl6rpg0xttOrS7ceRIvP5Q9JttH
	 IB7dI1u1hqYUVdFgiopbP0VYY+QcbORgGcyEpRKUXZv2wUTT8jH5ypxvBtn1saY1eZ
	 7IAIVg4m7i3uTI9/STmOfUSJjsQrZwCkP+db/yXl0t0HVElaXHyuJQCn+NFDU9zbDG
	 lpkl2/QR6FsGg==
Date: Tue, 4 Feb 2025 16:44:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, michal.orzel@amd.com, jbeulich@suse.com, 
    julien@xen.org, roger.pau@citrix.com, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [RFC] enable UBSAN for automation tests
Message-ID: <alpine.DEB.2.22.394.2502041612070.9756@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

I would like to propose to enable the UBSAN config option in our Gitlab
pipelines. The attached patch (just for testing, do not commit) enables
UBSAN on the Xen build jobs used for most of the ARM and x86 tests. The
pipeline passes.

https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1656001157

Cheers,

Stefano

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index bc4a8a5ad2..92790648aa 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -333,6 +333,8 @@ alpine-3.18-gcc-debug:
       CONFIG_EXPERT=y
       CONFIG_UNSUPPORTED=y
       CONFIG_ARGO=y
+      CONFIG_UBSAN=y
+      CONFIG_UBSAN_FATAL=y
 
 debian-12-x86_64-gcc-debug:
   extends: .gcc-x86-64-build-debug
@@ -419,6 +421,11 @@ alpine-3.18-gcc-debug-arm64:
   extends: .gcc-arm64-build-debug
   variables:
     CONTAINER: alpine:3.18-arm64v8
+    EXTRA_XEN_CONFIG: |
+      CONFIG_EXPERT=y
+      CONFIG_UNSUPPORTED=y
+      CONFIG_UBSAN=y
+      CONFIG_UBSAN_FATAL=y
 
 alpine-3.18-gcc-arm64-randconfig:
   extends: .gcc-arm64-build

