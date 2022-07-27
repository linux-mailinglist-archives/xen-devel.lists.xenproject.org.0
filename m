Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1428F582EE9
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 19:19:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376388.609117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGkgT-0005rf-Rf; Wed, 27 Jul 2022 17:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376388.609117; Wed, 27 Jul 2022 17:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGkgT-0005pd-OJ; Wed, 27 Jul 2022 17:18:57 +0000
Received: by outflank-mailman (input) for mailman id 376388;
 Wed, 27 Jul 2022 17:18:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTNG=YA=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oGkgT-0005pW-4W
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 17:18:57 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31dae75d-0dd0-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 19:18:56 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id f15so13868880edc.4
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jul 2022 10:18:56 -0700 (PDT)
Received: from uni.router.wind (adsl-141.176.58.226.tellas.gr.
 [176.58.226.141]) by smtp.googlemail.com with ESMTPSA id
 k14-20020a170906578e00b0072f03d10fa0sm7826551ejq.207.2022.07.27.10.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 10:18:54 -0700 (PDT)
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
X-Inumbo-ID: 31dae75d-0dd0-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6dc4z0oKWGxuRUkvqyuKc5/mNW97MFIan+sLcG8xT44=;
        b=hyHH8GyxXttS+QeEhdoDw4/erFOXrx6xBxlE5c0sdMZ6CG2yTJVIi+Dr2H/Qzq8KMn
         gfLY1vIcUBEXq81y+UKbnv3q1fZYXDRS+lpxuS4UVaWaO8KgIvF2hnS06qDs2UOmyvV0
         3X59ibFyNGewcmMUPSbat6xyspvGNPwCK5BMHlA/FAdPnB3cpe0EM7BJ9dnSa8G2XSra
         w+wUX1qGq0yIgXGecMrCEF4F6Udob5BgsD4DLn01uFX0yv0LoDJBYfRvgPVXGIbl82Hd
         TIjnCOBXSwuxry89AKpmFw7zyf1tsAoQsiLLTG5pZVW4mledMydNAxSPBO+0zPTkOtzB
         ia7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6dc4z0oKWGxuRUkvqyuKc5/mNW97MFIan+sLcG8xT44=;
        b=Q4djabd9ELD5rKlbjDZqBPgwto6al6qz7o9RqN/SbydfX8Dtj8jeli4er23dmmNHYy
         xU6YAJ9hBdejZfNaYUNa5PKgYW0FoVbEgN+/6IcQbFCtN7+mkmHyygtMtpql5fwFBqvu
         2JIn1Bb5Ce2a43zzGIqmvfOx7GTvXmDrAPOW0SlEMKttpOUgi3bsBlc/vnxAtgGvTKlx
         0AQa8+/R3UduiHe1Uj6JvJ/ttJ3DL6R5nofFz1ou0M5J5eesKb2jMizQV4gdWlEZP414
         mavUjQdfvdHHAh7RDXEPnVRykJ2lN5uiD6/7Q/KiLek8KRVZ4ftn0e846IsVIk9+SzHt
         Uimg==
X-Gm-Message-State: AJIora91k5tGNfH6nBy3MWBa23vgZha/9PmmSGlfEG1YzbnVk2Qayei4
	wJtlLaTlT1g9xb2LDZsxWoBlTVcm82E=
X-Google-Smtp-Source: AGRyM1uvZH/I4fshtv90uZKvfa2I+EYfM+xq27caYRGuw7brhwyXtxKzyH/WVPU88ybx6rzsaE2nsg==
X-Received: by 2002:a05:6402:5384:b0:431:6d84:b451 with SMTP id ew4-20020a056402538400b004316d84b451mr24037645edb.46.1658942335109;
        Wed, 27 Jul 2022 10:18:55 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/1] xen/arm: asm/atomic.h: Fix MISRA C 2012 Rule violations
Date: Wed, 27 Jul 2022 20:18:40 +0300
Message-Id: <20220727171841.1163075-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes violations of rule 20.7 found in
xen/arch/arm/include/asm/atomic.h.

Changes in v2:
- removed redundant parentheses in patch 1/2
- dropped patch 2/2 that removes unused atomic_xchg() because changes Xen's
  atomic API, and such a change cannot be justified since compliance to
  MISRA C Rule 2.5 is advisory. If at some point it is decided to remove the
  relevant macro, this will be done for both arm and x86 with a separate patch.

Xenia Ragiadakou (1):
  xen/arm: asm/atomic.h: Fix MISRA C 2012 Rule 20.7 violation

 xen/arch/arm/include/asm/atomic.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.34.1


