Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E838D939EEE
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 12:44:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762994.1173244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWCzq-0007Tp-02; Tue, 23 Jul 2024 10:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762994.1173244; Tue, 23 Jul 2024 10:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWCzp-0007Qe-TK; Tue, 23 Jul 2024 10:43:53 +0000
Received: by outflank-mailman (input) for mailman id 762994;
 Tue, 23 Jul 2024 10:43:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rd17=OX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWCzo-0007QY-Ik
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 10:43:52 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7341f0d0-48e0-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 12:43:51 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2eeb1ba040aso77004351fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 03:43:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ccf80a8870sm8681843a91.50.2024.07.23.03.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 03:43:50 -0700 (PDT)
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
X-Inumbo-ID: 7341f0d0-48e0-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721731431; x=1722336231; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5RPxZe2RFyLqMXQQMiFiZ6CLJzA8c72EtMOO1ub+Fc=;
        b=IXwxhkOesLmrhmP5Tt+lS8zVZ+e/quf69ZgKbHlJoE0S7GfauTNaaQ/VqDjEsBReR6
         3eXosXNuJOOz3zo614ifFSXfVpBjEAAT/ToowBlL1/vMF01rKVf/Tcb0f5wbv2UO8nA1
         GOL+mbgsVczUVGC8uhEuWUZlJ2g6fVozCLWUJ3ChRn9lTOms0R+wpb4+ak7vCAINEDKK
         6meMTeBrJDG4LS58Inic4NhhBr8YFXnrXOWBUoBbEaQIwgoAIdNEmKTd6uHk5bpTwN+x
         eVRjk+6rEdqhsL2T1aRB1odK9GWcZ8jLdk6eiZSF1LRfoO3MTx6mQ07aDWjdLGKirFiq
         knUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721731431; x=1722336231;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g5RPxZe2RFyLqMXQQMiFiZ6CLJzA8c72EtMOO1ub+Fc=;
        b=J0IxrOwTln+ckyHv6wlMFimJI7yqse0Ly1f/tZFmD5YtUASz70o8PI+tLBObVJaQY6
         ZcAUDCOI9p2bHLEUVpl1eky54XLjli/IRWsxUkD5uqJy12BpyX3v7B6ccsF80ddA/vXI
         Wc29fTBy6Gu12YfsOw9WwOso5i6NsHCemE+jHTyenFHke9EUxcWOlGqrLwyBq2YaNgnH
         H6UWecxXyygpGyRdZCSb/kBPTXfbn9vQWwweVry/xVqO1CdVhYP86d6lN4uKQO4hguCT
         KyRE2Q0hXuiC0BQWxqY0Z7EmNW9CanzIxqQdLZO3JRKAXR4mx5eR6qxanDsYxdruc/X8
         3Zvw==
X-Gm-Message-State: AOJu0YzXvbxYqRQUXrrviiZ2ypRoKE/xlhWl/C5Zz5CX0hBJ0gu6NKgJ
	BgbKG5dqYdD5c41XPkPAv0kc7PPsiY7z0waEHbnaSDi953KCAbGTDZD7snUAQCFMuEdqDWX01tg
	=
X-Google-Smtp-Source: AGHT+IHUIJdbIBvfG0h3u5Aphg78JHfvr5Htf0Qg/3gV3fIVOOig8wfD3DWxgNr5y08MFeJXaRC3gA==
X-Received: by 2002:a2e:930e:0:b0:2ef:22ef:a24e with SMTP id 38308e7fff4ca-2f01ea4b411mr18090301fa.10.1721731431006;
        Tue, 23 Jul 2024 03:43:51 -0700 (PDT)
Message-ID: <ae0b4331-638e-4193-9536-6bfccc777e27@suse.com>
Date: Tue, 23 Jul 2024 12:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC] x86/IOMMU: permit use of -save-temps
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Rather than invoking make for individual .i and/or .i targets, it may be
desirable to simply add -save-temps to $(CFLAGS) for some (or all)
source files. That, however, triggers a tautological compare warning
with at least gcc13 / gcc14. Apparently such warnings are suppressed
when the compiler knows they originate from macro context; use of
-save-temps, however, splits translation steps, and compiling the output
of pre-processing does not have that contextual information anymore.

Hack around this by making both sides of the comparison just different
enough for the compiler to no longer spot the tautology, without
sacrificing the dual purpose of the assertion (type match at build time,
value match at runtime). Of course as the compiler gets smarter, further
obfuscation may be needed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: Of course this escalation spiral isn't a good game to play. Are
     there alternatives I'm overlooking? I don't think we want to use
     -Wno-tautological-compare.

--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -60,12 +60,12 @@ extern struct iommu_ops iommu_ops;
 
 # include <asm/alternative.h>
 # define iommu_call(ops, fn, args...) ({      \
-    ASSERT((ops) == &iommu_ops);              \
+    ASSERT((ops) == (1 ? &iommu_ops : NULL)); \
     alternative_call(iommu_ops.fn, ## args);  \
 })
 
 # define iommu_vcall(ops, fn, args...) ({     \
-    ASSERT((ops) == &iommu_ops);              \
+    ASSERT((ops) == (1 ? &iommu_ops : NULL)); \
     alternative_vcall(iommu_ops.fn, ## args); \
 })
 

