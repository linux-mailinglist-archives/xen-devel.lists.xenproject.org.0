Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F919A39AA1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 12:23:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891273.1300351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkLgs-0002CU-KO; Tue, 18 Feb 2025 11:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891273.1300351; Tue, 18 Feb 2025 11:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkLgs-0002Aq-GZ; Tue, 18 Feb 2025 11:23:02 +0000
Received: by outflank-mailman (input) for mailman id 891273;
 Tue, 18 Feb 2025 11:23:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zT3d=VJ=gmail.com=gragst.linux@srs-se1.protection.inumbo.net>)
 id 1tkLgq-0001hv-QY
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 11:23:00 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5a922b7-edea-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 12:22:59 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-30a2cdb2b98so21169821fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 03:23:00 -0800 (PST)
Received: from epuakyiw0a98.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309284a50a0sm13506041fa.72.2025.02.18.03.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 03:22:58 -0800 (PST)
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
X-Inumbo-ID: b5a922b7-edea-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739877779; x=1740482579; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzhIZ6SXkdTvU5lgin4POwGmtoXFe1fzCIMTEQH7SN8=;
        b=hkKQ71dLG0OiDpK1h6mk9S8tNqIZlRVywtzoNu4Ovf4y6mXpKIqbOmbFRxtNTxsD4x
         gfz/5vUKUv5GUFft86jakhRubqClYDp/MsJvQ1GeGEC6FaJbInKBT40Nnho+gPovuZQW
         YunFSWAIBBZ5W0SUMSeFagILiagf9Jw43hS9cb4dbKDtZK/guLRE4cfUv82nZbv84web
         CUTbXeYdiBbHjbvwVUVLcij03u4nqETtgL5Xv54dubErvsMfuCu+pTsXqMB9W36QRUjT
         RgucQhmIFCdyI16O0noVdezYefMEklYaHpKdfj7tO6BANkhx6ZysE3TAFqnoSA6uNsP5
         dZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739877779; x=1740482579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzhIZ6SXkdTvU5lgin4POwGmtoXFe1fzCIMTEQH7SN8=;
        b=G3nxZ+LQVLj9qZIJec3NdpbXpKcvzFx5kBmsfJqey+fe3TAKlvjKERtJyuJu1wZLOO
         uJ9xd4c+BWagqn4/mfOYlX8NRIt60rK93vyRUDfeUJOoAY7KVB5KkUmfxJY/toSjx+GM
         FEUevwqXeATUb69913M4fwg2smO7Hmr33pPZ80namPinbgog71rhCISUQwYnW0rDGjYf
         XssIL7WPX8kT4bLft4E319GBXDt2wlOveW6/fH9/QMlh73+ALCeMc+iYEfOpWlXkc4bs
         qf0e3jYXSsoeq/+S6ZYqgEd0ParD9FPyLIeRW3Pnm//IJaxOsV8+xlH4DZgIK6ZM0Kxw
         DypQ==
X-Gm-Message-State: AOJu0YzqW8IouXTwiz3xqXZmf/3sjDwUIdsz3T2MxdsAGdriVSxAKSsW
	1PMq5SYLuNOydVq5rjjj60GWhhvWWJyoneQs0groBC4t6YWtuUJNPv4knA==
X-Gm-Gg: ASbGncttBJYzH+cPia6f4g8PhnM0N3Ap/Jmaxp6M/H4sbR8n1DrUxIod1FVbUXxDuyQ
	K+e9qo/H1QNHryN4evh+sVn3tnuWp0sXuEqwTdNA1fsOV0DVn2N44fS4e0u3L/DwYWkmL7NssJL
	iepcbHjIum1NOr6cUCNWTCJ5N7ro8HF4KyJoFO7wWZhaHyFZJ2L3gft6Dox6/eXN8v0odau1W4J
	levBfrW9lZn+scObv8vfnTBw/oFHLlO+vbmR/jiReYh1bUiUJ/RH9sE8a2oVoZrF3OLtt+sQxN8
	xTfDcPSSA2AnWYWWVBtjziYG1Z3LwTSjayPEuyrHm54d0KFcgayLMEVhnGpxywpi+IhdrQUwnQ=
	=
X-Google-Smtp-Source: AGHT+IEAuGbms+OocApkdFjXFQYNwlotRYMd2IUjfxzRoGa8HyQdifxXd8bfg+KhkBNUwMG04xq6lQ==
X-Received: by 2002:a2e:850c:0:b0:308:ec50:e841 with SMTP id 38308e7fff4ca-30927b1e20emr42164821fa.25.1739877778985;
        Tue, 18 Feb 2025 03:22:58 -0800 (PST)
From: Grygorii Strashko <gragst.linux@gmail.com>
X-Google-Original-From: Grygorii Strashko <grygorii_strashko@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [PATCH v2 2/2] xen/arm: fix iomem_ranges cfg in map_range_to_domain()
Date: Tue, 18 Feb 2025 13:22:53 +0200
Message-Id: <20250218112253.3136505-3-grygorii_strashko@epam.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218112253.3136505-1-grygorii_strashko@epam.com>
References: <20250218112253.3136505-1-grygorii_strashko@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now the following code in map_range_to_domain()

 res = rangeset_add_range(mr_data->iomem_ranges,
                          paddr_to_pfn(addr),
                          paddr_to_pfn_aligned(addr + len - 1));
 where
  paddr_to_pfn_aligned(paddr) defined as paddr_to_pfn(PAGE_ALIGN(paddr))

calculates the iomem range end address by rounding it up to the next Xen
page with incorrect assumption that iomem range end address passed to
rangeset_add_range() is exclusive, while it is expected to be inclusive.

For example, if requested range is [00e6140000:00e6141004] then it expected
to add [e6140:e6141] range (num_pages=2) to the mr_data->iomem_ranges
rangeset, but will add [e6140:e6142] (num_pages=3) instead.

To fix it, drop PAGE_ALIGN() from the iomem range end address calculation
formula and just use paddr_to_pfn(addr + len - 1).

Fixes: 57d4d7d4e8f3b (arm/asm/setup.h: Update struct map_range_data to add
rangeset.")
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/arm/device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 97e613e06afa..5e1c1cc326ac 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
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


