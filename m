Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 608622CD5AA
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 13:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43405.78014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kknvy-0005vb-05; Thu, 03 Dec 2020 12:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43405.78014; Thu, 03 Dec 2020 12:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kknvx-0005vC-Sc; Thu, 03 Dec 2020 12:42:05 +0000
Received: by outflank-mailman (input) for mailman id 43405;
 Thu, 03 Dec 2020 12:42:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kknvw-0005v2-99
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 12:42:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kknvu-00045v-0r; Thu, 03 Dec 2020 12:42:02 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kknvt-00015A-LG; Thu, 03 Dec 2020 12:42:01 +0000
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
	bh=+0nQoHXCtgW9tqQuUMhFAMdszTnfQ1Y5Z2wyMhegY0Y=; b=ED48kwiM8f8v+vyU2LdzBf0+yB
	kfdxuCU6c46KQ6st+n0cOkbrJ7rwmCsit66Qvi2jta7Ldsu90MkZJXKGvfl+z64EOniJDn/Qzme0s
	MQXn+92hyYkVdS+6FOswDBqRyDZxg8bDgp6RRKfXf7pmm5vGPf1vGGuho8j3uVbY7/vs=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 0/4] Xen ABI feature control
Date: Thu,  3 Dec 2020 12:41:55 +0000
Message-Id: <20201203124159.3688-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

This series was previously called "evtchn: Introduce a per-guest knob to
control FIFO ABI". It is been extensively re-worked and extended to cover
another ABI feature.

Paul Durrant (4):
  domctl: introduce a new domain create flag,
    XEN_DOMCTL_CDF_evtchn_fifo, ...
  domctl: introduce a new domain create flag,
    XEN_DOMCTL_CDF_evtchn_upcall, ...
  libxl: introduce a 'libxl_xen_abi_features' enumeration...
  xl: introduce a 'xen-abi-features' option...

 docs/man/xl.cfg.5.pod.in         | 50 ++++++++++++++++++++++++++++++++
 tools/include/libxl.h            | 10 +++++++
 tools/libs/light/libxl_arm.c     | 22 +++++++++-----
 tools/libs/light/libxl_create.c  | 31 ++++++++++++++++++++
 tools/libs/light/libxl_types.idl |  7 +++++
 tools/libs/light/libxl_x86.c     | 17 ++++++++++-
 tools/ocaml/libs/xc/xenctrl.ml   |  2 ++
 tools/ocaml/libs/xc/xenctrl.mli  |  2 ++
 tools/xl/xl_parse.c              | 50 ++++++++++++++++++++++++++++++--
 xen/arch/arm/domain.c            |  3 +-
 xen/arch/arm/domain_build.c      |  3 +-
 xen/arch/arm/setup.c             |  3 +-
 xen/arch/x86/domain.c            |  8 +++++
 xen/arch/x86/hvm/hvm.c           |  3 ++
 xen/arch/x86/setup.c             |  4 ++-
 xen/common/domain.c              |  3 +-
 xen/common/event_channel.c       | 24 +++++++++++++--
 xen/include/public/domctl.h      |  6 +++-
 18 files changed, 229 insertions(+), 19 deletions(-)
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Christian Lindig <christian.lindig@citrix.com>
Cc: David Scott <dave@recoil.org>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Wei Liu <wl@xen.org>
-- 
2.20.1


