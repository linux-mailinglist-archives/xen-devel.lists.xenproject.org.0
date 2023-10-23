Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E767D2DB0
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 11:10:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621105.967180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quqwn-0003vU-Qn; Mon, 23 Oct 2023 09:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621105.967180; Mon, 23 Oct 2023 09:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quqwn-0003s2-Ny; Mon, 23 Oct 2023 09:10:05 +0000
Received: by outflank-mailman (input) for mailman id 621105;
 Mon, 23 Oct 2023 09:10:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DOxK=GF=antgroup.com=houwenlong.hwl@srs-se1.protection.inumbo.net>)
 id 1quqwm-0003eK-GX
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 09:10:04 +0000
Received: from out0-196.mail.aliyun.com (out0-196.mail.aliyun.com
 [140.205.0.196]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef275a1a-7183-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 11:09:58 +0200 (CEST)
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com
 fp:SMTPD_---.V5pF1jV_1698052193) by smtp.aliyun-inc.com;
 Mon, 23 Oct 2023 17:09:54 +0800
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
X-Inumbo-ID: ef275a1a-7183-11ee-9b0e-b553b5be7939
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047193;MF=houwenlong.hwl@antgroup.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---.V5pF1jV_1698052193;
From: "Hou Wenlong" <houwenlong.hwl@antgroup.com>
To: linux-kernel@vger.kernel.org
Cc: "Hou Wenlong" <houwenlong.hwl@antgroup.com>,
  "Andy Shevchenko" <andy@infradead.org>,
  "Borislav Petkov" <bp@alien8.de>,
  "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
  "Darren Hart" <dvhart@infradead.org>,
  "Dave Hansen" <dave.hansen@linux.intel.com>,
  "H. Peter Anvin" <hpa@zytor.com>,
  "Ingo Molnar" <mingo@redhat.com>,
  "Juergen Gross" <jgross@suse.com>,
   <platform-driver-x86@vger.kernel.org>,
  "Thomas Gleixner" <tglx@linutronix.de>,
   <x86@kernel.org>,
   <xen-devel@lists.xenproject.org>
Subject: [PATCH 0/2] x86/xen/pvh: Clean up stack canary setup in PVH entry
Date: Mon, 23 Oct 2023 17:09:37 +0800
Message-Id: <cover.1698051454.git.houwenlong.hwl@antgroup.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the stack canary setup in the PVH entry. For a 64-bit kernel,
use fixed_percpu_data to set up GSBASE. For a 32-bit kernel, set up the
%fs register explicitly.

Hou Wenlong (2):
  x86/xen/pvh: Set up percpu for stack canary in 32-bit kernel entry
  x86/xen/pvh: Use fixed_percpu_data to set up GS base

 arch/x86/platform/pvh/head.S | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)


base-commit: 50dcc2e0d62e3c4a54f39673c4dc3dcde7c74d52
--
2.31.1


