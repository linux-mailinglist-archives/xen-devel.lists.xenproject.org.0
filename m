Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AI2jFZ5NA2pq3AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:56:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C787C524284
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:56:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307093.1578827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpSc-0003aE-Bg; Tue, 12 May 2026 15:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307093.1578827; Tue, 12 May 2026 15:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpSc-0003WC-7K; Tue, 12 May 2026 15:55:54 +0000
Received: by outflank-mailman (input) for mailman id 1307093;
 Tue, 12 May 2026 15:55:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wMpSa-0003UK-Vd
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:55:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMpSa-001eB7-CF
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:55:52 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a034d80-2eae-0a2a0a5409dd-0a2a450696ee-8
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:55:52 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a034d88-7371-0a2a45060019-d155802dd027-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:55:52 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so55895555e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 08:55:52 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d69d0bsm4361335e9.13.2026.05.12.08.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 08:55:50 -0700 (PDT)
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
        d=citrix.com; s=google; t=1778601351; x=1779206151; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5KS7/+TNO6Mwmt8V0F9s0vRqo8U83BG2diX81j3zbo=;
        b=Uk/kMh0q1dKI+I79XoCmEbXdkOGVXiicrGQYU4DDStrxTQNHJq4AQdyVhwXwGElM+w
         JUTb59oOR92tjdWHxqMA1KDdvlu+bNk5rziqgi9PvHLlvJd7Z5rA/AP/Eh/wjnvs45B0
         sMGG9uo0W3iBB0PCTavvSHM9beeh4cTil8jxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778601351; x=1779206151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F5KS7/+TNO6Mwmt8V0F9s0vRqo8U83BG2diX81j3zbo=;
        b=dGUkKxnpSIIgwohVElHVr6RS4pQXncYNjHl6DgseC3MOPTmpEHuyqrCM0LsGeiIlsB
         Smee8BBPShbQgxZ41L8rr50+BTplnwT04SPnJS0+hs0+8pf2hRORG8MYF9PGAVDB8Exc
         etoqDbJzhJDC3dzlMxO1dY3GpbhBHCV5wp06q4AEyOFr/ZaFw9sNMPhFYkX7l7L2ktZX
         BXWrMjLVdk5jtFcFL0uq2FyESD3snwXmcmGaUKMlZKDhRLNFuoKREPzAUHz/a6ucfF4F
         OBASKIf3pVVEEdlMXbSsRjw4rAm0vr/BWA9xjILF1MzQ5poIOtthinBm60t9tpkmN0Z3
         /DQg==
X-Gm-Message-State: AOJu0YxdHArqNnlLLJUXyCTpJibqnQeAl+huA6lzhrrbN15mighgfEQH
	q5B7ZOeCF5EdEsjuRb0RFvlkD4T2eJoM28u/MapXPfDgob9a7Myq0V2X1fpVhNOA0BE88syRkZi
	FvlpligI=
X-Gm-Gg: Acq92OEMaJ/Tgv0KJ83YsJSdwVoUSHJreW643EN0Q83hXSc0XgFV7d4NT/0pCmdQgFh
	qqrvCAUeorMRZ3YTwnRgSpbRojj9u8haiuY/m8NpaqsR5fqPPUBH+bBwwq4a/x1pdlBagSqrC0b
	bbt5hQVwxTTZmk7UWFe34ZPpEV+YMYJIno51bm5RfXiNm8HySZNcVdkBMqUo0RQArhzmkPqk8sL
	m5VG0L5M3D9X8+kYaYMR5r8GwpBK7DU2ql8pZBm/YcOYLYAUw8+epy0J2Y8AsRIyrmGr15HgvD5
	DBql54I7gA/9GmQzUeaQVq5LiKFyJivodvr7G8WqH54/9joN4M1U9YN2o0CjxL6zMpFEfU2Whc7
	ULYEp3CtPq0GrsNYBFiV1bvy/WJafHZBwyzMrb0c0wnP3OqpdBHap+1SmZLYTPsr9Si62n8nrfZ
	vd78bd8QrmO8pFKCXU/hNiaVNbatEI6wfzCQIjT2XGR2QzMH7F/4p1eOHsSxisd7yK48JIw838v
	Ar3
