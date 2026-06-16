Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YGTqNlopMWrKcwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:45:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CF768E6C2
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:45:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=TdFAf7Vi;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1339106.1600237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZRIa-0006c2-1T; Tue, 16 Jun 2026 10:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339106.1600237; Tue, 16 Jun 2026 10:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZRIZ-0006Ze-Uk; Tue, 16 Jun 2026 10:45:39 +0000
Received: by outflank-mailman (input) for mailman id 1339106;
 Tue, 16 Jun 2026 10:45:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZRIY-0006YJ-Iz
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:45:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZRIX-00GM8C-Vw
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 12:45:37 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a31293c-2eae-0a2a0a5409dd-0a2a4505ca2e-46
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:45:37 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a312951-aaa8-0a2a45050019-d155802bf099-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:45:37 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-491609cdd8fso22330335e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 03:45:37 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a0e9e4sm49201585e9.0.2026.06.16.03.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 03:45:36 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1781606737; x=1782211537; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zSlbWj2fiDx6tU7ujT7ONkvXF3dF+bXdnNBNjMMAAlE=;
        b=TdFAf7ViwuwtPZDfYTbnZoXORTI7DYgLHB5hq86qHM0EQfPzxxRaPSjb6FV6ZgHG6r
         LlS4jUN89j0ql1dL/PX14gz5PS4kh1cBPyFzgTRXafHTMqf+OQ77t4fvXNhU8pGyAI5j
         ineVN9bMTb4V+EHS3o4/o4VoRce7FvZ+24MMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781606737; x=1782211537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSlbWj2fiDx6tU7ujT7ONkvXF3dF+bXdnNBNjMMAAlE=;
        b=gCz0vWXfIJ/0PWkAshjBOMxlF9rb2YQIWcuuA9bjAaBkqIAka1hCZeGNas51yqcTlI
         7vcep56UXcGBZVRyB3Uqi3V4ur1/9WYm8EAFyOHSV4gYZO0uiJQVAu7SJWugPzRDt/iq
         oT4JlspWaogzQjYwu67Y22/dK+ffNVt+l2SVCe05Ux7UHnkoFE0qmqOwDzjPQ3xMoPgM
         3gYbQdQCi5yHdwdvLiluRaKwD1Wcta26H27Xt/kpRTGco4/q8EwgwiVyZMt4YIAvEmkn
         AM1Y8YL+RySN5IWfw5CagYd8V9Dh5NcOpTXumtrDE61NYJRcwe2EheApuORFyYlO2TY4
         6O2A==
X-Gm-Message-State: AOJu0YzvBi5B0ov8X3DfRnr0WfDVL6g4FVIeNtSkzv7DynMPeCXcUfVl
	UrYOzqmfZyN2cp41fJDBZ6YYQVz0WWoEQmIkyp2NOKxPAKXPAJMzJXaAPhLEH6rITucoyRPd1uV
	d0pbb
X-Gm-Gg: Acq92OEkZ4M4+EDUf+0R6bNDsWrVLvujQ/Q7GKTQgOW0aOEXZkYHXzyJ9Uf8X52mPG6
	YGNJIAqTw/W8b8cDcJVzn8KMprpGMG9CBgc1ImrrCXIKbCDF0Yp24FQiN1644DarCli61rRGWPZ
	ULneemVx3ca6OuRelZbvYbTTlc4SYqtqmQ8QxYyW2aH74rUZHWQLVMnXXibHE33yTz++E7MAVJT
	PalrY/FXi8xvsWSRhfn/U95YREhYr472ZoEIGPttWxM21RUgN8vZxc0sgwt47d27syhYZGhEOjP
	lEYfNm7xHV63uuz7Dg/aq2K5wR8ywRH6jGrcRqA5CHccJJLdzIoG6WpfSawqry8hTnefk06DDuK
	UdLk7BgUESxWP3CduKXQkVFcnP+TCZ08LMbiY8q3ttn0BoUxygQ2fmhKUB6/xwYPoHHVX3MaTAg
	ueeKsIcl0cqsntrmGY+j7+rFV7SScUnwFHWTklJVHbMcy2LapiHg42g/DJMQC91HwOAXq4hlFC3
	Zdg
X-Received: by 2002:a05:600c:4e04:b0:490:a298:acf7 with SMTP id 5b1f17b1804b1-4922ffaeacbmr45971965e9.17.1781606736970;
        Tue, 16 Jun 2026 03:45:36 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.22] x86/ucode: Exclude Zen6 from entrysign digest checking
Date: Tue, 16 Jun 2026 11:45:34 +0100
Message-Id: <20260616104534.22995-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1781606737-DA56B443-4295D8F9/10/73395122804
X-purgate-type: spam
X-purgate-size: 1351
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[citrix.com,suse.com,vates.tech,gmail.com];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87CF768E6C2

There is a 3rd path which should have gained an is_zen6_uarch() check to
exclude Zen6 from entrysign mitigations.

Fixes: bd15fdedafb3 ("x86/ucode: Exclude Zen6 from entrysign mitigations")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

For 4.22.  This wants backporting too.
---
 xen/arch/x86/cpu/microcode/amd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 2ba1fa825f2f..2d4911022835 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -128,7 +128,8 @@ static bool check_digest(const struct container_microcode *mc)
      * the digest of the patch against a list of known provenance.
      */
     if ( boot_cpu_data.family < 0x17 || boot_cpu_data.family > 0x1a ||
-         entrysign_mitigated_in_firmware || !opt_digest_check )
+         is_zen6_uarch() || entrysign_mitigated_in_firmware ||
+         !opt_digest_check )
         return true;
 
     pd = bsearch(&patch->patch_id, patch_digests, ARRAY_SIZE(patch_digests),

base-commit: 1cfceee62d8b086a1713d04522f741a09d50cbb3
-- 
2.39.5


