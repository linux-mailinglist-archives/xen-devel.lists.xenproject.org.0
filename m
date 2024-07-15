Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D6593124A
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 12:31:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758830.1168337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTIyh-0001rM-Cc; Mon, 15 Jul 2024 10:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758830.1168337; Mon, 15 Jul 2024 10:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTIyh-0001pr-A3; Mon, 15 Jul 2024 10:30:43 +0000
Received: by outflank-mailman (input) for mailman id 758830;
 Mon, 15 Jul 2024 10:30:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FSyp=OP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTIyf-0001pl-Bv
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 10:30:41 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46041bd2-4295-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 12:30:36 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2eede876fccso25724781fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 03:30:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bbc25d2sm37390605ad.100.2024.07.15.03.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 03:30:34 -0700 (PDT)
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
X-Inumbo-ID: 46041bd2-4295-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721039436; x=1721644236; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a1lLxM4gObl2rZEL2/OTCt6L7uaYL/11F4cXInCDtes=;
        b=Z1P6Ro22yJ0J9azh/rlzKQlZ7yKzsquJi2w+HDo7FpyvH7ffbrrdcpSV+x4EtUNd5j
         Cx+t7BIEM3XM12T+bDUkePJst5lsP6xbBSn1LILUJvM2eOgTs099Z1u6JFRW9GHK0sUC
         Z/SaIXAXK9vCOAVb2fGIUUtZL46YmOaUTyxY8h9C/niVoyvT4heZPwz1mHPIcnPnyk9+
         7kNhZfXVIMWuQaW5/CIfV1F6pexz+CcEgqKZe5o1O5R30gGeQzckCW9NhMUBjnz+qfhp
         u9wx2RkfwcBm2pzK50BJ2UwaVcCAAn4JwIaaOEQmlLkXqW9SSAL1DtFoYFkj7W2oDeEP
         U9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721039436; x=1721644236;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1lLxM4gObl2rZEL2/OTCt6L7uaYL/11F4cXInCDtes=;
        b=FrdR7dwK4WObHB2HyT+8lGw/nLmKD3Hk5SZGTPsTkXCceFi15R5gCLUPU+6VwyhZfW
         xcI8KuwtQYT1cUv7aGqtbaqNC8Q6pogVICX5mV5kDv1fLE2Ncw554Boyp/jyeDFdM0n5
         fw1hq2I0nfS2zdq2FmIiGg3J6pRxrY0C4ACW/VkAmuEXxKSu3y98kHbCRETpPuJLfgfx
         JE4wkYU7EPVaHUtSq9wCHA+oUHnvFiyvGafhb8eYJk6gCPDEAZyXiHwpdfNN9N+YMHo9
         Id83Jpv2TacIQSresdHmHoVBp2vMOJgSizSxfEFqBqHhhxZR7Og18lgZd1Af069WJlWc
         THRg==
X-Forwarded-Encrypted: i=1; AJvYcCURqb7D+Lrzn0/FGaYhH+UiFbB+r3LVdZY3cVDy3sApRhhsT/T0OazYp39X68D7/JuJfhwiyrjlFlW0VbYIgPdo75dBJiEDTYWTbGI3rys=
X-Gm-Message-State: AOJu0Yxn+MbuiWQE7DopAkV/JyBOtsmVOZBpaah+TkVWT8Rx6yLk3Fjc
	AkBTKf5pcS1lQOioQRTVOn3aU0NTLOWilFA9UXEX+ZT2ysw/RrM4gECsWSrrog==
X-Google-Smtp-Source: AGHT+IG71fPUprzQEtvckEUmpdO5ttI/WTg9mgP7wgKFrL/W8IEGC3XtuknlPC+NLMV69QrklmuQhA==
X-Received: by 2002:a2e:8e8d:0:b0:2eb:dd0b:b9ec with SMTP id 38308e7fff4ca-2eeb30e3b1fmr116433711fa.20.1721039434909;
        Mon, 15 Jul 2024 03:30:34 -0700 (PDT)
Message-ID: <f777a9fd-0239-49e5-902c-63745d2a6e5a@suse.com>
Date: Mon, 15 Jul 2024 12:30:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: systemd units are not installed in 4.19.0-rc2 anymore
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel
 <xen-devel@lists.xenproject.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <ZpHqR4e3VaFAXC3m@mail-itl>
 <94d0ef92-9fb8-4097-a633-59f1190434c4@citrix.com>
 <1057f937-da16-415f-a760-ac4f00bc29f3@suse.com>
 <4cf46d24-2e21-4909-b1f4-fd6757801101@citrix.com>
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
In-Reply-To: <4cf46d24-2e21-4909-b1f4-fd6757801101@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.07.2024 12:07, Andrew Cooper wrote:
> On 15/07/2024 9:11 am, Jan Beulich wrote:
>> On 13.07.2024 15:02, Andrew Cooper wrote:
>>> On 13/07/2024 3:45 am, Marek Marczykowski-Górecki wrote:
>>>> Hi,
>>>>
>>>> Something has changed between -rc1 and -rc2 that systemd units are not
>>>> installed anymore by default.
>>>>
>>>> Reproducer: 
>>>>
>>>>     ./configure --prefix=/usr
>>>>     make dist-tools
>>>>     ls dist/install/usr/lib/systemd/system
>>>>
>>>> It does work, if I pass --enable-systemd to ./configure.
>>>>
>>>> My guess is the actual change is earlier, specifically 6ef4fa1e7fe7
>>>> "tools: (Actually) drop libsystemd as a dependency", but configure was
>>>> regenerated only later. But TBH, I don't fully understand interaction
>>>> between those m4 macros...
>>> Between -rc1 and -rc2 was 7cc95f41669d
>>>
>>> That regenerated the existing configure scripts with Autoconf 2.71, vs
>>> 2.69 previously.
>>>
>>> Glancing through again, I can't spot anything that looks relevant.
>>>
>>>
>>> 6ef4fa1e7fe7 for systemd itself was regenerated, and I had to go out of
>>> my way to get autoconf 2.69 to do it.
>> Yet was it correct for that commit to wholesale drop
>> AX_CHECK_SYSTEMD_ENABLE_AVAILABLE? That's, afaics, the only place where
>> $systemd would have been set to y in the absence of --enable-systemd.
> 
> Hmm.
> 
> Yes it was right to drop that, because the whole purpose of the change
> was to break the dependency with systemd.
> 
> Thereafter, looking for systemd in the build environment is a bogus
> heuristic, and certainly one which would go wrong in XenServer's build
> system where the Mock chroot strictly has only the declared dependencies.

I can see the point here. Still I wonder whether for non-cross builds it
wouldn't make sense for a build env to reflect what the produced code is
intended to run in. Which would mean to make available enough of systemd
to be able to recognize its presence from a configure script.

> I see two options.
> 
> 1) Activate Systemd by default on Linux now (as it's basically free), or
> 2) Update CHANGELOG to note this behaviour
> 
> Personally I think 2 is the better option, because we don't special case
> the other init systems.

Would 1) have any downsides to Linux systems not coming with systemd? If
not, like Marek says, wouldn't it make sense to put in place respective
stuff unconditionally (by default), even if it may end up unused?

Jan

