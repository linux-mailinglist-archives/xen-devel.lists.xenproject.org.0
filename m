Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD3F5F5312
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 13:03:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416065.660688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og2BA-0006uz-EK; Wed, 05 Oct 2022 11:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416065.660688; Wed, 05 Oct 2022 11:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og2BA-0006sa-BG; Wed, 05 Oct 2022 11:03:08 +0000
Received: by outflank-mailman (input) for mailman id 416065;
 Wed, 05 Oct 2022 11:03:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1og2B8-0006sU-Sj
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 11:03:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4998a7f4-449d-11ed-964a-05401a9f4f97;
 Wed, 05 Oct 2022 13:03:05 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0FDCB218FE;
 Wed,  5 Oct 2022 11:03:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B03A313345;
 Wed,  5 Oct 2022 11:03:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dt+zKWhkPWPbQgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 05 Oct 2022 11:03:04 +0000
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
X-Inumbo-ID: 4998a7f4-449d-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664967785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Mn2ERzJt4xEctpaemvG4sO9hC3a9tpeTQ3BtEW76vKI=;
	b=PfVG4z/1OzaVpXpTB/EtYtDvm0Clx6Ojw24ScC8wkwrg3FX8MZ8CHsTfH1GXTTEqfOLljI
	152mpZVrMGozo3d/l+uCpTkGfqL//JcoKMWw2bvXKyPv1mgILh/FNFjVO1X1o+Cwc253iA
	3zrdguoCBHG1ytezJtEmFNBAJURdWzg=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-doc@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 0/4] xen/pv: sanitize xen pv guest msr accesses
Date: Wed,  5 Oct 2022 13:02:58 +0200
Message-Id: <20221005110302.13455-1-jgross@suse.com>
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

Changes in V3:
- new patch 2
- addressed comments

Juergen Gross (4):
  xen/pv: add fault recovery control to pmu msr accesses
  xen/pv: fix vendor checks for pmu emulation
  xen/pv: refactor msr access functions to support safe and unsafe
    accesses
  xen/pv: support selecting safe/unsafe msr accesses

 .../admin-guide/kernel-parameters.txt         |  6 ++
 arch/x86/xen/Kconfig                          |  9 ++
 arch/x86/xen/enlighten_pv.c                   | 99 +++++++++++++------
 arch/x86/xen/pmu.c                            | 71 +++++++------
 4 files changed, 127 insertions(+), 58 deletions(-)

-- 
2.35.3


