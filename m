Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFmiCyVc/GndOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 11:32:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D33AE4E5F77
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 11:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302484.1576414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKv5W-0007Lx-Ph; Thu, 07 May 2026 09:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302484.1576414; Thu, 07 May 2026 09:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKv5W-0007Jv-N9; Thu, 07 May 2026 09:32:10 +0000
Received: by outflank-mailman (input) for mailman id 1302484;
 Thu, 07 May 2026 09:32:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKv5V-0007Jp-SN
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 09:32:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKv5V-00Bwl5-8v
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 11:32:09 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc5c13-5cb7-0a2a0a5109dd-0a2a450ca10a-48
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 11:32:09 +0200
Received: from [209.85.208.53] (helo=mail-ed1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc5c19-62f1-0a2a450c0019-d155d035f12d-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 11:32:09 +0200
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-67c4aaf76ecso916894a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 02:32:09 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc835918d7asm62319266b.62.2026.05.07.02.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 02:32:07 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778146328; x=1778751128; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=46af2t54qJk6zCKkQwc3CwUTGN7IJ2VCtdRVcoKsi3g=;
        b=jbxlGoCnGH92UoL7rxbUqZXu4g6JcTtBM2mBivF//21vAleSRuIgvjQgZ+0Ng+Tcpc
         9fInLNm63jNU0sr5GMeAmaNTlho8Btic0Ic32YDsFI9dg4QqyrLgj9mEdF/Am3n5v3ZD
         nEJ9YLuDmPFTGNKiK1/Y67gsV5su9HYZ1IkswPJqmaKshhlfIMZF18HTp39HBE7wsZlU
         cp74spHvI+nSzfc3ix1TWdv/zEyP8hieH4lfzbkdROhVqY+sIW+aUev4aBBaXhqXha17
         novXNuiYteSersj6Hj+fGs6caZewCOEDFkkf3vJbAN3u/hDLred0PUCTPvXgwub4FLyW
         m3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778146328; x=1778751128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46af2t54qJk6zCKkQwc3CwUTGN7IJ2VCtdRVcoKsi3g=;
        b=DyROXcJfku9RN5LmdwRG/C+AS2Vem6QPsq4Ii/as/ipi6lKzlPwbMF5eSXxc/GdTNJ
         sQixjHkapZqGV+RuKOb+xBkxrJ31ZcL5V4a5QND5SoB35DJQldbybvleEUlvYWvUnKaW
         bMh7x5ciJLzFGS4L4NFbHHkwGTAZlCiiJoxUANTxXFzr6rolNKeqjKzXs+XFwqHTQQyG
         xd4QJ6ngTtjRJ1awkJMQTe7lKPtV1cWqhk0Dc/ZpdnbKd0KUrqRmD3Klt39ih50s7/NL
         h0ORFgxn94uHKx9nN0jRXL2BzkhkeNW+BVHw9m3PcDL2aRpMjC3LMdmWpVSB6vc+zP9a
         SAVQ==
X-Gm-Message-State: AOJu0YynI0edB0PnrZK3dGRPZ1IZegRd2ORC3eVvSTK/v1Q58gYlF584
	nbO+SxpH7zCJIT0KYZ8md92sTtbmm3/xH0eR6M8D87i0bJbXe67BHvX3sfYGWg==
X-Gm-Gg: AeBDieuELRoaqIhTgYQtgzce62GNTz/InBE8G+Rox3BnT5l8CN/1BBYtLy7M0GhX38l
	h/aodvOYMDhxjyQVQykR6apJOSgUF6CCwQ8IaBsWRFvUofu27v/6vs0l6asP/YMCWImFqxixLbH
	CrzvS8XWel6QjUJU4i9HNOxiozk9zb1SI6KKgrGeCpEYJOhTOUbMfIXdV6w8iXcX5QVmAEzZrEs
	QUeZlF+mGQzIbGsmfQ/zTpK2UGbtHNjPVHfQLlAnKgCQbkUDx24on02jwXb87r0HuTu0jjYv4yN
	s/2oZV1GKr8roDYSa6D+0YTalFMp6WIWAb/3sJ7EpkY5F9fp3z6oOh3/QCmuEfNvHoko/U5iAUP
	mOT27JDdOqL/vTupbZSgcFtj1/FlVEaMJa32Mex2vf7CgyP5U3OBrDoRv5r/VY/TYXJsga7Mx2e
	7BceB2aFa263+9dE41iqGPLfHg9oKClV92Y1VyUIrYFmiLL7k3ofcSMk7lc0knqbapEdHZxXlC7
	eFHqpbycAkpcO0=
X-Received: by 2002:a17:907:3c83:b0:bc3:c753:b03b with SMTP id a640c23a62f3a-bc56ae2a7damr421306166b.3.1778146328110;
        Thu, 07 May 2026 02:32:08 -0700 (PDT)
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
Subject: [PATCH] xen/riscv: fix MMIO alignment check in imsic_init()
Date: Thu,  7 May 2026 11:31:55 +0200
Message-ID: <20260507093155.105950-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1778146329-F5B82CF5-E5F6DCC9/10/73395122804
X-purgate-type: spam
X-purgate-size: 1258
X-Rspamd-Queue-Id: D33AE4E5F77
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

The MMIO alignment check in imsic_init() incorrectly uses cpu as
the index into mmios[]. The loop index should be used instead.
Otherwise, the alignment check may be performed on the wrong MMIO
address.

Fix the index used in the alignment check and corresponding printk.

Fixes: c9bd8b322ecbb ("xen/riscv: imsic_init() implementation")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/imsic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index a4460576f620..f7b70a8da09e 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -451,11 +451,11 @@ int __init imsic_init(const struct dt_device_node *node)
             continue;
         }
 
-        if ( !IS_ALIGNED(mmios[cpu].base_addr + reloff,
-                         IMSIC_MMIO_PAGE_SZ) )
+        if ( !IS_ALIGNED(mmios[index].base_addr + reloff, IMSIC_MMIO_PAGE_SZ) )
         {
             printk(XENLOG_WARNING "%s: MMIO address %#lx is not aligned on a page\n",
-                   node->name, msi[cpu].base_addr + reloff);
+                   node->name, mmios[index].base_addr + reloff);
+
             continue;
         }
 
-- 
2.54.0


