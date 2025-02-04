Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA99DA26C82
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 08:15:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881091.1291209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfD8R-0000w8-M5; Tue, 04 Feb 2025 07:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881091.1291209; Tue, 04 Feb 2025 07:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfD8R-0000tN-Ic; Tue, 04 Feb 2025 07:14:15 +0000
Received: by outflank-mailman (input) for mailman id 881091;
 Tue, 04 Feb 2025 07:14:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfD8P-0000tH-CV
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 07:14:13 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1ccd7fd-e2c7-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 08:14:11 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aaec111762bso535283966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 23:14:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab706ce9a53sm615955766b.72.2025.02.03.23.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 23:14:10 -0800 (PST)
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
X-Inumbo-ID: a1ccd7fd-e2c7-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738653251; x=1739258051; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pK9a+ymbmfw2qzP3ZfojBmmVQFUbNe44/GkLdTlPtRg=;
        b=X3Jiwhq/ZRmvesmZw/KZRvW4fNZfYrqCfUqyceNo34VMhzkKaKqw1cstKUE3+I3Era
         Y5l/TEiSs1FIX1sXopFD3/0GSfkoMpKACuePvoseEVfh8eF7lZwXWEb7f4pAJw7G6wcR
         klCCNlG9Kis9ip6B/faosY6/ajDNE3r3V422b/J2jp5L9hlbngqhkFVs2LIAActNOks/
         2dqnIDgbbVFI5aPHn4X0JDCGtQGxZqfEN2FvTUJdYfrF/Q7iydcxfPwvoRY3Xsg41VCa
         0JMCZY7pcfZOrKUdRGpoS2TiO8lIuB7AwybXIbmoJUWll4a5cq0s2tW/FtZ2gwlGS6Zn
         XylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738653251; x=1739258051;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pK9a+ymbmfw2qzP3ZfojBmmVQFUbNe44/GkLdTlPtRg=;
        b=VW2RXpSf0EbJYADy2c7hY15plg90t1JKkMdENuyDABH/MNf2LldPevAtQJX2T4BFq+
         dlcz04P3otRIOtPhIauXkWI7xRYPZBMHyEzA8BetDom6cb254MGS/18pVlLhs5Rkq8s5
         yOojjWpv0HV90cGZ7g/CtWZ2gG3PorvwFWu70OTg2o8Gp7zvny8Y/XglSeQgOmMCojCx
         3v50rlAJYvQh5wEx5CKf8BWgEZEq1NTwflXBOx/Dmzsouzmh2g5OtV3QbVR+RoC6QSuJ
         v0Q91yM7QEwiovbx7pKQfkADrk9yTubnOkx836ehbmzl+/3vpdBTgaNE1rKICD0LjTYS
         nFgw==
X-Forwarded-Encrypted: i=1; AJvYcCU0iNwjCvX22Np4v5Dfr3TNTEgRiAIZV2jaWBJEREIGQlZCleIBp+v9BLCxF/SMDy094srCOaovFe0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLfcI2blXcEXVINK3tb9091Kzj5l1m+06CRuXa1TJbUT2xz3so
	FwzrUOYxeXVNh7tODeg7GfNn9EkyWyMislHj4p9cDy76vmYgI7XWvBwArosTMQ==
X-Gm-Gg: ASbGncs8JzxAxFZ91cDgQ11fT21SHHFlCaSELcoeIexdsR499MLrWtFrhyUEdWJkb15
	h+KOJrpjU8FHGlWFKvxFiZVatIuWEoJjdSZaMFWHMUPi/D4dAPx37BzYHK3RFhG7x+n1ILdpmoS
	ghDF/3ftfwGBUIBX0DotpUyjhStGjE7/n5Sn905ErB+o7v8ejuBpDRGQ+VOgtZVezlC6UGW0ikb
	SB6JAsKZa+mVzYh17vwoEzrw6OwBs0xk4AuvFFwEzIFjxqZbquyGGpxBWu2ODaxPHsYRfSh8i83
	qNK9ouqYlwJFCGrgg7c2ipIfcujORuZo3/hwEdteW6yCAaWcPDQtDirmKAY5x2XRzITYITuiodc
	r
X-Google-Smtp-Source: AGHT+IFTmOTGedUJX6bvLB699vsEvT8rTj8IYJrgtzA6z02xflbmdJ4lYWXDwuKcLIgnmS9KKVDDew==
X-Received: by 2002:a17:907:94cb:b0:aae:fb7c:50df with SMTP id a640c23a62f3a-ab6cfdbc4c8mr2862185766b.36.1738653250850;
        Mon, 03 Feb 2025 23:14:10 -0800 (PST)
Message-ID: <f044c38b-c8c4-4117-a216-dbdb95d46c50@suse.com>
Date: Tue, 4 Feb 2025 08:14:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 0/6] AMD/IOMMU: assorted corrections
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
 <3a049628-8693-4fe5-81a1-1961b1402e50@gmail.com>
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
In-Reply-To: <3a049628-8693-4fe5-81a1-1961b1402e50@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.02.2025 17:38, Oleksii Kurochko wrote:
> 
> On 2/3/25 5:22 PM, Jan Beulich wrote:
>> The first two patches are functionally independent, and they're presented
>> here merely in the order I came to notice the respective issues. At least
>> patch 2 wants seriously considering for 4.20.
>>
>> While alternatives were considered for patch 2, it's left as it was in v1
>> for now. The disposition there depends on (a) the four new patches, in
>> particular what the last patch does and (b) backporting considerations
>> (we probably don't want to backport any of the radix tree tidying).
>>
>> 1: AMD/IOMMU: drop stray MSI enabling
>> 2: x86/PCI: init segments earlier
> 
> R-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com> for first two patches.
> 
> For others it seems like nothing serious will happen if to merge them after 4.20.

It took me some time to actually take two and two together, but: With the
observation underlying patch 6, patch 2 can actually be dropped altogether,
with what is now patch 5 taking the role of the bug fix. That'll make what
is now patch 3 a strict prereq then, though. I'll cut a shrunk down v3.

Jan

