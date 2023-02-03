Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 103CB689350
	for <lists+xen-devel@lfdr.de>; Fri,  3 Feb 2023 10:19:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489054.757358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNsD6-0006tt-Rn; Fri, 03 Feb 2023 09:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489054.757358; Fri, 03 Feb 2023 09:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNsD6-0006se-Ns; Fri, 03 Feb 2023 09:18:20 +0000
Received: by outflank-mailman (input) for mailman id 489054;
 Fri, 03 Feb 2023 09:18:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HD5o=57=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pNsD4-0006pI-Mi
 for xen-devel@lists.xenproject.org; Fri, 03 Feb 2023 09:18:18 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aed2bf58-a3a3-11ed-9254-a70e01b1f5fa;
 Fri, 03 Feb 2023 10:18:14 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4C6923447B;
 Fri,  3 Feb 2023 09:18:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1FCA31346D;
 Fri,  3 Feb 2023 09:18:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rJZoBlTR3GMEEwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 03 Feb 2023 09:18:12 +0000
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
X-Inumbo-ID: aed2bf58-a3a3-11ed-9254-a70e01b1f5fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675415892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lKKJC6YtNCf8aiN934Ne7s/FwvZH2vXGkqQ7iJjfCoc=;
	b=bIVE2i7Ah9bPQR9b5WIX7DOvSsZvUP1ODjO58clZnz/27q437oW9hjZ9ZWYFmN0UqP58RJ
	YwyH7w+yPxuTV9r1IqFb27JpdKbHiADMvpq/gI8JGSLxu25kfdODHf/+naoUFbL8V5H+5+
	XNcQdKU2va5dmK8e3lMTkPoSfGW+m0E=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/7] Mini-OS: ad minimal 9pfs support
Date: Fri,  3 Feb 2023 10:18:02 +0100
Message-Id: <20230203091809.14478-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is adding minimal support to use 9pfs in Mini-OS. It is
adding a PV 9pfs frontend and the ability to open, close, read and
write files.

The series has been tested with qemu as 9pfs backend in a PVH Mini-OS
guest (I've used a slightly modified Xenstore-stubdom for that purpose
in order to reuse the build runes).

This series is meant to setup the stage for adding file based logging
support to Xenstore-stubdom and later to add live update support (being
able to save the LU data stream in a dom0 file makes this a _lot_
easier).

In order to keep Mini-OS's license I have only used the protocol docs
available on the internet [1] and the verified those with the qemu 9pfs
backend implementation (especially for supporting the 9P2000.u variant,
as qemu doesn't support the basic 9P2000 protocol).

The needed fixed values of the protocol have been taken from [2].

[1]: http://ericvh.github.io/9p-rfc/rfc9p2000.html
[2]: https://github.com/0intro/libixp

Juergen Gross (7):
  Mini-OS: xenbus: add support for reading node from directory
  Mini-OS: add concept of mount points
  Mini-OS: add support for runtime mounts
  Mini-OS: add 9pfs frontend
  Mini-OS: add 9pfs transport layer
  Mini-OS: add open and close handling to the 9pfs frontend
  Mini-OS: add read and write support to 9pfsfront

 9pfront.c                     | 1201 +++++++++++++++++++++++++++++++++
 Config.mk                     |    1 +
 Makefile                      |    1 +
 arch/x86/testbuild/all-no     |    1 +
 arch/x86/testbuild/all-yes    |    1 +
 arch/x86/testbuild/newxen-yes |    1 +
 include/9pfront.h             |    7 +
 include/lib.h                 |   14 +
 include/xenbus.h              |    6 +
 lib/sys.c                     |  128 +++-
 xenbus.c                      |   39 +-
 11 files changed, 1378 insertions(+), 22 deletions(-)
 create mode 100644 9pfront.c
 create mode 100644 include/9pfront.h

-- 
2.35.3


