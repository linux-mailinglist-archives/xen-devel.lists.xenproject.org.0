Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id R9AxKmNU/GmKOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:59:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D604E55BD
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:59:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302327.1576289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuZX-0002Ok-9l; Thu, 07 May 2026 08:59:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302327.1576289; Thu, 07 May 2026 08:59:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuZX-0002MO-5A; Thu, 07 May 2026 08:59:07 +0000
Received: by outflank-mailman (input) for mailman id 1302327;
 Thu, 07 May 2026 08:59:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKuZV-000288-Ov
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 08:59:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKuZV-00CM1g-5g
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:59:05 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc5457-5cb7-0a2a0a5109dd-0a2a45019b40-14
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:59:05 +0200
Received: from [209.85.218.53] (helo=mail-ej1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc5458-c1f2-0a2a45010019-d155da35dd29-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:59:05 +0200
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b9358bc9c50so97041766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 01:59:04 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc81d5e9583sm57549966b.17.2026.05.07.01.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 01:59:03 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778144344; x=1778749144; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElKZ0H6u/sSoXuky68q5cjnp17vaVqQmV7qTVsC1O8w=;
        b=XAueRDBVOniME+t2o7j9YqeJvqQdzKajUlr2rc4WITOfbKzQCQ5p66mrwjyVSYhpCv
         ACPvdWAr41sqPunhIh5IAoSyIpbM3DqKa4eAKgPUd9v09I1s8gOd74m+ejbOh7EPQ5v9
         saMKo2GENGJOa3QRWVAQI+Sd1bNzTV+i11/BJNwdfN+eZMu5HKmqob6IBjg+T/CTfdtm
         dsVK/IdQytQFScY00oORXkXRfZbIQ3xIqT1o8XCMbs1oq6Z1MJNwkQ2J3XuR7Fhsuk0t
         cikfbxxoMcekpUueCTNcLkFM9bg2UB+ScI9pZ2Yeyh5LkYtHaB1aVpzbU1mhFCcTpdPA
         H2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144344; x=1778749144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ElKZ0H6u/sSoXuky68q5cjnp17vaVqQmV7qTVsC1O8w=;
        b=XU1hoNUieTgwu+d52eT1/uhZBEI1bjjvll13z0ZTBj4iHWMilrP+VDjLYT2s/+MtvU
         bD82QNnNZaWLssM0Wu1OtUCG84B2wu7vjVW1DF/RUK9pVDWtJvd2gGiJ/BXOF9m2F7HT
         4Zdnjom2/pFpIsSE6wuS+mGE/DDq2FquQxjXIqHTw+vYfrMGJ+GjENFd0u1hWAWbWEyM
         NfvLlKyi5yLjRyeXAjTIPETOIViAXPhLdoW8/NWbMRQB9gDaARvBtB72Swz1Vd+0/5e1
         OH2znqrUR801XaCcxt0PbZ+WkzfJKjT50r1V2A5Rc5z5zNLHD4e7yCWJ566mHSYZFOxw
         t8HQ==
X-Gm-Message-State: AOJu0YwM1aVZkzPmyS/fPsWAhBLNMHJcY0XiPQlv3Zu4/i1W8xRm++7w
	mZjEZjD6gjbntnBZVOJn3wXGFxngaKAvdoGLwLltMUeliLSCFoM846+0c20V/Q==
X-Gm-Gg: AeBDietYABACMO+/w+OfP0G3kH5KwPOXdtSMjMoVkvW+bmh+Cj02ANynOEd3uT0I6Qw
	HjVI+9GSAnixurztPKzpWcB9xF+F8p2A31dSGomt9jfwh/z9lTubVdfD6dM/ydZuqkI+QOsIpiQ
	mgp4LgBVaRHedO/Gr/KNAMAkl8/NkFh4koAiFcSSucZr7O4noljX5j98kQIciOWpqORWRwzsHIU
	JQSuJ1JIMWYyl+DRMf+v0JzI2dyyd58cXIU27JrqJmK3q6HNA3Eom037Me+/j5TO7N7eAdCsRDf
	6fnL3cXYps1dOePH3/J62IfJF8+T5pTVsmFlh3XbXdPk7ojXNZeQeE//3dzyfC6rJS2H/UVHw9y
	5gYCNxHguFAygyC/jmMKDHAYQgBE2NU5fbLZOCSuBGwR6/W1aokiNZ4aGoSID7mk2Q2hFgyNgk4
	zlL9iAfB2GAor78Ecne5NgcgDnjZbfBi3xtxVE4gBRIzlik8E5wV9fr2va7W/jqnJlM2jRnYdP0
	frmw4oOv6nMpXpbKkG71XWAyg==
X-Received: by 2002:a17:907:3cc7:b0:bc4:aafa:65cf with SMTP id a640c23a62f3a-bc56c92bfc1mr415473166b.16.1778144343898;
        Thu, 07 May 2026 01:59:03 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v5 01/11] xen: arm: fix len type for guest copy functions
