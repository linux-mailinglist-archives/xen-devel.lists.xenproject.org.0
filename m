Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D251BA9267
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 14:08:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132739.1470988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Cfi-0007WS-Ab; Mon, 29 Sep 2025 12:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132739.1470988; Mon, 29 Sep 2025 12:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Cfi-0007S2-3A; Mon, 29 Sep 2025 12:08:02 +0000
Received: by outflank-mailman (input) for mailman id 1132739;
 Mon, 29 Sep 2025 12:08:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1v3Cfg-0007Ps-8g
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 12:08:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1v3Cff-00GXAq-0J;
 Mon, 29 Sep 2025 12:07:59 +0000
Received: from [2a01:cb15:80df:da00:e2a9:ff82:7bde:38cd] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1v3Cff-004JHo-09;
 Mon, 29 Sep 2025 12:07:58 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From;
	bh=TU+wA/sAxbsVpGInZfyIKwiXz4Vj5F3tSnBd/r/PMf8=; b=xDFVhAvoijcbp3rwapDHBMCdJJ
	fIE9h0yFs7sD7l0p4oj9HRsQCi8ghYiTRLIHiD/fedNEwMSHXsqlUDHPQ/NQbv0rq5TETzJGMOcii
	cXyPDygZL3sGlvqngMe+0TOqDrRfPBtbYhXrirAhw1RujXTvznzM21e5IoGYbg+cNziI=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [XEN PATCH v2 0/8] Allow to build libxl and other tools with json-c instead of yajl
Date: Mon, 29 Sep 2025 14:07:48 +0200
Message-ID: <20250929120756.46075-1-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Patch series available in this git branch:
https://xenbits.xenproject.org/git-http/people/aperard/xen-unstable.git br.libxl-libjsonc-v2

changes in v2:
- introduce $(XEN_JSON_LIBS) to have either -lyajl or -ljson-c or both (for a
  short while).
- few more changes detail in each patches.

Hi,

The library YAJL has been unmaintained for several years, without an obvious
fork to pick.

On the other and the library json-c is been maintained and use by several other
project, it's probably already installed on your machine. So this patch series
intend to allow to build the Xen toolstack again json-c, and forgo yajl.

Just in case, YAJL is can still be used.

There's bit of libxl API that exposes YAJL, mainly so it can be used by `xl` to
call libxl_domain_config_gen_json(). It was exposed via the "libxl_json.h"
headers. This functions and others won't be available when libxl is build
against json-c.

Cheers,

Anthony PERARD (8):
  tools/configure: Introduce deps on json-c lib for libxl
  libxl: Convert libxl__json_parse() to use json-c
  libxl: convert libxl__json_object_to_yajl_gen to
    libxl__json_object_to_libjsonc_object
  libxl: libxl__object_to_json() to json-c
  libxl: convert libxl__json_object_to_json() to json_object
  tools/libxenstat: Use json-c when available
  configure: Use json-c by default, fallback to yajl
  Update CHANGELOG and README with dependency on json-c

 CHANGELOG.md                              |   2 +
 README                                    |   2 +-
 config/Tools.mk.in                        |   1 +
 tools/config.h.in                         |   3 +
 tools/configure                           | 136 +++++-
 tools/configure.ac                        |  10 +-
 tools/include/libxl_json.h                |  27 ++
 tools/libs/light/Makefile                 |   6 +-
 tools/libs/light/gentypes.py              | 160 +++++-
 tools/libs/light/idl.py                   |   7 +-
 tools/libs/light/libxl_cpuid.c            | 119 +++++
 tools/libs/light/libxl_internal.h         |  23 +-
 tools/libs/light/libxl_json.c             | 562 +++++++++++++++++++++-
 tools/libs/light/libxl_qmp.c              |  53 ++
 tools/libs/light/libxl_types.idl          |   7 +-
 tools/libs/light/libxl_types_internal.idl |   3 +-
 tools/libs/stat/Makefile                  |   2 +-
 tools/libs/stat/xenstat_qmp.c             | 126 ++++-
 tools/xl/Makefile                         |   2 +-
 tools/xl/xl_info.c                        | 102 +++-
 20 files changed, 1312 insertions(+), 41 deletions(-)

-- 
Anthony PERARD


