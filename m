Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8BAB1C529
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 13:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071668.1435092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujcZ1-00073a-RE; Wed, 06 Aug 2025 11:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071668.1435092; Wed, 06 Aug 2025 11:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujcZ1-00071p-O7; Wed, 06 Aug 2025 11:44:11 +0000
Received: by outflank-mailman (input) for mailman id 1071668;
 Wed, 06 Aug 2025 11:44:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z+Xv=2S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujcZ1-0006az-Ai
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 11:44:11 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa5a6cf5-72ba-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 13:44:09 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-615c8ca53efso11088841a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 04:44:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c0a4sm1081901366b.109.2025.08.06.04.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 04:44:08 -0700 (PDT)
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
X-Inumbo-ID: aa5a6cf5-72ba-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754480649; x=1755085449; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xVK9KjsbV12CCY/MkUED+7oiaOwgxA00Dk6+a2LEY8o=;
        b=RBLDeD6zdDFAHFf4niCbpniEE7vEbPuUfIPLoMhhVGX22c5y/+LatqGEJXALK2Z14N
         zk/sXnEze3yuYtFZJI3FnQN97SHm06mjGTbH/7kJsERDVC+J7bTH0K8BMzz3ZEwgxNdO
         BCzCXkoiGs7RlsCa9xuEAXziGjKDx8vmRVqsQWHL6ExIIM88M7vq9xSCrJ3/N6Gyj8aM
         lM6tiPKJIrwmNRxPt7c8gN/rD0lZly+p1a+eMUN5yZ9kNY4997gj3ru6V/jcTLJ7r8nR
         ZsO2RWypQBtvim3ZtU/Ld/jRO2xs6/dHZDy/XxDWMtWYHBuQr7USgs9XakyxqdnE9IzO
         Rovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754480649; x=1755085449;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVK9KjsbV12CCY/MkUED+7oiaOwgxA00Dk6+a2LEY8o=;
        b=q126K70tL0AK6oqcx0qTo3cNFsF2QDmO2EgVd913SOnV5dm+c/fEcgc02ogfr5rZTP
         S/ILYh0eCNM9UL4e+/YQyR8+g/8/BRQVGmkETMg2alrhbgFjJEdF12iXYvbFcD7S+Pe9
         +S3/oYkj0k7Wf1D+nwCMa27LlqHKMly299ZGsh6Se24055ZLKPMea3Ja8L8mZ3vIxuZl
         Cqugn8XUz7HB0vOPGWxCb5+bIlbPm+AOMmwupL9DLxDTF676ZsGdMQ/KBIp6t1gMDLHY
         no7YNTgI6JOL6276NDoK2DL8lsmvd1SacDQIkG9I03eNYTjjnv6uRkrh9FlONT+Y1JNk
         xqcg==
X-Forwarded-Encrypted: i=1; AJvYcCUKdbNJKR0NNzc5issbntKdftmCiG/Ja9x9fcmNqih5vwsFTDmNyCzgPS6PqDsbMoxdBsdRI60dYyg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhW9AEGGVHVN9TO+fg4Yj3WfNGauZvPfTF7fpsfOGf6DCMsFub
	HaT5H2Cd425nXTZrTJk70qOhqp9eKhi6jM9Sn9GyvYBdGy3qQvuoYk+W222JVHMG1Q==
X-Gm-Gg: ASbGnctd04ol6jHv9enbTcuWyG5d4dBLoTiIc2pyo30i3ck5UXEpbohXyxGD8Kk0kQG
	u45ZIL6gtRS2kWvEXaey0Ptfd9qGE5zjSC+vccxDV4MgQJPjwCrMZqCJN/tnv89jbZ4Bq7y2c3Y
	oOW7DJjdgJxopQU/qbF/p+OU80hprxAr3NrxZXibdlQKY7wakcbEPhNOw3jj4TNQRc0N/LTsIDg
	hVXi9kcam8yQWgwKWrbFQg9CpmDgrzA9zKb+FpOGkoNx9+cTJTbVA2i597I5Amg8/RzTMo6ikGy
	a0Ra/o9UeZuqGhrhVQQ/gVRawenovh85/BiYfCXRiSBFnO+1r2m3Gvc2ukrfjv7DwUcHYznbsJs
	S7fsQdL/bwvGFIuDwT9MnpoYYnmPw69r+R06eW9nsZ6tl2GozK+fVTsq9oXMscBnSxtMruy4rgf
	LkxVr9N7Y=
