Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF8D442C67
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 12:21:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220086.381205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhrqV-0007ic-8d; Tue, 02 Nov 2021 11:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220086.381205; Tue, 02 Nov 2021 11:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhrqV-0007gW-5B; Tue, 02 Nov 2021 11:20:51 +0000
Received: by outflank-mailman (input) for mailman id 220086;
 Tue, 02 Nov 2021 11:20:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TaM4=PV=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mhrqT-0007Zk-DH
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 11:20:49 +0000
Received: from mail-ed1-x531.google.com (unknown [2a00:1450:4864:20::531])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd5d33b0-347c-461d-959a-97eb106900d3;
 Tue, 02 Nov 2021 11:20:44 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id w1so20794365edd.10
 for <xen-devel@lists.xenproject.org>; Tue, 02 Nov 2021 04:20:44 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id b2sm8107480ejj.124.2021.11.02.04.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:20:42 -0700 (PDT)
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
X-Inumbo-ID: cd5d33b0-347c-461d-959a-97eb106900d3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Bk39DMTk2FXQwoiWFM450b+7g+0Wcb+kzWeUVJoYG8=;
        b=b9BUwypTBpyF+2iQdP7QO5dyAZ74fMgsHw+8AZG6B/NheRXBe1F2OlSWufar2omS0T
         2ofoXudprP+HphAONPoW0ERb4B0NH9lrzDqBAf1InwjwocgbbqahogO7MlQPBre/v/VV
         fhRuWbK3gPrjl/CLZE4NSgA0efXx9rpGqngaJvhkvLxKFD+xewG4F4hRq18byx2tPyS3
         zomnvWGQL09zlvW0Jlp7upwed3sScItYYBCS6HIx8ewCgnweiLY7UjNxuiLDbqoegWaT
         QitpV+GjagCbtaQLUpdLysPDXKjRuZ4/f73O0RJ5mKLyT1p30G3rmg8l2sA4Ncv+XQ6n
         DITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Bk39DMTk2FXQwoiWFM450b+7g+0Wcb+kzWeUVJoYG8=;
        b=HZYZ57imQaKHXfiLekWy2lZArluIjaLOf8fLb8JDX4ZAtBFTIJDbL005WqVzKNrNmC
         ddc3ggpnIPYKHSYTWHP+axJ2NjIi0nSCCdO1RhDhGX+h/AZ5sbIwyzvZEAZajECy9XOY
         YtamsJUbnatgYOhPvcWIsAx61GO21ulAL11BkDOO/iDTvmHEaEIDj5cv0HpCqx5C6non
         Q2LV19wngIQO1CRm4+ZsaKEduWD9tB7vS46En5HMH64v97uNvKRToSgdme5aIRZ2mFK9
         HBDrSnFyGDP/otcskIOQJfaPwmMIOwVsx5bfIivSmbsYUuvqqWccbkfpOaZ8QZn/VXur
         WTpA==
X-Gm-Message-State: AOAM530glejA9oNFc2qAyLDukft4V96kCol5sa6CcOhw9g5yzZ6DOhWA
	9H1O1cs1lrOJjRJ2ncuii5HWIf20wLGL2w==
X-Google-Smtp-Source: ABdhPJy97tx0v6AhTvxHzvJg9/7CyJTxjGGYYCc46mNOyY+e2lrhhmnyy48CV+pCaJ+0q3H4ROLivw==
X-Received: by 2002:a05:6402:47:: with SMTP id f7mr50453296edu.52.1635852043453;
        Tue, 02 Nov 2021 04:20:43 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	iwj@xenproject.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH-4.16 v2] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Date: Tue,  2 Nov 2021 13:20:41 +0200
Message-Id: <20211102112041.551369-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

While in vPCI MMIO trap handlers for the guest PCI host bridge it is not
enough for SBDF translation to simply call VPCI_ECAM_BDF(info->gpa) as
the base address may not be aligned in the way that the translation
always work. If not adjusted with respect to the base address it may not be
able to properly convert SBDF.
Fix this by adjusting the gpa with respect to the host bridge base address
in a way as it is done for x86.

Please note, that this change is not strictly required given the current
value of GUEST_VPCI_ECAM_BASE which has bits 0 to 27 clear, but could cause
issues if such value is changed, or when handlers for dom0 ECAM
regions are added as those will be mapped over existing hardware
regions that could use non-aligned base addresses.

Fixes: d59168dc05a5 ("xen/arm: Enable the existing x86 virtual PCI support for ARM")

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Since v1:
 - updated commit message (Roger)

This patch aims for 4.16 release.
Benefits:
Fix potential bug and clear the way for further PCI passthrough
development.
Risks:
None as the change doesn't change the behaviour of the current code,
but brings clarity into SBDF calculation.
---
 xen/arch/arm/vpci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 8f40a0dec6d2..23f45386f4b3 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -24,7 +24,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
     unsigned long data;
 
     /* We ignore segment part and always handle segment 0 */
-    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa);
+    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa - GUEST_VPCI_ECAM_BASE);
 
     if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
                         1U << info->dabt.size, &data) )
@@ -44,7 +44,7 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
     pci_sbdf_t sbdf;
 
     /* We ignore segment part and always handle segment 0 */
-    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa);
+    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa - GUEST_VPCI_ECAM_BASE);
 
     return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
                            1U << info->dabt.size, r);
-- 
2.25.1


