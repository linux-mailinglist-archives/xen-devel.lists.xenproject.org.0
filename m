Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E17A5BAFC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 09:44:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907399.1314632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trvDr-0002QL-5P; Tue, 11 Mar 2025 08:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907399.1314632; Tue, 11 Mar 2025 08:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trvDr-0002Nj-2T; Tue, 11 Mar 2025 08:44:23 +0000
Received: by outflank-mailman (input) for mailman id 907399;
 Tue, 11 Mar 2025 08:44:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1trvDo-0002Nd-QJ
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 08:44:20 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05d4fa20-fe55-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 09:44:19 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so9232405e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 01:44:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c1030cfsm17760386f8f.90.2025.03.11.01.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 01:44:18 -0700 (PDT)
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
X-Inumbo-ID: 05d4fa20-fe55-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741682659; x=1742287459; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U9QzownHLiU16AH6mH1UpTYSiJ6RaMIlL7uNMFd4PMY=;
        b=UISlmTbYFmnqQKfQCklIKIXWoaYm30PWtYCA7wKQG30YJiwBDbRgCGIoUZnGkbgWLd
         YW11/fFZYzcQlXjKokzbR7KNYwgBHXGjBp/7B6Jz9I5Pmvr/Xn/T6EP8b0eB6qLtzExB
         sC30CxKiH/Nb3Ci1jOweJhk267SJBlewBGqi+sg12IM55d6FHNM7sUbQRy1VR5vESvgW
         Ebm4apEVQqkhqkXIq4fNwO7gyc3inBh9PEkqhwy5YZma/hKPTgGTkHDQbxU8paloTdmE
         nSVMO61bLQJEeXet4+iMMVJcc+a3b3/ugRU6KLVrPYU4O6xR9CoAV8t6K1SgSm+8PuBf
         UAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741682659; x=1742287459;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9QzownHLiU16AH6mH1UpTYSiJ6RaMIlL7uNMFd4PMY=;
        b=gz44qOCgInpad3ot62HuxBmT7FCJ62+9yFUmEBwcwqbR6wksNCOftZodTIHGFf0orB
         pgfwvydDim5fd7E4Um/WptIBZzoPpkDfjVcxFTxHBw5gEI8emnC1Kl6suyAGZwH4sfqA
         5goaha5dHh08pbvKh+AfZ5tdd7o2HinGBIjlkiXjQ0QcRn+KguENtxgO3d+ExP0jbwYl
         9FoOLDAraTZ18wG76m+7HANMdhG8q3W46BLKvFVZigTMpDbpD5bCGvutID/Ui5lreQ7n
         aq9PWMxRvr/NS63doH32LxVAKM/1oqgg1CP5tdxpu+oKfJ8JQn2d5ha5TNEp11UUmVax
         ZCtw==
X-Gm-Message-State: AOJu0YwRRfRvESRHNmTCWjHm9FzZPSlx9KQEgQpuHCyrp2Xxy0AbR/D3
	c7JcexqYk5pCjQQbz11XIi+ZZ/ySxZjBMeqBgczBX6SHXWFsrwt+1AQC1jDJiA==
X-Gm-Gg: ASbGncstuqZvWG3t2SJWmOk0ZyggspyF4qlv4XXIDvUphOUgHFq5jy0O9pYPBwdt4R3
	ZGxnt4C26/Vc1Cc5JCZ4MOfGNAI3mSF8eQGKlUB9WGNe7YNtf1pI9SkEdqyyGJVHO5TuagoSGJc
	rbz5UOXKg3SqaaJH4JZKEJgusM/DAFf0+Oa0iHPRMmIBTkIaUes4iI9IYgp6ZR2pnm2+q5vretM
	QGlxoflNZ45YFsZ6llbVz19gYvNLSqNwtwyRl8ALLSO/DCMyAxjAsGZI8odg681+IYNWWMLm/rd
	kYvmeXwBGDoTEQbFsdhK06BC1iiUEbyenwRuyAcu2YoIklGYz7nsfgSvZCaTHWhgGG7hcAZ8jqZ
	MGEV/fo++Oi7WiI3FQboTXU1GQBzPxA==
