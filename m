Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E6269B697
	for <lists+xen-devel@lfdr.de>; Sat, 18 Feb 2023 01:08:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497382.768349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTAlV-0004C7-S5; Sat, 18 Feb 2023 00:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497382.768349; Sat, 18 Feb 2023 00:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTAlV-00049q-PL; Sat, 18 Feb 2023 00:07:45 +0000
Received: by outflank-mailman (input) for mailman id 497382;
 Sat, 18 Feb 2023 00:07:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kEmr=6O=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pTAlT-00049k-FT
 for xen-devel@lists.xenproject.org; Sat, 18 Feb 2023 00:07:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41e6a6f7-af20-11ed-93b5-47a8fe42b414;
 Sat, 18 Feb 2023 01:07:40 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 506D66209D;
 Sat, 18 Feb 2023 00:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCEAC433D2;
 Sat, 18 Feb 2023 00:07:37 +0000 (UTC)
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
X-Inumbo-ID: 41e6a6f7-af20-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676678858;
	bh=dtcsD15OQKDU2cBT/fXtKtZyqSxl6TGj3qAeIGgxHN8=;
	h=Date:From:To:cc:Subject:From;
	b=GVy6S6kkEGUxjG6EraPkou7JAqRi86/SmwXr/F16gq2TxPk5PN0URDaqVAxGPsQB4
	 FhhZKboi6PgF1KzgTowwgFgrfOIbwo/LacuA0mQCkEpwS4fgdoQmD6tXJQ+EuagMar
	 WsA/tyFs2U486GTNkDqKboQqUvSTO6ivBdJv6Dk1+3N4Z51GImLMs+q0w9zjEMVaPr
	 FhCo4YqjxbWI/+YBzuSx85+x0/mqUPlUDnj5P4FT4mxqzn5K8ocfLMHsXy1WR9cIP+
	 cMq0oZna8miXKwyZNAsALS4Zmh+vO0zMSvtWgqYkuj7RhqKQ6g0ZYy5N9yxGQhkBsH
	 jL4jGmmdVc5NQ==
Date: Fri, 17 Feb 2023 16:07:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, cardoe@cardoe.com, michal.orzel@amd.com
Subject: [PATCH v3 0/3] automation: add arm32 xl domU creation test
Message-ID: <alpine.DEB.2.22.394.2302171606480.2127160@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This patch series add a domU creation test based on xl for arm32. To do
that, it reuses the existing arm32 dom0 test, and also reuses the Yocto
qemuarm build output.

Pipeline (with reduced amount of jobs):
https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/781740574

Cheers,

Stefano

Stefano Stabellini (3):
      automation: move yocto jobs to build stage
      automation: add binaries/ to artifacts for Yocto arm32 job
      automation: expand arm32 dom0 test adding xl domain creation

 automation/build/yocto/build-yocto.sh       | 16 +++++++++
 automation/gitlab-ci/build.yaml             | 53 +++++++++++++++++++++++++++
 automation/gitlab-ci/test.yaml              | 56 ++---------------------------
 automation/scripts/qemu-smoke-dom0-arm32.sh | 52 ++++++++++++++++++++-------
 4 files changed, 110 insertions(+), 67 deletions(-)

