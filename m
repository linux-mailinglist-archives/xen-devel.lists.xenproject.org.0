Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D673CB9FB84
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 15:56:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130585.1470084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1mSV-0000vR-Kr; Thu, 25 Sep 2025 13:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130585.1470084; Thu, 25 Sep 2025 13:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1mSV-0000sV-He; Thu, 25 Sep 2025 13:56:31 +0000
Received: by outflank-mailman (input) for mailman id 1130585;
 Thu, 25 Sep 2025 13:56:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1mSU-0000sP-Pa
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 13:56:30 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fb7abc4-9a17-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 15:56:29 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b0787fdb137so168341366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 06:56:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353e5d0526sm170866866b.12.2025.09.25.06.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 06:56:29 -0700 (PDT)
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
X-Inumbo-ID: 6fb7abc4-9a17-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758808589; x=1759413389; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f6aYRcOSIqmRMg8VMGaixy+OhIDN0i7t3lVN3bkr+eg=;
        b=eITo8+0pE/pp93GP+8bsyw0sK/EPCmTu+0f6/nxMlXdEFxU5QwVwwa6LEKRBena6ic
         s8s6eaYzQidTAkuzVcPBip960INN7VpUgnzo4Q1UN+pSmt0mOU1ExcHC7aMy8CpeA/v2
         WNIazcyeCVy2dGeEZK8okx8pxHVYrmHRVCX6Zm3uZOIWMmsT+7Grwsb9Uy4fdRJI6Jgg
         SerTPmbwbpx4EW2Zr77Wbd0IYvh3k6YGYmRfLPeFoc/v97LtNUvb17YfGkE9eV+RFK2m
         G+t52O63/4A0rPHOvFnwgVGnpMi+V8zSTYtiFK9j/kHWR5SpyjH06xFobjDUCeu3NnAc
         yu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758808589; x=1759413389;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6aYRcOSIqmRMg8VMGaixy+OhIDN0i7t3lVN3bkr+eg=;
        b=rylNUZYOiXfWS6ei5paQbw+H2+rX3V+IvHpRx/tyG+oId+Qjs/0b2VZNkzYMgsRpTu
         TyFhHxzoF2D7+DjMBX06Eg3oLSCrBUYdPyEkknXlr55oE3EyMHERVi8lfqy9aAeaIpk4
         XZfOXB3oXGahJ0/BJq9mPyeA8BD9EZuMHP/pUWIWTUB2/zCsXKhkcoKUjELTCtTdNNlo
         r5XOulrlwfhWoprgKc6Ab6FpKAwVw5J7OsIJqaVE9PM9EEQso4+auba3AucjGXAIhIpq
         lIPjK2vds4RG0yhSBholTgTRGVsJlQXN2ebvw4ejs2tzJ4cHlebBULPCUMNuRhpH/2OA
         PUVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6jA6IQxPeYUuln+inhwz/Hy0vmx7SCpfwulXiCzajBJQ/anl6bhKuyev/JxM8av8XppHQtSc5Fd0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtqriSEYJLFIPG1N3+PoQySj7q10N+P+p0hSig4z+sx3ezGhW/
	UFwKsxlqkt75yzGwBbA/aaz7pypB0IItIXdK/aQXccH+AeWXWR73136/yZxZDnqB9w==
X-Gm-Gg: ASbGncvCFtrsznHq1FWS3V2BI/wons/jQEEkcKDGUQymgwiKcKCsVXmBs5n1WTuNcbv
	3uAZ37fpct0AVQIJJhwt9BKgZQ1aVC7AA4KFV0ktWqzg47wsxzvhqnslped7TVfSUq5Xbt/rfP2
	QYFAHfVeRmCXPDyHLg5kmQtIWN/h7FWxh2a5GWwV+stBYOrg0yFCZC6Q306DkMm/jMPMRZF2VNW
	WfraIS1rM58Jo8iBQ/lQpTSo6htexuuwPOOasOr7Z1enAGFTo8CXk7eLfbxZSGayPDZE8e5Gr+U
	cC/tTOUBN4YQtExzZ80R7i9aSHX3ZtO5zEBDI4+GOqp348ghZKJkWazflrS8FZmBfNIF3/SjSYi
	0KoCpq9jhm3F7A9IYHTJy9NqCLf8q53IIl6XNKSVSUmxw2uehaKeEF4xF8B8BFLHFrE9ByK4uJ9
	lquwhb88c=
