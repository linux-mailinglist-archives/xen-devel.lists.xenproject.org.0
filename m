Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OhnGOstF2rd7wcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 19:46:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6D05E8770
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 19:46:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320698.1587907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSIK9-0001mQ-9d; Wed, 27 May 2026 17:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320698.1587907; Wed, 27 May 2026 17:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSIK9-0001jl-6e; Wed, 27 May 2026 17:45:45 +0000
Received: by outflank-mailman (input) for mailman id 1320698;
 Wed, 27 May 2026 17:45:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@gmail.com>) id 1wSIK8-0001jf-5p
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 17:45:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSIK7-00Du24-En
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 19:45:43 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <cody.zuschlag@gmail.com>)
 id 6a172dc3-2eae-0a2a0a5409dd-0a2a4501c0c8-4
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 19:45:43 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <cody.zuschlag@gmail.com>)
 id 6a172dc7-c1f2-0a2a45010019-d155dd2cad31-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 19:45:43 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-459bf19e87bso7209439f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 10:45:43 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:e14:c050:ad5e:28bb:6fb1:ebb4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb5a281dsm7209113f8f.24.2026.05.27.10.45.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 27 May 2026 10:45:42 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779903943; x=1780508743; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NvmhS/NgrXeooCma/DKoQyoy8nF+zLesbmUkf0u8y4I=;
        b=MZElIViEKWEQkmtSdh+3qaD6G08pIHsq58+8r3z20syQXEEe4x/Cm8Rf1Rmuf2IlSG
         HBjWikS1rPyFrfIuy5J66+R+XQu+BHQe3KNnn4Uc9NVx8u18Wh5l4eOfJlR7+khdtkcT
         Ve5FXl8XdxoIXxI5Z0PXa3B2Etnm9JQOLn58Ey3aXRinsScpWMuImJ9TfxuB7wdD7ymp
         nTXSHi4hHb8m51H8j8BQ19tUuLWtVddr6c47ykXBd0s0On78PjnZK5rLmQVpD2SKitSD
         wfLO83lIjSu9N3LgcW759iV4Nch+7Lx+4xkzvqwFF2jhDXs0lJiNC7aK+ANvJJ2orZxE
         KZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779903943; x=1780508743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvmhS/NgrXeooCma/DKoQyoy8nF+zLesbmUkf0u8y4I=;
        b=AYuRYcZTbtznF8Rnaksba944jyozoV+UVgV5KcVnvuI5k/wJmycvLoonMJFvAoTYL2
         7QQSDavN/OFsGWT8A12mSl1e5GrT39LXzhc3EJZicI6VU5Qu5VW4uUcPSE/i8Km7Qm0h
         Eu/oR8z0iVtvgMOfM1EA4K8aOt+g5+5rGT1E+LpIvMeAx2zUvMPOsCd6zfOENf+3UAGK
         zzyrBIj6kVP48+avnW8Z+lo8Y+Gy4h2BRjnVShmlUSCBefSU7zVFrwRRcOjVxWRsEFtp
         SN/uzWQMMVWTKqI6e7ry7pYIhgsbXeYC4xC58bSk+Zw7FEQuZKs6Aa7iWt25AnjcRUha
         JkWQ==
X-Gm-Message-State: AOJu0YwrmMVhy9Wbw9SSpnVlNlgXJI1fPRsD1X7u0K8x7KsYYudScypf
	S2kOF/G+uDweo0PRmHs4/kd1qjQF8Lbr6zkDPcXd17LNCw0wcTR7AdaJxkJifHXUsFk=
