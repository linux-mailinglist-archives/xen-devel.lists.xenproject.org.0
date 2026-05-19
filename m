Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP5cKMo+DWrsuwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 06:55:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1BE587A5B
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 06:55:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313117.1583662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPYxG-0003CX-Mc; Wed, 20 May 2026 04:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313117.1583662; Wed, 20 May 2026 04:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPYxG-0003Ab-J9; Wed, 20 May 2026 04:54:50 +0000
Received: by outflank-mailman (input) for mailman id 1313117;
 Tue, 19 May 2026 14:21:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@gmail.com>) id 1wPLKJ-0003QF-H0
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 14:21:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPLKI-00CZHo-Pm
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 16:21:42 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <cody.zuschlag@gmail.com>)
 id 6a0c71e9-e002-0a2a0a5209dd-0a2a45058182-34
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 16:21:42 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <cody.zuschlag@gmail.com>)
 id 6a0c71f6-aaa8-0a2a45050019-d155802ad5d9-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 16:21:42 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48fe26a177cso26714345e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 07:21:42 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:e14:c050:d89c:b9ee:3c77:9607])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4dac000sm336300305e9.0.2026.05.19.07.21.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 May 2026 07:21:41 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779200502; x=1779805302; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3AfrNvrGJyfWtYnCetB4c6I4+sD7SJx4sUA/4sR3s8=;
        b=SS0G/rwlgXbD4Bl8FW71wpk/frvDHBOKUgwAC5ssQorgl4KcQylBJu8uvXZgC9QHWQ
         nDTLCjW2Qhtc+rH2hBhf2R8TOTHaz+jBEGOHRh/pf0KLmsQ7377EKbNOXapvexhU/xZN
         iwWAuQJMdVxDG1qxG4OS9xSdZviusBa9hi6AE8gfe7XpMpAGFGYa+DOX1VWRXSTJ9aaq
         7LrJRZgZfgll+nYdCTKdRXGmZE6UVxvjbaOPwj70yuJlFnsjqOBPnmXuMVYdqkxbLOKH
         MHOEplbKOJceTncYRUlQ7eIJChufdGunpgKDkAgAEENz1O8GS49fmtohF7R3ZDLv/9Rz
         4WhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779200502; x=1779805302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3AfrNvrGJyfWtYnCetB4c6I4+sD7SJx4sUA/4sR3s8=;
        b=L7rqMT2jlFg7T7JQ+7kDQBIP1QEBpNantIpCv+NhG5fGrifnkUbe9HdP4K0nOlbGUt
         5NoWjRfz3lzwyH6XCf2CdY4ZSU7Uxvc3LHt8Sop3EP6oA4FCM1CEUQZ+qSjfYKCdBEs4
         xuFRqcC/WiVrQJqomxIFVExk2fMJQ4bC+q/511WjuFn7FT6n1jh8b+zVJuB7jXrs5TcJ
         1gaU3OoVvg1djukACFrTZ/EzLtyx9+YG4yYNtd1aEwbkY/5ygBR4EwaNJcCiD1Ih2686
         MAPvRvGIft9IgulysC/17BEvl49/Fw77Db6PNF/ZVKklDOG3B1kpCp8DEtsnqz3sZHPh
         +5Yw==
X-Gm-Message-State: AOJu0YzBYWNzA6v0Yr+qhWxUrIpaYHsJBROekutN0LXBW3Vas7BTiJl6
	t1VBkX342NH50mmkvFllOKPLd3dH86wj2Vf7VHbGldk1PNpNinhQcfxU3imP1GvY0CQ=
X-Gm-Gg: Acq92OFYwxdPeVeubj9pPDIUFbVyfNkjnC1cSNP79YdXfcLI3KpK7IPGcDE1Ong4IIH
	VL7GhEKhsfiCUl25cNF5qA9Kug+dxv3f28MAKNew785ivlyL/TLU2kLgrTVq+cfD0N4kp4vhoPU
	VzRdQy/iVQiZAq+7YJSCKL9Xi+U74sZxRHDzANAzqYxM0QAFdJ4jhAbUBX+U1daVxgfI1qOpEdt
	uZJEInR0zY7HPLhZIrUjyxsTMEeHc0DohDMyMZMue+ZAgtdVmvNpQ+ZzKiArqyGxEiSKcq6kB3+
	GANfd4dLMha5dFUlzwYb/v09HhddfFzCRlv4fdbf9PBJHVXdfmfMTAiv0Xn1nf+RCIh3aoXPZ0f
	9bkhOnG7SUbzFIp97VBCii3OYtKKJLm0l2dr0LpMLwnoUOJ3z93vhN/sigJcq8BL3I4T7EKJkjU
	+TAowreBtZkWDbNaKFUiEYW5oDWgOh0cdsDaXitYi0Y3OLo/AO7nozO9hrBY2S/RRR
X-Received: by 2002:a05:600d:8448:b0:48f:fb0d:8d86 with SMTP id 5b1f17b1804b1-48ffb0d8ea0mr211479815e9.32.1779200502063;
        Tue, 19 May 2026 07:21:42 -0700 (PDT)
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
Subject: [PATCH v2] docs/process: document AI-assisted patch tags
Date: Tue, 19 May 2026 16:20:12 +0200
Message-ID: <20260519142011.30276-2-cody.zuschlag@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1779200502-DB16D443-E9A5EB0D/0/0
X-purgate-type: clean
X-purgate-size: 1900
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	FORGED_SENDER(0.00)[codyzuschlag@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,gmail.com];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 5D1BE587A5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add documentation for the Assisted-by tag to clarify how
AI-assisted tooling may be disclosed in Xen patches.

The guidance is inspired by similar work in the Linux kernel
documentation.

Assisted-by: ChatGPT
Signed-off-by: Cody Zuschlag <cody.zuschlag@gmail.com>
---
 docs/process/sending-patches.pandoc | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-patches.pandoc
index 798ecceb..b61584f9 100644
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


