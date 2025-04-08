Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB38A7FCBD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 12:48:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941767.1341165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u26Uw-0008Gs-Jp; Tue, 08 Apr 2025 10:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941767.1341165; Tue, 08 Apr 2025 10:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u26Uw-0008Ej-H8; Tue, 08 Apr 2025 10:48:06 +0000
Received: by outflank-mailman (input) for mailman id 941767;
 Tue, 08 Apr 2025 10:48:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u26Uv-0008EN-Bf
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 10:48:05 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f05e2fdc-1466-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 12:48:00 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so2936983f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 03:48:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c30226f1fsm14680130f8f.95.2025.04.08.03.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 03:47:59 -0700 (PDT)
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
X-Inumbo-ID: f05e2fdc-1466-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744109279; x=1744714079; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H8PVEzrUxyyaf2R0K3QeJCTF+MMIlSk2eOQJc+CkwUQ=;
        b=AtHb9xyawPTrxHVcKNwAGL+c5g2gtXU+F2vxz5gsdTY7rqzH6aPMNLX6rspUetKoeh
         h0xniWhs/AplLR2SQ8eyH/n3sx+zmgpE5gP0xnFzk6k5DXT8+9NbqLNThuZzmS3wB13p
         oE12rKtUUo+BChOgoyiwtGusL1wH5mz/jRp8gRukIvPpn+aFMIPHS1WkmqJvW0rz2bhW
         I7ex3fYLn6eJuo0oLTCBOpnHlIjBlI5jejoaf2qgPU9u3bFWvb+nPRvjjjJbfnXvbzi0
         i3dfXSScSyBih9CQJeQ6MdS/YUbdmyxBL4Qke4XC5yeB7tFDDlALQf2f/qVSOhuogscd
         LE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744109279; x=1744714079;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8PVEzrUxyyaf2R0K3QeJCTF+MMIlSk2eOQJc+CkwUQ=;
        b=bBsVlS43QZUx2G1KMJQNKlVqBSSvgojT0sjLQGLQt1n7zDYVYSpnKz0B8UTc+zdqUK
         Zb0ok4Ls6b+MSjcOOQ6QMfjdxbZMtFHHzJSa+N8fLj75A38EOxgOeEWR9hAsRuUOMhi/
         /VTCx+epkO2cEwJSUBhJSIz4p7gG27ufLnGyNjZ8Ib3RQX40GBT7MY0NLi6NTA3V4Ye3
         S7dHX9oHO/SAgJEQ55xlvKqHyKdJObRC3P6b+B/BeTYRK+2XCEPl6OSK0ANZb8v04tJs
         My/Qx8lx0XHkvFIU5IewyxgitmGNZW5n6jleQi/L/URFCB86xCITvY80LqFHYqPueW9t
         BLwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpTjRvhFs4XLWu3/0imWuD1zonfnolsYs4vTHjOuKNU73nBlpt4D+9ZUMBB2I5kqt1rzVNpnaV8gE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYy9gnP9LTm7dGiI/I8A+kYL6FcswGZjVeuabI1meM9EAeHL63
	mEydxEhrd6X/XB8r5ugHnD7na3aNj4dvHo6qnCFWI0oDXhR4GPRkD2vTkpxnAg==
X-Gm-Gg: ASbGncv5FjvwH++tL4wNWIOI1ccdu4Pf99N6uAO1/92h/N0CN124bTSfmnD/s6IqEb3
	CiegXa5sMp4AirBZY+2F55MUwvkhFg/kxXQDHDqVuPlCBFj3UyfE4A/hQgTMGvkxpR/lHB9o/eu
	7bO6/ReyXzjCo+xY5T0R++X0xJhIUtEToX19kF+I/FR1BfawcHqWb9VtIYQp4RbJcnbpNJE985l
	z9PVFzj2e0PM5x4M+JHCGEJgc5fQiivIIFeFqdF/R1aQO+QQVUORMbMpc/RmYNwyYSaEjc4waYj
	K5XRKC2YZDDAtdcThNTkz6eouOrB2Hdlh9B/tEfM+5rpsJor8Hu7HK6KLN+2SDvvPDWXp1cH/kq
	IJyE3K/8GdCw/OF92l0qiyTPKEnrIcg==
