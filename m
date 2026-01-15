Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C498D22F33
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 08:52:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204212.1518952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgI9N-0002yD-37; Thu, 15 Jan 2026 07:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204212.1518952; Thu, 15 Jan 2026 07:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgI9N-0002vA-09; Thu, 15 Jan 2026 07:52:13 +0000
Received: by outflank-mailman (input) for mailman id 1204212;
 Thu, 15 Jan 2026 07:52:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgI9L-0002l1-Ad
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 07:52:11 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18a8f5c3-f1e7-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 08:52:10 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-432d2c7dd52so463058f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 23:52:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af6b29cfsm4233532f8f.27.2026.01.14.23.52.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 23:52:09 -0800 (PST)
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
X-Inumbo-ID: 18a8f5c3-f1e7-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768463530; x=1769068330; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G04VNH9mM5QJYcfrwDmtk2vbND5eL1Ze1p1mnEyfR7g=;
        b=DVH0HbHJ/uwSgWAxwbxD81cIkyzLMbUvysMiQVdHJ5BC0Dp+5xifZ2kun/kJ9D/krJ
         C2Dsqcb/JAy4F5cssteN5HzTNNqlVsaosdaB/AmVXv0wVBTP2+fhN4ioXYK+Yp7Y+qO6
         dEmhWfBEDWTs5rsg3ga+yGC1/2B5Kz1sYZQeDe9vMShGfQXYFCLo5QFFozRHa7yA+TrF
         2zT5ha8XB0fWM/EfM3Af7QjVKiBkZTn9Pq48wS2hYrT4hBNqzJijtvabE01n91mYzApV
         d4PQc8qPnJheWNQqjHYTTZancOVgiRhuaeGEtz7Un57Z6IVJh6SLKIUt+NQoP/xwLzMc
         ZFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768463530; x=1769068330;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G04VNH9mM5QJYcfrwDmtk2vbND5eL1Ze1p1mnEyfR7g=;
        b=ZWyBw6zYg9MPBRlIYtDpd4dRORSmpc3/0u0ij/fdwvtsnaekG6DSiSAXjF0ydX36zK
         +AJDytNFDJVDldrAs6opw4HlnQ62QgOcoeETr0r1apL8eYDmBRB3Kty3aTp7u4cwriVG
         sNgdft1aorltvTjuV+OL0s6MxobeWQiNAK4gzBKNtNWK6VmJgyyvIxZ3eVqponTohvR3
         LXSrUPcbu6Mo6cWs0mzhjv2TUcXJVGJ+rhdsBZnzUlgZ7WiERqap30kd+YdC9/fYrsHF
         0Osfi/tO+8pTZIIj2lbc71C0EELBpfbfNEsw5JZxVTRptvtnGPoMcQ3LtAs5rdLSU+sO
         oYNw==
X-Forwarded-Encrypted: i=1; AJvYcCXy0UUtJIWNT66KvDczrjwFAiL9AAq036Phuf5gTpvuCuHC1ftolJqb2nEUSpNdJCrd7ti/xvJ5boE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPR+7/1mnhxcGmlOZf1D+ucm4HXtNUFWV5zy7TjgyKmpp+XTE0
	ut+3Cnn2We1nb0X1iWdv5O8hUNqFlO7JhRF2kC/FduLkTI4uJtjyw8dYwLjA/aH9Zg==
X-Gm-Gg: AY/fxX5ekP9ojbZQhwNV/XWMIwgJASYFxdHezalNocOWzzGUUUzsUt2vCAA29HYN4Ug
	UkgqLP1+Vb58OhqxZe4AKkLD9xsU+dX2alZ69je3eE0nRTUBHSffWUJxrLIlucnA47ByWq5Momf
	E6RT+0XWpJeRZBDGyG0dpWOl+idVGPKIQlPul943v3Pqrlcl1uYda6wz1FxSEa3eArnpOXrbiO7
	R61sR7p8hpx5wauzMxygMJS+vbuJerMb4CZEGBEliyH34aj1pi5iWg6PxMlTwIjqORGPoFDwpQf
	+vUk5ljFAb+vqs29zuAEpALdMtILtGyVzZ/kmPZR77EDcjKQIPebUA8eLNO5S2jWwbs7eEJmMFI
	vG/SkfAzu1aGFn/3fig+0PRpF6h03fRFc8+a5ulS7gYxxHpM4Di9JeLiS2Ic5sbxHnPanQpoWqv
	uT1qYeoFtRntBSH0f+R5kkXqATW1Wji7jDwsqGSb/bWtkpbAd7f//IfpEjVIiRm0eH7PwdyyLAD
	x8=
