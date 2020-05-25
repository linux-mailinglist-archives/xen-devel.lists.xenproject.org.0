Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9101B1E10EF
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 16:47:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdEMt-00022P-JJ; Mon, 25 May 2020 14:46:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AvLo=7H=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jdEMs-00022K-Gn
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 14:46:18 +0000
X-Inumbo-ID: 7da9c308-9e96-11ea-9887-bc764e2007e4
Received: from mail-oi1-x242.google.com (unknown [2607:f8b0:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7da9c308-9e96-11ea-9887-bc764e2007e4;
 Mon, 25 May 2020 14:46:18 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id s198so16193373oie.6
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2020 07:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2HoAMOZQ3HefgrNkWv0E4FEusKuZTEg4JrxhK22N/y8=;
 b=ReMeZAzm0OhxA9ZFrXFaIJr4A7AitXK67M1nc1DIMnZVm4rsNnGd6GLwpZssIvlK4S
 RIPBPFac6YVzcojeIYwVYfj7eX8C7Uupl5wQaCticSg8T635U3MmG0VMYUNrNvDuFx8b
 1is+wqVRsnUSMPL9ZeXcz2OZMxBMVVDJ8/75uiVZbbaP20EasdKrKI7lwjuOTOJuyudb
 eOL0ob+v74UyXOV8Qb0UNpIPKIKJiEfmZnQi72RfoIAg0tRdGQiofKhuVneht52NP78W
 t5bFmFUD6EbsF8WKc4xOPzF3+iZCSMf2OWH0BDbHN/na+vHsKZyIdCsmvw58H8hXe/uZ
 dr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2HoAMOZQ3HefgrNkWv0E4FEusKuZTEg4JrxhK22N/y8=;
 b=Q3KgA1XVWFu6exGJWM6ASu1DzQwmLRqDRNB537ZntNglBf/eK7spb6oaMhoIvIW7an
 GwN+rD9FoPB7VMqsCPkuw94fMlfvgCAmSEFYu5CgOV/GuCeRQQ1eD3Uof8queLWkfd90
 n5jvNuXJoR5nBePBvmYRrVT9iYqAyHWDE+2YnEEjY61ExD9ECrRNT6a/73deNslv0Tes
 3p09OqIhoRd+tCiLhOhvmlerWhXShoxUXfCV/XpaeCqLY3lyEgMUgGZcmkewGRJgQnKs
 kCXSGFQtV7ZLZlA94hs04cB6QLhk3fskIu56DxzRc3RiPtxEI7zX1p3EtNSyWbEh839S
 2Fuw==
X-Gm-Message-State: AOAM531GNH3DvdcUvWp+Vujw5HLzyYIy/3D4aaxMDzOQs4/zQ5P6I9XR
 HXp3H/SYwfhy50sOQzakqxxRW6gg
X-Google-Smtp-Source: ABdhPJzwhYnhhOJL1Gojw7XS0y1IEPkHFTcDYYY1DCzZz6LbJNmwj/AxkU0NJSTJ2j2tzilQmSQ9ZQ==
X-Received: by 2002:aca:c594:: with SMTP id v142mr11228598oif.66.1590417977063; 
 Mon, 25 May 2020 07:46:17 -0700 (PDT)
Received: from t0.lan (c-71-205-12-124.hsd1.co.comcast.net. [71.205.12.124])
 by smtp.googlemail.com with ESMTPSA id s124sm5327251oig.19.2020.05.25.07.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 07:46:16 -0700 (PDT)
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
X-Google-Original-From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] x86/mem_sharing: gate enabling on cpu_has_vmx
Date: Mon, 25 May 2020 08:46:06 -0600
Message-Id: <20200525144606.126767-1-tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Tamas K Lengyel <tamas@tklengyel.com>

It is unclear whether mem_sharing was ever made to work on other architectures
but at this time the only verified platform for it is vmx. No plans to support
or maintain it on other architectures. Make this explicit by checking during
initialization.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/arch/x86/mm/mem_sharing.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 7271e5c90b..19922ab5d1 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1444,7 +1444,7 @@ static inline int mem_sharing_control(struct domain *d, bool enable,
 {
     if ( enable )
     {
-        if ( unlikely(!is_hvm_domain(d)) )
+        if ( unlikely(!is_hvm_domain(d) || !cpu_has_vmx) )
             return -EOPNOTSUPP;
 
         if ( unlikely(!hap_enabled(d)) )
-- 
2.26.1


