Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAMjObhV/mlTpQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 23:29:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1014FBE9D
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 23:29:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304249.1577329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLSky-0004oH-Kw; Fri, 08 May 2026 21:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304249.1577329; Fri, 08 May 2026 21:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLSky-0004lN-HP; Fri, 08 May 2026 21:29:12 +0000
Received: by outflank-mailman (input) for mailman id 1304249;
 Fri, 08 May 2026 21:29:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wLSkx-0004lB-Gp
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 21:29:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLSkw-00AvHv-Qk
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 23:29:10 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69fe5568-e002-0a2a0a5209dd-0a2a45028108-16
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 23:29:10 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69fe55a6-af86-0a2a45020019-d155dd33c191-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 23:29:10 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43eb05b1875so1482956f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 14:29:10 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491ca383asm7548608f8f.28.2026.05.08.14.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 14:29:09 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1778275749; x=1778880549; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVmq4etdovYoJDRMA/BMmOvUPNieQX2pyEDBr8hljoM=;
        b=TDSltpKa2KHPfHE1NkLympPxuOBRljN/VqLXBfUT861kaBBT1x+9IkKL5ngNDvgHdB
         SXP6bl9rzOlcN6nqQNHSQvu07hs2XP50ypeOF2AS+NLOyL04F24TDgB1icQ7brBwLgKA
         VJcJrzm6U4LsNyLqktiqJf3mpojSh000nAesk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275749; x=1778880549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sVmq4etdovYoJDRMA/BMmOvUPNieQX2pyEDBr8hljoM=;
        b=UXm3GfBH6wxWkymUMxq7tMB8FjYVNT4355GqUgKZVD8LWfyHPkTvJzsJlNCCbRZ1BT
         mWBqomaMJRP2u1rd0CAZh/6Mqf7/QJjnHwak87G6a8YUq7bynMDmkYKE7dUqZrb5Lyov
         5sXAleuD07i2PL7sUc4Pm6clip80aml7CtANwtjkf+dMeoFfvQ8tLAwwibdfVgSsp3yl
         mmwBIUOhRIyMYeAHD4b2Yfy2ZwSUlwShutBjiqx27RjbMakipxvY8Q2vzM0//0i2dTI/
         bcm1e2gQlybTMHVOJDl9D+gG7Eq0IWtwunBFyEGaBP1DzAcGmUKDzniUdZLZtguN0W5u
         tsAA==
X-Gm-Message-State: AOJu0YyVpnLh+TiqBPbBGOEA6B6MSbMdc+hCEwUMcimqF2LqFdJepDnR
	gvwx6tR6k3cJBRtugJXTXaLplhD627EGHtU5szC3OeZvtGxLc8FZzCkbGaJRUYpCAWUixQh5R7G
	unJDe7vc=
X-Gm-Gg: Acq92OHvvL0TbUwhGjzXEN6HbT51YvXNxEwnl2XLK+OISRm+6HaOecMyVcw1CJXOd2V
	lSkW8CaPxk3qw33odjwjXFayYLIxGj2SdTUvlV+ElnCrcj9tEjsO356QtKThVBdDqA1IqC4Os0y
	DPnfE+faKalm+afsw8ptYd+k8IaYswXYP6OWysAtxzepTM3UYa4PlhxINqZbGxzUbfkzRH4AZv0
	NeaNa2wxvEKAPYWHeqJyJOWsiXXfGLu9Dko+PNNgnv5+4Apeaew4xCsUekdljEyMamF/HqCANmA
	1kcTSMD13Aj7GJ4KderYTpRJuePQZZn3YdMJjgM8KWbxyDxecwJwhi2IgrEFK4CYKOJe+0pFmP7
	dqlAu/yyb6JBTXhEre9+QsJ+BoBWuLSITrb0RORjmMa0GUq5852GZgmVZ7jfqW9Xrxwe10WUN7/
	Oum3clFXLw18U/w3+2hpgH0+nk47sKt10jvbF/EUcUtwoIvt5iWoiGTaAKJ4vPtiWgMwCTYfOYA
	k8W
X-Received: by 2002:a5d:5d85:0:b0:454:86d:b4d2 with SMTP id ffacd0b85a97d-45689baa9b3mr100523f8f.8.1778275749343;
        Fri, 08 May 2026 14:29:09 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 1/5] CI: Adjust test needs[] to ensure binaries/ is non-root
Date: Fri,  8 May 2026 22:29:03 +0100
Message-Id: <20260508212907.1643761-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260508212907.1643761-1-andrew.cooper3@citrix.com>
References: <20260508212907.1643761-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1778275750-AB563161-4DC6A5B8/0/0
X-purgate-type: clean
X-purgate-size: 2648
X-Rspamd-Queue-Id: 9F1014FBE9D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

The binaries/ directory is a composition from the artefacts, and also used as
a working directory for most of the tests.  If the very first artefact is from
a root container, then the test must also be a root container to use it as a
working directory.

For arm64, the existing linux-arm64 artefact suffices.  For arm32, pull in the
microcode-x86 artefact as it's the smallest available.  This bodge can be
removed when all build containers have become non-root.

For the qemu-xtf-dom0less-arm64-*-xen-version jobs, use *arm64-test-needs
ahead of alpine-3.18-gcc-* (as it's a root container), and to deduplicate
the *-export dependency.

This will allow us to change containers to being non-root one at a time,
rather than all in one go.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>

We should also stop using binaries/ as a working directory for the tests, but
that gets very complicated very quickly and I don't have time to do it at this
juncture.
---
 automation/gitlab-ci/test.yaml | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 8770c523e228..517af1732437 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -15,6 +15,12 @@
   - qemu-system-aarch64-6.0.0-arm64-export
 
 .arm32-test-needs: &arm32-test-needs
+  # Bodge to ensure binaries/ is non-root.  Can be any artefact which comes
+  # from a non-root container, and microcode-x86 is the smallest.  Remove when
+  # all build containers have become non-root.
+  - project: $ARTIFACTS_REPO
+    job: microcode-x86
+    ref: $ARTIFACTS_BRANCH
   - qemu-system-aarch64-6.0.0-arm32-export
 
 .x86-64-test-needs: &x86-64-test-needs
@@ -569,16 +575,16 @@ qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
   script:
     - ./automation/scripts/qemu-xtf.sh arm64 mmu64le hyp-xen-version 2>&1 | tee ${LOGFILE}
   needs:
+    - *arm64-test-needs
     - alpine-3.18-gcc-arm64
-    - qemu-system-aarch64-6.0.0-arm64-export
 
 qemu-xtf-dom0less-arm64-gcc-debug-hyp-xen-version:
   extends: .qemu-arm64
   script:
     - ./automation/scripts/qemu-xtf.sh arm64 mmu64le hyp-xen-version 2>&1 | tee ${LOGFILE}
   needs:
+    - *arm64-test-needs
     - alpine-3.18-gcc-debug-arm64
-    - qemu-system-aarch64-6.0.0-arm64-export
 
 qemu-smoke-dom0-arm32-gcc:
   extends: .qemu-arm32
-- 
2.39.5


