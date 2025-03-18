Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29206A6772A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 16:02:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919229.1323726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYSM-0008Np-0I; Tue, 18 Mar 2025 15:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919229.1323726; Tue, 18 Mar 2025 15:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYSL-0008MP-Tm; Tue, 18 Mar 2025 15:02:13 +0000
Received: by outflank-mailman (input) for mailman id 919229;
 Tue, 18 Mar 2025 15:02:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuYSK-0008MJ-D1
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 15:02:12 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7c455f5-0409-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 16:02:10 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso23139605e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 08:02:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffbcf95sm136147635e9.14.2025.03.18.08.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 08:02:03 -0700 (PDT)
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
X-Inumbo-ID: f7c455f5-0409-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742310130; x=1742914930; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EIubS6EtiriuwxSgeX+x7q8A70caDeqJNsyP13BwunQ=;
        b=BEU6YOwMoJDCgdjeVub8ZEJ3EzzneqwLiE9RCDiF1iC54eR8lLFJbXhp93K8cuEGo6
         t3bsAeLXixxm42+iXI2Rs/NgsbhcjkV+Nlqq+u/EJic1VoHdGgh+uBF4THIDWzLZIlP5
         wWQByFfhylG6wM2oi6tsA2DvvoirxK2dZVopirrN6fdHAyP5htfO8GLdojGpOXYvr2EP
         gHDbMXJEKNlN1fYeb3urhCPo+CCDN3cmETWx1w4ps+EtomWP75YhHKSUndnKtZ0HEQZT
         xexRmtAKJFJa+bFcBLHVDD2V9++mxXCJWZYubiisRU+MMPjHNxVHbQ2PUOU9ECQfSSrd
         ptdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742310130; x=1742914930;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIubS6EtiriuwxSgeX+x7q8A70caDeqJNsyP13BwunQ=;
        b=UDt2gogIm8Z5jK/uIJgoSw5nzdTQ6R6UQ6Z5rMoJPg8KLI/khZJpcxwUbYoH9kmVLn
         M7TSCY6Rt+dWo4dhi7YmgnVVovedVDDLVLDO7dJE/iTXdtjkYFGqKrT/TuOJQiclQd4I
         QlfMrojsj1qgMUg1poLRUJT0vU00cabi6FiC39XuUIN9ZMlFjRSuuE/8z+MvDJRTW9AI
         NYcu3rPWQt7LWuFh50ZMq2/0wdFMZzOMLfQBI0ihTlMlJRLdt0X1+rtJTG7CzKzYrRYg
         j5a2DzcRzETzlamSjyCW9sBOcMl551jXWSNnS4X6BLeBRuMipgvJMIeWt4+zzajpRXL+
         NWkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5Q8bULspR+rztvryltg95aJMxtSQ2W3gRgyKkehkSFEyEBxv8O8jFRFQIBDvj+Y/bWkFyNZNmw9U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywsn636ayIQh1p32vGI/4q8Cu4W3NXjnW+hEZiBJTPtymlq6G1m
	qi+A5rkYwrrdr1LxPxwtTyezbQRi3DPo19rgYTI500JJIwA5TB+Vr/wBN+aJwNumtVU+qlJTHsg
	=
X-Gm-Gg: ASbGncss9fYF6Z+3Tlv209SVhNsvINaGLFfGo3DNzwa19A5yw4vDJMKd9vqg/1ULssq
	ypAP1uemYRp+LXNyJO/bqqwWabrwLxRpB3PihqPAmjmIu3OvOUrW2p1j3DFcm03pO9WKlIWu2KQ
	Ug8rK5ju656Fb9g4nyLRjckr6zrHbKUH90EpxnulqMwUtREFc3X2SZPu9Z5hMI3EnG8jf0CAX4j
	2OwdlmcP1zFzmQsmub5wGLd9AaG0hYnTxvrouQhrN0RHESP4SbTyfg1gHZ52vhXeBDHdrSauNNH
	u76xtlvU3vkFnBnTcO/pBBMkARSRSGCo+tdMf3+Dv1K7ocubreKiLEN8ZwsfczSbEt1djwdPt/7
	x8z3oK3LFsKjKX2cgMSjUdirIvupt95C1zQjx0Pru
X-Google-Smtp-Source: AGHT+IGc57EIevF9EoMf/TMvg4wNUuaBW45VB7X/HVvrHOGJe1LZVxlcjfgZKtKQLvMthgC/ptoWGA==
X-Received: by 2002:a05:600c:1da6:b0:43c:f5e4:895e with SMTP id 5b1f17b1804b1-43d3b9504camr19886735e9.1.1742310124163;
        Tue, 18 Mar 2025 08:02:04 -0700 (PDT)
Message-ID: <278790ec-32f9-4ae4-a9ae-6eac5900023f@suse.com>
Date: Tue, 18 Mar 2025 16:02:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86/traps: Move cpu_init() out of trap_init()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250317192023.568432-1-andrew.cooper3@citrix.com>
 <20250317192023.568432-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250317192023.568432-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.03.2025 20:20, Andrew Cooper wrote:
> cpu_init() doesn't particularly belong in trap_init().  This brings the BSP
> more in line with the APs.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



