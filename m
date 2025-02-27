Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF0BA4728A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:26:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897476.1306203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTay-0007KD-6P; Thu, 27 Feb 2025 02:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897476.1306203; Thu, 27 Feb 2025 02:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTax-0007IT-TW; Thu, 27 Feb 2025 02:25:51 +0000
Received: by outflank-mailman (input) for mailman id 897476;
 Thu, 27 Feb 2025 02:25:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IeNq=VS=flex--seanjc.bounces.google.com=3vcu_ZwYKCZgK62FB48GG8D6.4GEP6F-56N6DDAKLK.P6FHJGB64L.GJ8@srs-se1.protection.inumbo.net>)
 id 1tnTV3-00063X-8h
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:45 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dae1e81-f4b1-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 03:19:43 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2fe98fad333so1065916a91.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:43 -0800 (PST)
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
X-Inumbo-ID: 4dae1e81-f4b1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622781; x=1741227581; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=idfxGEE7w4MZK5vL28VhSjtN1o6ADW/NzBB0c7HM3Jg=;
        b=0uN8j7/8XHXkiThOcGwluLYKvE9J2OpxVVA/q6EdLLJBPvuYfj/mxx1JYHhjjFFs4s
         nFbuQxovjFDJ7wsHcLbGtdPk0Yx0qCJX77FRwCwHFkV92CjkoiIVuwnXZLiKXX+3Suqu
         3V46th+LQeKG081Oz0QwhkKB+0lJnGKnecw0bkrUdJifAMpD4iVGCTB0VvzQU4fT2IBp
         /8KpefDvpCsEFkMW2qHFvzlwEWlTrZiexomlX2M1BaFgbcSeTyyU73tobps2wlRKXDZ3
         6fZb9QYUvsmUOLC22YCKkKEiESW5oqhVj5VLeKiGE+9SFHu4Ov+0wLeT+0pE9vuo5aeK
         PcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622781; x=1741227581;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idfxGEE7w4MZK5vL28VhSjtN1o6ADW/NzBB0c7HM3Jg=;
        b=HGbzE7DL3LXmIyCkgypIRgWyj+OH73BFWWTwF+frpPo8zyDBQjbJcqDFIh6cSv23cO
         kT1TUjJX10+7BmvAOKmFLyJ5AoVOd7u2rcm94Xko1eGaKMwSTCZZ1vZ6TT/xvFIBeTdV
         2X/aX84ct0bk8FyU++OZ4PUvTIwEe1ze296QLgRtPYlcZcUyZgl4JkZU1tN8DuYwwGM6
         kV6otSdPCGhZW9MKYWgoi75VaOIi1ymvmNOqhLNxVTjFQNe2QnWubX196neXRGAv8tgb
         r4VNam83JCv75AyRTTvBv8SoLFpA6kyoC+avz5MJszPD3lpx3WM/Vx9/n2iZmwQibka5
         9EhA==
X-Forwarded-Encrypted: i=1; AJvYcCVMn1GEE4MvEL4aeYBCdLv5ntOVvbMWF3vu+bL5yzZFqNNN2gaMakw142avberX2F2mAHy8eM5m+EM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5UQ6HxVOpJGPri/5UTISsuDfRgDsgQ9JERy1zOzFmk7iBHrzS
	UvqU5oaxXWBOIDgT7HzZwi3CgF5Mk6LKMybczdXsPwQBYIKBK6eX9dJyPU7Yld202+xZ/r4jHXo
	VaA==
X-Google-Smtp-Source: AGHT+IHCzPrRKHA3wP3HVgIKrQRSiWCMkFG4NMbhGFfjlCu1Pi9S6BKyZnSxtjm5Zx+28kwNIdNRFoi5Jdo=
X-Received: from pjbqi7.prod.google.com ([2002:a17:90b:2747:b0:2f5:4762:e778])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c04:b0:2fa:20f4:d27f
 with SMTP id 98e67ed59e1d1-2fce7b23bb5mr32633734a91.32.1740622781602; Wed, 26
 Feb 2025 18:19:41 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:38 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-23-seanjc@google.com>
Subject: [PATCH v2 22/38] x86/pvclock: WARN if pvclock's valid_flags are overwritten
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

WARN if the common PV clock valid_flags are overwritten; all PV clocks
expect that they are the one and only PV clock, i.e. don't guard against
another PV clock having modified the flags.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/pvclock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/pvclock.c b/arch/x86/kernel/pvclock.c
index a51adce67f92..8d098841a225 100644
--- a/arch/x86/kernel/pvclock.c
+++ b/arch/x86/kernel/pvclock.c
@@ -21,6 +21,7 @@ static struct pvclock_vsyscall_time_info *pvti_cpu0_va __ro_after_init;
 
 void __init pvclock_set_flags(u8 flags)
 {
+	WARN_ON(valid_flags);
 	valid_flags = flags;
 }
 
-- 
2.48.1.711.g2feabab25a-goog


