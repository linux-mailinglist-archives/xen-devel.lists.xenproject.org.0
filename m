Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3036972F5
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 01:59:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495666.766050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS67f-000354-EK; Wed, 15 Feb 2023 00:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495666.766050; Wed, 15 Feb 2023 00:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS67f-00031v-B3; Wed, 15 Feb 2023 00:58:11 +0000
Received: by outflank-mailman (input) for mailman id 495666;
 Wed, 15 Feb 2023 00:58:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HlLs=6L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pS67e-00031p-K0
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 00:58:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce73e1e3-accb-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 01:58:07 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 99F5061977;
 Wed, 15 Feb 2023 00:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6472DC433D2;
 Wed, 15 Feb 2023 00:58:04 +0000 (UTC)
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
X-Inumbo-ID: ce73e1e3-accb-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676422685;
	bh=M9v+Sl9WxzkeuAIOwj0pU9y97oaG3NE6VtqF22YIRJ8=;
	h=Date:From:To:cc:Subject:From;
	b=cc0NaZtyh72Ze1kR+wNFUNKEnYnU9tSOq2dwlbcisikKPFw8KvcGb47HF7FPWcnvp
	 P4ItM+g18uUl0pEbfeCHn4joChoieAf4P9jmaeNi9pzXJKa26ME3lEGjoNbvMgQzVJ
	 0KQl+xVoh3HaFBvuN9rBCrLG62T7Tv2hKPMjinAiYK6uPWjDK6gCP4+7eKDjORFXol
	 DREz1xe5bs7L2IxFDblGmmOvSrWeUldIPwEEDyB594GVO+t+OJLs+BxQpPFHFIDVoH
	 6nyvt9ICOPJbZSXQv866zbq7AWE5LnFTyk9BCiPLbshBfzMTNv8tOY5i5oZ2EC4QFn
	 bW4vgsm9fhL2Q==
Date: Tue, 14 Feb 2023 16:58:02 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, cardoe@cardoe.com, michal.orzel@amd.com
Subject: [PATCH 0/3] automation: add arm32 xl domU creation test
Message-ID: <alpine.DEB.2.22.394.2302141642520.2025117@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This patch series add a domU creation test based on xl for arm32. To do
that, it reuses the existing arm32 dom0 test, and also reuses the Yocto
qemuarm build output.

Pipeline (with reduced amount of jobs):
https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/777780349

Cheers,

Stefano

Stefano Stabellini (3):
      automation: move yocto jobs to build stage
      automation: add binaries/ to artifacts for Yocto jobs
      automation: expand arm32 dom0 test adding xl domain creation

 automation/build/yocto/build-yocto.sh       |  6 ++++
 automation/gitlab-ci/build.yaml             | 52 +++++++++++++++++++++++++++++
 automation/gitlab-ci/test.yaml              | 46 +------------------------
 automation/scripts/qemu-smoke-dom0-arm32.sh | 50 ++++++++++++++++++++-------
 4 files changed, 97 insertions(+), 57 deletions(-)

