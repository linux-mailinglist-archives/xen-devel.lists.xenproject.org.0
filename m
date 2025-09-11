Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D131B52EE2
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 12:46:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119926.1465070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uweoU-0005fN-FB; Thu, 11 Sep 2025 10:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119926.1465070; Thu, 11 Sep 2025 10:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uweoU-0005cV-Bx; Thu, 11 Sep 2025 10:46:02 +0000
Received: by outflank-mailman (input) for mailman id 1119926;
 Thu, 11 Sep 2025 10:46:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uweoT-0005cK-Md
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 10:46:01 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81383d96-8efc-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 12:46:00 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so81562566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 03:46:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32f20dcsm102819566b.90.2025.09.11.03.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 03:45:59 -0700 (PDT)
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
X-Inumbo-ID: 81383d96-8efc-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757587559; x=1758192359; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rHSUWoYMdgzf4IiT3dMD5pcRmUqjWPY7dpo49gnYGMM=;
        b=TcfH3ZCbQWlTdVolvmCJVCCd6jMTh698ZpVs0BAiMQHyXFZLliKGeuYukc/hZJjdH5
         OYmJgECdacAARk+FIRe1D/O7rcbrwbBJqj8hIS/VGv2FepUhqRvTRIg7reZ26NpIhEhU
         VLJXuQcvm3ZPAazD8Xhei5edFWsDfrvDwghcm73HcWpZ3WMfYW0MCg7wRYP0TXp4D+PP
         l6H2kv2dIYTZ7OwTbT4ACa77z8PoFXCQwl5kbTRMoZ4CEtflhofuM9BfYA8vA74g/m+H
         u/fKQbGKqBR9OGi3aXdAL0PHKjlsP9iKZrColJQ8+/ehZC9BASVVXk3t1ILiN1QCcuXu
         DjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757587559; x=1758192359;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHSUWoYMdgzf4IiT3dMD5pcRmUqjWPY7dpo49gnYGMM=;
        b=mZfegkFViQmijErTmXrOVnxoTdiwBDywjKdA9SKR2upq4hm6LauzGEwxXUi+y07caK
         h3AeXTgRxudvmgUju7V7gZcuTZxxwFrMHY8jwX5YnlbBXy1z4qoCb2/RmisG2KuBR8wb
         6POH3sR4aSai2VbCStMajkUfZkOZlLJKHBR6TvwyB8fWrHWwbPO7KRt8jcJW8ObgLRRI
         QCid8B21NRwrar6ELTaMW9y8PkLNXOhVvVcxrh+ppYXPBwSYn+M9rra5nOarH3hW/3dI
         yQP7TmbuV9HWST9zLFtS4+iiRhPhdzc7Llp0Z5o9Jutehkj/tveVpE5l/mLzdmt/qjFR
         1Xnw==
X-Gm-Message-State: AOJu0YxssRX8B0w8VOtDe7zIss3kx483wy8/5U/BSsJfNZP5uK+MPDn4
	AVZcM/Wsurd3MBEddbr1EoNhUbSZS03HwnkfnExfO9RnYH5CypuS/Czu/YPNmTktJA==
X-Gm-Gg: ASbGncvMQy9uaeCoPxHKAlCf3v/HiNgVRGAUPdW4PIXNpCGpcwLm/uk5OdNGU6Iqyka
	ETo2I0psF18KswiFwsIn9V6hhGkmAmSHmD2/dr/M4j20P0T0sCfWuXMrese6XHB6p5GkAiw/0gL
	ZFXbFPokN9EuhG1N6M+VxtJq6mVgt2EyshTNIlnyS6FpijGM4GKLYVsYO3geN0nZ0VOISVqUzW5
	OurinzykTaD/HBFsQuuaQ4tIGDyoPF1vNDt3ilRQwAgdvWOkfgKfQZLbM24mBcKfqGBSm+7S+60
	0qqpeQ1KXZjcm4RXitn+ISRBdg5Bj3W3ZKsVVcGVKtAdSshGtsxd9YkrGtAisiAT+XME8+LcHvS
	VQcePLkyArIhKp8W4NiNSoK+siUmg2S40Sszkfi4xUeLtbm7rnmypcJpk4yaMcQ/3Y6YjSgtfE4
	z3F21vizM=
X-Google-Smtp-Source: AGHT+IHDk0BCWy9NHTP0eiCLaecgTZsDe5m+fK2o/oqPqrl/NBLCQhql3xIzO3/sK7pT9MKLV5vTVQ==
X-Received: by 2002:a17:906:fd8a:b0:afe:85d5:a318 with SMTP id a640c23a62f3a-b04b1666d66mr1826857866b.36.1757587559423;
        Thu, 11 Sep 2025 03:45:59 -0700 (PDT)
Message-ID: <1a81010e-98f5-40f3-a64e-ca01b64ae8fc@suse.com>
Date: Thu, 11 Sep 2025 12:45:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/26] xen/domctl: wrap arch-specific
 arch_get_info_guest() with CONFIG_MGMT_HYPERCALLS
To: Stefano Stabellini <sstabellini@kernel.org>,
 Penny Zheng <Penny.Zheng@amd.com>
Cc: xen-devel@lists.xenproject.org, ray.huang@amd.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-15-Penny.Zheng@amd.com>
 <alpine.DEB.2.22.394.2509101930300.52703@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2509101930300.52703@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.09.2025 04:31, Stefano Stabellini wrote:
> On Wed, 10 Sep 2025, Penny Zheng wrote:
>> Arch-specific function arch_get_info_guest() is responsible for
>> XEN_DOMCTL_getvcpucontext domctl-op, and shall be wrapped with
>> CONFIG_MGMT_HYPERCALLS
>> Wrap XEN_DOMCTL_getvcpucontext-case transiently with CONFIG_MGMT_HYPERCALLS,
>> and it will be removed when introducing CONFIG_MGMT_HYPERCALLS on the
>> common/domctl.c in the last.
>>
>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> 
> There is arch_get_info_guest under riscv but it is only a stub so:

As said in reply to other patches, I think those stubs want covering nevertheless.

And btw, this is an example of a patch which would have been entirely unnecessary
(afaict) if the Kconfig setting didn't have a prompt (yet / anymore).

Jan

> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


