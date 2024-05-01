Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 736F28B9FB8
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 19:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716039.1118104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2aU5-0001po-Oz; Thu, 02 May 2024 17:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716039.1118104; Thu, 02 May 2024 17:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2aU5-0001k0-Hz; Thu, 02 May 2024 17:44:41 +0000
Received: by outflank-mailman (input) for mailman id 716039;
 Thu, 02 May 2024 17:44:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1TOG=MF=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s2aU4-0000pk-65
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 17:44:40 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a66e57df-08ab-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 19:44:39 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2dd615b6c44so93016481fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 10:44:39 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 x28-20020a056512131c00b0051979e3a586sm247764lfu.266.2024.05.02.10.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 10:44:37 -0700 (PDT)
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
X-Inumbo-ID: a66e57df-08ab-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714671879; x=1715276679; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJ6OnAjpVNUh/tzF6RUek+tV3ajhXFS6uCjmPKu/PhE=;
        b=Xt8vZsiU5G3AJ9ZV4GuI+OEv14qt2zT5zc5QhpjWPo3uL1K6fZ3g5h8NGzXlMmgurV
         mDRbawPjsBwuiTUEAy0KXXiKScEFbqlL6BVSFiOeF5NXmELUnPxoPFcuqKk1AqwMGh/A
         sEIkxzS8d0xhdIW2qMKoQx7CvkqMhLsokhShNPnTsguYxegJj79Udx9kpUGB/qC/ZsFY
         nFF2TkLvjxrsbFbQ84bglyXY/Q2IxjqGs5KjTuhWdEMoviLqs01P8+balJi33Jyl57I+
         S0MyohETlHiP2qB2EmRvZAH66flhchG/SUPR8Bgb3mVgX34j9Q5+IjQpHSCMffyz2ddS
         cdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714671879; x=1715276679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJ6OnAjpVNUh/tzF6RUek+tV3ajhXFS6uCjmPKu/PhE=;
        b=BfXjoQXCAjhvt9FR5l40c6sOHGdOJTIkCRxT2rSpavUNpyHEct//YjKR4FraPLrwSk
         ouvtF/k0kJMfdrbscge2hkxfFpXiyOgkJ1yM01rlLYYsgRLww5NwXNZ4x2PV2E2RxT9F
         IKNjCqfQOwG+nBswrz/59rLhB0oCHagavPupJnmHTqx96Hj1p+nw4k6MKKxbdWu26DFk
         6L9dbaUWlXULjDz54flTn5WtoS51ggj2mcDw9z5rcdryTrkCKEYwG6z7RTHlD7g5QjIp
         mH45IfVIE7BN+t/Y+SJOx4tlAXct+9Qd8wtNMDYDFaX578boZI7CGpOQkDi1L4yNKANc
         7M4A==
X-Gm-Message-State: AOJu0YyYLoSlEzBRTZIPVFsqTlZIwUyxUIXh8B0ItYuU3Uo1i+9cAShx
	I+E3nP/1+Gjezm/iirO/Mb6DOPxJPG8U8yoXnNIuHoVyBBpaxeGsmTTPgYpm
X-Google-Smtp-Source: AGHT+IEkj7gWz8+yVxln7UOE1GtV/L21PQXmlVr46kP9Y+fdNaA2Qeg7Jxs1ExUr363P8Z6AF5jU8g==
X-Received: by 2002:a05:6512:3119:b0:516:d18b:eae8 with SMTP id n25-20020a056512311900b00516d18beae8mr367383lfb.41.1714671878805;
        Thu, 02 May 2024 10:44:38 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com
Subject: [PATCH v3 5/9] xen/arm64: debug: Add missing code symbol annotations
Date: Wed,  1 May 2024 05:54:44 +0200
Message-Id: <20240501035448.964625-6-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240501035448.964625-1-edgar.iglesias@gmail.com>
References: <20240501035448.964625-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Use the generic xen/linkage.h macros to annotate code symbols
and add missing annotations.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 xen/arch/arm/arm64/debug.S | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/arm64/debug.S b/xen/arch/arm/arm64/debug.S
index 71cad9d762..c3d02c33d7 100644
--- a/xen/arch/arm/arm64/debug.S
+++ b/xen/arch/arm/arm64/debug.S
@@ -27,17 +27,19 @@
  * Print a character on the UART - this function is called by C
  * x0: character to print
  */
-GLOBAL(early_putch)
+FUNC(early_putch)
         ldr   x15, =EARLY_UART_VIRTUAL_ADDRESS
         early_uart_ready x15, 1
         early_uart_transmit x15, w0
         ret
+END(early_putch)
 
 /* Flush the UART - this function is called by C */
-GLOBAL(early_flush)
+FUNC(early_flush)
         ldr   x15, =EARLY_UART_VIRTUAL_ADDRESS  /* x15 := VA UART base address */
         early_uart_ready x15, 1
         ret
+END(early_flush)
 
 /*
  * Local variables:
-- 
2.40.1


