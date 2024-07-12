Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D6192FE5F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 18:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758167.1167536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSJ34-0008QT-Mx; Fri, 12 Jul 2024 16:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758167.1167536; Fri, 12 Jul 2024 16:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSJ34-0008OT-FF; Fri, 12 Jul 2024 16:23:06 +0000
Received: by outflank-mailman (input) for mailman id 758167;
 Fri, 12 Jul 2024 16:23:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Ov5=OM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sSJ32-00088h-Cy
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 16:23:04 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 039eb315-406b-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 18:23:03 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-58e76294858so5788059a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 09:23:03 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ffa13sm358464966b.129.2024.07.12.09.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 09:23:02 -0700 (PDT)
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
X-Inumbo-ID: 039eb315-406b-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720801383; x=1721406183; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnWjYyIvUBOeZ1M9DFU0V7+lftXtERWxQqc4qL6rYCU=;
        b=CVrGV8bMwAvPQi2G5uXb39nUKLgz44LqVBbcMo3fqcVbpgB95QLrJVofiZFvvAUdEa
         41/blJ9/C//AOoc/yzODW79rim7X4QuqxvAKKSDoonLEX7Px5UrPZkRooWQNzi9+6vjC
         B1vwt1Ou0USGBmlBfSaHWAeyOZ7hFEvznpAhIRE/Kvm1zAiJKx2K+lmYc6JpOVzXA72A
         5Rz2nikQE2Um+11+ZIsQwqk3k9e8mJAytaJlL2MqwXrxbWvwEEmrtggkdykvvBlSRMeC
         gqIfrjr/vDU4Swvb8QbGmiHiCmu9CFs2FcTOw1Ukiv2yqnu5P+ZaPmxb/B+dYH/LT4gJ
         kP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720801383; x=1721406183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TnWjYyIvUBOeZ1M9DFU0V7+lftXtERWxQqc4qL6rYCU=;
        b=uBu+2yjgJZO8Mdu215g2vVoxSaNB3F1tWweyTxr2djFDHdMiplU2qEZ/+drNo1velG
         WH6XymmDR9ynidiPxb1FxgLNB+8wEPJptdxUKwyKQfluiRR/daWD2LbgCdfqF1Sr+A1B
         ZP+hiXZVU8iPZzqahpc6K3EuP7yCcBpTfqXdVpNPEgWhqyE3+5ndomSG+o4MlDZ2JPXW
         lFYxMwBpwEAfPJ34QMYiJ0+vRSrnD+vY4dsIQuPqu0PzS6ccKrZkpKB+fP2AsSwaBVQH
         i3xVp4xU1P1sDyzzHVjLywJV5c8w5iTN3aBQykm1Z3EheHQxa3TO7EEU27QKSVcj/NTr
         /F1g==
X-Gm-Message-State: AOJu0YwmcgIoUSY6MQkZ3QFRYSBiFlgFGLZgQoBMmiCs5JwtgjX042lj
	S0eBD/inT4V5FQk+1RcU86fDUEsu52HjPBYVs3pigCEk6gEwcjcFVhni+9+b
X-Google-Smtp-Source: AGHT+IE0kjPz3B1JnqqoQP73cX/d8V9PnjlBGf4m8OGvRnvFM8hbQ9VOCvTyJ1yHT8fJ568hmk0F7w==
X-Received: by 2002:a17:906:3387:b0:a75:1923:eb2e with SMTP id a640c23a62f3a-a799cc54286mr216953566b.14.1720801382949;
        Fri, 12 Jul 2024 09:23:02 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 3/8] xen/riscv: enable CONFIG_HAS_DEVICE_TREE
Date: Fri, 12 Jul 2024 18:22:52 +0200
Message-ID: <5229417cbee0aace3b9dccdac8c0157b4facf948.1720799926.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720799925.git.oleksii.kurochko@gmail.com>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - move 'select HAS_DEVICE_TREE' to CONFIG_RISCV.
---
Changes in V1:
 - new patch
---
 xen/arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index f531e96657..259eea8d3b 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -2,6 +2,7 @@ config RISCV
 	def_bool y
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
+	select HAS_DEVICE_TREE
 
 config RISCV_64
 	def_bool y
-- 
2.45.2


