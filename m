Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMfbI1KDxWlc+wQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 20:04:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C13E33AAAB
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 20:04:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264707.1556113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5q0X-0003Re-Fv; Thu, 26 Mar 2026 19:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264707.1556113; Thu, 26 Mar 2026 19:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5q0X-0003PL-CG; Thu, 26 Mar 2026 19:04:41 +0000
Received: by outflank-mailman (input) for mailman id 1264707;
 Thu, 26 Mar 2026 19:04:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1w5q0V-0003AJ-GU
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 19:04:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5q0U-0043KZ-T1
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 20:04:38 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69c58327-bab6-0a2a0a5309dd-0a2a4505d758-38
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 20:04:38 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69c58346-5aeb-0a2a45050019-d155802ce5fe-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 20:04:38 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso12186045e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 12:04:38 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48725eb1ca0sm2176755e9.6.2026.03.26.12.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 12:04:36 -0700 (PDT)
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
        d=citrix.com; s=google; t=1774551878; x=1775156678; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Www+RzVGJQAg3udnubMZP5EQ5/tKE2rrKmnAefzSxeg=;
        b=CZ51ZSsBT/lVikJbUUVBpMAVwUD3LHM3bzH+fwS1fEOktCRzRkDrcGu9tEQ44UJAzP
         EgeicF38SncSv1R8bkMe3MFFB2sOGqYX3hkvCDozflUbd+QrdFZ4nPAMQQ8iqT8DPIVc
         wwZ0jFxAGoAT8g9FdwZ93x37Gy+KZNyIZ+zsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774551878; x=1775156678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Www+RzVGJQAg3udnubMZP5EQ5/tKE2rrKmnAefzSxeg=;
        b=fT6IXdSrFvUhp5+OJgINvYBNNuid+UC4erbRvpgLvkhuZYLoXQeHQsCsbs862tdBY2
         lSt0I2965xAFQ4NjkXIpYjU/RhWSzmdP12a3+4MkcbCu7HJ1rRKLYrKMfyhwlGWQfG0B
         KJT712kAz2ZYmRY9BwjY3sOQNf9yZRj4rIEddgsDqWPq42rDlb6O8DijHuVx1kNwr3PD
         Etg3rPZURA7a9npfcFcalmpOPGeemalOwjRJ1tAsj9DHBfMDsfleOGK4EhwkhW7TGCV4
         3JjsB1dHBteGUMN/wBoiJ+FG4rOPkwJUPbLdazE+ezOd38iP8hrRGFuY+tU7dwhv7LxX
         /zqg==
X-Gm-Message-State: AOJu0Yz/cujAGm1O9xxgC+fvjGNaPL0LOtGZXfPs2cfnmG39G3m7KXts
	G7zwCLBzzg9arYk53dnXMXfu/66m2pAyzdE74AIgZjgFKX+/U2am7+21fT3cQjmXUCTQDso/rnJ
	+P15V
X-Gm-Gg: ATEYQzziGhxZVN71TVsh9vUCETZDxd8V9jEKdEu93Ztrzt7R89ofBEdgn0XRDHiFBuF
	r7FP4PUDbYeV5LT6T9HcF5UxIV6b/zYLQO4lFy18mCzJn6q00Y4TZDQeGZAl9Cga9Q12B7VDpfy
	vnve/rDI9/ddv/AxC5SpDfDWIuUHBXG/zLocT6Inst46GG5U9ojwkUeE0t2kOaKBpwCx1/l+m6e
	b8T5RzLzwM3bxaywAAMZNQpSMBlcSpSQW+PrefU57Oro3VDm9QJXLqkifDei3BgyhnrtZG8F+ns
	uAbuObhNGnD16QlMWi9GLT3RtuC/afE1aYyQTeaFebSY0Wd7dJn/XOwswoC0FkoJXnWXLkfHl6l
	p+IvRxbkN4ZtO3EBRyJettgTasuVxL3Rd+MywrIEsOypSs6tdUIgw6wvp4gT7KnRGhcwh4Lagf5
	EucYMy7HBswyFHL241TL/Mj5Zmoq6bWbWoWrd3jGTRpfY9SZsFHyUiZN70jAwxoDU0jyc3jJiP8
	U+p
