Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 376A9A4727C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:25:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897452.1306150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTaf-0004tB-Ha; Thu, 27 Feb 2025 02:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897452.1306150; Thu, 27 Feb 2025 02:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTaf-0004oA-Cg; Thu, 27 Feb 2025 02:25:33 +0000
Received: by outflank-mailman (input) for mailman id 897452;
 Thu, 27 Feb 2025 02:25:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i3lw=VS=flex--seanjc.bounces.google.com=3zsu_ZwYKCakbNJWSLPXXPUN.LXVgNW-MNeNUURbcb.gNWYaXSNLc.XaP@srs-se1.protection.inumbo.net>)
 id 1tnTVJ-00063X-Iv
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:20:01 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57d499a2-f4b1-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 03:20:00 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fe870bc003so993596a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:20:00 -0800 (PST)
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
X-Inumbo-ID: 57d499a2-f4b1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622798; x=1741227598; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=LZJJLySVHQgVgABAB7C0XZjDtBlLYwz9ES+Z1vP/8LE=;
        b=3YPN1FNhKSXnlzOxt6Xjm0bBGCTIyOASokGc5GWGO5cGMuroXWZo27cm1agedkNm0v
         25bObTBqK3lsKKvPtcz2NbvvUcncBwOT/jEzrzi9ueVXUqzvqBsUoWbhTrkuGhzXHAg+
         u6hyjXV2m3Nq3PkhnXp0fspzvEhkENptpCakt2k1JI6X8n7Oxr96oteggWp26POL6Yvb
         E76TxfhFDhOC+xZLvhY41UyH3D8OXdYDMQjxpdmzVEie3XAJV81lliE/TMQAqiMWS3z7
         vWidnVoj5f30+4vSM+jhvqKXKtTzyWeu40Q0uRiYEGxRMIlc+Vo8RTUIeKUaS6fngx8S
         VX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622798; x=1741227598;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZJJLySVHQgVgABAB7C0XZjDtBlLYwz9ES+Z1vP/8LE=;
        b=l1cDNYBZo4yJlJo9j9OlguNOrpc6Fmi1bwlYGfnNeOHPHEqj7GwpCY+1GYztpS8mxB
         YRFDGRsR57DVk1d+v8sUMfuje4QMp6UJtk8xgfEozNFPvnTR0moh0U/YXzWkNJMtdjlF
         o4wFc/LA5FQl/d7DkFHTcP7ZnzdshKm2vPCyq5aOul2tOtSzSQUU8bCh07ssJAVqIiji
         bohUC/Nexg3aY20jq73TFkvMVD2lJVxTgoBXmSfWb9OAWz3Y44vgdvMwAxTVXkR9J9kH
         05Z1+hJxNMcjTpUE8Wth08Jmx1XlptFTVs9M9QNofDN41ErTJNZG8EwPnjemPhAJnB4x
         QQlw==
X-Forwarded-Encrypted: i=1; AJvYcCVb9c0WAjt3aIiNi+N1lotTcGcSnAfiFr6cU6iHr2HhilUu4JT8cY2P/4cDqyvvG22jCTkiGaP9Ny0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEsB805hooLv1UWv1qbZiCt6jkOIlKKeRgvhuR3ZhKN59nCk+v
	7+IiOMRC7lWRpjlHaUPRJ3NQnvYO9VZqNfnLxT+mLXeoYbbliE/KzNeowOUQlhub7Lr9hrbldE+
	hAw==
X-Google-Smtp-Source: AGHT+IGhmfOgzOy0w88MLax4aQJq7WSM6/RTmeD/HK48z8QB3SAzs8w4kTiAhr4wwBRMQkXZhflq/qsZ2GU=
X-Received: from pjtq6.prod.google.com ([2002:a17:90a:c106:b0:2fc:11a0:c53f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:570c:b0:2fa:2c61:3e5a
 with SMTP id 98e67ed59e1d1-2fea12c36b0mr2515446a91.10.1740622798574; Wed, 26
 Feb 2025 18:19:58 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:48 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-33-seanjc@google.com>
Subject: [PATCH v2 32/38] x86/tsc: Rejects attempts to override TSC
 calibration with lesser routine
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	John Stultz <jstultz@google.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>
Content-Type: text/plain; charset="UTF-8"

When registering a TSC frequency calibration routine, sanity check that
the incoming routine is as robust as the outgoing routine, and reject the
incoming routine if the sanity check fails.

Because native calibration routines only mark the TSC frequency as known
and reliable when they actually run, the effective progression of
capabilities is: None (native) => Known and maybe Reliable (PV) =>
Known and Reliable (CoCo).  Violating that progression for a PV override
is relatively benign, but messing up the progression when CoCo is
involved is more problematic, as it likely means a trusted source of
information (hardware/firmware) is being discarded in favor of a less
trusted source (hypervisor).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index be58df4fef66..ebcfaf7dcd38 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1309,8 +1309,13 @@ void tsc_register_calibration_routines(unsigned long (*calibrate_tsc)(void),
 
 	if (properties & TSC_FREQUENCY_KNOWN)
 		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
+	else if (WARN_ON(boot_cpu_has(X86_FEATURE_TSC_KNOWN_FREQ)))
+		return;
+
 	if (properties & TSC_RELIABLE)
 		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
+	else if (WARN_ON(boot_cpu_has(X86_FEATURE_TSC_RELIABLE)))
+		return;
 
 	x86_platform.calibrate_tsc = calibrate_tsc;
 	if (calibrate_cpu)
-- 
2.48.1.711.g2feabab25a-goog


