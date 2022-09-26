Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F845EA83E
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 16:19:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411852.654944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocowj-0004zR-By; Mon, 26 Sep 2022 14:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411852.654944; Mon, 26 Sep 2022 14:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocowj-0004xd-8T; Mon, 26 Sep 2022 14:18:57 +0000
Received: by outflank-mailman (input) for mailman id 411852;
 Mon, 26 Sep 2022 14:18:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ba90=Z5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ocowh-0004xX-4v
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 14:18:55 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26422587-3da6-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 16:18:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 322F31F37C;
 Mon, 26 Sep 2022 14:18:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC7D6139BD;
 Mon, 26 Sep 2022 14:18:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qBw/MMy0MWN/BgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 26 Sep 2022 14:18:52 +0000
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
X-Inumbo-ID: 26422587-3da6-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664201933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IJOwLXU5t8JM8hMm9HW6Yq2/D7SfLk9zyZ5L9cgxtWU=;
	b=JGtbcNXpGA40iBntCL6y1LJnluPYXxk3hzbip2fUXMIhzCg1Xn8jmfj2iOPpA9x6KAs9NW
	YFuKaG8NHm486HGNuT/bNwlh+6lojOUffG9Q/iTOc+B+uVsGcwYiAlYTbp+wKKlU1tnWOf
	b9Ixakc+U1inpqhbv2Gcq6mLZpRVhWI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 0/3] xen/pv: sanitize xen pv guest msr accesses
Date: Mon, 26 Sep 2022 16:18:46 +0200
Message-Id: <20220926141849.21805-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Historically when running as Xen PV guest all MSR accesses have been
silently swallowing any GP faults, even when the kernel was using not
the *msr_safe() access functions.

Change that by making the behavior controllable via kernel config and
via a boot parameter.

This will help finding paths where MSRs are being accessed under Xen
which are not emulated by the hypervisor.

Juergen Gross (3):
  xen/pv: allow pmu msr accesses to cause GP
  xen/pv: refactor msr access functions to support safe and unsafe
    accesses
  xen/pv: support selecting safe/unsafe msr accesses

 .../admin-guide/kernel-parameters.txt         |  6 ++
 arch/x86/xen/Kconfig                          |  9 ++
 arch/x86/xen/enlighten_pv.c                   | 97 +++++++++++++------
 arch/x86/xen/pmu.c                            | 44 +++++----
 4 files changed, 110 insertions(+), 46 deletions(-)

-- 
2.35.3