X-Google-Smtp-Source: AGHT+IGj6q/wE9SglkIVr9Qo5J4sdy/s3P8+MpRrfv9Znz6HRgo0Md7b6bepGBcafIVvyPpcEhZM9Q==
X-Received: by 2002:a17:906:24cd:b0:b35:6d55:9c10 with SMTP id a640c23a62f3a-b356d55a3bemr249580366b.50.1758808589310;
        Thu, 25 Sep 2025 06:56:29 -0700 (PDT)
Message-ID: <68048d73-b29d-4ef7-982d-bf0c2a179ed6@suse.com>
Date: Thu, 25 Sep 2025 15:56:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/18] xen/riscv: add root page table allocation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <2b636ea03bf82cae50df87d525e3f58b68f16cb2.1758145428.git.oleksii.kurochko@gmail.com>
 <eda37f82-5381-4900-aa75-3f4bfbc01440@suse.com>
 <31a0e82c-6855-41d3-ad9c-282261012656@gmail.com>
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
In-Reply-To: <31a0e82c-6855-41d3-ad9c-282261012656@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.09.2025 17:40, Oleksii Kurochko wrote:
> 
> On 9/20/25 12:14 AM, Jan Beulich wrote:
>> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>>
>>> +{
>>> +    return MASK_INSR(mfn_x(page_to_mfn(p2m->root)), HGATP_PPN) |
>>> +           MASK_INSR(gstage_mode, HGATP_MODE_MASK) |
>>> +           MASK_INSR(vmid, HGATP_VMID_MASK);
>>> +}
>>> +
>>> +static int p2m_alloc_root_table(struct p2m_domain *p2m)
>>> +{
>>> +    struct domain *d = p2m->domain;
>>> +    struct page_info *page;
>>> +    int rc;
>>> +
>>> +    /*
>>> +     * Return back P2M_ROOT_PAGES to assure the root table memory is also
>>> +     * accounted against the P2M pool of the domain.
>>> +     */
>>> +    if ( (rc = paging_ret_pages_to_domheap(d, P2M_ROOT_PAGES)) )
>>> +        return rc;
>> I read the "ret" in the name as "return" here. However, ...
>>
>>> +    /*
>>> +     * As mentioned in the Priviliged Architecture Spec (version 20240411)
>>> +     * in Section 18.5.1, for the paged virtual-memory schemes  (Sv32x4,
>>> +     * Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB and must
>>> +     * be aligned to a 16-KiB boundary.
>>> +     */
>>> +    page = alloc_domheap_pages(d, P2M_ROOT_ORDER, MEMF_no_owner);
>>> +    if ( !page )
>>> +    {
>>> +        /*
>>> +         * If allocation of root table pages fails, the pages acquired above
>>> +         * must be returned to the freelist to maintain proper freelist
>>> +         * balance.
>>> +         */
>>> +        paging_ret_pages_to_freelist(d, P2M_ROOT_PAGES);
>> ... "return" doesn't make sense here, so I wonder what the "ret" here means.
> 
> In both cases,|ret| was supposed to mean/"return"/, since in both cases we
> “return” memory.
> I agree that in the case of|paging_ret_pages_to_freelist()|, the flow is
> slightly different: a page is allocated from the domheap and then added back
> to the freelist. That looks more like/adding/ than/returning/. Still, I felt that
> “return” could also apply here, as the page is being given back.
> 
> For more clarity, do you think it would make sense to rename
> |paging_ret_pages_to_freelist()| to|paging_add_page_to_freelist()|?

In place of "add" I'd perhaps use "refill" and then really refill_from_domheap
to properly indicate the opposite of ret_to_domheap. (For both of these: If
already you want to use such long-ish names.)

Jan

