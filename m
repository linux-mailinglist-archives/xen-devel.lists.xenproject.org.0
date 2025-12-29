Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0916DCE6361
	for <lists+xen-devel@lfdr.de>; Mon, 29 Dec 2025 09:14:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193911.1512408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1va8N0-0002YN-DS; Mon, 29 Dec 2025 08:12:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193911.1512408; Mon, 29 Dec 2025 08:12:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1va8N0-0002Vo-9F; Mon, 29 Dec 2025 08:12:50 +0000
Received: by outflank-mailman (input) for mailman id 1193911;
 Mon, 29 Dec 2025 08:12:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PeLl=7D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1va8My-0002Vi-8r
 for xen-devel@lists.xenproject.org; Mon, 29 Dec 2025 08:12:48 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2484b588-e48e-11f0-9ccf-f158ae23cfc8;
 Mon, 29 Dec 2025 09:12:40 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47795f6f5c0so47095585e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Dec 2025 00:12:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3aea77bsm225400525e9.17.2025.12.29.00.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 00:12:38 -0800 (PST)
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
X-Inumbo-ID: 2484b588-e48e-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766995959; x=1767600759; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2N8yK39D9Qijs0V1Nkp7KCjwUA5tvQwd1AFnlJM64B8=;
        b=GyJ+s2AhUqvYrvEpXYR+FHYQnAPmaTNp8k7u1FY9iu10gDyNGpUU67Cyi71Xfny8Xj
         s8/Wl7o2wi+LX6/IkQFDrrIO9qQlBre9sxWgoEY0ZOaQHfRzjhTvvVM9tvBYXisLJNBi
         71t5YP+cxlh1QXiJKaRR0zdurEOpwOsraO3lTonCnOYxpnzymRPBzOoVHsx+axhiwGYj
         SddC3gbRmLRx0B2dakV4MJjLpUnSqHkr+HIlMrYXCYkuSFH53N7OaZ52/8jsOSxhGmTx
         c/71KPCXiGPn1HCc7hWLAvLG0wl0wLPLli9iaRWpZi7ZS9SEW5bkYJtxck/69iIA86Vb
         jsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766995959; x=1767600759;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2N8yK39D9Qijs0V1Nkp7KCjwUA5tvQwd1AFnlJM64B8=;
        b=q9gg34Niz48oIe5CgAKIveqizKhPA+Bhv8za+2juUqdZaF9FGAM+DhaPwU49Jqn5E0
         zXS7P5xNOUhXVGIfiUaOBFasCFbAqa/Eoqf08ilN+CuCutpCxe1/SoDJVSBrNquz/lP6
         qsjN9xMz2k5F4bA00Sb/3uHUky1CIuU6Px7nZP0Zcc+R01y40uCHKwyK3iL5OJLB1Dom
         6VTj0ujeY5hWX0nZhOaYie2xbTDLzC/JOvrncHPNKMW4nN58uAe651SQqJsTsDTDxaIE
         hS3VcXLgsCN+FVkC6o+Avz6FN4tMPpsgLEB/zHCp4Lu/cOaZqQ+0v2LGt4fL2gy9XzY7
         XPqg==
X-Forwarded-Encrypted: i=1; AJvYcCVp06XH89DF6mTzBiCBdfRXxZY//kYXTYPbHpMhkj7QQauxv4N9KulbNSeo7O8wF8Aq6yg9JcvmzSQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0bLnUYleg1raNNxO42itF33YYnOTrjjCncWHZghyHALoawLOO
	L1riVazHW2JbJY7zrB4uE14cZpvqEZOZf6M2iE5O0012fa9v4L7a4dhbhPX/iTNpsg==
X-Gm-Gg: AY/fxX4/PEAsmzblXk62SXXxbE3Bi7DZhXhKOxhOgARtY6xHxpcWJ0B9BkxW/JS8twd
	LjMC6kAL++yrNzNT0gZS5d2Qx+sOPLDTP/DDhp0MndZev26rEtf+479yITWeYd5l3gIdqILItHn
	63dmWAeGG5o+2K2f5EnpeerzILXNme90fCjlomX03aqkPlgfiCxPKvx8jqcB/0XhA0xJk+Bg9ro
	brN+kV/XHGYhdkO3UDgS7ydA4915dwGeF3QEMMus73X4LIFj4xtDAYt8x71H7HhonqLw5rY6UAD
	g9qcStpBZzE0/urYjfcsmeM6OWWtDm7sM4w94Kd7yLdK8FosREtNCaFN4Merj2ws+KZixALMsCc
	rHhoWkiN+W99msdeDoLDdgkf8amgkhlN+ISewdZTQiGasUciG11PnLs9r2+cgj4R8H9oTAO5ztb
	oHjEupEMi5LU+uY+uicLQGs3WJg9ZVuMxVEovxeenwmPHgtxrcQUuwWWMJDiigCZnnzrijocYeg
	T4=
