Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E424EAB993C
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 11:46:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986726.1372281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFreP-0007zG-82; Fri, 16 May 2025 09:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986726.1372281; Fri, 16 May 2025 09:46:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFreP-0007wf-4S; Fri, 16 May 2025 09:46:45 +0000
Received: by outflank-mailman (input) for mailman id 986726;
 Fri, 16 May 2025 09:46:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UFMR=YA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFreN-0006aW-OK
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 09:46:43 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac17ecaa-323a-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 11:46:43 +0200 (CEST)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-231e21d3b63so5110425ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 02:46:43 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-231d4ed4815sm10598225ad.232.2025.05.16.02.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 02:46:39 -0700 (PDT)
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
X-Inumbo-ID: ac17ecaa-323a-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747388800; x=1747993600; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6U99Ry1WVYMmbFKuOmzFIjAmeVmHGjlnI3oGFyiiOks=;
        b=Jccy2V2VzBv1vFN+xqIbUtFmFuGGi6QSkj1Ct3TSAOuGo3njdbmkSIyoDsasYLV1N3
         h0kOg5Iu7SSmy2KetErMZgW7FwTdGljMnWI1N33AmrDz9VXb9XJH4Iqo04jO+zDf7gOD
         IB8O5Y9PaMFS7m9o686wHyWML/VVEDDTUxn5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747388800; x=1747993600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6U99Ry1WVYMmbFKuOmzFIjAmeVmHGjlnI3oGFyiiOks=;
        b=ZItx3t3Kzx5gAIXnK4PrxUUmrU2v/fNIh2lII4+Vgumxy5DPJT5L75yf/tNNgt2IGf
         1p+Qr2ehgrrbWOZDq5yOYcnRjDVkTlZ2HC50onJqmanVH+hTPIps2TMAs6A8UR0OZHE6
         fYJop7WlITEPDHcFgKV46seWkWg3jnb2SNk+Y+WJ2JD+usM706KxvI5HGeJPw2JrdOjd
         PvqxSVOI2LdhVLoLWSdrWxfGi61jKWvDlCqHv2VZ52feJXijuFjqowMq7vY9W8ZXEx08
         F33rkTRgbuvkDGzGEDTbbRWf2D2cQklpdl4g4bxc/5QKX8L9rbiW/NSnd/jQful6JbSX
         /4Nw==
X-Gm-Message-State: AOJu0Yz943JxEjVVkztGgKqL0s8LmdWnQkG39fd3Rm5XfiMBpKAahsjF
	pJxEgYPnW24bZRML2Tg3dCmNcuJBBzL1cPeEML28LMmJerY0ZXF7FdoBqoZni9JVDjaOcxNVYoj
	gugDj
X-Gm-Gg: ASbGncsTAuhO+K5nE96RTnHv7b/if8pjv63DGv257HpLXwAMo8O5wBmHaDKJ3t2GcVU
	6NDzo+6E/hpFd87hoG8dLnj9os52nRcXHdMLbDGZoWZrCwjxAG2P1DMUNrH3pEfCNmm94OyswM0
	5juwhLIXfgPr1l155LVJit7bIwW8cfe9GM+321LQUiU1Bxt6Lb68W7DWHM/dMc8jArpwAUTEPvO
	J8MynmW6KY9hNdpNN/GJvRaVkMNY/O4uZOJoUcPcIul+ojGzXnaXAG7rREzRslWYbqVsgLhBoWR
	4bG4l0Bb4pDsy2sWLDw0m6pIqIHnhg/XHps4ZujdyfRTVzLGoF4wi3aV6xUs/5zbWgETqx/EwD2
	A5D1+/iChvOIEcB09sgI=
X-Google-Smtp-Source: AGHT+IF3R+hS8MIAWD2a/8/cnz9/vji5b/bFgFiq/QwRydJc1PMVSUyRNAB6inv8G1M3Iz3XhHpqLg==
X-Received: by 2002:a17:902:d486:b0:224:1609:a74a with SMTP id d9443c01a7336-231de3ae59amr26808835ad.34.1747388800407;
        Fri, 16 May 2025 02:46:40 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 5/6] x86/hvm: limit memory type cache flush to running domains
Date: Fri, 16 May 2025 11:45:34 +0200
Message-ID: <20250516094535.63472-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250516094535.63472-1-roger.pau@citrix.com>
References: <20250516094535.63472-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Avoid the cache flush if the domain is not yet running.  There shouldn't be
any cached data resulting from domain accesses that need flushing, as the
domain hasn't run yet.

No change in domain observable behavior intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/hvm/mtrr.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index 402a1d926337..8e1e15af8d73 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -783,7 +783,13 @@ HVM_REGISTER_SAVE_RESTORE(MTRR, hvm_save_mtrr_msr, NULL, hvm_load_mtrr_msr, 1,
 void memory_type_changed(struct domain *d)
 {
     if ( (is_iommu_enabled(d) || cache_flush_permitted(d)) &&
-         d->vcpu && d->vcpu[0] && p2m_memory_type_changed(d) )
+         d->vcpu && d->vcpu[0] && p2m_memory_type_changed(d) &&
+         /*
+          * Do the p2m type-change, but skip the cache flush if the domain is
+          * not yet running.  The check for creation_finished must strictly be
+          * done after the call to p2m_memory_type_changed().
+          */
+         d->creation_finished )
     {
         flush_all(FLUSH_CACHE);
     }
-- 
2.48.1


