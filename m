Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9749F468A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 09:54:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858625.1270876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNTKp-0002ev-D7; Tue, 17 Dec 2024 08:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858625.1270876; Tue, 17 Dec 2024 08:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNTKp-0002dR-8k; Tue, 17 Dec 2024 08:53:43 +0000
Received: by outflank-mailman (input) for mailman id 858625;
 Tue, 17 Dec 2024 08:53:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNTKn-0002dL-On
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 08:53:41 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 699370ae-bc54-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 09:53:40 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-434a766b475so53186125e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 00:53:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436255531b1sm169178895e9.2.2024.12.17.00.53.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 00:53:39 -0800 (PST)
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
X-Inumbo-ID: 699370ae-bc54-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734425620; x=1735030420; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7n2XuaKfUiUjrn3rk1+CMisvlSQprVNO8APALE7RQnY=;
        b=BUNDF8Agh52ZnuzUoE/mp8pp4G4tC4DSrQuHIzWhntgzP5jv8VzT4vvSxZHBER9IlU
         n4Q+rncftMf7kuDTUs+zIjEQYFj2OXifc7SXxxJhuu7SUCYWYQVc8h5THRSGc9OGRYui
         MIvyJcQhGIC3Tf2bc3JqHrmteo2dXaznok1+IQRLpSt+d5VU/YvKZSjIVCL/swyfbgtb
         rVMgcwqolYI8qUw+vSNF+lmHPaf/R/pNJG9fP33/0CZGOuHbbaho1QN6NTwcTu5Z1IOB
         uVxEG52eAZ+zUCR9BeFMy+N+RMFj8hhNMIf9dEskscfWJLTAKbF5ELEgKJuTqVnEcM4f
         uXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734425620; x=1735030420;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7n2XuaKfUiUjrn3rk1+CMisvlSQprVNO8APALE7RQnY=;
        b=Ipvqs2Ol3BoDzQ9Kz/PyzbYVXtdkcF0VZGtwmBdXj0gFNLW4RwPjJjEIvIJN3rC4Pq
         schMbP+oqGk/wnbfNGjlv2LNHtF5GbKZH3JBMNYws3m68JVweRLgOEl4WvCx+cT0Ne/8
         jm0lApx9+YHri4DDpSfd/FxShNiIaEMdZpmDlnQTWGVjlKhJ9LZzQh2U+mqfKo2oWHab
         +zcsfTV430C/FziXeA0Ifp5BJzPlDtypAVu/VGyHvDj7CAyqVstMYM5/lCQg9wEFebQU
         bv2r5+Wdk1a2aoJ7wUv2+l5b3KzlbwtgoHUZD8SmoFG4ZaVCVPZJBPbZj0M4yfY2ae0F
         5xXA==
X-Forwarded-Encrypted: i=1; AJvYcCX54RBhddO98fo3iNQGfvWkYhtYSJecR94IVorbXNp/eVtign2NYJaCSJj8pNMsGW3/eMeJC/SbUws=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2WTCrGjO+fwvq/urzTq42Gd9S29cZStDOlYQWVjiboMnP5PLQ
	BRxYh2GFS1PoxxbDBxlW8HWqmBSY6MDW4trhwM03pMnNJ+EK1UpDjaDbrBv0Ww==
X-Gm-Gg: ASbGncvMVNHmtuKmqd3TvQWzEfSwjONeYzSnAb+MT95SlAfCXP3lgGfFGyIdBEFJdeu
	P8k5I6SIyLtw6IlWvlulsZqb5uX7NjjtytA4RdqTL9fiGjSloo8JOppVfXrNj/TcJSit347TFjz
	mFm5QM2i7K6kgP0oFdHmluh2F0SSLO2ZssrTEDPtma9HzEHB74h3LTX3q2yef43vkr/TO09/aWx
	669ci1WXqFzXtUPLkO6mQtzDCneW3wzmCwMDhmnJ0sjgmYsFYlL5Sc2v6A1Mp8AP0XjJ1znJP6R
	+zhOKd/OIZNXRGKOpDccJ/MI9yXFbUrEvzT02sxQqg==
