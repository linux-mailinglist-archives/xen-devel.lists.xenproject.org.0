Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AA5A35DF2
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 13:55:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888780.1298079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tivDt-0002DM-Ps; Fri, 14 Feb 2025 12:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888780.1298079; Fri, 14 Feb 2025 12:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tivDt-0002Bj-Mb; Fri, 14 Feb 2025 12:55:13 +0000
Received: by outflank-mailman (input) for mailman id 888780;
 Fri, 14 Feb 2025 12:55:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3HxR=VF=gmail.com=gragst.linux@srs-se1.protection.inumbo.net>)
 id 1tivDs-0002BK-Et
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 12:55:12 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed289772-ead2-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 13:55:11 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-309191eec90so10747231fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 04:55:11 -0800 (PST)
Received: from epuakyiw0a98.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091027666fsm5765871fa.79.2025.02.14.04.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 04:55:08 -0800 (PST)
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
X-Inumbo-ID: ed289772-ead2-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739537710; x=1740142510; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gaOx8GcFyulFp9T3u8O5LDFGaqEM8urce81Q0YZHQYQ=;
        b=NT7FVIBMQrPfZeOYqGL5qHDn7fx0H9VxZr9Wykb0WFHYXjIJHqJVI/UrKnaQ+O8C2O
         8LjJdd0LKushgILLCMlJDRJtX7jwyZCGQXWS82X3RviO0zeB8DC9TfXIXilSKPY6oFo5
         b9b1Nz/gyeDkB7vejrVoDNTUAfi7bOligGj+G9fElZvihdLVkkUwmbE8xQ+yPcvGbFsw
         6Y2QK9CUs/l8swApMEqUf/yOQhquPYKydBgaG/oN8Ts4FSwSLKHBe+IRr+2RTsJXwEc3
         FJSY73cKOmlObr68tQ8g3bLqi56jXT8Yts7Mz6bSjXi+VNKDqbWlF1BlprM6rqXdFq05
         V7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739537710; x=1740142510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gaOx8GcFyulFp9T3u8O5LDFGaqEM8urce81Q0YZHQYQ=;
        b=hqqNvAEEuknBEOHHihtP+fXG3DCGPRlci6smUXzUWV2mjHp5igz+DTR4hdMB3L3ajO
         Ty5ZqOubPU8djtChppl6SQlBK76/vzhKIOaWNO+5A8kQzWj5dJ+F5h7iK6dMsh5U//QN
         wc91Euf5qNuhuXn0RSDOFOpwhaD5Rcha9Atjf9T/RKh0wu4jXpDWm+iafjENkDwJD4yH
         F5r1VNjz3mwOeZqQz46VGHDqTpRXG4PuHD3yda0doEzGUl3UgJCOYhcnWWyugSqTFRo9
         nHAd6YKcRpYzrUqtzp0teTbDTuDYTijeIsmcBdNWxLBZqAJCXaXUI4oBEzviVryABZgZ
         HjZw==
X-Gm-Message-State: AOJu0YxgwMGUQvB9E1yUMyL07bws4nW1ZDjlcAvEjSgRwX0QB/cKfEl4
	7/xBfCvYVAj3sLaUYuZwyxBb3Xmyl113GSEhX4BswTN19T54bILjtyti3Q==
X-Gm-Gg: ASbGnctOmT/VtCjj+/Mm95whoA+YaDvgsFcyI2MYW+UDHodkhezCe4ZB/V/VFXHaG4t
	/yRdzCSTrey5EDlQx+G2a+ugvAaldoXesrwwNjlIFxhS0URwKPP398k69HMPOLBUOBsexIYrzNQ
	Yxb2CNjoYQLcNTiAJKVvlKLX7pk2kkRGNskKN8TV1msKNhe5gCMUz9A7FFRY5AnlekE86I8MnDF
	gz55b9uCFrnvVeU6Gy9UiK3J+dGoFLt1auTXxFVNfrHooEFyD90TggUAE7orDB46qSoPgw1vTp2
	Ui1uNcJ+JtwdpXvmjqKKoJpQ1uXnV9EeQMbJ7Ks9wqu5fgo0rDFTY3ADM55H1O0v2m/FMJiYPA=
	=
X-Google-Smtp-Source: AGHT+IGxJ6QuKVe3IKuCrz/Rn3QA/qHPBOPmtJXBeB3vOYxOTxnxOtypFqRHdAkFVsOl8NPGsmIE7Q==
X-Received: by 2002:a05:651c:4005:b0:308:f4cc:9519 with SMTP id 38308e7fff4ca-30914801772mr10994911fa.5.1739537710169;
        Fri, 14 Feb 2025 04:55:10 -0800 (PST)
From: Grygorii Strashko <gragst.linux@gmail.com>
X-Google-Original-From: Grygorii Strashko <grygorii_strashko@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [PATCH] xen/arm: fix iomem_ranges cfg in map_range_to_domain()
Date: Fri, 14 Feb 2025 14:55:05 +0200
Message-Id: <20250214125505.2862809-1-grygorii_strashko@epam.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now the following code in map_range_to_domain()

res = iomem_permit_access(d, paddr_to_pfn(addr),
                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));

and

res = rangeset_add_range(mr_data->iomem_ranges,
                         paddr_to_pfn(addr),
                         paddr_to_pfn_aligned(addr + len - 1));

will incorrectly calculate end address of the iomem_range by rounding it up
to the next Xen page, which in turn will give Control domain access to
manage incorrect MMIO range.

For example, requested range:
  00e6140000 - 00e6141004 should set e6140:e6141 nr=2, but will configure
e6140 e6142 nr=3 instead.

Note. paddr_to_pfn_aligned() has PAGE_ALIGN() inside.

Fix it, by using paddr_to_pfn(addr + len - 1) in both places to get correct
end address of the iomem_range.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---

Hi All,

I have a question - the paddr_to_pfn_aligned() is not used any more,
should I remove it as part of this patch?

 xen/arch/arm/device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 5610cddcba8e..5e1c1cc326ac 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -71,7 +71,7 @@ int map_range_to_domain(const struct dt_device_node *dev,
                      strlen("/reserved-memory/")) != 0 )
     {
         res = iomem_permit_access(d, paddr_to_pfn(addr),
-                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
+                                  paddr_to_pfn(addr + len - 1));
         if ( res )
         {
             printk(XENLOG_ERR "Unable to permit to dom%d access to"
@@ -107,7 +107,7 @@ int map_range_to_domain(const struct dt_device_node *dev,
     {
         res = rangeset_add_range(mr_data->iomem_ranges,
                                  paddr_to_pfn(addr),
-                                 paddr_to_pfn_aligned(addr + len - 1));
+                                 paddr_to_pfn(addr + len - 1));
         if ( res )
             return res;
     }
-- 
2.34.1


