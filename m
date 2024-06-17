Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB96E90A93D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 11:14:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742041.1148741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8Qo-0008Hz-4F; Mon, 17 Jun 2024 09:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742041.1148741; Mon, 17 Jun 2024 09:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8Qo-0008F8-1J; Mon, 17 Jun 2024 09:13:42 +0000
Received: by outflank-mailman (input) for mailman id 742041;
 Mon, 17 Jun 2024 09:13:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E9YK=NT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJ8Qm-0008Es-NO
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 09:13:40 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2db5e74-2c89-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 11:13:40 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a6f7b785a01so148881966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 02:13:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56da3f95sm493443566b.35.2024.06.17.02.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 02:13:39 -0700 (PDT)
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
X-Inumbo-ID: e2db5e74-2c89-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718615619; x=1719220419; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4yd9cS+9NgACeGGqFmVFjNC48jcTsi3TlckJVh/Dcno=;
        b=H2r8BZdniQ9triOvFCfaIrntv1WEvu2Dh2BTgId6+HqcvEeS1xELvlADjBVPOQYRjw
         31zFumBBjX1JXut8aGCtCxWjtCpdU3uWqKWYYJvv0Zbwv2GZeMRk3i3MussZKRC1GH20
         eVQD6xEallzgtdPRPyaagz8JO1KDWH2gnJg8rQbG4+QooexbYOwkgtZVW1r0cHcNgr90
         lQdrEkz0No8PX1kyTglAcJfeRMgMIzw28gESfwNJEJkDNXZVoSvFG7RygooKvFUBnMvx
         WXLDZTEJ2J31bnZJHmzHDR4KjVcL3RpmHViZdi02SI+wgtaG6smbt7EpMn1zGsfMY1RH
         ZyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718615619; x=1719220419;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yd9cS+9NgACeGGqFmVFjNC48jcTsi3TlckJVh/Dcno=;
        b=QH+Rc9EzKp7lQDq6g/aN0AvUfQt1PdeehComV62rnUHkoeQ6ZQ+5bBVeIeBY1aCy0X
         ZNFPDuJ3Q0Zn3tiA6Lhf08dj0x92H2ARdwHddQC/uVbIQLJg1RJwTFYmeiQ89eiVMVsC
         eJ30T+VjUAtClBNM4421UWtKl3itqEDirCSj7z9D+kQPwhXP2cV2rRTuUxmAxwWcnqHd
         u+G407etWCoC8hUhfdOVrpcPpP8x+b02jVNRAqJRqX/NKRqLX6uWhDysve5xbihHUlvX
         E3Zm8ySpYKPXrecd/XFD1gPMMIpgGmyu/usqX4Eo1j+/kCVNxBZpfk1DQxZVulcre2oJ
         pHLw==
X-Forwarded-Encrypted: i=1; AJvYcCXfEx6Soazqh7jRZ75gN0TqNu++ZNzcX9C1GmqusQUXFahkyTfwYENVosBqRPxUL8qujY75EDUQJhzvrDv91hWxRlu8OuWFLsi/V14Ixfw=
X-Gm-Message-State: AOJu0Ywhw8g9GnZi0AC0F91QaINMgNp9+JaAIkCOnWENSq5uNcoh1PhR
	hg64CLWQ9P0Aan6glQkD2OsBqtw1JuKuc2csU1/HkHaLIziz3Po8ftnvHGh0yw==
X-Google-Smtp-Source: AGHT+IGG5dlCWB94gjTkoE8In0wIC7uKXOwvuiZm48Pj0Jxu09QELuO+4BrOhFsXbCceKT1vkCYTpQ==
X-Received: by 2002:a17:906:22db:b0:a6f:49b1:dec5 with SMTP id a640c23a62f3a-a6f60d421d0mr507882666b.46.1718615619460;
        Mon, 17 Jun 2024 02:13:39 -0700 (PDT)
Message-ID: <7898be60-3126-456a-ac0e-b7dbd26e0764@suse.com>
Date: Mon, 17 Jun 2024 11:13:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Design session notes: GPU acceleration in Xen
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Ray Huang <ray.huang@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com> <ZmvvlF0gpqFB7UC9@macbook>
 <af1f966b-b28f-4a14-b932-3f1523adeff0@suse.com> <ZmwByZnn5vKcVLKI@macbook>
 <Zm-FidjSK3mOieSC@itl-email>
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
In-Reply-To: <Zm-FidjSK3mOieSC@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.06.2024 02:38, Demi Marie Obenour wrote:
> On Fri, Jun 14, 2024 at 10:39:37AM +0200, Roger Pau Monné wrote:
>> On Fri, Jun 14, 2024 at 10:12:40AM +0200, Jan Beulich wrote:
>>> On 14.06.2024 09:21, Roger Pau Monné wrote:
>>>> On Fri, Jun 14, 2024 at 08:38:51AM +0200, Jan Beulich wrote:
>>>>> On 13.06.2024 20:43, Demi Marie Obenour wrote:
>>>>>> GPU acceleration requires that pageable host memory be able to be mapped
>>>>>> into a guest.
>>>>>
>>>>> I'm sure it was explained in the session, which sadly I couldn't attend.
>>>>> I've been asking Ray and Xenia the same before, but I'm afraid it still
>>>>> hasn't become clear to me why this is a _requirement_. After all that's
>>>>> against what we're doing elsewhere (i.e. so far it has always been
>>>>> guest memory that's mapped in the host). I can appreciate that it might
>>>>> be more difficult to implement, but avoiding to violate this fundamental
>>>>> (kind of) rule might be worth the price (and would avoid other
>>>>> complexities, of which there may be lurking more than what you enumerate
>>>>> below).
>>>>
>>>> My limited understanding (please someone correct me if wrong) is that
>>>> the GPU buffer (or context I think it's also called?) is always
>>>> allocated from dom0 (the owner of the GPU).  The underling memory
>>>> addresses of such buffer needs to be mapped into the guest.  The
>>>> buffer backing memory might be GPU MMIO from the device BAR(s) or
>>>> system RAM, and such buffer can be paged by the dom0 kernel at any
>>>> time (iow: changing the backing memory from MMIO to RAM or vice
>>>> versa).  Also, the buffer must be contiguous in physical address
>>>> space.
>>>
>>> This last one in particular would of course be a severe restriction.
>>> Yet: There's an IOMMU involved, isn't there?
>>
>> Yup, IIRC that's why Ray said it was much more easier for them to
>> support VirtIO GPUs from a PVH dom0 rather than classic PV one.
>>
>> It might be easier to implement from a classic PV dom0 if there's
>> pv-iommu support, so that dom0 can create it's own contiguous memory
>> buffers from the device PoV.
> 
> What makes PVH an improvement here?  I thought PV dom0 uses an identity
> mapping for the IOMMU,

True, but see how Roger mentioned PV IOMMU (which would allow a domain
to move away from this identity mapping).

Jan

> while a PVH dom0 uses an IOMMU that mirrors the
> dom0 second-stage page tables.  In both cases, the device physical
> addresses are identical to dom0’s physical addresses.
> 
> PV is terrible for many reasons, so I’m okay with focusing on PVH dom0,
> but I’d like to know why there is a difference.


