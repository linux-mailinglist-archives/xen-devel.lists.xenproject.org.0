Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D77506EFD
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 15:53:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308148.523723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngoHt-00042y-9r; Tue, 19 Apr 2022 13:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308148.523723; Tue, 19 Apr 2022 13:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngoHt-0003vt-3p; Tue, 19 Apr 2022 13:53:01 +0000
Received: by outflank-mailman (input) for mailman id 308148;
 Tue, 19 Apr 2022 13:53:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Io9b=U5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ngoHr-0003n8-W7
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 13:52:59 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04db1180-bfe8-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 15:52:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5D08421115;
 Tue, 19 Apr 2022 13:52:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DB791132E7;
 Tue, 19 Apr 2022 13:52:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iSgbNLi+XmL/EgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 19 Apr 2022 13:52:56 +0000
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
X-Inumbo-ID: 04db1180-bfe8-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650376377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Ll2L1V6q8NZn8/JqOsU4pqS0bFns/4R0D70JW/DGZeI=;
	b=dhKl+/szZfTJVsMqem+E61stA8sIw0VfVk5k/DaHmDMKreCB3twkD4TutqoWXHEhpKVp/D
	jzE+3CnPRFLrFIfhIbgfM7x69nG02rqZoObWo0ppXF0BYLa+SDzxHPRxulTPrNiG+jGFZ2
	CBgZflMUT3u/sK1Ef9SmZturB5oZIDE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 0/3] xen: fix and cleanup domctl handling
Date: Tue, 19 Apr 2022 15:52:51 +0200
Message-Id: <20220419135254.21729-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A fix of a hypervisor crash in domctl handling and some related cleanup.

Juergen Gross (3):
  xen: fix XEN_DOMCTL_gdbsx_guestmemio crash
  xen: cleanup gdbsx_guest_mem_io() call
  xen/iommu: cleanup iommu related domctl handling

 xen/arch/arm/domctl.c               | 11 +----------
 xen/arch/x86/debug.c                | 12 +++---------
 xen/arch/x86/domctl.c               |  8 ++++----
 xen/arch/x86/include/asm/debugger.h |  2 +-
 xen/common/domctl.c                 |  8 +++++++-
 5 files changed, 16 insertions(+), 25 deletions(-)

-- 
2.34.1