X-Google-Smtp-Source: AGHT+IFIAEtphQJNPrSCk7MKIZi/K7cKM1UpliGMNniHg2+8V5V5ijvlkgsSkob1yKlraeYOADPPNg==
X-Received: by 2002:a17:907:9627:b0:ae0:d08b:e85 with SMTP id a640c23a62f3a-af9903ce1demr243807266b.61.1754480649095;
        Wed, 06 Aug 2025 04:44:09 -0700 (PDT)
Message-ID: <ce14396f-c8a0-4eb8-a19d-a8e71afb0199@suse.com>
Date: Wed, 6 Aug 2025 13:44:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ns16550: ensure polling timer is disarmed
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: dmkhn@proton.me, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 julien@xen.org, michal.orzel@amd.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250730031249.1613142-1-dmukhin@ford.com>
 <5a4dc92b-139d-4fa5-9baf-2ebc41bba758@suse.com> <aIplBkq7BL52Fn/Q@kraken>
 <78128ec6-b79f-4d4c-a298-72315b190036@suse.com> <aIvjJP6bpJpsQRtQ@kraken>
 <cc3812ca-b929-416c-af75-78c3c3b0d664@suse.com>
 <aJM0EFYKVSQOoB4_@macbook.local>
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
In-Reply-To: <aJM0EFYKVSQOoB4_@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.08.2025 12:53, Roger Pau Monné wrote:
> On Fri, Aug 01, 2025 at 09:34:42AM +0200, Jan Beulich wrote:
>> On 31.07.2025 23:42, dmkhn@proton.me wrote:
>>> On Thu, Jul 31, 2025 at 08:54:10AM +0200, Jan Beulich wrote:
>>>> On 30.07.2025 20:31, dmkhn@proton.me wrote:
>>>>> On Wed, Jul 30, 2025 at 10:12:54AM +0200, Jan Beulich wrote:
>>>>>> On 30.07.2025 05:13, dmkhn@proton.me wrote:
>>>>>>> From: Denis Mukhin <dmukhin@ford.com>
>>>>>>>
>>>>>>> As it stands, polling timer is kept in the list of timers even after the
>>>>>>> interrupts have been enabled / polling disabled on ns16550-compatible UART.
>>>>>>>
>>>>>>> Ensure polling timer is removed from the timer list once UART interrupts are
>>>>>>> enabled.
>>>>>>>
>>>>>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>>>>>>
>>>>>> Wasn't it Andrew(?) who suggested something along these lines? That would
>>>>>> want reflecting by a tag then.
>>>>>
>>>>> Yes, indeed.
>>>>>
>>>>>>
>>>>>> Also, what's the real problem you want to solve here? The timer function
>>>>>> would be run one more time after ->intr_works is set, and then the timer
>>>>>> will be permanently inactive (up to a possible S3 resume). Is it being on
>>>>>> an inactive list an actual problem? (IOW I'd like to understand if the
>>>>>> change is merely cosmetic, or if there is some actual benefit.)
>>>>>
>>>>> My understanding is running polling timer one more time after the interrupts
>>>>> are enabled is the issue: if there's a pending timer when it is known the
>>>>> timer not needed, then the timer should be canceled.
>>>>
>>>> And the effort of canceling outweighs the one extra running of the timer?
>>>
>>> I think so, because intr_works will not flip at run-time once set.
>>> If so, no need to keep the timer ready to be rearmed.
>>
>> Well, to me it looks like a code size increase with extremely limited benefit.
>> Hence while likely I wouldn't outright NAK such a change, I also wouldn't ACK
>> it.
> 
> Hm, indeed the net win of this is dubious, as the extra polling
> interrupt would only happen once.  Using stop_timer() would be less
> heavyweight than kill_timer().
> 
> Overall I think it needs justification in the commit message, as the
> timer cannot be removed from the list of timers, otherwise it's usage
> on resume from suspension will trigger an ASSERT, so part of the
> commit message is stale.

That could be compensated by another init_timer(), though. (In fact when
originally looking at the patch, I [wrongly] thought that path was taken
on resume, so didn't comment on that aspect.)

Jan

