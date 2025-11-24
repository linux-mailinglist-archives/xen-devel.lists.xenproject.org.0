Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F00A8C802D2
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 12:20:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170356.1495421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNUc7-0006rv-OI; Mon, 24 Nov 2025 11:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170356.1495421; Mon, 24 Nov 2025 11:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNUc7-0006pr-LX; Mon, 24 Nov 2025 11:20:11 +0000
Received: by outflank-mailman (input) for mailman id 1170356;
 Mon, 24 Nov 2025 11:20:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNUc6-0006gG-71
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 11:20:10 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 894e0d16-c927-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 12:20:09 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so23340985e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 03:20:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f34fd1sm28383430f8f.11.2025.11.24.03.20.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 03:20:08 -0800 (PST)
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
X-Inumbo-ID: 894e0d16-c927-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763983209; x=1764588009; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bUdTz8ZQ15o/mmRGUwdnYjnzXpQyCXfvD0OTaZPqMJA=;
        b=CMK69y6TdoYgYW2mTe1Pmh0f8/ToNuPRQk5s5Gyi1WPDwMN2R8KVMrqJGY69adxiAW
         Ly3I8gAxuqtn2hPMath+0pPRofkwm9bnO1HsVOc57uIATHMhJxKmuKE7E9I99NnwVDH9
         qoZGa4XtBsv4/o8CljYZKH6x33m7xn4R/MiiqazOZ2xZHpUerROID0QyybLue3tFd6bZ
         sWyTnN+stba5ddFEhe+cct4AV63FYbs+RDghZkUWQSigtg8mDPyb3aOetwK4zr5aDKFx
         klwLY86eRL3FJKjrVSowIXts9sMEUbYIWvVhQP1Q9k3rQWlw3gstmFJEPnKA3rUwzswX
         gafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763983209; x=1764588009;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUdTz8ZQ15o/mmRGUwdnYjnzXpQyCXfvD0OTaZPqMJA=;
        b=EswhMznPQsnUyANCkWq2Qg/zETFU6u5ES6vQALBT0mS/i5gAo+2qW2bZliVf8jseMd
         BjIInsiKEaR2ohEjIxsLIudiWjuNklYRdwbI0R1NQ8LFi/SkszVbbXBwvveU5l+sPszl
         RjBrIR1PKv0xCcIMmbnua4oGaygyCiHIe0+z6A+InZ3DZ4vNJuQ2jipNqyzblB4Sn+I1
         R4rkil8z2ghhlt1QRfVemAUgnCVqtr8W5FoTbeVNUiiYu6j5EoUN8L+4vuoT/szNQ+ex
         cmRdtVimXysWgaZo16eXengq8jrUE3EMzfbvq7ZKJLk41re3lrEw8QqKpkAEthwfAB4K
         mbrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwpakcpKNTvud+2e0b0t6HBPOMTZECwDrnfFaV4fjaVjOBIsZmykQw8DzCNUO/yS2Gr+6AROocu3Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVjTBEUo8LEMcuAGZ0PSI2ITufBhglqivGy3ot13qLySt6OW9O
	AcSm9qtej34EbtKIo0cJ0YlEn3T3haMk3akKeZQjh5WN4Xq7M3sd25i9NwNYiRpmyA==
X-Gm-Gg: ASbGncsNYxjTeGiD6kcUnw450WqyE0m1MBV+5kVoZYzY7odZsVfWVIMhuJVpuz4t6o1
	a9CsXFFACcVWidUizib10daihzp9t3HQCUEWNj4dXBhCXNLT/vYAiKNdew5OF0e3GjtnLT1NXDW
	4VAYTzhmUFlIgD14M6pp2bTOnPFe3vPCAeAStykB4GWG15DPBIlz2YCreqRSIcOMaFCfzSdyJBF
	MpseWxkfm/X959h8s+0tXZVfgzw+HNZqxVVpFkzwUXyDmAgzKPOIa/QM6HuxOFjHy7gJWo/0fKb
	tHnqJhcwuvzQ+P1FBJwuFam+HTqkz6z6+/GYp65k/SlI5t7rPCr4UwL/9owlTfgNHtvJDmej+Xc
	4bjeP263/fw0pOmt30D7CY6+ggJWV8RZNkSHarzXJU+9z2pDG3rL0KrVpWXaMqFFCmCnzt66Y4U
	5hZIlGrOJo4GXjySFqm84Wk68bUFVgqS0G4tGfxHUe2FgwLW2THrCyZaGyGKwEn/SZ5q2n/i2GQ
	To=
X-Google-Smtp-Source: AGHT+IHvmuKkJikqVIn/OOgE0/yjdKyOHbhULSsUZcHCji0QTO3XwC3iRETChvABa+q5dSLD+pxsLA==
X-Received: by 2002:a05:6000:1a8e:b0:427:167:c2ce with SMTP id ffacd0b85a97d-42cc1d35653mr11401230f8f.42.1763983208771;
        Mon, 24 Nov 2025 03:20:08 -0800 (PST)
Message-ID: <ff4bbf62-e9b2-4d29-bc73-b4922e3ed742@suse.com>
Date: Mon, 24 Nov 2025 12:20:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] x86/irq: convert cpumask parameter to integer in
 {,p}irq_set_affinity()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120095826.25782-1-roger.pau@citrix.com>
 <20251120095826.25782-4-roger.pau@citrix.com>
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
In-Reply-To: <20251120095826.25782-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.11.2025 10:58, Roger Pau Monne wrote:
> Existing callers where already generating the passed cpumask using
> cpumask_of() to contain a single target CPU.  Reduce complexity by passing
> the single target CPU as an integer parameter.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> The function names are misleading, as {,p}irq_set_affinity() doesn't adjust
> the affinity of the interrupt (desc->affinity) but the interrupt target
> itself.  Further cleanup might be helpful to correctly differentiate
> between setting interrupt affinity vs setting interrupt target.

Indeed, I wanted to mention this as well. As you touch all callers anyway,
how about doing a rename (whether to "target" or "binding" or yet something
else) right here?

Jan

