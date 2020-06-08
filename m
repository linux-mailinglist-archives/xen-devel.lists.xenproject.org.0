Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0EB1F1C96
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:01:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKCv-0003dU-6A; Mon, 08 Jun 2020 16:01:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKCs-0003dE-P0
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:01:03 +0000
X-Inumbo-ID: 4048688c-a9a1-11ea-96fb-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4048688c-a9a1-11ea-96fb-bc764e2007e4;
 Mon, 08 Jun 2020 16:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=awCHYAXUOGkS+dWmNDQ4SQqbGqK/3LMSf+67fZKCnc0=;
 b=hGxdcVcsKerpNh8hVCPX8Y1x22DRvRxYIw46laa93thi57uFOujzCSQzFi9PtKIQezKVBo
 k9BS5sBLplQdy7CefpaEVoIdGL2pyabxn2+RT+UCZ/dPJbinJ4bpKejEcTk3aYhxNaf563
 bx1J2Z+T7jhovnySAi5yyjuNkqp3rLQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-jxBAYABvNP-dfB1xUFNYOQ-1; Mon, 08 Jun 2020 12:00:58 -0400
X-MC-Unique: jxBAYABvNP-dfB1xUFNYOQ-1
Received: by mail-wr1-f72.google.com with SMTP id e1so7365875wrm.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=awCHYAXUOGkS+dWmNDQ4SQqbGqK/3LMSf+67fZKCnc0=;
 b=jaf1vPJvewdOa7scZRM/7jlONt9wuY8S40MAt9jKMvW0+/DTgwZhHmjcW/uCEWOFmP
 kLKINGyoN5L+Gxd/o5QEeoKTVd/4vQckdOMRwkU8l4gdGTwKA8SCgf3P0uS0LrN/wCAM
 CUROka6HthXHjjvmlq3adrNSqY2vvobEalioZ9RbhMgrntXcJ+Sm54embelSwSKyb3ki
 05GbxMAQ4ZbneFBrJ10BwjzAsLZXPEFuha/JaRf3nDk2wZfQBzx+rL1/APlEnkErEA2b
 tD8vGCo8Y2g2PShWMQJLyLMq8UteUo8fSIzq6RLF+1IZZ/Hrp+4UY9Kg5vSoL8TrPLz0
 jclw==
X-Gm-Message-State: AOAM533LstCtlvmY/HyQ4Lh0BRqzq7IOJPhF484RjsppIhNUpVXf5mXN
 T6zNIi8CWXAmZbJyhspz5OaQND9fATu2/r9o/RaAyqSvcqNqvy7kzT5nuP+Y/Nyiaj+uHNFwiu8
 PFS63X/x6uiWFJhKAqxr7B/dUKfM=
X-Received: by 2002:a1c:a3c5:: with SMTP id m188mr48570wme.152.1591632053816; 
 Mon, 08 Jun 2020 09:00:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziyL5raG4PwAXzO4TG14Cp0iz1q12d2PaRjnoEeXVkhA3kNQMidurFs0yP2smspC0uLUhA1g==
X-Received: by 2002:a1c:a3c5:: with SMTP id m188mr48526wme.152.1591632053569; 
 Mon, 08 Jun 2020 09:00:53 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id w10sm187197wrp.16.2020.06.08.09.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:00:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 01/35] qom/object: Update documentation
Date: Mon,  8 Jun 2020 18:00:10 +0200
Message-Id: <20200608160044.15531-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The documentation was introduced in 2f28d2ff9dc, then
0d09e41a51 and a27bd6c77 moved the headers around.
Update the comment.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qom/object.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index fd453dc8d6..eb560bf32f 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -45,7 +45,7 @@ typedef struct InterfaceInfo InterfaceInfo;
  * <example>
  *   <title>Creating a minimal type</title>
  *   <programlisting>
- * #include "qdev.h"
+ * #include "hw/qdev-core.h"
  *
  * #define TYPE_MY_DEVICE "my-device"
  *
@@ -146,7 +146,7 @@ typedef struct InterfaceInfo InterfaceInfo;
  * <example>
  *   <title>Overriding a virtual function</title>
  *   <programlisting>
- * #include "qdev.h"
+ * #include "hw/qdev-core.h"
  *
  * void my_device_class_init(ObjectClass *klass, void *class_data)
  * {
@@ -170,7 +170,7 @@ typedef struct InterfaceInfo InterfaceInfo;
  * <example>
  *   <title>Defining an abstract class</title>
  *   <programlisting>
- * #include "qdev.h"
+ * #include "hw/qdev-core.h"
  *
  * typedef struct MyDeviceClass
  * {
-- 
2.21.3


