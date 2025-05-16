Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75525ABA6C8
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 01:58:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987833.1373032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4vg-0007zw-Gv; Fri, 16 May 2025 23:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987833.1373032; Fri, 16 May 2025 23:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4vg-0007xj-De; Fri, 16 May 2025 23:57:28 +0000
Received: by outflank-mailman (input) for mailman id 987833;
 Fri, 16 May 2025 23:57:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T4W4=YA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uG4vf-0007xc-2q
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 23:57:27 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83752410-32b1-11f0-9ffb-bf95429c2676;
 Sat, 17 May 2025 01:57:24 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so26818005e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 16:57:24 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f33691fdsm128034525e9.5.2025.05.16.16.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 16:57:23 -0700 (PDT)
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
X-Inumbo-ID: 83752410-32b1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747439844; x=1748044644; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CPVqfVtdG0aOQXYN7JFT5fl0p6ZdZ28JyC5/O6ufdzc=;
        b=SsAY9zw4vxT/Fe1u1t9FuB/LYYnqlSFXXowAdq5PPCIOrBAR2puGP0WiKII6hOu52t
         8VwQBrzEdVoVSitlfFmdNA+CGFWI6hs5quMhU2BUmrJi2tboKhHHKoWy1bVyzNaAEpQT
         OailsxKTsHecte4JhqT1zgeo5mEuK2UGIhyms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747439844; x=1748044644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPVqfVtdG0aOQXYN7JFT5fl0p6ZdZ28JyC5/O6ufdzc=;
        b=sVsFyMqXfCwX5BSHVMIR8evK9ehCA8On7uwNyBloXjAFkoyiOm7qVK7yPXuetAGCAF
         CEC4eXd1EL72TamvTRZtDklLnEN3VLLzw/xUsnT+yM8QdqjWFfmwrN6cSgq+aaQj7HOq
         XekY4lQtYDpk05M5O+J5hYSYjOLg6EOuEI53mdE1QZomCps8b/cN32DmRCwqSrKQge0r
         1FSQfK+rbaLGAMcNn8Qeo34Th8iJM66z1GZFKyA6Eq2bEwEqS1TleAoljnQgIrVVJxwI
         f4d9vTP58t0ys6C6j6jMCrjuxDkBceFev3yfG8veD97GrDkwfRkZBEmCaHArNS0civoe
         jyLw==
X-Forwarded-Encrypted: i=1; AJvYcCUOJWKyToCrk4VD7VjZvUCauUwuwWj1Lxchi9vHp3+NPX43b6UjArD2jPeAC6rU3KKrZZLPAzP1qHs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFpQY1Vzf9/oEPaCuJ8o7yxxquyvC/iapow16lLataAf06P+Ri
	Z32A9yEjaW2l1SclhuXW0zL2jRcR7xNMEjGFBdgnFDBlKPPjQHGcHchym6LpWiLmD0w=
X-Gm-Gg: ASbGncsqB22LAPKzv2+Wr9Q3cCJpLwu7g64qiu30VNvbKWcTs3gFZSN+xMq+y6ijaqT
	RTMTV05/vvArGuV3idUc7MKdc2BubxwxrPLijVUAU7zKp8bWGZq0JGpkCBb59rW4CYOZWbhO5gb
	QRs9BBMPa50cUT691dUctSiJQgPtZAuq6/mq+PnGyBzQ4vlEoqSMbloV/vP/Ta+1vtzT0ccQb7a
	buerR64y4lGExYXHIAwdPH1VfTAKF80XFzt90tYVL9NNuNkSQdRHF76l53HswrDLm+xCjPIeqtt
	QNOV65rmamZCgMmHPvxsZkqb3110sgW3XiHzB3pKJFPBw4RJxe1yNhoXwuw+o+wK1budyIA2p8k
	7RO/MGBCAWornhb5g
