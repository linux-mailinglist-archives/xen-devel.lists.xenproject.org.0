Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A695646F540
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 21:51:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243370.421000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvQNR-0000lf-MJ; Thu, 09 Dec 2021 20:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243370.421000; Thu, 09 Dec 2021 20:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvQNR-0000jP-Ig; Thu, 09 Dec 2021 20:50:53 +0000
Received: by outflank-mailman (input) for mailman id 243370;
 Thu, 09 Dec 2021 20:50:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3OcP=Q2=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mvQNQ-0000jJ-UU
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 20:50:53 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b223f3ba-5931-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 21:50:52 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id bi37so14379972lfb.5
 for <xen-devel@lists.xenproject.org>; Thu, 09 Dec 2021 12:50:51 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k14sm92114ljk.57.2021.12.09.12.50.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Dec 2021 12:50:51 -0800 (PST)
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
X-Inumbo-ID: b223f3ba-5931-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=c7rEPVFGeOVQOu8et9RCZV/Fdgh4YwILeYNJTSSEFWw=;
        b=m0NNJ+w8FJDSmroO2qAqhhO++3f/rLWSZf+VFBBdx+srrI8rhnxyIn7wXd3bm7Zlj/
         /oxPGn4pFEC4nADagsD6H+naRPj8bDmeJNSTfGY9WkHLrm0bXkDcOPEWatjzB7hNXKT4
         vXEpLjILxyxyUU1PDwAmO4UK+8wQia9GW1Aoc5IqqmFi7/+2wvYMtVO+u4cQoFRH0aS+
         63/luulRny06i7fpgeQlSGdAQvzpoGUIVVB1tn6Ny+06ms35GbCkl+joQCREg6q3HqlR
         6O/MeeMGRc5KQeaWl6U+CCG/XUoAMdna9/Wc1gVtYpb107kJ+uMeQNu/117I8eIyyL78
         fBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=c7rEPVFGeOVQOu8et9RCZV/Fdgh4YwILeYNJTSSEFWw=;
        b=zzOT59JVV3FRRgGfyYN9qlji+tlWRcnwzv6o9Dkqd3Yj+AlW6miGhfkdEVf2sPAsgZ
         r6THBT48sPh4TsT6+dCvqdIjMnGFpvDCw8cmsu3F36fwimcJqfTi82lufujYBMstcRjk
         o2A/az7WyMVRzmp6j8qDPc7vkE/eTw2rOiipHRTslKHsmukDkY/aAYOXBmpzHZXh6kCB
         zsuENBPPB9HVIR1Eg4U7Y85I1gxe3dezIJHwTHhpD2DXEqk5de/Wszfp7dEgK8A76lbl
         jPSlXAMdMOzUO8ES/f3IDaXWLu+7tnSGBmD8VmmR4PQFyWKCSEXuaIKHEQ8yaB/MTycy
         fLhA==
X-Gm-Message-State: AOAM532T+xg7wWBg9lslItLGYdsS7eeu/DjnCAF/7w0AYhSieakylqqh
	SnKK1kxIAldr/feDStpSRID7K/asr+YNPQ==
X-Google-Smtp-Source: ABdhPJxeTUkQ2fexeJ93/pViqnDCun/x8scnvVRP+lJM7jL1LBTnWTF/CndpKxNKW3xueVE4Lrfhvw==
X-Received: by 2002:a05:6512:3324:: with SMTP id l4mr7824928lfe.302.1639083051292;
        Thu, 09 Dec 2021 12:50:51 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] arm/docs: Drop mentioning of ACPI for properties under "hypervisor" node
Date: Thu,  9 Dec 2021 22:50:50 +0200
Message-Id: <1639083050-31782-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Remove the following sentence:
"This property is unnecessary when booting Dom0 using ACPI."
for "reg" and "interrupts" properties as the initialization is not
done via device-tree "hypervisor" node in that case anyway.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 docs/misc/arm/device-tree/guest.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/docs/misc/arm/device-tree/guest.txt b/docs/misc/arm/device-tree/guest.txt
index c115751..2b974bb 100644
--- a/docs/misc/arm/device-tree/guest.txt
+++ b/docs/misc/arm/device-tree/guest.txt
@@ -15,11 +15,9 @@ the following properties:
   or equal to gnttab_max_grant_frames()).
   Regions 1...N are extended regions (unused address space) for mapping foreign
   GFNs and grants, they might be absent if there is nothing to expose.
-  This property is unnecessary when booting Dom0 using ACPI.
 
 - interrupts: the interrupt used by Xen to inject event notifications.
   A GIC node is also required.
-  This property is unnecessary when booting Dom0 using ACPI.
 
 To support UEFI on Xen ARM virtual platforms, Xen populates the FDT "uefi" node
 under /hypervisor with following parameters:
-- 
2.7.4


