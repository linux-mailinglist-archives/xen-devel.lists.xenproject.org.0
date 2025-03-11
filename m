Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4213CA5D01C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 20:58:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908969.1316030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5k7-0007Yh-2j; Tue, 11 Mar 2025 19:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908969.1316030; Tue, 11 Mar 2025 19:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5k6-0007Wh-Uz; Tue, 11 Mar 2025 19:58:22 +0000
Received: by outflank-mailman (input) for mailman id 908969;
 Tue, 11 Mar 2025 19:58:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts5k5-0007Uu-TP
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:58:21 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2dc86ca4-feb3-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 20:58:20 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-22113560c57so111409135ad.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 12:58:20 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:18 -0700 (PDT)
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
X-Inumbo-ID: 2dc86ca4-feb3-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741723099; x=1742327899; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYYGOsy+zcSjxVOnigwMonGaAhWbZB7W76ZyOX5Jlgc=;
        b=MrBjC14IbrRjXfyDaHlpQgUSOS+1ZWWkDsY7WQ6vPwqn6+/gZMK/fIaIBHu1LmOrz6
         vHd9uH33Jwrr+Q/d0AEQzRplk1PVAt7Da/M0OLeDMSMPb7lHtRA36uRL0dXYN/UsitJH
         nP0cDqp0w095eM+PB18C17FeQ+iFk2PuoV8S+sF//QqB+ewVp/dtfkTgrBM1aWBJ/5ti
         CEupD/zVfymVMx64xXrd778/XklLbUpwRMv0MwfVmcElIeolgOLUaZOE0CeYgrNDmPW/
         Cet3J5CWdgQjGU7XGMO4G5NZH6qPIkFv8UjNbbM5VCTExriLsfbmQFtVTAbUJ2/SGKwi
         OEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723099; x=1742327899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYYGOsy+zcSjxVOnigwMonGaAhWbZB7W76ZyOX5Jlgc=;
        b=b1oHNBINq7L7tPiDM3hJ2KL2hQZlvLdj9jagya42GsF0K0NjCPFpmAuoAiYHT8GcLI
         8rh7011KtpYOWe3J2qaCHZWB86Q4OKitNOWQCICESabJ5esQ5gq7n1sYWipXsuQYTkYy
         1iIcw7qKgAsVzqg7jR+Wt3bjmAK9lwX27JMdWCHkRKFynB9Nqh5mSjSqMGaOpxBbXhIl
         OMpw1qKhj7BzTTvbKgxfMclJsOzsw7FiGsSE6P3qDnJ883TA7O+zDFhWQZr3AAWX/chr
         Dhb+heVCK7Xa9XuEWIutexZOIJV8sODTfNPp1NQQOu4xmhxNBhPj3qI6IpKlj1E6ZDNv
         l4eA==
X-Forwarded-Encrypted: i=1; AJvYcCX5DjEuMjzFPfP4hrLcDuUI9mR+xsqXlypF5+Tb3CrYMDbVsU8uF+VwY8LwqTnE+fsVoCXVcVXSYTI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvFvWGh8JQStmYJLeC+d5/oLGj9OCYOmU3WKa5Z0O0ObhD2w0z
	0E13fp6ECZxxTfkUCL2KIb2mwtCLG6qz/lt417V85DW7A4PNCDFHG+WX8SXapcM=
X-Gm-Gg: ASbGncs7GWmpLf/nfnKBH1lBGogYqKs+BzgNyeY2e1r07Jxmy944TmsS7bslN6m/Dph
	SOAuvADDReWpyFPUoQP8ld25d/TBOTZRHjO4aR1ZQ6CKSDKB43lYjzJnHbGCM99WqUqLzpvJOr4
	TJb+UqDnLPqqYT4HywVQTvEROWSe9lFwC+JMFEH94/mb9H+hMVjm9kHruA3jRguYx+ywgijozoU
	PfeFPsd+0DMB53AmqE8lYSIQWvp8zvNZgQX1xxwdd6x6v0v058T2UvVXWCRyp3/kl4+BdKfTjQ2
	yQkcacZovQ/TE6CreZzedRKCt6o1aOHCQvPfLt2DqFpCHizizH6t41o=
X-Google-Smtp-Source: AGHT+IFbL/EikEqHmQH7/+hOB9jflYFjv2fXkewmYVpLTsSrUYTiBJ9zTgGhdqBywi26rV+yUM0nVQ==
X-Received: by 2002:a05:6a00:1708:b0:736:43d6:f008 with SMTP id d2e1a72fcca58-736aa9f0b0cmr27815913b3a.12.1741723098739;
        Tue, 11 Mar 2025 12:58:18 -0700 (PDT)
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
Subject: [PATCH v3 07/17] exec/exec-all: remove dependency on cpu.h
Date: Tue, 11 Mar 2025 12:57:53 -0700
Message-Id: <20250311195803.4115788-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previous commit changed files relying transitively on it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/exec-all.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index dd5c40f2233..19b0eda44a7 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -20,7 +20,6 @@
 #ifndef EXEC_ALL_H
 #define EXEC_ALL_H
 
-#include "cpu.h"
 #if defined(CONFIG_USER_ONLY)
 #include "exec/cpu_ldst.h"
 #endif
-- 
2.39.5


