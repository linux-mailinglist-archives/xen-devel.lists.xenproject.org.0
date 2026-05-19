Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGp5Jco+DWrsuwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 06:55:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9DC587A5A
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 06:55:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313072.1583657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPYxG-00039b-G4; Wed, 20 May 2026 04:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313072.1583657; Wed, 20 May 2026 04:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPYxG-00037m-D9; Wed, 20 May 2026 04:54:50 +0000
Received: by outflank-mailman (input) for mailman id 1313072;
 Tue, 19 May 2026 13:48:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@gmail.com>) id 1wPKoI-0003dj-Jf
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:48:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPKoH-0071ua-Vw
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 15:48:38 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <cody.zuschlag@gmail.com>)
 id 6a0c6a31-e002-0a2a0a5209dd-0a2a4508b8e2-14
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 15:48:37 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <cody.zuschlag@gmail.com>)
 id 6a0c6a35-63b5-0a2a45080019-d1558036a4bb-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 15:48:37 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-48fde648a71so26188345e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 06:48:37 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:e14:c050:d89c:b9ee:3c77:9607])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a6454sm47044875f8f.34.2026.05.19.06.48.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 May 2026 06:48:36 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779198517; x=1779803317; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=47TB1hZahUbrGTp+tRN8YySgvXEl2GQ3Glx2CwxaA4o=;
        b=hbOiVOKShZ/Bw183Gm6VXURvOb/4MIdjn26d3HosFuG9KTPLLnZjVeZKT/kLmvBnwa
         dYt6xOryx0kLxNf89ByeAOndkCbORR71c4bnh4wIM7oJuG2xVGfddpbUFdBsr8a8PVQz
         StxGCboMh2RBGmy4YFO8kyqEqrWuapuYsS2l5QVaXfEEHhvZc6AHIml5UaAVL+fg1QVv
         lZRliyHknF3/DuidpHEQb+1fVJAvogMgD3Cww3ugNViYacAitZiE1oROyHxizg19FIl7
         VvwSMev+BQHExMujl0k6n+YyHQgVl3pRS900mEBb9GBNgnDJLDhe7EaFDHiYiXOv/6h6
         LVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779198517; x=1779803317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47TB1hZahUbrGTp+tRN8YySgvXEl2GQ3Glx2CwxaA4o=;
        b=dgbBTcCbTgBmz25wv9nOqPQpCx65c7T7T4aRmr0xRx9FaMAB8re2X6hvl0XWOiyNgi
         U6tMjF7/Qv4VtIiPnMhrLJlqR8+WIX3o+wgdBMhvyiUr4+86hCO6S+FqffEfmdsURLEV
         U6FosdCsNRmu2s5UnC4rENV5gwmSnCF4exJlfLAp3IAMGb0Zmk4qPj+w5guMMa6piUY3
         5rERKuq5Yp6UwhMQjmo3kaGe9H8JsRRYBYpmTAUSzOhW38zH0wwwI/kaLOgipvOjbNa0
         tyEV1zHFq/aMHJx/rRihO7H0yqahavEqhBCBg/+Q9nn+qt1r2P1r1IQ26rEv35o6zTdP
         6Zzg==
X-Gm-Message-State: AOJu0Ywd9IsStOeVQAKKVrOlGV5+AtrkPljG2U/6v6uSWuiLmjb+4X7r
	HNhk30MWruqP4ijvsPtSKXz2YWxwbyVesW7KZt/vAuqHoBXd6SEPEGWHZ0tOrKTswSI=
