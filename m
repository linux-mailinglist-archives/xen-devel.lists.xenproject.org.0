Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 167F63EEA5A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 11:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167684.306104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFvoW-0007Ov-Ui; Tue, 17 Aug 2021 09:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167684.306104; Tue, 17 Aug 2021 09:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFvoW-0007MP-RV; Tue, 17 Aug 2021 09:55:20 +0000
Received: by outflank-mailman (input) for mailman id 167684;
 Tue, 17 Aug 2021 09:55:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OoW9=NI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mFvoV-0007HZ-Pw
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 09:55:19 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 370c78c0-ff41-11eb-a498-12813bfff9fa;
 Tue, 17 Aug 2021 09:55:13 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 499E421ECD;
 Tue, 17 Aug 2021 09:55:12 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 10D8F13318;
 Tue, 17 Aug 2021 09:55:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id r6adAoCHG2FEDwAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 17 Aug 2021 09:55:12 +0000
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
X-Inumbo-ID: 370c78c0-ff41-11eb-a498-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629194112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9AWfd4PjJv9MY/T21Yeryt5HQZJaCzl6pn5VQ/We+pA=;
	b=YbcY86CRFfJq7cur/mmqjqgmHn2aY6iWDi4qD2fa59mDd9X07tRbNV276Spo27OkIb3sAR
	qmE0Hh0xHlQig7P6zZjISPQpmZQ1/fSKj7m9+UH1f7/XbNx2Bmv8YehV4KE6RCPNQ1X87d
	Y1S+9q9CgDK7umzCHABadVGsxDR4jfU=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] mini-os: config related cleanups
Date: Tue, 17 Aug 2021 11:54:57 +0200
Message-Id: <20210817095459.27671-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While writing patch 2 I stumbled over CONFIG_TEST having no effect at
the C source level, so I added patch 1 to avoid further similar
problems.

The additionally fixed CONFIG_XC issue wasn't triggered in any known
case, probably as FTYPE_XC hasn't been used in our code base.

Juergen Gross (2):
  mini-os: make config handling more generic
  mini-os: move test functions under CONFIG_TEST

 Config.mk       | 66 +++++++++++++++++++++----------------------------
 xenbus/xenbus.c | 32 +++++++++++++-----------
 2 files changed, 45 insertions(+), 53 deletions(-)

-- 
2.26.2