X-Received: by 2002:a5d:5d83:0:b0:432:5bf9:cf22 with SMTP id ffacd0b85a97d-4342c4f4c89mr5829537f8f.3.1768463529727;
        Wed, 14 Jan 2026 23:52:09 -0800 (PST)
Message-ID: <8fa84e68-72b6-4578-9c3b-70d85d268c53@suse.com>
Date: Thu, 15 Jan 2026 08:52:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/15] xen/riscv: introduce vtimer_set_timer() and
 vtimer_expired()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <8cd3efa488b3da2a6751c92d20bbfeb87b3ba39a.1766595589.git.oleksii.kurochko@gmail.com>
 <f8808dd1-d571-49ea-8739-ed06dd6c79d1@suse.com>
 <4e18e4fc-de62-44fc-8ea0-517f6c7ef47f@gmail.com>
 <f7a47af4-6523-4d92-9beb-0daf639f2f36@suse.com>
 <b0131e35-3c1b-4e42-9f80-07d246a5df69@gmail.com>
 <62c22b34-cbad-40f2-a367-ba5fd8d11b51@suse.com>
 <5c6eff93-0db7-4382-8365-6b32b17f5f4d@gmail.com>
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
In-Reply-To: <5c6eff93-0db7-4382-8365-6b32b17f5f4d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.01.2026 16:59, Oleksii Kurochko wrote:
> 
> On 1/14/26 3:57 PM, Jan Beulich wrote:
>> On 14.01.2026 13:27, Oleksii Kurochko wrote:
>>> On 1/13/26 4:12 PM, Jan Beulich wrote:
>>>> On 13.01.2026 15:44, Oleksii Kurochko wrote:
>>>>> On 1/8/26 11:28 AM, Jan Beulich wrote:
>>>>>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>>>>>> +    {
>>>>>>> +        stop_timer(&t->timer);
>>>>>>> +
>>>>>>> +        return;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    set_timer(&t->timer, expires);
>>>>>> See the handling of VCPUOP_set_singleshot_timer for what you may want to
>>>>>> do if the expiry asked for is (perhaps just very slightly) into the past.
>>>>> I got an idea why we want to check if "expires" already expired, but ...
>>>>>
>>>>>> There you'll also find a use of migrate_timer(), which you will want to
>>>>>> at least consider using here as well.
>>>>> ... I don't get why we want to migrate timer before set_timer() here.
>>>>> Could you please explain that?
>>>> Didn't I see you use migrate_timer() in other patches (making me assume
>>>> you understand)? Having the timer tied to the pCPU where the vCPU runs
>>>> means the signalling to that vCPU will (commonly) be cheaper.
>>> I thought that migrate_timer() is needed only when a vCPU changes the pCPU
>>> it is running on to ensure that it is running on correct pCPU after migrations,
>>> hotplug events, or scheduling changes. That is why I placed it in
>>> vtimer_restore(), as there is no guarantee that the vCPU will run on the
>>> same pCPU it was running on previously.
>>>
>>> So that is why ...
>>>
>>>> Whether
>>>> that actually matters depends on what vtimer_expired() will eventually
>>>> contain. Hence why I said "consider using".
>>> ... I didn't get why I might need vtimer_expired() in vtimer_set_timer()
>>> before set_timer().
>>>
>>> vtimer_expired() will only notify the vCPU that a timer interrupt has
>>> occurred by setting bit in irqs_pending bitmap which then will be synced
>>> with vcpu->hvip, but I still do not understand whether migrate_timer()
>>> is needed before calling set_timer() here.
>> Just to repeat - it's not needed. It may be wanted.
>>
>>> Considering that vtimer_set_timer() is called from the vCPU while it is
>>> running on the current pCPU, and assuming no pCPU rescheduling has
>>> occurred for this vCPU, we are already on the correct pCPU.
>>> If pCPU rescheduling for the vCPU did occur, then migrate_timer() would
>>> have been called in context_switch(),
>> Even if the timer wasn't active?
> 
> Yes, migrate_timer() is called unconditionally in vtimer_restore() called
> from context_switch(). migrate_timer() will activate the timer.

Which is wrong?

Jan