X-Gm-Gg: Acq92OFwmNm0LVN8SuYIWI3wropg8Rijq+OmbILChyZF8PeytnMPVVKxwq+fGfJG/Vc
	VlRon/XNi7s3MP5kzMi7b+Jv5crceCci9KVUPZ+CmCYF1oskV0TE47DfJGSGVYC99N216x3PL7w
	p24v6C1zXDak/sWTmwfANocnrXDnJohgI9bYi+jgc531IGo8Wx7FkOHQiMfkzTAnUKN9iw44l5r
	JF+FUuRJRHc+POJP6fnkHr4iGS9AUY7H+rMWqsgr6Oijt37V834V7RShHNFnGS/5bFjjelypRAz
	0XZWUW/+82zeeA1ZYsDzs+m5pkp99MJRVa/hgy/Ymt2ZOVc5/OsTn4huQ/dSa7hOA4ExZ83b+eE
	xkjaFJfReU+TQIT8pPx30OVihNqP6IrOjWZeugVRUXRDHMNqVMy2L0n60PWUnd29smlCZB17ZF7
	WFkQhuO0WKdHR0xQtuPCz/S3zKjffL0fHK3amMKaluR/h0VZqm3eHNQbT5kNwZs5i7
X-Received: by 2002:a05:600c:41c7:b0:488:a502:8955 with SMTP id 5b1f17b1804b1-48fd6325dc2mr217213535e9.4.1779198516731;
        Tue, 19 May 2026 06:48:36 -0700 (PDT)
From: Cody Zuschlag <cody.zuschlag@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	Cody Zuschlag <cody.zuschlag@gmail.com>
Subject: [PATCH] docs/process: document AI-assisted patch tags
Date: Tue, 19 May 2026 15:44:18 +0200
Message-ID: <20260519134417.16024-2-cody.zuschlag@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1779198517-BC159DB1-A86A7BA2/0/0
X-purgate-type: clean
X-purgate-size: 2332
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:cody.zuschlag@gmail.com,m:codyzuschlag@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[codyzuschlag@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[codyzuschlag@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EA9DC587A5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch adds lightweight guidance for AI-assisted patch

attribution via an Assisted-by tag.

The proposal is inspired by similar Linux kernel documentation,

while keeping the Xen guidance intentionally minimal and aligned

with the existing sending-patches documentation.

Feedback welcome.


docs/process: document AI-assisted patch tags

Add documentation for the Assisted-by tag to clarify how
AI-assisted tooling may be disclosed in Xen patches.

The guidance is inspired by similar work in the Linux kernel
documentation.

Signed-off-by: Cody Zuschlag <cody.zuschlag@gmail.com>
---
 docs/process/sending-patches.pandoc | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 mode change 100644 => 100755 docs/process/sending-patches.pandoc

diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-patches.pandoc
old mode 100644
new mode 100755
index 798ecceb..b61584f9
--- a/docs/process/sending-patches.pandoc
+++ b/docs/process/sending-patches.pandoc
@@ -195,6 +195,25 @@ E.g.:
 
     Requested-by: Jane Doe <jane.doe@example.org>
 
+### Assisted-by:
+
+This optional tag can be used when AI-assisted tooling contributed to the
+preparation of a patch. It is in the format:
+
+    Assisted-by: <tool-name>[:<model-version>] [tool...]
+
+E.g.:
+
+    Assisted-by: Claude:claude-3-opus coccinelle sparse
+    Assisted-by: ChatGPT:gpt-5.5
+
+Basic development tools, such as git, compilers, make, and editors, should
+not be listed.
+
+The person submitting the patch remains responsible for reviewing any
+AI-generated content and ensuring the contribution is correct, appropriate,
+and compliant with Xen's contribution and licensing requirements.
+
 ### Signed-off-by:
 
 This mandatory tag specifies the author(s) of a patch (for each author a
@@ -209,6 +228,9 @@ E.g.:
 The author must be a natural person (not a team or just a company) and the
 `Signed-off-by:` tag must include the real name of the author (no pseudonym).
 
+AI tools must not add `Signed-off-by:` tags, as only natural
+persons can certify the `Developer's Certificate of Origin`.
+
 By signing the patch with her/his name the author explicitly confirms to have
 made the contribution conforming to the `Developer's Certificate of Origin`:
 
-- 
2.45.0


