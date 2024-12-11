Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4248B9EC7C4
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 09:54:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854139.1267416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLITK-0000i0-Bu; Wed, 11 Dec 2024 08:53:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854139.1267416; Wed, 11 Dec 2024 08:53:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLITK-0000ft-7p; Wed, 11 Dec 2024 08:53:30 +0000
Received: by outflank-mailman (input) for mailman id 854139;
 Wed, 11 Dec 2024 08:53:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLITJ-0000ed-BX
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 08:53:29 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 602c114c-b79d-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 09:53:22 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38634c35129so3022787f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 00:53:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215f8e41e52sm101740845ad.3.2024.12.11.00.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 00:53:26 -0800 (PST)
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
X-Inumbo-ID: 602c114c-b79d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733907206; x=1734512006; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nzGRk8qqkY3xMW9o1TOCpGG+6aY06zQZYsDHdVAAimE=;
        b=WMLpKLeAkpdsBRlNDsDBA4kvujlf7CbwKGQCSXDgY7u+d2Mt7Dm8zXcxHxSRN05u5G
         Ozp1HH8FLlTTKVs9PE71M61NtzZFYjJelSuDE7P/yPoCUPaMpgpKn2+TQK4ITl7RHi/7
         UFQMja4QKgT0T9bhzGLds2tH3e2nN/+oe6h1YjQ6lidBJT3v5XH9aoN85kXIv7IVp1Ph
         Bf7GO2+9VXHhGFN2tfB0ij1FqIvscJtWUgAqOtvgCBOE+oREnCUnb6UCvJt8WO72ECC0
         XAFki0Qx7/byNpQ3bPaqskrIjUKa0Ik5B8dvxzRHiA08IORI/xGjlXOe+gb9lR6VFpBW
         jS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733907206; x=1734512006;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzGRk8qqkY3xMW9o1TOCpGG+6aY06zQZYsDHdVAAimE=;
        b=Tqcm6d4ffSMuVBMHl/ZVa7SLdst07jH22b+aMf1aNkBeMzQ0H5ME+Krbs0eI4wjJQt
         rn3SPz9TTToa/xoKPgzMBob5xTiN1lzkPUhefpgF3/9tB6ljqcxAiuVViBv3KVpDmPqk
         oSOYbmSQ9WBti4unnzaDBKDjcDS4FfWDLwAbXIG9kZ7+CY3tvtCUNBWfn/V6A8Pc/cff
         vLcaFygNrDImZ7HTrDQrfDmrh9R7GOcRVB9N6jVJTIxMwtEppWpz+e0Ck4lNM5G0mDfF
         cTU1cCMPSbW9GXqWR4xFKBPNM4EzebmxIoUkJVMJTBX8MFVICIa8aaC/MbJyrlwnzxwm
         yRAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ0l7VBZ33apXq7udDQh4VkELVEaDPrSQQ3NQyjfD9DDpNDRCHRaD7l2znt36y6SEGjgFfuXu884c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8KDHgVF7qscOZ1yTqCC79hNbRFt+REpUpXGEwc4y6VhKV6qnZ
	7Bi17/zuqC9mttx7yzYNjUwiq7fd8ax65N7qIpTCtzEq8K109Gdjeg4OTPmi7A==
X-Gm-Gg: ASbGnctWb3aJ+CVhKZ2JtHXPOPvQ6B3hAFCiPwHhdx1nujWaZC7dRk5RxhXXnzHWwv4
	CktaaXFlUjRClSrn37JA4bfWrfcl0aR8OrbGDOxlDfNGph+ezF2l33DwqdppBkb/L7Tsv8AmZx9
	1+EdyrQphd7Z6g9PHJ3TbwWIZ2GWJF3sxXvt2VW/7SIJZukvxSS8v1xth6pzRGseaVpbShvruvr
	ypnvPNYwEZ2HF94/oSjLN5levLZ91WOu9HvW3Yk1YJANIfVCEjpmgpOichhC5x8Zn0MDx04+W07
	cSUHPZzca28NfWtOnQZHy9QUE77gCFK4Y7CzwMo=
X-Google-Smtp-Source: AGHT+IEv60cWKKtjALTP5VYOTdMOWUJ+4dAaZ65DGlP4bxpww8yyP36qUDIQL8La9WwNF/gHBt+k8g==
X-Received: by 2002:a05:6000:2aa:b0:385:dedb:a12f with SMTP id ffacd0b85a97d-3864ce7fa47mr1374377f8f.6.1733907206527;
        Wed, 11 Dec 2024 00:53:26 -0800 (PST)
Message-ID: <d16e0c56-759f-4184-88c7-1b147de625f7@suse.com>
Date: Wed, 11 Dec 2024 09:53:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, "Huang, Ray"
 <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
 <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
 <BL1PR12MB58499BEB287C4F9711324F71E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1e0576d9-400e-4483-8dd1-061e215a00cd@suse.com>
 <BL1PR12MB584945F11C271CE137231F7BE73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <a07bca59-90d2-4a84-bb47-59157bf5207d@suse.com>
 <Z1glF5FJjnSzRqsB@macbook.local>
 <BL1PR12MB58492072C5D445052FD056D5E73E2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <328c3bb6-1adf-4c64-81d4-40704ea1f19e@suse.com>
 <Z1lQlVx_p_nvdLHG@macbook.local>
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
In-Reply-To: <Z1lQlVx_p_nvdLHG@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2024 09:43, Roger Pau Monné wrote:
> On Wed, Dec 11, 2024 at 09:25:16AM +0100, Jan Beulich wrote:
>> On 11.12.2024 08:57, Chen, Jiqian wrote:
>>> On 2024/12/10 19:25, Roger Pau Monné wrote:
>>>> So you suggest that the capability should be hidden in that case?  We
>>>> have logic to hide capabilities, just not used for the hardware
>>>> domain.  It would need some extra wiring to be capable of hiding
>>>> failed capabilities.
>>> Can you give me a guidance on how to hide a failed capability?
>>> What codes are current logic to hide capabilities?
>>> Then maybe I can add a patch to implement it.
>>
>> It's really the other way around right now for "normal" capabilities:
>> We whitelist what we expose. See init_header()'s logic after checking
>> the PCI_STATUS_CAP_LIST bit. Actually past that block there's
>>
>>         /* Extended capabilities read as zero, write ignore */
>>         rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL, 0x100, 4,
>>                                (void *)0);
>>
>> I.e. no extended capabilities are exposed at all right now to DomU-s.
>> For Dom0 I guess we shouldn't use whitelisting, but the (extended)
>> capability list(s) would need similarly virtualizing to be able to
>> hide some.
> 
> Given this capability is only to be exposed to the hw domain (at least
> for now), I'm not sure it's fair to ask to add all this
> infrastructure as part of adding the new capability.  It would be great
> to have it, but doesn't seem fair when there's already MSI and MSI-X
> implemented without such support.

Well, of course this can also be modeled after MSI/MSI-X, failing
assignment when initialization for a capability fails. Yet while for
MSI / MSI-X this feels okay-ish (considering that many devices now
can't even operate very well without either of the two), I'd expect
BAR resizing to not be something that drivers (typically) rely on.
"Typically" because iirc Jiqian said the AMD display driver actually
does.

Jan

