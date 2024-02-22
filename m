Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB2685F3F5
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 10:07:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684258.1063987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd52a-0007ll-K1; Thu, 22 Feb 2024 09:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684258.1063987; Thu, 22 Feb 2024 09:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd52a-0007ge-F8; Thu, 22 Feb 2024 09:06:52 +0000
Received: by outflank-mailman (input) for mailman id 684258;
 Thu, 22 Feb 2024 09:06:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gCR=J7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rd52Z-0007eV-Li
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 09:06:51 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b73d0d3c-d161-11ee-8a55-1f161083a0e0;
 Thu, 22 Feb 2024 10:06:51 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-512be6fda52so4687372e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 01:06:51 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 fa27-20020a05600c519b00b004128812dcb6sm1172138wmb.28.2024.02.22.01.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 01:06:49 -0800 (PST)
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
X-Inumbo-ID: b73d0d3c-d161-11ee-8a55-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708592810; x=1709197610; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bH2mQPDEXai+re4kmllotrxpSIRK6T6FaHn93utR0MA=;
        b=Jjfj6KJsT+4Bn3V6yBgQeTeQFryg49hEUkmx70T1hp7w0ayV3tS/NWsVnu0dQ8uIfC
         GHJv1GsrrzWPPbD8Hu7H3KSuPQEsOOKiBQKr0eeq4nC2xKAECEr/ChcDzrlZqsBcORXq
         vXh8lpuot5pAz88YVQjpyIg9Qma4xrYsIuEQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708592810; x=1709197610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bH2mQPDEXai+re4kmllotrxpSIRK6T6FaHn93utR0MA=;
        b=XBF7L0wK6y72Bu9Lmm1TmjtxUUMGiarpH5RQxhSH0AAgpiYVuZOnyx1ptg7jFVCXZs
         clLelE3hNMtdGkXQzWvFi/SgwYD8fzMjLk21xFoIo0xbvkFB0WFPM8T4k50c62PUVrXr
         jObQtp+z+RNKAnM3dsCN/mwbP0rp6ytSNZmjRSXAxwJpXxzxoj6Y7/novLTea3foGV6w
         X/bWQao1MiStUW8bRbhNGqMgnV7EHWwK8OVtRVZktxEkLY8GW+zL67d/PDuM4gIa8fzP
         anphTgTn5rqDLNdbRbQVfxWX/PTzcv2DeKIyiXGWiQPFJ0nK+wYDwrXvJAuAJERY7Rtu
         IDig==
X-Gm-Message-State: AOJu0YyEWxCkxy5ZGe3lUnzPP52nhbsj6AmLcJ7rRV4pIKikQoBVI3bn
	v1nanrgcjD+EVzTxheX7Qvfs2uxlG8KRQT0FpajZBRULg2bld8hZimvo2BGCzldLmphnqahHUit
	3
X-Google-Smtp-Source: AGHT+IEVOhWolRmh36S3w5sq/YHv1CBFSFLI/qadi605FiMuwznoTB0h/XtNqavitfnG68w/Z8bmEw==
X-Received: by 2002:a05:6512:12c3:b0:511:8d49:4b4f with SMTP id p3-20020a05651212c300b005118d494b4fmr16125552lfg.6.1708592809958;
        Thu, 22 Feb 2024 01:06:49 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] x86/memsharing: use an atomic add instead of a cmpxchg loop
Date: Thu, 22 Feb 2024 10:05:29 +0100
Message-ID: <20240222090530.62530-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222090530.62530-1-roger.pau@citrix.com>
References: <20240222090530.62530-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The usage of a cmpxchg loop in get_next_handle() is unnecessary, as the same
can be achieved with an atomic increment, which is both simpler to read, and
avoid any need for a loop.

The cmpxchg usage is likely a remnant of 32bit support, which didn't have an
instruction to do an atomic 64bit add, and instead a cmpxchg had to be used.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-of-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm/mem_sharing.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 4f810706a315..fe299a2bf9aa 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -179,13 +179,7 @@ static void mem_sharing_page_unlock(struct page_info *pg)
 
 static shr_handle_t get_next_handle(void)
 {
-    /* Get the next handle get_page style */
-    uint64_t x, y = next_handle;
-    do {
-        x = y;
-    }
-    while ( (y = cmpxchg(&next_handle, x, x + 1)) != x );
-    return x + 1;
+    return arch_fetch_and_add(&next_handle, 1) + 1;
 }
 
 static atomic_t nr_saved_mfns   = ATOMIC_INIT(0);
-- 
2.43.0


