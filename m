Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 288CFA502FD
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 16:00:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902443.1310410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpqEN-00084Q-Os; Wed, 05 Mar 2025 15:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902443.1310410; Wed, 05 Mar 2025 15:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpqEN-00082f-Lo; Wed, 05 Mar 2025 15:00:19 +0000
Received: by outflank-mailman (input) for mailman id 902443;
 Wed, 05 Mar 2025 15:00:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpqEM-00082Z-UT
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 15:00:18 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cf08241-f9d2-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 16:00:17 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4398ec2abc2so61729065e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 07:00:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd426ca07sm20059815e9.2.2025.03.05.07.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 07:00:16 -0800 (PST)
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
X-Inumbo-ID: 8cf08241-f9d2-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741186817; x=1741791617; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RyvjW5c6iwJDTK1Lpof10N8PHBOXS02s/X+QNaLBgYk=;
        b=MgiYOwnFJqleN9eTzuqYoWPjqPU2GeN+WCrItam9byQZQaiVU79ShzKR2EqZkKxEtl
         4LI2LPDWQzbPJyk3YLk3NNV7RrILlgiTpFyiJVxSEUPlucziUVK9yWjtEJ4fDP1NSanf
         tgtB2QaGsU7wWaTxXUo2CobX4GdWocjstiyaN0x7pFwdq/rAm8Gtl9tFO0zqtStxDATj
         pvn2b7KbqisVGaDcIOhi8zUubPJqvuTRvpL5Kaw5XZE2Eg954WypPv6kDYZkISs4xb8C
         uXF8+XvZXL3m1z8y3oCr8tqUEYlgMfS9BNoD4sbHxFmWYgvuIQlI51wLAQdnQVQgcgOj
         857g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741186817; x=1741791617;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyvjW5c6iwJDTK1Lpof10N8PHBOXS02s/X+QNaLBgYk=;
        b=aW9tnddLtfWOkRNU2LzF11xZXh9dAKbd36r0UQHfUhEMvXcmBg+X8eYqKkx1UlqnIH
         YEA0o6NQQDz2uZS41KRVuLFYZ7/S813XCgeKCIsuj1ArrzHc2wCZqSv7LjFuhobxtQFw
         dcdz8MQC4Y4xgcfj3H+J1yj8O5FcXGzexFK8JuF3Iew2LVYKv7H7qq2zZVXw0wZRNAd6
         OzubI/sp70r6o1DksaDWAa7x/7XNRg/q7HBqhEoU15x5xgRX70OyUMUJGNJTQUjcSKgz
         lZUZo9LB38Oduk2YOsv2tIMlu7h1B1/ZRYdXTEmjCoRYxRkv5jUcbr/H7oQ5TPRcOwk0
         YVIw==
X-Forwarded-Encrypted: i=1; AJvYcCWnjqYJAagjSIlfK4nVGYjWJUff6BwTNagw1IbaQY1a6rqb46O+mREOkqnGYA/Ezrw0U9mtsMk/6sw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwULWFhhNX344nWml5laCa4ONO38ykQlAXiTSTe/Ec7xEtARE4n
	AWuqMXAKd/JAD2GTraceLljw2NCpHG0+7L+DMnvcwZAXmTfJPs8XlwwuJY798w==
X-Gm-Gg: ASbGncvOvd7GI/DnbhFVQK7srQUCgcc27eC086XIzgdxWrQ9ip2jdDaAHs6LWoSWuIE
	vEPUP9oW5cQehh/p8xSoAh1BsTqlLePfzlGjfkOtzVWDwFZ1VTFy9h+o/hIil4MqKXkUjUMD4xb
	l7wk0qdx5wl93DydeX82DMI9KS9d9aGY2bRtF00Epo1dOopP48ljt+lqMXrWWjnFGjFks7v4WuP
	IOXRWyJFT9r+avq970t/ZEGB6TXs2e0/JbIRRX1SremmCOcccA0Xg1q6+IKOZR9O9sh2ftWlWKM
	bDaVBy7e9BN5WTojns8EkJm9OJbNXJjHPToixNHI5gyNRzEb+8qgqPY/nwIf8Lrye34aBNs0Xrw
	DNSvWUl5wnUsCYcTqFMkty3r7QZ6jyw==
X-Google-Smtp-Source: AGHT+IFgE3qjO2tjDEVK/UORbEEnIR49PASLuEfuZu2CVLG4W7Angph9Z73enbHK0JgwymLlajCeoA==
X-Received: by 2002:a05:600c:474b:b0:439:4700:9eb3 with SMTP id 5b1f17b1804b1-43bd294bb8amr24943445e9.3.1741186816981;
        Wed, 05 Mar 2025 07:00:16 -0800 (PST)
Message-ID: <86cdf4c1-ab94-4228-bb90-167e9d9ea271@suse.com>
Date: Wed, 5 Mar 2025 16:00:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] x86/HVM: improve CET-IBT pruning of ENDBR
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <748548e8-79e5-4957-be16-c5ea4d202d21@suse.com>
 <29cc2974-a1d8-4123-83b0-b44a3151f900@suse.com>
 <11dc36a1-6b34-4e06-ae6b-4019a024bbd5@citrix.com>
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
In-Reply-To: <11dc36a1-6b34-4e06-ae6b-4019a024bbd5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.03.2025 15:47, Andrew Cooper wrote:
> On 25/02/2025 11:37 am, Jan Beulich wrote:
>> __init{const,data}_cf_clobber can have an effect only for pointers
>> actually populated in the respective tables. While not the case for SVM
>> right now, VMX installs a number of pointers only under certain
>> conditions. Hence the respective functions would have their ENDBR purged
>> only when those conditions are met. Invoke "pruning" functions after
>> having copied the respective tables, for them to install any "missing"
>> pointers.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I don't especially like this, but I can't suggest anything better right
> now, so
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> Originally I had meant to put the SVM and VMX functions in presmp-
>> initcalls, but hvm/{svm,vmx}/built_in.o are linked into hvm/built_in.o
>> before hvm/hvm.o. And I don't think I want to fiddle with link order
>> here.
> 
> Why does the link order matter?

Because hvm_enable() is a pre-SMP initcall, and if the new vendor functions
also were such, they'd need to run later.

Jan

