Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECE5A968AF
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 14:14:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962578.1353762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7CWP-0000Tq-CS; Tue, 22 Apr 2025 12:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962578.1353762; Tue, 22 Apr 2025 12:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7CWP-0000R6-9S; Tue, 22 Apr 2025 12:14:41 +0000
Received: by outflank-mailman (input) for mailman id 962578;
 Tue, 22 Apr 2025 12:14:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7CWN-0000Om-Rh
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 12:14:39 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53e27ffe-1f73-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 14:14:23 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so24685735e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 05:14:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa420705sm14972505f8f.8.2025.04.22.05.14.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 05:14:34 -0700 (PDT)
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
X-Inumbo-ID: 53e27ffe-1f73-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745324074; x=1745928874; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8CAEnamdARsHZAY1f0KqIX3/hSUPv7RCBYAgD0+sjL8=;
        b=UB8sstMSWcfQwcbQYGMqOcbAkjho5le1ThHP8Fgq/IrpDlgjyeTBBiWZ47fGyQycjR
         7VY3NXNxqSlk2BLFPRWqH1X3n+GLUlA5qwVgQpy71HckhbSgK5Ln1xpLr27VA75tXArd
         SKj+BricIB0nI0A43K1Id9XsgsakF1ly2wqPNSle8GPkoWBIBRAW2ttT5VzAThQLpRQM
         NPX/YTiKV4lCJzokpp0SNj0KSxoZVX4lS1edsz7AOookDy8X/DmZNZ3ET54/qd7T8l2H
         20NA06af0MfLHXRXLxRJmS68EAyoL6dp7M5lKrkeynD3Oh3UeK539J0OXmkDm742/r2l
         vXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745324074; x=1745928874;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CAEnamdARsHZAY1f0KqIX3/hSUPv7RCBYAgD0+sjL8=;
        b=KMPzw4J1wGOhF5NBt4lqK9dJT9kXFTQ9DEcfF0zq367hxP83K0JBpy1qRC7h8SlSWZ
         kU6fBpdGzUy36L7werSz7UWCpppuU2EipxMM43kdQ9riaQ5fpCsZRby66RrxR2HgQgS1
         KX+LVu43g/a1UUa3QibGtwt0RfX1whxVYKjGUmOCETz9+bX8IdjfzRIS/Wp2FIkmla/g
         XT25WFgm/R3XMPRnHo7UMxqme2vkf4XgWNU+IEJ6oKPxk6vCx7aKRvMH0VVpxeL4A+91
         Igg6jaswhAHGM92+reNgNpaQYMRcB8w6RAVpUXrguD58/p2Pqxna0/2IOwoWZEw0yCJu
         mFKA==
X-Forwarded-Encrypted: i=1; AJvYcCXfUEqA8sppsLKZ17VynR2dAzNLSw1Kdh+BDq2l6qhwYtbF1F5M9xUlenOPXcZERYPtTVPJlTG9HlI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHKV0w2nJEWqNoMNmCleKnRNdnv+jirxwqMZEc8J8OMiYBh3EB
	ZdLhAog/1lkUgrlBDX0/FwO/djwANxLzHicIVtEp4hq+YE32vK+wOPhKgoM8wg==
X-Gm-Gg: ASbGncui31nd+V9cEgzAOymCrpX/5fDBR3Piy1K8qah7fAfk9NusHdcStbvs7rHoQVn
	TAYeZC54F0q7ykanDGMf685/OrmlSTJD2y+IYTLGgzigDN6jw2QUQWtap6JfxSeSYxlYzwtqaks
	qFdqZR3StHM6WiKApyVBKENBQqVcBcdWmxtejXMdnuOfGkbSYMup09aK4rVumq2GC4lCsF+Fh3B
	+5yuwSVvfbLExvQU7V1ggfOcQPA/0jgXEEyfydmuRiL5ADu9tx/mJ9N9hUNFIbEgXElyZJyG5e1
	My0hDvn25sdmWeyFZJWVXs9QiCGp/cBZK1MSbCf/E6JfRAalnUH5SlMA4d3amu0QlgGkcjN2vFw
	kXa33zaGk4XQ1PNt3o0/D6MzzNA==
X-Google-Smtp-Source: AGHT+IESxwox5B5+fqsLFlUhw1bADXS3wJDKuHyW4GeOr9nMr4ECsPcWGYJLdWeDinjp4Ik4CtiyqA==
X-Received: by 2002:a05:600c:1f83:b0:43d:53c:1ad6 with SMTP id 5b1f17b1804b1-4406abf93b2mr120845665e9.26.1745324074342;
        Tue, 22 Apr 2025 05:14:34 -0700 (PDT)
Message-ID: <53cd2d0d-41b7-4002-b511-e25a7b15c3c8@suse.com>
Date: Tue, 22 Apr 2025 14:14:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/alternative: Clean up headers
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250422113307.1285890-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250422113307.1285890-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.04.2025 13:33, Andrew Cooper wrote:
> alternative.h doesn't need lib.h now that macros.h exists.  Futhermore, STR()
> is already the prevailing style, so convert the final __stringify() to drop
> stringify.h too.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



