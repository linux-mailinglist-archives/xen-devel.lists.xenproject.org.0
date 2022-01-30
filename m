Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF6A4A3534
	for <lists+xen-devel@lfdr.de>; Sun, 30 Jan 2022 09:44:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262418.454639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nE5oK-00076a-Le; Sun, 30 Jan 2022 08:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262418.454639; Sun, 30 Jan 2022 08:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nE5oK-00074f-Hd; Sun, 30 Jan 2022 08:43:48 +0000
Received: by outflank-mailman (input) for mailman id 262418;
 Sun, 30 Jan 2022 08:43:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KjUP=SO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nE5oJ-00074R-4p
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 08:43:47 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc8c540a-81a8-11ec-8f75-fffcc8bd4f1a;
 Sun, 30 Jan 2022 09:43:46 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D76C52110A;
 Sun, 30 Jan 2022 08:43:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 994C413638;
 Sun, 30 Jan 2022 08:43:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lXooJMFP9mHCRAAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 30 Jan 2022 08:43:45 +0000
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
X-Inumbo-ID: bc8c540a-81a8-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1643532225; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GMxjY0q87YE+sxvdzjdenFJVo5nV371fdyG4ehYBV0M=;
	b=R3gUEnm2xdkiA5jnSa46rEyLf9lnw4Wl4EgtZ50eflOA5hDhJLWBRn/2M/tiaC4KoRHobD
	zQWga8O05XFDqM7ghtBtUtGJg/kNUwkQ2mhhQTRivGTtPXOnfC3F2fp9GFpqL2glAa7wmZ
	Ql2zmTvZpHK1DwhwB16K2YNS8z4/31A=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/5] tools: remove include/xen-external directory
Date: Sun, 30 Jan 2022 09:43:38 +0100
Message-Id: <20220130084343.19070-1-jgross@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tools/include/xen-external directory contains a header file from
FreeBSD used to generate Xen header files. This series is replacing the
complete directory by a single header with the same semantics.

Juergen Gross (5):
  tools/include: generate a _xen_list.h file
  tools/libs/light: replace _libxl_list.h with _xen_list.h
  tools/libs/toolcore: replace _xentoolcore_list.h with _xen_list.h
  tools/libs/evtchn: use _xen_list.h
  tools/include: remove xen-external directory

 .gitignore                                    |    1 -
 tools/include/Makefile                        |    2 +
 tools/include/_xen_list.h                     |  523 +++++++++
 tools/include/libxl.h                         |    4 +-
 tools/include/xen-external/README             |   24 -
 tools/include/xen-external/bsd-COPYRIGHT      |  126 --
 tools/include/xen-external/bsd-queue.3        | 1044 -----------------
 .../xen-external/bsd-sys-queue-h-seddery      |   74 --
 tools/include/xen-external/bsd-sys-queue.h    |  637 ----------
 tools/include/xentoolcore_internal.h          |    4 +-
 tools/libs/evtchn/minios.c                    |   20 +-
 tools/libs/light/Makefile                     |   10 +-
 tools/libs/light/libxl.c                      |   40 +-
 tools/libs/light/libxl_aoutils.c              |   20 +-
 tools/libs/light/libxl_device.c               |   27 +-
 tools/libs/light/libxl_disk.c                 |    4 +-
 tools/libs/light/libxl_domain.c               |   18 +-
 tools/libs/light/libxl_event.c                |  128 +-
 tools/libs/light/libxl_fork.c                 |   44 +-
 tools/libs/light/libxl_internal.h             |   86 +-
 tools/libs/light/libxl_qmp.c                  |   19 +-
 tools/libs/light/libxl_stream_read.c          |   20 +-
 tools/libs/toolcore/Makefile                  |    8 -
 23 files changed, 743 insertions(+), 2140 deletions(-)
 create mode 100644 tools/include/_xen_list.h
 delete mode 100644 tools/include/xen-external/README
 delete mode 100644 tools/include/xen-external/bsd-COPYRIGHT
 delete mode 100644 tools/include/xen-external/bsd-queue.3
 delete mode 100755 tools/include/xen-external/bsd-sys-queue-h-seddery
 delete mode 100644 tools/include/xen-external/bsd-sys-queue.h

-- 
2.31.1


