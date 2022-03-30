Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E1B4ECBAB
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 20:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296469.504680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZct7-0002Ul-Fs; Wed, 30 Mar 2022 18:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296469.504680; Wed, 30 Mar 2022 18:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZct7-0002R5-BE; Wed, 30 Mar 2022 18:17:45 +0000
Received: by outflank-mailman (input) for mailman id 296469;
 Wed, 30 Mar 2022 18:17:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjcS=UJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nZct5-0001M9-Ib
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 18:17:43 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b085af41-b055-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 20:17:42 +0200 (CEST)
Received: by mail-qk1-x734.google.com with SMTP id k125so17371415qkf.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 11:17:42 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 e15-20020ac8670f000000b002e22d9c756dsm14849314qtp.30.2022.03.30.11.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 11:17:40 -0700 (PDT)
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
X-Inumbo-ID: b085af41-b055-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZCIuaw/P3XMLRkUNQuqL8M82sLjVQz3hz9QA3xFRvLU=;
        b=mDEZNeZH+oPu8ubbp48pijTzq+D5SD8yHENfkw5L0VReCC75KRqi5gTIsqcghMqGfS
         KuLHMt//xGA81zMwKUh01nvtV5SA3moBcvSk6fZvIQmLMTHKu/euh2VYiu3UINTL2Vyd
         j+qV5qpq8J3lUjUgnvDEcWKyQCGz0ZsZjjb9u0bnLcQkjjijl6c5rpcDEE0pw+gBvBUP
         8Rsh1pOpPVRXfyYKUH31TlibWWnhx0DgDhyEWCZyYKyKN7qoGJXpcVaa+MbnCn9l5LMl
         Tda94+pxQVE2RUSnJRzQq0jsROZ9ItPFc8lwtuNUfy4qKw0PqW0YyzzuDjQRBG7R3HnC
         3LAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZCIuaw/P3XMLRkUNQuqL8M82sLjVQz3hz9QA3xFRvLU=;
        b=mnz2t4okSzjXZUmEQfa4WLHSYUqky1BBYyeBv4yG+YqbnJsHtzzs7RTdk4LW+ASqD1
         XqrSqAF57F3Kk0zL0hRz7b2O+Vy++dl0NcSdQGu6fw0B6LcgO32AAhjFjhKOeY81eNBG
         +XwleHoxxNhnRjkY0Km6DE6Mg9gh7IWEHnNGdHCYDVT1UZrG2gVN4dSHmCcwSQfXuANP
         Uu+8MDPuGFnnvxwUwhK8sqJNfpwtzf919c6sr1q54C26QcBwMkuKFcUMslIHCzfXlDKY
         hA/9J6GQwZbTNKAMbrhBoiK/3QXT/cnVG2e9MMzoYEr7gImrUcuw59vv4NQwyv7R2Ybs
         Cvjg==
X-Gm-Message-State: AOAM530d61pRBNWCtVImxndDk2JLdM3bNG0U6kCZwV/O1hb9aIRbnibi
	L3sTQgTTAare2bdPhtyXmomBE5sc5uM=
X-Google-Smtp-Source: ABdhPJzdC79ao0S0ML/h7NX2ZQgJTlsOsPLYfFYRw6jmTBM8d/M02cro0Xcxh+OTzGR4MuO0kdgdUw==
X-Received: by 2002:a05:620a:137a:b0:680:bca2:5c66 with SMTP id d26-20020a05620a137a00b00680bca25c66mr717883qkl.750.1648664261360;
        Wed, 30 Mar 2022 11:17:41 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH] x86/irq: Skip unmap_domain_pirq XSM during destruction
Date: Wed, 30 Mar 2022 14:17:34 -0400
Message-Id: <20220330181734.30319-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xsm_unmap_domain_irq was seen denying unmap_domain_pirq when called from
complete_domain_destroy as an RCU callback.  The source context was an
unexpected, random domain.  Since this is a xen-internal operation,
we don't want the XSM hook denying the operation.

Check d->is_dying and skip the check when the domain is dead.  The RCU
callback runs when a domain is in that state.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
Dan wants to change current to point at DOMID_IDLE when the RCU callback
runs.  I think Juergen's commit 53594c7bd197 "rcu: don't use
stop_machine_run() for rcu_barrier()" may have changed this since it
mentions stop_machine_run scheduled the idle vcpus to run the callbacks
for the old code.

Would that be as easy as changing rcu_do_batch() to do:

+        /* Run as "Xen" not a random domain's vcpu. */
+        vcpu = get_current();
+        set_current(idle_vcpu[smp_processor_id()]);
         list->func(list);
+        set_current(vcpu);

or is using set_current() only acceptable as part of context_switch?

 xen/arch/x86/irq.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 285ac399fb..16488d287c 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2340,10 +2340,14 @@ int unmap_domain_pirq(struct domain *d, int pirq)
         nr = msi_desc->msi.nvec;
     }
 
-    ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
-                               msi_desc ? msi_desc->dev : NULL);
-    if ( ret )
-        goto done;
+    /* When called by complete_domain_destroy via RCU, current is a random
+     * domain.  Skip the XSM check since this is a Xen-initiated action. */
+    if ( d->is_dying != DOMDYING_dead ) {
+        ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
+                                   msi_desc ? msi_desc->dev : NULL);
+        if ( ret )
+            goto done;
+    }
 
     forced_unbind = pirq_guest_force_unbind(d, info);
     if ( forced_unbind )
-- 
2.35.1


