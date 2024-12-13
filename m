Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDE79F15D4
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 20:31:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857149.1269577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMBNE-0002wq-7m; Fri, 13 Dec 2024 19:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857149.1269577; Fri, 13 Dec 2024 19:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMBNE-0002uz-4g; Fri, 13 Dec 2024 19:30:52 +0000
Received: by outflank-mailman (input) for mailman id 857149;
 Fri, 13 Dec 2024 19:30:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I5eD=TG=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tMBNC-0002uA-HY
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 19:30:50 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1e559a7-b988-11ef-a0d6-8be0dac302b0;
 Fri, 13 Dec 2024 20:30:49 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5401be44b58so2133033e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 11:30:49 -0800 (PST)
Received: from stoup.. ([91.209.212.67]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c01051sm6972e87.156.2024.12.13.11.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 11:30:48 -0800 (PST)
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
X-Inumbo-ID: c1e559a7-b988-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734118249; x=1734723049; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5t5Kfg88Idn9A8sdeK/3C+aA4Q4/f69T01+9FYpo+k=;
        b=dV0MQvqM07waF9qRZdtPAk2OkKBlQl6sfLWkrLfmYsMtdUHriL5r+bPTWDAnEqESAc
         vvPPMyEmJ8I2imbb6bFkovdiEhq2uc9GGjo/TW7HdCpmFWo7FdaXyrNbiX661c9BgF0Z
         P0MnMrhQu3z6I+WaIgpbPvB/9g3mNmB5VyzOCmA+pSLCGcVgzz63oRvhtxYrBFugYF/0
         uEyv/owZvMmze8UC1b4Uj68uI4X0CrIivLp9oaBoBOOmv/IP/blBUl7ZUtHl/gixA7ss
         y/ekH5+jef74IJu4GVt5DJumeXpfq0v0F9BufnvTrMqbvY/0QyJoSYGTbMW47rPDeiw+
         cmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734118249; x=1734723049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5t5Kfg88Idn9A8sdeK/3C+aA4Q4/f69T01+9FYpo+k=;
        b=OD+o1ahs1Boucl6jUsV+lFPhBtbDlpL6oD9OkoVBtZ7HVp+rOWqxKTyZDRLrQmWy30
         0wCYlnvXggP/toFCWuuwQ9OFr77WEoIyzHf0a0W3OKIg4m6fGbDQOSqep0dKzpYVf+mU
         oEpJRaxsOlex+koc+B23Ny9YAOIzX5xS2E3n93VqNtQa2HUMe7oAo9XKF/qMgT9ACMEY
         BJEqSpMa4BD3GzfHqvjvzy/MC9u3RWC/KF5+4rqpjr9g/7vzRWtZWYQfd4rhOFBAbc50
         OdkLdevASleDLY0KViJka9dsm8O4b/YeUphfdYpebLhkt4DQYGiwXysXc9TAkGgWoYBy
         OT4A==
X-Forwarded-Encrypted: i=1; AJvYcCWGh7ni0Z3MMevRZ+h/BiU2/0MNRBRa+fFOQu42sMAezL0EYhJ8p2W1RTokyuuYhq3vthRKqLLcGdE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCUNEuNoeolrYFZrkQj54VXkWkNtoWG8SLBOwuz9JuJINHb3IM
	2hgUbWI969tKXnX+Usvk435WHtR8D7FLEoDUV5Fu37zyOHXKAXmf1kSDKeETj+K74j7khnRsBIt
	Wk0A/iIpT
X-Gm-Gg: ASbGncvBNxCqaXCVbGG6is/mVjMr2Hedf1ikBCefgWbAV+fn/8kNCjiqWqILMuzttgU
	OpI63Y3Ir77QeEwuBvEIkeRzYPSUhSxePWCd6YTkIUb3Sfc06UNJlwjNRevtTtYFANpJ2WnQuS2
	szyHxuJWqqDG22LwamjxrPQkVCtY5yjiofotfKY4VMaeMd0eNfVe5k23RT/f2nY2Y+QVHv6AygB
	rINv5GvK8EonMs1GYSCDxbJUHElLZXi7KrCGUCFFjHs+xfNRo9ess2a1JgUJg==
X-Google-Smtp-Source: AGHT+IEVWn8s5zP1MGFumvUQTEQ3ffwofWS3mvrYSU47wD3xL4Ll8IZLZ5/xOoizBV+DtpEb6Tf3yA==
X-Received: by 2002:a05:6512:104d:b0:540:206b:c358 with SMTP id 2adb3069b0e04-5409055826bmr965522e87.20.1734118248733;
        Fri, 13 Dec 2024 11:30:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH 69/71] hw/xen: Use DEFINE_PROP_END_OF_LIST in xen_sysdev_properties
Date: Fri, 13 Dec 2024 13:30:03 -0600
Message-ID: <20241213193004.2515684-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213193004.2515684-1-richard.henderson@linaro.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
 <20241213193004.2515684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/xen/xen-legacy-backend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index b15393e934..f6ad58fe13 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -675,7 +675,7 @@ static const TypeInfo xensysbus_info = {
 };
 
 static const Property xen_sysdev_properties[] = {
-    {/* end of property list */},
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void xen_sysdev_class_init(ObjectClass *klass, void *data)
-- 
2.43.0


