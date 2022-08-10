Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E5D58E691
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 07:08:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383324.618489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLdwX-0005T5-TU; Wed, 10 Aug 2022 05:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383324.618489; Wed, 10 Aug 2022 05:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLdwX-0005RL-P6; Wed, 10 Aug 2022 05:07:45 +0000
Received: by outflank-mailman (input) for mailman id 383324;
 Wed, 10 Aug 2022 05:07:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CIQX=YO=gmail.com=lukas.bulwahn@srs-se1.protection.inumbo.net>)
 id 1oLdwV-0005Qe-R2
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 05:07:43 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d14d5cf-186a-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 07:07:42 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id w19so25699354ejc.7
 for <xen-devel@lists.xenproject.org>; Tue, 09 Aug 2022 22:07:42 -0700 (PDT)
Received: from felia.fritz.box
 (200116b826504800504e9aff21bf95aa.dip.versatel-1u1.de.
 [2001:16b8:2650:4800:504e:9aff:21bf:95aa])
 by smtp.gmail.com with ESMTPSA id
 ew12-20020a056402538c00b0043bbbaa323dsm7009781edb.0.2022.08.09.22.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 22:07:41 -0700 (PDT)
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
X-Inumbo-ID: 5d14d5cf-186a-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=WsXcmjBQTbbS4kpYY9SBHjgMTL8/jvQNRCwa0TQb/Dw=;
        b=Mv1ccTu9Pt7/8Od4hcaLuLZygPfFa1idQh4Iwor2NDR/berSoqrpXJla+nyBiiGbr3
         h3UKWCuKMcyIMtS989oOv41ozNXbnk/WtywEAN7OcoerrgnnR1KtA//X8kaDTpzAhekZ
         Bwj+qhKRj2694wPxYZussIJtV2Q4LxbutLacyKcUD8j9T4GJWPjqvTCp0jjDoJGA/L6T
         FvMZmq4T7WUv/dwkaF5zWQmKwkafAwCyrzU0+7Aok6GAv03naIFweHysXUuondhs+tFi
         ko08cm0RQP+mEek+uFcwOIZrPZRMCjtbxMSVHeoKONP17wKwbx5AkYB+xGtHEQzXCLtX
         +7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=WsXcmjBQTbbS4kpYY9SBHjgMTL8/jvQNRCwa0TQb/Dw=;
        b=kRvlk7KdFB9FFuWY7iQfNACyWl8Z0cJHDePV2vV74oDRRhjSmUXkSZR3VO0pNDOXOt
         1u6CSZcM7H0eibk7BOdoLJIoynBlAMkN7qiHOx9CUHND/uSn0viYyICC18nkJwuz1Hvo
         z2sJH6foBE6Hs13JuDQqdQztstY08wNsZodKTFqpV9Gy+LvQ9Mw+c1JCVTYAGhY91yfv
         EwBmrgYCCJW1WK9helC8LjaepTE+mlTzKy2g5T43bAp3xHazqVj+khp31CknMSpJbIjq
         G7cs7/e3gvYjUWtHYoTqelIV/rfFl2aHNQZUgLo2GaJbFe3UC6SHb6kyXwPcsawKvD/A
         MNCQ==
X-Gm-Message-State: ACgBeo1vEeyUcCl/v/D4RgteQHnfrngcVDzBZrX4yxvEFMrSl1IpDxbt
	liXConOCFONVeBeoO7C801wVXo2n7dM=
X-Google-Smtp-Source: AA6agR7yLzaBfBvPVm44Z2rLdVtw/TzNrHXYRUe4nMa+MCuJoOnDFeBpiEiZup/g1QpSARwuyVKKVw==
X-Received: by 2002:a17:907:1c24:b0:731:59f9:1b3f with SMTP id nc36-20020a1709071c2400b0073159f91b3fmr9018203ejc.595.1660108062166;
        Tue, 09 Aug 2022 22:07:42 -0700 (PDT)
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
Subject: [PATCH 1/4] xen: x86: set the config XEN_512GB after config change
Date: Wed, 10 Aug 2022 07:07:09 +0200
Message-Id: <20220810050712.9539-2-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220810050712.9539-1-lukas.bulwahn@gmail.com>
References: <20220810050712.9539-1-lukas.bulwahn@gmail.com>

Commit c70727a5bc18 ("xen: allow more than 512 GB of RAM for 64 bit
pv-domains") from July 2015 replaces the config XEN_MAX_DOMAIN_MEMORY with
a new config XEN_512GB, but misses to adjust arch/x86/configs/xen.config.

Adjust this config fragment now.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/x86/configs/xen.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/configs/xen.config b/arch/x86/configs/xen.config
index d9fc7139fd46..8a6c88f48e75 100644
--- a/arch/x86/configs/xen.config
+++ b/arch/x86/configs/xen.config
@@ -14,7 +14,7 @@ CONFIG_CPU_FREQ=y
 
 # x86 xen specific config options
 CONFIG_XEN_PVH=y
-CONFIG_XEN_MAX_DOMAIN_MEMORY=500
+CONFIG_XEN_512GB=y
 CONFIG_XEN_SAVE_RESTORE=y
 # CONFIG_XEN_DEBUG_FS is not set
 CONFIG_XEN_MCE_LOG=y
-- 
2.17.1


