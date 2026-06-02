Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yC3nIBUXH2p5fQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 19:47:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB38630D08
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 19:47:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b="kIvJ/PWa";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1325331.1590845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUTCG-0004JK-4U; Tue, 02 Jun 2026 17:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325331.1590845; Tue, 02 Jun 2026 17:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUTCG-0004Hv-0r; Tue, 02 Jun 2026 17:46:36 +0000
Received: by outflank-mailman (input) for mailman id 1325331;
 Tue, 02 Jun 2026 17:46:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wUTCE-0003sM-KP
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 17:46:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUTCE-000Wkd-0v
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 19:46:34 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a1f16e4-e002-0a2a0a5209dd-0a2a4505893a-30
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 19:46:33 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a1f16f9-aaa8-0a2a45050019-d155802be0a8-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 19:46:33 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49050ff7cbdso108703875e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 10:46:33 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e19b0bsm88089975e9.6.2026.06.02.10.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 10:46:32 -0700 (PDT)
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
        d=citrix.com; s=google; t=1780422393; x=1781027193; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izOPh0w/hfR+hx+3cA13Ap7a8TIuWX1KLBMyzOHAeGc=;
        b=kIvJ/PWaGONRA9aIzWPab+znzIXMIOb1Dh7WisBryIA56NPnS4Z9mR3oRvoosdO7UL
         Jsd/74YP5mH6ybLSgo+pJ7hCfhB2udt5ywaRjeVGnrr5bc6mAVqrr7kgKc27rlowxWct
         TfAjvhI+oy4WcnwsE2JZtod0ls+1E3YhSYr7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780422393; x=1781027193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=izOPh0w/hfR+hx+3cA13Ap7a8TIuWX1KLBMyzOHAeGc=;
        b=QFqNm+gB7ZyHKL+pYCC/iTZvaWw3vNJzC4hv3avyqaj2iskMsTvY9E8MLMGOdBjyVI
         Nps7cmuvGNYnJPg2YzW7zbuOy2rYYJfkCfp8zZ0MDDsUDgKAtEj9kqkAow5l2BhIkxt7
         hz4SGXF5eUkeyQZeMfw5QutHV2hoKI0cMFCfvtbZpca9K0rjFb89ydrcIfXIcRRbLOu9
         KOJxF+Ft0RSsmgU8sFmtSDc7umE/QCiObUrmb/lId7ko8O0tkm+gZ5YqCZYYagvmCFk/
         yFiKggmfS47+rAHuc1WFio+ydNGuYc41TrFT1IKaB+VTrg8Aoa82IXDpzs2ZHHZDVGGK
         9a4A==
X-Gm-Message-State: AOJu0YwMuKGMMOOouBzkVE/Z5BKKZrwp9Jdc0JIIiDfr2YkNNsscmzkv
	qh3qVABdh84y6FHVrjffAUgEvu4mkMbzMbxLp4MooRfjuAykTRjXhr95zvwAJSfITktNH7+JeqR
	f7FbE
X-Gm-Gg: Acq92OF6tiUHILeIpk+SHh7l0vn8h2qPl/3kAU4nAnwacsxQnDJe1/AfdJo6sfqmOyu
	3VeZMl7887c9bIY2P7L+tkDIiy39O3VfiB5DBXGQv/cZ9Nqs9YTq8VrkfMWTmSAWCUPco5Z79lY
	xnN8HT/dmnjIVvu/a1SCtxA7ZaT97DophTLoaEHsMC2Q3cJ7QpgrhGP9tBs1pbqCg8VKc5Z0X6W
	t8t1bkaTZWmt1GnRZXIaR19anY61tIA2hNoeWKfuhcyQVZHIm6P5/FNcy8DK6LIas7VVlkQPJCH
	4XREWgOEL6V0/Ziu1ZAI9w8dzi3dAuXxfg5BA5/4EFn+vnxCsZaawxJHEzCBVk2LtNpNo8mAJ13
	JDXb0uXa0baywp3KD6fkvgLcWJqIt3j9Qq3vL30fpbLMGWuGUZMRHzSWW9X0n4Y2eQ9Vg3L1wHk
	w0fCrvszWgqOSGGgBPub7gf4C9utqFoZYt7V9kAJdMXWH5tJU8PIO3d+nwjosG/EaGkVhjCLNzM
	UYg/32YB/mHMxYjLTVkFODd7w==
X-Received: by 2002:a05:600c:4e02:b0:490:b265:7940 with SMTP id 5b1f17b1804b1-490b50a6217mr12582285e9.23.1780422393111;
        Tue, 02 Jun 2026 10:46:33 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 2/2] CI: Mark eclair-x86_64-allcode as blocking now that it's clean
Date: Tue,  2 Jun 2026 18:46:29 +0100
Message-Id: <20260602174629.2649448-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260602174629.2649448-1-andrew.cooper3@citrix.com>
References: <20260602174629.2649448-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1780422393-E318B443-CCF1212F/0/0
X-purgate-type: clean
X-purgate-size: 869
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,bugseng.com:email,amd.com:email,xen.org:email,citrix.com:mid,citrix.com:dkim,citrix.com:from_mime,citrix.com:email];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
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
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FB38630D08

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/gitlab-ci/analyze.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index 9bf032931fc4..673110d40ed3 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -62,7 +62,6 @@ eclair-x86_64-allcode:
       CONFIG_XEN_GUEST=y
       CONFIG_XHCI=y
       CONFIG_XSM=y
-  allow_failure: true
 
 eclair-x86_64-testing:
   extends: eclair-x86_64-allcode
-- 
2.39.5


