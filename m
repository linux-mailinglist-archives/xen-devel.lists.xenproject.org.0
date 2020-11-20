Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D012BA67F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 10:49:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31834.62566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg32Q-0005Bb-Kz; Fri, 20 Nov 2020 09:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31834.62566; Fri, 20 Nov 2020 09:49:06 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg32Q-0005Ax-EU; Fri, 20 Nov 2020 09:49:06 +0000
Received: by outflank-mailman (input) for mailman id 31834;
 Fri, 20 Nov 2020 09:49:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kg32O-0005AQ-Se
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 09:49:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg32N-0002aT-F5; Fri, 20 Nov 2020 09:49:03 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg32N-0003d1-3k; Fri, 20 Nov 2020 09:49:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg32O-0005AQ-Se
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 09:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=Mj4u5ITXwce574pXi1ANbw3qWtzS9xrY/6iHBRtpIyQ=; b=WWI1ucgvZ2HYijG6O8TgKHrHVd
	0zF5rrxTRrQ3T6HEra7Es5aEB+e6RuqgYRm3xmPMTlPxR/7g/gSsICeRFkDh48nP1guhhpsmiMK5/
	k44MAWmusNsYgO9rVDMqYiXclaS03jaWFC7/KjV965B8uaCv6gQ89ZeXVVxhmB7j0US4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg32N-0002aT-F5; Fri, 20 Nov 2020 09:49:03 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg32N-0003d1-3k; Fri, 20 Nov 2020 09:49:03 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 00/12] viridian: add support for ExProcessorMasks
Date: Fri, 20 Nov 2020 09:48:48 +0000
Message-Id: <20201120094900.1489-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Paul Durrant (12):
  viridian: don't blindly write to 32-bit registers is 'mode' is invalid
  viridian: move flush hypercall implementation into separate function
  viridian: move IPI hypercall implementation into separate function
  viridian: introduce a per-cpu hypercall_vpmask and accessor
    functions...
  viridian: use hypercall_vpmask in hvcall_ipi()
  viridian: use softirq batching in hvcall_ipi()
  xen/include: import sizeof_field() macro from Linux stddef.h
  viridian: add ExProcessorMasks variants of the flush hypercalls
  viridian: add ExProcessorMasks variant of the IPI hypercall
  viridian: log initial invocation of each type of hypercall
  viridian: add a new '_HVMPV_ex_processor_masks' bit into
    HVM_PARAM_VIRIDIAN...
  xl / libxl: add 'ex_processor_mask' into
    'libxl_viridian_enlightenment'

 docs/man/xl.cfg.5.pod.in             |   8 +
 tools/include/libxl.h                |   7 +
 tools/libs/light/libxl_types.idl     |   1 +
 tools/libs/light/libxl_x86.c         |   3 +
 xen/arch/x86/hvm/viridian/viridian.c | 601 +++++++++++++++++++++------
 xen/include/asm-x86/hvm/viridian.h   |  10 +
 xen/include/public/hvm/params.h      |   7 +-
 xen/include/xen/compiler.h           |   8 +
 8 files changed, 522 insertions(+), 123 deletions(-)
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
-- 
2.20.1


