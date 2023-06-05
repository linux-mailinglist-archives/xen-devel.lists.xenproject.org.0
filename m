Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F7D722A25
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 17:02:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543754.848989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Bhy-0000Ri-Qm; Mon, 05 Jun 2023 15:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543754.848989; Mon, 05 Jun 2023 15:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Bhy-0000Po-Nz; Mon, 05 Jun 2023 15:01:22 +0000
Received: by outflank-mailman (input) for mailman id 543754;
 Mon, 05 Jun 2023 15:01:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNO+=BZ=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q6Bhx-0000Ph-HX
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 15:01:21 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3ebae38-03b1-11ee-b232-6b7b168915f2;
 Mon, 05 Jun 2023 17:01:19 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f739ec88b2so12426225e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jun 2023 08:01:19 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p25-20020a7bcc99000000b003f4289b18a7sm11103988wma.5.2023.06.05.08.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 08:01:18 -0700 (PDT)
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
X-Inumbo-ID: d3ebae38-03b1-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685977279; x=1688569279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FrKxDRBlDqtk7s2A2/hh/s4Mepj2N5HAw5jEMJdb02g=;
        b=QdDoglhKDK3nfp8Zu8tam3Z/SAQuM2cQtaFM2eCxJr9rTz6ubElQ46khylBjuDQgWW
         HKafYA3tdKnYIWID3Hy9brkUvR2TnvWc+7jQ40l+D7Ce7B6Vv2GDcaDvJ1Fu/XW5apSD
         o92fc6gTYW/XqMnUtjzQ+Xmu9cHQ3Z552GvQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685977279; x=1688569279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrKxDRBlDqtk7s2A2/hh/s4Mepj2N5HAw5jEMJdb02g=;
        b=e/7fT+vTQeAs3Vp2eFKJUWFm5NN5r0BjlJMLfcHmWG+4VYlZyWa0aQAorS7UrmaTMg
         08NEEXVhiy0xPhFLaEmjVuLwV+5vC3xx9OwhUU0RUnQi4nqZFT4zTyRBHqbP2UPFEMgd
         cGVGetx006AAVkwFNB2Sdv1cGJjM4AVhxe4nwMRaxmvKXdQakBGRPpXbfKp6XAmQ9VeX
         L1u6LnkGPmczciWZOmXESkV+uJn3+BYOJXc1Mrmoa8fOMgLyNYhr1YpDRNgZ7X4a2nvh
         bm2jXAEXHpsYhBP8nRS4vCgCkQ5ssp7/2/qUYHokA6znZ6/XABw8tLmspf0kLGVmdsZO
         8StQ==
X-Gm-Message-State: AC+VfDzIe4JOe7Ae9WN5zPOlWktiI5uaWXcAgTYwzcKHDOpR2dnyDTpC
	TTdk1MWWTgPnsXyqQpkH17OEj0MGQxvWDTbiWIo=
X-Google-Smtp-Source: ACHHUZ5gvY/q0okPR0439j7MEEdakwWCQDE+YWeRsqV0Livcf7sTHGlw8JUPJ8YyrOai23yWJ2pllA==
X-Received: by 2002:a1c:e914:0:b0:3f7:30c0:c6a with SMTP id q20-20020a1ce914000000b003f730c00c6amr3817598wmc.25.1685977278848;
        Mon, 05 Jun 2023 08:01:18 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/microcode: Add missing unlock in microcode_update_helper()
Date: Mon,  5 Jun 2023 16:01:16 +0100
Message-Id: <20230605150116.29911-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

microcode_update_helper() may return early while holding
cpu_add_remove_lock, hence preventing any writers from taking it again.

Leave through the `put` label instead so it's properly released.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/cpu/microcode/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index c1033f3bc2..e65af4b82e 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -599,7 +599,8 @@ static long cf_check microcode_update_helper(void *data)
         printk(XENLOG_WARNING
                "CPU%u is expected to lead ucode loading (but got CPU%u)\n",
                nmi_cpu, cpumask_first(&cpu_online_map));
-        return -EPERM;
+        ret = -EPERM;
+        goto put;
     }
 
     patch = parse_blob(buffer->buffer, buffer->len);
-- 
2.34.1


