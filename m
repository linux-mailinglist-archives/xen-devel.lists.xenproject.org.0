Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F1F942B50
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 11:56:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768403.1179185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ63Z-0000eW-JA; Wed, 31 Jul 2024 09:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768403.1179185; Wed, 31 Jul 2024 09:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ63Z-0000bf-GE; Wed, 31 Jul 2024 09:55:41 +0000
Received: by outflank-mailman (input) for mailman id 768403;
 Wed, 31 Jul 2024 09:55:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZ63Y-0000bZ-6R
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 09:55:40 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09fd9d10-4f23-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 11:55:38 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52efbb55d24so8405603e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 02:55:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acadb9c8esm750630666b.215.2024.07.31.02.55.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 02:55:37 -0700 (PDT)
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
X-Inumbo-ID: 09fd9d10-4f23-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722419738; x=1723024538; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ed7ceqhXLf+okB69zEuFjo6faUVVDojR05FW0aXJBIc=;
        b=NKfZkyy1t6rcUulc99k+Z4rttIpdTDzzeuzVVVK475Cg3Ggjuc1DOfVhrUH8XuEi44
         6ybB3rIbCFm8M+OawMNkn+B/rZLgv+pvSXdaMRFmpPu6hsaHYef2Sb9f3xMRAB+N8kOt
         /6HoqUHWIcaQ7oYVotHENwiTswveHff0cbNNpuf31kf+h8V/t5KyDH++Td2VqXOL/FmN
         eMgZGzA63NbVP1SNr8rg3wvug5OzCM5+mpZhfjVuIqFAgum0haJP55llROir2ko2N/+r
         8i9G7vM1bekY67X10f+tSeB5RqxLGsaBuSlBXKXra8NIRb97KqdzTKxPwbUfH8Id3xk1
         DIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722419738; x=1723024538;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ed7ceqhXLf+okB69zEuFjo6faUVVDojR05FW0aXJBIc=;
        b=XfL8Wh+Bf3t0LVfmaFfuZSxM1qDyOQPiD0k3qC5oV1t9pzozCxron0WoTZxp6AwUlu
         jpKXctnxoVloK2woxQY5Bu5j9FXIeJA2NGyoyx/61Ub26dVVVClliM8bHR6FXPmUUgMZ
         X/gp0YJuVSx8GGkc0XznSPo3lzukZnvpYqJY5S3IOfl/LZNp6kr6KXZucSJi02517hNV
         MApDPtbT/5aAY1DtAZb5SXmfeZYveEtbx5mkG7O13ZPG1doq6LmNJys3wtNhgevY5p9/
         oe6aNnLyYxd4nLey1DFqCO/500c+Y5xp3FTPJSN9JS7vCygJ/OlhJ3t4dNKg1WbsRyVe
         VnkQ==
X-Gm-Message-State: AOJu0YxDj73GilTYdV96a/kufaN6n09hZgMoUQ4zDCaheVuKh9yWpwMQ
	gTVRYLWoYrQrjEziaSYvv0xUo+rWsNruxbbiDWFlxtEdy8DSULb2FXWefuQpNw==
X-Google-Smtp-Source: AGHT+IHmK3kmRG9sh7ggSH2FTdEkGMUZyLHHJRoPLWmeaV/r17jS5IBNs7pIBLVQQnTq5/mUF3iX2Q==
X-Received: by 2002:ac2:51c4:0:b0:52c:e119:7f1 with SMTP id 2adb3069b0e04-5309b2d83bemr14988173e87.51.1722419737457;
        Wed, 31 Jul 2024 02:55:37 -0700 (PDT)
Message-ID: <fa33fbf8-32b6-48dc-a30c-dd76b021a76d@suse.com>
Date: Wed, 31 Jul 2024 11:55:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-3-Jiqian.Chen@amd.com> <Zqnswi7ihOhMxPsi@macbook>
 <0aa0982a-30b3-43cd-9a9e-4542d7cb583f@suse.com> <Zqn014wCEfWhyo1-@macbook>
 <8ff685a6-0cbd-45cd-a818-4535a040c478@suse.com> <Zqn7HEuooChgRCuf@macbook>
 <d65ae152-22ee-4a57-8ff4-43ef0c234f5f@suse.com> <ZqoF55yapMxGN_WM@macbook>
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
In-Reply-To: <ZqoF55yapMxGN_WM@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2024 11:37, Roger Pau Monné wrote:
> On Wed, Jul 31, 2024 at 11:02:01AM +0200, Jan Beulich wrote:
>> On 31.07.2024 10:51, Roger Pau Monné wrote:
>>> I agree with (a), but I don't think enabling PVH dom0 usage of the
>>> hypercalls should be gated on this.  As said a PV dom0 is already
>>> capable of issuing PHYSDEVOP_{,un}map_pirq operations against a PVH
>>> domU.
>>
>> Okay, I can accept that as an intermediate position. We ought to deny
>> such requests at some point though for PVH domains, the latest in the
>> course of making vPCI work there.
> 
> Hm, once physdev_map_pirq() works as intended against PVH domains, I
> don't see why we would prevent the usage of PHYSDEVOP_{,un}map_pirq
> against such domains.

Well. If it can be made work as intended, then I certainly agree. However,
without even the concept of pIRQ in PVH I'm having a hard time seeing how
it can be made work. Iirc you were advocating for us to not introduce pIRQ
into PVH.

Maybe you're thinking of re-using the sub-ops, requiring PVH domains to
pass in GSIs? I think I suggested something along these lines also to
Jiqian, yet with the now intended exposure to !has_pirq() domains I'm
not sure this could be made work reliably.

Which reminds me of another question I had: What meaning does the pirq
field have right now, if Dom0 would issue the request against a PVH DomU?
What meaning will it have for a !has_pirq() HVM domain?

Jan

