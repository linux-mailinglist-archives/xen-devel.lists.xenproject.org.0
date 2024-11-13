Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAC39C6A79
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 09:19:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835089.1250930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB8am-0002LF-3L; Wed, 13 Nov 2024 08:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835089.1250930; Wed, 13 Nov 2024 08:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB8am-0002Iz-0X; Wed, 13 Nov 2024 08:19:12 +0000
Received: by outflank-mailman (input) for mailman id 835089;
 Wed, 13 Nov 2024 08:19:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZFwE=SI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1tB8ak-00024i-7o
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 08:19:10 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f27d9fcb-a197-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 09:19:05 +0100 (CET)
Received: from truciolo.bugseng.com (unknown [37.161.56.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 1A0774EE073E;
 Wed, 13 Nov 2024 09:19:02 +0100 (CET)
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
X-Inumbo-ID: f27d9fcb-a197-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE2Mi41NS4xMzEuNDciLCJoZWxvIjoic3VwcG9ydC5idWdzZW5nLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImYyN2Q5ZmNiLWExOTctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDg1OTQ1LjU4NjgyMiwic2VuZGVyIjoiZmVkZXJpY28uc2VyYWZpbmlAYnVnc2VuZy5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1731485944; bh=EvP0HNiBNaVaG33JJDInJkP1K7JRcCSVMBcL1T7SDQ4=;
	h=From:To:Cc:Subject:Date:From;
	b=S/LwYspHN7TKNvs+kHR7g5M9dLlwPy+Su6K3hAZxG5tsgEkWKj/Q65CAyPKjajlGo
	 kUbukpwVxrItf/BbV3cvKcVTIvlD76Y+v8aZWHTjcWHe1XpxcDcY+6fY8ADelJQ+7b
	 ZFfuzFn/IE3MGqrK+z3WyfeIsjIw+dxQ2teXxBuOfQmX/L2F0wfyT1h+HtTXxoLSIA
	 01XM2ak8mG1s+7pWVD1IN6ryf1QtRJ6KOpCSAGBuhHHppo7IKfS1TvGtifyiGiJl4I
	 Hp2nbSSTMtTotz0kWpg08rmBCHbWyuwN86Cr3w/OXGG3OZxWlZaBjohpGpFTLGcHDj
	 QbPtHyNCZAaQQ==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 0/3] x86: address violations of MISRA C Rule 16.3
Date: Wed, 13 Nov 2024 09:17:25 +0100
Message-ID: <cover.1731485149.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define pseudo keyword fallthrough for the x86 emulator,
use it and tag the rule as clean.

Federico Serafini (3):
  x86/emul: auxiliary definition of pseudo keyword fallthrough
  x86/emul: use pseudo keyword fallthrough
  automation/eclair: tag Rule 16.3 as clean

 automation/eclair_analysis/ECLAIR/tagging.ecl |  3 ++-
 tools/tests/x86_emulator/x86-emulate.h        | 10 ++++++++++
 xen/arch/x86/x86_emulate/decode.c             |  6 ++++--
 xen/arch/x86/x86_emulate/x86_emulate.c        |  2 ++
 4 files changed, 18 insertions(+), 3 deletions(-)

-- 
2.43.0


