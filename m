Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92385923BF0
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 13:02:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752288.1160534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObGj-0002OF-JA; Tue, 02 Jul 2024 11:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752288.1160534; Tue, 02 Jul 2024 11:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObGj-0002Ia-Bv; Tue, 02 Jul 2024 11:01:53 +0000
Received: by outflank-mailman (input) for mailman id 752288;
 Tue, 02 Jul 2024 11:01:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Tas=OC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sObGg-0000Yf-Og
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 11:01:50 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7adea768-3862-11ef-aaf1-7f3abd7486c0;
 Tue, 02 Jul 2024 13:01:49 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57cc1c00ba6so1876455a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 04:01:49 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7516310768sm269306866b.218.2024.07.02.04.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 04:01:47 -0700 (PDT)
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
X-Inumbo-ID: 7adea768-3862-11ef-aaf1-7f3abd7486c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719918108; x=1720522908; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4YKogXXS7rS2JSgnMwZtKdSycY+deBCwnIxeHuH4q0=;
        b=QC3O8ud4+LAkGD6kdgJ+WMBDlC6V0IVK/tKr6zpS0RwSUeYU0Idkrs2fu9RtB0GjJY
         inrwiQf8lMV5tt75ingNWfXsJrZ1Ox9w2o0S2EAg4lI0XiciaGxQBWixXv7+BUpXM/gr
         ofw8FYnxcmMTXkQLJmOKOpJCqYpnFwolDQLs2YKGRUsMX6CfcaFyNdrRuUqbSAH21U1n
         cVj4fQy11uoz8Eu4NzfBcHMuSgXamR168ULzG4uOb4wR71+zg7mvabCGWCoVCn/S/BhS
         mjewBOo7u+dMix9BDpo2Ynw0P9xUq0RVMtTEIKI93+9eRUXVSTkBdK5xl/TECGkapMlb
         rjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719918108; x=1720522908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4YKogXXS7rS2JSgnMwZtKdSycY+deBCwnIxeHuH4q0=;
        b=fUhuFxnnIfxsS33KZqGAWUR6H43Lhrizkdrq/TWUANRJh0LnV5sHa18fiwuKgHcpp1
         sMDuK2UU4z5JaSg+QIdBQ+gianbFLCd+IvpUxrFQjdsrjixbYhaicysr5p+42ZNmt2ZY
         EYcZa8joubQcXmlcmUt7E32XTtHH7ClYiNoOriRtKwyUkoIS+pdOQmactEEpQNI/jGMF
         I1FWx8BIGj8L0ThFdXc5yYpnP1ZYLmImm+Ym/rUT95biu0SizKjrnjjn96dmfiIStwC6
         pnce3tJXyTbOAr/mFKjoTxS/Tjd7Rf4xfK7ooiA6ldUrlUemO9YxbsaVNkd0Mt56HNGQ
         NJMw==
X-Gm-Message-State: AOJu0YwWsijanRVswIzZnmwHM+U1r028Tt2cxQzVld4cqVdFsp4uG5Or
	dk7Y3Ip3HBdwNN56BNPbmUS79bH43h3kOB41BupZwWNMfTdl/d5Qy20QPqUx
X-Google-Smtp-Source: AGHT+IGqNXfWgqImukvmT5IpRYfbs6JmqV/ewaj6kuxq94Zed2YFP8frKYYYNA8qMllgIkwuMwKJ3g==
X-Received: by 2002:a17:906:730d:b0:a75:110d:fa51 with SMTP id a640c23a62f3a-a75144a2774mr662750166b.58.1719918108267;
        Tue, 02 Jul 2024 04:01:48 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v14 7/9] xen/riscv: use .insn with operands to support the older gas
Date: Tue,  2 Jul 2024 13:01:34 +0200
Message-ID: <a64f0de38fe32da9154d1944195ff6b852ae3310.1719917348.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719917348.git.oleksii.kurochko@gmail.com>
References: <cover.1719917348.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support for specifying "raw" insns was added only in 2.38.
To support older version it would be better switch to .insn
with operands.

The following compilation error occurs:
  ./arch/riscv/include/asm/processor.h: Assembler messages:
  ./arch/riscv/include/asm/processor.h:70: Error: unrecognized opcode `0x0100000F'
In case of the following Binutils:
  $ riscv64-linux-gnu-as --version
  GNU assembler (GNU Binutils for Debian) 2.35.2

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Suggested-by: Jan Beulich <jbeulich@suse.com>
---
Andrew,

Could you please take a look if you are okay with suggested
changes.

Thanks in advance.
---
 Changes in V14:
  - add Suggested-By: Jan Beulich <jbeulich@suse.com>
  - switch from "raw" insn to .insn with operands to support older gas.
---
 Changes in V13:
  - new patch
---
 xen/arch/riscv/include/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 6846151717..3ae164c265 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -67,7 +67,7 @@ static inline void cpu_relax(void)
     __asm__ __volatile__ ( "pause" );
 #else
     /* Encoding of the pause instruction */
-    __asm__ __volatile__ ( ".insn 0x0100000F" );
+    __asm__ __volatile__ ( ".insn r MISC_MEM, 0, 0, x0, x0, x16" );
 #endif
 
     barrier();
-- 
2.45.2


