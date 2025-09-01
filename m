Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2442AB3E164
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 13:22:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104517.1455551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut2cS-0008S4-KK; Mon, 01 Sep 2025 11:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104517.1455551; Mon, 01 Sep 2025 11:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut2cS-0008Q0-Hh; Mon, 01 Sep 2025 11:22:40 +0000
Received: by outflank-mailman (input) for mailman id 1104517;
 Mon, 01 Sep 2025 11:22:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut2cR-0008Pu-0M
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 11:22:39 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6a2ed2f-8725-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 13:22:37 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-61cb4370e7bso6308793a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 04:22:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4e50fbsm6801912a12.38.2025.09.01.04.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 04:22:35 -0700 (PDT)
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
X-Inumbo-ID: f6a2ed2f-8725-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756725756; x=1757330556; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HBPITbBt8/h6jGGj8e5YrH8gDaO/mzRHB+KUqz/EVL0=;
        b=TeFDvlnaf/ufcDsOx96aMFtZSAb/SHUGGS+Wbikt8+RNv+ANLMts1AYDA6rOVptcfE
         NRonvtUUl3hCuwgVmhhQh0zY37D9FFcU7MTQbnXTZ4q2kffYso0Bc+SqYWSrd+1ChVP0
         2s4nJpIvIRh8XN2VnfzrCF6YaDtE8ETgiROCTw0Dp6nZetoWnQQx6zoygsv9MOdjMAJP
         HxM/m6YNHyJ3KOKEKKb2Wbxa84iwHy8AOj8YM2b9Lm54lyqqCA+VJgCXBrwMno74JD+C
         OZgapfbP1myHIQIraCPxm/NC0l1eaQYNVPPYDTLxQ0BKOJ4gkRFyDyzWNQGo0RY69bpy
         Eesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756725756; x=1757330556;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBPITbBt8/h6jGGj8e5YrH8gDaO/mzRHB+KUqz/EVL0=;
        b=PtQc7Hf28fPpLDuPX74LhDRUNS/iSXNLDwiJVCFxTqJRKgfWSoErmYTWqr77s24eZw
         Z7ehlw28nWjsLxTJyFCFMrMqEPgpabGpNz6Akv7muXufF1ltl0Kfv31nOZW6vlIrLc4O
         NnQpY+zuNp0MRrnMEnuQSeZIZ4qCr98rIig432qNHqF7WtX+U9QbJ4or/0IXmLP7K/JW
         OVvslxNr8rbyYijw2Np7kfrEGAd5o7r1/kLEhiCizxq/KVHLDvsJecUSWWR4OdmdNqmo
         YvXdzVxV9q+jwTMt55nBGgw3J3Hvgl5XKGizb/Y5ffpCXGZTXhZaGQtHhdSy6x4Imhds
         olCw==
X-Forwarded-Encrypted: i=1; AJvYcCUR4msIac2IyHiI2EIKyMfZl9Il4XD2XeE5HAH5TRxr5SLt2oHyaBQlj4MY4R59w9Ji+qWBch4VrbE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFil2NmY2hA7Clj7XD1UsaQ028MBfb83EUGIJGYHbWvk9u8mKk
	YQe3YY43IdrAuuHmsE6QldtLBMaG0j/KImfQrD26YPjrzaqxesqZd4+EGznzRXzyPg==
X-Gm-Gg: ASbGncu1eNcZNcpKXce7e5yN11iijM+aZ8VFaKwoxBrC+1rPFdbMt5uU76VvGjhSal1
	s8mwEX4ssIRp6EuZWTlXGs3kXhc0ZF4DKZqePgeaXCR4dDndke0xBV9cVH4vSbZDKbMfjgJITft
	QrkHi+r6au+gm5Qd1+JUzOyiP2eGy+4SgCuOG3AfIz5C698a7HwJkxDiTF7rAZoFFf0d+nTwi1P
	qoll4tfsITOxQA48Dh/UQUbnmFL6iAQd1SoicvaryUccyJPVBxtF0Y5g/CNZBDvvIku/4f/55Tn
	0hBO6+lrhgO4t1AVtpEBh9C7YzU0wtp9MWTJv1pBlasABpStXaIUiPvU2IxD+O6GoFhCpjJUwjk
	6kQO2uyV7kFPpF8IQK/K8Gd0SKJsVZSkwwEhoQRtew8zdpjGn/nLR08n9uCBuXBCg6WQieQDDo0
	h+b/kTmF9iCbt3D9gPXA==
X-Google-Smtp-Source: AGHT+IEKpRahnbTItiJC/2uLP4UOpmNKBpVTG2Qqbqa/ODlaFBSrjFqQ/AYCNh9Dx5AMEXhiayOEIQ==
X-Received: by 2002:a05:6402:84e:b0:61d:976:81a1 with SMTP id 4fb4d7f45d1cf-61d26d78d31mr5736846a12.20.1756725756533;
        Mon, 01 Sep 2025 04:22:36 -0700 (PDT)
Message-ID: <ce24ee6d-9a3a-4a0d-9384-8fb96aa2d7b3@suse.com>
Date: Mon, 1 Sep 2025 13:22:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/23] x86/pv: Deduplicate is_canonical_address() in
 do_set_segment_base()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-16-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250828150409.901315-16-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.08.2025 17:04, Andrew Cooper wrote:
> This is really a rearrangement to make adding FRED support easier.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> v2:
>  * New
> 
> There is a marginal code size improvement:
> 
>   add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-46 (-46)
>   Function                                     old     new   delta
>   do_set_segment_base                          496     450     -46

While this is quite nice, the nested switch()es aren't as much. Still
Acked-by: Jan Beulich <jbeulich@suse.com>
with possibly a default case added to the new inner switch(), just to
please Misra.

Jan

