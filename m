Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 860E2B1EAD2
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 16:56:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074663.1437150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOVs-0008Oa-Tw; Fri, 08 Aug 2025 14:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074663.1437150; Fri, 08 Aug 2025 14:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOVs-0008Ka-QX; Fri, 08 Aug 2025 14:56:08 +0000
Received: by outflank-mailman (input) for mailman id 1074663;
 Fri, 08 Aug 2025 14:56:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1ukOVr-0008Ie-06
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 14:56:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ukOVp-007zr1-2z;
 Fri, 08 Aug 2025 14:56:05 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14..)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ukOVp-009BYT-1q;
 Fri, 08 Aug 2025 14:56:05 +0000
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
	Message-Id:Date:Subject:Cc:To:From;
	bh=ga3rdHXbHTe5bxe1ccYqmMj+8JODCgO+SO4MQwmxz10=; b=JEikGWsB49R4sHXaTIijAQo2CP
	6ybyObkKzRJftWe+lrEluNyG9/tPcu+t/PYRD4k2zc6Vs29xNcvtdaz2jb6ciEnTdJ/DviExpBfb/
	DGuc0ealNCW6veQes9VpkSinoGOfRpeHHZpNPXfd87qEQUaBKjp+zVYNizGSC9joHDDo=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Community Manager <community.manager@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [XEN PATCH 00/11] Allow to build libxl and other tools with json-c instead of yajl
Date: Fri,  8 Aug 2025 16:55:51 +0200
Message-Id: <20250808145602.41716-1-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Patch series available in this git branch:
https://xenbits.xenproject.org/git-http/people/aperard/xen-unstable.git br.libxl-libjsonc-v1

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

Anthony PERARD (11):
  xl: move printf_info prototype to an header
  libxl: Remove duplicate libxl_domain_config_gen_json prototype
  libxl: remove duplicated libxl__yajl_gen_asciiz() prototype
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
 config/Tools.mk.in                        |   2 +
 tools/config.h.in                         |   3 +
 tools/configure                           | 136 +++++-
 tools/configure.ac                        |  10 +-
 tools/include/libxl_json.h                |  30 +-
 tools/libs/light/Makefile                 |   7 +-
 tools/libs/light/gentypes.py              | 160 ++++++-
 tools/libs/light/idl.py                   |   7 +-
 tools/libs/light/libxl_cpuid.c            | 119 +++++
 tools/libs/light/libxl_internal.h         |  25 +-
 tools/libs/light/libxl_json.c             | 557 +++++++++++++++++++++-
 tools/libs/light/libxl_qmp.c              |  53 ++
 tools/libs/light/libxl_types.idl          |   7 +-
 tools/libs/light/libxl_types_internal.idl |   3 +-
 tools/libs/stat/Makefile                  |   3 +-
 tools/libs/stat/xenstat_qmp.c             | 126 ++++-
 tools/xl/Makefile                         |   2 +-
 tools/xl/xl.h                             |   3 +
 tools/xl/xl_info.c                        | 105 +++-
 tools/xl/xl_misc.c                        |   3 -
 22 files changed, 1313 insertions(+), 52 deletions(-)

-- 
Anthony PERARD


