Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5B199422C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 10:38:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812803.1225560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy5jP-0002El-KL; Tue, 08 Oct 2024 08:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812803.1225560; Tue, 08 Oct 2024 08:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy5jP-0002CJ-EV; Tue, 08 Oct 2024 08:38:11 +0000
Received: by outflank-mailman (input) for mailman id 812803;
 Tue, 08 Oct 2024 08:38:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/rYz=RE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sy5jN-00027a-G6
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 08:38:09 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4a090be-8550-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 10:38:08 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9950d27234so291934866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 01:38:07 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a993f13620dsm409753466b.215.2024.10.08.01.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 01:38:06 -0700 (PDT)
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
X-Inumbo-ID: a4a090be-8550-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728376687; x=1728981487; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m3rWamNd2rtptE3YePGwHSfGEHWYJhUnCLfE+jd0lUs=;
        b=v8rZwZQNKXgclQq1EDr1ddKbNI1MHlSCIks68bEMDnL/Yj/XSn+P2scIA44H+Cy4qK
         67cyvgLwKsGO31gp9C4A1xaCRjAa1HKzt+/0IW45cXNfu4m+hIjZA4EdtrhU8C2d4j3Q
         4dTCwqFbJKw6UTIr7ErKkIJm+hq5lvGT8VUdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728376687; x=1728981487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3rWamNd2rtptE3YePGwHSfGEHWYJhUnCLfE+jd0lUs=;
        b=DKVv9Uan/IrpOaU64IxOEdrscm/8/3/T+uYW4FOXSAmCh1j4M1YLPRNF+/YTGlnBVz
         w1D8izgwBHXGYrCGFQUEVKRarA5kx5wUBQYezb1IS62UBD02MUhUBeJKqYe/etczd+oy
         QHkuN3JOMfK++D5aWi6iO4T5ESN9/M71vbmevCQ9M4MqLUYcwKyVJ+3UFfHaXfQJ/ZOo
         cvS+rWHSzK0roKSMX2GiohUQfZyVheC6obrXOeavTueFthXIn09E3xe1DFAcuFRD6R8c
         DQSqYSIsZ04de19WaionIawtavnUmCS0t0+oJYxCyr8X9wTRRFWe0Uow0tCLoI1A3i5p
         BH+A==
X-Gm-Message-State: AOJu0YxMTn/6irznasKyToYAWAOG5+Gg3+p/zZjjAvqlMxFREEI1YWRk
	CGdd8/zmG0mkQ1ZsijyMwx7oC5yeR0AXq391CYVCQ2p+Alpgturu+ETe+EuIelbFx2dtXzlw2Bi
	A
X-Google-Smtp-Source: AGHT+IFZewXbZuFwWYvo/BnKc0vjjH0u4vA1EH8+3Nk1DBT90oUr5BgrimXMQU1AnM9Bmf41seUvXg==
X-Received: by 2002:a17:907:9304:b0:a8d:7b7d:8c39 with SMTP id a640c23a62f3a-a991c03145bmr1519329266b.43.1728376687011;
        Tue, 08 Oct 2024 01:38:07 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/domctl: fix maximum number of MSRs in XEN_DOMCTL_{get,set}_vcpu_msrs
Date: Tue,  8 Oct 2024 10:37:55 +0200
Message-ID: <20241008083756.72829-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since the addition of the MSR_AMD64_DR{1-4}_ADDRESS_MASK MSRs to the
msrs_to_send array, the calculations for the maximum number of MSRs that
the hypercall can handle is off by 4.

Remove the addition of 4 to the maximum number of MSRs that
XEN_DOMCTL_{set,get}_vcpu_msrs supports, as those are already part of the
array.

A further adjustment could be to subtract 4 from the maximum size if the DBEXT
CPUID feature is not exposed to the guest, but guest_{rd,wr}msr() will already
perform that check when fetching or loading the MSRs.  The maximum array is
used to indicate the caller of the buffer it needs to allocate in the get case,
and as an early input sanitation in the set case, using a buffer size slightly
lager than required is not an issue.

Fixes: 86d47adcd3c4 ('x86/msr: Handle MSR_AMD64_DR{0-3}_ADDRESS_MASK in the new MSR infrastructure')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I'm tempted to just get rid of nr_msrs and use ARRAY_SIZE(msrs_to_send)
instead, but refrained from doing it.
---
 xen/arch/x86/domctl.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index f76de5be9437..37ebcb3abbc7 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1088,10 +1088,6 @@ long arch_do_domctl(
              !is_pv_domain(d) )
             break;
 
-        /* Count maximum number of optional msrs. */
-        if ( boot_cpu_has(X86_FEATURE_DBEXT) )
-            nr_msrs += 4;
-
         if ( domctl->cmd == XEN_DOMCTL_get_vcpu_msrs )
         {
             ret = 0; copyback = true;
-- 
2.46.0


