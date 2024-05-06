Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49A68BC7B6
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 08:42:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717219.1119229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3s3C-0003F8-RV; Mon, 06 May 2024 06:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717219.1119229; Mon, 06 May 2024 06:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3s3C-0003CE-Ob; Mon, 06 May 2024 06:42:14 +0000
Received: by outflank-mailman (input) for mailman id 717219;
 Mon, 06 May 2024 06:42:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3s3A-0003C8-OQ
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 06:42:12 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c36bb86e-0b73-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 08:42:10 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-34d7d04808bso1136444f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 05 May 2024 23:42:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s14-20020adfe00e000000b0034e553f6174sm8312875wrh.98.2024.05.05.23.42.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 May 2024 23:42:09 -0700 (PDT)
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
X-Inumbo-ID: c36bb86e-0b73-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714977730; x=1715582530; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cN6g1BGIp4j/LoLsnnkV3ci966DWyGYF5iZ47Vj9pm8=;
        b=gg3HvPHjBQ1Bs8pxrmb06PdbdmZLEPq1AW2wQM6Tsf9On+CfzioXDE/5Y9JI8ADW5S
         zpSxozVGepvcKA488A+R/Jk0EqrU3LfyxNlSJMX7/hsIMeODXmhayQI0vxCImAiM04he
         0+bylt2CnFXOoZsH5XqoEYuJ1aakTxYXXvdlrIUtk907Bmm8MC7styCkNHC9WjUc3LgO
         9GfeCy1PHRfAcCOqedug//87DxMf77KD0UnRIB95Im4+5QGD+2sZ9Aq49rPDzmRZT+FG
         GLJQBVcLqI6gN6HAbtl7CfnGiz9aVp8mjDSELeN7kxrkmySXeuDmwpyU+Ac6UXhvyaXQ
         P5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714977730; x=1715582530;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cN6g1BGIp4j/LoLsnnkV3ci966DWyGYF5iZ47Vj9pm8=;
        b=r/O5U4woMNlK/qcfMH6cxzFWMehmiupjlXFYtWzGOedTIgIl1SjaUDnY4gSlrPKi4l
         OMvSTar5ESmqrNBGBpDc8NgWGczJn9OazTIl4AAcXsmcpQy1becN/8FpVJPX89RZ0/SF
         1ymGTDqyA6KzZQD6ONQxuG9ANdyCB0R0QvDlL4YMrmILLO6G15S8UVWzE5JzAiEdEkrl
         eWUEoe0gUgnkylDb6DxyAg2A7CzvVhye+RKYaa2rozXAQvmGWQHNVuFfSq2bVQ0hP9vF
         YaQIMrnupf5qXbSJjrBJ9b+5/22qLnUy7dAScVPtM9N4OHAQthr5Q0EIhk9mgeStM1M3
         Vqiw==
X-Forwarded-Encrypted: i=1; AJvYcCWNe1DU1bmtQd52Ra/mPi5GhXrnVQlzhTjB/0m7GwzOi7hxxAuIviVh9PivFSyUk37zVJY97vRd/JVQ7/v1pZP4geURkwD4F9MoPhmzlZY=
X-Gm-Message-State: AOJu0YzouTDeH9pTwkWkBPp/rYivr5pAwt6PUBAvrrxPQcxiyreEu9dY
	wTwd0TEgv0F67/CNqWmdLzjGkXvo8NNMEB8yEyD0smP/Eq3jstTEhaIchSSiYg==
X-Google-Smtp-Source: AGHT+IGuhe4X/fvtSWsahosVEUGDhRuomehpx7bMGYj0+y+748CxofBCY81b2CVj67sJCCEmxHmAFA==
X-Received: by 2002:a5d:4f8f:0:b0:34d:b265:6401 with SMTP id d15-20020a5d4f8f000000b0034db2656401mr8518262wru.46.1714977729852;
        Sun, 05 May 2024 23:42:09 -0700 (PDT)
Message-ID: <ccd19870-d44b-44a7-9a5c-72a13d4f74a2@suse.com>
Date: Mon, 6 May 2024 08:42:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] xen: allow up to 16383 cpus
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <20240327152229.25847-1-jgross@suse.com>
 <20240327152229.25847-9-jgross@suse.com>
 <da1662ac-70f1-4ae4-9737-e10e617c8036@suse.com>
 <637c755a-9f24-4b86-af12-7c7d50bf40c8@suse.com>
 <d0714064-c544-47d3-84c0-a19391ccf496@xen.org>
 <29296e11-8d21-4867-9d31-fc94af828214@suse.com>
 <146fbd43-d8b8-4d73-8650-c60024498324@xen.org>
 <alpine.DEB.2.22.394.2405021111540.624854@ubuntu-linux-20-04-desktop>
 <b3299df2-e726-49eb-a893-cbc547b2419c@xen.org>
 <alpine.DEB.2.22.394.2405031159240.1151289@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2405031159240.1151289@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.05.2024 21:07, Stefano Stabellini wrote:
