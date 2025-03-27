Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8C3A72E3B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 11:54:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928956.1331592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txksI-0003hH-Ao; Thu, 27 Mar 2025 10:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928956.1331592; Thu, 27 Mar 2025 10:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txksI-0003f3-88; Thu, 27 Mar 2025 10:54:14 +0000
Received: by outflank-mailman (input) for mailman id 928956;
 Thu, 27 Mar 2025 10:54:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txksG-0003Qs-KX
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 10:54:12 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0c6ffc9-0af9-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 11:54:11 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso7885905e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 03:54:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314f5c6sm34282755e9.40.2025.03.27.03.54.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 03:54:10 -0700 (PDT)
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
X-Inumbo-ID: d0c6ffc9-0af9-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743072851; x=1743677651; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n+pCaBjPxjRXFC+feAr2ufhu3QXWHTJSY0zHeI747nI=;
        b=JSlx9PVUwugVRPN2+UsadPlXzD7OJw659JeNhINnLdUsMzNdnZ0EvlQnnWeMb1cXDm
         /E52pSupsiptuJZ7vRqpoNrnPoiRe7BHmafUDXZH2/Wg9qf7/9F+HuNHtPIowsUU0umy
         qm6ts+nYMixvN8zp8vA+Rd8dCK0vCrd1wOZrxJ94zZMgpL17qkyBhjPWtCFVCdZiRaU6
         MyvhulIpRasSrl0ZShn8Z0fzgbDCegPUwZ9+JRFeOOZ4JOxXZ3S1v7eq09HoqymCF8fo
         0aMt6NcHarRoPSPyF9S0YM4OHrwVmQlYT5dGop684qoQcxOqoSd3m3kQj9HKZvL5VIVj
         8p9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743072851; x=1743677651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+pCaBjPxjRXFC+feAr2ufhu3QXWHTJSY0zHeI747nI=;
        b=vBZuRyrIilacJVOmbZuUYGj32iosfMwuuuRjA0rSUKwCCx72RWhBKWGbxeWjPVtuvH
         zFzI1wMaBuRICvwEqTcumqUJzNXT/fIEMas6UGlalhbjwp25dLdvleHnBP4PDVOXTB2f
         7cJo5bpnERdQuLJuB40XqLSyHxD3yW9CdBi524ufPmKp7JrOcq/Q8oO7EwDOzHebq3C2
         kBwtT48XzEV63jEh7LRfKsJQVted5tv+oE0CStCeAPt2bPnNpW5uR//TI6M5OfUBQHRi
         hEURENfUeelRMHTGUCEjONqcbLMZMbMtfYQsuAlIRaZBK70JqWh0j1U9hOI3wPIG8rZX
         LMXA==
X-Gm-Message-State: AOJu0YxvtrNmCdzgz4BjF09BCikCA5Z2+1E5E/Squ39vVJ87x/8v+rUZ
	dv+KVNHBclD6Mi6BSfwLstbR4EDlPXNO26MTCpnmJ7orMfNc3lpIV7jFHqtk+Q==
X-Gm-Gg: ASbGncvvTwP/jaoGRHHRRrt4DLIA3eFEgGHUVtUYT6SQ+m4TLiDSwAh/qzm3a9PFcHV
	3KxOHGhICaKUb3vPEkWFyLg7D2d+lSYNCPqmUbzVkAfRBcOcI8ZKCiyxyHqbbWprJAGjsTc4NJO
	KYRtknztd2maMDi+92fgXrOdnJLNFAU4RWpzfhDXpmggfGSM47p2XFIefgmcaMeY/FVcJPVEIMw
	GUaHXjOR2wIr8aGGkBwz5z9FqibHHb6yVqlDDnQ6BJEc9kgSUAUiLzAEb7/fFAiKBU5oA/wCpK9
	oIE4/FrH0Nw7+06QejbBojIJxG5PSNoSsgXK8h3C62kaBqq7314KF6pztktZPNlm2a+BLFzlg+Q
	F/BqgdE+f1dwu3XyA/MRZ70eITBaC+Q==
X-Google-Smtp-Source: AGHT+IFfGLRaGyHWI2IBlMb/i0z+Nbk+MzBzgd749l7IiUO8ff/lArmia3qNU1caglzSJDHlUq88xg==
X-Received: by 2002:a05:600c:1c82:b0:43d:762:e0c4 with SMTP id 5b1f17b1804b1-43d85097c85mr24870375e9.27.1743072851018;
        Thu, 27 Mar 2025 03:54:11 -0700 (PDT)
