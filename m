Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 894A389EEE8
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 11:32:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702958.1098662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruUJ7-0006Pp-WE; Wed, 10 Apr 2024 09:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702958.1098662; Wed, 10 Apr 2024 09:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruUJ7-0006O5-Te; Wed, 10 Apr 2024 09:31:53 +0000
Received: by outflank-mailman (input) for mailman id 702958;
 Wed, 10 Apr 2024 09:31:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5G6/=LP=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1ruUJ6-0006Nz-Tv
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 09:31:52 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2918adf6-f71d-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 11:31:51 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-516d0c004b1so7717561e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 02:31:51 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a056512209400b00516be9fa424sm1778520lfr.254.2024.04.10.02.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 02:31:49 -0700 (PDT)
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
X-Inumbo-ID: 2918adf6-f71d-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712741510; x=1713346310; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0G6oq6E5A9amVfy3uzECr08z3tfdIDoBAzOhqHG7jfM=;
        b=D1hnL6ANGKLjFtimjxkjy9ohLrNewZdVewc24Aa+ERA3y2N0S1VvfxTzWieGnF9/cD
         cymSBPTXhYRbjSeuo2odU15F0PxSfRoefj/svsKdxGYjTYqRlDQk6/VPrQQXHKZWL3s6
         2Mj8EA4ZNbNmOVjmSlPuA/2JPbVgDEUrVv/BTN5wdI0rZiLPTCAgrS0qSWKiPlB99F8G
         9FwegbDCfPEcxQBwmkFkTpWGJ8ZPGvI+WZs+iFciLPcXc7Dj/JUbc/gYyXmnqNcxOTne
         Y1ISyn4Y/L/IxrYAggHDYCb9U32mJgDYP3RyzMQXSHaKpu1ejiD92d5l77gcDF/uU6AA
         H72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712741510; x=1713346310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0G6oq6E5A9amVfy3uzECr08z3tfdIDoBAzOhqHG7jfM=;
        b=uPu4t6HOktMjCzbZ+ZJyvdudVQIZuoReUe6qM4507AafiA4wnKmsT0Sjb0QKiw5ZtI
         ofAbVzilDZMjogRjWKqLM9uNXzsRnW/Y5FA7I9C0yuWZVFpg975/a/yhePJL4/5kddZz
         cANonRnbj4kh18a45/7gzhq9dbHrTdt15ZrGMAm4NNqkePgpV5XziWT4tLKBtZnRxZlz
         zKe7oeim5kJY6YzeueLuTcz8PJrykFqsal0Lfth6ATaUHH9ICOcuSbp10TmQZATvD65p
         jTBgvTborYpgnuxda4qvCcrCdte/lYVqPO/Xrcm9SnSt9l/jirAAfV0K881gLd4+bIC6
         iV2w==
X-Gm-Message-State: AOJu0YwYx91x1KGXLBnhTjR8kpb9IoVC4sYlTKFjCIRR6PFZ50eoFVtP
	s+2ZIWswEA/g+6QsXBEbpxnciTu2SENsGPKrRGkuylfTVVvskeMydBOj2Wjk84dEIQ==
X-Google-Smtp-Source: AGHT+IG8owHPdjRnhrLcKqYY6e2CNEQVVMEI0EOMypdrbXr00SHoqB8gsRXuNG6uZxaVcNzwxLcpcg==
X-Received: by 2002:a19:8c0c:0:b0:517:5ee6:4f5b with SMTP id o12-20020a198c0c000000b005175ee64f5bmr1621237lfd.43.1712741509610;
        Wed, 10 Apr 2024 02:31:49 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	jbeulich@suse.com,
	edgar.iglesias@amd.com
Subject: [RFC PATCH v1 0/2] xen/arm: Annotate code symbols
Date: Wed, 10 Apr 2024 11:19:45 +0200
Message-Id: <20240410091947.1498695-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

On the way towards Xen safety certification we're evaluating the use
of tools to collect code-coverage/profiling information from execution
traces. Some tools rely on ELF symbols for code being declared with
type FUNC and having a symbol size.

We currently annotate some symbols but not all. Also, there seems to be
different ways to do the annotation so I'm sending out this RFC to first
figure out how we want to do things before I go ahead and edit more
of the ARM port.

In this first try I've followed the style from commit:
b3a9037550 x86: annotate entry points with type and size
IIUC, prefering to use macros from the generic framework in
xen/linkage.h in favor of ENTRY/ENDPROC.

But perhaps we would like to keep using ENTRY() for entry points
into the hypervisor?
Another way could be to add .type name, %function to the ENTRY macro
and use END from xen/linkage.h.

Or we can keep using ENTRY/GLOBAL/ENDPROC.

Any thoughts or better ideas?

Best regards,
Edgar

Edgar E. Iglesias (2):
  xen/arm64: entry: Use xen/linkage.h to annotate symbols
  xen/arm64: entry: Add missing code symbol annotations

 xen/arch/arm/arm64/entry.S | 72 +++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 24 deletions(-)

-- 
2.40.1


