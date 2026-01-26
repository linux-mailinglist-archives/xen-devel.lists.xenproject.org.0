Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CFQNVOqd2k8kAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BCC8BCA1
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213832.1524299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmi-0004pO-GU; Mon, 26 Jan 2026 17:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213832.1524299; Mon, 26 Jan 2026 17:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmi-0004iV-5x; Mon, 26 Jan 2026 17:53:56 +0000
Received: by outflank-mailman (input) for mailman id 1213832;
 Mon, 26 Jan 2026 17:53:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tkY=77=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vkQmg-0004HX-JQ
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 17:53:54 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9452f2f-fadf-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 18:53:51 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so54601965e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 09:53:51 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c10dbasm3896455e9.15.2026.01.26.09.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:53:50 -0800 (PST)
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
X-Inumbo-ID: f9452f2f-fadf-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1769450031; x=1770054831; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyRXQCzMht59KNrjuruuDRnKF4fVxlGPuMfpmypUDsw=;
        b=P0MOH0fmzKdVPVOgODqc0ejXooP6WD/ethCQC5LKp6eElyFAZQ0UI/EKzSsDW/2+6z
         eX8f8+q+o2bE1yuUPPwJkM3sZaLHTMEnAq6YHHo/0vtwGbmEGgkDOXUVx3HXIHvLOoUX
         FthmN8rXvAoCUC2yFAlTG0ZYLNJihJIDfHJiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769450031; x=1770054831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zyRXQCzMht59KNrjuruuDRnKF4fVxlGPuMfpmypUDsw=;
        b=aapvZCnwpqhsrkEz8YU7ZSX7HHehnD6B6owZ+QANk9MAgUZ9FXgfxuIujdSBB9ysHY
         xyiSVH91bF6E6sY1RXd/SeKONsZgrnfFdyrwz+pyqOwyLvOySx9sPWzj278lqfplStJ9
         y4V5rwDz69ECh1u3nIt0Rr8feQ7JnS/MnDUsWaqj6CDtfyL5L+W1SXtKHRPa1ASGHgKx
         aLIQo53c47N8iQzrTA/uXYGqYI48h7GtdNnirJZfqKkClXCgwKz17mWliw7PcNe2+ePp
         xNkZ7ZUnNyT1WaMI/gEJTrkppRfLEH16JKI/L7pxqRCLBgs0LLc3CnCqTBNyC2fUqx+y
         bZBA==
X-Gm-Message-State: AOJu0YxYVhYi6WAAY8Rbo1X1xVDMpZP+hFrgYtJusYf8ulpoQH22fbgU
	dW8uQq6gOfzEeEkUgaiBBpCmOlIOSv5GnLFMsGuaZjRQGCR5W+s9/NjVire6AkyscUr8gEhc0/s
	Ww18+
X-Gm-Gg: AZuq6aKnv7W1HkceKpc6d547aoEy/qjLwlPrhVuxfSU2mUbT9Hze1XZW1mgcofTOsYQ
	DTkyr0zcqqpyL7n6838JbfmBJTq6be5TX/P4w8Z/7VxwIeDl9TYNrBF8vZmCX0DgbL5rr/S5t+n
	XZPbhP87cs2J3t435g2TX4BsUGhAYDIVuFTmcX7LtIw0xDuoft/YAYdrMeFHJE6j441IFRusj6D
	J3pm3AFCVHvP4CrRlaFvpEMupyt8kvaI4+j+uggyJ36oIPvH4kuZ0hV1lslpWwKe/TjOCyFpEN8
	OUpzEl7pnig79VhVGMpDapm7ZgxAuntyyLCHJet3e6W6v7xM7QoDCtK2H2lKsa7AgcAyJi1YC2h
	8jqoGvCklMETZr8bmuLFNoWxa7ysPF+yI1PFWjgIy6QTR8WIU0RxRgfcYhxrA32c9DJpG48TudU
	GCJziuGsKJhw+efB4EGnCRZyTG0I/hXLE4rbfhftio7nBOP7PGB+DKKf7W5bZ4RmaAAzWxjWqr
X-Received: by 2002:a05:600c:1e2a:b0:471:14b1:da13 with SMTP id 5b1f17b1804b1-4805ce4dec1mr81666095e9.14.1769450030839;
        Mon, 26 Jan 2026 09:53:50 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH 03/16] x86/intel: Drop the paddr_bits workaround for P4 Nocona/Prescott CPUs
Date: Mon, 26 Jan 2026 17:53:32 +0000
Message-Id: <20260126175345.2078371-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 97BCC8BCA1
X-Rspamd-Action: no action

These are 32bit CPUs only.  64bit support started with model 4 (Prescott-256).

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Julian Vetter <julian.vetter@vates.tech>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Kevin Lampis <kevin.lampis@citrix.com>

This ideally wants backporting to 4.20 along with the rest of the VFM cleanup
in order to support DMR/NVL, which ends with removing the x86_ prefixed names.
---
 xen/arch/x86/cpu/intel.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index d585161dd32f..eec6ee763040 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -335,11 +335,6 @@ static void cf_check early_init_intel(struct cpuinfo_x86 *c)
 	    bootsym(trampoline_misc_enable_off) & MSR_IA32_MISC_ENABLE_XD_DISABLE)
 		printk(KERN_INFO "re-enabled NX (Execute Disable) protection\n");
 
-	/* CPUID workaround for Intel 0F33/0F34 CPU */
-	if (boot_cpu_data.x86 == 0xF && boot_cpu_data.x86_model == 3 &&
-	    (boot_cpu_data.x86_mask == 3 || boot_cpu_data.x86_mask == 4))
-		paddr_bits = 36;
-
 	if (c == &boot_cpu_data) {
 		uint64_t misc_enable;
 
-- 
2.39.5


