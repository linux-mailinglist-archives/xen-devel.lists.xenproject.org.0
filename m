Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC308C61C2
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 09:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721954.1125689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s799r-0004r1-IK; Wed, 15 May 2024 07:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721954.1125689; Wed, 15 May 2024 07:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s799r-0004nq-Eu; Wed, 15 May 2024 07:34:39 +0000
Received: by outflank-mailman (input) for mailman id 721954;
 Wed, 15 May 2024 07:34:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=opSn=MS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1s799p-0004ka-UU
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 07:34:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9493c0c2-128d-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 09:34:36 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.202])
 by support.bugseng.com (Postfix) with ESMTPSA id 83BF24EE0738;
 Wed, 15 May 2024 09:34:35 +0200 (CEST)
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
X-Inumbo-ID: 9493c0c2-128d-11ef-b4bb-af5377834399
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 0/4] address violations of MISRA C Rule 20.7
Date: Wed, 15 May 2024 09:34:29 +0200
Message-Id: <cover.1715757982.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

this series aims to refactor some macros that cause violations of MISRA C Rule
20.7 ("Expressions resulting from the expansion of macro parameters shall be
enclosed in parentheses"). All the macros touched by these patches are in some
way involved in violations, and the strategy adopted to bring them into
compliance is to add parentheses around macro arguments where needed.

Nicola Vetrini (4):
  x86/vpmu: address violations of MISRA C Rule 20.7
  x86/hvm: address violations of MISRA C Rule 20.7
  x86_64/uaccess: address violations of MISRA C Rule 20.7
  x86_64/cpu_idle: address violations of MISRA C Rule 20.7

 xen/arch/x86/cpu/vpmu_amd.c               | 4 ++--
 xen/arch/x86/hvm/mtrr.c                   | 2 +-
 xen/arch/x86/hvm/rtc.c                    | 2 +-
 xen/arch/x86/include/asm/hvm/save.h       | 2 +-
 xen/arch/x86/include/asm/x86_64/uaccess.h | 7 ++++---
 xen/arch/x86/x86_64/cpu_idle.c            | 2 +-
 6 files changed, 10 insertions(+), 9 deletions(-)

-- 
2.34.1

