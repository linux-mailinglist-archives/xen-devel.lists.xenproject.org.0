Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4112A83A475
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 09:45:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670792.1043795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSYsd-0002XS-5H; Wed, 24 Jan 2024 08:45:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670792.1043795; Wed, 24 Jan 2024 08:45:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSYsd-0002VS-1r; Wed, 24 Jan 2024 08:45:07 +0000
Received: by outflank-mailman (input) for mailman id 670792;
 Wed, 24 Jan 2024 08:45:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3ap=JC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rSYsc-0002VL-AB
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 08:45:06 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de3a5d49-ba94-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 09:45:04 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40eb95bd2c6so19979085e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 00:45:04 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 n31-20020a05600c501f00b0040ec7042dfesm743486wmr.21.2024.01.24.00.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 00:45:02 -0800 (PST)
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
X-Inumbo-ID: de3a5d49-ba94-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706085903; x=1706690703; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NLVMdBI3mGflXerzkzoRarMcDIqfvyEmvvtXMWjRZ8c=;
        b=cfwysfVYk8SBuLn5eXsdsRqOUPCYzTUp8BunmwwEbCdo4atfoLdm3egvyZX8SraS3J
         MISLZ1fMxRuNy2JyPPz1FXEB7yZfX+CekNaSZUiCAAJ94mmEGF7rS0TdzNWYsWwSoCMQ
         XkvAuRkyFomtlFPwba1s4zW3e9L2Ojlb8UzoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706085903; x=1706690703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLVMdBI3mGflXerzkzoRarMcDIqfvyEmvvtXMWjRZ8c=;
        b=Nhkxun/ytgrv9fP08IRPuTM4yVx4fwkBh5feEptx2XewZgEotodjCS6UD4RZGSmEI7
         DMUpNYmqJ1kXG7/FCN+Ff8bvVjr94MsHJxb48ZYk7FsSXdTW+dVWgv72wlIrrqFtLO+5
         oTb3N+Ar3HY0Q+35p+hMbixLp5Yg64UYjA+n/g/hKs2TNY2C+sjtK1IoaO+gLi5nbj8h
         w1krazu1qstb1c6BEGl2OF4R8yXHIAGgrQeIR5sZ/fby7k9NqZ0NH3jy3quJ1SzLSdLH
         sqReRM09EgovSydYTzN/0SmUocvCHPjkDZ9OyTkGwIgzQ3XYHf9aDbzci4eNCGlq6Ghx
         urVw==
X-Gm-Message-State: AOJu0YwTzwReh5bPVk1gg8jR21EvC9p84z9pzY+L7+Ozy+sVQU+eYe40
	J9vEYnXPhi7saDkFxh2RN5mE98748DtjWyYcaJ4iRFnoLCQsvSAUxlC/g6Cy+niMwedlNcURkIr
	V
X-Google-Smtp-Source: AGHT+IGg027fIPFKDB5PfP5DlsF2BuDnVpL9oPFkkFTG/cOFzDYC8eW/2CRXOE+evOmG7DQHjSGR/A==
X-Received: by 2002:a05:600c:5398:b0:40e:4afe:12eb with SMTP id hg24-20020a05600c539800b0040e4afe12ebmr914113wmb.188.1706085903023;
        Wed, 24 Jan 2024 00:45:03 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/p2m-pt: fix off by one in entry check assert
Date: Wed, 24 Jan 2024 09:37:42 +0100
Message-ID: <20240124083742.24324-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MMIO RO rangeset overlap check is bogus: the rangeset is inclusive so the
passed end mfn should be the last mfn to be mapped (not last + 1).

Fixes: 6fa1755644d0 ('amd/npt/shadow: replace assert that prevents creating 2M/1G MMIO entries')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm/p2m-pt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index 640a11f5647f..348130d0dd3b 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -552,7 +552,7 @@ static void check_entry(mfn_t mfn, p2m_type_t new, p2m_type_t old,
     if ( new == p2m_mmio_direct )
         ASSERT(!mfn_eq(mfn, INVALID_MFN) &&
                !rangeset_overlaps_range(mmio_ro_ranges, mfn_x(mfn),
-                                        mfn_x(mfn) + (1UL << order)));
+                                        mfn_x(mfn) + (1UL << order) - 1));
     else if ( p2m_allows_invalid_mfn(new) || new == p2m_invalid ||
               new == p2m_mmio_dm )
         ASSERT(mfn_valid(mfn) || mfn_eq(mfn, INVALID_MFN));
-- 
2.43.0


