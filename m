Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D2667E799
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 14:59:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485589.752919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGd-0000tR-NX; Fri, 27 Jan 2023 13:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485589.752919; Fri, 27 Jan 2023 13:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGd-0000qw-H0; Fri, 27 Jan 2023 13:59:47 +0000
Received: by outflank-mailman (input) for mailman id 485589;
 Fri, 27 Jan 2023 13:59:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhsa=5Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pLPGc-0000nM-5W
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 13:59:46 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da9747f9-9e4a-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 14:59:45 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id r2so5045666wrv.7
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 05:59:45 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 d3-20020adfe2c3000000b002bc7fcf08ddsm3971131wrj.103.2023.01.27.05.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 05:59:43 -0800 (PST)
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
X-Inumbo-ID: da9747f9-9e4a-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smSUDHICnf15fQP+C9uW/E72KuO/jLzmp6nN3W3CB9I=;
        b=dadblgR1q6IpOd/TXAOyYr6zV+UO44OSHTRu9HcBRSAYqqx8znzLOQFLfVDCmzRDom
         eGyuXaL+Jx/q+d4+uLVPTn+wluxGZXCG9UeeuJ68ilv5SwvdyuzVX6cGZWEk4d3xcmSH
         WXYG96A3vobHVKMEsk3LlSrP9VJgKyNQTqIg5pOcAZUYoknyuZQzvs+/nSdUwYO0Xnlz
         TYpTLZM+l5+rNnmhDW6b5a6QEikx6WwD5P7K7rHHBPFrKUkQ9zk8ul3aM1bSFA+GxSsZ
         FQ5SxA1vE3xoIr4GnPm0MbVhOaezcWmBMg5vze6OzqJmL4g+Q54VHyfh/UyFlDFeOjDY
         3v0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smSUDHICnf15fQP+C9uW/E72KuO/jLzmp6nN3W3CB9I=;
        b=TFSrjpfiPKtEQ/z6EoQQuvtB6hk7a4JCqDeYyaS0pYdRYrCt3BrK/J5MxLe7LLtro3
         xQ62pvbLjACeGZw/YoI1fcSWKwL3zBCBhnMVe9Uw7NBuUGHA6b6HXGMzc5H//Wv0hIBC
         H1oJDOkGk+dhxf1tleRA/aMzF4VwM70iVJzVWkcdYLQDsazh/qZKstxeEaMfzF7jMXeu
         NXtZHxPKrZqQZglONglOGPdpmODpKEzOnOt9AV1SnmVUPPHELU/1VJafzgHy5HOAmZ48
         uHcCMKLA6I4bzZJTBFItrO5iLLxH+ORHH2BNQfr+8nK8Xx4Uo3kDRoGH7SGg00Bw5SNk
         piKQ==
X-Gm-Message-State: AO0yUKU6U9NaUSILkEwd1rL0J0S8MTdO9SCEF13qOiMfecxZmgfmdke4
	zfwRTtYoeF1TwsohaLOlJqUhS6ZpylI=
X-Google-Smtp-Source: AK7set8GzZy3ME0eU8wzMjCPiBHK7DckEg6zcX4yWcJO1ZuBodx9oX5jkJMzgMZlyzokyKbux07oZA==
X-Received: by 2002:a5d:4283:0:b0:2bf:d428:a768 with SMTP id k3-20020a5d4283000000b002bfd428a768mr2043010wrq.49.1674827984421;
        Fri, 27 Jan 2023 05:59:44 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 01/14] xen/riscv: add _zicsr to CFLAGS
Date: Fri, 27 Jan 2023 15:59:06 +0200
Message-Id: <971c400abf7f88a6be322db72481c075d3ceb233.1674818705.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674818705.git.oleksii.kurochko@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Work with some registers requires csr command which is part of
Zicsr.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
  - Nothing changed
---
 xen/arch/riscv/arch.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 012dc677c3..95b41d9f3e 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -10,7 +10,7 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
 # into the upper half _or_ the lower half of the address space.
 # -mcmodel=medlow would force Xen into the lower half.
 
-CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
+CFLAGS += -march=$(riscv-march-y)_zicsr -mstrict-align -mcmodel=medany
 
 # TODO: Drop override when more of the build is working
 override ALL_OBJS-y = arch/$(TARGET_ARCH)/built_in.o
-- 
2.39.0


