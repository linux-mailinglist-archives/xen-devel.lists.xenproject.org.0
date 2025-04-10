Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5FCA83DDC
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 11:07:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945047.1343316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2nsT-0000uM-0Z; Thu, 10 Apr 2025 09:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945047.1343316; Thu, 10 Apr 2025 09:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2nsS-0000su-Tr; Thu, 10 Apr 2025 09:07:16 +0000
Received: by outflank-mailman (input) for mailman id 945047;
 Thu, 10 Apr 2025 09:07:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VA9I=W4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u2nsR-0000so-Gp
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 09:07:15 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3191fa15-15eb-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 11:07:14 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D22341F385;
 Thu, 10 Apr 2025 09:07:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A1A8813886;
 Thu, 10 Apr 2025 09:07:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id lkqyJUGK92fsEwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 10 Apr 2025 09:07:13 +0000
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
X-Inumbo-ID: 3191fa15-15eb-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1744276033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RG7oQRjFPo5SBEne+qF+QsXhTklGTjoy3A92M4wO+nQ=;
	b=rnfbOnJAt0PWbB5EB4jloFMZnFTr7l30kkKUkNt0cDMO5PpMw02A0mZ4htztTfQ1jL/jIj
	YcCoJFc4SQzSD2DuRALbHQVoU6VZby1tMujaB/jNB4GUXN4+4aRIVSHLPr4fCH1MAIbklL
	QAFFLq93Z62Wv3HQbYikYytZceRLtck=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1744276033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RG7oQRjFPo5SBEne+qF+QsXhTklGTjoy3A92M4wO+nQ=;
	b=rnfbOnJAt0PWbB5EB4jloFMZnFTr7l30kkKUkNt0cDMO5PpMw02A0mZ4htztTfQ1jL/jIj
	YcCoJFc4SQzSD2DuRALbHQVoU6VZby1tMujaB/jNB4GUXN4+4aRIVSHLPr4fCH1MAIbklL
	QAFFLq93Z62Wv3HQbYikYytZceRLtck=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.15-rc2
Date: Thu, 10 Apr 2025 11:07:13 +0200
Message-ID: <20250410090713.30027-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.15a-rc2-tag

xen: branch for v6.15-rc2

It contains the following patches:

- A simple fix adding the module description of the Xenbus frontend
  module.

- A fix correcting the xen-acpi-processor Kconfig dependency for PVH
  Dom0 support.

- A fix for the Xen balloon driver when running as Xen Dom0 in PVH mode.

- A fix for PVH Dom0 in order to avoid problems with CPU idle and
  frequency drivers conflicting with Xen.


Thanks.

Juergen

 arch/x86/xen/enlighten.c                   | 10 +++++++++
 arch/x86/xen/enlighten_pvh.c               | 19 ++++++++++++++++-
 arch/x86/xen/setup.c                       |  3 ---
 drivers/xen/Kconfig                        |  2 +-
 drivers/xen/balloon.c                      | 34 +++++++++++++++++++++---------
 drivers/xen/xenbus/xenbus_probe_frontend.c |  1 +
 6 files changed, 54 insertions(+), 15 deletions(-)

Arnd Bergmann (1):
      xenbus: add module description

Jason Andryuk (1):
      xen: Change xen-acpi-processor dom0 dependency

Roger Pau Monne (2):
      x86/xen: fix balloon target initialization for PVH dom0
      x86/xen: disable CPU idle and frequency drivers for PVH dom0

