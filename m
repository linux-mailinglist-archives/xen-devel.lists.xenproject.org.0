Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99CE9F464F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 09:44:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858607.1270855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNTBb-0000Cw-8b; Tue, 17 Dec 2024 08:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858607.1270855; Tue, 17 Dec 2024 08:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNTBb-0000BT-5o; Tue, 17 Dec 2024 08:44:11 +0000
Received: by outflank-mailman (input) for mailman id 858607;
 Tue, 17 Dec 2024 08:44:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNTBa-0000BN-DW
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 08:44:10 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 145bfb94-bc53-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 09:44:08 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4361c705434so35919565e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 00:44:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362557c54bsm164506605e9.13.2024.12.17.00.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 00:44:07 -0800 (PST)
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
X-Inumbo-ID: 145bfb94-bc53-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734425048; x=1735029848; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7aODO7TfAm6URX8K9VqRySZAR5rrCTpdiCRy8Wea1vw=;
        b=fj7WIOmrPguWJT7//XcitMbk+4RRavfbOzihbCLsO3k/PWku6dOWicSDPT3uNxEnWk
         AgnPK9ke2x+zpoLBipb6sL7hntAzNZOtjqPar4CPyFgIax2H32fkgHOagcoQubFVGMkz
         jz2uzkWWfjYhvJYTriU8h9pXMX/i5XMg94T8NqgXBvar9aDBNURbusmCs0Bifpy/ZvyC
         SLq77D3VYd1y305U31s/LTjv9a/GApJyB2BudFaZXlAujdFu2cA+xAdthX003bLmSTQs
         lh/SuMR4QqXgeKdjMGJpEqrgeOMKRVW0uy5LLxsjqa9I0O4RQJzKaI1pYWNF/3WKsw1k
         ougw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734425048; x=1735029848;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aODO7TfAm6URX8K9VqRySZAR5rrCTpdiCRy8Wea1vw=;
        b=daB/550b74fNeM1ZVp2M0istunD+aU0hsDGOzLp/PgCGkTNNy+iTPjXjx5Jih/RK18
         MNW7Kt6p8FnW2u0YV9RTUrVAx6UWSz3Yv1ngAzvlTTNzsdctatg5ap/bOuca4WBPaCbt
         VWfdjhPZc4XCRVCRgd3XrD63TJUorjrFWWk1LmQ/FqZ02v6CWXlFlyNmkEfXbFekBak1
         e9MnbMuq/yc8LxkaNJnlJNSj3GCYkQypf0WZ3OK1/QgjmVvOTn5ThGt7OPDBvpIptnRy
         4UQANqpVfoNOvl1iW65R2Q6n4TqX/Swxx4uRLhvTy9+fNFlSikHyOv19U1Qd9BSQhEdF
         y5Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXM4n/jcmKUEjcdHJH8AWayKsBzUVOG8+XxqvBVwgR0klJ++GQcZHxH9OC8EnUBG07Qu4b1rA5M3bs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywxn2Mwn/72r4bLyM77KD3Zx4biZcBJdLc8MndPRoNiVLz34m89
	kNGdvua7mvFDogQ4Xm/t6yKyIHaKlbx4T0FSjzt7e4hl3p/vTMGXzQzctyn80A==
X-Gm-Gg: ASbGnct1uDFWTHb3yyY9AruWsc9zv+0j2J7AXdhD+XyCJUsJKjTO2s8hHoU62VjPN2G
	gVyJwTPZ2rnUO3tEGrLvq2yXOZEXJ6Igigo+82yEqYHd/WGn3SWJZaTF02kwm+5w+dOnDFWH92M
	K9602U1ywc3VCCbdlGahQwzlvuezIIZgaf4GWZuHWO3Q/pGBJyIhgCO3USkRF/uNqTecXu/pTkY
	QiogNDqsBs5jRO7aOPOi3DFXYcOC/vTsTRJ+uhQVF5lVbzk2iwt+hLohGXbFWk+5igHeEQjtAn0
	J1Mo8f0FN46I7mQtvdgLGyPS/hlBrZva6EE9/1MpfQ==
X-Google-Smtp-Source: AGHT+IFtE+MeaA6zhHiBnukcjj17r6kenbPE+1nMocvznF6Dfd01PeJo0aMTc5hosRR7sEUvrmV5UA==
X-Received: by 2002:a05:600c:4f84:b0:434:a711:ace4 with SMTP id 5b1f17b1804b1-4364769b30dmr24617995e9.17.1734425047727;
        Tue, 17 Dec 2024 00:44:07 -0800 (PST)
Message-ID: <f5d5ca69-a7ea-430e-87d3-dd76338389e2@suse.com>
Date: Tue, 17 Dec 2024 09:44:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] vpci: Add resizable bar support
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, "Huang, Ray"
 <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241213054232.2638640-1-Jiqian.Chen@amd.com>
 <0f75fcd2-6c5d-4be6-9fc9-3c7b6c10ae51@suse.com>
 <BL1PR12MB5849A5497B2C72283B8143D6E7042@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849A5497B2C72283B8143D6E7042@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.12.2024 09:22, Chen, Jiqian wrote:
> On 2024/12/16 19:24, Jan Beulich wrote:
>> On 13.12.2024 06:42, Jiqian Chen wrote:
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
>>> +    if ( !is_hardware_domain(pdev->domain) )
>>> +    {
>>> +        printk("ReBar is not supported for domUs\n");
>>> +        return -EOPNOTSUPP;
>>> +    }
>>> +
>>> +    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL);
>>> +    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
>>> +
>>> +    for ( unsigned int i = 0; i < nbars; i++, rebar_offset += PCI_REBAR_CTRL )
>>
>> PCI_REBAR_CTRL is an offset; it can't be used to bump rebar_offset here.
>> That'll need a separate constant, even if both evaluate to 8.
> I will add a new macro to represent the '8' in rebar.c
> Maybe I can name it "PCI_REBAR_SINGLE_BAR_LEN" ?

Naming is a 2nd step only, I think (and no really suitable name comes to mind).
Before thinking of names, I think the approach of doing the accesses here wants
reconsidering. It isn't quite right to bump rebar_offset. When using #define-s,
I'd instead expect to first move _just_ past the capability header, and then
use constants to get at capability and control registers. Alternatively, if we
want to express everything relative to rebar_offset, I think we'd want

#define PCI_REBAR_CAP(n) (4 + 8 *(n))
#define PCI_REBAR_CTRL(n) (8 + 8 *(n))

eliminating the need to alter rebar_offset (and hence disconnecting variable
name from its purpose).

Jan

