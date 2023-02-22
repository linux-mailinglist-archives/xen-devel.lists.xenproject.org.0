Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D9B69F3D1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 13:01:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499400.770558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUnnc-0001Mb-4u; Wed, 22 Feb 2023 12:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499400.770558; Wed, 22 Feb 2023 12:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUnnc-0001IO-01; Wed, 22 Feb 2023 12:00:40 +0000
Received: by outflank-mailman (input) for mailman id 499400;
 Wed, 22 Feb 2023 12:00:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Q6c=6S=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pUnna-0000FF-4v
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 12:00:38 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8516d8fa-b2a8-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 13:00:37 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id cq23so29075164edb.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 04:00:37 -0800 (PST)
Received: from uni.router.wind (adsl-161.109.242.137.tellas.gr.
 [109.242.137.161]) by smtp.googlemail.com with ESMTPSA id
 br4-20020a170906d14400b008de729c8a03sm2133171ejb.38.2023.02.22.04.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 04:00:36 -0800 (PST)
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
X-Inumbo-ID: 8516d8fa-b2a8-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCe2e8yII+W8C97Qm8Q6kxpPS0WeF8P3OBexIFC6KlA=;
        b=dg4HMlrrLfJhNwUn9/mdMnmfnt76ucjv2SprMcdN+D8wibUcScNaw+7QrF9+ZbN/2I
         Qc036yIZMcgPpIM94/CSu9AUt+JFQwOQUn9I2ClizErcdw9dmlUimrq8ZviDqfdOdfbf
         hJ8eBBeOqmc4Zbk6neR+g4NpauQcvPbXbma92csWVeblK41Q2+/bnMs1fUahlAC/W0ST
         WcwURF2M5ukOJwIpP/w9oGxfL3Z57NmBcm4RV7h8rLRINYksd+zkXcd/EwYOInE2FRG7
         yNpa8F8RQtaKVeyZRW/chA/OVR5papgKpHbTZKxznkc/i6M0G5U9/PwzRecKdltPux0f
         j4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aCe2e8yII+W8C97Qm8Q6kxpPS0WeF8P3OBexIFC6KlA=;
        b=DdSrKTL+spjYWKnUzeHsWDKi5b7Ia3tBcSBUJqz49RT15evGHfAU/WN4+x89kVaADs
         45/8a6Ev2/ueFxlEGEBnRlye4ZxOgG6jHmJnMV3pZ1GqK2acfzhR4dUhNf2GCfRvIe3N
         BJc6nt3JHScd1auPZR9pkWJk3yPB9V0L18Hs+jeLFkUvuKjNW4ZCY0099ElPIvsnJ6Eq
         yYZPFZKfIexN9nzBV2ASi7LosSSiX9LUnTmEBxXexkwosGHQm4o3mnHgaftu/8HsIU67
         BikzmWCmnwWmzFJX6ttyD87MDbrJNPH90/AGNE0VrDtHw8c9sbtU/SRSI7BpCWJohIvM
         aNzQ==
X-Gm-Message-State: AO0yUKWCRdEvm4WQv08HEODcjI9LdcNuLeQivhdcxevvXDAyrzoH1ZZa
	+3NcUAavqyDxw+8PRWVx4cVzQk+xrDQ=
X-Google-Smtp-Source: AK7set930ay0yKAQ1/kzIMCVr92R/OoyojJ+FncrdszvL6+XOcmcUqEcJWlwxcKm2Dqau3lPSnBk+Q==
X-Received: by 2002:a17:906:2a03:b0:883:fe6b:814 with SMTP id j3-20020a1709062a0300b00883fe6b0814mr14576122eje.37.1677067237157;
        Wed, 22 Feb 2023 04:00:37 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 4/9] x86/vmx: remove unused included headers from vmx.h
Date: Wed, 22 Feb 2023 14:00:18 +0200
Message-Id: <20230222120023.3004624-5-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230222120023.3004624-1-burzalodowa@gmail.com>
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not include the headers:
  asm/i387.h
  asm/hvm/trace.h
  asm/processor.h
  asm/regs.h
because none of the declarations and macro definitions in them is used in
this file. Sort the rest of the headers alphabetically.
Fix build by including asm/i387.h in vmx.c, needed for vcpu_restore_fpu_lazy().

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
  -add a blank line between different types of headers, reported by Andrew
  -fix english in commit message, reported by Andrew

 xen/arch/x86/hvm/vmx/vmx.c             | 1 +
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 9 +++------
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 0ec33bcc18..a0297e8c6c 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -43,6 +43,7 @@
 #include <asm/hvm/vmx/vmcs.h>
 #include <public/sched.h>
 #include <public/hvm/ioreq.h>
+#include <asm/i387.h>
 #include <asm/hvm/vpic.h>
 #include <asm/hvm/vlapic.h>
 #include <asm/x86_emulate.h>
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 97d6b810ec..c0ca6d10e3 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -19,14 +19,11 @@
 #define __ASM_X86_HVM_VMX_VMX_H__
 
 #include <xen/sched.h>
-#include <asm/types.h>
-#include <asm/regs.h>
+
 #include <asm/asm_defns.h>
-#include <asm/processor.h>
-#include <asm/p2m.h>
-#include <asm/i387.h>
-#include <asm/hvm/trace.h>
 #include <asm/hvm/vmx/vmcs.h>
+#include <asm/p2m.h>
+#include <asm/types.h>
 
 extern int8_t opt_ept_exec_sp;
 
-- 
2.37.2


