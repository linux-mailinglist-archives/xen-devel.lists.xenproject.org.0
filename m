Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9D694AD15
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 17:40:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773594.1184034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbilZ-00039R-BV; Wed, 07 Aug 2024 15:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773594.1184034; Wed, 07 Aug 2024 15:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbilZ-00037A-8r; Wed, 07 Aug 2024 15:39:57 +0000
Received: by outflank-mailman (input) for mailman id 773594;
 Wed, 07 Aug 2024 15:39:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8zg6=PG=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sbilY-00036l-09
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 15:39:56 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a8069d7-54d3-11ef-8776-851b0ebba9a2;
 Wed, 07 Aug 2024 17:39:53 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a7aada2358fso178978566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2024 08:39:53 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9e83848sm659353366b.177.2024.08.07.08.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 08:39:52 -0700 (PDT)
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
X-Inumbo-ID: 4a8069d7-54d3-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723045193; x=1723649993; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UmDI4Dz84kXGt5jmXeHADz7wjjK1TvXqao2udkFRzFU=;
        b=YYik4yjS/jkj//IfceODnxa+oj6GzRXk9nO6hMy2p80/aNshYoSbpITJnMHdAqQyOS
         /lRpMQF3jIUhWtcCHLhc0AsgYd3MJ09zVItZK1uCKcwprmnuL1wb+nio4JCzr2eZeznL
         n9fqp/9NzknGjC6/y50/5ofoHXjAGRYKK5Am4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723045193; x=1723649993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmDI4Dz84kXGt5jmXeHADz7wjjK1TvXqao2udkFRzFU=;
        b=LYP7qBWj2xAJ2YGQ5wS4bolIZ/NB/ltbdCEczaUg0M+XUgH1Cp6fFHFr7gske6d6ba
         KyhkGFF7djhSoI2ShqrednTWakjsUxrV8MynuoOcJhL/l/OFqbQRazJ9eZOyU2vuWP1W
         6V75nqx1xVq/ffN3h22pL0VDr2rZh7KzQ4Kxbij1FVUsHiXZzB8iUfzQk05u3vY2pD1T
         Q9CntFndaKIJtAc1GBGzX5ao3NSUHqvGKToFJFqw6zvVwIoz7ypVnWV40CUpsToJSY9x
         u4wqLborApT1cKg8BeKkdxU+aseLLcDWhVOI3s501DnQkskps4p55ra3wAjpHe/YpiYU
         PV8A==
X-Gm-Message-State: AOJu0YzMgS6YEcug7l0xCXlSmFC2HIdqo7cC9ilZ3NBo7eu261LRadyg
	EaUrdbiOTs/xcCBrg75sfQH45ke/Al0TNT2hkBQI9TJ2inL+FkybIQhMIU061DbDb3+4DPOHuH5
	P
X-Google-Smtp-Source: AGHT+IHUaiC7CK6CdZ199QZAgPkzDI8L6GWOCXVbHNwek8ATHbDzH//F+Chui1fY3ZszYHvOcl2DaA==
X-Received: by 2002:a17:906:dc8f:b0:a7d:88c4:2897 with SMTP id a640c23a62f3a-a8078fef41cmr230132166b.2.1723045192458;
        Wed, 07 Aug 2024 08:39:52 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2] x86/emul: Fix misaligned IO breakpoint behaviour in PV guests
Date: Wed,  7 Aug 2024 16:39:37 +0100
Message-Id: <4219d12fcd075635c8c2548c5d14471642af3038.1723045077.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When hardware breakpoints are configured on misaligned IO ports, the
hardware will mask the addresses based on the breakpoint width during
comparison.

For PV guests, misaligned IO breakpoints do not behave the same way, and
therefore yield different results.

This patch tweaks the emulation of IO breakpoints for PV guests such
that they reproduce the same behaviour as hardware.

Fixes: bec9e3205018 ("x86: emulate I/O port access breakpoints")
Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
Changes in v2:
- Refactor breakpoint port masking to be more succinct
- Add 'Fixes' line to commit message
---
 xen/arch/x86/pv/emul-priv-op.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index f101510a1bab..aa11ecadaac0 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -346,6 +346,8 @@ static unsigned int check_guest_io_breakpoint(struct vcpu *v,
         case DR_LEN_8: width = 8; break;
         }
 
+        start &= ~(width - 1UL);
+
         if ( (start < (port + len)) && ((start + width) > port) )
             match |= 1u << i;
     }
-- 
2.34.1


