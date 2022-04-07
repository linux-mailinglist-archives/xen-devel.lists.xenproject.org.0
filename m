Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EA14F822D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 16:52:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300847.513273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncTUg-00064Y-C4; Thu, 07 Apr 2022 14:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300847.513273; Thu, 07 Apr 2022 14:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncTUg-000620-8d; Thu, 07 Apr 2022 14:52:18 +0000
Received: by outflank-mailman (input) for mailman id 300847;
 Thu, 07 Apr 2022 14:52:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yv5T=UR=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ncTUf-00061t-Ei
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 14:52:17 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50795586-b682-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 16:52:16 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id a38so2338067qkp.5
 for <xen-devel@lists.xenproject.org>; Thu, 07 Apr 2022 07:52:15 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 c17-20020ac85a91000000b002e1dd8ae44bsm16537157qtc.29.2022.04.07.07.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 07:52:13 -0700 (PDT)
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
X-Inumbo-ID: 50795586-b682-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aXzHPEsOE9oT+djL0tSiJY62IZUE0RTntN0nR7AbokI=;
        b=FX4ET5aT1BSUsJka48WWFpvPyv51q55N8QUCfUkG0iI+edqbQEa483wokrOSAivcs1
         l2g8XX6YD02LYCxRIYY1c/NalLvFFtUOhiBk2/YodevqFHIQNBW93et4n0eJxhBTMuDB
         jKShGganwHW6evpSiEQcWzkJPF4DAQpRA4A9mxNzJscBl3oF5sVymXyKNOQH8MLp9m79
         REPnn4wZFJKdy0Sax7ZI0zs91KucjotqOXMbPalsq4LhXx/ZaNmwr4XuPKHiWm2Bcs/M
         SdrIfhPlR3Q6IAEyZazn2U80241SgZ2ufOSNbYN+P4xZM5mH3xvy4dvwT31KYYqJSBNc
         9beQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aXzHPEsOE9oT+djL0tSiJY62IZUE0RTntN0nR7AbokI=;
        b=EBv16kFLcSZlrGeY8NgAD8J24MCy/0ve7ETlomFVGnhONKvk0fNW93Qza9vWR9uL/1
         Z0LxI1d8zPr7N7NjFaFy1Vfr6mUoGz4wTaar8gKuzs0Vf4H2HojWlAFvbeHFF30e2onW
         jdMbwm95JCJJAjwmWRi6BOREH7jcULcrP7ljZpv9y9S1J17VJldywvAqwif8/8YGiL+x
         V5cYskoRtdh/EHgfCf8ZcMzfjlDRlrH3U/kM2MKle2bjliS8tSncaum732Nh5M/fmgWh
         +ggqJCTyz/RS1uM6anCWjsDOqCbxOEF1Ir08EJeOgXhqQ/i1YIReMv5gIgwWSyFiy4+T
         FhBw==
X-Gm-Message-State: AOAM532Lzz5pIQ1eoEmC/m/2JxCJqiBPW3SjrXK9hOnqqAIdvlHh33l/
	/VirpIVVSNf97czySSeS3stDLrYR5vA=
X-Google-Smtp-Source: ABdhPJyhvwseWsv6Rh/cRzoxWBunjNDss2rFLgFd2Geu1XruEBfT8gfbQJMnXnhe4CnnWjJ+U4TDGA==
X-Received: by 2002:a37:c403:0:b0:699:f96c:3b13 with SMTP id d3-20020a37c403000000b00699f96c3b13mr3391458qki.105.1649343134644;
        Thu, 07 Apr 2022 07:52:14 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/irq: Skip unmap_domain_pirq XSM during destruction
Date: Thu,  7 Apr 2022 10:51:50 -0400
Message-Id: <20220407145150.18732-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xsm_unmap_domain_irq was seen denying unmap_domain_pirq when called from
complete_domain_destroy as an RCU callback.  The source context was an
unexpected, random domain.  Since this is a xen-internal operation,
going through the XSM hook is inapproriate.

Check d->is_dying and skip the XSM hook when set since this is a cleanup
operation for a domain being destroyed.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v2:
Style fixes
Rely on ret=0 initialization

---
 xen/arch/x86/irq.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 285ac399fb..de30ee7779 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2340,8 +2340,14 @@ int unmap_domain_pirq(struct domain *d, int pirq)
         nr = msi_desc->msi.nvec;
     }
 
-    ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
-                               msi_desc ? msi_desc->dev : NULL);
+    /*
+     * When called by complete_domain_destroy via RCU, current is a random
+     * domain.  Skip the XSM check since this is a Xen-initiated action.
+     */
+    if ( !d->is_dying )
+        ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
+                                   msi_desc ? msi_desc->dev : NULL);
+
     if ( ret )
         goto done;
 
-- 
2.35.1


