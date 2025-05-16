Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9352AB9932
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 11:46:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986700.1372239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrde-0005sT-68; Fri, 16 May 2025 09:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986700.1372239; Fri, 16 May 2025 09:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrde-0005qT-2z; Fri, 16 May 2025 09:45:58 +0000
Received: by outflank-mailman (input) for mailman id 986700;
 Fri, 16 May 2025 09:45:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UFMR=YA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFrdd-0005Zo-45
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 09:45:57 +0000
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [2607:f8b0:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fa32de5-323a-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 11:45:55 +0200 (CEST)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-74251cb4a05so2664544b3a.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 02:45:55 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-742a982b862sm1189293b3a.105.2025.05.16.02.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 02:45:52 -0700 (PDT)
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
X-Inumbo-ID: 8fa32de5-323a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747388753; x=1747993553; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93X5Yg3wMInb8uao5HlZu8C6yt5D96Z1mKvVI2CvQcU=;
        b=gtwsatLZzEg8lpQUGrOaTkHwKhSimQz6RbM0TAD6/PnlyiuZ2j8rfy5/60rjFuOCYk
         ZjsJNG3mICKddzrQ5g4W2PSZzJLt704J0Gan3T9VTZJ4FwXck+9GkMfd/FI7LlDGu8Th
         0ENsrfj2gkUNyv28tv5F80m4Cs3TX64AwCP8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747388753; x=1747993553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93X5Yg3wMInb8uao5HlZu8C6yt5D96Z1mKvVI2CvQcU=;
        b=eDPSbFiiwkFlYYsPeDHdsqavj1C+6YdpGR8J/pjxwBHYKjgIMtBAUrReoMG347hX2L
         Z50Q//7tjOnqThioByR1OpndiZKyp1S7m+iMEuirAvfzHMxPIfHo13eeYA4JJS9WJL9L
         UJ4qFejKyaa9diYoK6wOWlfLQSkRrwUukAdG6VygG+81qZFHKh/sMjsldTkY/RRSj67c
         5QQ8W148xM54Cbc6ViUoVrmVBpGwuH/5wpQBGdvbqHG0bfSvnDRl31tSMxhgKGVcgw2/
         /t8gB+fGjciq8+xGOIreaNzqFD/ca+iAJGhY56xOD+znRqllYLNiy/eMOdihO2VwNvpZ
         8XjA==
X-Gm-Message-State: AOJu0YwhbvBPr691DFSi6m9SrkwKPVxEz7yEBd2TmBeQmqWNKlgiOO5q
	HQ8TXs780ri1BVjQ0JDV5NcMiD1GplhIGBBCJZBPxs/WG3SwkoRsa7E75yNwIgJG/7DGatJfLdH
	FPkVW
X-Gm-Gg: ASbGncvzRsWbdDtNX3dqK6gzQdwH7nQDnokkFcpuQLdDqJ6XjzVtuysr7Y80srZgoQV
	uSDo8yN8cHw9amFsKndzjaBRFfQb7vijt8uquWX9B6nRrGCP2j8d60dL6PQYYkJxbbjgFmksY56
	LVY8YPNMeFASiqbxZDYvXR1IPRBXGct9+v78/cQEaqQpPa3IvnX6ebpa62SxLWo8CLxmcxzruKM
	dqWSDxeKtRClTQHiRdUZo/UMIOaPsSEaVNO2CxD+mhMcdqnzZWHbqKQ0M6YnAR9qTPVPQT20+g/
	WF171VGaGIc2VBpIWfOMbUx3+mHuBpIXq1y6MnySk7Gm09AEjjYxfIiPp8XAX+gPQDoWlYoIGRK
	iqMJngKTew0u9mG19xvU=
X-Google-Smtp-Source: AGHT+IGmn3MvOmV8mmHycD0BBlPLXNGiENIKJLel6O1rrj6kzeKAaYj95YHcYfV7Su6LkSP1oyOhrA==
X-Received: by 2002:a05:6a20:4329:b0:215:d217:2194 with SMTP id adf61e73a8af0-216219ed0cemr4716758637.34.1747388753189;
        Fri, 16 May 2025 02:45:53 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 1/6] x86/pv: fix emulation of wb{,no}invd to flush all pCPU caches
Date: Fri, 16 May 2025 11:45:30 +0200
Message-ID: <20250516094535.63472-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250516094535.63472-1-roger.pau@citrix.com>
References: <20250516094535.63472-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current emulation of wb{,no}invd is bogus for PV guests: it will only
flush the current pCPU cache, without taking into account pCPUs where the
vCPU had run previously.  Resort to flushing the cache on all host pCPUs to
make it correct.

Fixes: 799fed0a7cc5 ("Priv-op emulation in Xen, for RDMSR/WRMSR/WBINVD")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Use the recently introduced FLUSH_CACHE_WRITEBACK.
---
 xen/arch/x86/pv/emul-priv-op.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 295d847ea24c..20a90703c83c 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1198,13 +1198,13 @@ static int cf_check cache_op(
     if ( !cache_flush_permitted(current->domain) )
         /*
          * Non-physdev domain attempted WBINVD; ignore for now since
-         * newer linux uses this in some start-of-day timing loops.
+         * Linux uses this in some start-of-day code.
          */
         ;
     else if ( op == x86emul_wbnoinvd /* && cpu_has_wbnoinvd */ )
-        wbnoinvd();
+        flush_all(FLUSH_CACHE_WRITEBACK);
     else
-        wbinvd();
+        flush_all(FLUSH_CACHE);
 
     return X86EMUL_OKAY;
 }
-- 
2.48.1


