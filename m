Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2BACACE99
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 11:48:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180364.1503555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSYmh-00035f-H9; Mon, 08 Dec 2025 10:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180364.1503555; Mon, 08 Dec 2025 10:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSYmh-00033M-EF; Mon, 08 Dec 2025 10:48:03 +0000
Received: by outflank-mailman (input) for mailman id 1180364;
 Mon, 08 Dec 2025 10:48:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSYmg-00033G-3M
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 10:48:02 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d6c337e-d423-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 11:48:00 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso21081365e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 02:48:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479311ed466sm231377715e9.13.2025.12.08.02.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 02:47:59 -0800 (PST)
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
X-Inumbo-ID: 5d6c337e-d423-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765190880; x=1765795680; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zS8/YRHbnpFNSbETJAVu5IY7UtYdPcfV1xAQYKoim54=;
        b=O6iNC1tYe349IxGHBd+FOtsYPmTmEHWw18u6YoE/dNll3g4xfOCYhbYN8bstXv4IbU
         yPNiR54A4qapGJ6qnkMCPPgQ7yKfcRBzHK38QIF8fZByO3z6/CoHoLK4SjAuQTKSf/po
         I2Fz2sBDMgcbYAgcRdvgBPyQaV0m3R9NJMPs4CBo32p4XjalF8fdouknn9k3iB+2SHmM
         b4uG/aGWSXfCJIRukfwNVqPiGxwNIptDyv0tpEEjnBIQcEXPLiM8IS07f/UQ6Fq8ZHQJ
         oY8ggh0PeXaA1koTzyFW46y15j4djxLx5KMcCaxGtwS/ZATe5bHsHuDyXQGLJG9MiSA5
         DV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765190880; x=1765795680;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zS8/YRHbnpFNSbETJAVu5IY7UtYdPcfV1xAQYKoim54=;
        b=Q8j67WxAfICTW5lZjaShMocbkDvKDOPPN+0r+u2dCdWaQ8N+CUl+SgMApm7v2LAEi5
         ADiB8C+L+oCCMrecDrtCIx1+9yr0jn2hc6wBPex7Iyv79pAhr10GvdCdN7uq7i0Nn9CL
         9lUBg5IllNqHYwWWL4z13Thz8Wq1smEBxDF5bIniKInGkuqSS/OdCsOL/mHlhP6IJN9N
         bkyFErX2nt/VxS1Lgzvpuqlxrh3nQZ6/Xpth2+rdhGG5SgFkgC19M1jWPF33v5PxF3Vc
         DEt02HAJI7qjHv7rhcs0eNGm012as7Z5qITWSbuRdm7mj/gxe0t8v8bT/h2gwsCMeMCA
         IU7A==
X-Gm-Message-State: AOJu0YwUVbodIFNy4847O9fI75yKuYj58xscqn2+elTS/2d3UOozDIfi
	rEBgGgfboHWWgjOsfVUQzikcOsnWfQak4uAAr2Jqm5iiOwkG3lXJHaSnOa/zUbNI+g==
X-Gm-Gg: ASbGncsFeBOzJ07WP/oJJVtpQTtvxfjPePixUYgPPrKYf1InENV69Z3ogr2XXOJ8j1B
	VAzfY5MxpfOe9z5N1O5Y+561c4PZm+sHc/4s5kKMy/2ANCRvTrFtTmrjKgVc/LqOQn4aW1EmCYx
	fg15uNsqfnj8FXXnzjF4A1sD5uIwJNasvibnyB734C5auwUcvq4pMfKDFh2KBjuQuvnc1vPc/Wr
	/PxiImJ4FqQcHtM/I4HA+ILSYeIAs9BIUjXS6sDTK0Xk46rmiMC0CuQf4Cw1flS8UblxNpdAeo5
	3zVQNmUOZfTSXe+iIp8B+Li6ECjK01s+1NuSPL0AV3YTdIAon0wrzzc27txKzsD08xznzcXc74G
	mDWWT8nQaCDs+dxZpHNxC+1Fm3lx+WNwRUWK55Kg7QggnFt75r+p0aVz1pju92QmCaDMcdQZruy
	o9WeOi0iyjGILWE1oqw8Q3F2R6pa8yDqhF+VPU9y5184KcmHOg87kSYntGLLROycTUh+s0xKodt
	FxxOMsa7bwNNw==
