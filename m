Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA619EE425
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 11:32:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855689.1268530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLgUW-0006Jb-4f; Thu, 12 Dec 2024 10:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855689.1268530; Thu, 12 Dec 2024 10:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLgUW-0006GS-1T; Thu, 12 Dec 2024 10:32:20 +0000
Received: by outflank-mailman (input) for mailman id 855689;
 Thu, 12 Dec 2024 10:32:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLgUU-0006GK-IV
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 10:32:18 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57a91ca0-b874-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 11:32:09 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d3e9f60bf4so637803a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 02:32:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6883f65c3sm570270766b.157.2024.12.12.02.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 02:32:14 -0800 (PST)
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
X-Inumbo-ID: 57a91ca0-b874-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733999534; x=1734604334; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iT4yOZy9bBBTLa23VcD8bCT6eHB0VIw2gFb58wLvNaY=;
        b=LP4Iqo0Yu7Kh7hEDhu5PLfuyuBgAU35cjnrYt4r72iATZuqSaGfHTaOqmylZ0vytXy
         +4PvEVVgZ3Sa1nMWVm7iH1SVGkUa01iqirSWftcRoUOd0/E2ft/1TGMJ0ojGHxGDWnEe
         qn9Zt9MolSU+2hOIzdz3CxOIOZnZGbiitK2pTIshdW3Ia8SNKATqfyusPQckqqcZKh5K
         cYs/MmnwAXQvmPKxP8zbGfjESsYNJiUDZnbu4ahocETlMsSk0anbNmTo9FVLfnAtSO3j
         yWR8GbObofOyFvr4e4TVQ6d7wxNv5Me8uctIYGEQl++RiRk51gx67tHgARner1ON85Ca
         ZvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733999534; x=1734604334;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iT4yOZy9bBBTLa23VcD8bCT6eHB0VIw2gFb58wLvNaY=;
        b=xH2cAWmtSHSetllW4T8GhRuljhM1M5Fe91DEql+KOF+dNdo7LUygKwCKmJ0hr8/Z2G
         FgOgTUzdBsxxZihMQUq/xeEMpQL74xgJlMgmNjz7tDzoJ0c7AQzyHdn1iK05IHAXC/vJ
         pcjMCYCqI+pAlrP2YnLYd3CkVSogBgP6iIu0qEv4TCvtEuKQHaF2D/Hb0OwVsZVf9uo3
         qUczq9AiprtBljNyClxLAWb+cxuQ3J/L+VBLow4SWqWkakoiHR+F+mWc0XUpZB/KOJ/4
         EGw9HheMgqBUkW9flRiAy86PKcv+4Eff8gu5H5HYCpAyXX/UY+UQCIzjxcZBy07IH4Q3
         Cf9g==
X-Forwarded-Encrypted: i=1; AJvYcCVyTpJY9ERgyF1mn9FUuRyJxO1aqgSTEHpvhCXap16poebvzn6apKLxY6RJcGAhH95S7AXyJiwxxJA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhpMDkMJeudARu7kzZPlBpc6WpPMYK21ut1xXeWPOC9X2f/jXm
	+vbWhc8gnv8UKFRlB299//imv+if2+s3IAUuDoE4h13bJMPA5Ko3IqSsM9w4Xw==
X-Gm-Gg: ASbGncv2kOHTFtGzSLyXc3JWe/sIzgmp3XpS7W7Uhb6pFZwhOByCQndjeYnk4qMwsKv
	FNFtKp8m9dDRKHrmATU9/AOF3yAAm+8MCIVLTGv6EDSBTEMY5D2A+CYxCdhDvW6rlWERzytwFF4
	necRziIop4ceAqgucrCmgpGuRyVNyO0uAqbuLdv3BTQEUymCMtpZyCC23CfAxRt/LeOGZnJfEMx
	a8hgS0QEo4G3/W6DK0E4dLoMr1je8C/dTWq9dXaqh3jDDsPXPmXLhqm0XDoaKeIb5VsOiS6jFtE
	MhfpxWmNqs5iqeHatyDAMhgyMR/417bCGf2s5c7SXw==
X-Google-Smtp-Source: AGHT+IFUuk9sKqx0ukJ9vqsJVOugBcZnW02Jk+t/2I1mC1xX9cbjYFZlUUjKwgcvKyRiShlBQVJLSQ==
X-Received: by 2002:a17:906:31d2:b0:aa6:9461:a17e with SMTP id a640c23a62f3a-aa6c1cef49emr333485966b.40.1733999534454;
        Thu, 12 Dec 2024 02:32:14 -0800 (PST)
Message-ID: <26600bb0-93af-45b5-a341-5771bad844a1@suse.com>
Date: Thu, 12 Dec 2024 11:32:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: address violation of MISRA C Rule 11.1
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 consulting@bugseng.com, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <7debd63f3900bad62bcbcc03081e4c04e6099135.1733914487.git.alessandro.zucchelli@bugseng.com>
 <bded3d90-0644-46c2-a43e-d6b06faa5650@suse.com>
 <alpine.DEB.2.22.394.2412111826440.463523@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2412111826440.463523@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2024 03:27, Stefano Stabellini wrote:
> On Wed, 11 Dec 2024, Jan Beulich wrote:
>> On 11.12.2024 12:02, Alessandro Zucchelli wrote:
>>> Rule 11.1 states as following: "Conversions shall not be performed
>>> between a pointer to a function and any other type".
>>>
>>> Functions "__machine_restart" and "__machine_halt" in "x86/shutdown.c"
>>> and "halt_this_cpu" in "arm/shutdown.c" are defined as noreturn
>>> functions and subsequently passed as parameters to function calls.
>>> This violates the rule in Clang, where the "noreturn" attribute is
>>> considered part of the function"s type.
>>
>> I'm unaware of build issues with Clang, hence can you clarify how Clang's
>> view comes into play here? In principle various attributes ought to be
>> part of a function's type; iirc that's also the case for gcc. Yet how
>> that matters to Eclair is still entirely unclear to me.
>>
>>> By removing the "noreturn"
>>> attribbute and replacing it with uses of the ASSERT_UNREACHABLE macro,
>>> these violations are addressed.
>>
>> Papered over, I'd say. What about release builds, for example?
>>
>> Deleting the attribute also has a clear downside documentation-wise. If
>> we really mean to remove them from what the compiler gets to see, I think
>> we ought to still retain them in commented-out shape.
> 
> Another option would be to #define noreturn to nothing for ECLAIR builds ?

That again would feel like papering over things. Plus I don't know if that's
an option at all.

Jan

