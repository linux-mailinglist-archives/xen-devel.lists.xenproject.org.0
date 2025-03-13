Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B6FA5FC00
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:39:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912891.1319136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslag-0002jl-3C; Thu, 13 Mar 2025 16:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912891.1319136; Thu, 13 Mar 2025 16:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslaf-0002ga-S8; Thu, 13 Mar 2025 16:39:25 +0000
Received: by outflank-mailman (input) for mailman id 912891;
 Thu, 13 Mar 2025 16:39:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNRr=WA=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tslad-0000Wy-Mr
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:39:23 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b79c68c3-0029-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 17:39:23 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-22403cbb47fso24466805ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:39:23 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:21 -0700 (PDT)
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
X-Inumbo-ID: b79c68c3-0029-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741883962; x=1742488762; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfpTTedni4gUGfvRcfnvXw4xTvY7JO0pNjOjXTZ7pI8=;
        b=N7Vz3wtDBFf9og8nbz4E72dEd+3aKdWpFWBJmjmv4GguFCoskQEMwRMmLCKYhxLElS
         i5dCW6zqePq4ASa+TDmIcL1oDENfVC1z+lgQoMvFqWg06JArUYMnYtNPuBYQikrxAdab
         3b9W4fbdO11fGEZNUKduNFRgJaFOhM7mjIX/M6BSLuZrmgZRleBBOIKHjnK0S9WVkvBO
         vL6+vD3qClx7iUkaIkNfznGgGCdBTJSvpbXd0vr0bEoXY0vwBEGTgF1kD+gVfxHIbXLH
         MTdzPyfBg2PpD9yWgrkFTbH//SYuuNwnxP/J6luYHCFPpgSvqoHClI0daFjDiugR2s0I
         6UCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883962; x=1742488762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PfpTTedni4gUGfvRcfnvXw4xTvY7JO0pNjOjXTZ7pI8=;
        b=JhWYRv/ZGPlZF/X4uIuPoquLEwHrex9bqScaG1CoSS8CWfIaCDWC0tx6e/46vDBETI
         HWH0bkaJbU30+Ug2X424/oRQy3v3aC6/A9AEizTywdn7EKAD5naNbj6XB5SediqbMO+a
         04yeu1odbhhZ89zrYAjQhNhwz2kUGI35sYQbCYzFxZhu2g9eaoUiTJsBwrn16855rLiT
         BtBVm5F+1xbfrSVn0DRhPGxFwUH6tjjEixljdBtMp4X3iTzCQFrtaoPpxClBdOGTG+sV
         Qn+HOCjQDWMiGiseIqKRvdoKUKFciH1SDewiwNXEXSGGKcw+LNFrsXf/wQ0PC1srnz/Y
         f8BA==
X-Forwarded-Encrypted: i=1; AJvYcCUaYGRodJvsgJ0By74bp/0UwviGX07ay77Af8qWmxja59QDhV5pOSWByDhRLnjCvanrquM3ILU5UY0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFFGnsZCFvmMlrIAchdCOw2wZW56qP5z4tS9l2oQRpckGlDUcU
	U7o6daCQ6qZaEfg9d5fbHzHjlBUK3KVKIrIuwbkp0tUtIbj2wHBWPg/WZWVH4KY=
X-Gm-Gg: ASbGnct9bM7mmpr0Gfs1pzyLno5LSxKNKaE1voaVRwjrqX3VJ8NUZ/w9DNykDzgMXDD
	jDzUbrOgkZBUjn5XTv5c0rNA71Ke2Or0pvWlaT0dXY+IPcqjDKpOShXyr+DdDD0GoXus0Y1lvN9
	M7ViKCaRqpSRSen7uIMePVb0TLJzNzsAqimZTdl9Ggy8WOeep/quHOc28GJzJOy92vWiDSJ/k+J
	rPeb/G2VuERpjMZqj3buRyuka8SACXQEiCcxvzGL5Pxv1muf18PtF6xKYJTiydo/UY0DarWyH41
	VwEy74t61mjly50kTUsgxJDVYCInyLmsHNPQP83clxVh
X-Google-Smtp-Source: AGHT+IGoee0FqI1pRrQ30nb92L6Ez6iWr624Iw9VfJKN6XKShQ8vco+xd3ltWnO1olhH1gK/7mxIvg==
X-Received: by 2002:a17:90b:3ccf:b0:2fe:a545:4c84 with SMTP id 98e67ed59e1d1-3014e8bff05mr210801a91.34.1741883961740;
        Thu, 13 Mar 2025 09:39:21 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Peter Xu <peterx@redhat.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-riscv@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 09/17] exec/ram_addr: remove dependency on cpu.h
Date: Thu, 13 Mar 2025 09:38:55 -0700
Message-Id: <20250313163903.1738581-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Needed so compilation units including it can be common.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/ram_addr.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index e4c28fbec9b..f5d574261a3 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -20,13 +20,14 @@
 #define RAM_ADDR_H
 
 #ifndef CONFIG_USER_ONLY
-#include "cpu.h"
 #include "system/xen.h"
 #include "system/tcg.h"
 #include "exec/cputlb.h"
 #include "exec/ramlist.h"
 #include "exec/ramblock.h"
 #include "exec/exec-all.h"
+#include "exec/memory.h"
+#include "exec/target_page.h"
 #include "qemu/rcu.h"
 
 #include "exec/hwaddr.h"
-- 
2.39.5


