Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A067C4DBC9A
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 02:47:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291307.494359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUfE1-0003Aq-C3; Thu, 17 Mar 2022 01:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291307.494359; Thu, 17 Mar 2022 01:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUfE1-00038E-8t; Thu, 17 Mar 2022 01:46:49 +0000
Received: by outflank-mailman (input) for mailman id 291307;
 Thu, 17 Mar 2022 01:46:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MbXJ=T4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nUfDz-000388-JV
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 01:46:47 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ad1d5db-a594-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 02:46:46 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 15347B81C9C;
 Thu, 17 Mar 2022 01:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53FFBC340E9;
 Thu, 17 Mar 2022 01:46:44 +0000 (UTC)
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
X-Inumbo-ID: 1ad1d5db-a594-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647481604;
	bh=57r/Ka2G2mfrlgt9RSWL2njmSxj73wQzOI4QDL2HYgE=;
	h=Date:From:To:cc:Subject:From;
	b=TS1GWOjYHePqTe/Uwy0Q6TBxPaJnRurtH7jthOtfoHtB3O0JPREOfGYvNh/KIUSes
	 XbM0qlNU2gzHxDAvGEpXmhcSgt8Tals9ZnlqMRaFaaTRsd0miHKOboYg9CPhcgWno1
	 vev13dce9wkxBX6J/2eojF5Gd7UH45zvFoOEo9ricygGFYThId7+2mhJ4KqwMmth4L
	 akXKgFhbAs7zfdfWjxAYpLVX/MLYjGoOicYNeX5dhRz8tWvm0Tso+W/lF0FFeVRsNs
	 J0380OvTeQRlqJUgY7Ux8HLJrBIDd2ZZIJv64gCS9qzpOog5ncuC8qrpZWF/IlpdHp
	 v/ir3LKCxbkcg==
Date: Wed, 16 Mar 2022 18:46:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, cardoe@cardoe.com, wl@xen.org, 
    andrew.cooper3@citrix.com, anthony.perard@citrix.com, 
    bertrand.marquis@arm.com
Subject: [PATCH v2 0/2] automation: qemu32 smoke test
Message-ID: <alpine.DEB.2.22.394.2203161843230.3497@ubuntu-linux-20-04-desktop>
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

 automation/gitlab-ci/build.yaml                    | 14 ++++-
 automation/gitlab-ci/test.yaml                     | 27 +++++++-
 automation/scripts/qemu-smoke-arm32.sh             | 72 ++++++++++++++++++++++
 ...arm64v8.dockerfile => 6.0.0-arm64v8.dockerfile} |  5 +-
 4 files changed, 112 insertions(+), 6 deletions(-)
 create mode 100755 automation/scripts/qemu-smoke-arm32.sh
 rename automation/tests-artifacts/qemu-system-aarch64/{5.2.0-arm64v8.dockerfile => 6.0.0-arm64v8.dockerfile} (95%)

