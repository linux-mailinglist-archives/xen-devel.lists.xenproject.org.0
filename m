Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C52A3817696
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 17:01:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656203.1024262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFG2i-000779-VZ; Mon, 18 Dec 2023 16:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656203.1024262; Mon, 18 Dec 2023 16:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFG2i-00073r-Si; Mon, 18 Dec 2023 16:00:32 +0000
Received: by outflank-mailman (input) for mailman id 656203;
 Mon, 18 Dec 2023 16:00:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFG2g-00073l-LK
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 16:00:30 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90a96da2-9dbe-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 17:00:29 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c580ba223so41076645e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 08:00:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h12-20020a05600c314c00b0040c45cabc34sm33764727wmo.17.2023.12.18.08.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 08:00:28 -0800 (PST)
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
X-Inumbo-ID: 90a96da2-9dbe-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702915229; x=1703520029; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IzLaWn0KMf/YidDLAgHkGSt4AxBYyErWqcPEZ4LOS+8=;
        b=KaT+60Jx6j4iD5llQ6XrUh2b6iAQr6hem14UKieP2c8oV6Jx54PfOBfJQ9+ZdZhVsQ
         ga51yjSQr6JM38ElwL+1Sah+sHy80PMYh6124T1NVYCH0C2NVxfWDcwQEofSp2NWWA7L
         EfRPoXzmGT5EhXziryl/xREqxgZtviS4nOYdSud2nX4XApqklnHT3+m3mV0w7CUI0+H7
         v65nK6V/PgNcesJMjRSusuYB//EVJofxgMEAnuF/qNC30sA8jUrMelkE5OaOkUKzsqcJ
         oeJDv4XYZT75c1AcrHvlslwuM8e3u0IYrG8Ofah8eYJtV8nigAY8gU7F6nwCedmTb+jB
         jEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702915229; x=1703520029;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IzLaWn0KMf/YidDLAgHkGSt4AxBYyErWqcPEZ4LOS+8=;
        b=aXbFBeqStQkech4mJEW6Y9xviicXmq/FkASyNMALUDuoAKnjYs2qV0YF/HCtgaqN6z
         iga9fCYY9ncctDX+1DcWltA76GYoIktaCQTFpMNavFIGRaAaoKEYZxczhJTw3kn8j/0j
         KXJErhIysV4BLQ6ThDuvbsWXaZ2LcFTBl4/WNeN5aes9cTQ5eEqsDyZMBRttoyEBQ9bA
         8VClhdYY9IH/DERsipd1b95gnH8dXWbY0Zn6J9QRAB3nZUyzzKgasEicmM1DJUuVW4ZJ
         dzlMnmkop2GAh9OSmzkAKznk4t/Mees6PCizILRDVVoKqiB9lu+tmNYlzIwK5//itYOC
         VuWQ==
X-Gm-Message-State: AOJu0Yxsu6wxtkCMNXb7iOPrg+NkY2hf/0dLONWw/ivU/OyWo5CsnDEP
	YVq5D4T3bwVkqlS29WKMBZbM
X-Google-Smtp-Source: AGHT+IE/Lz+OtO8Xz8HKLM7oB8B88u1CvsMuwX2sABB8JlI+kIoORlCPvmAD/w3eThQJ0RcAYhFwFA==
X-Received: by 2002:a05:600c:3781:b0:40c:35c4:a128 with SMTP id o1-20020a05600c378100b0040c35c4a128mr9586078wmr.121.1702915228767;
        Mon, 18 Dec 2023 08:00:28 -0800 (PST)
Message-ID: <e9a0612d-e2f7-4612-95e1-3defdf289db1@suse.com>
Date: Mon, 18 Dec 2023 17:00:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] x86/spec-ctrl: add logic to issue IBPB on exit to
 guest
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <31da79de-bd6b-af95-793a-c16516992bc7@suse.com> <ZYA3Db53Z3fvBlwn@macbook>
 <1c00c3ba-4d10-4cdc-ae2e-ca2fb2157be6@suse.com> <ZYBn1XW0nbyqQoxq@macbook>
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
In-Reply-To: <ZYBn1XW0nbyqQoxq@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.12.2023 16:40, Roger Pau Monné wrote:
> On Mon, Dec 18, 2023 at 02:46:37PM +0100, Jan Beulich wrote:
>> On 18.12.2023 13:11, Roger Pau Monné wrote:
>>> Hello,
>>>
>>> I'm not as expert as Andrew in all the speculation stuff, but I will
>>> try to provide some feedback.
>>>
>>> On Tue, Feb 14, 2023 at 05:10:42PM +0100, Jan Beulich wrote:
>>>> In order to be able to defer the context switch IBPB to the last
>>>> possible point, add logic to the exit-to-guest paths to issue the
>>>> barrier there, including the "IBPB doesn't flush the RSB/RAS"
>>>> workaround. Since alternatives, for now at least, can't nest, emit JMP
>>>> to skip past both constructs where both are needed. This may be more
>>>> efficient anyway, as the sequence of NOPs is pretty long.
>>>
>>> Could you elaborate on the reason why deferring the IBPB to the exit
>>> to guest path is helpful?  So far it just seem to make the logic more
>>> complex without nay justification (at least in the changelog).
>>
>> I've added "(to leave behind as little as possible)" ahead of the 1st
>> comma - is that sufficient, do you think?
> 
> Please bear with me, but I'm still uncertain.
> 
> Even if IBRS is not enabled, and such indirect branch predictions are
> at the same predictor mode, how would that be of any use to a guest?
> My understanding was that the attacker is the one that has to control
> the indirect branch predictor contents in order to attack the
> hypervisor or other guests.

Right; see my later reply.

>>>> ---
>>>> I have to admit that I'm not really certain about the placement of the
>>>> IBPB wrt the MSR_SPEC_CTRL writes. For now I've simply used "opposite of
>>>> entry".
>>>
>>> Maybe it would easier to just add the MSR_PRED_CMD PRED_CMD_IBPB write
>>> to the vmcs MSR load list?
>>>
>>> It's a one-time only AFAICT, as you would only want to do this for
>>> context-switch AFAICT.
>>
>> That would be a back and forth of adding and removing the MSR to/from
>> that list then, which I'm not convinced is helpful. With these special
>> MSRs I would further be uncertain as to their effect when used via one
>> of these lists.
> 
> Hm, we do seem to already use MSR_PRED_CMD with such lists, so I would
> assume they work just fine.

Ah, yes, I forgot about that. Still it would be a back and forth if we
wanted the MSR on the list only after a context switch, but not anymore
for later VM entry. Also iirc these lists are VMX-only?

Jan

> Anyway, was mostly a recommendation towards clarity, because I think
> the return to guest context assembly is getting rather convoluted, and
> it's IMO critical for it to be easy to follow.
> 
> Thanks, Roger.