X-Gm-Gg: Acq92OG//X4tizorxAMc7wbw2kmn9m4hOwTBHJv9z4ymXV+oVXi8FE9SmJyaxKMw3uo
	8yE18tLa7Tsebn0AC1Ux/SWBAjazRhUXuFA8Lf5xwgFVT0Rh9GKQ9cBsLDjeKG+U/NrjSSh3qPQ
	4Q7mba0ZObut1MX+493Pm2ocktLLTgugiamFd0YiYo4ypfiwgP5y0jipwdiQ+MtQoP3ePo6084U
	ooDexg1fIFmKjYp4YJfQih+0pVJNW8cuRpvlYZTa6g7Pm9ZVeTLq6JscpogVwKVsnNbPXpsam5Q
	9BwvFN8wD5HTCqxnFY6TX0cERmJ+9YW6apg33qACvPufr0GJLE2jveVFPMyTS5M5h4Bav8AA0CJ
	kbOgvLkI/njP41P+XcVAq0or56NHaprw8tbGw1VevgGYYHqfY0P9nNjz2nPRN0H3ytL65ECYXCA
	jCcpsXzDf8xGmnZUQlVhXQCkV9E7DR9unUWLKIKdS81e1Iuidpm/4NBGTWxOdoLNYaCY7XkHs46
	I4=
X-Received: by 2002:a05:6000:25f6:b0:45e:9115:2982 with SMTP id ffacd0b85a97d-45eb38d8177mr39096635f8f.34.1779903942638;
        Wed, 27 May 2026 10:45:42 -0700 (PDT)
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
Subject: [PATCH v3] docs/process: document AI-assisted patch tags
Date: Wed, 27 May 2026 19:45:28 +0200
Message-ID: <20260527174528.27903-1-cody.zuschlag@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1779903943-B735AFF4-90173066/0/0
X-purgate-type: clean
X-purgate-size: 2447
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[codyzuschlag@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AD6D05E8770
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add documentation for the Assisted-by tag to clarify how
AI-assisted tooling may be disclosed in Xen patches.

The guidance follows the Linux kernel documentation.

Assisted-by: ChatGPT:gpt-5.5
Signed-off-by: Cody Zuschlag <cody.zuschlag@gmail.com>
---
Changes in v3:
- Align wording more closely with Linux kernel guidance.
- Use verbatim Linux wording where practical.
- Use MUST NOT wording for AI agents adding Signed-off-by tags.

Changes in v2:
- Drop unintended executable bit change.

 docs/process/sending-patches.pandoc | 30 +++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-patches.pandoc
index 798ecceb..79e24af1 100644
--- a/docs/process/sending-patches.pandoc
+++ b/docs/process/sending-patches.pandoc
@@ -195,6 +195,27 @@ E.g.:
 
     Requested-by: Jane Doe <jane.doe@example.org>
 
+### Assisted-by:
+
+When AI tools contribute to Xen development, proper attribution
+helps track the evolving role of AI in the development process.
+Contributions should include an `Assisted-by:` tag in the
+following format:
+
+    Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
+
+Where:
+
+* `AGENT_NAME` is the name of the AI tool or framework
+* `MODEL_VERSION` is the specific model version used
+* `[TOOL1] [TOOL2]` are optional specialized analysis tools used
+  (e.g., coccinelle, sparse, smatch, clang-tidy)
+
+Basic development tools (git, gcc, make, editors) should not be listed.
+
+Example:
+
+    Assisted-by: Claude:claude-3-opus coccinelle sparse
+
 ### Signed-off-by:
 
 This mandatory tag specifies the author(s) of a patch (for each author a
@@ -209,6 +230,15 @@ E.g.:
 The author must be a natural person (not a team or just a company) and the
 `Signed-off-by:` tag must include the real name of the author (no pseudonym).
 
+AI agents MUST NOT add `Signed-off-by:` tags. Only humans can legally
+certify the Developer Certificate of Origin (DCO). The human submitter
+is responsible for:
+
+* Reviewing all AI-generated code
+* Ensuring compliance with licensing requirements
+* Adding their own `Signed-off-by:` tag to certify the DCO
+* Taking full responsibility for the contribution
+
 By signing the patch with her/his name the author explicitly confirms to have
 made the contribution conforming to the `Developer's Certificate of Origin`:
 
-- 
2.45.0


