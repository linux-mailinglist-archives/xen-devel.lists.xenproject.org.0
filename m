Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 961212613E7
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 17:55:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFfyM-0005oE-8l; Tue, 08 Sep 2020 15:55:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cV5b=CR=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kFfyL-0005nx-AK
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 15:55:53 +0000
X-Inumbo-ID: efa0ff6d-de16-4b81-8ec2-c0e131d313d4
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id efa0ff6d-de16-4b81-8ec2-c0e131d313d4;
 Tue, 08 Sep 2020 15:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599580552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3aIqBnRsvFqZ230wZvv7A0ZAUlxhRiHC/gfnYkiWsME=;
 b=QAbXtG8lq3ZOQd2lnWx811FniS3J4q1SP0HndhDO7vBsRQVhp2il+oX6g7NvKWzWcWPilp
 T2/Q8yfJmmXQNPulv3sXBbT8ebyABXMNPUyADYaqYxwzF4nzJatGDw1A0hrNZVc3f0tZnK
 O/4tdwiJdGgF/LRsG/XwNoMFo0Z/FXs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-nusdSt86MPSqJL5U_TZ9TA-1; Tue, 08 Sep 2020 11:55:48 -0400
X-MC-Unique: nusdSt86MPSqJL5U_TZ9TA-1
Received: by mail-wr1-f72.google.com with SMTP id n15so7088960wrv.23
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2020 08:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3aIqBnRsvFqZ230wZvv7A0ZAUlxhRiHC/gfnYkiWsME=;
 b=Ait32pMhWvOzXRTe6/SXfbL99Cs9MdwkmNDV1mwvbV0dLZCAVubWU5h4GgHtqWQ+GW
 21rpudtbSURHikxemnoYzK6Jtk7hPgAFWGEGGtoaVwyWZrpWXaif0HTY/WapRmjjAEJA
 J4kiX5SnS0UBFZGeb+SjlANAU0f1M1/Tc2FGH3fOolhYjyk51r86E5HpSe8XAPnp0tl8
 CwVg7FH4Gxu6Y2edh+W+bm7fcvohPFYIp9q3+IwOjVU4YLOWhfWcs7MXamYVZqafvbfV
 fjfa/Lu0fTkqHp3GIY6Qr4lqsYHql0PLe65Mski/PG0XunLTHkPepdhOEi4JmqvHUhar
 0VXg==
X-Gm-Message-State: AOAM532RJtuxTNVyELKSt8gBdIlSiR1laRFyAEsyUq0sNpxm39eQDbsO
 u950O5hNAPr+rRqfHP9a09EQmvbknfoGyUBoR2HhpsOMiJh13zbzfJwbRwzOwSBVHS11NnsBPJv
 5cweDtjBsP0YqAyEK8GT3x3iLSFU=
X-Received: by 2002:adf:f10a:: with SMTP id r10mr322937wro.86.1599580547717;
 Tue, 08 Sep 2020 08:55:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydvCW82xRfqRQuTdYF1MHP5+r8Gl/n2M1Hanlh29I5Vyk61N4IxwQtFwRjtnXQqr5GdlWs1A==
X-Received: by 2002:adf:f10a:: with SMTP id r10mr322919wro.86.1599580547580;
 Tue, 08 Sep 2020 08:55:47 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id j14sm34928939wrr.66.2020.09.08.08.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 08:55:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>,
 Anthony Perard <anthony.perard@citrix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 3/6] sysemu/xen: Add missing 'exec/cpu-common.h' header for
 ram_addr_t type
Date: Tue,  8 Sep 2020 17:55:27 +0200
Message-Id: <20200908155530.249806-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200908155530.249806-1-philmd@redhat.com>
References: <20200908155530.249806-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

As this header use the ram_addr_t type, it has to include
"exec/cpu-common.h" to avoid odd errors such:

  include/sysemu/xen.h:35:44: error: unknown type name 'ram_addr_t'; did you mean 'in_addr_t'?
   35 | static inline void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
      |                                            ^~~~~~~~~~
      |                                            in_addr_t

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/xen.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
index 2c2c429ea8b..0ca25697e4f 100644
--- a/include/sysemu/xen.h
+++ b/include/sysemu/xen.h
@@ -8,6 +8,8 @@
 #ifndef SYSEMU_XEN_H
 #define SYSEMU_XEN_H
 
+#include "exec/cpu-common.h"
+
 #ifdef NEED_CPU_H
 # ifdef CONFIG_XEN
 #  define CONFIG_XEN_IS_POSSIBLE
-- 
2.26.2


