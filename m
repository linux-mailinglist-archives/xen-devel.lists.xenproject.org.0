Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F27268C85DE
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 13:49:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724094.1129276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7w58-0000SP-LY; Fri, 17 May 2024 11:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724094.1129276; Fri, 17 May 2024 11:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7w58-0000Pj-Hj; Fri, 17 May 2024 11:49:02 +0000
Received: by outflank-mailman (input) for mailman id 724094;
 Fri, 17 May 2024 11:49:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bw27=MU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7w57-0000Pd-Ko
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 11:49:01 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72ba905e-1443-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 13:48:59 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-51f99f9e0faso2152125e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 04:48:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733becfc2fsm11921323a12.39.2024.05.17.04.48.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 May 2024 04:48:58 -0700 (PDT)
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
X-Inumbo-ID: 72ba905e-1443-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715946539; x=1716551339; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2hxd3kr1Tye406izSZ3XG4RVkVzjFpjePoPxuGJgKA8=;
        b=S/vCfZWuAyo+0FXC3uzmeZWbg+pms5WPBhGgVMxN9EBvmVmfkGHTBCpczkrvccdA3N
         bgIl+Yv+iXM6nvDG4xhmGzLMO90KQpv0iFZCYXVrm5PRws+yzeZrP3U42XoNafc3/WoS
         3fm7nHj6Aip2jXxj9KJKnKDQ3IENvrPFxXogpYufqYY4lmLbHNHdeTlUZBhN/7fJZ78Q
         1Qh8Eu+f4UnZEJ5fF5Six5PQosNIg1PZMsbPJMnUOn48OvMRY5+u5JLu28P8YY0pUG5q
         lJZihTsjxafGDssBBBnK34IimTBNZs7w7uBNCyyTozLJL9xyhpgMuwkLJkf9hkZj+IY6
         lKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715946539; x=1716551339;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hxd3kr1Tye406izSZ3XG4RVkVzjFpjePoPxuGJgKA8=;
        b=wnG7GJfJgdg2vJRBadZFrmJ+bf7kqdSp7bwXcL6we+v6XxSCXDr2/vBjpKzSvB+fMR
         SZZZLrqmI6VDeWKMBPPuQrg6mILYhw54PL9ZoK3tXwJafgtkFdohVsDG2Li/vd1qlnJm
         VoyfWC3fJJaSpt543Z30YuJA+6Sxf+g3VEGRtoHB8ARni6UPeIWOqel6k9mfiHblewOJ
         +iBHUtb90rP3ba1Tgfp1eqFaJ+AMIrn4YcjVDcmq75mmAG5h6P26en6NBX2KWHF6UwDe
         4fPEkoXo4HXLi3QWZpUEzPFgZ7Eh1cAODuROB6pWjQ4s8z5MPSmErr55saeQ3ucp6ebG
         /zBg==
X-Forwarded-Encrypted: i=1; AJvYcCVssQf8CLPI3KAkMRxG427t8lR1ki5EhCzQ5fRlKucZROvhlNNMOaegbnAsXbdkP2f4GBIBOCeARYDMX980FgKh+354m+8jdTAlCGEhcH0=
X-Gm-Message-State: AOJu0YyfmNo/q/CcuqREVtsl9317Z3vPMZ25a7jYS6E8OkkcAm9vii6l
	jGSm7ncFF6Uywb2ezREedfJ/NkShKf1MJ1zrEfYssnBiVi/qhGxVYAyezowIvQ==
X-Google-Smtp-Source: AGHT+IFEGPBKyE6k0AHMBYvNzd4mgAcSiH/hwvlZJo4oDjAPNAtlWf6g97ybINwFJy/c1YMd6QQfww==
X-Received: by 2002:a05:6512:3117:b0:51e:1bed:13b3 with SMTP id 2adb3069b0e04-52210174834mr14898912e87.32.1715946538774;
        Fri, 17 May 2024 04:48:58 -0700 (PDT)
