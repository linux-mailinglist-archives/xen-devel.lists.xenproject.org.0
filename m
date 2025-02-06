Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 049A0A29EDF
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 03:37:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882494.1292622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfrlo-0008RN-Fv; Thu, 06 Feb 2025 02:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882494.1292622; Thu, 06 Feb 2025 02:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfrlo-0008Oq-Cm; Thu, 06 Feb 2025 02:37:36 +0000
Received: by outflank-mailman (input) for mailman id 882494;
 Thu, 06 Feb 2025 02:37:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ypua=U5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tfrlm-0008Ok-Fc
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 02:37:34 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 509d5fea-e433-11ef-99a4-01e77a169b0f;
 Thu, 06 Feb 2025 03:37:32 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4ACA5A43AF7;
 Thu,  6 Feb 2025 02:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BEBC4CED1;
 Thu,  6 Feb 2025 02:37:29 +0000 (UTC)
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
X-Inumbo-ID: 509d5fea-e433-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738809451;
	bh=z2t8/rGB5LhXZr7gUy35vvLUHzYO1nT7xCsUFMCLgGw=;
	h=Date:From:To:cc:Subject:From;
	b=Jcew2h1VwXtEMjZu+s0TAzELBKCcvc1DxC3L4Zs9lVVOvU3ZvLUcitglkFJS/TKWz
	 Cx3k85e1ORxAMCqYlk7/xRv7LuFkzdIWcQ9/ekymOh19mmqXdKVLyOnffjbi9w1Nz1
	 +JuHcJimc1o5GFqYL1BHSNI+9MGUOH42shibJMs5zuUKUeNid03z+OmLqaAI2j6pKW
	 zSiupFXHT7DYfk90HRxBYkozkB5xTctNA2dd/fcGsPTb193S70NrHj7kEW3sFSjZOP
	 27SqhkFEOUpRV2vv2PH0EvyBbX5X+QhlPj8BQL7n0dI8r5MADPpnogycZNNXV4P8Bx
	 ZA9qwis4J8TBQ==
Date: Wed, 5 Feb 2025 18:37:23 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, cardoe@cardoe.com, alejandro.vallejo@cloud.com, 
    andrew.cooper3@citrix.com, anthony.perard@vates.tech, michal.orzel@amd.com, 
    jbeulich@suse.com, julien@xen.org, roger.pau@citrix.com, 
    bertrand.marquis@arm.com
Subject: [PATCH] automation: enable UBSAN for debug tests
Message-ID: <alpine.DEB.2.22.394.2502051756210.619090@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

automation: enable UBSAN for debug tests

Enable CONFIG_UBSAN and CONFIG_UBSAN_FATAL for the ARM64 and x86_64
build jobs, with debug enabled, which are later used for Xen tests on
QEMU and/or real hardware.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
successful pipeline: https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1657961377

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index bc4a8a5ad2..fb55d4ce55 100644
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
@@ -419,6 +421,9 @@ alpine-3.18-gcc-debug-arm64:
   extends: .gcc-arm64-build-debug
   variables:
     CONTAINER: alpine:3.18-arm64v8
+    EXTRA_XEN_CONFIG: |
+      CONFIG_UBSAN=y
+      CONFIG_UBSAN_FATAL=y
 
 alpine-3.18-gcc-arm64-randconfig:
   extends: .gcc-arm64-build