Date: Thu,  7 May 2026 10:58:40 +0200
Message-ID: <6f629fe2e194382534d3b1e2400b753c43ccb04b.1778140240.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778140240.git.oleksii.kurochko@gmail.com>
References: <cover.1778140240.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1778144345-AEF58FF4-33AE15F9/10/73395122804
X-purgate-type: spam
X-purgate-size: 5531
X-Rspamd-Queue-Id: D8D604E55BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:luca.fancellu@arm.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Widen the len argument of copy_to_guest_phys_flush_dcache() and the
copy_to_guest_phys_cb typedef from unsigned int to unsigned long, as
the function can be used to copy large blobs such as the initrd which
may exceed 4GB. Update the internal copy_guest() len argument to
unsigned long accordingly.

Change the type for local variable size in copy_guest() to avoid
compilation error because of type mismatch.

raw_* wrappers above copy_guest() keep returning unsigned long to
avoid type narrowing; it is not an issue for raw_*'s len argument
to remain 'unsigned int' since the assignment to copy_guest()'s wider
unsigned long parameter is safe and there is no raw_* users who
are using a value bigger than what can fit into 'unsigned int'.

Fixes: 2986481b3d9e6 ("xen/arm: guest_copy: Extend the prototype to pass the vCPU")
Fixes: 5302bd490bea7 ("xen/arm: Introduce copy_to_guest_phys_flush_dcache")
Fixes: d07b7369aa65b ("xen/common: dom0less: introduce common domain-build.c")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v5:
 - Add Review-by: Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v4:
- Add Fixes: tags.
- Add "arm:" prefix to commit subject.
- Add Reviewed-by: Jan Beulich <jbeulich@suse.com>.
- Avoid using of min_t.
---
Changes in v3:
 - Correct the declaration of copy_to_guest_phys_cb() instead of return
   'unsigned int' to be in sync with len argument, the type of len argument
   is changed on 'unsigned long' as initrd could be pretty big and also its
   size is stroed in 'paddr_t' which is 'unsigned long'.
 - Update copy_guest() prototype to avoid trancation bug for len argument.
 - Revert prototype changes for raw_* wrappers above copy_guest() as they
   should keep returning unsigned long to avoid type narrowing; it is not
   an issue for raw_*'s len argument to remain 'unsigned int' since the
   assignment to copy_guest()'s wider unsigned long parameter is safe.
 - Change the type for local variable size in copy_guest() to avoid
   compilation error because of type mismatch.
 - Add Reported-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v2:
 - New patch.
---
---
 xen/arch/arm/guestcopy.c                | 6 +++---
 xen/arch/arm/include/asm/guest_access.h | 2 +-
 xen/include/xen/fdt-domain-build.h      | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
index fdb06422b8e9..86f1c9d0e318 100644
--- a/xen/arch/arm/guestcopy.c
+++ b/xen/arch/arm/guestcopy.c
@@ -53,7 +53,7 @@ static struct page_info *translate_get_page(copy_info_t info, uint64_t addr,
     return page;
 }
 
-static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
+static unsigned long copy_guest(void *buf, uint64_t addr, unsigned long len,
                                 copy_info_t info, unsigned int flags)
 {
     /* XXX needs to handle faults */
@@ -65,7 +65,7 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
     while ( len )
     {
         void *p;
-        unsigned int size = min(len, (unsigned int)PAGE_SIZE - offset);
+        unsigned long size = min(len, PAGE_SIZE + 0UL - offset);
         struct page_info *page;
 
         page = translate_get_page(info, addr, flags & COPY_linear,
@@ -136,7 +136,7 @@ unsigned long raw_copy_from_guest(void *to, const void __user *from,
 unsigned long copy_to_guest_phys_flush_dcache(struct domain *d,
                                               paddr_t gpa,
                                               void *buf,
-                                              unsigned int len)
+                                              unsigned long len)
 {
     return copy_guest(buf, gpa, len, GPA_INFO(d),
                       COPY_to_guest | COPY_ipa | COPY_flush_dcache);
diff --git a/xen/arch/arm/include/asm/guest_access.h b/xen/arch/arm/include/asm/guest_access.h
index 18c88b70d7ec..c13cbec55b65 100644
--- a/xen/arch/arm/include/asm/guest_access.h
+++ b/xen/arch/arm/include/asm/guest_access.h
@@ -14,7 +14,7 @@ unsigned long raw_clear_guest(void *to, unsigned int len);
 unsigned long copy_to_guest_phys_flush_dcache(struct domain *d,
                                               paddr_t gpa,
                                               void *buf,
-                                              unsigned int len);
+                                              unsigned long len);
 
 int access_guest_memory_by_gpa(struct domain *d, paddr_t gpa, void *buf,
                                uint32_t size, bool is_write);
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
index 9465a1021fe3..671486c1c837 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -48,7 +48,7 @@ static inline int get_allocation_size(paddr_t size)
 typedef unsigned long (*copy_to_guest_phys_cb)(struct domain *d,
                                                paddr_t gpa,
                                                void *buf,
-                                               unsigned int len);
+                                               unsigned long len);
 
 void initrd_load(struct kernel_info *kinfo,
                  copy_to_guest_phys_cb cb);
-- 
2.54.0


