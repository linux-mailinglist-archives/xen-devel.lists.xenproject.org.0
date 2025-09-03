Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD23B4150D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 08:22:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107851.1458061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utgsR-0001lp-IK; Wed, 03 Sep 2025 06:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107851.1458061; Wed, 03 Sep 2025 06:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utgsR-0001jF-Ef; Wed, 03 Sep 2025 06:21:51 +0000
Received: by outflank-mailman (input) for mailman id 1107851;
 Wed, 03 Sep 2025 06:21:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4jG=3O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utgsQ-0001j9-1j
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 06:21:50 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45c1c295-888e-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 08:21:48 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-61cd6089262so10066313a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 23:21:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b046d0b0135sm47982166b.73.2025.09.02.23.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 23:21:47 -0700 (PDT)
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
X-Inumbo-ID: 45c1c295-888e-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756880508; x=1757485308; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XDD+zinFCR/GJ/2qAAr07f5TR6VDEBBRawRGHwaUeyA=;
        b=dTLdvMCon1sgZXhfWlsW4AMAJ2WJY6KlBfNAkkJB4aBWFaMb86B9MYcFv/6skv10zs
         ycXBogx29T4Tf/Z1RvO5H6o+j2gvT8+5I7UH1a3CLOhJiHEnrjMWbHIajPMnCmbXzbuC
         01f/io8mmDJWAX8rMrul/QrgH3EWc4xzsATUTigb5q/bD4h1L0KBGo7s6MHenRddPqyg
         I6lEZ23BAtcyEYh4ynEgMdGMw3fbLPnpMStAoVo7uH7Z1uT1uymrjnoEB24n5u8qw4V4
         t1/n+Okp9ieX3l6SLQsHsp2plUhOVy8TQNtDZofiWVkGMdiJDJwTdg9ntChs4HAnJEnT
         8Vbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756880508; x=1757485308;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDD+zinFCR/GJ/2qAAr07f5TR6VDEBBRawRGHwaUeyA=;
        b=bHtJhGyhHbll0UzHbwbEzxdW9FVwGo5nywk4dnpaen6Rr1sJJw3dzv6lkMeCu3atnn
         FXPnqx/zDUO0OkCyspnQSP7sRqiM1LJHLOwvDqcWIjb4ipw+jgCWWoc/xohp21Zcl79G
         8AQRohQahnXKGvFE+Plb9RzGTL934nGOwblXyshfHScC1mxHQ94F0joWRWnv3/t8zjkU
         IqrSpop93AroC4TS2DcCKRal40HgZJ1Xri/Zr2GSBeZo/dR8GOtZ3iPZ1haWpHLa7c7f
         PNJv+FYA9L+law0sxahCOTE6jMlJrjyQ46w2HMcbMfyILF4RzUA6jw+gUyCaa+BWrjCB
         +VZA==
X-Forwarded-Encrypted: i=1; AJvYcCUdnmj4D6kC9dkhSq3DzkSViXFI/ECcdLoHIYCYpdhU2XtAt85o/g9f+CSHJCG9pJCZ37s4Es+pYng=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxrylR8JCe/7z1Bo9Y9VGWdzSeWSt0NTbV2IcsWBawQHn4smGwt
	ZwaIONs6nhhnurmFMhh6n1et8AaiziBxJXvBsvIsXFoGOCgPYuL2Blw+pjfrQHkubw==
X-Gm-Gg: ASbGnctxAZTLs/x7FdG+n+E9tCq250Nyc4R2rCDsG2FIbYaKP7Kpjrh34g2uZ9XNDke
	kItPYyImDHWDMTrhhra+ggKQKnnF2m/cHWUO5cyxDBRRMUfQKlWpGV3Pqqq8JIRj1Xj2t/Q87mU
	Eh6PJHnfl0j+Rm354iCPxe/LeSFPUnCFI15lu3EaVR7MUDlTBjVdSKlLljI+rvFo5z2Ja0jQ6mv
	NjcC9txu3xnbzy5v99QtrDTaKA7Pp+XuEzj84lZy0c0Ejcn6UbKoZH1cAjrWBAiJhvY8MbZOB/Z
	YEp/nxl+mTPjw5YiQ9Ke1D9dpJzOe0bcVOOIClHvIQpjHCPlEfxwdQjspum+Xgx1EKZg+IPfoWA
	rf/7gKyPR9j5BUOMLeK/7N7cFvRYDgE6MeWjwGCFKNGwcO/jf5dDjqEGfPG2ne4SMZkgNhpDGID
	Ts1DM1Kng=
X-Google-Smtp-Source: AGHT+IGisr709yiLWCKKGkboVJOkM5UDKnoJjgyIamiQPhA3FJKk5Gdr38XUiOlwcvNj+Sy6TUBkFA==
X-Received: by 2002:a17:907:3f9e:b0:b04:299d:53ab with SMTP id a640c23a62f3a-b04299d590cmr938789166b.37.1756880508090;
        Tue, 02 Sep 2025 23:21:48 -0700 (PDT)
Message-ID: <7ec5e23e-2415-41b7-ab3e-7b0a7007bd1f@suse.com>
Date: Wed, 3 Sep 2025 08:21:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20250828100601.1777197-1-Penny.Zheng@amd.com>
 <a855a0b4-21dc-4f63-9849-6e5c7ec2e6b3@suse.com>
 <DM4PR12MB8451C7146814C9C359B078B5E101A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451C7146814C9C359B078B5E101A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.09.2025 05:14, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, August 28, 2025 7:07 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Anthony PERARD
>> <anthony.perard@vates.tech>; Andrew Cooper <andrew.cooper3@citrix.com>;
>> Roger Pau Monné <roger.pau@citrix.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v8 8/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
>> xen_sysctl_pm_op for amd-cppc driver
>>
>> On 28.08.2025 12:06, Penny Zheng wrote:
>>> @@ -154,6 +156,17 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op
>> *op)
>>>      else
>>>          strlcpy(op->u.get_para.scaling_driver, "Unknown",
>>> CPUFREQ_NAME_LEN);
>>>
>>> +    /*
>>> +     * In CPPC active mode, we are borrowing governor field to indicate
>>> +     * policy info.
>>> +     */
>>> +    if ( policy->governor->name[0] )
>>> +        strlcpy(op->u.get_para.u.s.scaling_governor,
>>> +                policy->governor->name, CPUFREQ_NAME_LEN);
>>> +    else
>>> +        strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
>>> +                CPUFREQ_NAME_LEN);
>>
>> Isn't pulling this ...
>>
>>>      if ( !cpufreq_is_governorless(op->cpuid) )
>>>      {
>>>          if ( !(scaling_available_governors =
>>
>> ... out of this if()'s body going to affect HWP? It's not clear to me whether that would
>> be entirely benign.
> 
> HWP has its own unique "hwp" governor. So, imo, it may not affect.

How does it matter what (unique or not) governor it uses? The relevant aspect
(to me) is the !cpufreq_is_governorless() check that previously guarded the
copying of the name. (It would be another thing if this was benign to HWP, but
such would need clarifying in the description. Cc-ing Jason just in case.)

Jan