X-Google-Smtp-Source: AGHT+IHoBOFPCdOJpNGTcSNVeyY3fLyGdrvxnoqTeqrYKvVMymOa9DYNkXajSSvqw5uMljFFwPeMbQ==
X-Received: by 2002:a05:600c:470d:b0:43c:fab3:4fad with SMTP id 5b1f17b1804b1-43cfab351c6mr68763655e9.16.1741682659062;
        Tue, 11 Mar 2025 01:44:19 -0700 (PDT)
Message-ID: <b0aae379-9128-4d31-9a3f-92a500a30d75@suse.com>
Date: Tue, 11 Mar 2025 09:44:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/P2M: synchronize fast and slow paths of
 p2m_get_page_from_gfn()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7363b2ee-f297-4b0b-9c4d-bdebe08d514b@suse.com>
 <88d24595-50be-4f99-97d6-9126340b791e@suse.com>
 <Z879Aq-UNj-Jz5S1@macbook.local>
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
In-Reply-To: <Z879Aq-UNj-Jz5S1@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.03.2025 15:53, Roger Pau Monné wrote:
> On Wed, Feb 26, 2025 at 12:52:27PM +0100, Jan Beulich wrote:
>> Handling of both grants and foreign pages was different between the two
>> paths.
>>
>> While permitting access to grants would be desirable, doing so would
>> require more involved handling; undo that for the time being. In
>> particular the page reference obtained would prevent the owning domain
>> from changing e.g. the page's type (after the grantee has released the
>> last reference of the grant). Instead perhaps another reference on the
>> grant would need obtaining. Which in turn would require determining
>> which grant that was.
>>
>> Foreign pages in any event need permitting on both paths.
>>
>> Introduce a helper function to be used on both paths, such that
>> respective checking differs in just the extra "to be unshared" condition
>> on the fast path.
>>
>> While there adjust the sanity check for foreign pages: Don't leak the
>> reference on release builds when on a debug build the assertion would
>> have triggered. (Thanks to Roger for the suggestion.)
>>
>> Fixes: 80ea7af17269 ("x86/mm: Introduce get_page_from_gfn()")
>> Fixes: 50fe6e737059 ("pvh dom0: add and remove foreign pages")
>> Fixes: cbbca7be4aaa ("x86/p2m: make p2m_get_page_from_gfn() handle grant case correctly")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Just a couple of nits below (with a reply to your RFC).
> 
>> ---
>> RFC: While the helper could take const struct domain * as first
>>      parameter, for a P2M function it seemed more natural to have it
>>      take const struct p2m_domain *.
>>
>> --- a/xen/arch/x86/mm/p2m.c
>> +++ b/xen/arch/x86/mm/p2m.c
>> @@ -328,12 +328,45 @@ void p2m_put_gfn(struct p2m_domain *p2m,
>>      gfn_unlock(p2m, gfn_x(gfn), 0);
>>  }
>>  
>> +static struct page_info *get_page_from_mfn_and_type(
>> +    const struct p2m_domain *p2m, mfn_t mfn, p2m_type_t t)
> 
> Re your RFC: since it's a static function, just used for
> p2m_get_page_from_gfn(), I would consider passing a domain instead of
> a p2m_domain, as the solely usage of p2m is to obtain the domain.

Okay, will do.

>> +{
>> +    struct page_info *page;
>> +
>> +    if ( !mfn_valid(mfn) )
>> +        return NULL;
>> +
>> +    page = mfn_to_page(mfn);
>> +
>> +    if ( p2m_is_ram(t) )
> 
> Should this be a likely() to speed up the common successful path?

Well. Andrew's general advice looks to be to avoid likely() / unlikely()
in almost all situations. Therefore unless he positively indicates that
in a case like this using likely() is acceptable, I'd rather stay away
from adding that.

docs/process/coding-best-practices.pandoc could certainly do with some
rough guidelines on when adding these two is acceptable (or even
desirable). Right now to me it is largely unclear when their use is
deemed okay; it certainly doesn't match anymore what I was told some
20 years ago when I started working on Linux.


