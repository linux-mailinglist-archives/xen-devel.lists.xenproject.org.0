Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEprNm4d2WnVmQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:55:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 788043D9DFF
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:55:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279414.1563844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECQ-00072c-Ui; Fri, 10 Apr 2026 15:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279414.1563844; Fri, 10 Apr 2026 15:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECQ-000702-QK; Fri, 10 Apr 2026 15:55:14 +0000
Received: by outflank-mailman (input) for mailman id 1279414;
 Fri, 10 Apr 2026 15:55:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wBECO-0006mB-Ch
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 15:55:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBECM-00Cwd5-71
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 17:55:11 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d5e-bab6-0a2a0a5309dd-0a2a450abe1c-6
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:11 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d5f-ee98-0a2a450a0019-d1558033c175-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:11 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso19690445e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:55:11 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5b3c597sm78285605e9.12.2026.04.10.08.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 08:55:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775836511; x=1776441311; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSz7tlr6rhlyBnCcpNqgWXaL+9iidsazDOLEUrgU1Kw=;
        b=hkRvH8V/UMxke5UZ1Lwi2OAgzeNI7sqEUD29pCsTTe3itNieOme7Hc3EAA7NjFTIRl
         Vg/GC34oJLhcnG5KGK7lsg7PxSvrqKtId9ybvREqAuXukabeuDRnKZRIU5X/GxoZpeQm
         ql6rx8xuh9TO2fzSn/4WFVXF+tfUiXvedGj+m0N/AB18Djdp8ZXCszgIPQv6jXF0/S8V
         INQpZ6O/T3kbmakXPUOd4WQfgh0JGJE605R6pZC3Hj18o0MyZ9EYTsLZ2LbFKzHJzVw7
         IPU0J+PwNdw01LreR+X4H5Yxaybv5St5PrzwUUWDrInkv9Kf4Tnzj5tdO8o9OgJwf/PS
         dMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836511; x=1776441311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MSz7tlr6rhlyBnCcpNqgWXaL+9iidsazDOLEUrgU1Kw=;
        b=dt6sdg9BVxKEd4BpZpyuzZUuxmdla3b4BofA9WHqgGcN+mhMlQxPbfoKN0wmVY8VUp
         tZgGHDSMNOrV59XiknF1SYmwTl9VvviW/YT3i5+Yi7qNcg7L8t3Utoxv/7ocvAW3/iWy
         O9pkhu0UBKdOS+SF8GYXmkTiXoTN3Q5e4q9yZJpHXh5FSGeYPrYZ1/kgQkB9VziT65DM
         /EWflfYDuZmYiTmnGFsbgA52Hf54c4B2qCNjTSjWijOcbAz3FUQx8gfNZLkbAgRx2+b2
         T/7bO8eddLXypU4iS2dyzX+eQQa+MdcqG7bqLnFsGkXqzjczBqOKy89tYggEA7Q+Apv4
         zcWw==
X-Gm-Message-State: AOJu0YwrqLSP8cVfERwMt1qomEvtaYCevJd9l8BF6wOySJky+RGiIR7q
	tuoTLYAtVYz7kgYBKheatPsZJw3lQ08CaAJC1JXONVkF1PDdWlKaxwRwapvJgw==
X-Gm-Gg: AeBDiev67pnAEQgFEWo0ghAKMhFtjZsftWc833YSkNx40YbWcIECY9rEIxwWAYK9uuG
	Tgft9YInLQM9IfaAnI0AfjH8S84FMvMr50NtK52+/esfdbN/IyGunR3NYWcX3j7JoueefKSP+BJ
	jhsOC/n+H8GGzNhFg+JltLLShHKQIjtBJlhSGXJd6rPKv2Gg8/ci9y/3YQW82OIjHkd2Ihwnwd2
	uYyiLSHtB3mSBKbCqZC02GonhJXfIx2afV/ydV/l5Ce1L4VJ1c5bZ36gNbVk9K3s3ndaa0Aj0rk
	DOcDVi8CqqG9SWcTx7+vg/dJa3Afox7t5Nm1tUsj5Tvx+VhpFRrjL8MxPP9PzQurMW1R4t1UNDT
	UxUs/WxqOpJGXJGEdsLpVzA+WKeH9Ia3eXbsURz/JxW/w6gOOvipMvPW6c87MiRHRhC2bqADq48
	WXCrdDP7Bi+4hpiUMUfG/n45owLDOSRyJthppM+YL7OxetCVCr1Bw0gpQXgrNMoOHmOA==
