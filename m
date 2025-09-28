Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A75B1BA7193
	for <lists+xen-devel@lfdr.de>; Sun, 28 Sep 2025 16:31:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132371.1470730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2sQi-0005Kb-2C; Sun, 28 Sep 2025 14:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132371.1470730; Sun, 28 Sep 2025 14:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2sQh-0005Il-Ve; Sun, 28 Sep 2025 14:31:11 +0000
Received: by outflank-mailman (input) for mailman id 1132371;
 Sun, 28 Sep 2025 14:31:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wVCj=4H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v2sQg-0005If-7m
 for xen-devel@lists.xenproject.org; Sun, 28 Sep 2025 14:31:10 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c205498b-9c77-11f0-9809-7dc792cee155;
 Sun, 28 Sep 2025 16:31:02 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso2071427f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 28 Sep 2025 07:31:02 -0700 (PDT)
Received: from ?IPV6:2003:ca:b74b:a88a:551d:1421:7d53:a1cf?
 (p200300cab74ba88a551d14217d53a1cf.dip0.t-ipconnect.de.
 [2003:ca:b74b:a88a:551d:1421:7d53:a1cf])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc88b0779sm14367637f8f.58.2025.09.28.07.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Sep 2025 07:31:01 -0700 (PDT)
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
X-Inumbo-ID: c205498b-9c77-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759069861; x=1759674661; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VYYl4Br8wFeYkCegbu2IFucoAuyBQThZBfj3f4nGCcU=;
        b=XPoEL1RKg4hTIhTqWeOWZJRpRs5qMPAZ1W8axOeA84O8oQicC9z0VWx8c8FmAYPuSe
         yRbkuX6eISSWryoPHXfmaPssPQo7zSM7x3137kVFek3TaFN4SOMUaqOM+0SF0kzOTm5f
         q0R6lgisQEfmtwd4yer5UZh9ZaDlLKbQ8VPnnnbrFCroT79p6Lq0ldcQ6YMyjFSshBPd
         CNf/SDq11LXseqi7q8OqPpK6W4l6KE2b9TZxpDc+uA1BckE8snRUBjscqf43Sx50vfa2
         SI23bEjG7tq2tjHcOXNQx76dA88WCbdFocnAGW3vs6gUP5V6oiu4TJWdLhk1RQVsDel3
         CMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759069861; x=1759674661;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYYl4Br8wFeYkCegbu2IFucoAuyBQThZBfj3f4nGCcU=;
        b=PTJnhYCs4ErbDFYeu1qypEN0r6SBbvmDLtCpK6soQZXz3UC4SMtJlc5hs4fnyhGwmu
         qqidbOIIxPLYG3VZXsOnmUwsspHcWNrBvUy2jwtmG6RIvTja3e9gYikkjBhQV6xBLstp
         56jQhE9PMS0gfFHiWk8g8g/ZZTt5kSc2QOx7l9kll+Sdyz4Ni7OUaRC8M2hSKIbR3u3F
         ci3STBEaDcCFXCPu1IwiLpNVYb3U+ehfgSaK/UBS1qvH1/WqwNnpNVnm4SpuRv5Ke8LF
         B+aLQDYDlp9xu6iae+PChsdt6GYduXhl6/L80z7CrLIl9bu2bcVvSQHR3tr+vGHJGdri
         ZFsg==
X-Forwarded-Encrypted: i=1; AJvYcCUOZsgtrIZHttufkDCIFjUtYZ4zUUn/nLhM1lKV5eE5jsNK9CIckXEwUyHu25XKg2rkAoZk6KobjOA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxd7ghN9HAvQ62PVbUArhMr3fwCftnqb5SdlX3W5yScwcjKPojB
	NymVh19NOC0sVDP4LiSp/Y4JzVMnO/ALavxRftcB7bXFuZqVsfQRrgFTpgdEZwx3WQ==
