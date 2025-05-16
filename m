Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A46AB93E5
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 04:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986161.1371809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFkRP-0002gw-RP; Fri, 16 May 2025 02:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986161.1371809; Fri, 16 May 2025 02:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFkRP-0002fE-Ob; Fri, 16 May 2025 02:04:51 +0000
Received: by outflank-mailman (input) for mailman id 986161;
 Fri, 16 May 2025 02:04:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=07xk=YA=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uFkRN-0002f4-II
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 02:04:50 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 246eee67-31fa-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 04:04:47 +0200 (CEST)
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
X-Inumbo-ID: 246eee67-31fa-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747361086; x=1747620286;
	bh=ujB9BJYsKZ+Zv1s7n6SYafFdRfwsB3dYGvVFgIhtplQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=YcTazPrTvtsP02h07/3srkl8/7rYWk7zqjZL5oE+kdBMTVWxBTVp4kHZ159slQ7hm
	 9WsDbry/sIrc1Ql7D6yEQCGE9h9RO/KO2Bx/yI+87a0Okyu0kdGTU6Hn2QC1rxfucr
	 CLqAamYhjkf51VQeKSNhsO1aCETOLYRaHw+D7uDhiWQdBcxc+166U5ltwHDWFkfYoa
	 t9m6rv3+A7oKPyaafo7JfykhDQuwyILUVTBzMoQQfBLcrhhuuy7la3qJ/nEQn/V1Rs
	 O45sCercVEIyQfgKAKt4S91IJ4tIZ0s6p4cgRENlxC5D334x8o8BiLOhi7yEeRb7i2
	 Y2ReeFtsgviEQ==
Date: Fri, 16 May 2025 02:04:42 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v6 0/2] xen/domain: domain ID allocation
Message-ID: <20250516020434.1145337-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 5fd36bd739f417e13c2f893dd30086a26f18b27e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The patch series adds new library calls for allocating domain IDs.
Patch 1 introduces new domid_{init,alloc,free} calls.
Patch 2 adjusts hardware domain ID treatment on Arm.

Link to v5: https://lore.kernel.org/xen-devel/20250504135544.730906-1-dmukh=
in@ford.com/
Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1=
820251194

Denis Mukhin (2):
  xen/domain: unify domain ID allocation
  xen/domain: adjust domain ID allocation for Arm

 xen/arch/arm/domain_build.c             | 17 ++++--
 xen/arch/arm/setup.c                    |  2 +
 xen/arch/x86/setup.c                    | 13 +++--
 xen/common/device-tree/dom0less-build.c | 17 +++---
 xen/common/domain.c                     | 73 +++++++++++++++++++++++++
 xen/common/domctl.c                     | 41 ++------------
 xen/include/xen/domain.h                |  4 ++
 7 files changed, 112 insertions(+), 55 deletions(-)

--=20
2.34.1



