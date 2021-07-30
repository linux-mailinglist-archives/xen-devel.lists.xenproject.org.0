Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1883DB5E3
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 11:26:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162414.297856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9Omh-000754-V8; Fri, 30 Jul 2021 09:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162414.297856; Fri, 30 Jul 2021 09:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9Omh-00073D-Rz; Fri, 30 Jul 2021 09:26:27 +0000
Received: by outflank-mailman (input) for mailman id 162414;
 Fri, 30 Jul 2021 09:26:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MkAV=MW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m9Omg-000732-V0
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 09:26:26 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e670f72-53b1-4fd5-a97c-269b883146c7;
 Fri, 30 Jul 2021 09:26:26 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 35F4F22403;
 Fri, 30 Jul 2021 09:26:25 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id D541313748;
 Fri, 30 Jul 2021 09:26:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id G5/PMsDFA2GeIwAAGKfGzw
 (envelope-from <jgross@suse.com>); Fri, 30 Jul 2021 09:26:24 +0000
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
X-Inumbo-ID: 0e670f72-53b1-4fd5-a97c-269b883146c7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1627637185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KLOQ45tHzHizx5aX7vlKbtwG56MywBepSJB+3y/J3Tc=;
	b=uyzDER+QUurfThKtVP3oER06ju28BMg5KqItSY0E+H65vbfhfpNK3fN+FNbupsalv+jkdT
	XgFWGeSve/iCGZYPrH9Ut2yJUEYs3LUabKIEeTJn8FIo95mdeigRzq1ca5jS8aPtZRDwIO
	CKYPoNU7bo2W+ywawr0yXSnK6NYOYeU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 0/2] xen: fix max_pfn handling for pv guests
Date: Fri, 30 Jul 2021 11:26:20 +0200
Message-Id: <20210730092622.9973-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix some bad naming and setting of max_pfn related variables.

Juergen Gross (2):
  xen: fix setting of max_pfn in shared_info
  xen: rename wrong named pfn related variables

 arch/x86/include/asm/xen/page.h |  4 ++--
 arch/x86/xen/p2m.c              | 33 ++++++++++++++++++---------------
 arch/x86/xen/setup.c            |  2 +-
 3 files changed, 21 insertions(+), 18 deletions(-)

-- 
2.26.2


