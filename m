Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAE47F7171
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:31:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640377.998516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TT5-0001hg-JD; Fri, 24 Nov 2023 10:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640377.998516; Fri, 24 Nov 2023 10:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TT5-0001aF-BA; Fri, 24 Nov 2023 10:31:27 +0000
Received: by outflank-mailman (input) for mailman id 640377;
 Fri, 24 Nov 2023 10:31:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TT2-0006hx-NK
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:24 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d3a0577-8ab4-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:31:23 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a02d91ab195so243504966b.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:23 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:21 -0800 (PST)
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
X-Inumbo-ID: 9d3a0577-8ab4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821882; x=1701426682; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JayYLZwws7GAZWTMUZ4mzF6X/0MNAJll0GZdzHr4R+4=;
        b=X3IGtmrwF6NryNI8TdQZyaWkCh1li5ihkXS6QTehCphlINcETjAU8vnSmVlh4wdnsj
         594iQqATSRCjMDVFszFIBVc1wRTHuc5c36InjK4FhcbGek9eRzybAL38X9gXGNq9SbrQ
         36uFw2okbk2WZU3rN4bEVHZBMQii1jfP8kowI75wuW+B54ibHVo8FitxI3vEM7HXM+AT
         iqSrjIzOA7hvQsWk8ipoRl7oGWGJXbEO/lQ14ZwyG6doWQmE9sFNBCeZ5oc7434oF9KL
         7LQZhFEoMxRie9RZBGOhTWXYY4dMxuFVTu1g6nhmfdWQQawV+n1ZYPhnp8vJzE84ZB+M
         d63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821882; x=1701426682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JayYLZwws7GAZWTMUZ4mzF6X/0MNAJll0GZdzHr4R+4=;
        b=UannU22xIQMC4FtGCHHoHvJ/R0bZxAZ/v4H+MFfOq82WXm3X4Ke6Y/IxFJ2EhzZJiE
         1zzsPzgdSHSxVaK67yK7nVwAkvtdVqUWU7BZixx9S0E1n5SWnU9bhelnq/csMLSDG4pf
         DVT79jM8pvsB9bCA3GpsEqdc0NhoNEZYzEIf8Yn9REVkFIhOo4nyhwN8lwZH1SlSyVhn
         qvUOvNkgT7d8+3mBiAz7WL0F6nzh1RG4AbIz0YIp6p9XEZD3j7ASmzaYYfcvyvRFypBr
         UCm9KAxjYiAPcp9pCC9DsLItSt/ff0/paJGiKsJ/G5GkSBOx1ee4gmEgQwcFS6fqngqN
         zjeA==
X-Gm-Message-State: AOJu0YzGPQ22Pfv/SEjbPAugX30kQr64Wc+F9SzwQrSmlLNCPYh/dwHx
	qnK+pYiLUgVNcGO4BL39bdEt6nGUlVIgFw==
X-Google-Smtp-Source: AGHT+IEZtcrskBGD0/JNh49p/dHwMWZt9ssKn6lEQlk0CA2rN7o/YSCCTGTghVWCL81F8jiXx30qhg==
X-Received: by 2002:a17:906:3fc3:b0:9f7:b852:f807 with SMTP id k3-20020a1709063fc300b009f7b852f807mr1479598ejj.9.1700821882063;
        Fri, 24 Nov 2023 02:31:22 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 12/39] xen/riscv: introduce asm/setup.h
Date: Fri, 24 Nov 2023 12:30:32 +0200
Message-ID: <2dd966bbcaaf5a884c1a6a0a81dc29511e90f938.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/setup.h | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/setup.h

diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
new file mode 100644
index 0000000000..a1adb2be0d
--- /dev/null
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -0,0 +1,6 @@
+#ifndef __ASM_RISCV_SETUP_H__
+#define __ASM_RISCV_SETUP_H__
+
+#define max_init_domid (0)
+
+#endif /* __ASM_RISCV_SETUP_H__ */
-- 
2.42.0