X-Received: by 2002:a05:600c:3515:b0:486:fe39:28b7 with SMTP id 5b1f17b1804b1-48715fd99admr129967535e9.9.1774551877252;
        Thu, 26 Mar 2026 12:04:37 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] docs/hypfs: Adjust the hypfs layout example
Date: Thu, 26 Mar 2026 19:04:28 +0000
Message-Id: <20260326190429.1156367-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260326190429.1156367-1-andrew.cooper3@citrix.com>
References: <20260326190429.1156367-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1774551878-80F55488-CAC67424/0/0
X-purgate-type: clean
X-purgate-size: 3478
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid,xen.org:email];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jgross@suse.com,m:ross.lagerwall@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0C13E33AAAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The controls for cpu-bugs were ultimately not taken.  As the paths are
documented fully below, pick only a small subset for the example.  Include
cpupool/ as it exists now.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Juergen Gross <jgross@suse.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>

This is mainly so the patch making eager-fpu unconditional doesn't contain a
hunk editing this file with no associated hypfs logic changes.
---
 docs/misc/hypfs-paths.pandoc | 37 +++++++-----------------------------
 1 file changed, 7 insertions(+), 30 deletions(-)

diff --git a/docs/misc/hypfs-paths.pandoc b/docs/misc/hypfs-paths.pandoc
index e86f7d0dbef9..dd089d90df53 100644
--- a/docs/misc/hypfs-paths.pandoc
+++ b/docs/misc/hypfs-paths.pandoc
@@ -89,36 +89,13 @@ the hypervisors, and in different configurations.  Specifically:
 A populated Xen hypervisor file system might look like the following example:
 
     /
-        buildinfo/           directory containing build-time data
-            config           contents of .config file used to build Xen
-        cpu-bugs/            x86: directory of cpu bug information
-            l1tf             "Vulnerable" or "Not vulnerable"
-            mds              "Vulnerable" or "Not vulnerable"
-            meltdown         "Vulnerable" or "Not vulnerable"
-            spec-store-bypass "Vulnerable" or "Not vulnerable"
-            spectre-v1       "Vulnerable" or "Not vulnerable"
-            spectre-v2       "Vulnerable" or "Not vulnerable"
-            mitigations/     directory of mitigation settings
-                bti-thunk    "N/A", "RETPOLINE", "LFENCE" or "JMP"
-                spec-ctrl    "No", "IBRS+" or "IBRS-"
-                ibpb         "No" or "Yes"
-                l1d-flush    "No" or "Yes"
-                md-clear     "No" or "VERW"
-                l1tf-barrier "No" or "Yes"
-            active-hvm/      directory for mitigations active in hvm doamins
-                msr-spec-ctrl "No" or "Yes"
-                rsb          "No" or "Yes"
-                eager-fpu    "No" or "Yes"
-                md-clear     "No" or "Yes"
-            active-pv/       directory for mitigations active in pv doamins
-                msr-spec-ctrl "No" or "Yes"
-                rsb          "No" or "Yes"
-                eager-fpu    "No" or "Yes"
-                md-clear     "No" or "Yes"
-                xpti         "No" or list of "dom0", "domU", "PCID-on"
-                l1tf-shadow  "No" or list of "dom0", "domU"
-        params/              directory with hypervisor parameter values
-                             (boot/runtime parameters)
+      buildinfo/             directory containing build-time data
+        config               contents of .config file used to build Xen
+      cpupool/               directory containing CPU Pool data
+        0/                   directory for cpupool 0
+          sched-gran         "cpu", "core" or "socket"
+      params/                directory with hypervisor parameter values
+        loglvl               "none", "error", "warning", "info", "all"
 
 ## General Paths
 
-- 
2.39.5


