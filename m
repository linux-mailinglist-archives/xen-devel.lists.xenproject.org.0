Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E01AA8D327D
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 11:03:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731687.1137325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFCR-0006a9-GL; Wed, 29 May 2024 09:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731687.1137325; Wed, 29 May 2024 09:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFCR-0006YQ-De; Wed, 29 May 2024 09:02:23 +0000
Received: by outflank-mailman (input) for mailman id 731687;
 Wed, 29 May 2024 09:02:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ4/=NA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCFCP-0006YK-SU
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 09:02:21 +0000
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [2607:f8b0:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27297f9d-1d9a-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 11:02:19 +0200 (CEST)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3cabac56b38so898712b6e.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 02:02:19 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ac070e1460sm52339466d6.40.2024.05.29.02.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 02:02:17 -0700 (PDT)
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
X-Inumbo-ID: 27297f9d-1d9a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716973337; x=1717578137; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yZF32pZ4CySVT63PvMfVFEEjipVnmCoEx5V33tI/850=;
        b=jU8oImCdkqRMkKHakjJAqQSYHbI9BaUKdFyWkNbGqgUxmEli5Q7d2M6FjdkyBRHXWZ
         vXlPK5RVwTnDsmI/zqcobgmN7ByNgQroMWH5izF3w470238gfg/reHsRMsPlhlJb1ruY
         GSiVFcoqEZ37ZHj4LRd9/FNrkR1gfMEit2UGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716973337; x=1717578137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZF32pZ4CySVT63PvMfVFEEjipVnmCoEx5V33tI/850=;
        b=er63QhVQT952kvL22hazu984LfGsR876h9br9X/LWZ9sac28pLlVZEwRsCyaSZgqUN
         wb+rqCPb2/7UwjvaREevX1JGDCT7iIqwxuTiqQhWQ3gJnY3pfGruxJHgghW+EpR/zbwy
         bRknG77DyLghfITEYKBJUUei3L04j71Kk5/jycxa54SmMdWI88sw3cj4qmMjG6QCc69X
         rv45mt91wZC/uQKnJLEpzoXFVQU90Ihkys6GEhn8CvXNrq2KDFzC8OL4SQyP20p8ElzQ
         sh1szKvscnVkbL1qR4Lkew/nh2hd/X40gfX/fjlor/oPHYS9CQcHlxGj2kZwT2hggJpP
         dJyg==
X-Gm-Message-State: AOJu0Yyh4d9o8KsxDCtKgtPyg3yn2X0VoILzE2HwyY7eQaBbJvZgHKIo
	Gt2EkdejnnBDMCtDQyRhr828QE2LyvFQ7uiNaiiKSYrvpTWFBU2tMODB7xq9oWXCVyCPgPejGv6
	8
X-Google-Smtp-Source: AGHT+IH0ZJzmvauilykbAJmHui3TPflhX0w+i/ry24eVRpmVsIVFIJO+Rs/P50zziFBhLR2bEDa1kw==
X-Received: by 2002:a05:6808:3026:b0:3c9:c3ca:e2cb with SMTP id 5614622812f47-3d1a5483e47mr16811764b6e.11.1716973337560;
        Wed, 29 May 2024 02:02:17 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 0/9] x86/irq: fixes for CPU hot{,un}plug
Date: Wed, 29 May 2024 11:01:22 +0200
Message-ID: <20240529090132.59434-1-roger.pau@citrix.com>
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
interrupt loses reported by dom0.  Test with
x2apic-mode={mixed,cluster}.

I'm tagging this for 4.19 as it's IMO bugfixes, but the series has grown
quite bigger than expected, and hence we need to be careful to not
introduce breakages late in the release cycle.  I've attempted to
document all code as good as I could, interrupt handling has some
unexpected corner cases that are hard to diagnose and reason about.

I'm currently also doing some extra testing with XenRT in case I've
missed something.

Thanks, Roger.

Roger Pau Monne (9):
  x86/irq: remove offline CPUs from old CPU mask when adjusting
    move_cleanup_count
  xen/cpu: do not get the CPU map in stop_machine_run()
  xen/cpu: ensure get_cpu_maps() returns false if CPU operations are
    underway
  x86/irq: describe how the interrupt CPU movement works
  x86/irq: limit interrupt movement done by fixup_irqs()
  x86/irq: restrict CPU movement in set_desc_affinity()
  x86/irq: deal with old_cpu_mask for interrupts in movement in
    fixup_irqs()
  x86/irq: handle moving interrupts in _assign_irq_vector()
  x86/irq: forward pending interrupts to new destination in fixup_irqs()

 xen/arch/x86/apic.c             |   5 +
 xen/arch/x86/include/asm/apic.h |   3 +
 xen/arch/x86/include/asm/irq.h  |  28 +++++-
 xen/arch/x86/irq.c              | 172 +++++++++++++++++++++++++-------
 xen/common/cpu.c                |   8 +-
 xen/common/stop_machine.c       |  15 +--
 xen/include/xen/cpu.h           |   2 +
 xen/include/xen/rwlock.h        |   2 +
 8 files changed, 190 insertions(+), 45 deletions(-)

-- 
2.44.0


