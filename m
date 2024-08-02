Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC5A945A48
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 10:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770745.1181339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZnzz-0002Hg-GY; Fri, 02 Aug 2024 08:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770745.1181339; Fri, 02 Aug 2024 08:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZnzz-0002G0-Dc; Fri, 02 Aug 2024 08:50:55 +0000
Received: by outflank-mailman (input) for mailman id 770745;
 Fri, 02 Aug 2024 08:50:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GvaU=PB=gmail.com=adobriyan@srs-se1.protection.inumbo.net>)
 id 1sZnzx-0002FB-Pi
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 08:50:53 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5303527f-50ac-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 10:50:53 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7aa212c1c9so998299266b.2
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 01:50:53 -0700 (PDT)
Received: from p183 ([46.53.254.37]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bc3c7asm75265566b.14.2024.08.02.01.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 01:50:51 -0700 (PDT)
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
X-Inumbo-ID: 5303527f-50ac-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722588652; x=1723193452; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AYmXBmScurZjis0yN5U9wEBN6bdZcv2HfflbnZA48t8=;
        b=htia0v2UEJwW4O5UHGMViuHsKTroOrrhAMvRq1GlxnDCmvgqgIjtwoUeudLV0BtLi6
         Xewt/RkchXlWu2cs2733UmGJUxPtorOUALbH+2JkwGhIH2AQ+OdKhddiwFK47JAiXXpk
         7FfTYvgAPiZC/2xC4EfA6a5iGsqSJd+BZdrAEy6yi3lGEV8obweKvP8uiMdeTh8Klt5u
         qei+Jpw/pUhYv4PWntzngd0ZGyzTijkDSY3s7PPZDNz5jAab/K3UxyF1QAVqXpjY3sd6
         XL9fZXPComI9lP1r5HzDS1Ht2p6/NO2dDpZ430jGx37pJZyKGsCCjOj+1BMbBXRbpCDS
         1G0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722588652; x=1723193452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYmXBmScurZjis0yN5U9wEBN6bdZcv2HfflbnZA48t8=;
        b=J37IqX7y5W2/0FyP2lDQ5hEWXlxQLxdUbJ8YmN0ChcdWG/hqRniX5UQvYvC+aAHWvK
         hl0+PwQJjac7jiSVpoBkHK55k4QFVE1APT/Uzpj0LqmMInfkUX8RtE3p9hy4YeIJB35I
         QDkIok7lisJW0Qn+ouSzUngH0e8WTvlybdMvK7eRDXbGcJ9HWIDGCHwbHC0kfcDTH9Ww
         3IKXI02+yAGa3QLCRNgJMzRWT2kZy2G1fTbHmke4MhHroxtdxUnraWRI3R7h5MEN+TWZ
         R0H/xn1jXaghNP+jfhwHh6a0BkXErD+a9ghdQmSR/vOPFhyTPIixyt0ZTgovU08EozTq
         Y6KQ==
X-Gm-Message-State: AOJu0YxI15RmnmzYthn+L5QfFX/IqAZIUd0exYyV1jKlkDnEJKsLNaLt
	FZ2mJvyRZAtt0Guh1RtzhSFEItrGm/iWH/9YeUEzOoW8gsJsnnU=
X-Google-Smtp-Source: AGHT+IFvK4orbI6LNsELu/xB64uvyazNJRbDa2ZxQyhuby6J4ozn+wdc3m9XD6dtz9mA9DlnIRxaMQ==
X-Received: by 2002:a17:907:94c5:b0:a77:f2c5:84b3 with SMTP id a640c23a62f3a-a7dc4e5a4edmr205120666b.22.1722588652017;
        Fri, 02 Aug 2024 01:50:52 -0700 (PDT)
Date: Fri, 2 Aug 2024 11:50:49 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [PATCH 2/3] x86/cpu: fix unbootable VMs by inlining memcmp in
 hypervisor_cpuid_base
Message-ID: <304592cf-e4a7-4ba1-baa6-4941c60f0e3c@p183>
References: <a9f505a6-fd31-4cfa-a193-d21638bb14f1@p183>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a9f505a6-fd31-4cfa-a193-d21638bb14f1@p183>

If this memcmp() is not inlined then PVH early boot code can call
into KASAN-instrumented memcmp() which results in unbootable VMs:

	pvh_start_xen
	xen_prepare_pvh
	xen_cpuid_base
	hypervisor_cpuid_base
	memcmp

Ubuntu's gcc version 11.4.0 (Ubuntu 11.4.0-1ubuntu1~22.04) inlines
memcmp with patch and the bug is partially fixed.

Leave FIXME just in case someone cares enough to compare 3 pairs of
integers like 3 pairs of integers.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 arch/x86/include/asm/cpuid.h | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/cpuid.h b/arch/x86/include/asm/cpuid.h
index 6b122a31da06..3eca7824430e 100644
--- a/arch/x86/include/asm/cpuid.h
+++ b/arch/x86/include/asm/cpuid.h
@@ -196,7 +196,20 @@ static inline uint32_t hypervisor_cpuid_base(const char *sig, uint32_t leaves)
 	for_each_possible_hypervisor_cpuid_base(base) {
 		cpuid(base, &eax, &signature[0], &signature[1], &signature[2]);
 
-		if (!memcmp(sig, signature, 12) &&
+		/*
+		 * FIXME rewrite cpuid comparators to accept uint32_t[3].
+		 *
+		 * This memcmp()
+		 * a) is called from PVH early boot code
+		 *    before instrumentation is set up,
+		 * b) may be compiled to "call memcmp" (not inlined),
+		 * c) memcmp() itself may be instrumented.
+		 *
+		 * Any combination of 2 is fine, but all 3 aren't.
+		 *
+		 * Force inline this function call.
+		 */
+		if (!__builtin_memcmp(sig, signature, 12) &&
 		    (leaves == 0 || ((eax - base) >= leaves)))
 			return base;
 	}