X-Google-Smtp-Source: AGHT+IEHmqMm/7HyPW8ibwhUnCKiWkBVqlxjz1fG2qGrnrVqTYXS5ZW4OJLs5+8o48XHxygWpGshqg==
X-Received: by 2002:a05:600c:45c9:b0:477:952d:fc00 with SMTP id 5b1f17b1804b1-47939dfa78dmr72741135e9.12.1765190880005;
        Mon, 08 Dec 2025 02:48:00 -0800 (PST)
Message-ID: <b03a8039-e4b3-42ff-9781-031bf68ccb72@suse.com>
Date: Mon, 8 Dec 2025 11:48:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] x86/mm: update log-dirty bitmap when manipulating
 P2M
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
 <d47d01dd-0289-370d-7b5e-bd80f9e0a911@suse.com> <aTLjwbcm4fjwNJfb@Mac.lan>
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
In-Reply-To: <aTLjwbcm4fjwNJfb@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2025 14:53, Roger Pau Monné wrote:
> On Tue, Apr 26, 2022 at 12:26:10PM +0200, Jan Beulich wrote:
>> --- a/xen/arch/x86/mm/p2m.c
>> +++ b/xen/arch/x86/mm/p2m.c
>> @@ -549,7 +549,10 @@ p2m_remove_entry(struct p2m_domain *p2m,
>>          {
>>              p2m->get_entry(p2m, gfn_add(gfn, i), &t, &a, 0, NULL, NULL);
>>              if ( !p2m_is_special(t) && !p2m_is_shared(t) )
>> +            {
>>                  set_gpfn_from_mfn(mfn_x(mfn) + i, INVALID_M2P_ENTRY);
>> +                paging_mark_pfn_clean(p2m->domain, _pfn(gfn_x(gfn) + i));
>> +            }
>>          }
>>      }
>>  
>> @@ -737,8 +740,11 @@ p2m_add_page(struct domain *d, gfn_t gfn
>>          if ( !p2m_is_grant(t) )
>>          {
>>              for ( i = 0; i < (1UL << page_order); i++ )
>> +            {
>>                  set_gpfn_from_mfn(mfn_x(mfn_add(mfn, i)),
>>                                    gfn_x(gfn_add(gfn, i)));
>> +                paging_mark_pfn_dirty(d, _pfn(gfn_x(gfn) + i));
> 
> Have you considered placing the respective
> paging_mark_pfn_{clean,dirty}() calls in p2m_entry_modify()?

I didn't, but since you ask - I also don't think that's layering-wise
an appropriate place for them to live. Whether a page has to be
considered dirty needs determining elsewhere. No matter that ...

> There's a lot of repetition here with regard to handling the side
> effects of p2m changes that are forced into the callers, that could
> likely be contained inside of p2m_entry_modify() at first sight.

... this way there is some redundancy.

Furthermore p2m_entry_modify() also isn't really suitable: We don't
know the GFN there.

>> --- a/xen/arch/x86/include/asm/paging.h
>> +++ b/xen/arch/x86/include/asm/paging.h
>> @@ -165,8 +165,9 @@ void paging_log_dirty_init(struct domain
>>  
>>  /* mark a page as dirty */
>>  void paging_mark_dirty(struct domain *d, mfn_t gmfn);
>> -/* mark a page as dirty with taking guest pfn as parameter */
>> +/* mark a page as dirty/clean with taking guest pfn as parameter */
> 
> I think it would be clearer to use gfn here rather than "guest pfn",
> and the function parameter should be "gfn_t gfn".

For HVM I'd agree, but please see the one use for PV guests. As per
xen/mm.h gfn == mfn for them, i.e. we particularly mean PFN there.

Jan

