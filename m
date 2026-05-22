Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZBHSAYt0EGquXgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 17:21:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 909455B6CF8
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 17:21:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316985.1586295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQRge-0004QX-8J; Fri, 22 May 2026 15:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316985.1586295; Fri, 22 May 2026 15:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQRge-0004Np-5N; Fri, 22 May 2026 15:21:20 +0000
Received: by outflank-mailman (input) for mailman id 1316985;
 Fri, 22 May 2026 15:21:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wQRgd-0004Nj-CW
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 15:21:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQRgc-006tQw-O1
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 17:21:18 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a107462-5cb7-0a2a0a5109dd-0a2a4509a194-20
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 17:21:18 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a10746e-2497-0a2a45090019-c387df82dca6-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 17:21:18 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1E4E66BA54;
 Fri, 22 May 2026 15:21:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B9B40593A8;
 Fri, 22 May 2026 15:21:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ficyLG10EGp9HwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 22 May 2026 15:21:17 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1779463278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DcTkyafxokIFyx7B8h9+YsS080oy1Spc+V4mEk4KkX8=;
	b=L0U28bH6eorjODrOXfO400tSigfB7RM6UK/gMxi7NDlPJF+I01yseTFkVqzgPp0k/JxLpI
	vSS4JEbMX5MfWkkWQazlEgoik7Pd0dmC3q1mAbLSx8k1viSY+wwjyyVdlKc+zKEib48ZJG
	Fpd3J8/HhlPRUQUfDxcVZ2HueVl1UPs=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1779463278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DcTkyafxokIFyx7B8h9+YsS080oy1Spc+V4mEk4KkX8=;
	b=L0U28bH6eorjODrOXfO400tSigfB7RM6UK/gMxi7NDlPJF+I01yseTFkVqzgPp0k/JxLpI
	vSS4JEbMX5MfWkkWQazlEgoik7Pd0dmC3q1mAbLSx8k1viSY+wwjyyVdlKc+zKEib48ZJG
	Fpd3J8/HhlPRUQUfDxcVZ2HueVl1UPs=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [PATCH 0/3] x86/xen: Do some Xen-PV related cleanups
Date: Fri, 22 May 2026 17:21:11 +0200
Message-ID: <20260522152114.77319-1-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-purgate-ID: tlsNG-bad1c0/1779463278-88D76A53-3AF6E57F/0/0
X-purgate-type: clean
X-purgate-size: 677
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:linux-trace-kernel@vger.kernel.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:xen-devel@lists.xenproject.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 909455B6CF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Cleanups related to Xen PV mode.

Note that patch 3 might be debatable.

Juergen Gross (3):
  x86/xen: Guard PV-only stuff in xen-ops.h with CONFIG_XEN_PV
  x86/xen: Cleanup Xen related trace points
  x86/xen: Remove Xen debugfs support

 arch/x86/xen/Kconfig       |   7 --
 arch/x86/xen/Makefile      |   2 -
 arch/x86/xen/debugfs.c     |  16 ---
 arch/x86/xen/mmu_pv.c      |   8 ++
 arch/x86/xen/p2m.c         |  45 -------
 arch/x86/xen/xen-ops.h     | 242 ++++++++++++++++++-------------------
 include/trace/events/xen.h |  62 +---------
 7 files changed, 126 insertions(+), 256 deletions(-)
 delete mode 100644 arch/x86/xen/debugfs.c

-- 
2.54.0


