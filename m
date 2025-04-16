Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F883A8AFBC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 07:32:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954991.1348851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4vNu-0003vL-9E; Wed, 16 Apr 2025 05:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954991.1348851; Wed, 16 Apr 2025 05:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4vNu-0003sp-6U; Wed, 16 Apr 2025 05:32:30 +0000
Received: by outflank-mailman (input) for mailman id 954991;
 Wed, 16 Apr 2025 05:32:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1z0E=XC=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u4vNr-0003si-N0
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 05:32:29 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d72c335-1a84-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 07:32:25 +0200 (CEST)
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
X-Inumbo-ID: 2d72c335-1a84-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=y5pwmtbmyrepzds2fhnq3xofty.protonmail; t=1744781543; x=1745040743;
	bh=Cl19Hi3IFFMPgkIlqHW/5V+Sd1+ktwIMSAGxCgjwL4E=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=WyMS+CYKB4hsX4U/d+L4aNc0Ef4SDvZKt1kZwz7lg53vNKaEN9+OEmdDVTUXnTcg3
	 6pt4tnnQxarQAYSMUtdLMNMe2M9hCqb7XAFyEAHp2dijcQtt59lESn0HfIo5qlf+zI
	 PfQ5YjZ0ahn+hsM/XJOrp+BSnUYy20IzliGCYkfO6MEvW7rCnMeuU1FsC9ZXcqUqKG
	 Kfgw84hyqRjlhoFt8OeMiwwQQdR19b3BN0Jqheu/j7nnXYMIbDJJL+2wc7Yn9Unw8B
	 hQaRKla5lYpqVqGp3Q/nCpnzheBZwjBXixNtj/qHAE8mCuvFwI93XgAWsRJlgVULlt
	 7VBREqb0+0SWQ==
Date: Wed, 16 Apr 2025 05:32:19 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, cardoe@cardoe.com, marmarek@invisiblethingslab.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 0/4] CI: updates to XTF CI runners
Message-ID: <20250416053213.921444-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 39587ba6ca00e6b5773b98b02cb603f1ba757e96
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

CI run: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/17704=
37024

Denis Mukhin (4):
  CI: unify x86 XTF test runner
  CI: switch x86 EFI smoke test runner to qemu-xtf.sh
  CI: switch arm64 XTF test runner to qemu-xtf.sh
  CI: add argo x86 XTF test

 automation/gitlab-ci/test.yaml                |  23 ++-
 automation/scripts/.gitignore                 |   9 ++
 .../scripts/include/configs/xtf-arm64-config  |   2 +
 .../scripts/include/configs/xtf-x86-64-config |   0
 .../include/configs/xtf-x86-64-efi-config     |   0
 automation/scripts/include/xtf-arm64          |  81 ++++++++++
 automation/scripts/include/xtf-runner         | 141 ++++++++++++++++++
 automation/scripts/include/xtf-x86-64         |  31 ++++
 automation/scripts/include/xtf-x86-64-efi     |  52 +++++++
 automation/scripts/qemu-smoke-x86-64-efi.sh   |  43 ------
 automation/scripts/qemu-smoke-x86-64.sh       |  26 ----
 automation/scripts/qemu-xtf-dom0less-arm64.sh |  68 ---------
 automation/scripts/qemu-xtf.sh                |  26 ++++
 13 files changed, 358 insertions(+), 144 deletions(-)
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



