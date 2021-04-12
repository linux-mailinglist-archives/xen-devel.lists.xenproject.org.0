Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA71535C9B7
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 17:23:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109276.208600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVyOm-0005IY-Oi; Mon, 12 Apr 2021 15:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109276.208600; Mon, 12 Apr 2021 15:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVyOm-0005I9-KE; Mon, 12 Apr 2021 15:22:48 +0000
Received: by outflank-mailman (input) for mailman id 109276;
 Mon, 12 Apr 2021 15:22:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oSjc=JJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lVyOk-0005HA-K8
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 15:22:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b3686e4-b2b5-4ed0-8dde-c3f261fc0a8c;
 Mon, 12 Apr 2021 15:22:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 42CDEB318;
 Mon, 12 Apr 2021 15:22:44 +0000 (UTC)
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
X-Inumbo-ID: 4b3686e4-b2b5-4ed0-8dde-c3f261fc0a8c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618240964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Swipnv7lNlL9cb8oILiJyPvVh9VulLNmguuAuPfTttI=;
	b=HRdHNW/I6v/PNprBPpDRrkM9XW71vnbDOwPJggSDN0RrIw7mnzPp5VyFHOqsNDC2EnUxJ/
	9Wx3/9jYgIyr1J0iFbN5mymnMiU0HGfcFc3zEv/+M6GZcxZBfZw7N7DfdGmxekOwpaTay7
	S7v1HjpHmbPNscOvFq76cvUm++ipL34=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: [PATCH v2 0/6] tools/libs: add missing support of linear p2m_list, cleanup
Date: Mon, 12 Apr 2021 17:22:30 +0200
Message-Id: <20210412152236.1975-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some corners left which don't support the not so very new
linear p2m list of pv guests, which has been introduced in Linux kernel
3.19 and which is mandatory for non-legacy versions of Xen since kernel
4.14.

This series adds support for the linear p2m list where it is missing
(colo support and "xl dump-core").

In theory it should be possible to merge the p2m list mapping code
from migration handling and core dump handling, but this needs quite
some cleanup before this is possible.

The first three patches of this series are fixing real problems, so
I've put them at the start of this series, especially in order to make
backports easier.

The other three patches are only the first steps of cleanup. The main
work done here is to concentrate all p2m mapping in libxenguest instead
of having one implementation in each of libxenguest and libxenctrl.

Merging the two implementations should be rather easy, but this will
require to touch many lines of code, as the migration handling variant
seems to be more mature, but it is using the migration stream specific
structures heavily. So I'd like to have some confirmation that my way
to clean this up is the right one.

My idea would be to add the data needed for p2m mapping to struct
domain_info_context and replace the related fields in struct
xc_sr_context with a struct domain_info_context. Modifying the
interface of xc_core_arch_map_p2m() to take most current parameters
via struct domain_info_context would then enable migration coding to
use xc_core_arch_map_p2m() for mapping the p2m. xc_core_arch_map_p2m()
should look basically like the current migration p2m mapping code
afterwards.

Any comments to that plan?

Changes in V2:
- added missing #include in ocaml stub

Juergen Gross (6):
  tools/libs/guest: fix max_pfn setting in map_p2m()
  tools/libs/ctrl: fix xc_core_arch_map_p2m() to support linear p2m
    table
  tools/libs/ctrl: use common p2m mapping code in xc_domain_resume_any()
  tools/libs: move xc_resume.c to libxenguest
  tools/libs: move xc_core* from libxenctrl to libxenguest
  tools/libs/guest: make some definitions private to libxenguest

 tools/include/xenctrl.h                       |  63 ---
 tools/include/xenguest.h                      |  63 +++
 tools/libs/ctrl/Makefile                      |   4 -
 tools/libs/ctrl/xc_core_x86.c                 | 223 ----------
 tools/libs/ctrl/xc_domain.c                   |   2 -
 tools/libs/ctrl/xc_private.h                  |  43 +-
 tools/libs/guest/Makefile                     |   4 +
 .../libs/{ctrl/xc_core.c => guest/xg_core.c}  |   7 +-
 .../libs/{ctrl/xc_core.h => guest/xg_core.h}  |  15 +-
 .../xc_core_arm.c => guest/xg_core_arm.c}     |  31 +-
 .../xc_core_arm.h => guest/xg_core_arm.h}     |   0
 tools/libs/guest/xg_core_x86.c                | 399 ++++++++++++++++++
 .../xc_core_x86.h => guest/xg_core_x86.h}     |   0
 tools/libs/guest/xg_dom_boot.c                |   2 +-
 tools/libs/guest/xg_domain.c                  |  19 +-
 tools/libs/guest/xg_offline_page.c            |   2 +-
 tools/libs/guest/xg_private.h                 |  16 +-
 .../{ctrl/xc_resume.c => guest/xg_resume.c}   |  69 +--
 tools/libs/guest/xg_sr_save_x86_pv.c          |   2 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c           |   1 +
 20 files changed, 545 insertions(+), 420 deletions(-)
 delete mode 100644 tools/libs/ctrl/xc_core_x86.c
 rename tools/libs/{ctrl/xc_core.c => guest/xg_core.c} (99%)
 rename tools/libs/{ctrl/xc_core.h => guest/xg_core.h} (92%)
 rename tools/libs/{ctrl/xc_core_arm.c => guest/xg_core_arm.c} (72%)
 rename tools/libs/{ctrl/xc_core_arm.h => guest/xg_core_arm.h} (100%)
 create mode 100644 tools/libs/guest/xg_core_x86.c
 rename tools/libs/{ctrl/xc_core_x86.h => guest/xg_core_x86.h} (100%)
 rename tools/libs/{ctrl/xc_resume.c => guest/xg_resume.c} (80%)

-- 
2.26.2