X-Received: by 2002:a05:600d:1c:b0:487:1108:48bc with SMTP id 5b1f17b1804b1-488d6836d87mr38497135e9.17.1775836510630;
        Fri, 10 Apr 2026 08:55:10 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 01/12] xen/riscv: implement get_page_from_gfn()
Date: Fri, 10 Apr 2026 17:54:47 +0200
Message-ID: <e32db25650546146594635821441494ee86648e9.1775836193.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1775836193.git.oleksii.kurochko@gmail.com>
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1775836511-C58140B1-46DD9E41/10/73395122804
X-purgate-type: spam
X-purgate-size: 3227
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 788043D9DFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The function is implemented out-of-line rather than as a static inline,
to avoid header ordering issues where struct domain is incomplete when
asm/p2m.h is included, leading to build failures:
  In file included from ./arch/riscv/include/asm/domain.h:10,
                   from ./include/xen/domain.h:16,
                   from ./include/xen/sched.h:11,
                   from ./include/xen/event.h:12,
                   from common/cpu.c:3:
  ./arch/riscv/include/asm/p2m.h: In function 'get_page_from_gfn':
  ./arch/riscv/include/asm/p2m.h:50:33: error: invalid use of undefined type 'struct domain'
     50 | #define p2m_get_hostp2m(d) (&(d)->arch.p2m)
        |                                 ^~
  ./arch/riscv/include/asm/p2m.h:180:38: note: in expansion of macro 'p2m_get_hostp2m'
    180 |         return p2m_get_page_from_gfn(p2m_get_hostp2m(d), _gfn(gfn), t);
        |                                      ^~~~~~~~~~~~~~~
  make[2]: *** [Rules.mk:253: common/cpu.o] Error 1
  make[1]: *** [build.mk:72: common] Error 2
  make: *** [Makefile:623: xen] Error 2

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - As nothing is called get_page_from_gfn() for system domains, leave only
   handling of not system domains.
---
Changes in v2:
 - Align implemntation with Arm's get_page_from_gfn().
 - Update the first comment about DOMID_XEN to mention that isn't "normal"
   domain instead of no-autotranslated.
 - Drop footer after commit message.
---
 xen/arch/riscv/include/asm/p2m.h |  8 ++------
 xen/arch/riscv/p2m.c             | 13 +++++++++++++
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 60f27f9b347e..54ea67990f06 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -164,12 +164,8 @@ typedef unsigned int p2m_query_t;
 #define P2M_ALLOC    (1u<<0)   /* Populate PoD and paged-out entries */
 #define P2M_UNSHARE  (1u<<1)   /* Break CoW sharing */
 
-static inline struct page_info *get_page_from_gfn(
-    struct domain *d, unsigned long gfn, p2m_type_t *t, p2m_query_t q)
-{
-    BUG_ON("unimplemented");
-    return NULL;
-}
+struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
+                                    p2m_type_t *t, p2m_query_t q);
 
 static inline void memory_type_changed(struct domain *d)
 {
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 89e5db606fc8..d63697c89a1a 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1534,3 +1534,16 @@ void p2m_handle_vmenter(void)
      * won't be reused until need_flush is set to true.
      */
 }
+
+struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
+                                    p2m_type_t *t, p2m_query_t q)
+{
+    /*
+     * system domains are domains which doesn't have p2m translation tables,
+     * so they can't use p2m_get_page_from_gfn() and extra care should be
+     * done for them.
+     */
+    ASSERT(!is_system_domain(d));
+
+    return p2m_get_page_from_gfn(p2m_get_hostp2m(d), _gfn(gfn), t);
+}
-- 
2.53.0


