Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D573899D1B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 14:35:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701245.1095564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsimR-0005vb-MW; Fri, 05 Apr 2024 12:34:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701245.1095564; Fri, 05 Apr 2024 12:34:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsimR-0005tC-Jh; Fri, 05 Apr 2024 12:34:51 +0000
Received: by outflank-mailman (input) for mailman id 701245;
 Fri, 05 Apr 2024 12:34:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=my07=LK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rsimQ-0005d8-8o
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 12:34:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e42f39c2-f348-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 14:34:48 +0200 (CEST)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 51D5821A42;
 Fri,  5 Apr 2024 12:34:48 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id E9EF1139E8;
 Fri,  5 Apr 2024 12:34:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id VZuqN+fvD2adGgAAn2gu4w
 (envelope-from <jgross@suse.com>); Fri, 05 Apr 2024 12:34:47 +0000
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
X-Inumbo-ID: e42f39c2-f348-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712320488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c0jyNvKTHax+A0LD2eIp7A6uzmXI0s1Z7nkLE2AaG4I=;
	b=AubcmXMIMx2JuozlxaVZ6aoO1vmLMUD9McUXagcomdrknSUs72w/jRG5+BoqixzGF0Ynsw
	cmF67Yy8MEYjggWpzTKsZzIbF3YbDaUtLurvHF8BAWTkjzVGze/+nrAloogUfDHSOItTDP
	iSROy7dI6S/oknWyfBY5jJI1PiOF/E4=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712320488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c0jyNvKTHax+A0LD2eIp7A6uzmXI0s1Z7nkLE2AaG4I=;
	b=AubcmXMIMx2JuozlxaVZ6aoO1vmLMUD9McUXagcomdrknSUs72w/jRG5+BoqixzGF0Ynsw
	cmF67Yy8MEYjggWpzTKsZzIbF3YbDaUtLurvHF8BAWTkjzVGze/+nrAloogUfDHSOItTDP
	iSROy7dI6S/oknWyfBY5jJI1PiOF/E4=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 2/2] x86/xen: return a sane initial apic id when running as PV guest
Date: Fri,  5 Apr 2024 14:34:34 +0200
Message-Id: <20240405123434.24822-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240405123434.24822-1-jgross@suse.com>
References: <20240405123434.24822-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,imap2.dmz-prg2.suse.org:rdns,suse.com:email]

With recent sanity checks for topology information added, there are now
warnings issued for APs when running as a Xen PV guest:

  [Firmware Bug]: CPU   1: APIC ID mismatch. CPUID: 0x0000 APIC: 0x0001

This is due to the initial APIC ID obtained via CPUID for PV guests is
always 0.

Avoid the warnings by synthesizing the CPUID data to contain the same
initial APIC ID as xen_pv_smp_config() is using for registering the
APIC IDs of all CPUs.

Fixes: 52128a7a21f7 ("86/cpu/topology: Make the APIC mismatch warnings complete")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/enlighten_pv.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index ace2eb054053..965e4ca36024 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -219,13 +219,20 @@ static __read_mostly unsigned int cpuid_leaf5_edx_val;
 static void xen_cpuid(unsigned int *ax, unsigned int *bx,
 		      unsigned int *cx, unsigned int *dx)
 {
-	unsigned maskebx = ~0;
+	unsigned int maskebx = ~0;
+	unsigned int or_ebx = 0;
 
 	/*
 	 * Mask out inconvenient features, to try and disable as many
 	 * unsupported kernel subsystems as possible.
 	 */
 	switch (*ax) {
+	case 0x1:
+		/* Replace initial APIC ID in bits 24-31 of EBX. */
+		maskebx = 0x00ffffff;
+		or_ebx = smp_processor_id() << 24;
+		break;
+
 	case CPUID_MWAIT_LEAF:
 		/* Synthesize the values.. */
 		*ax = 0;
@@ -248,6 +255,7 @@ static void xen_cpuid(unsigned int *ax, unsigned int *bx,
 		: "0" (*ax), "2" (*cx));
 
 	*bx &= maskebx;
+	*bx |= or_ebx;
 }
 
 static bool __init xen_check_mwait(void)
-- 
2.35.3


