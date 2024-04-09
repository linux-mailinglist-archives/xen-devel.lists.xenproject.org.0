Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAEE89DBD2
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 16:11:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702461.1097487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruCBs-00024o-30; Tue, 09 Apr 2024 14:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702461.1097487; Tue, 09 Apr 2024 14:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruCBr-00022a-Vt; Tue, 09 Apr 2024 14:11:11 +0000
Received: by outflank-mailman (input) for mailman id 702461;
 Tue, 09 Apr 2024 14:11:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Fcd=LO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ruCBq-00021L-K9
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 14:11:10 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02d822c4-f67b-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 16:11:08 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56e48d0a632so4990932a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 07:11:08 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h1-20020a0564020e8100b005682a0e915fsm5269162eda.76.2024.04.09.07.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 07:11:07 -0700 (PDT)
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
X-Inumbo-ID: 02d822c4-f67b-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712671867; x=1713276667; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XMRR3cy/AZjaysGx13DnD1gQxMBslwfuoOd2jKo1CTk=;
        b=rMTlLzdqUVPdsgjIxeiMIOvOUNaaOqngNGZzMEw5jAd+EK/vzVzwcETrsywfTbNtIu
         ST7ALmlPyI4IUjSbRquOzdC6WNXmBkN15Ap0SeNZvdWfc8daazET1EdxBAZ0AIidV6e/
         JoCw+9uHABw4f02l/Lgj6mJrPDs+YWGEq5dy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712671867; x=1713276667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMRR3cy/AZjaysGx13DnD1gQxMBslwfuoOd2jKo1CTk=;
        b=oeg6tYzW+DEoEby0OmrjNin8VS9atZ6Qkk7KXpFgQHno35vTwFM1ByJYY5jXLWvcsq
         wrci0J3qxQQK46OEDW7OhbqgSvr9OqcTgQS2bJocoMKZKzwK1X8Hv0JntONZYtOXOxF+
         iym1enCwrEpi86B4SNvvLz9sRpWxAUBwusdYgrFMi7uTx/0zzWEv00yityLP7Qfft3tO
         fppvWa6vmdGW1xp2/DHqSkIIKtj4lJhbgFCz5bFctkZPUae8DMoReVH4LdRV9MWlVx1Y
         LeCF6G183elQ/L7SxajTTzLxt0QEYr7QJ/6ZcwIHL/5vZpvQFwpt8lP7sy9JNM+kvwB6
         Phuw==
X-Gm-Message-State: AOJu0Yz2P/sWDwgkeFl3/zfayVyKwvtvzZfMsQpkJhSJyI3RFyfhR91y
	a2q+oIT8LnqAA/tZ1KU95zGF8onhO75TdZtI1r4dNbI9PzhWbCtSnDZTgnB9z7Q5XBTdrcSshzY
	ZXJQ=
X-Google-Smtp-Source: AGHT+IGgrzawivC/060GMrjrsh7AxP0dHPGScNeh0F3TkjbcZukD5jzq/RaJAojhqbYzZDRTh006pQ==
X-Received: by 2002:a50:a6c3:0:b0:56e:7722:553 with SMTP id f3-20020a50a6c3000000b0056e77220553mr1204642edc.24.1712671867588;
        Tue, 09 Apr 2024 07:11:07 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/cpuid: Don't expose {IPRED,RRSBA,BHI}_CTRL to PV guests
Date: Tue,  9 Apr 2024 15:11:05 +0100
Message-Id: <20240409141105.125969-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All of these are prediction-mode (i.e. CPL) based.  They don't operate as
expected in PV context, and need emulating to have the intended behaviour.

Fixes: 4dd676070684 ("x86/spec-ctrl: Expose IPRED_CTRL to guests")
Fixes: 478e4787fa64 ("x86/spec-ctrl: Expose RRSBA_CTRL to guests")
Fixes: 583f1d095052 ("x86/spec-ctrl: Expose BHI_CTRL to guests")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/public/arch-x86/cpufeatureset.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 3de7c0383f0e..6bb1ee3b0af4 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -311,10 +311,10 @@ XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Protected Processor Inventory
 
 /* Intel-defined CPU features, CPUID level 0x00000007:2.edx, word 13 */
 XEN_CPUFEATURE(INTEL_PSFD,         13*32+ 0) /*A  MSR_SPEC_CTRL.PSFD */
-XEN_CPUFEATURE(IPRED_CTRL,         13*32+ 1) /*A  MSR_SPEC_CTRL.IPRED_DIS_* */
-XEN_CPUFEATURE(RRSBA_CTRL,         13*32+ 2) /*A  MSR_SPEC_CTRL.RRSBA_DIS_* */
+XEN_CPUFEATURE(IPRED_CTRL,         13*32+ 1) /*S  MSR_SPEC_CTRL.IPRED_DIS_* */
+XEN_CPUFEATURE(RRSBA_CTRL,         13*32+ 2) /*S  MSR_SPEC_CTRL.RRSBA_DIS_* */
 XEN_CPUFEATURE(DDP_CTRL,           13*32+ 3) /*   MSR_SPEC_CTRL.DDP_DIS_U */
-XEN_CPUFEATURE(BHI_CTRL,           13*32+ 4) /*A  MSR_SPEC_CTRL.BHI_DIS_S */
+XEN_CPUFEATURE(BHI_CTRL,           13*32+ 4) /*S  MSR_SPEC_CTRL.BHI_DIS_S */
 XEN_CPUFEATURE(MCDT_NO,            13*32+ 5) /*A  MCDT_NO */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */

base-commit: 4be1fef1e6572c2be0bd378902ffb62a6e73faeb
-- 
2.30.2


