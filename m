Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA541B0C854
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 17:59:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051621.1419985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udsue-0006OF-Vk; Mon, 21 Jul 2025 15:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051621.1419985; Mon, 21 Jul 2025 15:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udsue-0006MA-Su; Mon, 21 Jul 2025 15:58:48 +0000
Received: by outflank-mailman (input) for mailman id 1051621;
 Mon, 21 Jul 2025 15:58:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1udsud-0006M4-RE
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 15:58:47 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9566141b-664b-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 17:58:46 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so3751623f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 08:58:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c9f1e61f3sm10064316a91.15.2025.07.21.08.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 08:58:45 -0700 (PDT)
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
X-Inumbo-ID: 9566141b-664b-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753113526; x=1753718326; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dwE9rYH9lzYL40seukKguSu3vCglmq8xBOwwoCVW6Ps=;
        b=NMoYyEFkNwqBDliM+3EptqecT4yDynuvPNX9dIwkMnh+oEe/vxrF3gNyMwU5oDq3yD
         8kYMa5+Go1EPAqOdgxFI+UHQpfrM0IbmwUWAJdwg3idtJfwAqODwZMxbBKwwDrRRP7KO
         5feQLPQ2LE7jbz7+PyAOkiN8OtB9JjMD6R3icT9Swnui5xXtxmjf9dZqaTS6vh6v+mFa
         Vn4ynWqfG4cLVoxsprplXGkPGjUVAiX2ukbAMcKejGg9I7c3B0xf0Bad0fg4ZNbTbLhg
         RNwml1Uhsjy2qrP7nRcj3POtzJC1iR4L6v9C4SY1ENqMHEKgROh1Wlxx3CRHCmLivcGb
         3N5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753113526; x=1753718326;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwE9rYH9lzYL40seukKguSu3vCglmq8xBOwwoCVW6Ps=;
        b=ByQfZH/f4a3rHi7s2t2OGg9/ikaCjLiDoZJBjYxIOoNlAjMhrn8QaUA3QM6NdpOejr
         tZkAtf9G3iuaclWbV5+UiBhGVoCXmZDX7IIa0FPhK3yyVNPLLMHjC8qQeOEPpXcMyweW
         w9wvP9qIvV8YKFQhGiYrwBLL6yzL3ST8o3FqAyvPjsMBm8LgHKHey4zCxNbC10mOVRE6
         gBruEIsN7eC0Q24hvBc/WG+DSoKrPul5kMw9GQBghisCokTQBm12i/4WKLOJc4ZuqUDp
         02jCutLmVnt4zmMnfDGtSFJKH6vUjkOdvQ9nXVLMN6EhFZH5g4dA4knCo/X6lbvA8UuO
         sVkg==
X-Gm-Message-State: AOJu0YyZ9YQ9o5X1dj/ZD5ligdaC/ExgpKOadSHJAm3szmcJTFNexSeH
	MBl5tqO2whXTJCG3izf8zTbXYnb73dSK9dI8wFJRvbKrq6vh+PiXiDuZJ96gTJhg5A==
X-Gm-Gg: ASbGnctrG/OWpzq31CFG3kBW7/m0ut12w7Vk31bElO08CPVMV9ckT6pw558UhkZB+AL
	JtW5lXbT9rBQviHuclVzS/YeHVKErzdjhb2IyAidxzUZ4iWbAXi8plXwpd3EwVwhV2dMinEvn+V
	pfU3lJgZKQvK+DddRvYGTi5OSMd7LZ/mNtE9RLPEdfgmwdndPTybTzg7TullKeUizx8EscB4RwJ
	fLVhpVEj9n7Z1APe59Vz3t6C+/lsjOp9nMR/1g2fpmddhYaGbr+vn8jt0N1ErKxs2selCq7JYHH
	PZwXxhpc9PW2qMWLWHF7c4eBDvwfD00dDkyHXQfxYGqGm6NqQqkkegsLoHm8caZb/hbFpU6g/ay
	6GwDF4zFcm4SVeFHhTno34M4EFWSAH8jv4SwdUNYteMPGhROFj7KjJFgfu9m2kIeANGSD+9dp1A
	r9406nJT4=
X-Google-Smtp-Source: AGHT+IGWcg3AnkU5rnzOkEsG10ePOk3+tzC+DsD9CBS2fknC9LcHALu6xGpGRiIAyEP46TS3kjMsYg==
X-Received: by 2002:a05:6000:706:b0:3a6:e2d5:f14c with SMTP id ffacd0b85a97d-3b60e4f2bffmr13831615f8f.30.1753113525819;
        Mon, 21 Jul 2025 08:58:45 -0700 (PDT)
Message-ID: <d7194bc5-d39e-492a-98d2-9703b20a8aae@suse.com>
Date: Mon, 21 Jul 2025 17:58:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/livepatch: fixup relocations to replaced symbols
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20250716160007.92461-1-roger.pau@citrix.com>
 <CAG7k0Epu6XomC=b7eG8xgcVvXpmoTOUQdC7yD9LsmEHOKTv-gg@mail.gmail.com>
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
In-Reply-To: <CAG7k0Epu6XomC=b7eG8xgcVvXpmoTOUQdC7yD9LsmEHOKTv-gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.07.2025 17:51, Ross Lagerwall wrote:
> On Wed, Jul 16, 2025 at 5:00 PM Roger Pau Monne <roger.pau@citrix.com> wrote:
>>
>> In a livepatch payload relocations will refer to included functions.  If
>> that function happens to be a replacement for an existing Xen function, the
>> relocations on the livepatch payload will use the newly introduced symbol,
>> rather than the old one.  This is usually fine, but if the result of the
>> relocation is stored for later use (for example in the domain struct),
>> usages of this address will lead to a page-fault once the livepatch is
>> reverted.
>>
>> Implement a second pass over relocations once the list of replaced
>> functions has been loaded, and fixup any references to replaced functions
>> to use the old symbol address instead of the new one.  There are some
>> sections that must be special cased to continue using the new symbol
>> address, as those instances must reference the newly added livepatch
>> content (for example the alternative patch sites).
>>
> 
> Would it be possible to fix this at build time instead by generating the
> payload such that relocations to changed functions always point at the
> Xen function rather than the included function?

How would you express the difference in the object file? If that's possible
(without problematic heuristics), ...

> This seems preferable to me rather than making the runtime code more
> complicated.

... I agree this would be quite a bit better.

Jan

> Of course, neither approach would fix all cases - if the function is
> completely new calling it would still page-fault after reverting the
> live patch - so the usual care needs to be taken when creating live
> patches.
> 
> Ross


