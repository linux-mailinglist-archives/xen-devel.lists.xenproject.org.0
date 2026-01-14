Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E743D1F90D
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 15:57:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203305.1518543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg2J0-0001rv-F9; Wed, 14 Jan 2026 14:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203305.1518543; Wed, 14 Jan 2026 14:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg2J0-0001pS-BX; Wed, 14 Jan 2026 14:57:06 +0000
Received: by outflank-mailman (input) for mailman id 1203305;
 Wed, 14 Jan 2026 14:57:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vg2Iy-0001ot-LC
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 14:57:04 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 492eb651-f159-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 15:57:03 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47ee937ecf2so2339455e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 06:57:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5df9afsm53541486f8f.24.2026.01.14.06.57.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 06:57:02 -0800 (PST)
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
X-Inumbo-ID: 492eb651-f159-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768402623; x=1769007423; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b+DD+G3OdKM2V2MVTBspeY6HuZPJY/nZDtUKjPKR3uI=;
        b=PtUZncYP0CY9lYaKBQDS1LKM8DrPduwpbCu2UZrbIJZiEtjjpFPkuDTn4/dM3TGACw
         9M8AmFzl9/z/v+/2pd/uditXjGtK3MCKxXgR6AX1Ps5OBrzzeFT/4cYWkn2xeB/d2rf4
         dk759rQkQ+2fY+jc6vyMiyyp0YTlU88JMyN8I5pPnc+/iMdpilve9pJmsBYnVkUuCnI9
         Cal7irPkcpkOFD2u7IE6WSnXvgsiimJBELAl5Mfwo9R7DrnHxqp45mmR4wGG0LvBfggg
         uQtDVTQIN5lL/ZuRZ7wcsuWGRWMORsj1PK3u45XwsjmqRzFPrjEH1jsjS0IZB9ztG40d
         tZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768402623; x=1769007423;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+DD+G3OdKM2V2MVTBspeY6HuZPJY/nZDtUKjPKR3uI=;
        b=uzV5QR62NQqBWzinmdkgTr+n7QCzwN8NZlkmXCvmCSUhGNFOUri2rt8j+s3VaMD2nI
         s7ripkMQCQeCbUDtG62xIoKC90okBoa8ZowhA/YRHQrF0b5Yzmyr/uQmB9e3NwqwhMok
         DmiQVyt/BusmriKN1FLAAnST3onocFxa616AhGgUhMu4RhVW/Kniea9BCM1z2GfDmnBe
         6Qh///yujXB6i6Hg2xDKeMYsm4MkLJMnx+xB6Ey8ctOqZ77V+sZqqjrLaAFhPnZdKCW/
         BHf2otPyOGjsKWVzY++pZUVIuWlK7Q7VPKOdLGNT+qf6tGkB0uXIzwdyuLqmewDefWJw
         1Cgg==
X-Forwarded-Encrypted: i=1; AJvYcCWakFWixZk1VCbax9yiXCIFnvzkPsq3PexWSRDD+VuTUTa61TSgK84NLhuq90m5D+CiZPWlR/F8n+A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPbKuJ4GBa3TD4g20DgotCCP2oGL/kzLlRAU0tURdzJ9bq+TkT
	EABf++9cZuMU8Jc4OreW8uU/OHJw35zQNzf+v3pNWJiNQTw3Ue0szFfNHBg2CR7uWQ==
