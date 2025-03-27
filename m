Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DE4A73671
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 17:13:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929699.1332460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txpqk-0001R2-NP; Thu, 27 Mar 2025 16:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929699.1332460; Thu, 27 Mar 2025 16:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txpqk-0001PB-JX; Thu, 27 Mar 2025 16:12:58 +0000
Received: by outflank-mailman (input) for mailman id 929699;
 Thu, 27 Mar 2025 16:12:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txpqj-00018Y-Nl
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 16:12:57 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57e69692-0b26-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 17:12:56 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cf58eea0fso6346255e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 09:12:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a50c1sm20584874f8f.38.2025.03.27.09.12.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 09:12:55 -0700 (PDT)
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
X-Inumbo-ID: 57e69692-0b26-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743091975; x=1743696775; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K4HHrChgmGMuHRJ5SP535oqeTcNdAAuWJ+vXqywqyg4=;
        b=LChh+yjdYT2YeKguQmCo7ZhiqJT8fqfYNvGUOMy1/EYCn0shjsRzFSR2JMxpSA/STS
         2r66AUuAHwlOBm8HZgfjKgttSEBQMWls0VGL7nC/ECTv92toEGbyHsToqhEhq/nPXZzE
         eUE6mWN7FBVNmVphStKmZcwKHFKmdDPQwROOhQhcDPpiwaYMHafjlQeN6Mj5QdNtAFbt
         OpmC3Jqqdy5VmDnFnfTvQiDZ6hGgH6YAypgrhb0Fe0I3emPjiUQkhdRZNjUrJd+/bmVq
         nV338Hw5Z3gx5Bjn4cPZ2aynvZs0jQ/1iOS08h5vhLbNgwN65rnAVrUvxwhxk0XTo7LC
         tgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743091975; x=1743696775;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4HHrChgmGMuHRJ5SP535oqeTcNdAAuWJ+vXqywqyg4=;
        b=VMjtthoGsTdSQbkoB5Zi1k3f11RnHCvJcLa+C0aXkYRYVNducmD8l1iaejwJ/syLaj
         7Bxq9XsyVN01gE4BGoBTkFNgOqT/WFyxpXVlY7DKBTugxCqA+R3MtAlGG3EuqjqrDSWt
         W++/pDp5HIu5Tb2tt7jjHlo3x8b5OhurCRt5YUHzN0UT7F6KHYeSXFxEBzBlyehnKLpd
         AAGKsFYtj7NUxn0vtvT1caHLByrCl1PZYTiJqdc21TV8vNxHhmmVU1uLFWtjV64JZ0At
         sa7eQnIFyF/mAB9kV06JqCsGvPa3br8aI6ubAkOdPtJS23hLm1n4IAtSHv1xNzA5yZT2
         jy5A==
X-Gm-Message-State: AOJu0YyQKaHnAvSOQGnIXVfmNpKSABQauRyAYmks9D5Ru+eDpYymfi9U
	l5z11xAK+63T7k79KbHGq7bDYC4Lg44XbWM6wlDtfNORlOqC1Y5M66TTwrGEJw==
X-Gm-Gg: ASbGncvDxK9g/f4tFBQNo2gTe0aoPhUKE97yQCZQXKVp2ThSThPzCbPj1N/E2ufKfX/
	Om/YYODWpDegvAD9KWrMKr9I4QO5L8deywyYAY2CSusVASspz7Vbng2/Yh2na5DXQqS2BDw85k2
	MJewoAuvxvkbS+LEoYVRVLam3KBYvYJOFuo/6xKUWtT3K9yZfgF2wAWhGIZGWX1CnDtvA8tegCw
	jfuth6+FRRKw6HMxvONBA7EgpW2yYKg8uKEekkAYm6XOwJL3rEHEg2hVGfsAaXw9lSubPNlfkeM
	e89pzNUBUnnBqGYs0ubON/EK5htMEGrCd9tCdaT6j/jj5zTyKBAFCTlipxf30xza6hA2N5FrxyS
	qF+YuBDZo8TGTPYTDrrg45CGUtLB9OA==
X-Google-Smtp-Source: AGHT+IGka/XqBsykEvMQekiEoXLg2+q1pKyWv0tRwPSzu9ENQT0kPjfLHu5W8JcMACXODM55oVGHog==
X-Received: by 2002:a5d:6d04:0:b0:391:4743:6db1 with SMTP id ffacd0b85a97d-39ad1749e27mr3593478f8f.20.1743091975512;
        Thu, 27 Mar 2025 09:12:55 -0700 (PDT)
