Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7069C96C3BA
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 18:16:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790550.1200375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfd-0001KG-PG; Wed, 04 Sep 2024 16:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790550.1200375; Wed, 04 Sep 2024 16:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfd-0001HK-Lx; Wed, 04 Sep 2024 16:15:49 +0000
Received: by outflank-mailman (input) for mailman id 790550;
 Wed, 04 Sep 2024 16:15:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ufny=QC=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1slsfc-0000LO-7f
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 16:15:48 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f154288c-6ad8-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 18:15:46 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2f64cc05564so22260011fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 09:15:46 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614f0079fsm25852041fa.37.2024.09.04.09.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 09:15:44 -0700 (PDT)
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
X-Inumbo-ID: f154288c-6ad8-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725466546; x=1726071346; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXrv0E3MFlFU+ItFyAOjyjeGygFPyj9i38Ckg44wQ0M=;
        b=Wwlle8RaUHbngUqlRcuZdxOglGOywJ2vTEfbgbadSewuQu0dVRN2CKXD2kEV5oSsG6
         Os7OlgTwAybOEaOascU3M3KpL83DbkeuXWMpb5zyuPl/WoteJIzvBRbhXAo1vDpJVCg6
         DGT2kJjCIzKglgZZvBvt2J3xADawPsMBGsPZknaP9k5TifP61Z2CcGmxPY8FOdGImypu
         YpP/tih3SeQKaDY2+0u7L+EBSVx4l1WFgDYavb2wxB3xSmTS20IvejFZ0mvjK2uXWTbk
         SYAyq7inJnmg0keUrs53L0c5wm5y53DlTblxbRBKUjBhxrvcvEj8vHeV7M7kmvZm0MO9
         F7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725466546; x=1726071346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXrv0E3MFlFU+ItFyAOjyjeGygFPyj9i38Ckg44wQ0M=;
        b=E5YTP/2EpQjI1n9oBO5GU+bZaa6QyEJGYlsB935rxdStMYakzHCW875Ed42E6ej9/W
         +9JAgFp8Vgeq4Tnr7WDwSAYJIaMbky7rEUasjamMhQ0Rw6a2ikicvFkJD4CTCm04HnEq
         YyzEEIMffNyzWXAqUeBFW8mQhIGcz9cR7CLI14r9g99O/BTqpuTG9tnwNrDjjuHPzJsh
         x1fuagywVpXPUfxTmsU8Pl7XLf0QAquUpTuog0+DswGfX3xmb7hBeETFQkHF07NMJeix
         wh5HEXX0vq41yV5B7L+0HpTnYgZF8HpnntFrCxaDT9/XB53exUxzbBTvWVWMjF+cTx6p
         sNOw==
X-Forwarded-Encrypted: i=1; AJvYcCV8UcbnrP+Uk68Ii89FESNebzEMXU3eXNHEVHZpX3dJZxL0owl+JEfqOraa+jYPoT5iyTxEv5Zbegs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz15F2laXayjrBY5g62Pa+GmMd/rsQI/sATGe2Yzk2xmX4h1mv+
	IClg2ot+afaXesogvZBm1YmIwXyyY0vIeoyLBpSFTMg9VeCWq4iF
X-Google-Smtp-Source: AGHT+IGAyh4WUxY9AfkVPMwTqyaGKO5sye5d21g+iPTe1bXZL4tYnRRSXSRVmyNk0vZJE9XGQJOMBA==
X-Received: by 2002:a2e:a586:0:b0:2f3:f4e2:869c with SMTP id 38308e7fff4ca-2f64d570e98mr37440521fa.44.1725466545191;
        Wed, 04 Sep 2024 09:15:45 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org
Subject: [PULL v1 03/12] hw/arm: xenpvh: Tweak machine description
Date: Wed,  4 Sep 2024 18:15:27 +0200
Message-ID: <20240904161537.664189-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904161537.664189-1-edgar.iglesias@gmail.com>
References: <20240904161537.664189-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Tweak machine description to better express that this is
a Xen PVH machine for ARM.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/arm/xen_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 766a194fa1..5f75cc3779 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -216,7 +216,7 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
 {
 
     MachineClass *mc = MACHINE_CLASS(oc);
-    mc->desc = "Xen Para-virtualized PC";
+    mc->desc = "Xen PVH ARM machine";
     mc->init = xen_arm_init;
     mc->max_cpus = 1;
     mc->default_machine_opts = "accel=xen";
-- 
2.43.0