X-Received: by 2002:a05:600c:c4a4:b0:48a:906b:14ca with SMTP id 5b1f17b1804b1-48e8fe7cdfbmr53019775e9.20.1778601351053;
        Tue, 12 May 2026 08:55:51 -0700 (PDT)
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
Subject: [PATCH 1/2] tests/paging-mempool: Misc cleanup
Date: Tue, 12 May 2026 16:55:39 +0100
Message-Id: <20260512155540.1733403-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260512155540.1733403-1-andrew.cooper3@citrix.com>
References: <20260512155540.1733403-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1778601352-87F7BD75-59128DD6/10/73395122804
X-purgate-type: spam
X-purgate-size: 3334
X-Rspamd-Queue-Id: C787C524284
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:email,citrix.com:mid,citrix.com:dkim,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

... ahead of extending it with a second test.

Rename run_tests() to test_paging_mempool_size() and have it return int so the
newly wrapping run_tests() can decide whether to run the next or not.

Comment the parameters to xc_domain_populate_physmap_exact() to make it
clearer what's going on, and remove the page added to the physmap when the
test is done.

No practical change.

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
 .../paging-mempool/test-paging-mempool.c      | 25 ++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/tools/tests/paging-mempool/test-paging-mempool.c b/tools/tests/paging-mempool/test-paging-mempool.c
index 1ebc13455ac2..d1207d26d3fc 100644
--- a/tools/tests/paging-mempool/test-paging-mempool.c
+++ b/tools/tests/paging-mempool/test-paging-mempool.c
@@ -15,6 +15,7 @@ static unsigned int nr_failures;
 ({                                              \
     nr_failures++;                              \
     (void)printf(fmt, ##__VA_ARGS__);           \
+    -1;                                         \
 })
 
 static xc_interface *xch;
@@ -40,7 +41,7 @@ static uint64_t default_mempool_size_bytes =
     16 << 12;
 #endif
 
-static void run_tests(void)
+static int test_paging_mempool_size(void)
 {
     xen_pfn_t physmap[] = { 0 };
     uint64_t size_bytes, old_size_bytes;
@@ -80,7 +81,8 @@ static void run_tests(void)
         return fail("  Fail: setmaxmem: : %d - %s\n",
                     errno, strerror(errno));
 
-    rc = xc_domain_populate_physmap_exact(xch, domid, 1, 0, 0, physmap);
+    rc = xc_domain_populate_physmap_exact(xch, domid, ARRAY_SIZE(physmap),
+                                          0 /* order 4k */, 0 /* flags */, physmap);
     if ( rc )
         return fail("  Fail: populate physmap: %d - %s\n",
                     errno, strerror(errno));
@@ -98,6 +100,11 @@ static void run_tests(void)
         return fail("  Fail: mempool size changed %"PRIu64" => %"PRIu64"\n",
                     old_size_bytes, size_bytes);
 
+    /* We added one 4k page.  Check we can remove it. */
+    rc = xc_domain_remove_from_physmap(xch, domid, physmap[0]);
+    if ( rc )
+        return fail("  Fail: remove from physmap: %d - %s\n",
+                    errno, strerror(errno));
 
 
     printf("Test bad set size\n");
@@ -134,6 +141,19 @@ static void run_tests(void)
     if ( size_bytes != 64 << 20 )
         return fail("  Fail: expected mempool size %u, got %"PRIu64"\n",
                     64 << 20, size_bytes);
+
+    return 0;
+}
+
+static int run_tests(void)
+{
+    int rc;
+
+    rc = test_paging_mempool_size();
+    if ( rc )
+        return rc;
+
+    return 0;
 }
 
 int main(int argc, char **argv)
@@ -143,7 +163,6 @@ int main(int argc, char **argv)
     printf("Paging mempool tests\n");
 
     xch = xc_interface_open(NULL, NULL, 0);
-
     if ( !xch )
         err(1, "xc_interface_open");
 
-- 
2.39.5


