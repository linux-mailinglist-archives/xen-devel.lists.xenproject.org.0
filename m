Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E76AC4B61
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 11:20:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998156.1378954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJqTT-0003CR-Gb; Tue, 27 May 2025 09:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998156.1378954; Tue, 27 May 2025 09:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJqTT-00036P-Cw; Tue, 27 May 2025 09:19:55 +0000
Received: by outflank-mailman (input) for mailman id 998156;
 Tue, 27 May 2025 09:19:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdBa=YL=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uJqTS-0002b2-5t
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 09:19:54 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf942269-3adb-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 11:19:53 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5532a30ac41so304797e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 02:19:53 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5521b9f9decsm1663715e87.157.2025.05.27.02.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 02:19:51 -0700 (PDT)
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
X-Inumbo-ID: bf942269-3adb-11f0-a2fd-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748337593; x=1748942393; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=047svu4VMPtrVn1GtLrAbtidBhKsG4dxvFgzkgEe5XM=;
        b=Z1bXUWCX/5iyTTbddfgCwLV30sPct8xwbrQRNHvs+pgjWpnkgg69OCY8ZUchXH3HrP
         DP1rsSxAn5ntaim9Mp4mXcyv1eGlEm5UEh6HAHepcpH0gNV4YOpaYN25nI2thsSCQ1l7
         sjdwmNUaLN8YzqSQ4sPBHCQMvTuKs7C7oPuIH+N85vHCIwiz24cF9pXiz0Ivbm6wmnL+
         JNStSWL7sIY92kXSe+VcicAFXAql8nUOAHgTBE4qpoV5hpRudmpIS0sa6AUZ/VwjmOA6
         iGE1ciaJuJLtnYNmRjt31KG3KMtUrO9gqDz0y6q3M9pLyQT+7GiLIQOgSjiSSNrMrUzw
         hDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748337593; x=1748942393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=047svu4VMPtrVn1GtLrAbtidBhKsG4dxvFgzkgEe5XM=;
        b=KP+Y+tIu20t6GWEEaZicsoG+QAAv5S3THYbsvXikMIvk2EPwKY45Qztf9ZZjgNdxCB
         cCDg6zslVRnWmqq6Db/xN+NY5hEwbfh0YjsHQONFOKLuzOj1+D9wdBiWDCwiOsYLGdH8
         f1iJJwXzqMr1h4W5TMtv1RYy8d4Ve5nmPU+yjMu1UYb8rTHmUhiqxBPn6vh7IkA2V+oz
         zXobBvNgp5deTnwJmQI/1FdOftDLxo+usej07jQCEivHs4xWKtc/6kgczT78GKv9Trmc
         GgvHhNP2VRCBny5oeLHex5apg3RxwfSjxdhyP4TF0kg0DmVOYk1xiuNNYW762ftCLfmf
         VdlQ==
X-Gm-Message-State: AOJu0YxNQD+cgVmln0G+XgVEtSBUmfrLUJx3hgptPN8OlLfKtZEXKGnn
	kO/xCBwaIha2oUuzVAOvNdgKlcGXjLr03vdgR4aLwuilmSLNO0xCTu/7UuknAQXv
X-Gm-Gg: ASbGncvyLqNsTgjHhFhGfKlZl89tPJPUX8AkWN6Rj83SMk1iUY3CO6f09loC8G7idKn
	V+PRKr3Ovr9rKWhXY90k28pQqXdsixdRnYrW1tsVhtGxu3S7XUolLFIZfrEQ8e14RVLWHnYQFBk
	qxQ5TqU06rEc1UvkXHG7MapspyYE+Rdv2/EezfFjb6pwr1TtwkIvSjqo3CqnC1zG1V9UwQNvC4A
	Vhd7j7ZGanvjPkT1B1XVgxkYmRiKASHnFmAUIgEnP5kAh62FtkTJEx8v36REruAfvY9lf1HWDKc
	lpCWhvhYv2Z+CGmc99//w9SETjbeKfqOxqsD3OlTaBbtKAZwzm+nTQJouBclZFFSjVMwEMUO0EA
	6xGSgqU99lnQK0x53ByEg9aOdxA==
X-Google-Smtp-Source: AGHT+IFxb/5W18oyk/0gBgsHOaXnhplOGuj1SCrklarCGv704LxYWGmqaRHYVe9H1zyfxO2++M3bSg==
X-Received: by 2002:a05:6512:3191:b0:54b:117b:b54b with SMTP id 2adb3069b0e04-5521cba15a2mr3250533e87.54.1748337592683;
        Tue, 27 May 2025 02:19:52 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4][PART 1 3/4] SUPPORT.md: Document ARM PSCI and vPSCI support
Date: Tue, 27 May 2025 12:18:56 +0300
Message-ID: <b04c6315f93e9887fb79a5748b60f53cbd9feba4.1748337249.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1748337249.git.mykola_kvach@epam.com>
References: <cover.1748337249.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Add a new entry under "Host hardware support" to document Xen's use of the
PSCI interface to interact with EL3 firmware via SMC calls. Supported PSCI
functions include CPU_ON, CPU_OFF, SYSTEM_RESET, and SYSTEM_OFF.
SYSTEM_SUSPEND is not yet supported.

Add a separate entry under "Virtual Hardware, Hypervisor" for vPSCI,
which describes the emulated PSCI interface exposed to guests.
SYSTEM_SUSPEND is not yet supported for hardware domain.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 SUPPORT.md | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index e8fd0c251e..31ad4c96fd 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -73,6 +73,12 @@ For the Cortex A77 r0p0 - r1p0, see Errata 1508412.
     Status, x86 PV: Supported
     Status, ARM: Experimental
 
+### ARM/PSCI
+
+    Status: Supported
+
+SYSTEM_SUSPEND is not yet supported.
+
 ### Host EFI Boot
 
     Status, x86: Supported
@@ -946,6 +952,15 @@ by hwdom. Some platforms use SCMI for access to system-level resources.
 
     Status: Supported
 
+### Arm: vPSCI (virtual PSCI interface for guests)
+
+Emulated PSCI interface exposed to guests to support CPU_ON, CPU_OFF,
+SYSTEM_RESET, SYSTEM_OFF, etc.
+
+    Status: Supported
+
+SYSTEM_SUSPEND is not yet supported for hardware domain.
+
 ## Virtual Hardware, QEMU
 
 This section describes supported devices available in HVM mode using a
-- 
2.48.1


