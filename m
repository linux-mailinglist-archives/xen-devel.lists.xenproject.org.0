Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A579BE1B1
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 10:06:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830619.1245676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8byr-00020O-Pf; Wed, 06 Nov 2024 09:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830619.1245676; Wed, 06 Nov 2024 09:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8byr-0001yh-LQ; Wed, 06 Nov 2024 09:05:37 +0000
Received: by outflank-mailman (input) for mailman id 830619;
 Wed, 06 Nov 2024 09:05:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w0tz=SB=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1t8byp-0001ya-JG
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 09:05:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 469904d1-9c1e-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 10:05:32 +0100 (CET)
Received: from truciolo.bugseng.com (unknown [78.210.84.32])
 by support.bugseng.com (Postfix) with ESMTPSA id 1D1814EE0753;
 Wed,  6 Nov 2024 10:05:29 +0100 (CET)
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
X-Inumbo-ID: 469904d1-9c1e-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE2Mi41NS4xMzEuNDciLCJoZWxvIjoic3VwcG9ydC5idWdzZW5nLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjQ2OTkwNGQxLTljMWUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODgzOTMyLjI1MTA5Niwic2VuZGVyIjoiZmVkZXJpY28uc2VyYWZpbmlAYnVnc2VuZy5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1730883931; bh=FLjvsT56wnZdUW9ihgWebbU/BHeGLKqz6NMdyDugDdE=;
	h=From:To:Cc:Subject:Date:From;
	b=LcsuhhAFUSLcTtTjoF/pqdEmA4ewb18GZ6GxFQyjUNGI6r22GUxDUIEM3aTTBG2x1
	 RUYA9cLpGZ8gkU8uiGUqpPWJooIQ3v5oXdA5hnXYkdVJ1+RZxPbPmbe1VT/TtHyP8Y
	 lceZQpbI/YKm4BKPM1wY73/l9Y35H6iwv/qn5gkjpLmrMUckaf26+4jEL53z5m2gqo
	 PwpLHvwWCHrebBR2iGpMaw9U9a6oNtQS7quiTpvmMbE6AQq5TGfV4IF6/L6ABhS9BX
	 RrLW+8kfwgJUnNIm1vOCa+xcMvxAfea4DggKlg9J4NuVf7Hjj3fV9Jq0A8C7KkK4gL
	 JPcxLtcYdj6Aw==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 0/3] x86: address violations of MISRA C Rule 16.3
Date: Wed,  6 Nov 2024 10:04:44 +0100
Message-ID: <cover.1730880832.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define pseudo keyword fallthrough for the x86 emulator,
use it and tag the rule as clean.

Federico Serafini (3):
  x86/emul: define pseudo keyword fallthrough
  x86/emul: use pseudo keyword fallthrough
  automation/eclair: tag Rule 16.3 as clean

 automation/eclair_analysis/ECLAIR/tagging.ecl |  3 ++-
 xen/arch/x86/x86_emulate/decode.c             |  6 ++++--
 xen/arch/x86/x86_emulate/x86_emulate.c        |  2 ++
 xen/arch/x86/x86_emulate/x86_emulate.h        | 10 ++++++++++
 4 files changed, 18 insertions(+), 3 deletions(-)

-- 
2.43.0


