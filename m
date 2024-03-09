Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2760877392
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 20:24:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690981.1076768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2IQ-0005Qq-4T; Sat, 09 Mar 2024 19:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690981.1076768; Sat, 09 Mar 2024 19:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2IQ-0005NR-0s; Sat, 09 Mar 2024 19:23:50 +0000
Received: by outflank-mailman (input) for mailman id 690981;
 Sat, 09 Mar 2024 19:23:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MmSm=KP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rj2IO-0000Lp-Lv
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 19:23:48 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d0d55fe-de4a-11ee-a1ee-f123f15fe8a2;
 Sat, 09 Mar 2024 20:23:47 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5654f700705so3903295a12.1
 for <xen-devel@lists.xenproject.org>; Sat, 09 Mar 2024 11:23:47 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 lt10-20020a170906fa8a00b00a45ab830eabsm1179687ejb.51.2024.03.09.11.23.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:23:46 -0800 (PST)
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
X-Inumbo-ID: 8d0d55fe-de4a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710012226; x=1710617026; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjbUGqOjGDJ48BD/FCrBKjFot720kk8N7cpG04DHyuw=;
        b=kbT2qHxTeQyHAtrzgnXBb0Yhs4phmhmYBxX5jYmdvYUaR60c1rt75vUgqpCJ49yDB2
         r8ZdfOkw1AJ5k+DwIW//Pw6avF7aqrgPQBOgQmDjoTsovPYDggJUnYORbDwI3O1aO2eK
         Ye0B33LvKVDWxjklWkBiR/Ruc3cUcRPtNeqol3Jq4UWPdsDffKGl/lBOqBi2kI8rahuE
         ilyC2KTjjzHHyXX4Ix95kb9/7K3K6FK46mHj7RQtghaf+vmNKoBhJ2BjmCHtoS6R+HNn
         +w/MOJwbTubXdJ0mvJFG5l5PFTnwpRl/r8Rd5HSAg2l6m6kkUalTfPsUfdoDMMaQ1RZJ
         WV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710012227; x=1710617027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjbUGqOjGDJ48BD/FCrBKjFot720kk8N7cpG04DHyuw=;
        b=FTEFM/SZYEXL2r0657aFGHm8YVA5yo0LPXNnLCJnlkva2TQC64MvynneycL/q1hoTJ
         J/+uT12atWspLmuMIqfrrO5PvGm0YvT6xNukrMqxXSt7JoEvQHU7yZUgo5w555I7kXBa
         5KvZy7UtJ3DKGi9uRBYnRQVW0s7w9xcfW3CXu3Jc8eXfSUgBVHEa+w3pvCEz/PkH7LIR
         8C10/d2LZLelYLMq/1fTpXnMBz7IJApaOPl/z5WTVhv+fmfa1YRTYjuo8i9vpQXI8rvl
         U0mZIg0GpTWF60YDyJy/pzcMWGSEzY4oQCw5scThVEcYhJOSzlR6Vi40ghOCyGn+qTuu
         +O7A==
X-Forwarded-Encrypted: i=1; AJvYcCV0+WSyO0sNv1hlL3cf0/2T6XbQK6yQkBLIDwPyogFd6R1qalyVvm+IP2r5TQ9OBcwDj1/S6EmiJeIHHoiMowRcZOCT+9W5b0PQ4D8H7ao=
X-Gm-Message-State: AOJu0YxnLooYvgbPRIS7IwR6HDgY6JDwN17Un9K2ysbGid10IJszhhjr
	4KsG8m0gnOEBUxumswW72Dnjqps+z2OZzUmBLP3CDRlepguVH9quU6sqQHQSkVudw2N1bZR+an0
	j
X-Google-Smtp-Source: AGHT+IHsirtIOeTRkWpIs3e5yCTD71AujDzccS4QPk7Rv1bmDdnDigFagjmowzpwOIomavcvEpokKQ==
X-Received: by 2002:a17:906:b0d0:b0:a44:8c1b:8877 with SMTP id bk16-20020a170906b0d000b00a448c1b8877mr1523044ejb.50.1710012226664;
        Sat, 09 Mar 2024 11:23:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org
Subject: [PULL 15/43] hw/char/xen_console: Fix missing ERRP_GUARD() for error_prepend()
Date: Sat,  9 Mar 2024 20:21:42 +0100
Message-ID: <20240309192213.23420-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zhao Liu <zhao1.liu@intel.com>

As the comment in qapi/error, passing @errp to error_prepend() requires
ERRP_GUARD():

* = Why, when and how to use ERRP_GUARD() =
*
* Without ERRP_GUARD(), use of the @errp parameter is restricted:
...
* - It should not be passed to error_prepend(), error_vprepend() or
*   error_append_hint(), because that doesn't work with &error_fatal.
* ERRP_GUARD() lifts these restrictions.
*
* To use ERRP_GUARD(), add it right at the beginning of the function.
* @errp can then be used without worrying about the argument being
* NULL or &error_fatal.

ERRP_GUARD() could avoid the case when @errp is the pointer of
error_fatal, the user can't see this additional information, because
exit() happens in error_setg earlier than information is added [1].

The xen_console_connect() passes @errp to error_prepend() without
ERRP_GUARD().

There're 2 places will call xen_console_connect():
 - xen_console_realize(): the @errp is from DeviceClass.realize()'s
			  parameter.
 - xen_console_frontend_changed(): the @errp points its caller's
                                   @local_err.

To avoid the issue like [1] said, add missing ERRP_GUARD() at the
beginning of xen_console_connect().

[1]: Issue description in the commit message of commit ae7c80a7bd73
     ("error: New macro ERRP_GUARD()").

Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20240228163723.1775791-15-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/xen_console.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index 5cbee2f184..683c92aca1 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -206,6 +206,7 @@ static bool con_event(void *_xendev)
 
 static bool xen_console_connect(XenDevice *xendev, Error **errp)
 {
+    ERRP_GUARD();
     XenConsole *con = XEN_CONSOLE_DEVICE(xendev);
     unsigned int port, limit;
 
-- 
2.41.0


