Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPd2NQv+jWm0+AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:21:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C956812F501
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:21:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229477.1535465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZRU-0007E8-G8; Thu, 12 Feb 2026 16:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229477.1535465; Thu, 12 Feb 2026 16:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZRU-0007D3-9P; Thu, 12 Feb 2026 16:21:24 +0000
Received: by outflank-mailman (input) for mailman id 1229477;
 Thu, 12 Feb 2026 16:21:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XV9D=AQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqZRR-0005jV-QO
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 16:21:21 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dded50a9-082e-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 17:21:21 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4376de3f128so41886f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 08:21:21 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783e5c635sm13938426f8f.37.2026.02.12.08.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Feb 2026 08:21:20 -0800 (PST)
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
X-Inumbo-ID: dded50a9-082e-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770913280; x=1771518080; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRkNJBibaLYU3bMR9lUWo949I9MQDI6fqJ8QTLnRMOI=;
        b=S9rG2hX1diD8RiAFb4TVsRd/ECXYFtnsrWHKlTPZOfkcz2QXMIx70WwlLFKz8PNw7a
         Fs4+sYYT/qKvC3QPxDLYbTPNyNNjlulrmz+YLxP7iZ2V2jdsDlBH3ljWxEqDDq05+IZf
         Jv9TLzM8cr5eFid15PzzifW03olMo0lMkLIljGEELXmiK6/Gj3GtyqZGMptQzIx5wz+f
         iVQqI0K0CETuCPssekfDp7reblKtdrhummCrBOeZ7aFP6fc2V0uLJKRi1wcJkl954JX0
         CxN52jWBDkdMGhX6IB+C7S/Nki7FmVlEVK1rtyee5mA3Rqgs8C14ydh0QaVDJ8+PT6A8
         P6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770913280; x=1771518080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CRkNJBibaLYU3bMR9lUWo949I9MQDI6fqJ8QTLnRMOI=;
        b=THcZ9rXfS/RiFrAT0wqjxU8IY5s/YJDulKJYeya8xHI25zft0uaQzg1OIVOv7WqRj9
         CoCdtcx2akhTUo3Ah2zpC7PzLs3C6vhFwh66wInmpdAvmKhltWarVsrt9yeWraPi1I/N
         4kcmJZhoKT0YJ6+IQp52Yu2Ldg3dCIkotdbiXtncOTyE06O4BIOS8FN2LLtbzRNdU43t
         Avfh/U1M853wzxR176syBK76PpPvTIoFBT2g+y/ydQzR6Wr3uCjQEwYiHHPR6Krm8RXh
         idQBjFdmxEVihWWo6s4kt+ZUFnt8CGqBELlWp8JM1/N8zSckmiS9On8U8UHAEmsF/ZUH
         ESPA==
X-Gm-Message-State: AOJu0YzGYtNTYUuiCzJHsv/tdJ/osyczivxJdeJeQV/EQdM5Nj/JJJvG
	Q+vh+XEagOSjzyWODnm29qurgxvRBLKhhrLG4p/BmD+V9qRSrDdblYobxdBKm3Qp
X-Gm-Gg: AZuq6aJPOT2Dbdkr8t45E3gma04b+HJacSOtnc4uHQA4wEf0lISapcvUyCTPJmINY6L
	+A4lMzgNZnr353GpOiz5yCM525m54vevBmVXJ+8sARehum5OYC9AwpTP3wKQc0Sw9ZHcxhxvnmr
	bvz1bEWB3sKczZ0JH5MYuAnkJXN8Tm/QuIMMV7/s4xzPWj9TSGg3AoV9QjbaT4DCF+G/JX4HW9z
	Am+0VVwHThBrK8kyn/33ADIU6FuzX/EWZNED5r5MiXkgnH9LFZVdO8uvAweA8gT/VZ+rfXTJ//o
	4m74N4MggyIh5SE52mrB0NSILGb7iAI4IiI2VuPeLo3n4G3dSAA2+8bAqFdzbjrqgGd2HR41RbI
	6ZOriJlJtNOYs2ysSd8HiQD4raHVjnCThyFP3h1oNhAd8CNZXw4VxuBmdrc3CuJ30jWduunuzx6
	ThHxA9J/zNE7hgIoibjCZjkRKhm+fBsd06ZHMHdec+ItoDj7wsroXdynCKGSW++qA7WQ==
X-Received: by 2002:a05:6000:1acb:b0:437:681e:cbc3 with SMTP id ffacd0b85a97d-4378ac92470mr6296018f8f.13.1770913280269;
        Thu, 12 Feb 2026 08:21:20 -0800 (PST)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 4/6] xen: move declaration of fw_unreserved_regions() to common header
Date: Thu, 12 Feb 2026 17:21:05 +0100
Message-ID: <bbc6731f40adec155249ac32f8b87af72f9eef51.1770821989.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770821989.git.oleksii.kurochko@gmail.com>
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C956812F501
X-Rspamd-Action: no action

Since the implementation of fw_unreserved_regions() is in common code, move
its declaration to xen/bootinfo.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/include/asm/setup.h | 3 ---
 xen/include/xen/bootinfo.h       | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 899e33925ca4..0d29b46ea52b 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -43,9 +43,6 @@ int acpi_make_efi_nodes(void *fdt, struct membank tbl_add[]);
 void create_dom0(void);
 
 void discard_initial_modules(void);
-void fw_unreserved_regions(paddr_t s, paddr_t e,
-                           void (*cb)(paddr_t ps, paddr_t pe),
-                           unsigned int first);
 
 void init_pdx(void);
 void setup_mm(void);
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
index f834f1957155..dbf492c2e36e 100644
--- a/xen/include/xen/bootinfo.h
+++ b/xen/include/xen/bootinfo.h
@@ -210,4 +210,8 @@ static inline struct membanks *membanks_xzalloc(unsigned int nr,
     return banks;
 }
 
+void fw_unreserved_regions(paddr_t s, paddr_t e,
+                           void (*cb)(paddr_t ps, paddr_t pe),
+                           unsigned int first);
+
 #endif /* XEN_BOOTINFO_H */
-- 
2.52.0


