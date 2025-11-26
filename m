Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D67D2C8AED9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 17:21:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173064.1498151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIFk-0003ac-GW; Wed, 26 Nov 2025 16:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173064.1498151; Wed, 26 Nov 2025 16:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIFk-0003Yq-DS; Wed, 26 Nov 2025 16:20:24 +0000
Received: by outflank-mailman (input) for mailman id 1173064;
 Wed, 26 Nov 2025 16:20:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ehTD=6C=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vOIFj-0003Yk-83
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 16:20:23 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce46e07b-cae3-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 17:20:21 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CFF0022D57;
 Wed, 26 Nov 2025 16:20:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3572C3EA63;
 Wed, 26 Nov 2025 16:20:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6YWpC8QoJ2lbLQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 26 Nov 2025 16:20:20 +0000
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
X-Inumbo-ID: ce46e07b-cae3-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1764174020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Edyr3JIcssZPzLUBYOKLIR47asUKGoc/LXSm51c/xFM=;
	b=kIa4u0inAxEFPkTeqGZCkDZ4D2vt01np+F6+w+3qFtF+GGEHwE9ugJfZ6Z3Yo6AjO61FjP
	3v9F9272z8Wn2iVrpu9JGA1rtfCfw9Nhmk6iBUbyc1P5Bz5G/72+JtiyzYyEz22PWWq8SE
	T15t07/DIftfkmL6PisqLwrZhtKDMks=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1764174020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Edyr3JIcssZPzLUBYOKLIR47asUKGoc/LXSm51c/xFM=;
	b=kIa4u0inAxEFPkTeqGZCkDZ4D2vt01np+F6+w+3qFtF+GGEHwE9ugJfZ6Z3Yo6AjO61FjP
	3v9F9272z8Wn2iVrpu9JGA1rtfCfw9Nhmk6iBUbyc1P5Bz5G/72+JtiyzYyEz22PWWq8SE
	T15t07/DIftfkmL6PisqLwrZhtKDMks=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-block@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Denis Efremov <efremov@linux.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 0/5] x86: Cleanups around slow_down_io()
Date: Wed, 26 Nov 2025 17:20:13 +0100
Message-ID: <20251126162018.5676-1-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	URIBL_BLOCKED(0.00)[suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Score: -2.80
X-Spam-Flag: NO

While looking at paravirt cleanups I stumbled over slow_down_io() and
the related REALLY_SLOW_IO define.

Especially REALLY_SLOW_IO is a mess, which is proven by 2 completely
wrong use cases.

Do several cleanups, resulting in a deletion of REALLY_SLOW_IO and the
io_delay() paravirt function hook.

Patches 2 and 3 are not changing any functionality, but maybe they
should? As the potential bug has been present for more than a decade
now, I went with just deleting the useless "#define REALLY_SLOW_IO".
The alternative would be to do something similar as in patch 5.

Juergen Gross (5):
  x86/paravirt: Replace io_delay() hook with a bool
  hwmon/lm78: Drop REALLY_SLOW_IO setting
  hwmon/w83781d: Drop REALLY_SLOW_IO setting
  block/floppy: Don't use REALLY_SLOW_IO for delays
  x86/io: Remove REALLY_SLOW_IO handling

 arch/x86/include/asm/floppy.h         | 27 ++++++++++++++++++++++-----
 arch/x86/include/asm/io.h             | 12 +++++-------
 arch/x86/include/asm/paravirt.h       | 11 +----------
 arch/x86/include/asm/paravirt_types.h |  3 +--
 arch/x86/kernel/cpu/vmware.c          |  2 +-
 arch/x86/kernel/kvm.c                 |  8 +-------
 arch/x86/kernel/paravirt.c            |  3 +--
 arch/x86/xen/enlighten_pv.c           |  6 +-----
 drivers/block/floppy.c                |  2 --
 drivers/hwmon/lm78.c                  |  5 +++--
 drivers/hwmon/w83781d.c               |  5 +++--
 11 files changed, 39 insertions(+), 45 deletions(-)

-- 
2.51.0


