Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9D99FFFB8
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 20:55:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864502.1275736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTRHp-0004Zq-VZ; Thu, 02 Jan 2025 19:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864502.1275736; Thu, 02 Jan 2025 19:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTRHp-0004XP-SS; Thu, 02 Jan 2025 19:55:17 +0000
Received: by outflank-mailman (input) for mailman id 864502;
 Thu, 02 Jan 2025 19:55:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xoa/=T2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tTRHo-0004XJ-My
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 19:55:16 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bfeb9d1-c943-11ef-a0dc-8be0dac302b0;
 Thu, 02 Jan 2025 20:55:15 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso70825855e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2025 11:55:15 -0800 (PST)
Received: from andrewcoop.lan ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43661218f43sm464573605e9.19.2025.01.02.11.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 11:55:13 -0800 (PST)
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
X-Inumbo-ID: 7bfeb9d1-c943-11ef-a0dc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1735847714; x=1736452514; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5n8WWdcErArPqimG8AinQbYQjSFsYmY7A9DbyTjRXI=;
        b=OEo5c32YEwIfbOexo+d5gAZlkjw99sjNw0yWX/83b2qojulpzJuD2cW0Zrxc3DJ+FP
         bCl8IDvuLouE+ZrOb5Zrg7wpIPmORhrgnHfZ7xMEY6DI7+3KSnLAVRdPvuR16fj0HaOA
         CGqraygo6Y1A62h0mLM091DttOYWoUkWdOsp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735847714; x=1736452514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5n8WWdcErArPqimG8AinQbYQjSFsYmY7A9DbyTjRXI=;
        b=YHDYUNJ+IIOnHKcqODUU09iQBYhdo6A7CCLkMB/gooPaIIZUQONGPFd4YzXt0H6ADx
         LLdj4bVGw9z5jssWfCJ1rPYdKs9Ut6XAdiDv0J+3bnJRMgNH8uCYu5+WhGgDduIiKEZW
         Wn2rWLSmQMjYG1SldA7FjiHCgVFoo6zwYTEdLigRQZ3uIQ/0s/rI+9oYKH/gnSUdIo7g
         uDOtIzNsf2g4uLm6JiDxFOS6WGI+mUZl4mMpPHNHGQe5mVSJeWUJ8cXc5zNtIwGni/zv
         LnDQO36h7DcH63erB24Sa0q6l5Ni2FlWAv/K+ub1IQ19RWvERzM7/OiVbCYVhqsJtqHZ
         JkVg==
X-Gm-Message-State: AOJu0Yxxae7GHJvLv9lggKI6fDXfAaSzo/CWoFGths6QXGPFP+13+ZYF
	AxHg92nmTl196QosbPN6sBgaLRVIIYyL6las4X3YHp8VLCqiS2mHt+YSiQEy9YCV7lun7iG5aYM
	cSvqLGQ==
X-Gm-Gg: ASbGncsiVcLtgrAQXE5dFkQDDTxcBGfAWSFYyxa4v5Ssp+IqfqY2gcaoZh5k7nVcdQX
	yEArbG8NkOnxnmWzNW6pJMoOw37cVpKRqt+YV5lZSd0xHr6J7GxYYPdTixqOjpqBhEQDxwTAIod
	Fhk3f2IPOtarA7MDfZ5tlIxcoWFDtyuORtNMHZpuxPq7Mg3zUwVYqY38VoLd9l+9T0pqd6Q01WQ
	wb0T3Ya+24c7EKpb19vr7IzCZRFXvTm7qsXD4EtIxjUjf/DkywdeajFAVjnEFG7kg==
X-Google-Smtp-Source: AGHT+IGr9aynI0zhfp6KT+M7K4PloFwF5SoM95V/wrrXsOI2+JT1UJZiJWIn9qDjYAkJtiCxRMj3Ew==
X-Received: by 2002:a05:600c:6d3:b0:436:199e:8458 with SMTP id 5b1f17b1804b1-4365c79ad57mr418822375e9.14.1735847714411;
        Thu, 02 Jan 2025 11:55:14 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 6/4] x86/pv: Fix build with Clang and CONFIG_PERF_COUNTERS
Date: Thu,  2 Jan 2025 19:55:12 +0000
Message-Id: <20250102195512.2406928-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250102192508.2405687-1-andrew.cooper3@citrix.com>
References: <20250102192508.2405687-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Clang, of at least verion 17 complains:

  arch/x86/pv/hypercall.c:30:10: error: variable 'eax' is used uninitialized
  whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
     30 |     if ( !compat )
        |          ^~~~~~~
  arch/x86/pv/hypercall.c:87:29: note: uninitialized use occurs here
     87 |     perfc_incra(hypercalls, eax);
        |                             ^~~

This function is forced always_inline to cause compat to be
constant-propagated through, but that is only a heuristic to try and get the
compiler to do what we want, not a gurantee that it does.

Clang doesn't appear to be able to see that the only case where compat is
true (and therefore the if() is false) is when there's an else clause on the
end which sets eax too.

Initialise eax to -1, which ought to be optimised out, but if for whatever
reason it happens not to be, then perfc_incra() will fail it's bounds check
and do nothing.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/pv/hypercall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index 2febade44b73..17581d232e19 100644
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -21,7 +21,7 @@ static void always_inline
 _pv_hypercall(struct cpu_user_regs *regs, bool compat)
 {
     struct vcpu *curr = current;
-    unsigned long eax;
+    unsigned long eax = -1; /* Clang -Wsometimes-uninitialized */
 
     ASSERT(guest_kernel_mode(curr, regs));
 

base-commit: a1746cd4434dd27ca2da8430dfb10edc76264bb3
prerequisite-patch-id: c0c647c3d465fc11e039b5de751da060f2599fff
prerequisite-patch-id: 675a622887bb1721684e574fc7755af79463f67b
prerequisite-patch-id: 4bc07a7aa6e0f769ed7c89dc56db25091d810760
prerequisite-patch-id: b23c07e16495387ee6cb70edcbcb13f6b42246ac
prerequisite-patch-id: fe09857284f3a17ff116de1f0a20d3916e8dda90
-- 
2.39.5


