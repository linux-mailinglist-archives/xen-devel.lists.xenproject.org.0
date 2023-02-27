Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3756A463F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 16:42:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502743.774676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfdW-0002rF-Nq; Mon, 27 Feb 2023 15:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502743.774676; Mon, 27 Feb 2023 15:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfdW-0002o9-Je; Mon, 27 Feb 2023 15:41:58 +0000
Received: by outflank-mailman (input) for mailman id 502743;
 Mon, 27 Feb 2023 15:41:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zQU0=6X=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pWfdV-0002o3-Re
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 15:41:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43fa06df-b6b5-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 16:41:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2E0921FD65;
 Mon, 27 Feb 2023 15:41:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A9AB913912;
 Mon, 27 Feb 2023 15:41:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Q4jtJ0PP/GN/LgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Feb 2023 15:41:55 +0000
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
X-Inumbo-ID: 43fa06df-b6b5-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1677512516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=I6z0kEMv/XhfT7nP05fQMWCjqMhyG4b4PAsCLSVXNKU=;
	b=GWk/ZLmaEYpN4aiIpK09KMI4RTJ1aGEKqmHWMBUmviOXK4jeJaAYMqEsJtYWAOljIB6JPE
	1LQWPu+XjWL3r32ECG4JcwdGTmQ/SxQLJTlfEK22KDxsCRFrUGsK0Rl0yipzIruX38iYU1
	8KX+5E3zChtIRdnz3h1s3R2i/FMGPVw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Julien Grall <julien@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v2 0/4] tools: use xen-tools/libs.h for common definitions
Date: Mon, 27 Feb 2023 16:41:49 +0100
Message-Id: <20230227154153.31080-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some macros defined multiple times in tools. Use only
a single header file for defining those macros and drop the copies.

V2:
- add patch 1 (Andrew Cooper)

Juergen Gross (4):
  tools: rename xen-tools/libs.h file to common-macros.h
  tools: add container_of() macro to xen-tools/common-macros.h
  tools: get rid of additional min() and max() definitions
  tools: add offsetof() to xen-tools/common-macros.h

 tools/console/daemon/io.c                     |  2 +-
 tools/firmware/hvmloader/util.h               | 11 ++--------
 tools/firmware/include/stddef.h               |  4 ++--
 tools/fuzz/cpu-policy/afl-policy-fuzzer.c     |  2 +-
 .../xen-tools/{libs.h => common-macros.h}     | 22 ++++++++++++++++---
 tools/libfsimage/Rules.mk                     |  2 ++
 tools/libfsimage/xfs/fsys_xfs.c               |  4 +---
 tools/libs/call/buffer.c                      |  2 +-
 tools/libs/ctrl/xc_pm.c                       |  2 +-
 tools/libs/ctrl/xc_private.h                  |  2 +-
 tools/libs/foreignmemory/linux.c              |  2 +-
 tools/libs/gnttab/freebsd.c                   |  2 +-
 tools/libs/gnttab/linux.c                     |  2 +-
 tools/libs/guest/xg_core_arm.c                |  2 +-
 tools/libs/guest/xg_cpuid_x86.c               |  2 +-
 tools/libs/guest/xg_dom_arm.c                 |  2 +-
 tools/libs/guest/xg_dom_bzimageloader.c       |  2 +-
 tools/libs/guest/xg_dom_x86.c                 |  2 +-
 tools/libs/guest/xg_sr_common.c               |  2 +-
 tools/libs/light/libxl_internal.h             |  2 +-
 tools/libs/light/libxl_psr.c                  |  2 +-
 tools/libs/stat/xenstat_linux.c               |  2 +-
 tools/libs/vchan/init.c                       |  7 +-----
 tools/misc/xen-access.c                       |  2 +-
 tools/misc/xen-cpuid.c                        |  2 +-
 tools/misc/xen-diag.c                         |  2 +-
 tools/misc/xen-hptool.c                       |  2 +-
 tools/misc/xen-livepatch.c                    |  2 +-
 tools/misc/xen-mfndump.c                      |  2 +-
 tools/misc/xenpm.c                            |  2 +-
 tools/ocaml/libs/mmap/xenmmap_stubs.c         |  2 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c           |  2 +-
 tools/python/xen/lowlevel/xc/xc.c             |  2 +-
 tools/tests/cpu-policy/test-cpu-policy.c      |  2 +-
 .../paging-mempool/test-paging-mempool.c      |  2 +-
 tools/tests/resource/test-resource.c          |  2 +-
 tools/tests/tsx/test-tsx.c                    |  2 +-
 tools/tests/vhpet/emul.h                      | 16 +-------------
 tools/tests/vpci/emul.h                       | 22 +------------------
 tools/tests/x86_emulator/x86-emulate.h        |  7 +-----
 tools/tests/xenstore/test-xenstore.c          |  2 +-
 tools/xenstore/list.h                         |  6 ++---
 tools/xenstore/utils.h                        |  2 +-
 tools/xentrace/analyze.h                      |  2 +-
 tools/xl/xl_cmdtable.c                        |  2 +-
 xen/lib/x86/private.h                         |  2 +-
 46 files changed, 68 insertions(+), 105 deletions(-)
 rename tools/include/xen-tools/{libs.h => common-macros.h} (74%)

-- 
2.35.3


