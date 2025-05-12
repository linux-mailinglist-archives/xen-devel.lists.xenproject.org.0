Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEADDAB3670
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 13:59:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981344.1367739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uERob-0000EZ-Ur; Mon, 12 May 2025 11:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981344.1367739; Mon, 12 May 2025 11:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uERob-0000Cr-RX; Mon, 12 May 2025 11:59:25 +0000
Received: by outflank-mailman (input) for mailman id 981344;
 Mon, 12 May 2025 11:59:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uERoa-00085B-EJ
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 11:59:24 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b1a1314-2f28-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 13:59:22 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5feb22e7d84so1130989a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 04:59:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd37dsm605046466b.124.2025.05.12.04.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 04:59:22 -0700 (PDT)
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
X-Inumbo-ID: 8b1a1314-2f28-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747051162; x=1747655962; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FK4JcS+fIT6eo9UjGYSqne0KLmiGSIGmFIR8W4uh718=;
        b=g/ImPGHuTl1/vF8zKjUpMA10howREAk+3b22KV/p2nYMdZDcFQsh0Pq/ba38RtmKug
         3KXc5QA4AKcHToH2I1+LNJWobU4ZAqCxaP6/3ZczCeZK4961XnhIEuOjZfLNDlFk1HPk
         Wb0+K0SxXqIOOYD2jKbPQOCTKSwCww6AwpmIuEC/B0RkcxZe0LD2iH2rC235pCD7nPTz
         L1tc9YVdXkBVcXj8SvZFBkFnGq8R5njLX55eqGrMoSpXPjjLbtMhZpAhxXrow/7BIOhK
         gY1Z0Yxj5BkKj5KNUwr6fhBxKAjdUjcZiXJ/4id6OsPF/36OOA+hfORcL1Q39mQAueST
         d0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051162; x=1747655962;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FK4JcS+fIT6eo9UjGYSqne0KLmiGSIGmFIR8W4uh718=;
        b=ViAgkUZW1ILrglg9eP/o1RghZgLYHe+ak1sTUrgyptDh2wbD/uwLyn1zurS1rzjXFQ
         kOGlpLYJMoVokbeLTDGXHEzewGisbODQW1HSpL3L3dcY+ceiuRVkCtaeQnCpCrvq+ETw
         +PsHLRYpQuhalG8KC0ZdaG346ANEoD5+WQ0DtAOvN/AVmtTKpXqkvfiztoVg5SLYb4lC
         Lt6f16zyXHlOLojyGr9j3fiUtgWGrrsJe7h7gFaLLYqAFA7GjTUFI2i0sVYFJ8lfUXnS
         oRJ+aeLUVMhsJpnm6X92fBjh3R4GOYEf0gCKq4dA2DgU1CdrFhQcWoEMzMDE6RR/oTOl
         yiBQ==
X-Gm-Message-State: AOJu0YzerokB0J4f3yFempcXEj1lNsDyLldpi60AgU+k33I0fs/A56mW
	SbqxcrRT6YVBML0BLkGMu6jHJOmhCwBbeD8/sGXm3wfNVKZ8PyYK9OMn3Hq/ew==
X-Gm-Gg: ASbGnctbT5U01VCf0OfMlXmrayqYRX4HjEAj3Ce0RHQIH8naJ7HAN9QgJdsOD0eWy0g
	dBsV5lh5IOMtftnJEjS6zSO8+YrBtUeMpd903/K1otOGM7dh+odiSq45zWO7vE2SUTeXpv1y2ec
	JA5R03Q9tllZB9Ja0vcK1kO+YfvVUQ1VEY9IsUu9kmJ2v+5Wxzu5Q7iqf/q5051StVMeBn1PAi3
	dntepBBikLipHqUmmjWkPjhKKnCJSToaOiUIsKvawRTNxXpjvwqCDC6gfOP/NI9vHIXO8/EBXTY
	Q0ZdrpbN4qD3OfzTG7psavIKvPo28Q/+FTYKUU0/9K6PyiGVSemcxJrpv1eBEDmsPqtFyadT9l/
	kWmbYDBM7HBrqnHGu4ygSJTRR1KjfwudGaNVT
X-Google-Smtp-Source: AGHT+IGwalL61JL/0IxRUygjg7Vg6IAxjh135BvpRdE7WCIspYr32t/XiHlIFkAQpdHsAbU40YDevg==
X-Received: by 2002:a17:907:6a13:b0:ace:c518:1327 with SMTP id a640c23a62f3a-ad218f1b830mr1244603466b.14.1747051162265;
        Mon, 12 May 2025 04:59:22 -0700 (PDT)
Message-ID: <548430a5-fa4a-41d1-b5ba-ba45efa90bbc@suse.com>
Date: Mon, 12 May 2025 13:59:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Use __auto_type
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250505124646.1569767-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2505051244090.3879245@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2505051244090.3879245@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.05.2025 21:44, Stefano Stabellini wrote:
> On Mon, 5 May 2025, Andrew Cooper wrote:
>> In macros it is common to declare local variables using typeof(param) in order
>> to ensure that side effects are only evaluated once.  A consequence of this is
>> double textural expansion of the parameter, which can get out of hand very
>> quickly with nested macros.
>>
>> A GCC extension, __auto_type, is now avaialble in the new toolchain baseline
>> and avoids the double textural expansion.
> 
> I think this is a good change

+1

Jan