X-Google-Smtp-Source: AGHT+IHTOBPaCd3i6HRzzNq5KWYv2pSkCSIs3T1YWzxq9s0DfldE4F8cvQzz36nZOzwHIhR3GzVOSQ==
X-Received: by 2002:a05:600c:1d1d:b0:477:8ba7:fe0a with SMTP id 5b1f17b1804b1-47d1957da90mr334813035e9.24.1766995959260;
        Mon, 29 Dec 2025 00:12:39 -0800 (PST)
Message-ID: <221c0357-833e-4dec-b265-ac15a1932281@suse.com>
Date: Mon, 29 Dec 2025 09:12:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/mm: move adjustment of claimed pages counters on
 allocation
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251223081507.29325-1-roger.pau@citrix.com>
 <754a5e55-828d-4b3f-85cd-574760ddc69b@suse.com> <aUrXiaWnyM-eTJg2@Mac.lan>
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
In-Reply-To: <aUrXiaWnyM-eTJg2@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.12.2025 18:55, Roger Pau Monné wrote:
> On Tue, Dec 23, 2025 at 11:59:54AM +0100, Jan Beulich wrote:
>> On 23.12.2025 09:15, Roger Pau Monne wrote:
>>> The current logic splits the update of the amount of available memory in
>>> the system (total_avail_pages) and pending claims into two separately
>>> locked regions.  This leads to a window between counters adjustments where
>>> the result of total_avail_pages - outstanding_claims doesn't reflect the
>>> real amount of free memory available, and can return a negative value due
>>> to total_avail_pages having been updated ahead of outstanding_claims.
>>>
>>> Fix by adjusting outstanding_claims and d->outstanding_pages in the same
>>> place where total_avail_pages is updated.  This can possibly lead to the
>>> pages failing to be assigned to the domain later, after they have already
>>> been subtracted from the claimed amount.  Ultimately this would result in a
>>> domain losing part of it's claim, but that's better than the current skew
>>> between total_avail_pages and outstanding_claims.
>>
>> For the system as a whole - yes. For just the domain rather not. It may be
>> a little cumbersome, but can't we restore the claim from the error path
>> after failed assignment? (In fact the need to (optionally) pass a domain
>> into free_heap_pages() would improve symmetry with alloc_heap_pages().)
> 
> Passing a domain parameter to free_heap_pages() is not that much of an
> issue.  The problem with restoring the claim value on failure to
> assign is the corner cases.  For example consider an allocation that
> depletes the existing claim, allocating more than what was left to be
> claimed.  Restoring the previous claim value on failure to assign to
> the domain would be tricky.  It would require returning the consumed
> claim from alloc_heap_pages(), so that alloc_domheap_pages() could
> restore it on failure to assign.
> 
> However, I was looking at the possible failure causes of
> assign_pages() and I'm not sure there's much point in attempting to
> restore the claimed amount.  Current cases where assign_pages() will
> fail:
> 
>  - Domain is dying: keeping the claim is irrelevant, the domain is
>    dying anyway.
> 
>  - tot_pages > max_pages: inconsistent domain state, and a claim
>    should never be bigger than max_pages.
> 
>  - tot_pages + alloc > max_pages: only possible if alloc is using
>    claim pages plus unclaimed ones, as the claim cannot be bigger than
>    max_pages.  Such alloc is doomed to fail anyway, and would point at
>    the claim value being incorrectly set.
> 
>  - tot_pages + alloc < alloc: overflow of tot_pages, should never
>    happen with claimed pages as tot_pages <= max_pages, and claim <=
>    max_pages.
> 
> However that only covers current code in assign_pages(), there's no
> guarantee that future code might introduce new failure cases.
> 
> Having said all that, I have a prototype that restores the claimed
> amount that I could send to the list.  It involves adding two extra
> parameters to free_heap_pages(): the domain and the claim amount to
> restore.  It's not super-nice, but I was expecting it to be worse.

With the justification above I'd be okay with the claim not being
restored upon failure; the extra logic could then be added if and when
an error case appears which would make it desirable to restore the
claim.

Jan

