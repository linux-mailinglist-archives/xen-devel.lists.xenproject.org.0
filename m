Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 099BC90A907
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 11:06:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742006.1148720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8JR-0005K9-6K; Mon, 17 Jun 2024 09:06:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742006.1148720; Mon, 17 Jun 2024 09:06:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8JR-0005I0-3b; Mon, 17 Jun 2024 09:06:05 +0000
Received: by outflank-mailman (input) for mailman id 742006;
 Mon, 17 Jun 2024 09:06:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E9YK=NT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJ8JP-0005Hu-Ku
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 09:06:03 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1ee28c2-2c88-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 11:06:02 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a6267778b3aso377286066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 02:06:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56da4486sm495066766b.1.2024.06.17.02.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 02:06:01 -0700 (PDT)
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
X-Inumbo-ID: d1ee28c2-2c88-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718615162; x=1719219962; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gvRmkc7UYREFAt7qwezSV/9vtY87peLc2FPTpzihZiY=;
        b=ZyUAA7cdjPSw27FU+i1Re7krcm6GPgJ2d5k5g0G+VYuXdMzI6OFcNxoNrUo4yu5PYi
         TJ/CDtRW1I4tBEpGf1YQ8OQEJln2kiHzzQfjW6iKuVy2ekAwM+04Mtan1Kn6LtZZ47fP
         4AQE261egi0oo+6cEGl6FtwpR3w5Eq49s2+pW5mjzjhtAHiFJ9owHw/mK+/eMcP3gDbG
         TeJ+y5OMLEI69pDcNTuY70wwCX/iEl2C4fhT72inSh++xwl2zFBzFsPTqZTag91PK9FJ
         6Kl9OYV5Wx55yQ12xUi5TmdbC30fU1z9meMKqGH7Q0c+mxIDRJvKWfSYOEzXpX0PUl7Y
         U7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718615162; x=1719219962;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvRmkc7UYREFAt7qwezSV/9vtY87peLc2FPTpzihZiY=;
        b=T7zjkUZm6OduSd+82KDaSCAO1VXTCZztb98+VBmnZ6yn33rEC/xCJvwIEUpcnk3ssi
         ovQr9i5/zcXWuWW5jGdxLcnxEfmjw94OwSUVfyG6K8XtG2ulG9FB1BtiUmXZGR1r2Hgk
         rOIsU3DoumTd71e3eApYXDsKBriE84WpOy23alM7WG0K/h7hr/U42VrrtURxsGCq/RoZ
         MaiKHu9STGp52Olzyu0f/My4ryjuCRSBqiiqMkhN0z7JTB+UD58e82HV5lHIBG5v4s6i
         sD2MWe8X6/hs57LnmBoQSWXsbCafnUOp0soyqVTm5aYcQFocGBm0Ni5Nksvx+kp0025i
         Eovw==
X-Forwarded-Encrypted: i=1; AJvYcCWs2NZWqaMnJK428YuBJw7DewAbrVHbo5Y+81aWaW4pRas/lwNyWHwmqy1Z5r0kw0+wDXVcwd3swq0pAgOtw2pqHWUVG+kB61+ffyOYvNM=
X-Gm-Message-State: AOJu0YxWZn5w+71mbbbWPt5VWh9bTt51PLqPu50xn+mjXa73rsxpc3b8
	cfpHXoI13vVpc2PQN0Nk5NJWtsjC0zDVUQQBHSt7yf0lMlJi/5KbVV3RUdxu2w==
X-Google-Smtp-Source: AGHT+IFio7W2H3McMW1GKQcHEpdNgG7x0U4Q8MuX4Z8BRf4WELajR7xgxbuujSAPdNrXPTo6eholRw==
X-Received: by 2002:a17:906:f2ce:b0:a6f:1045:d5e2 with SMTP id a640c23a62f3a-a6f60cee9c6mr613581266b.4.1718615161595;
        Mon, 17 Jun 2024 02:06:01 -0700 (PDT)
Message-ID: <b4b14998-8b17-4a22-9c1d-427be61c06a9@suse.com>
Date: Mon, 17 Jun 2024 11:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Design session notes: GPU acceleration in Xen
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Ray Huang <ray.huang@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com> <Zmxxbk-xWp9AjqIB@itl-email>
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
In-Reply-To: <Zmxxbk-xWp9AjqIB@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.06.2024 18:35, Demi Marie Obenour wrote:
> On Fri, Jun 14, 2024 at 08:38:51AM +0200, Jan Beulich wrote:
>> On 13.06.2024 20:43, Demi Marie Obenour wrote:
>>> 2. Add support for `XEN_DOMCTL_memory_mapping` to use system RAM, not
>>>    just IOMEM.  Mappings made with `XEN_DOMCTL_memory_mapping` are
>>>    guaranteed to be able to be successfully revoked with
>>>    `XEN_DOMCTL_memory_mapping`, so all operations that would create
>>>    extra references to the mapped memory must be forbidden.  These
>>>    include, but may not be limited to:
>>>
>>>    1. Granting the pages to the same or other domains.
>>>    2. Mapping into another domain using `XEN_DOMCTL_memory_mapping`.
>>>    3. Another domain accessing the pages using the foreign memory APIs,
>>>       unless it is privileged over the domain that owns the pages.
>>
>> All of which may call for actually converting the memory to kind-of-MMIO,
>> with a means to later convert it back.
> 
> Would this support the case where the mapping domain is not fully
> priviliged, and where it might be a PV guest?

I suppose that should be a goal.

Jan

