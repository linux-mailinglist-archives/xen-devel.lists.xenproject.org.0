Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2984E47A9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 21:39:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293661.498954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWlHJ-00070B-Fr; Tue, 22 Mar 2022 20:38:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293661.498954; Tue, 22 Mar 2022 20:38:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWlHJ-0006yM-Cz; Tue, 22 Mar 2022 20:38:53 +0000
Received: by outflank-mailman (input) for mailman id 293661;
 Tue, 22 Mar 2022 20:38:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+E5=UB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nWlHH-0006yG-Vb
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 20:38:51 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 147c73b9-aa20-11ec-8fbc-03012f2f19d4;
 Tue, 22 Mar 2022 21:38:50 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 72E1BB81D70;
 Tue, 22 Mar 2022 20:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD184C340EC;
 Tue, 22 Mar 2022 20:38:47 +0000 (UTC)
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
X-Inumbo-ID: 147c73b9-aa20-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647981528;
	bh=ptYmmK7oSeN6t7zkKcFYae82czllhfj65kZFPx7eje4=;
	h=Date:From:To:cc:Subject:From;
	b=HX0HINJVWqmJgEXuArleH48dQ277zSRmiIQWFHgW8wQ9nH2OSPvLZhfETGa1OOCEU
	 MoaAiyi9cOcTqPI7ndEt7da0b6uP5Uq8CAQFU9cqgZpwKpmistz6U+ZkiZHdKpVqwT
	 x2IK8Q7JG1WtuUdG8znhSM6UTLFN8E9OgEy57nLDCiCm3OsQAFPqiUCVQDOuesUdFv
	 FyBuNODsd0jYra2TX4nWon/KRi+HQutRLSzp4ZduJJFxd0MA7vaNiSJpfzeQqaJ/5V
	 gVIinEYHnmXULeKo1PjVvzke0BiW+f4OKIfsR0+5ly30HUZ5JVSsoZ3cd4YgvTDW18
	 Q7D9GhilgRdrw==
Date: Tue, 22 Mar 2022 13:38:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, cardoe@cardoe.com, wl@xen.org, 
    andrew.cooper3@citrix.com, anthony.perard@citrix.com, 
    bertrand.marquis@arm.com
Subject: [PATCH v4 0/2] automation: qemu32 smoke test
Message-ID: <alpine.DEB.2.22.394.2203221337230.2910984@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This small series adds a simple Xen + Dom0 boot arm32 test to gitlab-ci
using QEMU, similar to the existing tests for arm64 and x86.

Cheers,

Stefano

Stefano Stabellini (2):
      gitlab-ci: add qemu-system-arm to the existing tests-artifacts container
      gitlab-ci: add an ARM32 qemu-based smoke test

 automation/gitlab-ci/build.yaml                    | 14 +++-
 automation/gitlab-ci/test.yaml                     | 27 +++++++-
 automation/scripts/qemu-smoke-arm32.sh             | 81 ++++++++++++++++++++++
 ...arm64v8.dockerfile => 6.0.0-arm64v8.dockerfile} |  5 +-
 4 files changed, 121 insertions(+), 6 deletions(-)
 create mode 100755 automation/scripts/qemu-smoke-arm32.sh
 rename automation/tests-artifacts/qemu-system-aarch64/{5.2.0-arm64v8.dockerfile => 6.0.0-arm64v8.dockerfile} (95%)

