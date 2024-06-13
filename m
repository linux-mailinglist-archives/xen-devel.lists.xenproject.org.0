Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B73DE9078F3
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 18:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740135.1147151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHnm2-0000rv-Ks; Thu, 13 Jun 2024 16:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740135.1147151; Thu, 13 Jun 2024 16:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHnm2-0000pi-IA; Thu, 13 Jun 2024 16:58:06 +0000
Received: by outflank-mailman (input) for mailman id 740135;
 Thu, 13 Jun 2024 16:58:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9y96=NP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHnm2-0000pc-0P
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 16:58:06 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18f14291-29a6-11ef-b4bb-af5377834399;
 Thu, 13 Jun 2024 18:58:03 +0200 (CEST)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-79767180a15so82812585a.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 09:58:03 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecbe5esm67202485a.30.2024.06.13.09.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 09:58:01 -0700 (PDT)
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
X-Inumbo-ID: 18f14291-29a6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718297882; x=1718902682; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6JVEr9JpY61teVKNr86SoOyf1LAKqFW45HZt709v3dc=;
        b=OLc38gPEx7IX1LfjRLrNUA22tVkanguCpRyVOlvK8+h+nF0f1V1QWDY/QlCgLrLmza
         crVGHWAn/Uq11XvdbXHYQsyHqmO/3Xp6N8+Ix8x+wfz46GlZx9NY4lhAX1Qrj8H33I71
         oCnAluvYoB7TOmmGZkDUw3Q9KhTH+hFFSp7O4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718297882; x=1718902682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6JVEr9JpY61teVKNr86SoOyf1LAKqFW45HZt709v3dc=;
        b=ZdV1R2t+KKyzfAlk2RCxICCuVIer0Q6vIkWHQ4zd0gmJVKPqE1Pr881sKFe3Xd3wui
         YgR+9NjPfsoq+k1gNMEkTlJk1bywrR1r+X9ROizXKrV42jcC1jPNI90goelpokPyKih5
         Z17YpDdiwIHipFRK0Th0sdWZespoqbyhGuTRwFF2HR6B9J6TZkv6UHQ0XKX6f6+JLD3R
         Ea91Mp78RkZnz6Ovo0drsMm7mdIPQh6JAAra8bb6t1lfXkc1IsfnKDkxS0mNYXW+3V+w
         IVUIlnM6nWrix/S5w7calGft0B8LtD/y/SZ6OhrS79DoVoFxL0LrfutTxHQJ2XINz3eO
         rKTw==
X-Gm-Message-State: AOJu0YysuvApRdkIjAXvUYEF4TmKNdcYtpwmQXVDpXY5K94CwYvony06
	4pXIrHF6FDpduMEehbh78Q0tYKpGGWmhEBXrTL/WmMGtRH7el0ym+V3tEG7Nm8DxOD1I7gtX/+Y
	P
X-Google-Smtp-Source: AGHT+IHpSs4+6mXHWJLYaAvCpygKpSrq7mkyuLwbAv5zOAoJN6bzOMi7+iYp0Mu/I7XEm/gvGdPlFA==
X-Received: by 2002:a05:620a:4493:b0:795:47c5:59b1 with SMTP id af79cd13be357-798d23f9f04mr11876785a.7.1718297882206;
        Thu, 13 Jun 2024 09:58:02 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 0/3] x86/irq: fixes for CPU hot{,un}plug
Date: Thu, 13 Jun 2024 18:56:14 +0200
Message-ID: <20240613165617.42538-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
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

Some XenRT testing is undergoing to ensure no breakages.

Thanks, Roger.

Roger Pau Monne (3):
  x86/irq: deal with old_cpu_mask for interrupts in movement in
    fixup_irqs()
  x86/irq: handle moving interrupts in _assign_irq_vector()
  x86/irq: forward pending interrupts to new destination in fixup_irqs()

 xen/arch/x86/include/asm/apic.h |   5 +
 xen/arch/x86/irq.c              | 163 +++++++++++++++++++++++++-------
 2 files changed, 132 insertions(+), 36 deletions(-)

-- 
2.45.2


