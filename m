Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN7sI+JMFGqnMQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 15:21:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DCA5CB089
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 15:21:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319263.1586957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRVEq-0000Pn-J2; Mon, 25 May 2026 13:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319263.1586957; Mon, 25 May 2026 13:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRVEq-0000OH-FK; Mon, 25 May 2026 13:21:00 +0000
Received: by outflank-mailman (input) for mailman id 1319263;
 Mon, 25 May 2026 13:20:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wRVEp-0000Am-7A
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 13:20:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRVEo-00FBlO-Ce
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 15:20:58 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a144cb6-2eae-0a2a0a5409dd-0a2a450bc874-2
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 15:20:58 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a144cba-212f-0a2a450b0019-d1558029ec5d-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 15:20:58 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-49056b9f04aso23460195e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 06:20:58 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904526ca21sm247101985e9.3.2026.05.25.06.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 06:20:56 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779715258; x=1780320058; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhYowuyAWGSpmaN++lAXXVAbSyUZzptdaqiWvdE8iRk=;
        b=h+NL8aXgs+6cVmWHqSA0JpneZl8KikOtvxPqpozCYSp8U4ATGEHA1gnyBqlKxIK19o
         aV2e6JfL/ZbSmLM0xaW6Tjtg/1O+G129/9vZ6OEF/nTr2vSVN5HPvCxz5yYEazovHobF
         nF/CamXqZSt2v0HqldWtFyAlC2SE5LlcrhwgMfL28nca5QHdAgwB0KmdlwRkDJfmdVrg
         ERM8O8sQgmiuo/nQf/INcLh72FnD8jSQ2f7/F50P3XJY9DtpzoVnJKzd9dfOtwvrbNZt
         6oKYrIsOoLrtjbOzSJCuDrtm6HswiQ4+nnwCj8/g+TUENKs60SkJLj/hgaDh88CVMX/L
         nTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779715258; x=1780320058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mhYowuyAWGSpmaN++lAXXVAbSyUZzptdaqiWvdE8iRk=;
        b=kk7+fqIbhCIIDTwyDaOEDkq/mKs6hbsrGxQDDgyXWvn4J+xOMi6oOiZ14ka8icBhTv
         BfefXh/SfWzx6g8jnQF1me/7JnRhW3dA7Lm+RbFh+c4ZEFHf1S554SjRKs3o7x2aRcMS
         Z6Z+WHS0XjsF1nWnkx91rfwWa4gz/bRKcXe0qemE3g20+jOIH7Ms3mZNhgEdTqjoFoJ5
         wL+YSf9+n8Xw+F+XE9QDCsL620pzqlkbWbLClPAw97b0JMdK7Stw8X181666ZaRF9mR3
         9GlittDzn/dZKQAw85VAjVVGPAebuKW/czORr8/2eKydlXkieB5EEBtMa+Y85rn40ebD
         ObDQ==
X-Gm-Message-State: AOJu0YxYWIesY9YZVrhaL3sT4EEq1wjqW9Nn4a1S5QCjVKlF5idAVjmE
	E9yi4QHJ5XtAmWuSe0TVIzGQmK8lklfmuicqt8BM+Wcu7ejGeGchoYuiRFUi+1ci
X-Gm-Gg: Acq92OF/gtmQviSEOplrzxK2Yh8imyQmnXjb2hCK2/lEPswWBvb4cAiOp2LMAhhvyJ6
	BSSF2uzVOBEettAVqXZ2+3Up7yqj6GRLjwTld4lOyOPJMl5y3OM+h/WEImhxGxAkbda4+TobMnu
	4GeLoMVLEyv/mAaBAUYZpP4O/kb1TyUyxukBiCRHeVVwl3js4P+46TDNg4u61JhApX85oI0at5F
	+XB8ahC26uax7m3exbt7YylFBEOvlq1qTCXq5A6yw9AFy1KAz69d8fEwdYveMgveGIXfqsDM5HE
	BXo5OqSZ3R1ksxgeBWpzow4fofORCYTiEo0YLoVihYX/auJRrOp6wKH70dB5jfKiRv4Mr+WVAF2
	D24v+q1DigtWQd4ZONRKoNd6u/L60Zp1mJvz7zZuQWAiW1ANRM4ueb7MHLwVYOicM/e4aKsw8O6
	oNAYoxtqpsfJqnqNoh/Cb471SuMNLejD9IrtOWfLTtgyYZkcJi/JxyxnW4OlAZaEb6vZaM96BCh
	lxG
X-Received: by 2002:a05:600c:8b12:b0:490:5191:6e1a with SMTP id 5b1f17b1804b1-490519170d7mr184485815e9.24.1779715257471;
        Mon, 25 May 2026 06:20:57 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>
Subject: [PATCH v2 1/3] xen/riscv: fix switch_stack_and_jump() for range beyond 1M
Date: Mon, 25 May 2026 15:20:42 +0200
Message-ID: <21bc40d4a09bb4cfe0999430ea7e65b369fd4033.1779712171.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1779712171.git.oleksii.kurochko@gmail.com>
References: <cover.1779712171.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1779715258-18B60F3B-4DFE5F36/10/73395122804
X-purgate-type: spam
X-purgate-size: 2202
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:baptiste.le-duc@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 49DCA5CB089
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The `j` instruction (JAL x0) used in switch_stack_and_jump() is a
J-type instruction with only a ±1MB range, and that this can
be exceeded in some configurations, causing a linker error:

  relocation truncated to fit: R_RISCV_JAL against `<symbol>'

Replace `j` with `jr` (JALR x0) via an explicit register, which has
unlimited range.

Found in a downstream branch when UBSAN instrumentation was enabled.

Note that the `tail` instruction looks more natural here, but `jr` is
chosen instead to avoid depending on how the assembler expands `tail`
and which scratch register it uses (`t1` in GAS), which would need to
be listed in the clobber section of `asm volatile`.

Fixes: e66003e7be199 ("xen/riscv: introduce setup_initial_pages")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes in v2:
 - Update the commit message and subject
---
 xen/arch/riscv/include/asm/current.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/include/asm/current.h
index 5fbee8182caa..cc004670d18c 100644
--- a/xen/arch/riscv/include/asm/current.h
+++ b/xen/arch/riscv/include/asm/current.h
@@ -51,11 +51,11 @@ DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
 #define vcpu_guest_cpu_user_regs(vcpu) \
     (&(vcpu)->arch.cpu_info->guest_cpu_user_regs)
 
-#define switch_stack_and_jump(stack, fn) do {               \
-    asm volatile (                                          \
-            "mv sp, %0\n"                                   \
-            "j " #fn :: "r" (stack), "X" (fn) : "memory" ); \
-    unreachable();                                          \
+#define switch_stack_and_jump(stack, fn) do {                    \
+    asm volatile (                                               \
+            "mv sp, %0\n"                                        \
+            "jr %1" :: "r" (stack), "r" (fn) : "memory" );       \
+    unreachable();                                               \
 } while ( false )
 
 #define get_per_cpu_offset() __per_cpu_offset[smp_processor_id()]
-- 
2.54.0


