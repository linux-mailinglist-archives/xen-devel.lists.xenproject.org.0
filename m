Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF26D968A86
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 17:00:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788085.1197515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8Xf-00019f-OB; Mon, 02 Sep 2024 15:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788085.1197515; Mon, 02 Sep 2024 15:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8Xf-00018K-Kg; Mon, 02 Sep 2024 15:00:31 +0000
Received: by outflank-mailman (input) for mailman id 788085;
 Mon, 02 Sep 2024 15:00:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E/cM=QA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sl8Xd-00018E-UU
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 15:00:29 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17187f20-693c-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 17:00:27 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2f50966c469so49122151fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 08:00:28 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c24f762f8dsm2437379a12.61.2024.09.02.08.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 08:00:26 -0700 (PDT)
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
X-Inumbo-ID: 17187f20-693c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725289227; x=1725894027; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xk9nXu+h1O9Dru8CYrgj4B4uMbFkV5LNUyNmt/AckII=;
        b=UYJDr6ByqkvKWw/c9Bz82X2uMeBgm/iPQFxgG44T/TAuSHbxaxxQLZYxYEX5UVY29o
         H+gfCbVIdtFlN2GQCSP8XNLxM8AjK+J3NJoZP0ac6iUfhL0rrRQ7eoSXVEVgZWFtmBhw
         3e7P1k9PALXjcFrFtSRHeMsQnK0OKy2+0cVlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725289227; x=1725894027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xk9nXu+h1O9Dru8CYrgj4B4uMbFkV5LNUyNmt/AckII=;
        b=Nk0XR480hWEJo5ydnppsfXHcLMRObRQyyaJ9rsk4HlUSXj5ieHo47MD39RCwdwmtLr
         dsEhe4kB8mtUSu17TSZQHLhcV6NArCMk3prNMsYh4Ow/gSIVX0nfP7MsIpAIVdRaufFw
         n+f/ylPhVjZ7i0Q4Lv1cGuo/+dpoyLhJ7YjYbrmOJrr/2P2W4qO7T0nyoMK52l8dlzep
         Qjr6VHbXWqn7dFEcuQTjaq96sH2cESHhRSuXOjnXt2GyjeSlmBXWv48favt4J3WCVe5i
         TrdAI7nOzYcxjsUdvzZYoJzU4Mhd3JoDPhIv1T+c3BswI1ndVRXa+/PlkWQmqrMOfCHL
         3UVQ==
X-Gm-Message-State: AOJu0Yy8y8aC9d9QI5TcOaq/M7+TGTPhV5J6k1Dw2u4xgvWi5ndAo7wc
	SQZqRU//RDgiVAjjweNkyEy1e/8OcF9G0i5ZrjeiSeXMOLmrsSQln9Gy0F2be2PsRZaE1XAhCY5
	C
X-Google-Smtp-Source: AGHT+IHfnQoWDIEilWhTNa2Suo9mAr1UlJQtCwalzPphBZNo8NWXfI/XyzlnAzXmUUY8gDwefeX1Cg==
X-Received: by 2002:a05:651c:b0c:b0:2f3:cabc:6158 with SMTP id 38308e7fff4ca-2f62903f7efmr52389461fa.11.1725289226521;
        Mon, 02 Sep 2024 08:00:26 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/cpu: revert opt_allow_unsafe from __ro_after_init to __read_mostly
Date: Mon,  2 Sep 2024 17:00:16 +0200
Message-ID: <20240902150016.63072-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Making opt_allow_unsafe read only after init requires changes to the logic in
init_amd(), otherwise the following #PF happens on CPU hotplug:

----[ Xen-4.20.0-1-d  x86_64  debug=y  Tainted:     H  ]----
CPU:    1
RIP:    e008:[<ffff82d040291081>] arch/x86/cpu/amd.c#init_amd+0x37f/0x993
[...]
Xen call trace:
   [<ffff82d040291081>] R arch/x86/cpu/amd.c#init_amd+0x37f/0x993
   [<ffff82d040291fbe>] F identify_cpu+0x2d4/0x4db
   [<ffff82d04032eeaa>] F start_secondary+0x22e/0x3cf
   [<ffff82d040203327>] F __high_start+0x87/0xa0

Pagetable walk from ffff82d0404011ea:
 L4[0x105] = 000000006fc2e063 ffffffffffffffff
 L3[0x141] = 000000006fc2b063 ffffffffffffffff
 L2[0x002] = 000000807c7ca063 ffffffffffffffff
 L1[0x001] = 800000006f801121 ffffffffffffffff

****************************************
Panic on CPU 1:
FATAL PAGE FAULT
[error_code=0003]
Faulting linear address: ffff82d0404011ea
****************************************

For the time being revert opt_allow_unsafe to be __read_mostly.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Fixes: bfcb0abb191f ('types: replace remaining uses of s8')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/amd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 903be14af4b9..7da04230393a 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -46,7 +46,7 @@ static unsigned int __initdata opt_cpuid_mask_thermal_ecx = ~0u;
 integer_param("cpuid_mask_thermal_ecx", opt_cpuid_mask_thermal_ecx);
 
 /* 1 = allow, 0 = don't allow guest creation, -1 = don't allow boot */
-int8_t __ro_after_init opt_allow_unsafe;
+int8_t __read_mostly opt_allow_unsafe;
 boolean_param("allow_unsafe", opt_allow_unsafe);
 
 /* Signal whether the ACPI C1E quirk is required. */
-- 
2.46.0


