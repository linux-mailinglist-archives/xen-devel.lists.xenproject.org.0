Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id INJNMRGfPmofJQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AAE6CEA6B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZFTUDu8+;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346312.1604898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8m1-0006uk-KS; Fri, 26 Jun 2026 15:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346312.1604898; Fri, 26 Jun 2026 15:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8m0-0006ch-Mm; Fri, 26 Jun 2026 15:47:20 +0000
Received: by outflank-mailman (input) for mailman id 1346312;
 Fri, 26 Jun 2026 15:47:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8lq-0004h7-HV
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:47:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8lp-00Ad7h-S1
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:47:09 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9efb-e002-0a2a0a5209dd-0a2a450bedca-2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:47:09 +0200
Received: from [209.85.208.175] (helo=mail-lj1-f175.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9efd-ac48-0a2a450b0019-d155d0afedc1-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:47:09 +0200
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-3996c9eeebeso9996901fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:47:09 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:47:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782488829; x=1783093629; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLh8fGIE1A466qmTuKBcUXl7JYmNxJHzlMuXubpIZxQ=;
        b=ZFTUDu8+gU0m2A+bykZlaw6AHRzL4bOB/+9lXEU2zkB2fhzGqSoW1u3qh8PBT8wtfN
         aDaSZisKP6PsBtVcNwGinrCeY18uKvTM1nKU9kxN6hxF1XoZ9txxm3PXtJesX2zVyuB9
         W7+2cHgPCoqi37VKDkogpsPXyxAw3liQYfit84b+PyVwumYII0lonZ4uJClDMPeLuUNm
         IzcFyc9ASPE4h8Cs2FucLCvQHkJuFTIMRBOHWjkWnLIoIT3H6cKe70/L7X7GRlaKfd1w
         7PTxLbe6eHXYalB822KhqUBfxfhsclQOjO+vSXFVGNm4FxtXSudE/JRbD09vaEc0uDpc
         pQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488829; x=1783093629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oLh8fGIE1A466qmTuKBcUXl7JYmNxJHzlMuXubpIZxQ=;
        b=hm5B2waShXN/XPc4qoId/2dvIAXZ8q3X88aqJqvgci4kuHjYvmSaCKP7FoVIM1PP/Z
         CrNljyvatXYZibi25vabUxLumnelFmq8b+RRU4klKR120+zMFoC1eLKddmhT/nC7mTFa
         nTo7TAZ2B74zD6x13LWppOb4BuuMJ4TCsHVHUKQI5m/9meq0avHMRu9M8gEjBu/SrgDt
         5wvsFPcAvqUtHwqMsL6IK1fVaWjvKwoDtpcEaRVwTOmV6LJ9G2yvJNvu7D6TGBgvWmVb
         KjhR6nlni0NntP/D8HOFBAB/Ui+PXLaYilWpXuZ/MloYpp/ax14OTy0tek6EXcXosJXf
         mOBw==
X-Gm-Message-State: AOJu0YzJDEwIqWPrxn/D8hv7wVohOUUmniDNuIIK1Rsfzrv88Q9NUjNU
	8d8fayb8MjgkkUtkNQihZNgOqUkM/gf0l0sbwo0WgpVROv9DYWGOVwEjBx+IqA==
X-Gm-Gg: AfdE7clzLG8oKxZj+fGQQkRVOteWb3DGcYC6WCNLWSl9JT+CVifkZYnFavBri3M4p2+
	qz9t/5z+d8SAkmSLtXV3trrS8PwVKK9OsBRs+Sy0XOK5otGYDvRLOAzNppukmE7mYaXHRtasGWj
	XiT3KZcqQxXqw10RWpqKLbf7Ezbwx6TPIls6mQQYgwGthXJqCAiMStvNLfOrE+nb2xU9o3sHV6E
	L+gdtgNFTd/PYlCF3v2QdkdczIwyZhGqLlZBai0iyEKFGfsFU/bmYr29A+1VKWOqJ8t/EWhL8C7
	Js7iDQmBdqh7rafpKsxE5cxj700bXdDpFI7mxAoSJMBJclsBHhk+0tW22ejt5hmD0ysjiu7w4mh
	3v+rQeoJDEblQN72ry1zClNz12TzIqAtwlyVlPtifZgM1uATYi/yAV5SvmAJoRYu+11ga7ZjcKt
	5GhPg83n/cjguoDwVk1m6dAqOwNvPztcKknhKjyRrd3NPQgHZ4qE0ojnd97JqFiqKTOHws
X-Received: by 2002:ac2:4ec5:0:b0:5aa:6d0e:9d4c with SMTP id 2adb3069b0e04-5aea1f5945amr1360383e87.25.1782488829050;
        Fri, 26 Jun 2026 08:47:09 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
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
Subject: [PATCH v4 24/25] xen/riscv: provide init_vuart()
Date: Fri, 26 Jun 2026 17:46:33 +0200
Message-ID: <0d7964b75db0d5d42fe1788fc1bd77962301c927.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1782488829-3BB30220-FB46DC91/10/73395122804
X-purgate-type: spam
X-purgate-size: 1391
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,wdc.com,citrix.com,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2AAE6CEA6B

For debug purpose is enough to have only print messages from guest what is
now implemented in vsbi_legacy_ecall_handler().

For full guesst console support it will better to have something similar to
[1], thereby there is nothing specific should be done, at least, for now
and init_vuart() is provided to make dom0less code buildable.

[1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop/

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3-v4:
 - Nothing changed. Only rebase.
---
Changes in v2:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
---
 xen/arch/riscv/dom0less-build.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/riscv/dom0less-build.c b/xen/arch/riscv/dom0less-build.c
index a1fa51b996a7..d1a51b92936a 100644
--- a/xen/arch/riscv/dom0less-build.c
+++ b/xen/arch/riscv/dom0less-build.c
@@ -8,6 +8,14 @@
 
 #include <asm/p2m.h>
 
+int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
+                      const struct dt_device_node *node)
+{
+    /* Nothing to do at the moment */
+
+    return 0;
+}
+
 int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
                              const int node_next, const void *pfdt)
 {
-- 
2.54.0


