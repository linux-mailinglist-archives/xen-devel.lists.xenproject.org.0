Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 939D847BC17
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 09:47:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250177.430843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzanP-00031t-CN; Tue, 21 Dec 2021 08:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250177.430843; Tue, 21 Dec 2021 08:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzanP-000302-99; Tue, 21 Dec 2021 08:46:55 +0000
Received: by outflank-mailman (input) for mailman id 250177;
 Tue, 21 Dec 2021 08:46:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rEWG=RG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mzanN-0002yE-GE
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 08:46:53 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b18b320-623a-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 09:46:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1B4F8210FE;
 Tue, 21 Dec 2021 08:46:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DE35313BEC;
 Tue, 21 Dec 2021 08:46:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ndZENHuUwWFHMAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Dec 2021 08:46:51 +0000
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
X-Inumbo-ID: 8b18b320-623a-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1640076412; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=U+uOMy8syfFhtMitypXYhn09cP895ccPVKrqjYHL+gw=;
	b=SQHIEkusJZx7ayncKT4nh3fqdmklpAZ3y6UU5v3MZBl0r9RCNU7oDVH3wz5MQ94QMGWiUp
	4g8Tzg/jNUIEjSvlUAAFX66jlMTVgG5YZKzegmsu316ZO7UK/IKcS282MiedasHna/7wyI
	03JCAUr3+Bt/KyZ6XvMazbPW5nQhiw4=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 00/10] mini-os: add missing PVH features
Date: Tue, 21 Dec 2021 09:46:26 +0100
Message-Id: <20211221084636.6987-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mini-OS in PVH mode is missing some features, especially in the areas
of ballooning and grant tables.

With this series I am able to run Xenstore stubdom in PVH mode.

Changes in V3:
- two minor fixes

Changes in V2:
- multiple comments addressed

Juergen Gross (10):
  mini-os: split e820 map handling into new source file
  mini-os: sort and sanitize e820 memory map
  mini-os: don't assume contiguous RAM when initializing in PVH mode
  mini-os: respect memory map when ballooning up
  mini-os: don't repeat definition available via header file
  mini-os: add memory map service functions
  mini-os: move x86 specific gnttab coding into arch/x86/gnttab.c
  mini-os: add proper pvh grant table handling
  mini-os: prepare grantmap entry interface for use by PVH mode
  mini-os: modify grant mappings to work in PVH mode

 Makefile           |   1 +
 arch/arm/mm.c      |  11 +-
 arch/x86/balloon.c |   4 +-
 arch/x86/gnttab.c  | 109 +++++++++++++
 arch/x86/mm.c      | 121 +--------------
 arch/x86/setup.c   |   8 +-
 balloon.c          |  33 ++--
 e820.c             | 376 +++++++++++++++++++++++++++++++++++++++++++++
 gntmap.c           | 125 +++++++++------
 include/balloon.h  |   5 +-
 include/e820.h     |  11 ++
 include/gntmap.h   |   1 +
 mm.c               |   7 +-
 13 files changed, 615 insertions(+), 197 deletions(-)
 create mode 100644 arch/x86/gnttab.c
 create mode 100644 e820.c

-- 
2.26.2


