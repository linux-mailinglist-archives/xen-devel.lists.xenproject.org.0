Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E52A5B7C1
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 05:09:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907023.1314372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvb-0002In-8v; Tue, 11 Mar 2025 04:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907023.1314372; Tue, 11 Mar 2025 04:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvb-0002FY-39; Tue, 11 Mar 2025 04:09:15 +0000
Received: by outflank-mailman (input) for mailman id 907023;
 Tue, 11 Mar 2025 04:09:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trqvZ-0000fJ-7e
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 04:09:13 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 955f930e-fe2e-11ef-9ab8-95dc52dad729;
 Tue, 11 Mar 2025 05:09:10 +0100 (CET)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-22337bc9ac3so94536975ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 21:09:10 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:09:09 -0700 (PDT)
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
X-Inumbo-ID: 955f930e-fe2e-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741666149; x=1742270949; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9PU2mUUZXceFgFF8NURkIZqXSTxuLUTW3yG3F37dHQ=;
        b=IOG2QTMNqRWn+Ud6DGiA4tXppTa8kXM9y4VunJCbsvr+cRxUZFZ69Oeq4G6D3LhLjS
         ncT3+UlpEutjah1xojH8e7LkRzQVDqdQLtewHaUYEooLeZ9axwi2mfvnmaz/qNnELi2I
         IneJ1wEwNOnZhDv5bSIVuo/dPbLQixTaZXYbQsBTObP+1PvxM9QkcMGRF03wSlydL43j
         N492cDMHjURn+GhQyzGbifXhTdffzABX+7UjnUh9GNhRst7Gb2E4mkLQhyM9ikQgrIZ8
         Rf0is/kxWCjTp663UQq2lno3u+ZKPXWx19I26JoXKyGMnA0mRVHqmnxgjgh93hS9r7h5
         k7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741666149; x=1742270949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9PU2mUUZXceFgFF8NURkIZqXSTxuLUTW3yG3F37dHQ=;
        b=i40w/IeZqKGOrukreyCi13kqnZj3ha1QZMxWKdUIa6++ZWcMLLNQAMXstw0T0e2bNk
         B1L+u6Ip4WLbg7m+5VfhU85nxK0hqQYgar3MBol8h5PdkBWG0GjwK2cWGlvbqoFsvs+M
         qFDZcei9VpIj8L/CXt5blAVhd1vZVJmfwJgH4qlWBox7VYdkE0ZZApocAWYvyYdffo0U
         AjpdwePP9TAQhKI3FBnUEgydgbTMSnNRuOMV6p7/2kI1ZY1PJywfUWu41sWu4HpShuTu
         Q0uO2jyDaRh68apzu7Nru97eFgK+wuU+v/10f5FphhUe+3T+8CEE05ynKN9l3xlyDHpv
         Cwgg==
X-Forwarded-Encrypted: i=1; AJvYcCUv+oT7p15F/Kj3wa27TDUN5JV1FP4i22CUCYsir+fu5XpckWOAvc3qeGwGQ+dqG7xgMm8ZSO87NGA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4uvzxvZCNA1Q7e8svYxPqppxApsl2atbSYzIFb0msvY/705cF
	yMPwfRG2FDCzXwZYy5VLxufOZ0mCN4w+pxjf7hD/msd32UG+ACbr1quPS/6Wfv0=
X-Gm-Gg: ASbGnctWBIfApktvPXJGtqzBOVReNRTIGRP4s3r8VR5+NubxPbx35d0R4LtBUob8hoZ
	trwSRE4ICZf4TDZ6m3kbujFKLkMYTv87COebe4xlst0UF8eaQeg3fdcUcFvVjO9zve31fD0Y4lh
	HgIj6KCYIHZpAh9taUjaWkO9+CYzlIhekrflS8DK3enyDbFbQ7QARh82akdSMMvqTzbo3vJyVeS
	JYTSaFtUmiVye+Ikom+xL9QfrMP0xxHaKUL8FD9nC7myBXHrB7sR4W96TZYnfUl9KXlgiVGoL2E
	58G2HUFeLzhDCJT3i49VEuOmjd19CziaR7jb3Q7QuUgFZY+wn/XT2nw=
X-Google-Smtp-Source: AGHT+IFhjhUd2vTxqYR3Z5nzc5K52WwhbsgB0wgjWXiu+XeofP+aLrA4dkvuyGbgnmdnOjVQzIEANg==
X-Received: by 2002:a05:6a20:160c:b0:1f5:75a9:5257 with SMTP id adf61e73a8af0-1f58cb1ba63mr3462589637.13.1741666149439;
        Mon, 10 Mar 2025 21:09:09 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 11/16] exec/ram_addr: call xen_hvm_modified_memory only if xen is enabled
Date: Mon, 10 Mar 2025 21:08:33 -0700
Message-Id: <20250311040838.3937136-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/ram_addr.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 7c011fadd11..098fccb5835 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -342,7 +342,9 @@ static inline void cpu_physical_memory_set_dirty_range(ram_addr_t start,
         }
     }
 
-    xen_hvm_modified_memory(start, length);
+    if (xen_enabled()) {
+        xen_hvm_modified_memory(start, length);
+    }
 }
 
 #if !defined(_WIN32)
@@ -418,7 +420,9 @@ uint64_t cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
             }
         }
 
-        xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
+        if (xen_enabled()) {
+            xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
+        }
     } else {
         uint8_t clients = tcg_enabled() ? DIRTY_CLIENTS_ALL : DIRTY_CLIENTS_NOCODE;
 
-- 
2.39.5