X-Google-Smtp-Source: AGHT+IG71G/tuI/8acYpYstoc0lqpsSUf3Pvj723OT4bt9re9zKGw4Q41BHmOYbqdxwL9JzSeEUsDQ==
X-Received: by 2002:a05:600c:1c07:b0:434:f739:7ce2 with SMTP id 5b1f17b1804b1-4362aa2e65emr124651755e9.8.1734425620176;
        Tue, 17 Dec 2024 00:53:40 -0800 (PST)
Message-ID: <837391e6-5ffd-4f4a-9bc4-c4431b5b25a2@suse.com>
Date: Tue, 17 Dec 2024 09:53:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: add privcmd ioctl to get p2pdma_distance
To: "Zhang, Julia" <Julia.Zhang@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>, "Chen, Jiqian"
 <Jiqian.Chen@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Penny, Zheng" <penny.zheng@amd.com>, "Zhu, Lingshan"
 <Lingshan.Zhu@amd.com>, Paul Durrant <paul@xen.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Juergen Gross <jgross@suse.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241207105946.542491-1-julia.zhang@amd.com>
 <03504a1e-c801-47fc-ac66-ab7e10ab6695@suse.com>
 <IA1PR12MB6532F32D012A63000F34823AF23B2@IA1PR12MB6532.namprd12.prod.outlook.com>
 <0284d807-ae85-4d43-93b5-91fb29528d62@suse.com>
 <IA1PR12MB65325D9E7C0FA79B1928A646F2042@IA1PR12MB6532.namprd12.prod.outlook.com>
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
In-Reply-To: <IA1PR12MB65325D9E7C0FA79B1928A646F2042@IA1PR12MB6532.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.12.2024 06:53, Zhang, Julia wrote:
> 
> 
> On 2024/12/16 17:19, Jan Beulich wrote:
>> On 16.12.2024 09:18, Zhang, Julia wrote:
>>> On 2024/12/9 15:47, Jan Beulich wrote:
>>> On 07.12.2024 11:59, Julia Zhang wrote:
>>
>> Yet another formality, sorry: Please send plain text emails. You'll note that what
>> I said and why you said is indistinguishably intermixed below.
> 
> Thanks for reminding.
> 
>>
>>> --- a/tools/include/xen-sys/Linux/privcmd.h
>>>
>>> +++ b/tools/include/xen-sys/Linux/privcmd.h
>>>
>>> @@ -110,6 +110,16 @@ typedef struct privcmd_map_hva_to_gpfns {
>>>
>>>     int add_mapping;
>>>
>>>   } privcmd_map_hva_to_gpfns_t;
>>>
>>>
>>>
>>> +typedef struct privcmd_p2pdma_distance {
>>>
>>> +  __u32 provider_bus;
>>>
>>> +  __u32 provider_slot;
>>>
>>> +  __u32 provider_func;
>>>
>>> +  __u32 client_bus;
>>>
>>> +  __u32 client_slot;
>>>
>>> +  __u32 client_func;
>>>
>>> +  __u32 distance;
>>>
>>> +} privcmd_p2pdma_distance_t;
>>>
>>>
>>>
>>> "Distance" typically is a symmetric thing. Why the asymmetry here? And
>>>
>>> why __u32 when __u8 will be fine for most fields? And where's the segment
>>>
>>> part of the device coordinates? Finally, with it being merely stub
>>>
>>> implementations that you add here, all details on where the needed info
>>>
>>> is to come from are missing.
>>>
>>> "Distance" is p2pdma-distance between two PCI devices, it's calculated in kernel driver.I don't get why it's symmetric?
>>
>> Distance from A to B is usually the same as that from B to A. But yes,
>> not necessarily always (thinking of e.g. rings). Yet still I'm unclear
>> about the distinction between provide and client.
> 
> Provider - A driver which provides or publishes P2P resources.
> Client - A driver which makes use of a resource.
> 
> In our case, we want to use passthrough dGPU render data, and virtio 
> iGPU display data. So dGPU need to import display buffer of iGPU. iGPU 
> is provider and dGPU is client.

Right, but: Is this arrangement relevant for the new ioctl? Aren't
you simply after the distance between two devices, of which your
provider/client model is merely a special case?

Jan

