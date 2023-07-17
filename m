Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C00897568A3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 18:03:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564730.882406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQh6-0002v6-G9; Mon, 17 Jul 2023 16:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564730.882406; Mon, 17 Jul 2023 16:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQh6-0002tD-CE; Mon, 17 Jul 2023 16:03:28 +0000
Received: by outflank-mailman (input) for mailman id 564730;
 Mon, 17 Jul 2023 16:03:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fcy7=DD=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qLQh4-00027B-4J
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 16:03:26 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75277e3a-24bb-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 18:03:23 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51e619bcbf9so6491891a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 09:03:23 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 bo28-20020a0564020b3c00b0051df5bd1cd8sm10099050edb.65.2023.07.17.09.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 09:03:23 -0700 (PDT)
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
X-Inumbo-ID: 75277e3a-24bb-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1689609803; x=1692201803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1Ds6GpX99KKIP7Xn+WLKam0uM2qlDi/O2AccjIBDFI=;
        b=kzQU5pUvrMIxMWwKhNFFloQfT3Fid9QUqdqwmdmy2o74vkeIaW9smWYYfEV9sACSS6
         NZhlaU8DWiYfNw6psxWBx/XqBRkzYy7pKoWsYLbmA6N6hISS+k/vuUicJ4saBmwQ4ECx
         4pCcUVmbDIGfqVSAJ4cSxxzuJ/IjuvshhA9vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689609803; x=1692201803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1Ds6GpX99KKIP7Xn+WLKam0uM2qlDi/O2AccjIBDFI=;
        b=BN4z2FxhydydOExwPeTorzEj2veQK+Hb0Q6deiW217Shyd6ofDw1sbeMHPyGBp1JO2
         i4B+HS/fFmaMC1m9UzEjSgF+a8ryavhDw0foc7+gO8eZB/ujpYEVbJ4Ao6854hgEDOlz
         Wqi+1HsMwg4/JmcJ9oZDFtMMXNYwJR/skZWQY45OkQnFFh6cdMhez2BF06x8mW0m8Nt3
         J2hkZnX7DZVN2Gdv3kEVGTUlM43tW4u7GZV3LVBWHevfPd83VWCKJQvnv0lzHkmHImEG
         nhn2gFa5S2mwkFFYUh6bYeAiAIGOjd3lf8IgRLw6AnNREq0Al+PXOkE5Qnx7LlOfR5Fi
         1kvQ==
X-Gm-Message-State: ABy/qLaJ2rRS5ewuPJmXG8FU1PBNtdMxvB4RFHQqkld+obL7rKoE8K8R
	O7RWT3JCWxcLOuNlYYhHS4dmi1KItgbRSKnxAWg=
X-Google-Smtp-Source: APBJJlGXMxR+Y48i+AvaPfZNSSbKNoQ9OV+wgR9SMk5t9XhKnZ+4VMKWcARiO9Bct80MeXVomlzdgw==
X-Received: by 2002:aa7:d5ca:0:b0:51d:a181:d78e with SMTP id d10-20020aa7d5ca000000b0051da181d78emr10646412eds.27.1689609803427;
        Mon, 17 Jul 2023 09:03:23 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/8] pdx: Mark pdx hole description globals readonly after boot
Date: Mon, 17 Jul 2023 17:03:13 +0100
Message-Id: <20230717160318.2113-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They define where the compressible area of valid mfns is, and all of them
are populated on boot (with the exception of max_pdx, that's updated on
memory hotplug).

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/common/pdx.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index ec64d3d2ef..99d4a90a50 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -47,30 +47,33 @@
  * ones.
  */
 
-/** Maximum (non-inclusive) usable pdx */
+/**
+ * Maximum (non-inclusive) usable pdx. Must be
+ * modifiable after init due to memory hotplug
+ */
 unsigned long __read_mostly max_pdx;
 
 /** Mask for the lower non-compressible bits of an mfn */
-unsigned long __read_mostly pfn_pdx_bottom_mask = ~0UL;
+unsigned long __ro_after_init pfn_pdx_bottom_mask = ~0UL;
 
 /** Mask for the lower non-compressible bits of an maddr or vaddr */
-unsigned long __read_mostly ma_va_bottom_mask = ~0UL;
+unsigned long __ro_after_init ma_va_bottom_mask = ~0UL;
 
 /** Mask for the higher non-compressible bits of an mfn */
-unsigned long __read_mostly pfn_top_mask = 0;
+unsigned long __ro_after_init pfn_top_mask = 0;
 
 /** Mask for the higher non-compressible bits of an maddr or vaddr */
-unsigned long __read_mostly ma_top_mask = 0;
+unsigned long __ro_after_init ma_top_mask = 0;
 
 /**
  * Mask for a pdx compression bit slice.
  *
  *  Invariant: valid(mfn) implies (mfn & pfn_hole_mask) == 0
  */
-unsigned long __read_mostly pfn_hole_mask = 0;
+unsigned long __ro_after_init pfn_hole_mask = 0;
 
 /** Number of bits of the "compressible" bit slice of an mfn */
-unsigned int __read_mostly pfn_pdx_hole_shift = 0;
+unsigned int __ro_after_init pfn_pdx_hole_shift = 0;
 
 unsigned long __read_mostly pdx_group_valid[BITS_TO_LONGS(
     (FRAMETABLE_NR + PDX_GROUP_COUNT - 1) / PDX_GROUP_COUNT)] = { [0] = 1 };
-- 
2.34.1