X-Gm-Gg: ASbGnctP7yUlIVkV6BdqBvKOJOzOa85u19H+ElcDRoJeEjNUl7R7VTIMehP1fjDGM2M
	d4kyUkICYJucYAhu/zYvQ1XHEkuft2QKdm4DXMWekpzh0HkPJu9xZqNNc/FsUDPQVMM/+QtCo9c
	AUbqHER2Wddgw+zi+qSwpH8N3Z8ZjPXrZgI+tJJ1zbQLt8otzfPxmUkLwPlDhYGS6tECzzWoPLH
	4oOfPghWmML3uabGx8eH4nEdobZKAemp3NYhLVKhCLiBW4iEr19cnxC3DX+YnWzFmuUfq0vfw17
	J6kR+yadZBMQ70AmZn2DSy5PNB1dRyeiMH6PfpnuIi+bxNlSQAbd4eZYdv2TjMWQ58D+RMQNOC7
	N7yZTlfpdfWW6DDMN5q4HdRPsMZWGtRwKv7ImDjdHqrUjG0rS8h7fCU7ZybXgag3WNw+2HnS47a
	kimUZh/o+xN30/f321qX7nXmavloKmkoyNHwiTS8KDm8v14/G1Axy63aN95Pi1DLPzEYn14E0gq
	jXOBw==
X-Google-Smtp-Source: AGHT+IHg+kzMpMih8hreeb+1rUOQsoqBLbuH/1Ja1pY/EyluJ1OAu0sRDtb18qRWd6lMtiRd2vkAHg==
X-Received: by 2002:a05:6000:2486:b0:3ea:6680:8f97 with SMTP id ffacd0b85a97d-40e42502e25mr12143207f8f.2.1759069861360;
        Sun, 28 Sep 2025 07:31:01 -0700 (PDT)
Message-ID: <97f1d786-b87b-4df0-b514-e40522656a94@suse.com>
Date: Sun, 28 Sep 2025 16:30:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/18] xen/riscv: Implement p2m_free_subtree() and
 related helpers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <18ed5517721254a56e992d9cd9bc1a64672eda8a.1758145428.git.oleksii.kurochko@gmail.com>
 <de20c915-e05f-48a7-a2fd-51b4befca525@suse.com>
 <b31b5905-f022-4478-8742-f91b74474168@gmail.com>
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
In-Reply-To: <b31b5905-f022-4478-8742-f91b74474168@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.09.2025 17:33, Oleksii Kurochko wrote:
> On 9/20/25 1:57 AM, Jan Beulich wrote:
>> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>>> +/* Put any references on the page referenced by pte. */
>>> +static void p2m_put_page(const pte_t pte, unsigned int level, p2m_type_t p2mt)
>>> +{
>>> +    mfn_t mfn = pte_get_mfn(pte);
>>> +
>>> +    ASSERT(pte_is_valid(pte));
>>> +
>>> +    /*
>>> +     * TODO: Currently we don't handle level 2 super-page, Xen is not
>>> +     * preemptible and therefore some work is needed to handle such
>>> +     * superpages, for which at some point Xen might end up freeing memory
>>> +     * and therefore for such a big mapping it could end up in a very long
>>> +     * operation.
>>> +     */
>>> +    switch ( level )
>>> +    {
>>> +    case 1:
>>> +        return p2m_put_2m_superpage(mfn, p2mt);
>>> +
>>> +    case 0:
>>> +        return p2m_put_4k_page(mfn, p2mt);
>>> +
>>> +    default:
>>> +        assert_failed("Unsupported level");
>> I don't think assert_failed() is supposed to be used directly. What's
>> wrong with using ASSERT_UNREACHABLE() here?
> 
> Nothing, I just wanted to have some custom massage. I am okay with
> ASSERT_UNREACHABLE(), anyway it will print where ASSERT occurred.

Just fyi, the (kind of) "canonical" way of having a custom message emitted
from an assertion is ASSERT(!"<message text>").

Jan