X-Google-Smtp-Source: AGHT+IGw2UDdXk2QwwLiFMjNVigLC6hhLpudBczv1ENwk9+Zux3USypaba0sDsVSZqwhLSyGzSCaVQ==
X-Received: by 2002:a05:600c:8285:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-442fd60a587mr56834945e9.4.1747439844000;
        Fri, 16 May 2025 16:57:24 -0700 (PDT)
Message-ID: <5c2aa885-8877-4708-90cc-d65a76b729b3@citrix.com>
Date: Sat, 17 May 2025 00:57:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] automation/eclair: update configuration of D4.10
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, jbeulich@suse.com, julien@xen.org,
 roger.pau@citrix.com, sstabellini@kernel.org, bertrand.marquis@arm.com,
 Federico Serafini <federico.serafini@bugseng.com>
References: <alpine.DEB.2.22.394.2505161618280.145034@ubuntu-linux-20-04-desktop>
 <20250516232130.835779-6-stefano.stabellini@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250516232130.835779-6-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/05/2025 12:21 am, Stefano Stabellini wrote:
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 9c67358d46..3fb6d9f971 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -72,11 +72,19 @@ they are not instances of commented-out code."
>  -config=MC3A2.D4.3,reports+={deliberate, "any_area(any_loc(file(arm64_bitops))&&context(name(int_clear_mask16)))"}
>  -doc_end
>  
> --doc_begin="Files that are intended to be included more than once do not need to
> -conform to the directive."
> +-doc_begin="Files that are intended to be included more than once (and have
> +a comment that says this explicitly) do not need to conform to the directive."
>  -config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* This file is intended to be included multiple times\\. \\*/$, begin-4))"}
> +-config=MC3A2.D4.10,reports+={safe, "first_area(text(^.*Explicitly intended for multiple inclusion.*$, begin-3))"}

xen.git/xen$ git grep "Explicitly intended for multiple"
arch/x86/include/asm/cpufeatures.h:2: * Explicitly intended for multiple
inclusion.

I'd suggest altering that one file, rather than adding an special
exclusion pattern.

> +-config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* Generated file, do not edit! \\*/$, begin-2))"}
>  -config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* Generated file, do not edit! \\*/$, begin-3))"}

These seem to only differ by the begin-$N.  Why doesn't the regex work
in both cases?

> --config=MC3A2.D4.10,reports+={safe, "all_area(all_loc(file(^xen/include/generated/autoconf.h$)))"}
> +-doc_end
> +
> +-doc_begin="Autogenerated files that do not need to conform to the directive."
> +-config=MC3A2.D4.10,reports+={safe, "all_area(all_loc(file(^xen/include/generated/autoconf\\.h$)))"}
> +-config=MC3A2.D4.10,reports+={safe, "all_area(all_loc(file(^xen/include/xen/compile\\.h$)))"}

I see your exception, and raise you some sed.

diff --git a/xen/include/xen/compile.h.in b/xen/include/xen/compile.h.in
index 3151d1e7d1bf..9206341ba692 100644
--- a/xen/include/xen/compile.h.in
+++ b/xen/include/xen/compile.h.in
@@ -1,3 +1,6 @@
+#ifndef XEN_COMPILE_H
+#define XEN_COMPILE_H
+
 #define XEN_COMPILE_DATE       "@@date@@"
 #define XEN_COMPILE_TIME       "@@time@@"
 #define XEN_COMPILE_BY         "@@whoami@@"
diff --git a/xen/tools/process-banner.sed b/xen/tools/process-banner.sed
index 56c76558bcd9..4cf3f9a1163a 100755
--- a/xen/tools/process-banner.sed
+++ b/xen/tools/process-banner.sed
@@ -12,3 +12,8 @@ s_(.*)_"\1\\n"_
 
 # Trailing \ on all but the final line.
 $!s_$_ \\_
+
+# Append closing header guard
+$a\
+\
+#endif /* XEN_COMPILE_H */

and now compile.h looks like a normal header.

~Andrew

