Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANeFEXJRj2kNQQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2D6138035
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231323.1536589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2p-0008Bi-Cn; Fri, 13 Feb 2026 16:29:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231323.1536589; Fri, 13 Feb 2026 16:29:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2p-00087X-2Z; Fri, 13 Feb 2026 16:29:27 +0000
Received: by outflank-mailman (input) for mailman id 1231323;
 Fri, 13 Feb 2026 16:29:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtAj=AR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqw2n-0005Wn-5p
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 16:29:25 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27cab0c3-08f9-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 17:29:23 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4836e3288cdso6974395e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 08:29:23 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5ebd1bsm303288185e9.6.2026.02.13.08.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 08:29:22 -0800 (PST)
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
X-Inumbo-ID: 27cab0c3-08f9-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771000162; x=1771604962; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kV1At2uKXk7mbgmcEWB93vzkp5laONizknlqDWczQMQ=;
        b=VCV1ZJRFHswvkdpk0MORmxaaU1qyEV/J9Vp4c0xH67zn1nQdP1CXUZy/DGQhf6PzGg
         g/tqRka1P4uV11AuRNh0U37ky6cZ4lHtf9mmP0lK44N9ZDIusvrLEGxacMaRa7P95o0+
         lSlimhU+ElR6T77znmXVsTYxQtcdPmYryMV69XmT52tHQP+In+wxxniDDXNUdcs8OaJs
         1hVh759YXu5TsWcjyYCRQO80b5HlJMY5t0h0MKJ6cdjMH5dfpJ8vSHUo6BRB5lITxbRL
         63hCfNPAQeu95VU2R9QKqzqUpuv0B7/J67JheOtp/mgAzSrFFwT6A+85AGuICBvgArqT
         a/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771000162; x=1771604962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kV1At2uKXk7mbgmcEWB93vzkp5laONizknlqDWczQMQ=;
        b=mDE1KpvxQgP6bUWHFUN5mvBvX/Mz+qSmsQ16rRqFL/wJSW5QhZtKqccfM4tSFpk0xI
         DPCQlwcPDefSKk7eu8YWaIbZe9GV8fHIV6k+70QkOelo5cndTGON4+B4J1nXxAQUi4FP
         i0KzijO1FZNVsdia1Ydm1HBCjDYW2c0vZ+mRB2fFTaMp/e/Jmdqyl1S2B/AjoA9r/EnH
         nQUrMGNd4L6k7JTPqEoK3K6W3aYvRxIKug+LSi8ZoFttsM2Ch90xmf54p5l/4UHykkbQ
         qezcw1t0WiKGGj2qJdoHa0rQWBiS80BXkN7r2HKwJqK0LikahLJCs0XDpjguIVgaXmj3
         asQw==
X-Gm-Message-State: AOJu0Yx34yJbTUoX0ePb8ZU5/Rh2o3FjbJPxgZeVuOA6w9rbP3P1CRaW
	8mr4calWQIggbbRtjcXzEcdm7VU/689iuk7cw8I8F8b72BbIi9+TEEoQ2K6bvCcH
X-Gm-Gg: AZuq6aLpeD3RHQ0m1WQJ8lNtrHRpeNixgjXkFNg58MT1lI5HEojD/M8SR+atTyepLRI
	/V0QqFlvXKl295KxSQ+kt7LZxA215GL5Dbqbf7o9xWFvj49CvfEOZMlgXF+J/ZS4XGrEUJhJsgI
	Xw+JjGk0W4aejtrW+uc8JYdz+/ZrRUmzD5K2kpPLv4BLVqzCFSqWmQEXMvQXYl4zpO840Os4dYF
	r/+k9T3w0dpkb9gFMKjJYtY5gA7fZJCUQHvGrHq8b5WrspCGLdJMpdHaUZnu06wGc9rRw/6eZ0h
	1FmhKPKAPl1dRYh0W/iaB7v0bjo4nK4fgRADZOmS0/2LDCdC0DXmkOhu6fuaNAQYwgC1LHVAIUU
	eH5orjM4TcOG6bwhs2oz5c+VznrWiuI9Gz+47C41ZkI1uZ7RGGo+aA2roiXJ7gZS082MH/qU09C
	lK3YpqeRWAOJqvVRfISY1MArsb8h2V4Mrt68Ssf7rxRID325693UDvjAtUuTtoqhWOEv/yiQ==
X-Received: by 2002:a05:600c:3b87:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-48378da53a2mr12280675e9.13.1771000162450;
        Fri, 13 Feb 2026 08:29:22 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 11/16] xen/riscv: implement SBI legacy SET_TIMER support for guests
Date: Fri, 13 Feb 2026 17:28:57 +0100
Message-ID: <04f25a5eb19540f1fd6ff3bf4c940933ca3e0b7b.1770999383.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770999383.git.oleksii.kurochko@gmail.com>
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3C2D6138035
X-Rspamd-Action: no action

Add handling of the SBI_EXT_0_1_SET_TIMER function ID to the legacy
extension ecall handler. The handler now programs the vCPU’s virtual
timer via vtimer_set_timer() and returns SBI_SUCCESS.

This enables guests using the legacy SBI timer interface to schedule
timer events correctly.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3 - v4:
 - Nothing changed. Only rebase.
---
Changes in v2:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
 xen/arch/riscv/vsbi/legacy-extension.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/riscv/vsbi/legacy-extension.c b/xen/arch/riscv/vsbi/legacy-extension.c
index 2e8df191c295..090c23440cea 100644
--- a/xen/arch/riscv/vsbi/legacy-extension.c
+++ b/xen/arch/riscv/vsbi/legacy-extension.c
@@ -7,6 +7,7 @@
 
 #include <asm/processor.h>
 #include <asm/vsbi.h>
+#include <asm/vtimer.h>
 
 static void vsbi_print_char(char c)
 {
@@ -44,6 +45,11 @@ static int vsbi_legacy_ecall_handler(unsigned long eid, unsigned long fid,
         ret = SBI_ERR_NOT_SUPPORTED;
         break;
 
+    case SBI_EXT_0_1_SET_TIMER:
+        vtimer_set_timer(&current->arch.vtimer, regs->a0);
+        regs->a0 = SBI_SUCCESS;
+        break;
+
     default:
         /*
          * TODO: domain_crash() is acceptable here while things are still under
-- 
2.52.0


