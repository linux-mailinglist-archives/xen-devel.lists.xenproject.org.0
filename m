Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BBF1C366A
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 12:08:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVY0o-0001t4-3q; Mon, 04 May 2020 10:07:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z3vB=6S=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jVY0m-0001sw-KV
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 10:07:44 +0000
X-Inumbo-ID: 16da9592-8def-11ea-b9cf-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16da9592-8def-11ea-b9cf-bc764e2007e4;
 Mon, 04 May 2020 10:07:41 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y3so1167475wrt.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2020 03:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pqAO0bA1QvbNiBti+VeepWcwOaVLpxEZnxKr37xmzuE=;
 b=mNzUhqyuvwbObBrckIQQRqTzNHBBsL3ym2fUD3m/+zm9Xqm7CM2aUjGEy0tWaFQrrD
 YVDAjI8z6v9lLJx42ToBPknDZfH05+UKtCzKzgNr4MTMkCfIk/m3I+6VTw+a3ljwYwDX
 vqw6SrYla+n8Fc7zIMhcGqQDjESGwm5u1EuKEWljsNLyKjNuANONlXznl4FYJ2xVrp40
 VW0Oy0lzxZ/OSSeB5OKPMnQxWOlMkuv984lpi+FuBa6VtbIb57yelQpHA/eX75x4Zd5t
 tYxJobeQgsnQgUS/GWXUbL6lTDYSgG2TenM1Q/dfLoGVkes9QJ1ghKgcevtFXHzQM8bp
 J78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pqAO0bA1QvbNiBti+VeepWcwOaVLpxEZnxKr37xmzuE=;
 b=Zbkrpwvg0oVp2gpMibD1sKPZPCnc+GCFqa2jYegO+8YAKvQbMjJe9UnIUtLw6iKfko
 rZIBl1p/QmY7HRlyGUbELULC22cCWU0ZwciKi0HgHssz1LOPy2M08cxh+bktCdlvBtcz
 IxfS+oRGBcPuOdjRElS38dtuRKH+Gsyc8S7uElN2izYzvzExlKP6Auw1sSBVd71dipiu
 CgMhUZMHVIv1AxLIX79X75gqa+qYDHal8ngP2OjF1VhyCVEuGokyonMEL5l/t1oOT3b+
 F4IRczcsL2Xl11zYK7AAp24acXdqYPkgZNhZisey+/f6/FcEthT11Cc4tRWM/RLSvnYM
 SCEw==
X-Gm-Message-State: AGi0PuauBYym6dCU5UJhhY/H9ndwdmpvBDa3YRlSIPvZfW6MWIjho5pc
 irVG82WK/HlLxkzfmJGiBsA=
X-Google-Smtp-Source: APiQypLq5H1B+qwCkRrljK1N7qAw8SaQFKARSpmFekNGsBBZxyVnzr6zXEYdT7BPPkaenEkB9e3G3w==
X-Received: by 2002:adf:eacb:: with SMTP id o11mr10572540wrn.253.1588586860549; 
 Mon, 04 May 2020 03:07:40 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id k9sm18517778wrd.17.2020.05.04.03.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 03:07:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] target: Remove unnecessary CPU() cast
Date: Mon,  4 May 2020 12:07:33 +0200
Message-Id: <20200504100735.10269-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200504100735.10269-1-f4bug@amsat.org>
References: <20200504100735.10269-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The CPU() macro is defined as:

  #define CPU(obj) ((CPUState *)(obj))

which expands to:

  ((CPUState *)object_dynamic_cast_assert((Object *)(obj), (name),
                                          __FILE__, __LINE__, __func__))

This assertion can only fail when @obj points to something other
than its stated type, i.e. when we're in undefined behavior country.

Remove the unnecessary CPU() casts when we already know the pointer
is of CPUState type.

Patch created mechanically using spatch with this script:

  @@
  typedef CPUState;
  CPUState *s;
  @@
  -   CPU(s)
  +   s

Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Reword (Markus)
---
 target/ppc/mmu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 86c667b094..8972714775 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1820,7 +1820,7 @@ static inline void do_invalidate_BAT(CPUPPCState *env, target_ulong BATu,
     if (((end - base) >> TARGET_PAGE_BITS) > 1024) {
         /* Flushing 1024 4K pages is slower than a complete flush */
         LOG_BATS("Flush all BATs\n");
-        tlb_flush(CPU(cs));
+        tlb_flush(cs);
         LOG_BATS("Flush done\n");
         return;
     }
-- 
2.21.3


