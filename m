Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A478877393
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 20:24:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690982.1076778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2IU-0005oR-D2; Sat, 09 Mar 2024 19:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690982.1076778; Sat, 09 Mar 2024 19:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2IU-0005mG-8S; Sat, 09 Mar 2024 19:23:54 +0000
Received: by outflank-mailman (input) for mailman id 690982;
 Sat, 09 Mar 2024 19:23:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MmSm=KP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rj2IT-0001PG-KJ
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 19:23:53 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90a0bd32-de4a-11ee-afdb-a90da7624cb6;
 Sat, 09 Mar 2024 20:23:53 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a45bb2a9c20so389479566b.0
 for <xen-devel@lists.xenproject.org>; Sat, 09 Mar 2024 11:23:53 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a170906578500b00a449ebf3d58sm1178448ejq.85.2024.03.09.11.23.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:23:52 -0800 (PST)
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
X-Inumbo-ID: 90a0bd32-de4a-11ee-afdb-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710012233; x=1710617033; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qhkX9N0f7mv4U6Enm7PREVuXkmrXKzBrsiRapOf0sE=;
        b=lgdBTmbi/sBA8OH1UM4YfGlOYFOjwWc159O0HgOayc1yO3kClIVB8LTSqPfZydHHVi
         v6x301MY+QMF1NMPH6JAOQaIgWQQrlpc8I81sdMbF0fUrGzShsKL1/wk2Y3AhVlwTXaW
         hc8AAdCyxWxn03G9Fws75WOyM5hVDPLtIUu5JjbBc/GpJa245KHu+EEyRwGkNJmd3mf2
         RB0a4omrDd/X9e35PnhMkcLszH54sL/5tTlPpEJyPX9jkwk/v2nIiCaxx8Q8lJ6fq7UV
         1ZtYvN4ktPd179rhrRr9I+J5134I7Be8aV1LVrwQT7AmdQdME+H/bNQqNjd4ZE/k/qQe
         W1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710012233; x=1710617033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qhkX9N0f7mv4U6Enm7PREVuXkmrXKzBrsiRapOf0sE=;
        b=n9nGnTLQK3yUFDedsNDbX6DXHWe4OGi/9mjXZNTS/hdaSYizd6r9anCzRm1OT6kk8K
         szPTdXSK5LCNoXhBDU64YaCa7TKjG/hyGKcU068cheM3hOe5XVjDlaUbbYGKYojvYC3V
         sysKxW8Z17SgnBBKHRCVfWjaio5vYsyBtJ+8EarSXOEd9SFC/V0A90Ns0qOZwmRf+a64
         QbaYdw6JV6z4mRo7GX6JpQTUHYoO2QGKkJqRED9ZC00SSul4ecAcWEH3HoRW3Hx/fESA
         r9tS90BLm48xQeyVkAw49Y8glsI2H3bbKG6fxGp2h7oowLDk2GihK8G+SuColxZ7f/QY
         YUvA==
X-Forwarded-Encrypted: i=1; AJvYcCW6rFlEyPbkSQ8mOXdhZFB0FyiepOs7ip3c4xVBFtQVRvuR2hx3zNWPDechmxgGs6yDIlUSUfbiK2VZFH9f9tuSc466GTo6PZGu2qY2Nmw=
X-Gm-Message-State: AOJu0YxKvz9LLTdZKcAk2AQEzcZ+BCy2VhNgd+IqHkU5bbVMJJazy2wV
	ExZxfhIo/3mn4U5KC5byZbbVjjvxaoLdB2xfpY6HNFr78jDB2L8URurfMWagZRg=
X-Google-Smtp-Source: AGHT+IE0pC1PtPPUFeJGmL9nn03Tms40CF9fkNhPdedtB8UjjmtZf/tpA8FjVipfHktzZdaLWkMqpQ==
X-Received: by 2002:a17:907:c28a:b0:a43:900a:31c5 with SMTP id tk10-20020a170907c28a00b00a43900a31c5mr1698253ejc.4.1710012232757;
        Sat, 09 Mar 2024 11:23:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Jason Wang <jasowang@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org
Subject: [PULL 16/43] hw/net/xen_nic: Fix missing ERRP_GUARD() for error_prepend()
Date: Sat,  9 Mar 2024 20:21:43 +0100
Message-ID: <20240309192213.23420-17-philmd@linaro.org>
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

The xen_netdev_connect() passes @errp to error_prepend(), and its @errp
parameter is from xen_device_frontend_changed().

Though its @errp points to @local_err of xen_device_frontend_changed(),
to follow the requirement of @errp, add missing ERRP_GUARD() at the
beginning of this function.

[1]: Issue description in the commit message of commit ae7c80a7bd73
     ("error: New macro ERRP_GUARD()").

Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: Jason Wang <jasowang@redhat.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20240229143914.1977550-3-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/xen_nic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index 453fdb9819..89487b49ba 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -351,6 +351,7 @@ static bool net_event(void *_xendev)
 
 static bool xen_netdev_connect(XenDevice *xendev, Error **errp)
 {
+    ERRP_GUARD();
     XenNetDev *netdev = XEN_NET_DEVICE(xendev);
     unsigned int port, rx_copy;
 
-- 
2.41.0