X-Gm-Gg: AY/fxX7HC2QwitxdmwWVXzzoTsKnUQ40ikuzbHouhJwp7pc7DOUCX/NfWS5cAPw+3E6
	JvYlZPHffpKh+kjzG7Pzy5/jy98gwrvSCQQ4YZ7ucGk93sisnJ+yw/qCIXPH/XyJPS6iqdZ/zLA
	rW0y0FnyGWtakowjv+ULaPhBnZsE+KkWdsUUOc9Z+9wN8hgpv5YKJ5jlEeV/c8/vspOJ8ZvVVSy
	pCCNJOkpYkL7nGL5Z9q5I74HBP67qdOlvFI/Z4KAHidwvKsGaPyVbg+bzjgDMBei+yuc8wzaBO6
	Jvgpb8l9wFb4QnavsiA7VTE8a+/WWGfdavLNL7S1980El+BvWc47boAbvelgfZkq8CCGAGSC8wQ
	siyXcO+Cit3PTLnl5FjD677c9gktk+H6ZUkcy7F2pZlOHnbB6WOVFP19OAKe6yRRn6MgAmNFfpL
	8y4rlCg2GmZVahY/OQmseddTbGeTj5e0GGagoJaj7zBX0XrUkTiiMMhdYvHqpk2uMIrYQvdlYSM
	CPvyhdbqheusA==
X-Received: by 2002:a05:600c:5701:b0:47a:8383:f2b2 with SMTP id 5b1f17b1804b1-47ed7c4ebe3mr64087655e9.17.1768402622658;
        Wed, 14 Jan 2026 06:57:02 -0800 (PST)
Message-ID: <62c22b34-cbad-40f2-a367-ba5fd8d11b51@suse.com>
Date: Wed, 14 Jan 2026 15:57:01 +0100
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
In-Reply-To: <b0131e35-3c1b-4e42-9f80-07d246a5df69@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.01.2026 13:27, Oleksii Kurochko wrote:
> On 1/13/26 4:12 PM, Jan Beulich wrote:
>> On 13.01.2026 15:44, Oleksii Kurochko wrote:
>>> On 1/8/26 11:28 AM, Jan Beulich wrote:
>>>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
> Therefore, there is no real need to intercept accesses to these registers.

With this ...

>> you'd also need to synchronize both paths, I suppose.
> 
> I didn't get you what is needed to be synchronized. Could you please explain?

... there's nothing to synchronize.

>>>>> +    {
>>>>> +        stop_timer(&t->timer);
>>>>> +
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    set_timer(&t->timer, expires);
>>>> See the handling of VCPUOP_set_singleshot_timer for what you may want to
>>>> do if the expiry asked for is (perhaps just very slightly) into the past.
>>> I got an idea why we want to check if "expires" already expired, but ...
>>>
>>>> There you'll also find a use of migrate_timer(), which you will want to
>>>> at least consider using here as well.
>>> ... I don't get why we want to migrate timer before set_timer() here.
>>> Could you please explain that?
>> Didn't I see you use migrate_timer() in other patches (making me assume
>> you understand)? Having the timer tied to the pCPU where the vCPU runs
>> means the signalling to that vCPU will (commonly) be cheaper.
> 
> I thought that migrate_timer() is needed only when a vCPU changes the pCPU
> it is running on to ensure that it is running on correct pCPU after migrations,
> hotplug events, or scheduling changes. That is why I placed it in
> vtimer_restore(), as there is no guarantee that the vCPU will run on the
> same pCPU it was running on previously.
> 
> So that is why ...
> 
>> Whether
>> that actually matters depends on what vtimer_expired() will eventually
>> contain. Hence why I said "consider using".
> 
> ... I didn't get why I might need vtimer_expired() in vtimer_set_timer()
> before set_timer().
> 
> vtimer_expired() will only notify the vCPU that a timer interrupt has
> occurred by setting bit in irqs_pending bitmap which then will be synced
> with vcpu->hvip, but I still do not understand whether migrate_timer()
> is needed before calling set_timer() here.

Just to repeat - it's not needed. It may be wanted.

> Considering that vtimer_set_timer() is called from the vCPU while it is
> running on the current pCPU, and assuming no pCPU rescheduling has
> occurred for this vCPU, we are already on the correct pCPU.
> If pCPU rescheduling for the vCPU did occur, then migrate_timer() would
> have been called in context_switch(),

Even if the timer wasn't active?

Jan

> and at the point where
> vtimer_set_timer() is invoked, we would already be running on the
> correct pCPU.
> 
> ~ Oleksii
> 


