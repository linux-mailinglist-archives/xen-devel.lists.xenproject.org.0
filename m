Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 532042CEA3E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 09:53:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44153.79169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6pm-0006N5-B7; Fri, 04 Dec 2020 08:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44153.79169; Fri, 04 Dec 2020 08:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6pm-0006Mi-7w; Fri, 04 Dec 2020 08:52:58 +0000
Received: by outflank-mailman (input) for mailman id 44153;
 Fri, 04 Dec 2020 08:52:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kl6pl-0006MW-Cw
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 08:52:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kl6pl-00048k-4A; Fri, 04 Dec 2020 08:52:57 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kl6pk-00081O-Ru; Fri, 04 Dec 2020 08:52:57 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=EQfXIx5Zj7Jggd0RKO1e+/5rvXiVA7UtKvrBeCYH6zw=; b=AQ6h9RaoJRVPPLMe+YVFivbe8p
	zIKXJ6XT6vR8PzX7wCoAjY2zFc87bUubJ5exPftq4kPzzUk9j9ohfAnxQ0rWLP2onBLuVKo7AF9Al
	eBCePA29ZW26Wm/KuL0ZIWYtv327kkfXg+2nKF+IQqk2ac34mxB5EvXo5Mussvshe4zA=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>
Subject: [PATCH v5 00/11] viridian: add support for ExProcessorMasks
Date: Fri,  4 Dec 2020 08:52:44 +0000
Message-Id: <20201204085255.26216-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Paul Durrant (11):
  viridian: don't blindly write to 32-bit registers if 'mode' is invalid
  viridian: move flush hypercall implementation into separate function
  viridian: move IPI hypercall implementation into separate function
  viridian: introduce a per-cpu hypercall_vpmask and accessor
    functions...
  viridian: use hypercall_vpmask in hvcall_ipi()
  viridian: use softirq batching in hvcall_ipi()
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
 xen/arch/x86/hvm/viridian/viridian.c | 604 +++++++++++++++++++++------
 xen/include/asm-x86/hvm/viridian.h   |  10 +
 xen/include/public/hvm/params.h      |   7 +-
 7 files changed, 516 insertions(+), 124 deletions(-)

-- 
2.20.1


