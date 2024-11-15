Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F39D9CDE74
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 13:41:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837479.1253409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBvdP-00032Z-0C; Fri, 15 Nov 2024 12:41:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837479.1253409; Fri, 15 Nov 2024 12:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBvdO-0002zP-TE; Fri, 15 Nov 2024 12:41:10 +0000
Received: by outflank-mailman (input) for mailman id 837479;
 Fri, 15 Nov 2024 12:41:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBvdN-0002zJ-Ep
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 12:41:09 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e17460e0-a34e-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 13:41:05 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37d4fd00574so1009197f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 04:41:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821adad9cesm4237555f8f.37.2024.11.15.04.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 04:41:05 -0800 (PST)
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
X-Inumbo-ID: e17460e0-a34e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmEiLCJoZWxvIjoibWFpbC13cjEteDQyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImUxNzQ2MGUwLWEzNGUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjc0NDY1LjkxMjE4LCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731674465; x=1732279265; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=40c6jFpGoZyFWJEaf3DYkdECs5l/9rrlDhrYjom8FAI=;
        b=GmqaLPXsnk4aa+KW3YDko+dRJ6nFH3UX9q8vvyOk8KjnmuonQrKzuTgMa6y+INksc2
         pJ+Oq4Bcma5YkNCe67N7gZ2tVsDWOl4wohXDK6qtKnA4PthmizOCYDAHdcnJMPEJ/LxX
         xsozW+fAKVJWpwXojsMMj3wo+i0AZkKU/tAbclcwO3pbanyj3tKZZWEbzKMN8rMI/Hfb
         qqAcDm+VSxKiuTi0HlpK2lUr074dPvqloa9Ylyk6Twumb+HzIRaBp03Zq0ug9n1DVvab
         vHRWhPZPrNSkz7Y32o5Ea1F1kkfGRa2sV+dN2E+nUX8i+A4EKbmhiz/F+KFhaHvVNEaz
         Df8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731674465; x=1732279265;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40c6jFpGoZyFWJEaf3DYkdECs5l/9rrlDhrYjom8FAI=;
        b=BobPlGoZr5v8+eYpU1imT/y2lE+7RzGi/DlXefTTjxSYnIdVTEhAufSN/eriGdog8H
         cPfS334p9faY+G0idOSXi6mQulJz56lxirX0vl321Gx9TUzXScgmPe8ugNGLOeTWmEEM
         7UFaJsJ85gKzr3mNNsgqxaRwrB7si7SWlTPt4AXcDkCo09LCdrNKxRTnhVwry2RgzAGq
         g87KcsPk3xBZYREf//DH3yn6fsid2eQu36wwgjGFdaV9i48Q7XeW4/Pdjk/N+rS4/1RT
         XPlO67y/wjzkb+pZQqLBh3nEUEUu2GZcJTQWAJlSACL/NN9nbMcH+6hJuOvpkZvcjZIc
         4wgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVOyP1uLqrw2FkP2TNmEUejxz922MKBeo6/6TuLufJWSM8IPsgGnbmIGf/PcVV3CAH8stcGvXhxO4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyN0KNRocag/3SR7wY27r59yOkhgsba9yOLG8UVYZr7JJtJWfQr
	hBuqTBVYANUT08+3dhpN9eD3j/P0Sek6RCESD7snv5YEsyXUsD6dHZgPEsEASw==
X-Google-Smtp-Source: AGHT+IGsu4gI0bcizhmck3cHXWgB2hbQszIZiuFXJXiymAeQv1/KGzys0CUvrIgooNavdifNBUHm7g==
X-Received: by 2002:a5d:6dac:0:b0:381:b20b:ff3e with SMTP id ffacd0b85a97d-38224fd058amr2686868f8f.26.1731674465286;
        Fri, 15 Nov 2024 04:41:05 -0800 (PST)
Message-ID: <5aa5392b-31f5-4779-ae2a-039cb667e2d7@suse.com>
Date: Fri, 15 Nov 2024 13:41:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/2] x86/hvm: introduce config option for ACPI PM
 timer
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1730887415.git.Sergiy_Kibrik@epam.com>
 <da2758bba96e247027106e13129c87ae31193e97.1730887415.git.Sergiy_Kibrik@epam.com>
 <34a2d071-59a8-46eb-a9fd-516cce801343@suse.com>
 <505e0790-10b9-4468-994b-1a3890eaef46@epam.com>
 <c565ae31-26a3-405a-b4a3-191be95b38ce@suse.com>
 <2285d21d-25e7-4682-aed9-1f569ff7d6d2@epam.com>
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
In-Reply-To: <2285d21d-25e7-4682-aed9-1f569ff7d6d2@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.11.2024 13:36, Sergiy Kibrik wrote:
> 11.11.24 14:05, Jan Beulich:
> [..]>>> What exactly was it that Roger suggested? I don't think it was 
> what the patch
>>>> does overall, but just _how_ it is being done? That makes quite a bit of a
>>>> difference, as the former could be read as kind of an implicit ack to what is
>>>> being done here (and also in the other patch). Issue is: I remain unconvinced
>>>> that this conditionalizing is actually something we really want/need.
>>>
>>> about a half of this patch is what Roger suggested. These changes were
>>> in a separate patch, which Roger suggested to be merged into other
>>> patches. What tag should be put in this case then?
>>
>> The tag itself is fine, but could do with clarifying by way of attaching
>> "# <brief>", like we also permit for R-b and A-b. Alternatively a post-
>> commit-message remark would help during review (but notably not once the
>> change would have been committed, e.g. for archaeologists).
> 
> can the tag look like the following?:
> 
>    Suggested-by: Name <email> # domain.h,domain.c

Not sure what people would derive from that. How about

Suggested-by: Name <email> # approach

or

Suggested-by: Name <email> # how, but not what

or some such?

Jan

