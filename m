Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C046C62D9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 10:09:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513690.795071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfGwX-0004lj-8t; Thu, 23 Mar 2023 09:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513690.795071; Thu, 23 Mar 2023 09:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfGwX-0004iN-4V; Thu, 23 Mar 2023 09:09:09 +0000
Received: by outflank-mailman (input) for mailman id 513690;
 Thu, 23 Mar 2023 09:09:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d8pY=7P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pfGwV-0004eG-Io
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 09:09:07 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a7a3c6e-c95a-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 10:09:03 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A45AD5BF35;
 Thu, 23 Mar 2023 09:09:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9F74D13596;
 Thu, 23 Mar 2023 09:09:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id z7SVJS0XHGT9OwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Mar 2023 09:09:01 +0000
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
X-Inumbo-ID: 5a7a3c6e-c95a-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679562541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uxRmcjJb2cS7ZT5n5WQ4reqwUztrWOhzU1vzO1C7A6Q=;
	b=cL5Eg0U818v6l8QaHGzKrm412D7RfkQWCFckmMgV6hpoWzdRACm8HcKmtNn+72anUxytep
	hOMc6nxsyIH6Kh4+z7fT9/5TpSIJXKiOJLEjmapwXQwqmLZagv6TlUcozK/c99QHy6EEes
	HK141F7KFJwPRgLojXfqwUdh8h6fHig=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v5 0/5] tools: use xen-tools/libs.h for common definitions
Date: Thu, 23 Mar 2023 10:08:54 +0100
Message-Id: <20230323090859.25240-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some macros defined multiple times in tools. Use only
a single header file for defining those macros and drop the copies,
or use stddef.h for offsetof().

V2:
- add patch 1 (Andrew Cooper)

V3:
- address comments

V4:
- patch 1 of V3 already applied
- new patches 3-5

V5:
- swap patches 1 and 2 in order to avoid build error

Juergen Gross (5):
  tools: get rid of additional min() and max() definitions
  tools: add container_of() macro to xen-tools/common-macros.h
  tools/hvmloader: remove private offsetof() definition
  tools/libfsimage: remove private offsetof() definition
  tools/libs/vchan: remove private offsetof() definition

 tools/firmware/hvmloader/util.h         | 11 ++---------
 tools/include/xen-tools/common-macros.h |  5 +++++
 tools/libfsimage/xfs/fsys_xfs.c         |  4 +---
 tools/libs/vchan/init.c                 |  8 ++------
 tools/tests/vpci/Makefile               |  2 +-
 tools/tests/vpci/emul.h                 | 22 +---------------------
 tools/tests/x86_emulator/x86-emulate.h  |  5 -----
 tools/xenstore/list.h                   |  6 ++----
 8 files changed, 14 insertions(+), 49 deletions(-)

-- 
2.35.3


