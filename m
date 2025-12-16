Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843CBCC44F5
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 17:33:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188084.1509361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVXyc-00027j-Fr; Tue, 16 Dec 2025 16:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188084.1509361; Tue, 16 Dec 2025 16:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVXyc-00025U-CH; Tue, 16 Dec 2025 16:32:42 +0000
Received: by outflank-mailman (input) for mailman id 1188084;
 Tue, 16 Dec 2025 16:32:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6n8=6W=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vVXya-0001QJ-Pi
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 16:32:40 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d618581b-da9c-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 17:32:39 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso48128635e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 08:32:39 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bd994a221sm12994765e9.7.2025.12.16.08.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 08:32:36 -0800 (PST)
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
X-Inumbo-ID: d618581b-da9c-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765902758; x=1766507558; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6MmJLh1zedBGYOEKBR6Zhdpkfv4rz6s7azRwwDKfXc=;
        b=jm7sYpSWm9Y3wA3bkW2SyZQG/aiMPdq03oVTFZNBk3DQxRod5tsc0nSyF5qLpE0Ju4
         6VFqC8wF1RhkiDS/YuumhK8qiErcym33bBTV4GYWEr+8h0uzxC/z2Wr7KwV/ohLAuAhl
         FyIZQ+3T8eCHTBHQsSIMyeiEjzORwZB62UeiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765902758; x=1766507558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W6MmJLh1zedBGYOEKBR6Zhdpkfv4rz6s7azRwwDKfXc=;
        b=CfCkNHaS/FnPgvfgVmfb6ixMRU4V134ubp8LiHnqkOnmIiLIv91Z9if2ZCEdDQmPfS
         e1S7MuOuiTd13BR+CCf5vgPaHK0SnSD3Rx3psqdeElDv0LoCBDk4GRhNBtwk1e5vl81w
         KGIVM7xmHPVvWkZUbSNWVYtD6dqByssmYkRFK3/V6BM7fiGL66suOdFaBLDOWwDrMHij
         bfpefYEOLH/AbiZqYMvuVQn2sqVd6dsE+7Oz31Whz5wmX5Zo6T2uawBP2reE1e7Gnfc1
         iEVp0GtqG2rVln/R9LvUq7ZNdd2M0XfFt3BYuypQOazrLwvT7DUbCyfUHD8xSQMEvAWJ
         Gdlg==
X-Gm-Message-State: AOJu0Yxe+xPLKtmgr+fVg4VxU/waGHIaiXKAdLiFJs/BblRDS8YbezYx
	fEOHpTiMhs330rbnCumXXkTOlWPrWzch3QK3tq874D3gOvjERW+O3MnN4M2Adb1q1s1ZXDhCV1w
	fNA8w
X-Gm-Gg: AY/fxX6t8hnXQVyWMkqyiRcvOQAjyovOE37ylLKQvDmf6ip1qaVqSQ5J/o3hY7wmCgb
	bRwXPn5ZqPhejraismbYopLbBrg3p9VlSnxw73JO35bxepFf0YQQVhFbD8c7qiYw+Bv2EjTmRjn
	HqNgIK62LQKyWqQHmmBGyvPS42tq3nqrGXTNL3dvhkOSnoMAtFb31jV9+kK7ZIqmVC54V1y4pFI
	TF8OC/YFtsJ9cS4avnlFbVGF2LrwuhhPAI1tMRYrdFJJt0Wf+nzptdy16NjTfrcmaPyDGkXNYQg
	/VLUOHxoVGIGiq4iVoffka9upKASOrqNB3Cj2Iwr1e30Y5Hsvi83GfVtqLTny81eZ+MwKcgcfjs
	Jvqe95kIqL4Q0AzF9QfrYlDDwBjeCmTxCTK2/KevXxH326jZ1tP2JQ/b0FA/XzYBgsg4pNMtdF8
	D3/swLc8CF6OAbZw7QoJ6Cb2Fgc6ChbjljmcX+JxVKDXXK1EwXL3O7VF6qqYreag==
X-Google-Smtp-Source: AGHT+IEGipICJb4JSzbzK0o4frKIyWRr5GCOORTNhsNH3E1yt67Zo6pTCUJjYuMnO0Bux+AQ/LiqiA==
X-Received: by 2002:a05:600c:3ba3:b0:477:a219:cdc3 with SMTP id 5b1f17b1804b1-47a8f1c33c5mr186972085e9.12.1765902757451;
        Tue, 16 Dec 2025 08:32:37 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/4] tools/libxc: Delete ENOSYS squashing in xc_domain_claim_pages()
Date: Tue, 16 Dec 2025 16:32:28 +0000
Message-Id: <20251216163230.2768186-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251216163230.2768186-1-andrew.cooper3@citrix.com>
References: <20251216163230.2768186-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's not acceptable to hide this from the caller; the effect of doing so is to
break an atomicity expectation.

Only the caller can know what the appropriate safety action is in the case
that the claim hypercall isn't available.

Fixes: fc67e9dc0c1f ("xc: use XENMEM_claim_pages hypercall during guest creation.")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 tools/libs/ctrl/xc_domain.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 2ddc3f4f426d..01c0669c8863 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1074,7 +1074,6 @@ int xc_domain_claim_pages(xc_interface *xch,
                                uint32_t domid,
                                unsigned long nr_pages)
 {
-    int err;
     struct xen_memory_reservation reservation = {
         .nr_extents   = nr_pages,
         .extent_order = 0,
@@ -1082,13 +1081,7 @@ int xc_domain_claim_pages(xc_interface *xch,
         .domid        = domid
     };
 
-    set_xen_guest_handle(reservation.extent_start, HYPERCALL_BUFFER_NULL);
-
-    err = xc_memory_op(xch, XENMEM_claim_pages, &reservation, sizeof(reservation));
-    /* Ignore it if the hypervisor does not support the call. */
-    if (err == -1 && errno == ENOSYS)
-        err = errno = 0;
-    return err;
+    return xc_memory_op(xch, XENMEM_claim_pages, &reservation, sizeof(reservation));
 }
 
 int xc_domain_populate_physmap(xc_interface *xch,
-- 
2.39.5


