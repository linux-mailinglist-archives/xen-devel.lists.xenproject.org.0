Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD1698439A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 12:28:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802569.1212884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st2mX-000863-Hh; Tue, 24 Sep 2024 10:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802569.1212884; Tue, 24 Sep 2024 10:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st2mX-00084D-BQ; Tue, 24 Sep 2024 10:28:33 +0000
Received: by outflank-mailman (input) for mailman id 802569;
 Tue, 24 Sep 2024 10:28:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CoXS=QW=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1st2mV-0007HA-JV
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 10:28:31 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bec75561-7a5f-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 12:28:31 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c241feb80dso12212727a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 03:28:31 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4c5081sm591002a12.64.2024.09.24.03.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 03:28:30 -0700 (PDT)
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
X-Inumbo-ID: bec75561-7a5f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727173710; x=1727778510; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76bJmVRgoyuRftic5KQh8KmD08jovx2iL9DhRm4U/lo=;
        b=dcS17HSmSSHaQp7d/vPC3ESRDthrM89kU7XAmH6pZX3/6yJ1r//7q4YiTV1Duz9YXc
         KYX9VLq3RvlrtJaYXZq7dtBFBO5HEO9t6sRTTuqi3nDsnRLA8w7bZ05k9kMqN8nnFTU9
         2KGiPCbA6bdUTVl7g+gPxZ/s8Vx0NuJP1n9zU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727173710; x=1727778510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76bJmVRgoyuRftic5KQh8KmD08jovx2iL9DhRm4U/lo=;
        b=BRI+fM4gINxNYT2/krlRdnvnj203XJ8B24OCZHzbJ+dXsXebSPczRuoIyHyzn4JdXa
         hFEXrMvUS3p3C7sICeH8d6I7cFKoO52UcI6slri4EIN4OVrOt2jpBuukEivHkeX23pLx
         q9cMReGs5n2qcIC9ci7vOjcDYBNU+9/va2RMyxAgIqtolBHvWRrJqoByoMXEsWi5H6p2
         zH2M+cMZaTpcNSAX3th0HEZPrUbXP+9F5qnl7ac7dE0mf+HXg5TVn33y2AQFf6UEu1im
         HK4QdcBqUfwZ09YRyDHN6SukOnIgeVFTSqbem+snHRPRQfZdOSF0YjN0hvrSeMrvVb1u
         z4Ww==
X-Gm-Message-State: AOJu0Yy6D3ZAOjORy4XOQxRMVNtgZSFIn3daBJhW9d89NRiQV66Ufsn+
	2ycxZ9D6KMjyO58027dydSI52L2d5PkBty1E7E2mPl1LvNavChzuGPnLsd4sIEQSmqKyIGs/ozR
	R
X-Google-Smtp-Source: AGHT+IGFUsA6ghCk+/qKN247j+pVPy3PCf6OmHjYBui4iTW/P8WTzdUvtXDt/Off1S8AhQrcBqk42Q==
X-Received: by 2002:a05:6402:380b:b0:5c4:178a:7162 with SMTP id 4fb4d7f45d1cf-5c5cdfd7cf2mr2396066a12.19.1727173710427;
        Tue, 24 Sep 2024 03:28:30 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 4/4] x86/boot: Improve MBI2 structure check
Date: Tue, 24 Sep 2024 11:28:11 +0100
Message-Id: <20240924102811.86884-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240924102811.86884-1-frediano.ziglio@cloud.com>
References: <20240924102811.86884-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tag structure should contain at least the tag header.
Entire tag structure must be contained inside MBI2 data.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/efi/parse-mbi2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/efi/parse-mbi2.c b/xen/arch/x86/efi/parse-mbi2.c
index 6038f35b16..7efda8fab2 100644
--- a/xen/arch/x86/efi/parse-mbi2.c
+++ b/xen/arch/x86/efi/parse-mbi2.c
@@ -22,6 +22,7 @@ efi_parse_mbi2(uint32_t magic, const multiboot2_fixed_t *mbi)
     EFI_HANDLE ImageHandle = NULL;
     EFI_SYSTEM_TABLE *SystemTable = NULL;
     const char *cmdline = NULL;
+    const void *const mbi_end = (const void *)mbi + mbi->total_size;
     bool have_bs = false;
 
     if ( magic != MULTIBOOT2_BOOTLOADER_MAGIC )
@@ -30,7 +31,9 @@ efi_parse_mbi2(uint32_t magic, const multiboot2_fixed_t *mbi)
     /* Skip Multiboot2 information fixed part. */
     tag = _p(ROUNDUP((unsigned long)(mbi + 1), MULTIBOOT2_TAG_ALIGN));
 
-    for ( ; (const void *)tag - (const void *)mbi < mbi->total_size
+    for ( ; (const void *)(tag + 1) <= mbi_end
+            && tag->size >= sizeof(*tag)
+            && (const void *)tag + tag->size <= mbi_end
             && tag->type != MULTIBOOT2_TAG_TYPE_END;
           tag = _p(ROUNDUP((unsigned long)((const void *)tag + tag->size),
                    MULTIBOOT2_TAG_ALIGN)) )
-- 
2.34.1


