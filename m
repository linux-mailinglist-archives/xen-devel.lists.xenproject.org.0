Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B233373C1
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 14:24:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96537.182697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKLIc-0005Dn-Fw; Thu, 11 Mar 2021 13:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96537.182697; Thu, 11 Mar 2021 13:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKLIc-0005DO-Cw; Thu, 11 Mar 2021 13:24:22 +0000
Received: by outflank-mailman (input) for mailman id 96537;
 Thu, 11 Mar 2021 13:24:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DcZr=IJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lKLIb-0005DJ-0u
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 13:24:21 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c22d0991-3472-460f-945e-79071deafbc7;
 Thu, 11 Mar 2021 13:24:20 +0000 (UTC)
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
X-Inumbo-ID: c22d0991-3472-460f-945e-79071deafbc7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615469060;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tHuesWFQA7Mchpj7f9p42VhfotJUCO8dFEjaWBOOtbk=;
  b=JiaM2ZbWnbL4o0Je2XryioliSioJddRy5DwXMYPUd4G531PnUwI5mjvE
   lKshG0Pn8D3mAN+33H1CXfWAkkaPrXqSQqyR7+awEFubi0okZMwVDfZHZ
   GUlr/N20xqm9B8o1J73aIazz7FwK4Q51wKJCvX0MyJJnF9OUDS1gNCfpA
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: dUgzisvD0S1vEDYgMEc8CmpC7u30st7aWwqcP/AXZ3LPIdkqYqSYlvxMNKdt8y15OUEfnizyL+
 ZZvWQnY5PtLlrptKZjNMYKvOGbPcnMnfgpTiuUKsw+0Ilw3a1RRUg24MA8IEKmge+3yZAHdOLX
 tdVOHpkHyfVaf057qqJiqaVHusW53Q3n969+YPWNEuCHTnaSZ/SZwJglsJZoEstCEtrZLWyc1v
 p5cMCfr4EBAxlH3mcGI/qCQMHzL8f2Fql8iE95puSMIS8ULDlggnRXheg8ckubxUr+olRvLpRe
 VwY=
X-SBRS: 4.0
X-MesageID: 39228458
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:TEhs7aNpDdmDn8BcTxP155DYdL4zR+YMi2QD/1xtSBBTb8yTn9
 2vmvNe7hPvlDMNQhgb9OyoEqPoexPh3LRy5pQcOqrnYRn+tAKTXeVfxKbB4xmlIS3x8eZByb
 xtGpIVNPTcBUV35PyU3CCWCNAlqePozImNpcPzi0hgVhtrbaYI1XYdNi++HldtTAdLQboVfa
 DshfZvnDardXQJYsnTPBBsM9TrnNHXiIngJScPGh9P0mKzpAm14733GQXw5GZ9bxpzx94ZkF
 TtokjCyYiI99q6zRLd0GG71eUqpPLRjuFtKebJpswcKjDHghulaoJ7S9S5zUwIidDq0nkGup
 3hpAohItRS5hrqDx6IiCqo4SbM+nIP7GLv0lCRi3eLm72GeBsKT/BvqKgcVzmx0TtGgPhMlJ
 hl8kjcir9sSTTHpyj578igbWAQqmOE5UAMvMRWs2ZSSuIlGdlshL1axmx5OrEaEhn37Yg2ed
 Medv301bJtfVSWY2uxhBgX/PWcGnA6HhKxSkMfoMCi0z9PgHBjz0cDrfZv5ks9yA==
X-IronPort-AV: E=Sophos;i="5.81,240,1610427600"; 
   d="scan'208";a="39228458"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH for-4.15 v3] xen/dmop: Strip __XEN_TOOLS__ header guard from public ABI
Date: Thu, 11 Mar 2021 13:24:00 +0000
Message-ID: <20210311132400.24411-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

__XEN_TOOLS__ is really there to separate the unstable from stable hypercalls.
Exactly as with c/s f40e1c52e4, stable interfaces shouldn't contain this
guard.

That change actually broke the build with:

  include/xendevicemodel.h:52:5: error: unknown type name 'ioservid_t'
       ioservid_t *id);
       ^

as libxendevicemodel.h now uses a type it can't see a typedef for.  However,
nothing noticed because the header.chk logic is also broken (fixed
subsequently).

Strip the guard from the public header, and remove compensation from
devicemodel's private.h.  Fix the dmop design doc to discuss both reasons
behind the the ABI design.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Paul Durrant <paul@xen.org>
CC: Ian Jackson <iwj@xenproject.org>

v3:
 * Clarifications to the commit message, and dmop.pandoc
v2:
 * Patch dmop.pandoc as well.
---
 docs/designs/dmop.pandoc         | 12 +++++++++---
 tools/libs/devicemodel/private.h |  2 --
 xen/include/public/hvm/dm_op.h   |  5 -----
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/docs/designs/dmop.pandoc b/docs/designs/dmop.pandoc
index 8e9f95af47..49e52b1bcc 100644
--- a/docs/designs/dmop.pandoc
+++ b/docs/designs/dmop.pandoc
@@ -4,9 +4,15 @@ DMOP
 Introduction
 ------------
 
-The aim of DMOP is to prevent a compromised device model from compromising
-domains other than the one it is providing emulation for (which is therefore
-likely already compromised).
+The DMOP hypercall has a new ABI design to solve problems in the Xen
+ecosystem.  First, the ABI is fully stable, to reduce the coupling between
+device models and the version of Xen.  Specifically, device model software
+using DMOP (be it user, stub domain or kernel software) need not be recompiled
+to match the version of the running hypervisor.
+
+Secondly, for device models in userspace, the ABI is designed specifically to
+allow a kernel to audit the memory ranges used, without having to know the
+internal structure of sub-ops.
 
 The problem occurs when you a device model issues an hypercall that
 includes references to user memory other than the operation structure
diff --git a/tools/libs/devicemodel/private.h b/tools/libs/devicemodel/private.h
index c4a225f8af..c24f3396bb 100644
--- a/tools/libs/devicemodel/private.h
+++ b/tools/libs/devicemodel/private.h
@@ -1,8 +1,6 @@
 #ifndef XENDEVICEMODEL_PRIVATE_H
 #define XENDEVICEMODEL_PRIVATE_H
 
-#define __XEN_TOOLS__ 1
-
 #include <xentoollog.h>
 #include <xendevicemodel.h>
 #include <xencall.h>
diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
index ef7fbc0d3d..fa3f083fed 100644
--- a/xen/include/public/hvm/dm_op.h
+++ b/xen/include/public/hvm/dm_op.h
@@ -25,9 +25,6 @@
 #define __XEN_PUBLIC_HVM_DM_OP_H__
 
 #include "../xen.h"
-
-#if defined(__XEN__) || defined(__XEN_TOOLS__)
-
 #include "../event_channel.h"
 
 #ifndef uint64_aligned_t
@@ -491,8 +488,6 @@ struct xen_dm_op {
     } u;
 };
 
-#endif /* __XEN__ || __XEN_TOOLS__ */
-
 struct xen_dm_op_buf {
     XEN_GUEST_HANDLE(void) h;
     xen_ulong_t size;
-- 
2.11.0


