Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8F483BD5D
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 10:32:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671417.1044753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSw5Z-0008Cx-Q4; Thu, 25 Jan 2024 09:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671417.1044753; Thu, 25 Jan 2024 09:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSw5Z-0008A4-NJ; Thu, 25 Jan 2024 09:32:01 +0000
Received: by outflank-mailman (input) for mailman id 671417;
 Thu, 25 Jan 2024 09:31:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=etx6=JD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rSw5X-0007vY-Jk
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 09:31:59 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9526b459-bb64-11ee-98f5-6d05b1d4d9a1;
 Thu, 25 Jan 2024 10:31:58 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-55a8fd60af0so5938968a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 01:31:56 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 wh22-20020a170906fd1600b00a30fc529f25sm821405ejb.199.2024.01.25.01.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 01:31:55 -0800 (PST)
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
X-Inumbo-ID: 9526b459-bb64-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706175116; x=1706779916; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vP6sfxLmfNUVHHugUyr46Hq2QM66JBX8dinWtvdjh4=;
        b=ZMAIwqKeIyW9Nj5Sdj9lnpf5mtz2x9YgxecdmziGc1NYmp1y50LwN/rRn0HcNiKMWy
         OlevOx9KrO65cU1wU5TQHEpDrrVGEP7p4/aRGJ4bc6MSDsUhLnTaYEuinYSpBunzYnWo
         NPRNIj6YQ7f7mLSYWT/VkNH4cM/VyLfpSUAn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706175116; x=1706779916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vP6sfxLmfNUVHHugUyr46Hq2QM66JBX8dinWtvdjh4=;
        b=rFFfaJ8EB23TTimwBv7NkA8p/P5FzJBmCTlkYs+WMartDC9QMu3NtG5yQjOM2YbaFK
         H6quHuLwd0EqHx80r30c0+HJbpPdECYdS6UP+P4/4/nxww76sQWbHJQs+X+S+EnRmuDu
         uTjWMne6xJS2QT35363acq1c0n0LXnryEO/izmjE1d9LSJorBrMUiV8al+7jQwr2QXwM
         I8cNlUM853Mux4SXFMj9culVs2Lcvn87yqY3yRXMdiSm8giKGVVAFYADd67IoXz2GsRM
         Ofbv8AVBR6lcSNsrbtbdejSTzWzQbqp5eUbpaJZOIlPNfEJqGE7YxcjoQGtWnI+dqkYI
         t0GQ==
X-Gm-Message-State: AOJu0YzBWL4SA8CcNANYgacb8hoGO0PSqTLWa2O44Zk6w4EhP+Et3t5i
	to/NyoPLA9Jky4NdGMY0XQCIn1R4EGmSWZSPH2P1RBtvc5pj8K/ik04pS+TbIcs684FF28f3frO
	M
X-Google-Smtp-Source: AGHT+IFkcCmiMKZzVykMGtuqpJz06SojcWRYZe1/Dui3aHOSq/Z+oZXED+GXSKOdmrQNcyHlHV0oKg==
X-Received: by 2002:a17:907:a708:b0:a31:8c1e:5ced with SMTP id vw8-20020a170907a70800b00a318c1e5cedmr121647ejc.76.1706175115746;
        Thu, 25 Jan 2024 01:31:55 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 1/2] x86/hvm: make X86_EMU_USE_PIRQ optional
Date: Thu, 25 Jan 2024 10:30:40 +0100
Message-ID: <20240125093041.33087-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125093041.33087-1-roger.pau@citrix.com>
References: <20240125093041.33087-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allow selecting X86_EMU_USE_PIRQ for HVM guests, so it's no longer mandated to
be always on.

There's no restriction in Xen that forces such feature to be always on for HVM
guests, as for example PVH guests don't support it, as such allow toolstack to
select whether to enabled it on a per-domain basis.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Split hypervisor side from previous patch.
---
 xen/arch/x86/domain.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 8a31d18f6967..bda853e3c92b 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -725,7 +725,9 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
              emflags != (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC) )
             return false;
         if ( !is_hardware_domain(d) &&
-             emflags != (X86_EMU_ALL & ~X86_EMU_VPCI) &&
+             /* HVM PIRQ feature is user-selectable. */
+             (emflags & ~X86_EMU_USE_PIRQ) !=
+             (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
              emflags != X86_EMU_LAPIC )
             return false;
     }
-- 
2.43.0


