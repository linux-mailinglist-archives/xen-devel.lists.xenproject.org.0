Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMawEpG7xmnoNwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 18:17:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5AB3482AE
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 18:17:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1266057.1556681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w6Anb-0006ph-N5; Fri, 27 Mar 2026 17:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1266057.1556681; Fri, 27 Mar 2026 17:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w6Anb-0006ms-K6; Fri, 27 Mar 2026 17:16:43 +0000
Received: by outflank-mailman (input) for mailman id 1266057;
 Fri, 27 Mar 2026 17:16:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1w6AnZ-0006mm-Ut
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 17:16:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w6AnY-00E3WY-RE
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 18:16:40 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69c6bb5d-2eae-0a2a0a5409dd-0a2a4504af5c-38
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 18:16:40 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69c6bb78-c823-0a2a45040019-d1558031cd85-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 18:16:40 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-486fda2a389so19183475e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 10:16:40 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722d2366dsm98991055e9.10.2026.03.27.10.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 10:16:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1774631800; x=1775236600; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VEaJHVlFf1RyDf4mFUIyI/gmCJzqHaIWFNIxE0++FM=;
        b=qcX3BxREjvW1Xd4H8AdvNkvVo1k+FQ3UBgD1coSDdGtIUr3sgY3fvVp2tYlp8nWkBr
         vj2JJnB6cDN3TRJaMxegby6BPeU850/JUbbNdE7evCI5NAZGf7D6r8fY7i9DZWqB7IPZ
         NXzLzFkA5270LYK2kyLlKYUVCEejgSm9JZfh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774631800; x=1775236600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0VEaJHVlFf1RyDf4mFUIyI/gmCJzqHaIWFNIxE0++FM=;
        b=Ceek3SERmPjUrGYI3YMEpeZV5GzkQcz+Q+FIZ+RUvrry1t6J9xRMXrclqcKy/dg+bQ
         ULOQp2h5QZK0A1roXbTkIJ1Cdw0y1+7XFah0gjFa1WUrycQIdM0PO21VIbdzhhzmOPo9
         XJwdvLLsQ1i2pqAVWG5IVk7dowRzLwDR77Ck9Qlfmn04HW2bRzj4fgs6blSuvSAugCwq
         mNdTr+/rXWSbkQr4R3sfqyYj8RC1ya4S5HTNv5xmwmlqdULvNoNnFVHdZG9Tea+J/xr8
         pdLv4sc1WLZ1W01sFjsemyd4JHUX0u5lVwHDwp7TeUhzFabJQ3O2NUndq5Dz/XW5LeVx
         XI3A==
X-Gm-Message-State: AOJu0YxPRG4JsNHGLsdGkl9uwtTDhEf1lsQjJujazPzhXytS146dsQUz
	sfHxtjzlbdQCbDxQGEpQk/6CfUsh/NGRF3pfS+e2TKAAoLEjDYjRXjsnJzMdM7YeX+goBEKFcHd
	ABwNd
X-Gm-Gg: ATEYQzz3HJU+QTXi/mbF7dTogp2bhCYg0JmHcwGRVZN90xeEySkdLvaI6qxdyOxHiXK
	zSpHEc0RRj6fGf/lBIO6YM0Gv1LQ893foyU9rIjWFdGiKsKQRY+qYMxPRvTclRPzA1fGWeO3BMg
	OJGnVreNXsntQROihHjVwzyqz/9x3z9GimhfSjVHMsqu89VCznh7Es7iKmSRn+5i7W0iOfn+NiK
	oNGlP1a5v6F3sbjHCoJuh3qYudw4P8e4P8dVOsLcwCs7yUyeDpVoVHfwGk5XyJqK7h0CM8OArkc
	/wdpopTShqmJOw0pFhdnixDyS1JKaTnfIMxwg5dN11imvmozdfNGIPuKTYX7jexDcZAQLKQxTst
	1QX7eCok0NU1ZhnBtiY64MroO+sfwp5zX0FvDeGXtLtksk4as6r77V1O0OWKE6OM2ZR/cAkx03c
	3nlCiDJxDN+b5QcYTYGp69o7+sOMgg/8pJUyt+dqQ3QFI/hdpBvMos6xGceme0VvzwsRrDXKp3W
	wbk
X-Received: by 2002:a05:600c:8b63:b0:482:f564:d613 with SMTP id 5b1f17b1804b1-48727eafa46mr51482005e9.15.1774631798963;
        Fri, 27 Mar 2026 10:16:38 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 2/2] x86/fpu: Initialise FTW in xstate_alloc_save_area()
Date: Fri, 27 Mar 2026 17:16:36 +0000
Message-Id: <20260327171636.1182604-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260326190429.1156367-3-andrew.cooper3@citrix.com>
References: <20260326190429.1156367-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1774631800-B8A8E9D1-81B5EAC6/0/0
X-purgate-type: clean
X-purgate-size: 1964
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DF5AB3482AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Right now, xstate_alloc_save_area() leaves both XSTATE_BV and FTW clear.  This
causes a difference in behaviour between FXRSTOR and XRSTOR.

Switch to using using XSTATE's idea of initial configuration which will behave
the same even on pre-XSAVE hardware.  Expand the comment to explain why.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>

v2:
 * Rewrite the commmit message and comment.
---
 xen/arch/x86/xstate.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index e990abc9d18c..defe9b3f0cbe 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -550,11 +550,22 @@ int xstate_alloc_save_area(struct vcpu *v)
         return -ENOMEM;
 
     /*
-     * Set the memory image to default values, but don't force the context
-     * to be loaded from memory (i.e. keep save_area->xsave_hdr.xstate_bv
-     * clear).
+     * We're creating a vCPU, so conceptually we should be choosing the
+     * architectural #RESET values.
+     *
+     * However for historical reasons of configuring the external
+     * co-processor, FCW's #RESET state is different to what F(N)INIT and
+     * XSTATE consider the "initial configuration".
+     *
+     * Guests won't care about the difference; all software tends to executes
+     * FNINIT very early during setup.
+     *
+     * Use XSTATE's idea of initial configuration.  This allows XSTATE_BV to
+     * remain clear and for CPUs to use the INIT optimisation where
+     * applicable.
      */
     save_area->fpu_sse.fcw = FCW_DEFAULT;
+    save_area->fpu_sse.ftw = FXSAVE_FTW_RESET;
     save_area->fpu_sse.mxcsr = MXCSR_DEFAULT;
 
     v->arch.xsave_area = save_area;
-- 
2.39.5


