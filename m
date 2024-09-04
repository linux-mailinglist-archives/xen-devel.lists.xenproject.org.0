Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B6B96C3C0
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 18:16:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790551.1200386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsff-0001ag-3s; Wed, 04 Sep 2024 16:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790551.1200386; Wed, 04 Sep 2024 16:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfe-0001XX-V6; Wed, 04 Sep 2024 16:15:50 +0000
Received: by outflank-mailman (input) for mailman id 790551;
 Wed, 04 Sep 2024 16:15:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ufny=QC=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1slsfd-0000I6-7r
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 16:15:49 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f291fd57-6ad8-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 18:15:48 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f4f2868783so69438201fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 09:15:48 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614ed192dsm26313971fa.7.2024.09.04.09.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 09:15:46 -0700 (PDT)
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
X-Inumbo-ID: f291fd57-6ad8-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725466548; x=1726071348; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4UdvH3BfQ7ZFjeKvJ3vJphtRrv7BJb81oMyMgddOC7g=;
        b=OuT9OzrVnA0g3JjJ7PdpOQz/I/2/Xp04KexsWBAGPE836iwgpntCVeTbHv/UJ1/gfj
         12Iz7YdgnQ9v82jkWc7k23sWv0HCX5onXMBC0dle7XsGaD2Q7Ntti5ulQqvkbBTEYO0C
         m3+MG6JgWW1O6aXJKwke8PoxqnII82LTS5PPnjNX+WKoTuSrJ0WWP07Sb78oflgCv8kD
         WTD3hMixkE/BnieX1PvGz5btESPVoy4UDwUmJQppnIQgeWL1B/7WPHAX/KcZbDPyuf1Z
         Z9TzKxQEc3eWGq5YDjIrqwY23iOqQuqRyHHwWJwVgc20jGDxw4w5Ve7d3X3l27UTB+wQ
         0wwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725466548; x=1726071348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4UdvH3BfQ7ZFjeKvJ3vJphtRrv7BJb81oMyMgddOC7g=;
        b=s5j9n0K4D5cRWiPPksmClS/ra/4KPJUBmnXNTj5Zi8MJCURvBXOxiv8CGN96NaqAu6
         8gwwCKpHiFj4ew0SdSIfjIvFkwhO/fMSNX29SW5F3xnIPSmRdwq8XtMBJi1o2203kRn2
         tH4G81ZyHDbAWivXEOD027uh4nvfSzAtobhf0twJPyXMC2JQ6Ocv5aGBWMjeTFBLZ2F/
         L2QngFkOSYFc/wSZ9enNl0owF92s4SpwFoI+yWcpQBnYAJj4dCKB4muuQ+XBIYrvb+cM
         jB+DZ4d9qKVnFK+Kpqf3h8k3+o/wm4injZo1Onm47RCyqpodLAfwYESkQZmhoS5zr9IL
         bgVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbc71d70o+pikxvtIRyuMq0QgKW1bUxbcFiIr2C0wVkNiBsFT7VNIftPV3svvuQMKXfiABOaf+VNQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywbrd0bVlt/aS1UAwlkVBokV4Brwgndv9Shv5fYkq40V10/VTbu
	9uI/XxHM1r7Icp1TYeE3zxKAPqKHv0MFOFOAoc6vo17myy8+PL5c
X-Google-Smtp-Source: AGHT+IE45vRxHAq5eEpoyZwDxuEOBpO1l1yUi0y7mTpVkk1pHSrAlDEkmoWFTNi0vvfiboSA/TFkcA==
X-Received: by 2002:a05:651c:1507:b0:2f5:104b:f2c with SMTP id 38308e7fff4ca-2f61e0b27f4mr114070401fa.39.1725466548140;
        Wed, 04 Sep 2024 09:15:48 -0700 (PDT)
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
Subject: [PULL v1 05/12] hw/arm: xenpvh: Remove double-negation in warning
Date: Wed,  4 Sep 2024 18:15:29 +0200
Message-ID: <20240904161537.664189-6-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904161537.664189-1-edgar.iglesias@gmail.com>
References: <20240904161537.664189-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/arm/xen_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index fda65d0d8d..16b3f00992 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -165,7 +165,7 @@ static void xen_arm_init(MachineState *machine)
     xam->state =  g_new0(XenIOState, 1);
 
     if (machine->ram_size == 0) {
-        warn_report("%s non-zero ram size not specified. QEMU machine started"
+        warn_report("%s: ram size not specified. QEMU machine started"
                     " without IOREQ (no emulated devices including virtio)",
                     MACHINE_CLASS(object_get_class(OBJECT(machine)))->desc);
         return;
-- 
2.43.0


