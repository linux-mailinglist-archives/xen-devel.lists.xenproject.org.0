Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D84C899D19
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 14:35:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701244.1095554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsimK-0005g4-F4; Fri, 05 Apr 2024 12:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701244.1095554; Fri, 05 Apr 2024 12:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsimK-0005dE-CE; Fri, 05 Apr 2024 12:34:44 +0000
Received: by outflank-mailman (input) for mailman id 701244;
 Fri, 05 Apr 2024 12:34:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=my07=LK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rsimJ-0005d8-El
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 12:34:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddbcb245-f348-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 14:34:38 +0200 (CEST)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E95B921A41;
 Fri,  5 Apr 2024 12:34:36 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 8591F139E8;
 Fri,  5 Apr 2024 12:34:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id Wiq9HtzvD2Z8GgAAn2gu4w
 (envelope-from <jgross@suse.com>); Fri, 05 Apr 2024 12:34:36 +0000
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
X-Inumbo-ID: ddbcb245-f348-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712320477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VqNA5Y/xBRyL+e1bT5top3t6My101/ZhLt7zIZIlphg=;
	b=O+PU4oLghfVlWdlh3NhIkqh0c3pkoddQgyKwOfYuKB6f2NP47euEpQ4ZO21fdaKOvR2VK1
	LYnLqRSvXfhMYCu7NA1zsnaYGFjNp7z1RYv7dkFASzgLeO64gNK1bxlhGrIzV+DsMBcvVA
	8rHtut0WmAq/SU+sqJoDGDoRuymKukM=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712320476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VqNA5Y/xBRyL+e1bT5top3t6My101/ZhLt7zIZIlphg=;
	b=WZX5xUa5SG4XnY8crJF2mCiSBDBxA88vl3w6/RFyw7Tb2Q1Yihf9VvV57t7jD1C10qPyNo
	FgtjOSG0rwVq0bA6QOaqfJIW9UhVRlpGPnEJtrcylLWTptoENvfx8phqqOAEX7kr7QYDhl
	Qh6WVvXABMC9GOaRb2Zj2epu2IOu5/E=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 0/2] x86: Two fixes related to Xen PV guest mode
Date: Fri,  5 Apr 2024 14:34:32 +0200
Message-Id: <20240405123434.24822-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [0.14 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.06)[60.95%];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,imap2.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 0.14
X-Spam-Flag: NO

These are 2 fixes for issues introduced by topology related changes
added in the 6.9 merge window.

Juergen Gross (2):
  x86/cpu: fix BSP detection when running as Xen PV guest
  x86/xen: return a sane initial apic id when running as PV guest

 arch/x86/kernel/cpu/topology.c |  2 +-
 arch/x86/xen/enlighten_pv.c    | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.35.3


