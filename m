Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1F1A4767A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 08:27:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897816.1306442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnYIN-00086g-TN; Thu, 27 Feb 2025 07:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897816.1306442; Thu, 27 Feb 2025 07:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnYIN-00083x-QY; Thu, 27 Feb 2025 07:26:59 +0000
Received: by outflank-mailman (input) for mailman id 897816;
 Thu, 27 Feb 2025 07:26:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKxr=VS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnYIM-00083r-3g
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 07:26:58 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 390e5965-f4dc-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 08:26:56 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so3699545e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 23:26:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b73702f42sm13067415e9.9.2025.02.26.23.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 23:26:55 -0800 (PST)
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
X-Inumbo-ID: 390e5965-f4dc-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740641215; x=1741246015; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iPKqQNRf5vXntnt1S4YgaYJNkp9CMHAwjSnOt7GlQTA=;
        b=HozQfM+7BgPyfCdUX7j/iNzn+K/OzHo2MbQ1TWxNabaB7QqOFMvuYJ2on5P8q+TSQw
         t6cRlDYfQAoGxtsOahquH+WuvISXk3SzkMnlCSFD1LcM/grHmo1EyyDAcSlTfl9R1trS
         UrvT4nrxrgoTBt6BxEjkpnSX+S3CXed6crSq0IlogDRf7Qi8DFqi2lqLoxUpdALo6Ehx
         BbbwYqOk+ebUsZoQevRk4m01N5UwLcY0Qobl/K2Cv1/YDMupoK0mnad9o2uHMG38MmFS
         KC8Ji7qciUugLCjLUtGfC7EH7P+lI7IHaBleFFeE39bbN7LVi+p/3vDLQsXQWsl8w5z8
         /SMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740641215; x=1741246015;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPKqQNRf5vXntnt1S4YgaYJNkp9CMHAwjSnOt7GlQTA=;
        b=ZMF3mgWKuDJ7zLYHIduJFSzN1NEbIWou4K337+QBFEGXcUHsMnqwCs4ZS+Ht6hpOd+
         PBtX0zIHOOT2Z8mpTMO22hSO0GOjIpLOsmc9Pp0TtHI+CrURLbu6u4Gb2JA58uTlrU38
         rzz1Ihmx14OTHchnFAnLHcni/Lr+4ELf5fBH+Rx3KqAEc++Ma5CNZfXyrBCP4rZKk0ck
         q1W8f8mRjzQbWjIl7GJ06rOKLM9MCkhlmgrR/kg0gsEz6DYq08IBtKlg3X4CFt+gy8qP
         jRXgBSCnzijAoAx45vOycpWeW5N72bkQpWHx341lutmKHbBxGUorgZkrlBEPJHuvA8+Q
         c/gA==
X-Forwarded-Encrypted: i=1; AJvYcCW8Y61iIgBsytbedwixSgY28lbobomKRqSMWt6O+Ef3I1G2bQW9hOzdy+QCoF7RTf9F9v9Z8cd0JBA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydWHiKgzWSd0Z3aNFAuCS5k+3Jsb2XDpOIzP0W4afDLPRWdiH3
	NxMUZXFnRz9jLUuctsc2OmKKxY5Jc6+dbfvEJSPqSwqB3lxcUDZKIed92SH/wQ==
X-Gm-Gg: ASbGncvf44+DQtjWxIRPWpeeMaDxAnBb/piupVDu5yVC16+KtnvWSyV/j4gQo0Zk/OY
	yREMi0D5f9cqJmoFEKdLdUFgdQq+cnpjmCBSS/fzxOPOyoLlT8+KvRT2Ym/hB63dUnevsFqox6Z
	urZ5EQZH9NB+lGMzOQJss1MYwrR0sMOOqJi83fKMPGedwmKoj/kzIlv+bOKKXP9jWzOwVXognYu
	BHYj+/nJmSdYybKghqFaBMzWqciIEFeaDEFQN0jInzbG5/xTvul5D2B9TG5F/3/oK8oY/gf0Rm+
	lN139dHJSJ3jo2Hvovg3JyYxuUOYE2qc695MwOLhJexmJnaHnHDqGQomXp3q47+Ocm8HaHS/MEI
	OOscqscyJzrQ=
X-Google-Smtp-Source: AGHT+IEsWP2QUDjDCG/lvPVRx0RHZqPUXHPNbF4jq5nJq9sXy65saat6JVwKjAkFvGE/gTOvws0eEg==
X-Received: by 2002:a05:600c:511e:b0:439:88bb:d017 with SMTP id 5b1f17b1804b1-439ae1d96e4mr204903895e9.6.1740641215467;
        Wed, 26 Feb 2025 23:26:55 -0800 (PST)
Message-ID: <9ca1bf02-8922-4b64-b936-32a32834adb0@suse.com>
Date: Thu, 27 Feb 2025 08:26:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/console: introduce console_{get,put}_domain()
To: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250218083048.596012-1-dmkhn@proton.me>
 <d955ba46-6556-40dd-9809-8f64c53dd704@suse.com>
 <4fIn4-lOrAgG5CkcxCJ-10lj4uGVZmQZpKtP4OZwzSyWyOqmxghZ4UCNsWf7x5vJi9I25YuVZqyTFqrVcRjgD4s4DqrLJrCGkVID4tNSgjk=@proton.me>
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
In-Reply-To: <4fIn4-lOrAgG5CkcxCJ-10lj4uGVZmQZpKtP4OZwzSyWyOqmxghZ4UCNsWf7x5vJi9I25YuVZqyTFqrVcRjgD4s4DqrLJrCGkVID4tNSgjk=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2025 19:39, Denis Mukhin wrote:
> On Wednesday, February 26th, 2025 at 3:30 AM, Jan Beulich <jbeulich@suse.com> wrote:
> 
>>
>>
>> On 18.02.2025 09:31, dmkhn@proton.me wrote:
>>
>>> From: Denis Mukhin dmukhin@ford.com
>>>
>>> console_input_domain() takes an RCU lock to protect domain structure.
>>> That implies call to rcu_unlock_domain() after use.
>>>
>>> Introduce a pair of console_get_domain() / console_put_domain() to highlight
>>> the correct use of the call within the code interacting with Xen console
>>> driver.
>>>
>>> The new calls used in __serial_rx(), which also fixed console forwarding to
>>> late hardware domains which run with domain IDs different from 0.
>>>
>>> Signed-off-by: Denis Mukhin dmukhin@ford.com
>>> ---
>>> Link to the original patch:
>>> https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-4-c5d36b31d66c@ford.com/
>>> ---
>>> xen/arch/arm/vpl011.c | 6 ++---
>>> xen/drivers/char/console.c | 53 +++++++++++++++++++-------------------
>>> xen/include/xen/console.h | 3 ++-
>>> 3 files changed, 32 insertions(+), 30 deletions(-)
>>
>>
>> This patch doesn't apply to staging. Looks like it depends on "arm/vuart:
>> move vpl011-related code to vpl011 emulator" without this being said anywhere.
> 
> Correct, this patch depends on
>   https://lore.kernel.org/xen-devel/20250212211802.1669675-1-dmukhin@ford.com/
> and I have R-b:
>   https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2502121412500.619090@ubuntu-linux-20-04-desktop/

I'm aware of that. Yet that other patch is too intrusive for my taste to put
in an only half-open tree. Plus you should never make assumptions about the
order in which patches may make it in; if there are dependencies, they need
to be stated (prominently).

Jan

