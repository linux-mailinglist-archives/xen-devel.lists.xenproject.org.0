Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B44B596841
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 06:44:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388657.625378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOAuK-000840-CV; Wed, 17 Aug 2022 04:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388657.625378; Wed, 17 Aug 2022 04:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOAuK-00081z-9j; Wed, 17 Aug 2022 04:43:56 +0000
Received: by outflank-mailman (input) for mailman id 388657;
 Wed, 17 Aug 2022 04:43:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIU2=YV=gmail.com=lukas.bulwahn@srs-se1.protection.inumbo.net>)
 id 1oOAuI-00081t-Dt
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 04:43:54 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31f7be3c-1de7-11ed-bd2e-47488cf2e6aa;
 Wed, 17 Aug 2022 06:43:53 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id a4so3117856wrq.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Aug 2022 21:43:53 -0700 (PDT)
Received: from felia.fritz.box
 (200116b82633f20060f31b3eb0891b8b.dip.versatel-1u1.de.
 [2001:16b8:2633:f200:60f3:1b3e:b089:1b8b])
 by smtp.gmail.com with ESMTPSA id
 bd22-20020a05600c1f1600b003a2f6367049sm735112wmb.48.2022.08.16.21.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 21:43:52 -0700 (PDT)
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
X-Inumbo-ID: 31f7be3c-1de7-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=UACsgzg4zvHRWZAiY2XTwdGkhFZ7nkJOvMvp+H83efU=;
        b=LxqfgrQRxH9cVxBmy6mNpakfLl7UYj9+tXLCNREcdEntLd0pdXuOO3BbgYC3UKVYlp
         Aqg0rsH3md+ygovnda3zH2j0KA8RKTQNF6MAObW85HYTx3mB2byTk62ZOWkI8Hm+edNU
         ZCu9SgkqMRskKZ6weJ2ZwcMulfOBk6f2q7cfCrJSeTLOOTEmKjySI7xec7gQFbdiLSHi
         0fWObg+Wybl3M5AMhn+rAWXaAEoAe2BFIVOmNz+j4O3oa3TsXAhi9tzJdtrhO4i/yxHU
         gK5WljdrHM+Dw20qNI3tnouNv1eh7+PaGywVliEGMyOVhHhYyYkoamHWA09Ozshl43bD
         g5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=UACsgzg4zvHRWZAiY2XTwdGkhFZ7nkJOvMvp+H83efU=;
        b=wV76DD7SUXV77VyEh6qGthUUTNsh1BYqbHnCqqZxHvupEba6cvKROEPp1ktFIQaT2h
         SYMy1Y7fqb5Q2MGd07IrFKkkbbVS9zW40e8QiU2MjhA7KEnIt+1nIONtsBtovYudVOkF
         KOe83iBmjVRnU1TGugTHmubnbKv5HX+kvmTb9H1sqqCT+jQBBH4ATeQoTzEBVDalByJU
         nZyTdhdiFU/brws2oqVNFXOHMd0f/kd8HeQ7bQEA3RFce3GQ2RUhwm+WwKwfZAWXz60D
         cna3r1q8zgT24omzfIIUgELcS9QvfmLmvDXHIZbBDVPeg7KPkELvkIjUtWlugZ51M0HJ
         Q3dA==
X-Gm-Message-State: ACgBeo3c32IQaaHt50i4nmI4uFQwJo7zhtpPwan4JZbO8TcjHo/sR/wn
	zhCauT3ACHAxB8oEJYHPAYY=
X-Google-Smtp-Source: AA6agR5q4ITliuREdqBZMGN+ngSPk5+CneCGqoC3bxyecQ+Oy/RJSsdqRjd7lrglFQLV9L2r1hKpvg==
X-Received: by 2002:a05:6000:1a88:b0:222:ca4d:f0d2 with SMTP id f8-20020a0560001a8800b00222ca4df0d2mr13922194wry.610.1660711432645;
        Tue, 16 Aug 2022 21:43:52 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v2] xen: x86: remove setting the obsolete config XEN_MAX_DOMAIN_MEMORY
Date: Wed, 17 Aug 2022 06:43:33 +0200
Message-Id: <20220817044333.22310-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1

Commit c70727a5bc18 ("xen: allow more than 512 GB of RAM for 64 bit
pv-domains") from July 2015 replaces the config XEN_MAX_DOMAIN_MEMORY with
a new config XEN_512GB, but misses to adjust arch/x86/configs/xen.config.
As XEN_512GB defaults to yes, there is no need to explicitly set any config
in xen.config.

Just remove setting the obsolete config XEN_MAX_DOMAIN_MEMORY.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/x86/configs/xen.config | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/configs/xen.config b/arch/x86/configs/xen.config
index d9fc7139fd46..581296255b39 100644
--- a/arch/x86/configs/xen.config
+++ b/arch/x86/configs/xen.config
@@ -14,7 +14,6 @@ CONFIG_CPU_FREQ=y
 
 # x86 xen specific config options
 CONFIG_XEN_PVH=y
-CONFIG_XEN_MAX_DOMAIN_MEMORY=500
 CONFIG_XEN_SAVE_RESTORE=y
 # CONFIG_XEN_DEBUG_FS is not set
 CONFIG_XEN_MCE_LOG=y
-- 
2.17.1


