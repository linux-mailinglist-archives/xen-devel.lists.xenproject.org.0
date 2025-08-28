Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E246AB3A43D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:24:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099374.1453297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureTS-0004VJ-Cj; Thu, 28 Aug 2025 15:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099374.1453297; Thu, 28 Aug 2025 15:23:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureTS-0004Sf-9n; Thu, 28 Aug 2025 15:23:38 +0000
Received: by outflank-mailman (input) for mailman id 1099374;
 Thu, 28 Aug 2025 15:23:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ureQY-0001fQ-FK
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:20:38 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c4e748c-8422-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 17:20:36 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-61ca9a5b41bso1462984a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:20:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cdfdbdfb5sm1356631a12.26.2025.08.28.08.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 08:20:35 -0700 (PDT)
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
X-Inumbo-ID: 8c4e748c-8422-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756394436; x=1756999236; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QWDYiFAarRKODteWl1qYxxxipU2nJpzo64SYg4tsrg4=;
        b=ShNti9l6ELpkf9K3cAqmnmmTxwCyyRW2gxSe0cbMb2L9iTKIwOwSlvjNtaL6SGUrlq
         M58u4SejiOb1lkhguALzWCVzs7GyvBoPoyLhb6vypEHuin3u6lf66axjPbWvGYxQJBCn
         yIHFF7kNdKq6V9Ha33yklHys024Ecp9Zl6Ud539wMiyVwxy+pmwy5SxqgA6aKks2eEkd
         3DSsa8xzFdu8UfFzTlpMxwcPX9TnvI9kZlYNmEyu4L78ZsgcDY/yaeh/XILPs9eon+8F
         xWCt/q5cVkmIYIQMnZsyDla7+h3vFcDGg3aoIIxCCKPyiyHQC5GgMjiVsHeX2gsJA2Pc
         L1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756394436; x=1756999236;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWDYiFAarRKODteWl1qYxxxipU2nJpzo64SYg4tsrg4=;
        b=h2+ej5NqcX+Ou4RmumAWq8N7GMcybqwT7RcxknMd+pHmFxnyRtGEC3g/hbo9EL0G2m
         BhEZ628mjPsYewCjhHCm13LWpkaPBWP2BeFk5S9g0B7r/L86D54qFvsYIISjueYrIUL4
         mqgTRE11LzP32s7toJ+kwjc4P6rt7do7Dj3JNiC6iIyVhMUb/8uI23MxzV4/1La+0Ypl
         rKtew/78tyhDQShZxyi1pUXmQbMGt2S+BbfsJ/Ff4OCvzE7yPZs8r/cbNYlvN73/H6T8
         B3lvsqdzWzN0qu8mZqrZep/zCZgmAj1/BaWaXLuOg4Df5qJSDBE4bXtvIr0asXi/2Z6Z
         wL3w==
X-Forwarded-Encrypted: i=1; AJvYcCUdOZkY2c6zJIVQhzRPBxHga5XibJoIZ+pySEKVDyAspYuxwB23NSdEV/l2+D5sm1jasZ4SVPxKPMU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTc4PbIpdmP8SJHHEuMGuy0I1pkEVVjVPNLKqRdYzLrJiETytl
	8/wCWrF9uYy/S8Okbte7ahbGBfD3x5y7AhD7Er8Aeu3tZIodZExuaZXzxKW+9iR116S8rmdDLqh
	vKMs=
X-Gm-Gg: ASbGnctcbpCD2i9NC86gN6vbz9nJehQe5qx+rln+lxAwitnUaVB+i2WW6ybGwfi1nzg
	pTXAvJ9WbwVL0fC6YD3RN3s6YuO8tyJY4z/TgRmFuYy1FbUVCWXhRfgCze1r9Im691T93TkZnpn
	OBdtXcV3lMPx/7st+Vj+fx4SqCKw1wsjY5SLAmC2tfYe4LVIMzSmbnrztvhWKulVm6ZFk8Vp4wD
	rW6gi1omsyExUs6iyVj5JH0AurtUfQL9uqowmN6dSsGyYarmUmmbFMJVhGfzaK3bd3XtQveQMp/
	tlNOC3NEDjMm0Ti924ZOqZp+09/gC183+xnrX8q2uxieSExEXoEJiTVJYDHw5eSONqNbPBr6sGX
	qMg4QZOkwel7ZzLQSzqSDizbQcULGidhOy6t6zG7Z7USmws5olV74KvEVIGuz3PRb6a35NdiIze
	+i/vJ8bEtrLw0/0jQwMA==
X-Google-Smtp-Source: AGHT+IGwoyzLrVKAPt42aEBKMzDn+ZjiriLervyoE+4KxPsQ6u1VjQ+avADnL3uiaGm7F2PtjWjMgQ==
X-Received: by 2002:a05:6402:50d3:b0:61c:7a45:5866 with SMTP id 4fb4d7f45d1cf-61c7a4560b6mr9749036a12.11.1756394436034;
        Thu, 28 Aug 2025 08:20:36 -0700 (PDT)
Message-ID: <28c1d8ae-18f3-4b10-956d-d14693db9f66@suse.com>
Date: Thu, 28 Aug 2025 17:20:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/23] x86/traps: Introduce opt_fred
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-4-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20250828150409.901315-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 17:03, Andrew Cooper wrote:
> ... disabled by default.  There is a lot of work before FRED can be enabled by
> default.
> 
> One part of FRED, the LKGS (Load Kernel GS) instruction, is enumerated
> separately but is mandatory as FRED disallows the SWAPGS instruction.
> Normally, we'd have to check both CPUID bits, but Xen does not use GS like
> most other software, and can manage without the LKGS instruction.
> 
> FRED formally removes the use of Ring1 and Ring2, meaning we cannot run 32bit
> PV guests.  Therefore, don't enable FRED by default in shim mode.  OTOH, if
> FRED is active, then PV32 needs disabling like with CET.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


