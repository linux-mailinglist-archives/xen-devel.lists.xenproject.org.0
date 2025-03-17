Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7F7A65D02
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 19:41:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917821.1322671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFOH-0005Sl-Qd; Mon, 17 Mar 2025 18:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917821.1322671; Mon, 17 Mar 2025 18:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFOH-0005QC-Ng; Mon, 17 Mar 2025 18:40:45 +0000
Received: by outflank-mailman (input) for mailman id 917821;
 Mon, 17 Mar 2025 18:40:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3WP=WE=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tuFIU-0006uj-HW
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 18:34:46 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d5206d2-035e-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 19:34:42 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-225e3002dffso47308665ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 11:34:42 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:40 -0700 (PDT)
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
X-Inumbo-ID: 7d5206d2-035e-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742236481; x=1742841281; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOa15ppvF5kxsldjPkSIJYe5T0c824L9GaUvR3via0Q=;
        b=lMOX13izFB4S9h8vQySWsTtxpkjf9ki7bsifqELxXkvBMW9h+e7iBaQ/YKPaNjBwr0
         7srYTo12G4Wk0imPpBh6Iu0sO+Yovw1Wa1yAIM9esEJ1NGpbauwktg7Jz/rOimbFTAyl
         kuVMMKwaV+6B4/mxm6C1BXAxYaGtnTzgdeV7VLtFkarXdfKiPIrZTFIjlzdhZQpwKFsX
         ddyCNfK4KUpegMwuRmCT/YM/BMp3VFp91QbR6b9Kvkfulx7gmUMYd7krkAap7jrpn2R/
         3XDcNPg+IF/RlAiK6lUCvBrQtycCgQq9ks9HsWOZII1TjSPahgv76GKMNkTq/E5rITn5
         ykKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742236481; x=1742841281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOa15ppvF5kxsldjPkSIJYe5T0c824L9GaUvR3via0Q=;
        b=rCbf8N8ZbmhHE+YVbEWpSwA8HyWoN4WbYnxoeKjAh7vOH/+CGFefQ3K2koMdaZWt+d
         +O/A8Su8I7HgpehrAsWEwFnWbDjr4lmjOAI8FBBgn37zkr5FljDDNV1LDidc3rOkgmvp
         Qe1j37siiRD5NwaBBjdzG2yFMBhy9vsTsTLHPBZBJqErpXzi+hOnrSoLNeCmY9kwiiE4
         iq9JmFZequnUqBVHjC5p+EW1yyxA1IkFAP2fDKQHv+BT5Z4IzIkLKUVvukX+2opX8WTQ
         aC2uVHvOF+4J9mFYKN1p7Sx2NT2+CAWhqz9Lb7/Zbse6+sSy4lfVQbW1GooJ/lcrlIuM
         BxiA==
X-Forwarded-Encrypted: i=1; AJvYcCXcBMog9Fmybr96FuI1+BQKKzJhc8CC3tNtzzsC0arJK2aa6L+kusesVgpRzOU4QOS+FU5tVpOEcdY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2ynSRDPYUQf02Q/ctFuPtkMY41DF0d41Dtx2Gl4ZbtDetk8OP
	7uuByvqOI+RqACnIuesH33zm+3u3s1nirUTc8EL08Ukvm/o2z56hx20PVOD+I4s=
X-Gm-Gg: ASbGnctDrw2h4DU3z4V2JsaxDbO/iFPgeSVedOvbgJjvuDEY3189AeUubZVz2EO9tms
	oejH2DQuwE6yhjmI4mpUoIOFORP1ibOc6TklstIYIs/8HwknDbRQ7mrKIxDEJkANIBwStO+5m9o
	E5kwLTrMC0EjDe8wWjC2Xk0ML0dWxvmq6O8nJ0ViRQL9z+fDJu+i1yu/5A7NO9bcucRvLmQSIhs
	U+EhbKtaiJXqS56fYxqDTKRnQAQvm40iCeXm3Y0MVYdVVTNOTmPfSCv49P0qGP48PxL8IUY9SL5
	LxkPJJckDo5su38mNJxD5yDA0Cu0gK0Wqtk2NMc2tIx4rSUn0mNOB2s=
X-Google-Smtp-Source: AGHT+IHJvFyPD498ouch6ktpEIoYmR6xx3vtpzwDFb0ar1DtZX7lkpskC+JCwilCa8dJd3A5JvQbZw==
X-Received: by 2002:a05:6a21:7895:b0:1f5:9961:c40 with SMTP id adf61e73a8af0-1fa43acdf8emr1048891637.8.1742236480716;
        Mon, 17 Mar 2025 11:34:40 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	David Hildenbrand <david@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-riscv@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Xu <peterx@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 14/18] system/physmem: compilation unit is now common to all targets
Date: Mon, 17 Mar 2025 11:34:13 -0700
Message-Id: <20250317183417.285700-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 system/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/meson.build b/system/meson.build
index eec07a94513..bd82ef132e7 100644
--- a/system/meson.build
+++ b/system/meson.build
@@ -3,7 +3,6 @@ specific_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: [files(
   'ioport.c',
   'globals-target.c',
   'memory.c',
-  'physmem.c',
 )])
 
 system_ss.add(files(
@@ -16,6 +15,7 @@ system_ss.add(files(
   'dma-helpers.c',
   'globals.c',
   'memory_mapping.c',
+  'physmem.c',
   'qdev-monitor.c',
   'qtest.c',
   'rtc.c',
-- 
2.39.5