Message-ID: <17ddf002-8305-4c14-8fbc-3c3be418bba2@suse.com>
Date: Thu, 27 Mar 2025 11:54:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/P2M: synchronize fast and slow paths of
 p2m_get_page_from_gfn()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <b590b590-764a-4dfe-9e13-975122790329@suse.com>
 <Z-UToaPviR7b73iG@macbook.local>
 <307f7c6e-bb31-4c0a-890e-a21b7a4e178f@suse.com>
 <Z-UquDQHtnFMJ4se@macbook.local>
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
In-Reply-To: <Z-UquDQHtnFMJ4se@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2025 11:38, Roger Pau Monné wrote:
> On Thu, Mar 27, 2025 at 10:24:02AM +0100, Jan Beulich wrote:
>> On 27.03.2025 10:00, Roger Pau Monné wrote:
>>> On Tue, Mar 25, 2025 at 08:17:04AM +0100, Jan Beulich wrote:
>>>> Handling of both grants and foreign pages was different between the two
>>>> paths.
>>>>
>>>> While permitting access to grants would be desirable, doing so would
>>>> require more involved handling; undo that for the time being. In
>>>> particular the page reference obtained would prevent the owning domain
>>>> from changing e.g. the page's type (after the grantee has released the
>>>> last reference of the grant). Instead perhaps another reference on the
>>>> grant would need obtaining. Which in turn would require determining
>>>> which grant that was.
>>>>
>>>> Foreign pages in any event need permitting on both paths.
>>>
>>> I've been wondering about this, and AFAICT the PV equivalent of this
>>> function (the tail of get_page_from_gfn()) is much more limited in
>>> that it just allows access to domain owned RAM or MMIO that has a
>>> backing page (I expect mostly for the low 1MB?).
>>>
>>> However for HVM domains we allow to take references to foreign mapped
>>> pages and taking references to MMIO pages is not permitted.
>>>
>>> Should the tail of get_page_from_gfn() also be adjusted to make use of
>>> the newly introduced get_page_from_mfn_and_type(), thus unifying the
>>> logic for both PV and HVM?
>>
>> There's no (proper) use of P2M types in PV, so I don't think using this
>> function is viable for PV. In particular we'd never observe p2m_foreign
>> in PV, if I'm not mistaken.
> 
> Indeed, p2m types are just occasionally faked for PV, like in
> get_page_from_gfn().
> 
>>> Could possibly be done in a separate change, I'm just trying to
>>> understand why we have this seemingly different handling for PV vs
>>> HVM.
>>
>> The difference is because access to foreign pages was hacked in to work
>> for PVH in a much different (and imo yet more hacky) way than it was
>> made work far longer ago for PV. The crucial part of that is in
>> get_page_from_l1e(), so get_page_from_gfn() isn't that relevant there
>> (I think).
> 
> OK.  I'm kind of surprised we need foreign handling for HVM and not
> for PV in get_page_from_gfn(), as even with specific handling of
> foreign pages in get_page_from_l1e(), the former is used in a lot of
> places that don't seem obviously tied or gated to a call to
> get_page_from_l1e().
> 
> For example the XEN_DOMCTL_getpageframeinfo3 usage of
> get_page_from_gfn() will have different results when used against a
> foreign page depending on whether the caller is a PV or an HVM
> domain.

Which imo is an unintended side effect of how foreign page support was added
to p2m_get_page_from_gfn(). Considering what XEN_DOMCTL_getpageframeinfo3 is
used for, I don't think foreign pages were intended to ever be observed there.
A guest controlling another guest isn't assumed to be migrated, aiui.

I expect more uses of get_page_from_gfn() can be found where foreign pages
better wouldn't have "success" returned. Yet any of this is mere fallout from
some callers apparently needing that case to work, and hence why logic was
hacked into there. Maybe get_page_from_gfn() should take another P2M_FOREIGN
flag, which only callers caring about foreign pages would set?

Imo none of this is directly relevant for the patch at hand here - fast and
slow paths differing is a problem no matter what. In fact I'm surprised no
issues were ever reported that could be attributed back to that anomaly.

Jan

