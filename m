Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22121C6A31F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 16:04:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164893.1491749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNFn-0001Iu-Rx; Tue, 18 Nov 2025 15:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164893.1491749; Tue, 18 Nov 2025 15:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNFn-0001G1-OX; Tue, 18 Nov 2025 15:04:23 +0000
Received: by outflank-mailman (input) for mailman id 1164893;
 Tue, 18 Nov 2025 15:04:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=maYy=52=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLNFl-0001Fr-Dy
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 15:04:21 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc145de6-c48f-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 16:04:20 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b7355f6ef12so969695866b.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 07:04:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa81223sm1395868866b.4.2025.11.18.07.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 07:04:19 -0800 (PST)
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
X-Inumbo-ID: dc145de6-c48f-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763478259; x=1764083059; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+hfsrOldDWg2dpAv3tPbQO6zhR+u9tTC5czwVhdDX4=;
        b=QIn84z898i6f6VZGw2br30NUEpOqWVarOkS5+uV70coslpUZG5fWKTwyG5LYkRaHmO
         1TZuax1n1+hxns4Z3uI8YZ2mHVesCP/aIiWrEQPKnJ3ogH0KT5lTQqItEpu/nZMlx0fr
         bOI9Fe5PLNOSXGvama+bktlj456R8My+ZjJ6aR++yHqIyPzangYoOgWqyAnDChi/W4SU
         geMn10bgKRvsflDxsapJlLuUKMGvA8c0NkrkLRxdFMGu3541BxnWlwOiD+g3U6jF8AnR
         52aIA2YB2Swu1OWIawi1DNDfalxebujS6DYPyvN34E5XS9Ztmm6JeRXJsYWZTfh++ZpH
         kzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478259; x=1764083059;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v+hfsrOldDWg2dpAv3tPbQO6zhR+u9tTC5czwVhdDX4=;
        b=jmIoURTbD09k5LUfAD0B3MRtOsUkWX12Qp+aDdZr1aNjrZan+mK2zrXCDrTtbyJ5Ia
         dKsynuo06h+/4DYFXbsHEfK2vamqfSGc35K40aMKNQAb5cmNlsRrMUc/UoozmhfD9Nft
         8bIz3ZeHEgCpQqAVC/Rqc+lJpGMaE9Exab7pPtQ+Tn6PCIMI9bCvznuad0XETLifr1ge
         fqrbBlFIf1ck+xnc7qIU1ueE+d4U+9fhRG+3N9pT96ptRb98daC8PKmK4GnSMEXmPUbm
         ncWxyjnhYLr/fngv3U4hBOS9BrnagZ2SrfouqxLUXzqvlOPWrbpgvBJy+pzZeX20lFly
         b3NA==
X-Gm-Message-State: AOJu0Yx3c6r5/Sy0gkrLuhfoTUjwHsfrHTQZj+9eEXf1Y2ryQ72+xmyo
	OwMc24eq5ZGxbgb6trtck7SYNeQP8rw8GgxdcDvrJSwb7VrXaOeHzOcBT622OSn23ccKsTONYMw
	rU4M=
X-Gm-Gg: ASbGncvZgTXIgqcrBwsS5eCOnY8N7fjYR/B3HW8kcQkCTdmseIrPI73usnkjAunPjpP
	yuSiLD7KfTEX5mT6kdYSQ2A6ik9rVSyuZpCS6ojov58IM3sjlbBbgDmItixffUGPBWB9Z/Tg2ry
	06GI1WC2t9pRmwtmT+9Isvaszy851nSZgZuLRsrBZ9/N9Ld4NfYnw1ulqE+iXXyEb3CnCoHN6Ca
	IhN3wEZGPu+xeo5ZOnV7KKCXE9aT8SvXt8oQJq+twaPulQjAQjDHcM07i2az74CU1YWbJXYzmdv
	JMrOrWsFzXFMvzR3mhxyQn6PvN7L8TIYBxk8KP8OU965F88Hhn8Z0jdN5wlFpIOxi/fcLX1IV0N
	2BOW5YGwQtDIBtLmDlvGJpTWpWz1ctYPozK33pZK9aoDkyhjxjH5ZLhSUBITPPIdFcBDBmarxGO
	ijc0nzcH7HkMHuU2daqDi2uz0aWdvQW79vyfBM/xBIiHq2w6oMlSupega6/MB6dKLxMOcCI5NFQ
	z1g2RQWOjU7Dw==
X-Google-Smtp-Source: AGHT+IHThhGtGUdFbvTRLBSkjB+xLkj3rQgAHmsAdSygw0O571q7gg8FQ2onF1WdrEzaFC199jeCZw==
X-Received: by 2002:a17:907:6e90:b0:b70:ae6a:5fdb with SMTP id a640c23a62f3a-b7367bc46b0mr1610715066b.45.1763478259448;
        Tue, 18 Nov 2025 07:04:19 -0800 (PST)
Message-ID: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
Date: Tue, 18 Nov 2025 16:04:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/8] x86: CPUID leaf 6 consolidation
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

1: cpu-policy: move invocation of recalculate_misc()
2: cpu-policy: define bits of leaf 6
3: include: de-assemblify cpuid.h
4: replace APERRMPERF synthetic feature bit
5: rename ARAT feature flag
6: Intel: use host CPU policy for ARAT checking
7: cpufreq: use host CPU policy for Turbo checking
8: cpufreq: use host CPU policy in HWP driver

Jan

