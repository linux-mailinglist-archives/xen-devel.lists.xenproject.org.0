Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F12A39A9F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 12:23:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891271.1300333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkLgr-0001lG-8M; Tue, 18 Feb 2025 11:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891271.1300333; Tue, 18 Feb 2025 11:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkLgr-0001iH-3G; Tue, 18 Feb 2025 11:23:01 +0000
Received: by outflank-mailman (input) for mailman id 891271;
 Tue, 18 Feb 2025 11:23:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zT3d=VJ=gmail.com=gragst.linux@srs-se1.protection.inumbo.net>)
 id 1tkLgq-0001hv-4Z
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 11:23:00 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b53750a2-edea-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 12:22:59 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5452e6f2999so4185370e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 03:22:59 -0800 (PST)
Received: from epuakyiw0a98.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309284a50a0sm13506041fa.72.2025.02.18.03.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 03:22:57 -0800 (PST)
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
X-Inumbo-ID: b53750a2-edea-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739877778; x=1740482578; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2UfKXcwbscxOijN5K+Dkm7PEbfymn+GmS4cO23WVsA=;
        b=Gdh0jnPjDWIMkEUfy3U2nr1+Ch+5LxS2WvaylDIovKiQFlnEsJ4K6r2Kvjz0CUMOq3
         /fbLpczER6Ksy5LB73iWqVG0jtsXMh2giyd0RFf1Wp4lpUrf/jaGLnY13UCcd0pEppf+
         +IX7ESeRHuQ9rlkcrTHpjcvEHhhp56cQoOoQkzI9HSfjibSPDqCc64c+m4uvqjPgVRYU
         9XGKm4tI2ryyA6TKR7kIkWgRED5P15jERJLlE4ZaLL5hJuZKMvBW1dnSOhi62iBtxvuQ
         Qh71k+BIasRv93ClhU5w3VIgd/rwTeX4T9YLipIxA64dqLsLnG+CzQV1PbVxYGQo4lFi
         DnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739877778; x=1740482578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2UfKXcwbscxOijN5K+Dkm7PEbfymn+GmS4cO23WVsA=;
        b=A1Sv0SEcKiExDRIo95vnbN77USe32fupr/FSaTDzCSY8yoB0auYLtE54T2/KRMVKfH
         Bo+189wpA4yoiTZh0mRzyzsZd0epmMdv4M3odcPCbtCZ9de+jS5MBmSonvUnkqFDAw4e
         75ZQfQk5PHj4VDSC3fzTboWOud/UzlmPn+6KaaTeBcEOjyuTolXlnf8FMCEwHuNIJZJs
         7lMoO8AJyhcsJiskqQ0uBMoGIl+Qd4GU9L+gDWjdO09q9Rq0IuzELezo9D+3I01/2hir
         tOZDPeirDR8mHZJylUPYPJSRCj9Yokh//B2h0h0UZKQ83UZZNaHRQkEMRxk5Ac89PVDa
         gS9w==
X-Gm-Message-State: AOJu0Yw3LsRQkjbsHsdXnY67NmdVz7Vs5OR6YJi+BwxNKMUF1aNCC5y9
	DSE48fAE6v+FDLCCAUSX8zd3n1TScyGLs6ny+HLGryBFDkm1y5TGXkgQ9Q==
X-Gm-Gg: ASbGncs18SCTootTHE6yk2J/3fMm9ly/VSPmJ0bKrndy1rPBAQU6zWZw9gSOX2yRFhu
	xxu8mo9dh7Wp5A0ezky7uHA+mlhVHFSI3QBWUKAQrdOys4jGwtpt6o4w2h193DD2kdhGQEQT+qA
	aVmSOnKs/fYqrrubrXY795b2OCuLDIWNxuAFrmhuEDomMDkB1OpnZCrYLP9vcRqNpidDrGvOesh
	DNTM4w1iK5/RjROB3ZtKX+cXFeKkIV2gr3SU/S3TEIWZ1UDrCl/EW5WLiO1jHlU2TchZjQ3cvom
	qGMly/hK7gqsrOFjB9sHvj05WyNi0568/Bvr9W4LMe/Es61fUZQfPnR74E42vBN3iv1jOa+r3g=
	=
X-Google-Smtp-Source: AGHT+IHkt8UhkVgebwJ7mq3LJTI0wumOoxz7qpXcr2Vbt7nwSmE7cdV5bNldh43EEGGfVxH5k4y9/A==
X-Received: by 2002:a05:6512:2356:b0:545:2d03:d107 with SMTP id 2adb3069b0e04-5452fe6af28mr3562332e87.40.1739877777828;
        Tue, 18 Feb 2025 03:22:57 -0800 (PST)
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
Subject: [PATCH v2 1/2] xen/arm: fix iomem permissions cfg in map_range_to_domain()
Date: Tue, 18 Feb 2025 13:22:52 +0200
Message-Id: <20250218112253.3136505-2-grygorii_strashko@epam.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218112253.3136505-1-grygorii_strashko@epam.com>
References: <20250218112253.3136505-1-grygorii_strashko@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now the following code in map_range_to_domain()

    res = iomem_permit_access(d, paddr_to_pfn(addr),
                    paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));

calculates the iomem range end address by rounding it up to the next Xen
page with incorrect assumption that iomem range end address passed to
iomem_permit_access() is exclusive, while it is expected to be inclusive.
It gives Control domain (Dom0) access to manage incorrect MMIO range with
one additional page.

For example, if requested range is [00e6140000:00e6141004] then it expected
to add [e6140:e6141] range (num_pages=2) to the domain iomem_caps rangeset,
but will add [e6140:e6142] (num_pages=3) instead.

To fix it, drop PAGE_ALIGN() from the iomem range end address calculation
formula.

Fixes: 33233c2758345 ("arch/arm: domain build: let dom0 access I/O memory
of mapped devices")
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/arm/device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 5610cddcba8e..97e613e06afa 100644
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
-- 
2.34.1


