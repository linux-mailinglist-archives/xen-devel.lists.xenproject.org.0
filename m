Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDzLKO2kHWr5cgkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 17:27:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A3F621AFC
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 17:27:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323908.1589580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU4Xu-0001rP-TI; Mon, 01 Jun 2026 15:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323908.1589580; Mon, 01 Jun 2026 15:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU4Xu-0001oH-PS; Mon, 01 Jun 2026 15:27:18 +0000
Received: by outflank-mailman (input) for mailman id 1323908;
 Mon, 01 Jun 2026 15:27:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wU4Xt-0001YQ-4v
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 15:27:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU4Xr-000aeX-Od
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 17:27:15 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a1da4d1-5cb7-0a2a0a5109dd-0a2a4508e53c-4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 17:27:15 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a1da4d3-63b5-0a2a45080019-d155802dad81-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 17:27:15 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490a765f47aso13264815e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 08:27:15 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0daefbbsm1570885e9.0.2026.06.01.08.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 08:27:14 -0700 (PDT)
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
        d=citrix.com; s=google; t=1780327635; x=1780932435; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrJE1aqusnLxkTRjjAXhqxjnYQwxeXD+yrEXlJ1iagM=;
        b=FRaBiRMq2muPM4eK7s8MVjZ/corA0vAt0VQNmpwy4xT1HCNNCuONEF4KFozziXQ8h1
         6thJT71vQFX/2HGkjsdkpaLSt3pHzXlGzOsA57mU7Jv0AKl/nKH217nKGlbMzZ96Uevm
         gC7SMyziNe+15Gq0Vwj4dvtL0OBhd4mq26RPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327635; x=1780932435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BrJE1aqusnLxkTRjjAXhqxjnYQwxeXD+yrEXlJ1iagM=;
        b=FV+/LChIQsXPVjiAGQzYm/K5PZ2Sc4Ayk7sRSvdj7pf8/MNoZ2X2Nql2hwo2/pYPUI
         CXA6PJDtl/XSVfQNYwiS008uy47LQoeM2iMyGvXXyHLrXMpzLmlNo8NWUWmrPxUj1daK
         kqjUG89+UBBn5r5UhICbM3s/m356DZcwJExIywXc4PrSe1akqfsbp2g0ykA5aFP0O8Wu
         q6Jw454DzwmzEErMkwfPBjqGK09cLKtv6qwUr7+iBSgzJAmwWdre3aUTtF2QPNPZ9EkN
         po2DJWx3nja1elgqxgr3GMyGSi26smMzxnYhTWCFSosIuBSUz9RiRCdNcswy3pQ2lh3J
         +Zkw==
X-Gm-Message-State: AOJu0YyAZQVUk+q9wHTUasaE8T9lmJJSYcJYQWtR+9siTUiDzaSBhPTZ
	EHdlqF3Y4Sf9UjVTkIgayMom6+ULE8z+lybBccYUTQTpOu0i+UrphAFo4eQWKkuid+DyYE4pZBP
	D57q+
X-Gm-Gg: Acq92OH/lphH3hjZEerR70wUK8YkN3uro6B+rIP8zJySnjDoRMM62yyCxG/sWbTB25y
	/WcyoEBEfkV4SXi2yiwmLjK28Mznw5yf/9y9YOPocKmvHeENl8tz+9djjOcoKEBDVPeTUuce7Pk
	bhAIse97XRHDngC7l+7R4WdkfJkRREPH090blY2H/p2/e98alAS7aB+ruD9w4KzdTJhguPQY1RB
	s524UdVVn7wF05EUR1w7+FPusbhLXUC+VZr8tCWNCqCxkm5w69HdLsNJRKutKWErHFMC4aEEDp9
	O9dFPZO55+hl6QvQxUHJG8PVgWc3eSyFODrXNZNplCY6y35F5dUywOGUNQGT+wRrRO+bbi2XDAO
	sKM7pQjivyoSXXSzJmsK7OMzHVLyILW+kAr9KPwack40bAlIgpe6KspFMgzjqf9jEwYyht35gxZ
	iCMP5nY4OPXFU5RAopdGpXb/zsr36mtbMElSW+EKutkhkcEddGzMNnu9UfGGRffn9TJB6KJP6n1
	xarM2AHoJY6HII=
X-Received: by 2002:a7b:c3c3:0:b0:490:5191:6e26 with SMTP id 5b1f17b1804b1-490a2941d7emr132720115e9.18.1780327634705;
        Mon, 01 Jun 2026 08:27:14 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 2/2] Update Xen version to 4.22.0-rc1
Date: Mon,  1 Jun 2026 16:27:09 +0100
Message-Id: <20260601152709.2588210-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260601152709.2588210-1-andrew.cooper3@citrix.com>
References: <20260601152709.2588210-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1780327635-C4C79DB1-FD5843B4/10/73395122804
X-purgate-type: spam
X-purgate-size: 2273
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,citrix.com:dkim,amd.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,support.md:url,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.937];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 42A3F621AFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 README       | 10 +++++-----
 SUPPORT.md   |  2 +-
 xen/Makefile |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/README b/README
index 889a4ea906d6..3dcc00c4a4ad 100644
--- a/README
+++ b/README
@@ -1,9 +1,9 @@
 ############################################################
-__  __                                _        _     _
-\ \/ /___ _ __        _   _ _ __  ___| |_ __ _| |__ | | ___
- \  // _ \ '_ \ _____| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
- /  \  __/ | | |_____| |_| | | | \__ \ || (_| | |_) | |  __/
-/_/\_\___|_| |_|      \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
+__  __            _  _    ____  ____
+\ \/ /___ _ __   | || |  |___ \|___ \    _ __ ___
+ \  // _ \ '_ \  | || |_   __) | __) |__| '__/ __|
+ /  \  __/ | | | |__   _| / __/ / __/|__| | | (__
+/_/\_\___|_| |_|    |_|(_)_____|_____|  |_|  \___|
 
 ############################################################
 
diff --git a/SUPPORT.md b/SUPPORT.md
index 8e7ab7cb3ec8..abc7beac5b55 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -9,7 +9,7 @@ for the definitions of the support status levels etc.
 
 # Release Support
 
-    Xen-Version: 4.22-unstable
+    Xen-Version: 4.22-rc
     Initial-Release: n/a
     Supported-Until: TBD
     Security-Support-Until: Unreleased - not yet security-supported
diff --git a/xen/Makefile b/xen/Makefile
index a2b442e76d5c..1f11610b5f68 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -6,7 +6,7 @@ this-makefile := $(call lastword,$(MAKEFILE_LIST))
 # All other places this is stored (eg. compile.h) should be autogenerated.
 export XEN_VERSION       = 4
 export XEN_SUBVERSION    = 22
-export XEN_EXTRAVERSION ?= -unstable$(XEN_VENDORVERSION)
+export XEN_EXTRAVERSION ?= .0-rc1$(XEN_VENDORVERSION)
 export XEN_FULLVERSION   = $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
 -include xen-version
 
-- 
2.39.5