Message-ID: <b4fb021b-b817-4332-8976-bc22b440fe20@suse.com>
Date: Thu, 27 Mar 2025 17:12:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/MTRR: hook mtrr_bp_restore() back up
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <ad8ea1da-dda9-4567-8b15-55b65777e80f@suse.com>
 <Z-U4ozL6p-Unh5Y8@macbook.local>
 <fde64904-343b-48c9-b396-961811cc2adb@suse.com>
 <Z-VJBIbQal-jZAGM@macbook.local>
 <f5669417-43f3-4c63-bb7d-a108f13757cb@suse.com>
 <Z-VcXGhlObVZYhoc@macbook.local>
 <ca0fb29a-96e8-489e-b109-76a684621d18@suse.com>
 <7bf76e95-5681-45f3-958e-4bd8ed74f790@citrix.com>
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
In-Reply-To: <7bf76e95-5681-45f3-958e-4bd8ed74f790@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2025 16:23, Andrew Cooper wrote:
> On 27/03/2025 2:20 pm, Jan Beulich wrote:
>> On 27.03.2025 15:10, Roger Pau Monné wrote:
>>> On Thu, Mar 27, 2025 at 02:28:42PM +0100, Jan Beulich wrote:
>>>> On 27.03.2025 13:48, Roger Pau Monné wrote:
>>>>> On Thu, Mar 27, 2025 at 01:30:44PM +0100, Jan Beulich wrote:
>>>>>> On 27.03.2025 12:38, Roger Pau Monné wrote:
>>>>>>> On Thu, Mar 27, 2025 at 12:20:47PM +0100, Jan Beulich wrote:
>>>>>>>> Unlike stated in the offending commit's description,
>>>>>>>> load_system_tables() wasn't the only thing left to retain from the
>>>>>>>> earlier restore_rest_processor_state().
>>>>>>>>
>>>>>>>> While there also do Misra-related tidying for the function itself: The
>>>>>>>> function being used from assembly only means it doesn't need to have a
>>>>>>>> declaration, but wants to be asmlinkage.
>>>>>>> I wonder, maybe the intention was for the MTRR restoring on the BSP to
>>>>>>> also be done by the mtrr_aps_sync_end() call in enter_state()?
>>>>>>>
>>>>>>> AFAICT that will set the MTRRs uniformly on all CPUs, by calling
>>>>>>> mtrr_set_all() just like mtrr_bp_restore(), but later in the restore
>>>>>>> process.
>>>>>> Hmm, yes, that's possible. The comment in set_mtrr() is somewhat misleading
>>>>>> then, though, as for the BP the writing then isn't just "okay" but necessary.
>>>>>> Question is whether doing this so much later is actually good enough.
>>>>> Hm, no idea really.  We do the device restore ahead of the MTRR
>>>>> restore, so I wonder whether we could have issues by using unexpected
>>>>> effective cache attributes for device memory accesses as a result of
>>>>> MTRRs not being initialized?
>>>> That's just one of the possible problems. The father the MTRRs we run with
>>>> diverged from what firmware puts in place, the bigger the possible trouble.
>>>> I think the restoring better is done as being switched to here again. The
>>>> absence of any discussion of MTRRs in that earlier change leaves me pretty
>>>> certain that the behavioral change there wasn't intended. Andrew is usually
>>>> pretty good at spelling out all intended effects.
>>> No objection, however for the BSP we now end up restoring the MTRRs
>>> twice, as we will also do it in mtrr_aps_sync_end().
>>>
>>> Might be worth to mention in the commit message that the MTRR state
>>> was restored in mtrr_aps_sync_end() for the BSP also, but that it
>>> might be too late.
>> I've added "Note that MTRR state was still reloaded via mtrr_aps_sync_end(),
>> but that happens quite a bit later in the resume process."
> 
> Ah yes, you got here too.
> 
> Yes, I think I simply missed this part of the discussion from the commit
> message.
> 
> The MTRR logic is a giant tangle, and lost of it (I'm pretty sure) is
> only relevant for early 32bit days.  Also since then, I expect firmware
> has gotten better, considering that S3 is ubiquitous on laptops nowadays.
> 
> I expect that we don't need to change MTRRs in most cases.  However, if
> change to the MTRRs actually need to happen, then they probably want
> doing as part of the AP boot, rather than in a rendezvous later.  That
> said, it would be a difference between the normal boot and S3 resume paths.

So in summary - you think we don't need/want the patch here? It feels risky
to me to run the BSP with not-yet-restored MTRRs for an extended period of
time.

Jan

