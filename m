Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D77D1F1DD
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 14:43:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203091.1518383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg18l-0001VT-W1; Wed, 14 Jan 2026 13:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203091.1518383; Wed, 14 Jan 2026 13:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg18l-0001TH-Sw; Wed, 14 Jan 2026 13:42:27 +0000
Received: by outflank-mailman (input) for mailman id 1203091;
 Wed, 14 Jan 2026 13:42:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vg18j-0001TB-SV
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 13:42:25 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db574848-f14e-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 14:42:24 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47775fb6cb4so48148505e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 05:42:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee27cf06bsm21671155e9.4.2026.01.14.05.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 05:42:23 -0800 (PST)
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
X-Inumbo-ID: db574848-f14e-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768398144; x=1769002944; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nUWllKMPpy9udsf1yQ3TeWLTtx1XYb7DE5BROOZsni8=;
        b=dF984FPDY3pfvvIdl73+fWrRH6532CDoTxA3i8NTG+oPa8Ey8dcVA/pO3CXunREGcF
         nMIRa/0D/PPHRbj5n9FJq03Bxo+AamQvnNPr0AxKDuSp0HhzImJuZiDO/YFPCOUv1xZj
         bicaZLFw5runPqstTLGinPxZK7ms2gxCLAGC5Lujj1As7rSqInrUuKwTTKbz66BK9/L1
         v1HkMXI8bRrW5NOb4T5+8iJtJHKOEvuxC+5QQhFAGbhGib4/BK7BufGL7gLs6FtJB3Cj
         zkXtk+MSJC9Rr6aV9tFYkYnwMePTyAd8ti2A7O1JCjLAb54so1WX+gO49BW3Yjl/k7/K
         e+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768398144; x=1769002944;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nUWllKMPpy9udsf1yQ3TeWLTtx1XYb7DE5BROOZsni8=;
        b=i9svyeyng/1QzJft8tNPId9I9e9Bp04CasGx/9ZLfkPqsDPlulc32OBGV84Z9V0oVT
         oQdP2rvhKMpkA7PIOESatqmx3mVcOiyrUqaw6lUU7UFtIWmb50jD17NQDmASnEymlt8x
         76Wp6r0yXqDVNoUQ6rcOR1hZfkdw+8YXfurZg+luQyeceK+rpyhmVB6MTwVdVb45z4Ae
         s9S6r6HfJBGhA2yB/BOwQZ+r6DHNMJ8hKk/av1YiBjuw4Z2eSpD0GvGVqNCsX9/ppWxe
         ZLHo6k8x/+186TcbDZ/126m9IR3L+0aTD5PxGK2ISHDN3mqaovb80v2ZMKOPpgklrLIu
         LlBw==
X-Gm-Message-State: AOJu0Yw7GswVKRXb/o5CHoHOONu/Qa61ZoKSt7wMF4CbcSIR9fNl4fE/
	/4lm8DOhw+Oj3SHW/YXhElhsAFXVwKDs811XOlfucR2XSTxCr9SkL5ncBa82X1EpTjiS/tXHLd5
	ZIMU=
X-Gm-Gg: AY/fxX6cDxOAEOCBfL4n0bBBU37kKQDvZ69OsbKmJScoLA7IhPM/SPUKFF+i/AUA66L
	tkvoum5t91YIgJPrcKEbYGtjR7FnIHtq2GgjrEg8bmUo5Hbi0JkdiYY1CfBiwo4OlJs27AjOBPZ
	G7vETHVN4arxxHyJLtV1hOuvuLWdU9ZyDuINvJxsKmpm9i+NGuY0pZYRvysD2NohYthqcbQP/Yd
	eQSbwF2BN8XiAjcXD/DDkLPYzbw6+jAWgc5aoQE7LWQxJkQMTzI79SpXQNDcI/uwJozPjKwrsBS
	gkfujSPGNy1V93eX2dfmFDOL4Hl5sEEy24gRgmf3GPuW4Hh3sizJcPw/uUyHINzWIbyPEoESW2t
	at4UIOKFj7K7ScnRe2Vmba5GP8MYH9ze2kSjaSOHT3XVDGno5oy/yRwqPiLQxIxnhpTi5359hj5
	o4p9m0mJZooLqq/vcTBG9at11wWmrk4X6wDlG/Bj1/3mpK1ZhAd8Hl78cNzFqBGpUMto1h4Y6cp
	cY=
X-Received: by 2002:a05:600c:4ed0:b0:47a:8cce:2940 with SMTP id 5b1f17b1804b1-47ee33454b6mr33160745e9.14.1768398143676;
        Wed, 14 Jan 2026 05:42:23 -0800 (PST)
Message-ID: <4d3a3576-2d3c-42ec-8551-18f1f0982e17@suse.com>
Date: Wed, 14 Jan 2026 14:42:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/6] x86: CPUID leaf 6 consolidation
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Language: en-US
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

Integrate this leaf with CPU policy handling, to leverage the host policy
when feature bits need evaluating.

1: cpu-policy: define bits of leaf 6
2: replace APERRMPERF synthetic feature bit
3: rename ARAT feature flag
4: Intel: use host CPU policy for ARAT checking
5: cpufreq: use host CPU policy for Turbo checking
6: cpufreq: use host CPU policy in HWP driver

Jan

