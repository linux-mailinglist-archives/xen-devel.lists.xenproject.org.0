Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 982036AD771
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 07:32:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507205.780462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZQs2-00036Q-Lp; Tue, 07 Mar 2023 06:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507205.780462; Tue, 07 Mar 2023 06:32:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZQs2-00033O-I7; Tue, 07 Mar 2023 06:32:22 +0000
Received: by outflank-mailman (input) for mailman id 507205;
 Tue, 07 Mar 2023 06:32:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JVyd=67=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pZQs1-00033H-24
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 06:32:21 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce776d53-bcb1-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 07:32:18 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 874441F8B2;
 Tue,  7 Mar 2023 06:32:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 39F7013440;
 Tue,  7 Mar 2023 06:32:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ePzJDHHaBmSgWQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 07 Mar 2023 06:32:17 +0000
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
X-Inumbo-ID: ce776d53-bcb1-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678170737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=P4X0rizAn2tmZd0YquP4ywdWqVXsZ5Fyd+f3Q1uuEFE=;
	b=SsGKnzLrQsn59Cs0Edi7164XCKWEJ3uVOH70wvoXr9TcaonjpFUJ0kr3YfUlj4fkntVuuu
	RWoOatgVZGAx4fmP5H9JP3VvuwSl9kJgi8DmhBlmoWBuJC8zANEFObIg4VL6S+FY2Hclfs
	wSAHYvQz7V43eoKzkRzahFJiDuQqysk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] xen: some CONFIG_DEBUG_INFO changes
Date: Tue,  7 Mar 2023 07:32:12 +0100
Message-Id: <20230307063214.30569-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling crash dump analysis of the hypervisor requires the hypervisor
having been built with CONFIG_DEBUG_INFO enabled. Today this requires
either CONFIG_DEBUG or CONFIG_EXPERT set, which are both not security
supported.

This small series changes that in order to allow security supported
Xen builds with the capability to do crash dump analysis via the
"crash" tool.

Juergen Gross (2):
  xen: move CONFIG_DEBUG_INFO out of EXPERT section
  xen: update CONFIG_DEBUG_INFO help text

 xen/Kconfig.debug | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

-- 
2.35.3


