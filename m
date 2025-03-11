Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5295A5D023
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 20:58:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908981.1316081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5kE-0000fn-Bh; Tue, 11 Mar 2025 19:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908981.1316081; Tue, 11 Mar 2025 19:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5kE-0000bA-1c; Tue, 11 Mar 2025 19:58:30 +0000
Received: by outflank-mailman (input) for mailman id 908981;
 Tue, 11 Mar 2025 19:58:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts5kC-0007Uu-Jb
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:58:28 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f22a42b-feb3-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 20:58:22 +0100 (CET)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-22438c356c8so78188185ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 12:58:22 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:20 -0700 (PDT)
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
X-Inumbo-ID: 2f22a42b-feb3-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741723101; x=1742327901; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8l5XLcA1+OCzVWAzWmOGo6RbdXUAYo+RpTNM4YWpKg=;
        b=KmXXheOrzCa5dem65+UrsjR+5EWcf1k2dHYaaChtVN1JW2yLb29+KmXIxtoLZWPlW0
         UBzETkJpBYm5YljUkENWuFMVGJO2cyXt3LSgEg7n1GyxG8XH9ei5zUuw6MF6PRL6PIgK
         fmUip/MD6D8v3ah8yRDu5cpvdirJsClihMtER5hTFQgNwdzvNLK7PaFD4QwSeFRI2w5c
         1OlkSO3aYqRjIfZoWpelrtgcZogVk2/4jg33uaDTt3ugzIcTXjIJyOyxT/adwuvuuG9n
         Aeg7YEek1eelCRDak1kFAlMcfMcNZGutfhm9FZBnqcukwhruLyMldBzSlqb8gT72OkmH
         jFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723101; x=1742327901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8l5XLcA1+OCzVWAzWmOGo6RbdXUAYo+RpTNM4YWpKg=;
        b=UBuEbX9JETQMxLOnknpAXQ+cdScLVblmDhEuR5QY8NZhwQZiLh8xpVXCQ9/ofYv+a6
         +Sb3HpwhtRm5KpXVfATnVPatE8HEY5frILPHHyHHosFTHx0tdZIc5DGrvi//saytGr2/
         VtLp3NVh8yzLWXn1QFaUeAPtki3rlJCPQXphFLICVzMjyxuKl9SW7MdJ8DIXSvI6Dh9m
         3kesDf+JdvWuQ/2VCXTWtIy7p1tH39sApLgRqaVMZ/OoO2H5zj+TRsBWPPiSpue08Jaq
         unw6BjzhK28nCrpV2OhTL+PG+HLk//kCM5m/xqgmeX04bjlZkGpuL/FQKstPhDUr1yWh
         +mrw==
X-Forwarded-Encrypted: i=1; AJvYcCWNMfTj42z00kxSdhXJIyixcuZBMCTEjVfwdXzPAVFVVuKgxcDiChq4F7jolnGr7EzxEgq7ao2gcA4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8Kejjcx1D3LmH867epjLa+kdza1myut/N1XOcovIAokUriaz4
	vEBuybeTtVQeKVRPhWvkeNhWmyb6AvOtVN6w1ligkhcZ8Gnc1ohvaRoe6gNBJBw=
X-Gm-Gg: ASbGncsG57Bn4X4lUTtuwHWY5zhQk0Gh+G4w/8P4HcV5ZK348Uyo53vFYyaAtVMKbcy
	cvo4dmUzzBlZOeqbhZKgzVfiVyRGfyysbRZm4S12aOikNllEm/Tptlx/zj2EYYPmqvkg+vZUEl4
	i5AsWy+KMR9sSmCOUDjMvCJCKPVBVWorfVEI/Dw2eIV2RCf1lmWA9DOxJ1b9QlAVG6AWQh6UGuw
	inDhfK5sW7no9pnXho5CjUG2lnHO00IGIeHClBQhOel/HyBTNXXcv8w/etIxv9Q+VHAsK8D+xL5
	KhzFKhwtMyX43ltzrb2N19Ym3VBVf2m+rn5W5PvS9XHk
X-Google-Smtp-Source: AGHT+IEgYvc9dMvCeCMS1wOBfk7GI8sssnnWj2guiDlIPD98ekjEveZX8r3rPhR4gVsvHIzZwJ8+qw==
X-Received: by 2002:a17:903:1a05:b0:224:1294:1d26 with SMTP id d9443c01a7336-2242888bf0fmr253744785ad.13.1741723100980;
        Tue, 11 Mar 2025 12:58:20 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	manos.pitsidianakis@linaro.org,
	Peter Xu <peterx@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	alex.bennee@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 09/17] exec/ram_addr: remove dependency on cpu.h
Date: Tue, 11 Mar 2025 12:57:55 -0700
Message-Id: <20250311195803.4115788-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Needed so compilation units including it can be common.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/ram_addr.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 3d8df4edf15..7c011fadd11 100644
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


