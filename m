Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2EE9BCF7F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 15:34:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830258.1245214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Kd1-0002iS-14; Tue, 05 Nov 2024 14:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830258.1245214; Tue, 05 Nov 2024 14:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Kd0-0002eV-To; Tue, 05 Nov 2024 14:33:54 +0000
Received: by outflank-mailman (input) for mailman id 830258;
 Tue, 05 Nov 2024 14:33:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SSsw=SA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t8Kcz-0002Lm-KR
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 14:33:53 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8fc86c5-9b82-11ef-99a3-01e77a169b0f;
 Tue, 05 Nov 2024 15:33:49 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c937b5169cso600769a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 06:33:49 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a99ff2sm1395047a12.4.2024.11.05.06.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 06:33:48 -0800 (PST)
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
X-Inumbo-ID: f8fc86c5-9b82-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MjkiLCJoZWxvIjoibWFpbC1lZDEteDUyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY4ZmM4NmM1LTliODItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODE3MjI5LjkxNDQ3MSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730817229; x=1731422029; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lm70mwHIeRKoNhCCFejzjDU9gu+VjbCXPS3BQfLbce0=;
        b=Jbq9NOlxXEKCEAVMutHvn3NY6gBcL3xu8E0LACqzgbFFn7NJ6XQJwmmS/Wc2UEG5Q2
         XqoNUPVGHZ8LNnwA39RKjnXJheVvKMmpy3WZBHoR6W0juYBWV2HHMIRI0FRmK4Ld1jIu
         kuDd87x620yko9ktevApdRkVk2S9y18QyHzew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817229; x=1731422029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lm70mwHIeRKoNhCCFejzjDU9gu+VjbCXPS3BQfLbce0=;
        b=OZcdzPBYWWNblG8dBSaBhSnMbR8qBqD9UklS1N/sZoAJ22qyK3vpzOjB+fiSMQ4d+l
         DBvvfm0z5QWtRJtQLHnO6tCZ6Nn4IjsW9LgQClMu0wUbnijQBlFcXorYN/4suo1Xeh/J
         p64rv9ekxPU5f4T16aar+8DdpQyCU8f7xh6x7KkupzwdmK/qDlKDxFm2xq/+2mKgXnOq
         mMIe7EQMUMu/cveQx1faV33Rfc4O4I2pS55tZYF7xrrgatPuLbiS0vWm6f38hRX3rXUW
         tZDSRz5PrTqPiQr5BlBr+RR+FsDC5aAnFobQ6043/FBEbG6y4cYLWYDfOtIXutI+O39b
         sudQ==
X-Gm-Message-State: AOJu0Yx4cWR4QdHhqN7eJ5nYIj5rPWDPfGQwpyOCv7YmfxFW73b/3GrX
	PWcZ/ffbkEwjt68MN9iIe/UhIfKDGpGG8MDI+TYId/a26vPVhz/6LPuc6zQMqOSs1/BzSq+IMKu
	6
X-Google-Smtp-Source: AGHT+IEhWx2RuS/BYIBWDBc6maT4rwV0tb/DwlYlZRoeFkV4ZYnjAKsX+HD1obBYMGsMYslSbg1VMw==
X-Received: by 2002:a05:6402:2748:b0:5ce:c7ce:145e with SMTP id 4fb4d7f45d1cf-5cec7ce17ccmr12100578a12.14.1730817228923;
        Tue, 05 Nov 2024 06:33:48 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 01/13] x86/xstate: Remove stale assertions in fpu_x{rstor,save}()
Date: Tue,  5 Nov 2024 14:32:58 +0000
Message-ID: <20241105143310.28301-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After edb48e76458b("x86/fpu: Combine fpu_ctxt and xsave_area in arch_vcpu"),
v->arch.xsave_area is always present and we can just remove these asserts.

Fixes: edb48e76458b("x86/fpu: Combine fpu_ctxt and xsave_area in arch_vcpu")
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * Remove asserts rather than refactor them.
  * Trimmed and adjusted commit message
---
 xen/arch/x86/i387.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 83f9b2502bff..3add0025e495 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -24,7 +24,6 @@ static inline void fpu_xrstor(struct vcpu *v, uint64_t mask)
 {
     bool ok;
 
-    ASSERT(v->arch.xsave_area);
     /*
      * XCR0 normally represents what guest OS set. In case of Xen itself,
      * we set the accumulated feature mask before doing save/restore.
@@ -136,7 +135,6 @@ static inline void fpu_xsave(struct vcpu *v)
     uint64_t mask = vcpu_xsave_mask(v);
 
     ASSERT(mask);
-    ASSERT(v->arch.xsave_area);
     /*
      * XCR0 normally represents what guest OS set. In case of Xen itself,
      * we set the accumulated feature mask before doing save/restore.
-- 
2.47.0


