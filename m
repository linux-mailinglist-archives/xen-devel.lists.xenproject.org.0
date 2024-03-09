Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3543E877384
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 20:23:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690973.1076708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2Hn-0002E6-DC; Sat, 09 Mar 2024 19:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690973.1076708; Sat, 09 Mar 2024 19:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2Hn-0002BK-9N; Sat, 09 Mar 2024 19:23:11 +0000
Received: by outflank-mailman (input) for mailman id 690973;
 Sat, 09 Mar 2024 19:23:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MmSm=KP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rj2Hl-0001PG-Ih
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 19:23:09 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7663cc5e-de4a-11ee-afdb-a90da7624cb6;
 Sat, 09 Mar 2024 20:23:09 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d29aad15a5so27055951fa.3
 for <xen-devel@lists.xenproject.org>; Sat, 09 Mar 2024 11:23:09 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 fg3-20020a056402548300b005656bbb5b3fsm1153256edb.63.2024.03.09.11.23.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:23:08 -0800 (PST)
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
X-Inumbo-ID: 7663cc5e-de4a-11ee-afdb-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710012189; x=1710616989; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jsjeEWjsUkRHeCpOh+pko9UBxzZs1OaWzN0fIY08/s=;
        b=kbFeCqtcxyu0ZMoPR+81vtw2gCiXdwtkkXHsZzeNQfQEPGLzFwf/LZo9US35DRqPi9
         JbEoUIWP087d8hLPW7k44KNXjZyvT01OHjdrulF4fybUEOJMmc/CfmQ8yYvvisOazcgB
         w9jjQBbeY4rl7epZ9gGoY7eXW7IQya1GX6Mrs8S/8pgHWVh/X3mUmrIUXv6T/a+lMGsy
         rgdcZ2KrTBWS9i8T6ByiCAXFX2eO7tCWO6Nh5uY2+4RRW1GRXqG0YE13kjp0J5RqIApD
         kv9CqtNIahDBdaceKpZRbn+0LbJX1rs8QWlkduoLuGe3SXMWIGX39Q9YtKfo+AYIdXQ5
         DMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710012189; x=1710616989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jsjeEWjsUkRHeCpOh+pko9UBxzZs1OaWzN0fIY08/s=;
        b=O2T7JIMRJ66WLMyNTih1ZIB7A19BwTmODmD4ecSbYejcxD7OHERIsVcHFEC460dTiP
         F5fn6S6oxUnHkskPrSyxcWcAesz9WHCXyS8wsyBm9r13wGPSzVJ0ighJ+YwccMMjnEJZ
         wFLX7beuAkLqeEC5bd46gauYs586pqqptYAvHbc9SlmcXjwNCjT4L52icN+bJaposCwA
         namym6zBrezQ1x0BY/tmmg9FxM472EuzhGwAWgHyH4aOQ6bAaPESr7D0dzKcc7CrS9Kk
         HHFtW9XO5K/+mgP5ed4gAGWageQQCGsE4v5VBRscszT0UnCuY4/j704EiEp7vh6pmnBO
         JHCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj/90gRVbTQvoQ3JSErjilhFs79tm0+Rlo5i1itc55bJ+pFrBNwPiXA6wqWBpz8PRhHriifPPtGpnmsdbfPzQtJpTho5iQftFF50M9ywM=
X-Gm-Message-State: AOJu0Yzs7cMbCFh5+rb+nbu8SBvYIEXRaU83usxcUX8eFt8MES8nQlxX
	Fc2YtMzEkeCIljbbY5kvjfmxlopeQodnYC5VifSZIDlMBwX8MfurKQciXhzJsWk=
X-Google-Smtp-Source: AGHT+IHVJYQKMJoF6M5h+nBzkB9MQSOKRczhtHaq4vuFR2+EzQeH6DE9+nIiaOsLgRl8gEGAHG9UzQ==
X-Received: by 2002:a05:651c:61f:b0:2d4:22b6:e6a4 with SMTP id k31-20020a05651c061f00b002d422b6e6a4mr1215415lje.30.1710012188800;
        Sat, 09 Mar 2024 11:23:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PULL 09/43] hw/xen/xen_pt: Add missing license
Date: Sat,  9 Mar 2024 20:21:36 +0100
Message-ID: <20240309192213.23420-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit eaab4d60d3 ("Introduce Xen PCI Passthrough, qdevice")
introduced both xen_pt.[ch], but only added the license to
xen_pt.c. Use the same license for xen_pt.h.

Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Message-Id: <20231114143816.71079-17-philmd@linaro.org>
---
 hw/xen/xen_pt.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index 31bcfdf705..d3180bb134 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -1,3 +1,13 @@
+/*
+ * Copyright (c) 2007, Neocleus Corporation.
+ * Copyright (c) 2007, Intel Corporation.
+ *
+ * SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Alex Novik <alex@neocleus.com>
+ * Allen Kay <allen.m.kay@intel.com>
+ * Guy Zana <guy@neocleus.com>
+ */
 #ifndef XEN_PT_H
 #define XEN_PT_H
 
-- 
2.41.0


