Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD880AA7723
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 18:23:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974783.1362548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAt9y-0005u1-8u; Fri, 02 May 2025 16:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974783.1362548; Fri, 02 May 2025 16:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAt9y-0005rf-5m; Fri, 02 May 2025 16:22:46 +0000
Received: by outflank-mailman (input) for mailman id 974783;
 Fri, 02 May 2025 16:22:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EvHp=XS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uAt9x-0005rZ-0p
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 16:22:45 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac7837b7-2771-11f0-9eb4-5ba50f476ded;
 Fri, 02 May 2025 18:22:42 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aca99fc253bso347466866b.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 May 2025 09:22:42 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1894c01f2sm68158766b.119.2025.05.02.09.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 09:22:41 -0700 (PDT)
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
X-Inumbo-ID: ac7837b7-2771-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746202962; x=1746807762; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/XI4d+aGEAu3W8N5OXyAiG/e9D9J/dXw/QpLzSeH60=;
        b=d2bPKH9joldNLChSA0Ien9N4z0aFxamZa4C14nbrfVfJdjPRRQcNyvwwKLn6mnliE3
         xUemhwBapCxUMutZhobflthzmjWw6HY+9hQiluv7QGuE+Yol44wzUl9h1hocXjhgR13B
         99zSVcmzOo+YUd7smVbiuLsyKgn82JdO3jGsim3mb/+Dp9RVqwWPaiiI16pHVw2JisX9
         5c3HSRna5TFTyHXHtymU7etmSG4FoHkUy9ZiAL9pPX+k5IwJvsB58THk/gm6ksey9R12
         SyFV90ZGN8d1TlKeFx0iMDvSQTNnNovGE93Im4yqajNjndVxKVeEWSKPwHd5/4LEUcoz
         cqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746202962; x=1746807762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/XI4d+aGEAu3W8N5OXyAiG/e9D9J/dXw/QpLzSeH60=;
        b=lAV8iTQAsOQM+qcLuOZ9nsLxqoPsLV9LdSFHkXTo0W1usZBpgTK7YYauXaFgdOcRhg
         u+he+kcNx//6MuTzDHTOJE1jLSvWg0VGf8XWBHv6raOvtz9cuijQTe1xrOIaDZAr9L7h
         Af/y0WmffiI4pjzeX3xXZho76sHZ2oXzUw79pDo/XWbqlHTEjDCzihNHdBjx6rk39syI
         4fNd0S3BfnxcU3npwXBvAx0Wys5llM7SCj1VwZJ4gWiHNSqSfe4YGOU0xBA/Ogq/eOwX
         YHaSeSfEPDW12Tz3W8Lpmu/2ulVlOZXyguVNZN601bKMOrmyGl1TjuZZxUQ0LoV+h/A5
         +9AQ==
X-Gm-Message-State: AOJu0Yw33NViZx9jTagSvheMpzjePsFNyfD7UXAgCc3IOAvC7s7weS10
	i16ztoxZy8otPqo2IjNVt+NIoRY0uLIAuTF6xhFScbC6ebwoVtpO6XZ/IA==
X-Gm-Gg: ASbGncv4+qJKpcC1K+DMimSGXdwMpETPiUkzJ6AOsmwo/J4fDZh873AzI1XmRcvZ5gd
	3yXcURedxS0wK0DD8/2bztAQTbjOFswrqC56SdxAO34D8igmp39m/431xlFG5VZgdmy1BJNexLD
	kd9azmDsWFHYmWh1pCKDx0t2zFA+iudAAf2DdD/DQNLGXGh+m2AQMxFIUFnPFjDG1vaaCuylnZE
	zq8jR3Y0GrQ0p/rbrVinAJ3WGFdRiF3U3WBD1xU6/8xjK9BAlVD7x3CkONm/pPa+vTX2Rs+9vr9
	AlX2Jc44a/xaysG2djXeQdrn/yGumxFbwBONp8SN7Y8QSuGZQbJV6y3ZMG9Yol3RQcQSmQL91X9
	Rg4kS188Xyu+q2PIJoMu+
X-Google-Smtp-Source: AGHT+IHcEdh3kTSRS+zA/pHD951bZuVy/SgDsrgVZMtcEdqrJOEeMR8KgJ1YDXIUD8XLa13yuN4+xQ==
X-Received: by 2002:a17:907:60cf:b0:acb:b5a4:ba35 with SMTP id a640c23a62f3a-ad17ad397d6mr372957566b.2.1746202961835;
        Fri, 02 May 2025 09:22:41 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 1/8] xen/arm: drop declaration of handle_device_interrupts()
Date: Fri,  2 May 2025 18:22:31 +0200
Message-ID: <790c29f1e564190909e74433fee5a694a1d22551.1746199009.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746199009.git.oleksii.kurochko@gmail.com>
References: <cover.1746199009.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no definition of handle_device_interrupts() thereby it
could be dropped.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Change in v3:
 - Update commit message
 - Add Reviewed-by: Michal Orzel <michal.orzel@amd.com>.
---
 xen/arch/arm/include/asm/domain_build.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index 17619c875d..378c10cc98 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -28,17 +28,6 @@ void evtchn_allocate(struct domain *d);
 
 unsigned int get_allocation_size(paddr_t size);
 
-/*
- * handle_device_interrupts retrieves the interrupts configuration from
- * a device tree node and maps those interrupts to the target domain.
- *
- * Returns:
- *   < 0 error
- *   0   success
- */
-int handle_device_interrupts(struct domain *d, struct dt_device_node *dev,
-                             bool need_mapping);
-
 /*
  * Helper to write an interrupts with the GIC format
  * This code is assuming the irq is an PPI.
-- 
2.49.0


