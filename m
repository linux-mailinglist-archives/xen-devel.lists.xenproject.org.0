Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eK0LH0DNeGmNtQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 15:35:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 254F295D06
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 15:35:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214872.1525124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkk9n-0003dt-6b; Tue, 27 Jan 2026 14:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214872.1525124; Tue, 27 Jan 2026 14:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkk9n-0003bM-3i; Tue, 27 Jan 2026 14:35:03 +0000
Received: by outflank-mailman (input) for mailman id 1214872;
 Tue, 27 Jan 2026 14:35:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezQq=AA=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vkk9l-0003bG-FQ
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 14:35:01 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b467e7c-fb8d-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 15:34:59 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso44617475e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 06:34:59 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d5f422csm137571595e9.2.2026.01.27.06.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 06:34:57 -0800 (PST)
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
X-Inumbo-ID: 5b467e7c-fb8d-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1769524498; x=1770129298; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6jlsuAxDMybtaLr9AI1V7wQPqeY+1qN0TesPdnUkkpM=;
        b=eUOuFiRV66Fa237ACC5T5ULYmaWS0vzxTaEphSp8tpNuxn6mWZhUQ0aFN4f3pA5x5P
         NCqEBihaTEqrF/RcmJ0cGHqKkXsxxsMIq3XnQXXaAi12iV1pFdMBqKT/3WicVoqYgM9A
         dJhBHTgKhKq+fcnt/izhrz5dnto4QoTQFpsy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769524498; x=1770129298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jlsuAxDMybtaLr9AI1V7wQPqeY+1qN0TesPdnUkkpM=;
        b=ddQsDsoHWs84FV8BLt/Fk8VgB/b98Psrlb3TF4NL4kfKFuo+cB6vuhC+BAftIZdsz7
         xcGCH5JLfWDa05xwS+i3FUM4O59pTmlMUTQFrRWJmOPxsP2uYA9IZfYJqiTzgJ/1VWKv
         qhWpp1YeLoQdNwhvzA+c5yCHcvSKYAKntLL/NrBzdoKuKnvtyYQz33/1/b6ZqlUaktNZ
         8RIwqJxRcXOUYGVmeSzZPgN/xtuQOfj9nQBOmlrVhEISey+/Fc2IlDmrAccpXx1BbqW3
         fDoLS1SNy2MSG6NBkpJEZ7rfxjLXzPuOrDWwToajuCpVrKeBVnwvFhKMEAqaMeS46Je+
         myGg==
X-Gm-Message-State: AOJu0Ywmy/inSa6bNhLJBhHhz7n+QxOmik+6vdtwf35tINVeewv1iBhh
	sSpGuUZih5ZP4m9BxSXKw6Q6FDUldzCaPQw/akHcgcXaU/uRvJbTZD/S0/YQRMxTwew0SC07vwf
	g0wLe
X-Gm-Gg: AZuq6aJBXXQueW3Ut4r7Wpydmiyg1b8amBjv95w/YmLT9FGCP8Eu6BAdeVRYmi+xrRa
	J5T48BPzuTMT4bEv52QQEQ3p4CBX5G1mlxb1wf+PlhLc55lnSzbA8co05Nt79w5JHqdoZFYtTt+
	vepB4P5KWpoBHcSozpf0/fShsgap5XSf5ia64kL310SmldI9qgO1hcs/pwaBce12md9somyylD3
	0zxHCuTJF19bQPSa+oLV797xLbqaUn3CoeP041+yGEWmhf6A/Lj/KJWzGAyYs+upo/ESptYBwiL
	cM8vk4wkgZlFC5PL5HaD+1u8X4gWuCbLevXTaqG31q/JJkBeSWiS4ltapny5G7uAQgJWSKDglns
	t+qDcnWALHyIXs7N08jcC0lWL8jLay1OFtT/QP6ZrKt9GO8DDK04WJGYZj2FS4Mi/QK7EowubOZ
	doTrcUNpCTFxntVOYmz8rxrOVI6fZNPi08jdFNA7r7ki+hCXBboL+daB6evVd9szHjlM+f7g==
X-Received: by 2002:a05:600c:8b8b:b0:47e:e20e:bbb0 with SMTP id 5b1f17b1804b1-48069c2c15fmr27691825e9.6.1769524498191;
        Tue, 27 Jan 2026 06:34:58 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/ucode: Support discrete modules being CPIO archives
Date: Tue, 27 Jan 2026 14:34:56 +0000
Message-Id: <20260127143456.2260369-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 254F295D06
X-Rspamd-Action: no action

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>

RFC.  The docs update are rather nasy, and will take longer than I have right
now.
---
 xen/arch/x86/cpu/microcode/core.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 55baf7386400..1dbc3749e531 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -760,6 +760,7 @@ static int __init early_microcode_load(struct boot_info *bi)
     void *data = NULL;
     size_t size;
     struct microcode_patch *patch;
+    struct cpio_data cd;
     int idx = opt_mod_idx;
     int rc;
 
@@ -776,7 +777,6 @@ static int __init early_microcode_load(struct boot_info *bi)
         for ( idx = 0; idx < bi->nr_modules; ++idx )
         {
             const struct boot_module *bm = &bi->mods[idx];
-            struct cpio_data cd;
 
             /* Search anything unclaimed or likely to be a CPIO archive. */
             if ( bm->kind != BOOTMOD_UNKNOWN && bm->kind != BOOTMOD_RAMDISK )
@@ -844,6 +844,18 @@ static int __init early_microcode_load(struct boot_info *bi)
                    idx, size);
             return -ENODEV;
         }
+
+        /*
+         * If this blob appears to be a CPIO archive, try interpreting it as
+         * one.  Otherwise treat it as a raw vendor blob.
+         */
+        cd = find_cpio_data(ucode_ops.cpio_path, data, size);
+        if ( cd.data )
+        {
+            data = cd.data;
+            size = cd.size;
+        }
+
         goto found;
     }
 

base-commit: 18e255253a5a326deff0ade386e36d7965164533
-- 
2.39.5


