Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D95C6F466
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 15:26:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166084.1492716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLj8U-0003bQ-4t; Wed, 19 Nov 2025 14:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166084.1492716; Wed, 19 Nov 2025 14:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLj8U-0003Yx-22; Wed, 19 Nov 2025 14:26:18 +0000
Received: by outflank-mailman (input) for mailman id 1166084;
 Wed, 19 Nov 2025 14:26:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJND=53=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLj8T-0003Yr-Di
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 14:26:17 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adfc27e1-c553-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 15:26:04 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-640aa1445c3so10636655a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Nov 2025 06:26:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3d7335sm15067582a12.4.2025.11.19.06.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Nov 2025 06:26:02 -0800 (PST)
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
X-Inumbo-ID: adfc27e1-c553-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763562363; x=1764167163; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bevt7aayd9ZkoyNlMDUKn83UDWt/GZfy7D/6RVdWOUA=;
        b=JJ4nGhqbe07YLI3ytJbUMO33ZiCYIaVpT8E81ppTYNpnT9KMq4H5TqhZxqQcx+YYDL
         5sXWhfjQpA+YN0kbp0qd0ezvAN30ywvxerW7o5iCsDGEqxgRxM6J+MhUSpUIj4s2nL4t
         nLk8/HFU7odxfyUFwBgpcyaBoaTS+0voeqeCoB40Y7Pi0YO/7W4weOjmfR4cNeAwKJUd
         eN75d15mfh97ljl4lX60rwQDazz4puz0xXbj3hg34XUcJz2S/Hk2zhivscEr+l0yQzG0
         9hapgNygrfkALcgx+r3yKeyAYaTglKu2yU6agdarb+13vY5wLPTMAP5iCBM4IZzXZDAY
         RXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763562363; x=1764167163;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bevt7aayd9ZkoyNlMDUKn83UDWt/GZfy7D/6RVdWOUA=;
        b=MI1mxQStlJTDugweSmgCoQypZ06YdP99jRWFi4ge2mqafFb02wVuDfrcPDwywTVFnQ
         x3QqWDtZyJSLRcduVPEDwbph+5io0g1dFOuuttqGDh69GWDkfgBjHzQBTRD8/JEdNwtu
         Htbrpn3RLN71lPwIH/3hA1lAhaTfbiwSbrPy5tlBW7wQ0oGNfZAt8ru5Qmr+NZR6wsey
         nVZYRfBL2YVZD4HQD62sHr95UyuhNibuZ1lu4Jk5U99B8SDZ9MQG0lZM+OqQMteslV0z
         jUxEO4K9vJz3JwO5EwK62MRj7Bu9+qJVzYQ42wEQ8gmeKyn2sGIDSybNrr9JGWUycAwL
         wF0w==
X-Forwarded-Encrypted: i=1; AJvYcCUGC7fR8VfGudUOhiGlROXV2ItCXzpvmxlcHZfQe6ypDLezZPvm+yx/8EFToBRXzk7lrHBcgkAvQ8k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwT5UQ3kQ/IQT/oBn90xZcGIkDvmn1PxNkGI259Y9suqtPypus1
	psxfJ0e2Zh9G/2SBqm6qIkAl6Y9ldrCXNGsU0gCBnwExRfgIGIxRex9/UPynISoFTQ==
X-Gm-Gg: ASbGncuyj/m39JYpnRR+DiikxLTo6AU0DickGrP0t0SMOtin1pWBHKzFHGZmZcuoH5i
	Ioan1sProq4shXgBpbDx1M8dZ6G9XZ78gPAN9SFYn/DwuNsHm0KilemK5+DFfKTAY4RIF5RBg8a
	T5P7K1oVnD1T2kfpmNrB5ZoOCGlxa651jzvWyIfB3b7oGlsHr/GCilRQEjhPcyDl7Sj88xvLML0
	6BdUvt6PG1wRx/A8eOlFbNzLT1H6ii6B4zS4VTDz1W2lok6CuMTQa42a4tNz+dTZDaFtnLj7khK
	21CT3//Kv+kmRjPtcyfBA3QWLKPE/PXSapfOelS0+CDgRXWoDL8Go1nCJr1Rc8IW5F8+UEPKZmS
	1MS9KbomeVD6kSrd3ModS21R54ap44ht+VmsqRAQ4yBUHLhDXSeTQjMxqXcN5o73kmNyqi5X/OG
	lf+WK5HUKuanS4uZUCdO77mQmyK/iqhFEi5q0rC3MQPAnOHL+NtCDr3qNxM8Im690t/HDYEB8hZ
	8TH28PX3cLALcKXtp8tl12+lmX/DAoVHkY=
X-Google-Smtp-Source: AGHT+IHY4V4JBJTki28SzpSbLlJG0IzFmp/KPGh9eaRt08wTbDXYB+lrK2gMvvaSuW8M0ODIGDaUcw==
X-Received: by 2002:a05:6402:2710:b0:640:c454:e9 with SMTP id 4fb4d7f45d1cf-64350e1120fmr18444594a12.4.1763562363554;
        Wed, 19 Nov 2025 06:26:03 -0800 (PST)
Message-ID: <0e34c8cc-24a1-49cd-8aa3-c0ca3a824023@suse.com>
Date: Wed, 19 Nov 2025 15:26:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2.1 5/5] x86/ioapic: Don't open-code 32-bits rte reads
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <eab88bd79a65887961e0e1563f47360ef08e421a.1761209564.git.teddy.astie@vates.tech>
 <e9ae9ca2b51efa337117a6fe2db48939f8317747.1763549659.git.teddy.astie@vates.tech>
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
In-Reply-To: <e9ae9ca2b51efa337117a6fe2db48939f8317747.1763549659.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.11.2025 12:02, Teddy Astie wrote:
> There are many places where we use interesting ways of reading 32-bits
> components of the RTE. Introduce and use low and high components directly
> to the rte structure instead.
> 
> Also take the opportunity to simplify "x & 1 ? 1 : 0".
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2.1:
>  - fix trailing spaces

You did notice v2 was committed already, didn't you? I suppose that's what
made Andrew notice the style issue.

Jan