X-Google-Smtp-Source: AGHT+IECGZab2Gdag8Qthtaf8huF9s/jXVKjiG+3e3FspWCNfvxSOsboGyQrfQXZoYbzr2TJKVMg+w==
X-Received: by 2002:a05:6000:4021:b0:391:2df9:772d with SMTP id ffacd0b85a97d-39cb3596914mr13348284f8f.13.1744109279561;
        Tue, 08 Apr 2025 03:47:59 -0700 (PDT)
Message-ID: <38df7f46-4468-4d0a-92a7-92f0fad13ede@suse.com>
Date: Tue, 8 Apr 2025 12:47:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Ping: [PATCH] libxc/PM: correct (not just) error handling in
 xc_get_cpufreq_para()
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <df676738-19e7-47e6-977f-25d6d13ccc50@suse.com>
 <e0028d85-668a-464b-aac5-ac8a79ea9bf5@suse.com> <Z_PI2UNn2C4GKqYw@l14>
 <75d288ba-1006-46f4-8f51-6d49c5e8449d@suse.com> <Z_Pt6Pv8_RrV4J2U@l14>
 <8f29b0b3-dc57-417c-937a-50f5aac6f6f8@suse.com> <Z_Tze0pQFrU-9pNq@l14>
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
In-Reply-To: <Z_Tze0pQFrU-9pNq@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 11:59, Anthony PERARD wrote:
> On Mon, Apr 07, 2025 at 05:38:57PM +0200, Jan Beulich wrote:
>> On 07.04.2025 17:23, Anthony PERARD wrote:
>>> On Mon, Apr 07, 2025 at 03:23:48PM +0200, Jan Beulich wrote:
>>>> On 07.04.2025 14:45, Anthony PERARD wrote:
>>>>> Calling xc_get_cpufreq_para with:
>>>>>
>>>>>     user_para = {
>>>>>         .cpu_num = 0,
>>>>>         .freq_num = 0,
>>>>>         .gov_num = 9,
>>>>>     };
>>>>>
>>>>> seems broken. It's looks like the `scaling_available_governors` bounce
>>>>> buffer is going to be used without been allocated properly handled, with
>>>>> this patch.
>>>>
>>>> The local variable "in_gov_num" controls its allocation and use, together with
>>>> has_num. "Use" as in passing to set_xen_guest_handle(). The only further use
>>>
>>> When has_num == 0, `in_gov_num` is only used to set `sys_para->gov_num`.
>>> It also make a conditional call to xc_hypercall_bounce_post() but
>>> there's nothing to do.
>>>
>>> Why user_para.gov_num seems to control the size of a buffer, but then
>>> that buffer is just discarded under some condition with this patch?
>>
>> That's nothing this patch changes. Previously has_num would also have been
>> false in the example you give.
> 
> Right, sorry. I was persuaded that `has_num` meant "any" of the buffers
> are allocated, instead of the written "all" of them are allocated in C.
> The logic in this function is really hard to follow because it doesn't
> make sense, especially the conditional on `has_num`.
> 
> Your patch does make requesting governors actually optional now (and now
> that I realise the calculation of `has_num` doesn't really reflect the
> name). The introduced `in_gov_num` local variable isn't very useful as
> the only real need is in the cleaning path (and we discussed earlier
> that cleaning can be done unconditionally).

Hmm, yes. See below.

> So the patch is fine:
> 
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks.

> Oh, one more thing, it's funny that a lot of faff is done toward making
> the cleaning optional, with all the "unlock_*" label, but then cleaning
> code path can be executed when e.g. cpu_num=0,freq_num=4 (unless the
> hypercall return an error in such case, but the code shouldn't rely on
> that...).

Yeah, perhaps I could have dropped the conditional there, rather than updating
it. Are you happy for me to do so, dropping in_gov_num again (adjusting the
description some, of course)?

Jan

