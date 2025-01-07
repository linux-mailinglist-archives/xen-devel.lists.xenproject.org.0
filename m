Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19527A03B3A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 10:33:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866219.1277525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5xJ-0001zl-I5; Tue, 07 Jan 2025 09:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866219.1277525; Tue, 07 Jan 2025 09:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5xJ-0001xt-EM; Tue, 07 Jan 2025 09:32:57 +0000
Received: by outflank-mailman (input) for mailman id 866219;
 Tue, 07 Jan 2025 09:32:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X79W=T7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tV5xI-0001ho-4s
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 09:32:56 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f3aced8-ccda-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 10:32:54 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385e87b25f0so10082025f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 01:32:54 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366127c4d7sm591188645e9.34.2025.01.07.01.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 01:32:53 -0800 (PST)
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
X-Inumbo-ID: 5f3aced8-ccda-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736242374; x=1736847174; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=le6xEQUAKXVEdnvKDfxbK1jzAiqE1WDBuz0Ul4Gn8vE=;
        b=NCtGz7epRuTDB0UrihncsKcA5TdRbC3o9Q+MTVrdZxgA4m/wfm+ZSFnevvIq569gws
         0NOIvJsLy2cS73cZWdZh5LmyT4eusMrqjfzPhiYfbRy6FBrLaC4ITT9ioGOcpFFgUREg
         1QfuFmytc76ou8UDpsYJS7C+JnfgnvxxuvdEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242374; x=1736847174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=le6xEQUAKXVEdnvKDfxbK1jzAiqE1WDBuz0Ul4Gn8vE=;
        b=X2viTzSZDyAs1lj6gDIFYhrjX/zK7hlSGvvCaDUNq9B3UDKvYOLTpwu7L/ZAchyrK8
         4KOZJ8umkdzDt0kM2XH3UPUCk80H2NFBfueRZcw3ctegC6kPIYGxmRcYEb38191lOYv3
         EKDblabWYhs2vz1pvZqllHMqnH0oTYiaqlutngqEEbTLDQ2Pu4XFr/ndxrXADiMXr6jK
         0Iy+65Xa4c/iWydovTUeuxUPlFIAHlKVosghCqMY2gokMCWWIcpDUY/c04ZaDBrsRnyI
         yZMM3L/JAQlmpbHMDzruxViVIDB/1z9qh6nANmnnEitm9PG5BTL7ltuSoutszRBNQmuJ
         VrAg==
X-Forwarded-Encrypted: i=1; AJvYcCU4KD49iJVMlquNcG6jnYC/lcrWpDGHo544sYP7RLTn3a3mpRguTFh8K6URunyhd+wbp23uJhLp1O0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIMqdY8my73FlZIuHVs2aeXgVD9IV5ZQs02nlXJgY4tUyCW7DZ
	z27Ojhx0FfPyjpzBNrlavJ6ti7uTTCOV8iauAi1tfLMx+Tzsrc8fXTdKyJ01MnA=
X-Gm-Gg: ASbGncsJVFXhDqfKRwFJ+AtlzOS3QB66mfqbnyLHi9Zk1XKRW1lVjIEJAUmX+tq6CZS
	xISJVO0kcpFRr3GRsd+KgUzG1RUadc79Cy2QWfdY8Y33DWUDDZxtRAhD9JaeTwqMPXu0qhqD1Sb
	waZUMo6c+3OBABlxYkBh6pKyEg8IWM7MAfhTLVeMXhdeMfZJn6ECs+W3Y5O3TgGaPLzN4IxfMLy
	rLmkFBHfJBl5nNC3izfkFmeKcopxH7tglWJHFpciE+IlCetJhwGfoRjAoUgLg==
X-Google-Smtp-Source: AGHT+IGs6RVcLqHmfQoSzmfYVFDzjcfB1yzxVrQ1br3JPwQL8Jwfwgn1cE39EOkxrmixmEPusLWFPA==
X-Received: by 2002:a5d:47c3:0:b0:385:df17:2148 with SMTP id ffacd0b85a97d-38a7923b75dmr1712737f8f.20.1736242374009;
        Tue, 07 Jan 2025 01:32:54 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: qemu-devel@nongnu.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/2] xen/console: fix error handling in xen_console_device_create()
Date: Tue,  7 Jan 2025 10:31:39 +0100
Message-ID: <20250107093140.86180-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250107093140.86180-1-roger.pau@citrix.com>
References: <20250107093140.86180-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The usage of error_prepend() in some of the error contexts of
xen_console_device_create() is incorrect, as `errp` hasn't been initialized.
This leads to the following segmentation fault on error paths resulting from
xenstore reads:

Program terminated with signal SIGSEGV, Segmentation fault.
Address not mapped to object.
    fmt=0x15c4dfeade42 "failed to read console device type: ", ap=0x15cd0165ab50)
    at ../qemu-xen-dir-remote/util/error.c:142
142         g_string_append(newmsg, (*errp)->msg);
[...]
(gdb) bt
    (errp=0x15cd0165ae10, fmt=0x15c4dfeade42 "failed to read console device type: ", ap=0x15cd0165ab50) at ../qemu-xen-dir-remote/util/error.c:142
    (errp=0x15cd0165ae10, fmt=0x15c4dfeade42 "failed to read console device type: ")
    at ../qemu-xen-dir-remote/util/error.c:152
    (backend=0x43944de00660, opts=0x43944c929000, errp=0x15cd0165ae10)
    at ../qemu-xen-dir-remote/hw/char/xen_console.c:555

Replace usages of error_prepend() with error_setg() where appropriate.

Fixes: 9b7737469080 ('hw/xen: update Xen console to XenDevice model')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony PERARD <anthony@xenproject.org>
Cc: Paul Durrant <paul@xen.org>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: xen-devel@lists.xenproject.org
---
 hw/char/xen_console.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index ef0c2912efa1..af706c7ef440 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -551,7 +551,7 @@ static void xen_console_device_create(XenBackendInstance *backend,
     }
 
     if (xs_node_scanf(xsh, XBT_NULL, fe, "type", errp, "%ms", &type) != 1) {
-        error_prepend(errp, "failed to read console device type: ");
+        error_setg(errp, "failed to read console device type: ");
         goto fail;
     }
 
@@ -582,7 +582,7 @@ static void xen_console_device_create(XenBackendInstance *backend,
     } else if (number) {
         cd = serial_hd(number);
         if (!cd) {
-            error_prepend(errp, "console: No serial device #%ld found: ",
+            error_setg(errp, "console: No serial device #%ld found: ",
                           number);
             goto fail;
         }
-- 
2.46.0


