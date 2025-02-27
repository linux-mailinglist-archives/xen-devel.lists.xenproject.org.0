Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5742BA4728B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:26:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897480.1306221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTb0-0007kO-0i; Thu, 27 Feb 2025 02:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897480.1306221; Thu, 27 Feb 2025 02:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTaz-0007aR-LW; Thu, 27 Feb 2025 02:25:53 +0000
Received: by outflank-mailman (input) for mailman id 897480;
 Thu, 27 Feb 2025 02:25:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQ85=VS=flex--seanjc.bounces.google.com=3scu_ZwYKCYw8uq3zsw44w1u.s42Du3-tuBu11y898.Du3574zus9.47w@srs-se1.protection.inumbo.net>)
 id 1tnTUq-00063X-PA
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:32 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 465fdc50-f4b1-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 03:19:30 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fe86c01f5cso1041713a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:30 -0800 (PST)
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
X-Inumbo-ID: 465fdc50-f4b1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622769; x=1741227569; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4/yyaam3CnBmuwJ2ykq85CXFFo+ZsEjkVRvpD/uHncQ=;
        b=YcwkwIIleAKRlntExHb9vQgLgnTyzuYYEhkAugBFro7K6ktnQHomqCtjoqq339OEf/
         xXktGCrfDmlg99Z79gNb6wRs7HsAPppONnMiM5e4CJLc70zeZqBLObjAQRKCgSRHa1nV
         DhDZA8NwP2xpqn4ogBTtpYguqs4eiCAc2L5qB1y4z6j3o8w7q9JMhYFX5djnNHtEau98
         o02ezOULqbNmsoTAD2BmJ/4UN4+oLoNhJBm0vPi3gYRyV02lC3Lmk9tJGkWT00EW1MfS
         OSftaM63qHWzC876At4YLYtU6W33N4/v8xUNv2UJNEhn8veTHVrZFOI8tJqD+1oBjICa
         Jg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622769; x=1741227569;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/yyaam3CnBmuwJ2ykq85CXFFo+ZsEjkVRvpD/uHncQ=;
        b=SoMTCGwN/VCQ7BxaXOcFnGi5C3XNxQvZUNOFYM0nJEIYvVg9na7TItHhtmQqcjmcz9
         /+a1u4b16oalLGZuH5KFDAM875yGLWEhKAUyct30hj+58KyqJuIzaK0/803PjafkrwcD
         Xs+JgSuy2oMbFLk8eoeZ2XdpC2wZsq+D+cYwWKIlGsJaTYPUhAYL6L4Tt7ANiRU4UmMf
         roQO2zlFS8wpWCZsOrvQk42YbdoVGsOowt3cm9l8zl7dtoa8ZgxXYwFqe0bmuPikO366
         QvewKXfQQUZKPdW2bJfA9TaAJ7r4LYWlk5QDgjjSM8EixZjWYX0ANsSlVFEV5xaytwKQ
         isrw==
X-Forwarded-Encrypted: i=1; AJvYcCWlqKTSWnpvZre4HSViseA9HmK3w/G40uffa1Kg/8RK+YEaUIArS2SJAaK14lMrD5W8zpBGLwdBqd4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1FzlpHpTFJU7+7y7hzPeu5oIoPKu7tJCmOotN25pTy+sZ7F/V
	KDhEO6ayNKMLA/dUlgwJrcQ19UoKRD4h+xNcf+V3yN6fbfmSW6ms0ht+rkv+vfpyily4Du1nvZ8
	Uig==
X-Google-Smtp-Source: AGHT+IHB6t2yNhuRRLSjnQcCsiQss9r1P7c1nIVM64h4xrkl38FU8N4jisiF+hTwqGE4B/+REyTZDinhF2Y=
X-Received: from pjbqb10.prod.google.com ([2002:a17:90b:280a:b0:2e0:915d:d594])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:280c:b0:2ee:5bc9:75c7
 with SMTP id 98e67ed59e1d1-2fe68ac9330mr14041142a91.5.1740622769336; Wed, 26
 Feb 2025 18:19:29 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:31 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-16-seanjc@google.com>
Subject: [PATCH v2 15/38] x86/xen/time: Nullify x86_platform's sched_clock
 save/restore hooks
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

Nullify the x86_platform sched_clock save/restore hooks when setting up
Xen's PV clock to make it somewhat obvious the hooks aren't used when
running as a Xen guest (Xen uses a paravirtualized suspend/resume flow).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/xen/time.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 9e2e900dc0c7..51eba986cd18 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -565,6 +565,12 @@ static void __init xen_init_time_common(void)
 	xen_sched_clock_offset = xen_clocksource_read();
 	static_call_update(pv_steal_clock, xen_steal_clock);
 	paravirt_set_sched_clock(xen_sched_clock);
+	/*
+	 * Xen has paravirtualized suspend/resume and so doesn't use the common
+	 * x86 sched_clock save/restore hooks.
+	 */
+	x86_platform.save_sched_clock_state = NULL;
+	x86_platform.restore_sched_clock_state = NULL;
 
 	tsc_register_calibration_routines(xen_tsc_khz, NULL);
 	x86_platform.get_wallclock = xen_get_wallclock;
-- 
2.48.1.711.g2feabab25a-goog


