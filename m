Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B507CA07C63
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 16:49:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868871.1280373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVumU-00011k-2X; Thu, 09 Jan 2025 15:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868871.1280373; Thu, 09 Jan 2025 15:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVumT-0000yr-Vs; Thu, 09 Jan 2025 15:49:09 +0000
Received: by outflank-mailman (input) for mailman id 868871;
 Thu, 09 Jan 2025 15:49:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVumS-0000yl-Sk
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 15:49:08 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42eb4ed6-cea1-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 16:49:08 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso8896805e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 07:49:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2dc05a1sm59878145e9.15.2025.01.09.07.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 07:49:07 -0800 (PST)
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
X-Inumbo-ID: 42eb4ed6-cea1-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736437747; x=1737042547; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yG/3DWoK9VEtxCl3OuIsNNW81fipAg43SNdIHPkcq54=;
        b=DldDiyTvBoDBtD0KgwalFkmW8tUjcpr9WbhwBZkVHGHdNFipMqd/toft5g5jHyBKxP
         uKmK995AGiva09umVhIEkvn6d8iyO3KG+h9Tc1drV5kbWSmJYuCx1+fz/gkm4nYcZvgU
         c9PiXXHoPIRaRlwnGhY5kSBm80ZXN+y/ntphGUVf+U7TeQmS4D8pZqxqax75p+d8XP+L
         IHp4TxgWgmByb+VQXwYb5BWYvglkzIXevHHtSsdQK7XMaA7vgem6o75Q46IocL0mhCbQ
         5HGthco8x0R9wvAzo9JCqynlzBHsYC73C1lf525fCmo/CrlSvIo9I9F8bCB7uPOSbYhA
         MPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437747; x=1737042547;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yG/3DWoK9VEtxCl3OuIsNNW81fipAg43SNdIHPkcq54=;
        b=oZ9xTHH4A0CfZJInU64J75Isc3lFJEu5zfoBRrvF8nsrbflK/yY1erATtzrUXPOpXT
         MVpFJmBbwRM4gFLV39G7WDRHc7IV+T6+Z4q7hBe9PUUMk9zMxiNv1aAxnLamBbcpvr/g
         dG1lTgjt3/OmHMHh7cstNOwMr325hyujSEUTZTdQHOEv1YVz9i2qc0b+X3zg+I4x4Td0
         EVCKkbKrUuzcc6mdPjr2FxfJDXeOZTReNXvPkD+9EkpDv+ab6/UM9RRhMPgsqyz2TVBu
         gZRtJzTJffr/IDwzZfubSPQBMZUhHu3qJOCgJkH/go1MG71olKLod3PQXAONBMUhhas1
         Nlsg==
X-Forwarded-Encrypted: i=1; AJvYcCUTnqMbcxULCHcHWzbTIjElQFy88yvXVEQmvoFC56V5xotimVVtvBipg5uj6luzX7iTYvL6fPyrHog=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3KaVCpdEJo+CJRTuNziBOjbrw0pHE/CZjF0jsrkenWp2owhEi
	0GQ9rRGjNUnTY5wZDCF4d8J2TIGrzC7QcuHLc5LV84FafiJJsW5ELIwTXGKX2g==
X-Gm-Gg: ASbGncuWlA0UzqbddXIsXxjsWYWo5J6FDI5UaSbN0JCKFVNcrvQnMamG3XNy9it76Ae
	nedjC5GAqRf02YZlSQiNvUFpt6SW66gLsYcqlnDjaePRm4pf+QEjOjLay1XV0B97aqHDVUakAR/
	ICILpvaIJyataN2Hoz9N6dYYKNVfmEiF2+JDV00s+Eq4Z+UaMGR51YE1b37kmvUopWP7ErTS9PD
	8nLg1r0kivFwUvJcN2cg4DqgGPYBQlAkIkX6GkdD5JzCQfycReH7g08G+8wp2t/TJPEbjvyjDQW
	DXPB8o7xBVhYxPTHTvMsGU12U7OL1UHCiSZP47z8Sw==
X-Google-Smtp-Source: AGHT+IEFarfKs0uFSicm2xnT7T6Y3k1iVbTo1cBnqhdcbT4Fv3ygHYyXB40NeXtXImbK364hlPpupA==
X-Received: by 2002:a05:600c:35c1:b0:436:a3a3:a70c with SMTP id 5b1f17b1804b1-436e26ef06cmr50701365e9.28.1736437747524;
        Thu, 09 Jan 2025 07:49:07 -0800 (PST)
Message-ID: <96cd80fe-f4f1-430f-ab7c-2ce0befb20d7@suse.com>
Date: Thu, 9 Jan 2025 16:49:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] xen: add bitmap to indicate per-domain state
 changes
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250109105935.23585-1-jgross@suse.com>
 <20250109105935.23585-5-jgross@suse.com>
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
In-Reply-To: <20250109105935.23585-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.01.2025 11:59, Juergen Gross wrote:
> Add a bitmap with one bit per possible domid indicating the respective
> domain has changed its state (created, deleted, dying, crashed,
> shutdown).
> 
> Registering the VIRQ_DOM_EXC event will result in setting the bits for
> all existing domains and resetting all other bits.
> 
> As the usage of this bitmap is tightly coupled with the VIRQ_DOM_EXC
> event, it is meant to be used only by a single consumer in the system,
> just like the VIRQ_DOM_EXC event.
> 
> Resetting a bit will be done in a future patch.
> 
> This information is needed for Xenstore to keep track of all domains.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