Message-ID: <852fc4fd-0661-45d5-b0c2-6163c6d8984c@suse.com>
Date: Fri, 17 May 2024 13:48:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v8 1/5] xen/vpci: Clear all vpci status of device
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-2-Jiqian.Chen@amd.com>
 <fb708441-b302-4727-8131-62435a54d99c@suse.com>
 <BL1PR12MB5849FCB53BDAB6968536E5A5E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <cdcbb04d-72e8-4555-a67f-9fd28c5c7743@suse.com>
 <BL1PR12MB5849447757191C93B77D19E6E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <0cc1e273-2c42-40ea-a02a-ef8702efc030@suse.com>
 <BL1PR12MB5849CCF9A890A7DA969F6474E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <8d96e75d-5ca1-4276-9ddc-b46b11949fc6@suse.com>
 <BL1PR12MB584920177282E2F65C7A3DD9E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB584920177282E2F65C7A3DD9E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.05.2024 13:01, Chen, Jiqian wrote:
> On 2024/5/17 18:31, Jan Beulich wrote:
>> On 17.05.2024 12:00, Chen, Jiqian wrote:
>>> On 2024/5/17 17:50, Jan Beulich wrote:
>>>> On 17.05.2024 11:28, Chen, Jiqian wrote:
>>>>> On 2024/5/17 16:20, Jan Beulich wrote:
>>>>>> On 17.05.2024 10:08, Chen, Jiqian wrote:
>>>>>>> On 2024/5/16 21:08, Jan Beulich wrote:
>>>>>>>> On 16.05.2024 11:52, Jiqian Chen wrote:
>>>>>>>>>  struct physdev_pci_device {
>>>>>>>>>      /* IN */
>>>>>>>>>      uint16_t seg;
>>>>>>>>
>>>>>>>> Is re-using this struct for this new sub-op sufficient? IOW are all
>>>>>>>> possible resets equal, and hence it doesn't need specifying what kind of
>>>>>>>> reset was done? For example, other than FLR most reset variants reset all
>>>>>>>> functions in one go aiui. Imo that would better require only a single
>>>>>>>> hypercall, just to avoid possible confusion. It also reads as if FLR would
>>>>>>>> not reset as many registers as other reset variants would.
>>>>>>> If I understood correctly that you mean in this hypercall it needs to support resetting both one function and all functions of a slot(dev)?
>>>>>>> But it can be done for caller to use a cycle to call this reset hypercall for each slot function.
>>>>>>
>>>>>> It could, yes, but since (aiui) there needs to be an indication of the
>>>>>> kind of reset anyway, we can as well avoid relying on the caller doing
>>>>>> so (and at the same time simplify what the caller needs to do).
>>>>> Since the corresponding kernel patch has been merged into linux_next branch
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20240515&id=b272722511d5e8ae580f01830687b8a6b2717f01,
>>>>> if it's not very mandatory and necessary, just let the caller handle it temporarily.
>>>>
>>>> As also mentioned for the other patch having a corresponding kernel one:
>>>> The kernel patch would imo better not be merged until the new sub-op is
>>>> actually finalized.
>>> OK, what should I do next step?
>>> Upstream a patch to revert the merged patch on kernel side?
>>>
>>>>
>>>>> Or it can add a new hypercall to reset all functions in one go in future potential requirement, like PHYSDEVOP_pci_device_state_reset_all_func.
>>>>
>>>> I disagree. We shouldn't introduce incomplete sub-ops. At the very least,
>>>> if you want to stick to the present form, I'd expect you to supply reasons
>>>> why distinguishing different reset forms is not necessary (now or later).
>>> OK, if want to distinguish different reset, is it acceptable to add a parameter, like "u8 flag", and reset every function if corresponding bit is 1?
>>
>> I'm afraid a boolean won't do, at least not long term. I think it wants to
>> be an enumeration (i.e. a set of enumeration-like #define-s). And just to
>> stress it again: The extra argument is _not_ primarily for the looping over
>> all functions. It is to convey the kind of reset that was done. The single
>> vs all function(s) aspect is just a useful side effect this will have.
> Do you mean, like:
> enum RESET_DEVICE_STATE {
> 	RESET_DEVICE_SINGLE_FUNC,
> 	RESET_DEVICE_ALL_FUNC,
> 	Others
> };

No. What we need to be able to tell apart in the hypervisor is (at least)
FLR and Conventional Reset. I can't tell right away whether the sub-forms
of the latter also may need telling apart. I expect you to dive into that
and make a good proposal.

Jan

