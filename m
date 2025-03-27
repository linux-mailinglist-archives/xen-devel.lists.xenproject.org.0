Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AD1A7355E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 16:09:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929548.1332236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txoqm-0002z5-Na; Thu, 27 Mar 2025 15:08:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929548.1332236; Thu, 27 Mar 2025 15:08:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txoqm-0002wZ-Kl; Thu, 27 Mar 2025 15:08:56 +0000
Received: by outflank-mailman (input) for mailman id 929548;
 Thu, 27 Mar 2025 15:08:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txoql-0002wT-Qs
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 15:08:55 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6602ccca-0b1d-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 16:08:54 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso890267f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 08:08:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82dedde6sm40732165e9.5.2025.03.27.08.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 08:08:53 -0700 (PDT)
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
X-Inumbo-ID: 6602ccca-0b1d-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743088134; x=1743692934; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xoi4q6ojIHG2wXB3EUgXjgE88BGltWN/JC8dV5kBNj4=;
        b=SqLGNjpWirO6K+cSTO8x9SR+K5I7p8joprlQlcUkXotZZmIVxFs/7QX/0jWwShdXGu
         saE6ryMPvzd7LSxeRY9UTbH+QuydxMWVveuTAY+ZNmUvyjsgTzinL3HJCqz71c2zjbUl
         qHtQrijrwVtVF46EFA5DT+PLbK3XTm+fsimdW6W93QtBZhLmoe3I5q0I5bVx/GCwKJts
         cFyogf+vr5rlFRiVIfRw6HPr/2h+5MwZqadldmMRJl/lG6KiiAiO/h540kTaysrG11fQ
         dda3V6vx6yqN45Cm8ipQ+tvHAHTtDMJoV9QmnQYUpFqnOMf3b/4qo0glOhxVc0z8ly2G
         jwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743088134; x=1743692934;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xoi4q6ojIHG2wXB3EUgXjgE88BGltWN/JC8dV5kBNj4=;
        b=GoVk+3YCoB3lgPpadH6J9azTNeeBoik9HMQdRFEOF/c7zznidXUqssAZAz+PUpWkl9
         fogZqfPxCROnzRoW3uLTpO62QHzYtiQg6UkrmeC0t56AzJ9ljG3cfatFtRLdETNFi9GY
         5vLLGJlfHklpT0Er7NW89olWYdhGJW2TZbQ8czx5Om3p5CyRNUQoh3EeCalIYVJjQ/fB
         StrsCjS211/Z6FrtSyIoh+vmSkI8pYtJNAkQjyUaFOyNIZxiSeq8Gm3vJTZMp2oQ4kyj
         vYt13laImcgn9Ip0Qu3WlnNBsTmxg3fCJ/QViOr9IvrLOfBD/T5lfbdQ7otWE98vFBVY
         NAWA==
X-Forwarded-Encrypted: i=1; AJvYcCVluWvF1RVUCfZlEm0ZD9iyNva8KF/1ZvGW0zeS8cJwUxkj9NhZJJK+VCZRxpLEYMnqG1cnVjCg7uw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxsHCGX56Acx1s6WAKbhIC8NWfWKwhddwXKw73YwB3gQ/5Y8i9e
	1CljUXIaLQAoBcE7TuvHAwDHyBzqLDwDxgxRvKmneGo5jPGSNs0iO014T3TCLw==
X-Gm-Gg: ASbGncttsXdUT+bRD1c4EHVqsIBZSKvUIl+jbzr39wUd8zT6moODZNazKwtQf4aIMUM
	NlV6nkbj3q4ZgWE76ZKehsfsdI8Cyu5hrJ0ItUxEQxzPlmDLtzuQtOv+eOY9jNXthZ8Uz0MRItt
	yZXp1vtboj1QgVXL03PSW0e13FOqUlRMtrWJ9PoUxkHzhrm58T0ZRLbQIqOp+AENj6SJActvNHH
	ONqvGghBN5utO1UvwNIgT3+y1IxAH+h01R6yGAsv2AjH2sk8CpGZ8dLvG5A1NDYMqhPy7zyBxX4
	+rimib3e/iELuI6vB+PYWGixu3JZftldejKOfge7sYG7OTsgRplp8Ta2SpJRwJU4kThuy9Udh7E
	j9xQrHMpdHZOxiW0rQ2YWOcMfAmLG0+ViKjKWgzcU
X-Google-Smtp-Source: AGHT+IFe89gEnPeHi+2b+9PqhGDSn6j/MVltmycwi40CKYPexZXuAPx7mLXTzGOrX1CAGVMC11Vl8A==
X-Received: by 2002:a05:6000:1866:b0:390:f902:f961 with SMTP id ffacd0b85a97d-39ad1773b94mr3442416f8f.45.1743088133586;
        Thu, 27 Mar 2025 08:08:53 -0700 (PDT)
Message-ID: <87f63516-f9a3-46cc-80a7-1eb614c1f818@suse.com>
Date: Thu, 27 Mar 2025 16:08:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] trace: convert init_trace_bufs() to constructor
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <e1e556c4-ed71-41f7-acfc-b7fa866a0d3e@suse.com>
 <89043421-49b5-40cc-91c8-f4cd7dd2f6d1@xen.org>
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
In-Reply-To: <89043421-49b5-40cc-91c8-f4cd7dd2f6d1@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2025 15:49, Julien Grall wrote:
> On 13/03/2025 13:38, Jan Beulich wrote:
>> There's no need for each arch to invoke it directly, and there's no need
>> for having a stub either. With the present placement of the calls to
>> init_constructors() it can easily be a constructor itself.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks.

>> ---
>> Same could then apparently be done for heap_init_late(). Thoughts?
> 
> Looking at the code, I couldn't figure out whether any of the 
> constructors may rely on some changes done by heap_init_late().
> 
> The only issue I can think of is scrubbing. In the case it is 
> synchronous, would the memory allocated before hand be scrubbed?

Memory that is allocated can't possibly be scrubbed; only memory that's
still un-allocated can be. With that I fear I don't properly understand
the question you raise.

Jan

