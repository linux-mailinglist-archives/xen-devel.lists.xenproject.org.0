Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3E3A97267
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 18:19:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963255.1354272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7GKj-0002Ry-KL; Tue, 22 Apr 2025 16:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963255.1354272; Tue, 22 Apr 2025 16:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7GKj-0002P9-HE; Tue, 22 Apr 2025 16:18:53 +0000
Received: by outflank-mailman (input) for mailman id 963255;
 Tue, 22 Apr 2025 16:18:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8D33=XI=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u7GKg-0002OS-VU
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 16:18:52 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78a47a94-1f95-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 18:18:48 +0200 (CEST)
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
X-Inumbo-ID: 78a47a94-1f95-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=wzhp7zypfvdudhwah4q4aokfcq.protonmail; t=1745338727; x=1745597927;
	bh=RxqPh/u5o+W0O92qKYtGYhL4kdEF/pStYpUPNgHfHDw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=NrEmbszwLDyQ7L623KzitNS/3qdugPMBex351I6Ye/2zqCcks5g4xnQNlbA+GFbX+
	 RBktgYuTHov+jAi9AX7ZRy5vqNUVsSnmKgukjG8Nq5yjYHeM+ULv6cT2GMr+3Fzf7w
	 qhuPbtnSfhOiBigDWSY25t7kumGLv8do/UBFYBjISgoHxPjwcY70jxG0Y3VDvnrDUC
	 Cbu8eL4i6TmysIUaNMDTrAkFW/NLGfYQZWX1MTf6fmVd2CniZeQjF/ooC8Yr8NfeXE
	 ULqQnwy2q8nyYuA8qaQiesfyXFcenbJ+/CiTlvkyC3ira1oCvCh6TidJ3MhqoDelhu
	 DDgkMZtbcd3KA==
Date: Tue, 22 Apr 2025 16:18:42 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, cardoe@cardoe.com, marmarek@invisiblethingslab.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 0/4] CI: updates to XTF CI runners
Message-ID: <20250422161819.2089738-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: a8ebc4fc85e2c8467449300be7bf36dfb54c3af2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The series started from adding new argo XTF CI job and ended up with updati=
ng
all XTF runners and related CI jobs.

It unifies the XTF runner scripts so that it is possible to use one script =
for
executing any XTF test under QEMU. That simplifies running XTFs locally and=
 in
CI.

Patch 1 reworks x86 XTF runner.
Patch 2 reworks x86 EFI XTF.
Patch 3 reworks Arm64 XTF runner.
Patch 4 adds new argo x86 XTF CI job.

CI run: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/17788=
12896

Denis Mukhin (4):
  CI: unify x86 XTF test runner
  CI: switch x86 EFI smoke test runner to qemu-xtf.sh
  CI: switch arm64 XTF test runner to qemu-xtf.sh
  CI: add argo x86 XTF test

 automation/gitlab-ci/test.yaml                |  23 ++-
 automation/scripts/.gitignore                 |   6 +
 .../scripts/include/configs/xtf-arm64-config  |   2 +
 .../scripts/include/configs/xtf-x86-64-config |   0
 .../include/configs/xtf-x86-64-efi-config     |   0
 automation/scripts/include/xtf-arm64          |  81 ++++++++++
 automation/scripts/include/xtf-runner         | 138 ++++++++++++++++++
 automation/scripts/include/xtf-x86-64         |  31 ++++
 automation/scripts/include/xtf-x86-64-efi     |  52 +++++++
 automation/scripts/qemu-smoke-x86-64-efi.sh   |  43 ------
 automation/scripts/qemu-smoke-x86-64.sh       |  26 ----
 automation/scripts/qemu-xtf-dom0less-arm64.sh |  68 ---------
 automation/scripts/qemu-xtf.sh                |  28 ++++
 13 files changed, 354 insertions(+), 144 deletions(-)
 create mode 100644 automation/scripts/.gitignore
 create mode 100644 automation/scripts/include/configs/xtf-arm64-config
 create mode 100644 automation/scripts/include/configs/xtf-x86-64-config
 create mode 100644 automation/scripts/include/configs/xtf-x86-64-efi-confi=
g
 create mode 100644 automation/scripts/include/xtf-arm64
 create mode 100644 automation/scripts/include/xtf-runner
 create mode 100644 automation/scripts/include/xtf-x86-64
 create mode 100644 automation/scripts/include/xtf-x86-64-efi
 delete mode 100755 automation/scripts/qemu-smoke-x86-64-efi.sh
 delete mode 100755 automation/scripts/qemu-smoke-x86-64.sh
 delete mode 100755 automation/scripts/qemu-xtf-dom0less-arm64.sh
 create mode 100755 automation/scripts/qemu-xtf.sh

--=20
2.34.1