> On Fri, 3 May 2024, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 02/05/2024 19:13, Stefano Stabellini wrote:
>>> On Mon, 29 Apr 2024, Julien Grall wrote:
>>>> Hi Juergen,
>>>>
>>>> On 29/04/2024 12:28, Jürgen Groß wrote:
>>>>> On 29.04.24 13:04, Julien Grall wrote:
>>>>>> Hi Juergen,
>>>>>>
>>>>>> Sorry for the late reply.
>>>>>>
>>>>>> On 29/04/2024 11:33, Juergen Gross wrote:
>>>>>>> On 08.04.24 09:10, Jan Beulich wrote:
>>>>>>>> On 27.03.2024 16:22, Juergen Gross wrote:
>>>>>>>>> With lock handling now allowing up to 16384 cpus (spinlocks can
>>>>>>>>> handle
>>>>>>>>> 65535 cpus, rwlocks can handle 16384 cpus), raise the allowed
>>>>>>>>> limit
>>>>>>>>> for
>>>>>>>>> the number of cpus to be configured to 16383.
>>>>>>>>>
>>>>>>>>> The new limit is imposed by IOMMU_CMD_BUFFER_MAX_ENTRIES and
>>>>>>>>> QINVAL_MAX_ENTRY_NR required to be larger than 2 *
>>>>>>>>> CONFIG_NR_CPUS.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>>>>>
>>>>>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>>
>>>>>>>> I'd prefer this to also gain an Arm ack, though.
>>>>>>>
>>>>>>> Any comment from Arm side?
>>>>>>
>>>>>> Can you clarify what the new limits mean in term of (security)
>>>>>> support?
>>>>>> Are we now claiming that Xen will work perfectly fine on platforms
>>>>>> with up
>>>>>> to 16383?
>>>>>>
>>>>>> If so, I can't comment for x86, but for Arm, I am doubtful that it
>>>>>> would
>>>>>> work without any (at least performance) issues. AFAIK, this is also an
>>>>>> untested configuration. In fact I would be surprised if Xen on Arm was
>>>>>> tested with more than a couple of hundreds cores (AFAICT the Ampere
>>>>>> CPUs
>>>>>> has 192 CPUs).
>>>>>
>>>>> I think we should add a security support limit for the number of
>>>>> physical
>>>>> cpus similar to the memory support limit we already have in place.
>>>>>
>>>>> For x86 I'd suggest 4096 cpus for security support (basically the limit
>>>>> we
>>>>> have with this patch), but I'm open for other suggestions, too.
>>>>>
>>>>> I have no idea about any sensible limits for Arm32/Arm64.
>>>>
>>>> I am not entirely. Bertrand, Michal, Stefano, should we use 192 (the
>>>> number of
>>>> CPUs from Ampere)?
>>>
>>> I am OK with that. If we want to be a bit more future proof we could say
>>> 256 or 512.
>>
>> Sorry, I don't follow your argument. A limit can be raised at time point in
>> the future. The question is more whether we are confident that Xen on Arm will
>> run well if a user has a platform with 256/512 pCPUs.
>>
>> So are you saying that from Xen point of view, you are expecting no difference
>> between 256 and 512. And therefore you would be happy if to backport patches
>> if someone find differences (or even security issues) when using > 256 pCPUs?
> 
> It is difficult to be sure about anything that it is not regularly
> tested. I am pretty sure someone in the community got Xen running on an
> Ampere, so like you said 192 is a good number. However, that is not
> regularly tested, so we don't have any regression checks in gitlab-ci or
> OSSTest for it.
> 
> One approach would be to only support things regularly tested either by
> OSSTest, Gitlab-ci, or also Xen community members. I am not sure what
> would be the highest number with this way of thinking but likely no
> more than 192, probably less. I don't know the CPU core count of the
> biggest ARM machine in OSSTest.
> 
> Another approach is to support a "sensible" number: not something tested
> but something we believe it should work. No regular testing. (In safety,
> they only believe in things that are actually tested, so this would not
> be OK. But this is security, not safety, just FYI.) With this approach,
> we could round up the number to a limit we think it won't break. If 192
> works, 256/512 should work? I don't know but couldn't think of something
> that would break going from 192 to 256.

I would suggest to aim at sticking to power-of-2 values. There are still
some calculations in Xen which can  be translated to more efficient code
that way (mainly: using shifts rather than multiplications or a
combination of shifts and adds). Of course those calculations depend on
what people choose as actual values, but giving an upper bound being a
power of 2 may at least serve as a hint to them.

> It depends on how strict we want to be on testing requirements. I am not
> sure what approach was taken by x86 so far. I am OK either way.

The bumping of the limit here clearly is forward-looking for x86, i.e. is
unlikely to be even possible to test right now (except maybe when running
Xen itself virtualized). I actually think there need to be two separate
considerations: One is towards for how many CPUs Xen can be built (and
such a build can be validated on a much smaller system), while another is
to limit what is supported (in ./SUPPORT.md).

Jan

