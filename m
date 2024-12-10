Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC629EAF02
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 12:06:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852117.1266018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKy3i-0000gg-Ka; Tue, 10 Dec 2024 11:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852117.1266018; Tue, 10 Dec 2024 11:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKy3i-0000ea-I6; Tue, 10 Dec 2024 11:05:42 +0000
Received: by outflank-mailman (input) for mailman id 852117;
 Tue, 10 Dec 2024 11:05:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKy3h-0000eO-Dv
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 11:05:41 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1231254-b6e6-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 12:05:40 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-434e3953b65so21973215e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 03:05:40 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:3d8c:c505:78ea:f982?
 (p200300cab746063c3d8cc50578eaf982.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:3d8c:c505:78ea:f982])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-386219096b8sm16049294f8f.84.2024.12.10.03.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 03:05:39 -0800 (PST)
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
X-Inumbo-ID: b1231254-b6e6-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733828740; x=1734433540; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IFcdD2jm1JS2uLl6E5zYjBh52nJmsDjO8uQkSwxPF7g=;
        b=QBqX3dnmENDeUWNEbnBFrpY5aP5uSSlqtEMksCx2aAFfP9RZfx2draXXo++X7q1WsX
         rn/kOPEAWSixE0PEGgOCuPS6eIeaZTTgdhb2lPcMDGC3CW4wEBngRnj2Lsr7n0Z0Rg2E
         eTWGsDOtkhEwuy8zYheCYM7hMBJMrUU0GReiw2iat4kHDL/OPjeHnG0lIX626o7Jq7ft
         tY7DH5Tp1drr40JW0qKud8KwmY03P+Ce5t9Dqb+HzaAqEpLBILB/VCGBqxAB5jmZAqXz
         IaS7q/nlLXih6GqMVBRWaJuPsRBsS3iWlM6frgqZ2niKs6/YK7AM2OBSpaLihu70+hgw
         pXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733828740; x=1734433540;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFcdD2jm1JS2uLl6E5zYjBh52nJmsDjO8uQkSwxPF7g=;
        b=NFg3HPapc3yVSF5CU6gGhWLym1ZOP6UPDy/6kh8cpmRJRugc3env0QrDk0dzrupf+v
         2mKpyrgj08WvK0vZOasZWgCJ6A2EClVtG5RnBxlGMmv9+8+IkMpzcptcyvaj5ip29S5I
         RVg8xPKV+/CSpbCkWdXZHYayKQG4xN4f6EXbaF4gMYNcbRKHCqUjb82nEPIHwyjY1m2m
         5WxNZ/PDYLlmMoYGlQUEeDVDjem3L4ZkI2jl5ra8EB+jA9+ozTRUXIQ/HAFZDmqaJ0v6
         S3Y8Z7rQV1ChIvpGCcrQv/EL/ea1bH0TVY5y7mokU3BecUI4ksU5rj5uOlNoBeXZOoZj
         NREA==
X-Forwarded-Encrypted: i=1; AJvYcCXkKn32KljN7iVcxOA86lcvVXzqkI4rzZExbSkKcF3kcee1LLmfARg9q5MzqQVNRuSDaA38cIdGBUM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywhd87xlqlZUraQzpWKVuwyz2+k1CtCQZv1FVTuvmsbhdCDzY6Q
	sqfoj5Ol+jtGXtq4goFcukWKDHCfiOvaDZAR0WJ6LSfOCexJt8kC2HK+ano8SYNHfLl7bzwSqn0
	=
X-Gm-Gg: ASbGncvaI1etwfrAKbzibDY2rImMr1mrUGAHyKFUdvZYKywuNikqT8cI8r61AQ8YsJn
	UO9yXisnPpZHzEKQtpMaz/i4SbKH9wypbOIBsg0zar6YbWKUhW1vtZCz4xhmFxPDd3yErI1Rrb0
	anRl0tByE1q+9r3CFPiF63KrwceOgfxIqx+PJqjqO8CtqpK7CqmZOEF6/U1sN1Upo1Q3o2SLpZd
	TUEPvbib86MxiB6dFbjKgfeG/rDbxmj5MDWMS+RgeZqCvsTdQaMb4G6/rbzS/q0nsm6tUfv/DdB
	IVO5OMwyjQgVnUo91sgAkXDMiggZfTemaKkb0cd4QabEzet8xKCRv2ncd/zr/9OtegxxtRvVXE/
	XB5EnnCXytQ==
X-Google-Smtp-Source: AGHT+IGr9mw9OCitLaVF5hjLM7Jvh3nieaza+nKcxv2x8+A5VeCt8W2K9I8HQay68DpiBUJr0VoGDQ==
X-Received: by 2002:adf:f38f:0:b0:385:ec6e:e899 with SMTP id ffacd0b85a97d-38645405137mr2350023f8f.59.1733828739817;
        Tue, 10 Dec 2024 03:05:39 -0800 (PST)
Message-ID: <ee41e80f-3661-423f-8b82-29cb2e404f41@suse.com>
Date: Tue, 10 Dec 2024 12:05:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Huang Rui <ray.huang@amd.com>,
 xen-devel@lists.xenproject.org
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
 <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
 <Z1gfYeJL-mgTn5Gj@macbook.local>
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
In-Reply-To: <Z1gfYeJL-mgTn5Gj@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2024 12:00, Roger Pau Monné wrote:
> On Mon, Dec 09, 2024 at 02:59:31PM +0100, Jan Beulich wrote:
>> On 02.12.2024 07:09, Jiqian Chen wrote:
>>> +static int cf_check init_rebar(struct pci_dev *pdev)
>>> +{
>>> +    uint32_t ctrl;
>>> +    unsigned int rebar_offset, nbars;
>>> +
>>> +    rebar_offset = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_REBAR);
>>> +
>>> +    if ( !rebar_offset )
>>> +        return 0;
>>> +
>>> +    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL);
>>> +    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
>>> +
>>> +    for ( unsigned int i = 0; i < nbars; i++, rebar_offset += PCI_REBAR_CTRL )
>>> +    {
>>> +        int rc;
>>> +
>>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, vpci_hw_write32,
>>> +                               rebar_offset + PCI_REBAR_CAP, 4, NULL);
>>
>> The capability register is r/o aiui. While permitting hwdom to write it is
>> fine, DomU-s shouldn't be permitted doing so, just in case. (An alternative
>> to making handler selection conditional here would be to bail early for the
>> !hwdom case, accompanied by a TODO comment. This would then also address
>> the lack of virtualization of the extended capability chain, as we may not
>> blindly expose all capabilities to DomU-s.)
> 
> I don't think we can safely expose this capability to domUs by
> default, so my preference would be a returning an error in that case
> (and printing a log message indicating ReBAR is not supported for
> domUs).

I understood Jiqian's recent reply to mean that that's what he's going to do.

> Note it's already not exposed to domUs by not being part of
> supported_caps in init_header().

Just to mention it - supported_caps is, aiui, about "traditional" caps only
anyway, not extended ones.

Jan

