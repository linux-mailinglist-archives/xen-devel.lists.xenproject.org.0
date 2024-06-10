Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F61B9023F0
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 16:21:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737296.1143523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGftD-0008OL-Pu; Mon, 10 Jun 2024 14:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737296.1143523; Mon, 10 Jun 2024 14:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGftD-0008MP-NJ; Mon, 10 Jun 2024 14:20:51 +0000
Received: by outflank-mailman (input) for mailman id 737296;
 Mon, 10 Jun 2024 14:20:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ow3=NM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sGftC-0008MI-Cx
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 14:20:50 +0000
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [2607:f8b0:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1a37cd1-2734-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 16:20:48 +0200 (CEST)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3d215a594b9so1463897b6e.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 07:20:48 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79555162807sm217581985a.33.2024.06.10.07.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 07:20:46 -0700 (PDT)
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
X-Inumbo-ID: a1a37cd1-2734-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718029247; x=1718634047; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n/T5O2hGfQDiLF7n446iATUt1DbeXMiDaHNQoXud1hg=;
        b=Aj5L9mKnTsRByEAUCTDnrWDrICvEQHUErXwAIiAgF/Bb8t8XN0/ZVFxzTwm1aiMWi6
         +Z91vmtrENtNsiand4gtSQogGm5wXRtk45RwzYaZaNE26uAuGChrNVY/QV2b3sbnaCgs
         ucbDH+gPyF73y7YfykncaMVhIi8gpSnnQUANI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718029247; x=1718634047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/T5O2hGfQDiLF7n446iATUt1DbeXMiDaHNQoXud1hg=;
        b=VuMEubrEz2bQHi3FzCcOpRv1CvzpxeekuyGMIQigQgOThqD1MF/njz5qLycfaAM/ld
         8IUIiQoR+SfFwLWgk9+XTas28vDgMm1IKEOZeIHnMdFrSTdCy29Lzp/wrRZOwKO3gLC1
         dRfX6xJxHOmFm4m+AS5gkTKbvnc7IjJIedD26Wrd01hcV9tgUgCbAFD91Ii3tjlBrUNr
         euNfVXGySePC2R3WJALXWuni7JbuqnHsmarO8yW5NZc5AsWrKqDxf2hUwVg8ULfzdGQN
         i5OirOq2dTxQQDB8M+Um4sBzgxaIhK0KwHaJwyhgpjocpgf5+QLCWfC9GTi9bBJ7kElF
         F0Kg==
X-Gm-Message-State: AOJu0YzolwtxV2WASO/egoVI2D6mB9AngVNm8CS1Rgdn4uT2nYQvFUU3
	ZoWIcH6FptQ9fCGumjmbXwqlYYAd1dJ4b3RW3zvQS9rdG/P7MmorEHPRmUD3TBdsWH6kHbdXw96
	h
X-Google-Smtp-Source: AGHT+IG6A3LJyzcjuC8iF8k2LDUMrWwlsyk+4xzd5hBbx7oW3hzQ35piZuUr5ATFT4rG2gQUHpMedg==
X-Received: by 2002:a05:6808:1525:b0:3d2:1a26:8a48 with SMTP id 5614622812f47-3d21a268ed8mr9746046b6e.5.1718029246527;
        Mon, 10 Jun 2024 07:20:46 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/7] x86/irq: fixes for CPU hot{,un}plug
Date: Mon, 10 Jun 2024 16:20:36 +0200
Message-ID: <20240610142043.11924-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The following series aim to fix interrupt handling when doing CPU
plug/unplug operations.  Without this series running:

cpus=`xl info max_cpu_id`
while [ 1 ]; do
    for i in `seq 1 $cpus`; do
        xen-hptool cpu-offline $i;
        xen-hptool cpu-online $i;
    done
done

Quite quickly results in interrupts getting lost and "No irq handler for
vector" messages on the Xen console.  Drivers in dom0 also start getting
interrupt timeouts and the system becomes unusable.

After applying the series running the loop over night still result in a
fully usable system, no  "No irq handler for vector" messages at all, no
interrupt loses reported by dom0.  Test with x2apic-mode={mixed,cluster}.

I've attempted to document all code as good as I could, interrupt
handling has some unexpected corner cases that are hard to diagnose and
reason about.

I'm currently also doing some extra testing with XenRT in case I've
missed something.

Thanks, Roger.

Roger Pau Monne (7):
  x86/smp: do not use shorthand IPI destinations in CPU hot{,un}plug
    contexts
  x86/irq: describe how the interrupt CPU movement works
  x86/irq: limit interrupt movement done by fixup_irqs()
  x86/irq: restrict CPU movement in set_desc_affinity()
  x86/irq: deal with old_cpu_mask for interrupts in movement in
    fixup_irqs()
  x86/irq: handle moving interrupts in _assign_irq_vector()
  x86/irq: forward pending interrupts to new destination in fixup_irqs()

 xen/arch/x86/include/asm/apic.h |   5 +
 xen/arch/x86/include/asm/irq.h  |  40 ++++++-
 xen/arch/x86/irq.c              | 197 ++++++++++++++++++++++++--------
 xen/arch/x86/smp.c              |   2 +-
 xen/common/cpu.c                |   5 +
 xen/include/xen/cpu.h           |  10 ++
 xen/include/xen/rwlock.h        |   2 +
 7 files changed, 214 insertions(+), 47 deletions(-)

-- 
2.44.0


