Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0EAA6A789
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 14:49:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922066.1325951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGH8-0004xH-T3; Thu, 20 Mar 2025 13:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922066.1325951; Thu, 20 Mar 2025 13:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGH8-0004vW-QL; Thu, 20 Mar 2025 13:49:34 +0000
Received: by outflank-mailman (input) for mailman id 922066;
 Thu, 20 Mar 2025 13:49:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvGH6-0004vM-Pu
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 13:49:32 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2535dd54-0592-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 14:49:29 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39727fe912cso285456f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 06:49:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3974d771160sm20213098f8f.19.2025.03.20.06.49.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 06:49:28 -0700 (PDT)
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
X-Inumbo-ID: 2535dd54-0592-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742478569; x=1743083369; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wpOt68E1lgyrOleU/OEtaNvyljzyMPWAWbkPgHE7DY8=;
        b=geeF4Ekj6d9lO1u6mODjoCfvFigJ3Q1y7rqs1IFQ6Hc0zfNtLIw9XrdjC6NtBynH/e
         u8lSqRBoPMHoxzETbWforRFyU8HFIpcSsKgUXCwts3e++QzL0opLrIzD4HfVq6pJ3uvG
         9hDBUH/vr1MTQO38o86wt+ChVK42XVBkQUk02GYpDPFfGX27jbn2Y/rATt7sozPCS/5R
         5X96Tjbgv2soW9bVOzaE/tzyGAc5nO2ozksn1Hi8BYAGXwFApHB1qFjcxaXAMkxnORBq
         XsCOEJnkBEMLfl2sXJPAT7x7fZiWHqp4KWN6BbXnNjx5lcE6oqMVqVCUJaFqF7LPWOk2
         pH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742478569; x=1743083369;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpOt68E1lgyrOleU/OEtaNvyljzyMPWAWbkPgHE7DY8=;
        b=wz2A7FX0d57mq0MTP87hRNsJfDI3fb1gL/zqsu9Hr1a1a6O/H+5ibO0b3d+WvKqLEr
         93/2aVBY7iXGwWHjkZlBN2dZbxRKx6OtibIB/KlpTb3qZ5v7onwvMcrWfh4YQbcZwVHH
         ROSZv16iskuwohfVUe9P2fmUtEKEJzpyBZVi6BXV/JH1oVb5Iva6lK6gjx7tJBpzjNfj
         mXylZf3IB/2lkTljEBS8ANmnFBLCO+72UM77Zi5Cb31nSCKNBihrB1XL7CFE51PSSG1+
         YeTGP+GxAB5TYIcXeAlfnewA/rVksU2XtaZL8xEoCsLahd/WIbzkJRbdJww4W6EgyvOi
         SLoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxxRMC7/X0/jbSgL9fQcDag5HVSjX2DOarHEBmgXiiK6qLst8k+8o3PcaTlAFnIxdJBvJkoGUwaR8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTR3HDiVFlimFrTpPXFcI8++xoMYMGvPf+fqWEP9cLaPgYSEo6
	A6GwGxXFCpWF+L/MrgyhyL7CtraIcVQ2ymFP0lK1NjPbmrKBpddUTz6zvVSFWw==
X-Gm-Gg: ASbGncvS2LRGJxBeGOKFgsNIZgkGsoZkClVdUyYL1G9hUMCPX9GIq3KwHGJgk1BGINO
	Ba2zYaDrOfxA61kUdYmIO9HZPKFKCLNFEGw7BtiodapmCNp4edGK0sXt3QhvTJ+9Bp/m2ySfpwm
	hBSgQGopldw3L3gpYXIGzeCOjBpf8P8vKtRG1DbuLZWzIUYU9lsy+UB1r5umuvzMrsoEJmuJWDs
	xHASb+ENPvaO38pwtD+IBKceiRPCJ5zqv+pbkxjOiW5J3FHrKyuhdWfNpw39mQaz4m4w8hb4MF1
	pLae3UIu8vgTZHaanSMVkYsX2MnLlzsgabZWzxRzOBC6SlkDy9bFkS2Xgg1q8KJAJXQBnPGStTt
	7XS8s6XHvxZA74bPQDJ9VeqUQFEwMSQ==
X-Google-Smtp-Source: AGHT+IFuIKbiFzfQoSqrVg4GIMBdiU0pg78CPQ8Em8ZZXNXT1GkYQwekz930c7IH2NvMLg6C5bsoMQ==
X-Received: by 2002:a5d:6489:0:b0:390:f6aa:4e80 with SMTP id ffacd0b85a97d-39973b449bdmr8830645f8f.53.1742478569069;
        Thu, 20 Mar 2025 06:49:29 -0700 (PDT)
Message-ID: <a9831a95-2828-4b46-8cae-58b2c531f507@suse.com>
Date: Thu, 20 Mar 2025 14:49:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] Strip build path directories in tools, xen and
 xen/arch/x86
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: =?UTF-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Anthony PERARD <anthony.perard@vates.tech>
References: <cover.a5cb9c3a17249fc067ab501818c3a3e6c7c229cf.1742317309.git-series.marmarek@invisiblethingslab.com>
 <0370c0eb1fd9ac00acab016792132fa0b943d384.1742317309.git-series.marmarek@invisiblethingslab.com>
 <017d5c41-d4ea-4d91-b6ec-b4660e7325ae@suse.com>
 <e112ecca-b891-4c23-ace1-8128e586cb94@suse.com> <Z9qxcRtap-k-wW8B@mail-itl>
 <943644a3-45f2-46ef-a54b-6dd0bc6171ed@suse.com> <Z9rJUWCARMQYqNXr@mail-itl>
 <Z9vrc1Xvm5OEy8rM@l14> <Z9wPVGd0fEsbaO_s@mail-itl>
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
In-Reply-To: <Z9wPVGd0fEsbaO_s@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2025 13:51, Marek Marczykowski-Górecki wrote:
> On Thu, Mar 20, 2025 at 10:18:28AM +0000, Anthony PERARD wrote:
>> On Wed, Mar 19, 2025 at 02:40:33PM +0100, Marek Marczykowski-Górecki wrote:
>>> There are clearly some build path embedding left. And
>>> -ffile-prefix-map=/-fdebug-prefix-map= doesn't work correctly with
>>> XEN_ROOT having xen/.. at the end.
>>> BTW, would it be acceptable to have this?
>>>
>>>     $(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=$(realpath $(XEN_ROOT))=.)
>>
>> Hi,
>>
>> Could you avoid using $(XEN_ROOT) in hypervisor build system? (It's fine
>> in "tools/"). In "xen/", there's a few variables you can use if they are
>> needed: $(abs_objtree) $(abs_srctree) for absolutes path, and $(srctree)
>> $(objtree) for relative path. That also should avoid the need to use
>> $(realpath ).
> 
> XEN_ROOT is literally "$(abs_srctree)/..". And I need to resolve it to
> not have /.. for prefix-map to work correctly. Would it be better to use
> literal $(realpath $(abs_srctree)/..)? Or use just $(abs_srctree) and
> have paths in debug symbols relative to hypervisor source dir, instead
> of xen repo root? I'm not sure if that wouldn't confuse some tools...

abs_srctree being computed using realpath, can't we replace

export XEN_ROOT := $(abs_srctree)/..

by something as simpl{e,istic} as

export XEN_ROOT := $(patsubst %/xen,%,$(abs_srctree))

?

Jan

