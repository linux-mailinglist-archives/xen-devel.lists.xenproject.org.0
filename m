Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9E8804BF0
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 09:11:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647451.1010582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAQVq-0001AY-UN; Tue, 05 Dec 2023 08:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647451.1010582; Tue, 05 Dec 2023 08:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAQVq-00018b-Rk; Tue, 05 Dec 2023 08:10:38 +0000
Received: by outflank-mailman (input) for mailman id 647451;
 Tue, 05 Dec 2023 08:10:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAQVp-00018V-Na
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 08:10:37 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c47b81cd-9345-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 09:10:35 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33334480eb4so3597051f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 00:10:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c12-20020a056000104c00b00333339e5f42sm10476756wrx.32.2023.12.05.00.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 00:10:34 -0800 (PST)
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
X-Inumbo-ID: c47b81cd-9345-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701763835; x=1702368635; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LciaDmhsaDXGS8lo6shpwLxWi2FhY2LeHEF8/hywLro=;
        b=CeyHBnXaLJtSi/080tl8LdfZgq1ODped2oHwCkeJZ7wK/FSw/wb/otc60c53q0D0fz
         1yqbKp4uAidB30PLmOIGUWRvOWILyOkMRuOM5UD70sbjMirgxVrFfKVwQgyMT5EtpN+q
         AFWBgZzc/b1euFxRxtic1afiEtl0VHQY/9rMHjxw6fayjr4qtGodkgzbA3Arp36cKSt3
         onUXgr4sghmFHmwQr204BRVek89TNsnkVwJbC10AHLfRfVJeV0t58LvftDUpZT3bxaq9
         UtQiYNgMiuhqzmXVDcj5gz6XCYTCvOSzINwbhglDs1WlNCuVUv2fysRXrlWx7kzuxkX9
         ROJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701763835; x=1702368635;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LciaDmhsaDXGS8lo6shpwLxWi2FhY2LeHEF8/hywLro=;
        b=SvYn/+q75BeYUddnm6xMtBfxtPF0YYoA19uzhFTXQT3Adtt7m+D0dsbd+66XcYtXw4
         164om9dTM71AIwBGZdevL8QLCqNIjIy0xzlb06uG0Xf3PZwAnUsN05oAs4NpX0apeMiY
         fSP1uXpebCGoCBTJGjRWzlH/iMKY5/vam/fsi8t0oy5vTPrPq+fsHdGWXQ2pQRk+RKuA
         Zid68RxYmAeyPjlT/eKJGDOMy9oaNXo9EzYqhx9mLUbAsgfqZI6yYnwECwmKs70FBnxF
         YqmcHTas9qM2+UikgXsowF4ttbD1gh/tgw46SieFRetUTboODUCVi7AI6nkKdA/vfgSw
         2nvw==
X-Gm-Message-State: AOJu0YwQSs/jn2jvUfl5JPe01VfVHR3yCNIYgoXZzDU8tRGMfi1uehm3
	9Ic2/8+hv9VoXxfImhhc45A1
X-Google-Smtp-Source: AGHT+IFMY/G2MDEkU/lmXuMl6SekHVdmvlq1ncCo2xjGNuLmDhrSeuJwIgPH/3IU4lKVwQRnUqqxOQ==
X-Received: by 2002:adf:fd45:0:b0:333:3e39:8ff3 with SMTP id h5-20020adffd45000000b003333e398ff3mr2230547wrs.57.1701763835018;
        Tue, 05 Dec 2023 00:10:35 -0800 (PST)
Message-ID: <1692a83f-e483-42be-b781-18e9ca4f4804@suse.com>
Date: Tue, 5 Dec 2023 09:10:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC KERNEL PATCH v2 1/3] xen/pci: Add xen_reset_device_state
 function
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
References: <20231124103123.3263471-1-Jiqian.Chen@amd.com>
 <20231124103123.3263471-2-Jiqian.Chen@amd.com> <87edg2xuu9.ffs@tglx>
 <BL1PR12MB5849F2E24E00BF7B20A0B4A6E786A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <alpine.DEB.2.22.394.2312041331210.110490@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312041331210.110490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

(reducing Cc list)

On 04.12.2023 22:31, Stefano Stabellini wrote:
> On Mon, 3 Dec 2023, Chen, Jiqian wrote:
>>>> vpci device state when device is reset on dom0 side.
>>>>
>>>> And call that function in pcistub_init_device. Because when
>>>> we use "pci-assignable-add" to assign a passthrough device in
>>>> Xen, it will reset passthrough device and the vpci state will
>>>> out of date, and then device will fail to restore bar state.
>>>>
>>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>>
>>> This Signed-off-by chain is incorrect.
>>>
>>> Documentation/process/submitting-patches.rst has a full chapter about
>>> S-O-B and the correct usage.
>> I am the author of this series of patches, and Huang Rui transported the v1 to upstream. And now I transport v2. I am not aware that the SOB chain is incorrect.
>> Do you have any suggestions?
> 
> I think he means that your Signed-off-by should be the second one of the
> two as you are the one submitting the patch to the LKML

But that's not really correct either, as it then doesn't represent the
sequence of events. The first S-o-b normally is the (original) author's,
isn't it?

Jan

