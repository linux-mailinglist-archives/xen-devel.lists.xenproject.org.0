Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8116987A7
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 23:09:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496245.766878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSPxn-0005UX-R1; Wed, 15 Feb 2023 22:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496245.766878; Wed, 15 Feb 2023 22:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSPxn-0005RC-OT; Wed, 15 Feb 2023 22:09:19 +0000
Received: by outflank-mailman (input) for mailman id 496245;
 Wed, 15 Feb 2023 22:09:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HlLs=6L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pSPxm-0005R2-SW
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 22:09:18 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62d24937-ad7d-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 23:09:16 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9C1E3B82374;
 Wed, 15 Feb 2023 22:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12F7C433EF;
 Wed, 15 Feb 2023 22:09:13 +0000 (UTC)
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
X-Inumbo-ID: 62d24937-ad7d-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676498954;
	bh=knuIhoDZUpESCednEs/ZWH3TXPZ5EU8rVUzhJNJg6Iw=;
	h=Date:From:To:cc:Subject:From;
	b=NILB23xEE4tdGkkz8mhfRDe35radJ2p47C1A7joAGmrvpZQ2h9Pf2/r902lFYZ5ag
	 wQhU10qnSnDpy/RiKi60HSf+o6MAMd+a9zZpq9UAy2H5lDQH0iYH4ck5HLy8UYxosA
	 7eQgZPa3wdUhukYo1YpUtIM41tPh4Jq9AcdOok6OeLBcEIQdUfaCfQ08iLEe5dT/uF
	 b8EqCu44M85GDqjoNKJgUh0iFYOYgSJrQzli8ydY7uX9dBj6Fh4FlmfAJQ4noDmfPg
	 U6GP8WyovXx+Skc7kmh6A2FlzIY0E4ILGXpwl7Z3SjqnUb2IQKXlq5rcBckdft9qWL
	 ukxIblDO7N5Mw==
Date: Wed, 15 Feb 2023 14:09:12 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, cardoe@cardoe.com, michal.orzel@amd.com
Subject: [PATCH v2 0/3] automation: add arm32 xl domU creation test
Message-ID: <alpine.DEB.2.22.394.2302151407130.2127160@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This patch series add a domU creation test based on xl for arm32. To do
that, it reuses the existing arm32 dom0 test, and also reuses the Yocto
qemuarm build output.

Pipeline (with reduced amount of jobs):
https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/779022452

Cheers,

Stefano

Stefano Stabellini (3):
      automation: move yocto jobs to build stage
      automation: add binaries/ to artifacts for Yocto arm32 job
      automation: expand arm32 dom0 test adding xl domain creation

 automation/build/yocto/build-yocto.sh       |  9 +++++
 automation/gitlab-ci/build.yaml             | 52 +++++++++++++++++++++++++++++
 automation/gitlab-ci/test.yaml              | 47 ++------------------------
 automation/scripts/qemu-smoke-dom0-arm32.sh | 50 ++++++++++++++++++++-------
 4 files changed, 101 insertions(+), 57 deletions(-)

