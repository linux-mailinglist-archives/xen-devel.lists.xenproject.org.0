Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE1A2C3079
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 20:08:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36803.68827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khdfH-0001Hj-Kp; Tue, 24 Nov 2020 19:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36803.68827; Tue, 24 Nov 2020 19:07:47 +0000
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
	id 1khdfH-0001HH-HR; Tue, 24 Nov 2020 19:07:47 +0000
Received: by outflank-mailman (input) for mailman id 36803;
 Tue, 24 Nov 2020 19:07:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khdfG-0001HC-7j
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:07:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khdfF-0003sW-UJ; Tue, 24 Nov 2020 19:07:45 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khdfF-0000r4-Ku; Tue, 24 Nov 2020 19:07:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdfG-0001HC-7j
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=TPULqpYdJEVGJYx6fqKK70HwJX9V6FzYPwgxwHl7pgM=; b=hQMtyBT3viik1TdJA+DV3ktr66
	znrwj+lFNBmj9SZM6KZwamUIao5pX5/Q2k3wOLVlrLpuebz2Zq/5aXac/TiMjPdXnEGsZLpn43gC2
	d8H3xcz6ouPHK6+visfq/HXOKI0t1bJk10z/lZbgjhS4MZZh6+1GPSAgTs2rLpN9eFCw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdfF-0003sW-UJ; Tue, 24 Nov 2020 19:07:45 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com ([86.183.162.145] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdfF-0000r4-Ku; Tue, 24 Nov 2020 19:07:45 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>
Subject: [PATCH v3 00/13] viridian: add support for ExProcessorMasks...
Date: Tue, 24 Nov 2020 19:07:31 +0000
Message-Id: <20201124190744.11343-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

... plus one miscellaneous cleanup patch after introducing sizeof_field().

Paul Durrant (13):
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
  x86: replace open-coded occurrences of sizeof_field()...

 docs/man/xl.cfg.5.pod.in             |   8 +
 tools/include/libxl.h                |   7 +
 tools/libs/light/libxl_types.idl     |   1 +
 tools/libs/light/libxl_x86.c         |   3 +
 xen/arch/x86/cpu/vpmu_intel.c        |   4 +-
 xen/arch/x86/hvm/viridian/viridian.c | 601 +++++++++++++++++++++------
 xen/arch/x86/setup.c                 |  16 +-
 xen/include/asm-x86/hvm/viridian.h   |  10 +
 xen/include/public/hvm/params.h      |   7 +-
 xen/include/xen/compiler.h           |   8 +
 10 files changed, 532 insertions(+), 133 deletions(-)

-- 
2.20.1


