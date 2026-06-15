Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e4OyD/NHMGo6QwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 20:44:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD716689433
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 20:44:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=aXlnx9pe;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1338512.1599552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZCHq-0003Y4-7y; Mon, 15 Jun 2026 18:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338512.1599552; Mon, 15 Jun 2026 18:43:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZCHq-0003Vq-5C; Mon, 15 Jun 2026 18:43:54 +0000
Received: by outflank-mailman (input) for mailman id 1338512;
 Mon, 15 Jun 2026 18:43:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wZCHo-0003U7-90
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 18:43:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZCHn-0075Ge-M3
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 20:43:51 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a3047e5-bab6-0a2a0a5309dd-0a2a4505c1e6-6
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 20:43:51 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a3047e7-aaa8-0a2a45050019-d1558029ed36-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 20:43:51 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-490ac357c55so35785475e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 11:43:51 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea95c51dsm253809785e9.1.2026.06.15.11.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 11:43:50 -0700 (PDT)
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
        d=citrix.com; s=google; t=1781549031; x=1782153831; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A/1/6OXQlnAPNmNdLEZZtcs4HQ4ofhXtcUfxTuix260=;
        b=aXlnx9peIQRNCRvKHvrm0iF8kkb6XAcpQCEXiTShnFDyOG/wxf0dOZZdAFaIW0C8dB
         BvUnao82dh18vscOFnVkrxFKxSy6Kpc7b81WcNQmbdPZMUgDmLpDUVB08yzVTKZBOhgo
         eS89IoxNlAQvF2BbF9oV88sVxbo13uDKgXpKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781549031; x=1782153831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/1/6OXQlnAPNmNdLEZZtcs4HQ4ofhXtcUfxTuix260=;
        b=dbzc/cGnGgJ2kOLmV7+3OExUPsrs3ctWFDVzjOtOqEbde+X/kJBqFchRZF8N6F4sbf
         a7fudtHlS3iYEMvLx29EWWBSuSeCCYQwvPD/xyA7Zl+KLdJxHAuKNH4WBDR7dG7xR0fU
         L8j2XF9kc1zdKJVGNag9mbhF8sD8/seairAOexwzryFuQsxO8eVIBcWgxfUhaZ/q1OMX
         U2DUgsC7VyFjYmV9CYKBinW6RvBqA99/TIkKbHLTt5tBPDPWpUwEob+2W51JlCTh/5ao
         4eqb+HISW1a25/ee8I/dKm4dDMYQ5KxNEgaHADtZTkyLg9844meZlOZNfMEnF2Uer5xP
         cLwA==
X-Gm-Message-State: AOJu0Yx+9dEnFsyGKqhYZydH2Pth5ZwO07aoaaHmg+QM0N36rQRTu4oE
	gdfpiMd8yjEMx51tBrHq5MbZY/Ta6wwbqRBW+LdsfybDJiF4ldx9VIWVgnwh6so+RCWqIc028YP
	ySY6F
X-Gm-Gg: Acq92OHZkwK1ymMjkeQX5aYpi/+qbwsIsT/3hgbfoxgufBAq4BP9efhWYs6K2ps6Q7R
	oNgB8nNdkd4FgKe2Cn0rxhQMj8meiXCayMk26ee6xRFLqnWm+mYzkgdsF2wkP2e0LgbcZv+C3eH
	nvyvDCGaZ/HLaq8emrG0UMt5KwhJgHy3ZbK1sIBcFMjV3IaaBJrL6edTo8mTilAqOiO+EGXt0nZ
	C3v8wsEI3oMABCEqxlWGvLpaBcR0MUk6/0XBNKsz44BJkMqyo9cfb0CYRelvkD+ncEAy9hfh1f4
	6Nq9TZFWL1lyZSwp7hsMCEjdMzVXPayC7ZxpQxmev0wOmeK+KWbkWH9jaJWTpCiGU8RwoXnavM0
	WbzjgClZ403w4bwRkINYg36BWVtZlWL3kZFNW23f87WIRMI8LNzd88E6I6wMnRxo19lZEraXy8R
	P+V+lg6amnAVa4JXkXaoUHo+Zigb+UFotgxGT8fJtc1XSOmaRksgfIUGuoK5X+aNySw8rL4uf3S
	Zf5
X-Received: by 2002:a05:600c:4711:b0:490:b8e2:6380 with SMTP id 5b1f17b1804b1-4922ff93bb3mr6522825e9.12.1781549030860;
        Mon, 15 Jun 2026 11:43:50 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Cody Zuschlag <cody.zuschlag@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4] docs/process: document AI-assisted patch tags
Date: Mon, 15 Jun 2026 19:43:48 +0100
Message-Id: <20260615184348.7804-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1781549031-E2790443-47660529/0/0
X-purgate-type: clean
X-purgate-size: 2727
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
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:cody.zuschlag@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:codyzuschlag@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD716689433

From: Cody Zuschlag <cody.zuschlag@gmail.com>

Add documentation for the Assisted-by tag to clarify how
AI-assisted tooling may be disclosed in Xen patches.

The guidance follows the Linux kernel documentation.

Assisted-by: ChatGPT:gpt-5.5
Signed-off-by: Cody Zuschlag <cody.zuschlag@gmail.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>

v4:
 * Make it a well-formed patch
 * Remove reference to tools which don't work in the Xen tree
---
 docs/process/sending-patches.pandoc | 31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-patches.pandoc
index 798ecceb39d1..b924fa2b87b2 100644
--- a/docs/process/sending-patches.pandoc
+++ b/docs/process/sending-patches.pandoc
@@ -195,6 +195,28 @@ E.g.:
 
     Requested-by: Jane Doe <jane.doe@example.org>
 
+### Assisted-by:
+
+When AI tools contribute to Xen development, proper attribution
+helps track the evolving role of AI in the development process.
+Contributions should include an `Assisted-by:` tag in the
+following format:
+
+    Assisted-by: AGENT_NAME:MODEL_VERSION [, ...]
+
+Where:
+
+* `AGENT_NAME` is the name of the AI tool or framework
+* `MODEL_VERSION` is the specific model version used
+
+Basic development tools (git, gcc, make, editors) should not be listed.
+Specialised but deterministic tools may optionally be listed, but their use
+should be clear from other context in the commit message.
+
+Example:
+
+    Assisted-by: Claude:claude-3-opus
+
 ### Signed-off-by:
 
 This mandatory tag specifies the author(s) of a patch (for each author a
@@ -209,6 +231,15 @@ E.g.:
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
 

base-commit: efcb4c5e2f2734cd4cac38a9f01e03c5e54c8eb8
-- 
2.39.5


