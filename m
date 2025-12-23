Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7E2CDA23A
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 18:36:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192776.1511888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY6J2-00084v-Dx; Tue, 23 Dec 2025 17:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192776.1511888; Tue, 23 Dec 2025 17:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY6J2-00082K-B8; Tue, 23 Dec 2025 17:36:20 +0000
Received: by outflank-mailman (input) for mailman id 1192776;
 Tue, 23 Dec 2025 17:36:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvXp=65=gmail.com=bobbyeshleman@srs-se1.protection.inumbo.net>)
 id 1vY6J1-00082E-I5
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 17:36:19 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e217880a-e025-11f0-9cce-f158ae23cfc8;
 Tue, 23 Dec 2025 18:36:16 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2a0833b5aeeso70595195ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Dec 2025 09:36:16 -0800 (PST)
Received: from localhost ([2a03:2880:2ff::]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c66629sm134402475ad.14.2025.12.23.09.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 09:36:14 -0800 (PST)
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
X-Inumbo-ID: e217880a-e025-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766511375; x=1767116175; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gaoL0EgpSgvE3V8MqagB54mpW9ZMp6QjZ3FcYobRHig=;
        b=LxpYh6g/UT428RcIVydUGe8TEowPMIRCZr5oT/nvlGKPEp30QollncYfXyxoof0SLJ
         tMB2g1AoiYZI9hqizDs6fiM0uMJdtdjclma0HFRXz6rzFPzt15MPP6xH0xrmOmo7Eh/a
         X7FUz1teT/CFAybdIujHrluEMGe5c29YfvhLGH65owaZq74BTGLnnyMYmGW9wGsIwG6Z
         Ms4CJwX9qmUOcuzpfUoGFf9fGnRoGzeywTAzc38QwIWu5khGiwp/hOvqi1MEv3uiYVyp
         6Swrl3Y4zYW6arzJfQmrEbbTOGoV2GMwA1lopPOGl0C61NiDBnvyY/7RCCDazDcEtTNT
         rAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766511375; x=1767116175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaoL0EgpSgvE3V8MqagB54mpW9ZMp6QjZ3FcYobRHig=;
        b=SfZ+U5lJgDTx/6GU4rtuL4aLMPQpAW4KiT4F36vMFecNOK58c0txGhMsYK2YWXtbtP
         fc4/TTsDJaPXGQpDVapGzXrvzo5LYI8lWUxRT/x5eFZqZUVIwBTWADdvqZS0hnajEs6W
         kfxp6iuvQO6MsXtaMv8SgrFjePl0ZsoR1TQl8TA0F48xnEpNMcETuZR/N0xSV1Pj4EL8
         1bXPxlynre77gvQ0PCYCxOd9r0DhQ5ftRCeFjsTikAfGTzPcSNxd0b10JdeZ7NiFv1iS
         k4LRhTi0m4NKaHxeWlEZ3oyHJl6FkChzljCg+DboviJ9W7KNXd8ZS0bhpTFLYEyb6eFC
         pi3Q==
X-Gm-Message-State: AOJu0YwTDF52+U7VYYeudu5UvW+VBIBeg5aXDd8Ab+yJnvtVvydubyv+
	hiiPpoKz/I0CqhAtMnDORmuThrvoUGQAD0ixswqaqxHVeXw90U1K4Gb1IJNznQ==
X-Gm-Gg: AY/fxX6bxotl93Nl4v5xcx5u7bJPnb++ahKtMPgmHoLZ+MVV/Z3ppW9ln6MR9LptrSy
	u8QsehK1296HmjbWVF7VDv1LiS6aw9W8ptLQWA2bDkxg0PIQoAIsOHm6mzVidsvtrrnxa91ksLU
	A6f6IR9HwXY5vvU08dCdTAEOtplpYu7PHtXNYamMf8jolQmGWdpOHqOVXvkZq37Q1L6KYxZhgU7
	Oa2+rnhstPCjCSO8a3zJXjWaXAKascSmq1aj2kD6sjNPIVF3A8Vt9xJ8ZVTlsBdvHniVc6M10mb
	AEV+4qtycxsEZn2BqRmsEahv9WXtCg7WyC0kasrIsQTPU498Gp86nkEvQbx3VvcnIV9j7sz7tvs
	vjEfIJqlrleT1ajm7yWz6mBGyqkMlkxT9d5PzkYYJMDpuXZ/i9LfOh0rKVj2xU1+wVZ9RB586jT
	bO94gYeMTBpvz+XIWs
X-Google-Smtp-Source: AGHT+IFOlLFz4BIDf4rwNvqcLY+w0ZsHXcjhXNTnMfipqH0GcHREIqZ7Jse3ZslamL72RsvA/Aww7g==
X-Received: by 2002:a17:903:2342:b0:2a0:e5cd:80a1 with SMTP id d9443c01a7336-2a2f2a34fa1mr148796535ad.41.1766511375146;
        Tue, 23 Dec 2025 09:36:15 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobbyeshleman@meta.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] MAINTAINERS: remove myself as RISCV reviewer
Date: Tue, 23 Dec 2025 09:36:14 -0800
Message-ID: <20251223173614.2638823-1-bobbyeshleman@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bobby Eshleman <bobbyeshleman@meta.com>

I haven't been actively reviewing Xen RISC-V patches for several years,
so remove myself from the reviewer list to better reflect the current
reality. The RISC-V port has come a long way thanks to Oleksii, current
contributors, and maintainers, and it has been exciting to see. Many
thanks to everyone, I hope we cross paths again in the future!

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c70623153bc6..bf00be928c3d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -506,7 +506,6 @@ F:	tools/hotplug/Linux/block-drbd-probe
 
 RISCV
 R:	Alistair Francis <alistair.francis@wdc.com>
-R:	Bob Eshleman <bobbyeshleman@gmail.com>
 R:	Connor Davis <connojdavis@gmail.com>
 R:	Oleksii Kurochko <oleksii.kurochko@gmail.com>
 S:	Supported
-- 
2.47.3


