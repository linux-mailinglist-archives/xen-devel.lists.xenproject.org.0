Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HF0Nm3WmGl7NQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F5016B0A0
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237610.1539856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYL5-00005R-Rv; Fri, 20 Feb 2026 21:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237610.1539856; Fri, 20 Feb 2026 21:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYL5-0008U7-P6; Fri, 20 Feb 2026 21:47:07 +0000
Received: by outflank-mailman (input) for mailman id 1237610;
 Fri, 20 Feb 2026 21:47:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2tad=AY=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vtYL4-0008IG-Si
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 21:47:06 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b20f812e-0ea5-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 22:47:04 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4833115090dso23877675e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 13:47:04 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a8df83bcsm28940205e9.13.2026.02.20.13.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 13:47:03 -0800 (PST)
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
X-Inumbo-ID: b20f812e-0ea5-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1771624023; x=1772228823; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnaGS3zzuYsqMjk2MsjJw1YBBqsXTM67p067A0SdSPM=;
        b=RnV7e929jDxnjFS6JQ1PaZUmscQO56lX1vX8mSew/OL7dfQNIdUGs02ZTmWFgLS/0T
         VoJDmJejvbzmTq6eXKP6KVm9l1Npg8Dm0B2t59xY4ZsCctucIwX0QvYbPbeZizUJi54T
         o4feGno69YrXtOUygsi7AUFFvkflZ97rRa/e8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771624023; x=1772228823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dnaGS3zzuYsqMjk2MsjJw1YBBqsXTM67p067A0SdSPM=;
        b=K2Gd4ORZZz3GFRVt/pXGy8c9FaE2rIXRMeloFhhCvJxkxwy9PGdZB8BQpL2A575Egs
         mvEmVP8r7sl5q39qzrs7qPfMwuLylnhZNUwveQIxFiPZRSOvHWtxf0GPfodT8JRKzfjo
         mQYP3dh1A1A+EEIR7enApPbdQZOGZHQvOpUVeTo1wKqhjS2mWloA2YTp5BnajCPAxWi5
         oOGOTBzjyP+8iyFqkxJ/DSDfc6FOOx96iVgVRcc1KULY2qOx49+j38Ee9baVK0zRT/Fb
         /nQDWd61jSeyEijwEUKdKwubzYibX26gxuCQDA5uqrJPFOQUTBEqavsY4VlcFIyVKYsb
         zZ9A==
X-Gm-Message-State: AOJu0YxX0AqGxbKJ4V9jFxEdOn2rr9YkjbskbYYAENqaQm1H6uICAJWW
	xrC9xmZtjFe32QabGx7au1AdDsP/lrDn4CVS5C55k9fAQiwecJDwnDD25vPb7qR0KmisYICzIiT
	pHHkBO9P5jg==
X-Gm-Gg: AZuq6aK/6IG9NRGuqysHDcmBKOoI/a4hvFp6UALIzcpRbhddizb/wkQy4bIvte1qiR6
	s6BQ+3PEnUVeDvkd5Sk3l5SBP20ORuvXcZnClfg11A5+yZoDO10E+QrzQLHEGozzhldOfQdnr2K
	XeXF/PCBAQohvRwSAyRYIew4LlV6MPypVhCm5HvW210joQdislBLEWj6FzifapCMt1m8S4/v/iZ
	XfdhowkfNo72Dki4+PMfl0DNANYsuIukvzB9noVWKWF2S27G+MUoSIpYBKfgbr4DqsDPAXDw2at
	ULwIoEFDRT8NBmNtWzdxg9jCJIEzzYsxczHUmnX8W08Ofq4lies2ulzd0iTLPgwCtLLMhXPg0bF
	6EdCZ/k0sHPdTXvO23RMn2SmtzAI38LgCzvvTj+j2dKsZBotqrPmjqz5Wt/UyJQepLJKK5zcy87
	v/d/5QH/eUn6e8R/Q1F7wo+iIyLc7AXcGjFGFFjMSyaoKRTgrCdUmTGaqgN9DQ/CFJCQhqlvm2z
	uMnsIXJmA==
X-Received: by 2002:a05:600c:6291:b0:477:8985:4036 with SMTP id 5b1f17b1804b1-483a95b5a7dmr15500545e9.1.1771624023312;
        Fri, 20 Feb 2026 13:47:03 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 01/12] arm: Use __func__ in acpi_boot_table_init()
Date: Fri, 20 Feb 2026 21:46:42 +0000
Message-Id: <20260220214653.3497384-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D3F5016B0A0
X-Rspamd-Action: no action

Elcair rejects __FUNCTION__ as nonstandard syntax and a R1.1 violation.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/arm/acpi/boot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/acpi/boot.c b/xen/arch/arm/acpi/boot.c
index db5085e15d84..4ac0fd8f51e8 100644
--- a/xen/arch/arm/acpi/boot.c
+++ b/xen/arch/arm/acpi/boot.c
@@ -264,14 +264,14 @@ int __init acpi_boot_table_init(void)
     if ( error )
     {
         printk("%s: Unable to initialize table parser (%d)\n",
-               __FUNCTION__, error);
+               __func__, error);
         goto disable;
     }
 
     error = acpi_table_parse(ACPI_SIG_FADT, acpi_parse_fadt);
     if ( error )
     {
-        printk("%s: FADT not found (%d)\n", __FUNCTION__, error);
+        printk("%s: FADT not found (%d)\n", __func__, error);
         goto disable;
     }
 
-- 
2.39.5


