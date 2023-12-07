Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CFE80839D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 09:56:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649637.1014387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBAB0-0000pP-G0; Thu, 07 Dec 2023 08:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649637.1014387; Thu, 07 Dec 2023 08:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBAB0-0000n3-Ca; Thu, 07 Dec 2023 08:56:10 +0000
Received: by outflank-mailman (input) for mailman id 649637;
 Thu, 07 Dec 2023 08:56:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBAAy-0000kD-N9
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 08:56:08 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 749acf46-94de-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 09:56:05 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3333131e08dso789064f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 00:56:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h7-20020a5d6e07000000b003342e0745absm857943wrz.93.2023.12.07.00.56.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 00:56:04 -0800 (PST)
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
X-Inumbo-ID: 749acf46-94de-11ee-98e7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701939365; x=1702544165; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S6GVuLeBM7dfiiFpBtpz9TNBvmk//o3P2SOrGIZjrcY=;
        b=WsIVp12qaJAdtSD18OFpFQseXCfh+p9jc/Vae1WosaT1yxEKiHw19JbVHJF5+1F7O9
         7CJfXGpbmnF9LpXvYsD+R6/t+qDe73/EnaSjAPwr/OB9Je2akBRa4e6YXYDuqP+697Tn
         csUCW1ugN9zXDfGhSQHav4HwD0slaWouUcKhktXPWewS3men9C8zbJmAVmR6Um6Z8DMw
         U2nzusgU86b7Fbd3gO2jY9FiH5u5RkHjDVXsLA17nkwQOaL4DGlvOor/XqYlHQrrVq2I
         DTwR2pw/Ytgp6kg+H3TjKxrT5kuyJZ5KhR4yBOPJffpCCDZcBi/US5VSDzbMG1r+tLvL
         Tnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701939365; x=1702544165;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6GVuLeBM7dfiiFpBtpz9TNBvmk//o3P2SOrGIZjrcY=;
        b=foNhLkpMp3HBvGHx2wggFIS2r9DCh2AXE8Ws2J/OnzBq+cnVfYocpq60XFD54uNcF1
         Ywtq/dYQ08NUiRABxmQKYFnEoBOYByELSyVZg6n85mpe+Zjy5EoZGNkvPEAZqWenpNsy
         xZqRHjSD4iQqUSBpdTPWSNTRbmsJkmO/hld9yZgskRstfvwkVmjUf9qfu5pdC8HxBvey
         LwA1nOKTzrFO+uoajABR+8enrNfmLRW84F9c9AZSU+VXHZNd8FWxJbVSsvDyMzGQK5DO
         +cHS6LoYNo6wTQt1ltgaTc+OlooQpvKmSN5zIhMCBCoka3sVv625QYvKtEkewMuAFUib
         LFHg==
X-Gm-Message-State: AOJu0YwqZljfvt+Wp5dcPLlGTGpd2VxxUn20gZtbIL2a+8vjagTFOAHF
	vw03xskQJiDXsZcakHDa8T8a
X-Google-Smtp-Source: AGHT+IElAAL0hqX+iguqZa7iechUJcYPiAjiC/BmyVwhC+FBFiTJfIhkIWvfM909CM+wJAXBcWfyBQ==
X-Received: by 2002:adf:fec3:0:b0:334:b325:5415 with SMTP id q3-20020adffec3000000b00334b3255415mr705833wrs.29.1701939365118;
        Thu, 07 Dec 2023 00:56:05 -0800 (PST)
Message-ID: <208c360d-dd7f-4e53-8d3a-6bcc807cd649@suse.com>
Date: Thu, 7 Dec 2023 09:56:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Clang-format configuration discussion - pt 2
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@amd.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@cloud.com>
References: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
 <2E778E49-C2F5-421F-9598-CED15E7D4284@arm.com>
 <827e24a2-0ecd-48c4-becb-12129c4208dc@suse.com>
 <CA+zSX=b77av9rHwWHsRD8MAnprfXQiotUPPPKFDOU9cTOA2OzA@mail.gmail.com>
 <4ce995a3-78a1-49e5-881d-d6af10514673@xen.org>
 <b71c4e81-7026-40b2-ad76-ea4de5bbf6b3@suse.com>
 <52f25f40-ab42-4845-9912-81ce92cc4de6@xen.org>
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
In-Reply-To: <52f25f40-ab42-4845-9912-81ce92cc4de6@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.12.2023 09:43, Julien Grall wrote:
> On 07/12/2023 07:28, Jan Beulich wrote:
>> On 06.12.2023 18:55, Julien Grall wrote:
>>> On 06/12/2023 02:32, George Dunlap wrote:
>>>> On Tue, Dec 5, 2023 at 2:07 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 05.12.2023 14:46, Luca Fancellu wrote:
>>>>>> In my opinion, I don’t know of any tool that can address all the flexibility the Xen codestyle allows, yet the use of automatic
>>>>>> checkers would improve the review time, allow more new contributors to approach the community without being put down by
>>>>>> the amount of code-style comments,
>>>>>
>>>>> Since this argument is being repeated: I find it odd. No-one needs to even
>>>>> fear any amount of style comments if they simply follow the written down
>>>>> policy plus a tiny bit of common sense. According to my observation, (some)
>>>>> newcomers don't even care to look at what is being said about our style.
>>>>> It's not like you and I haven't been through this. When I started working
>>>>> with GNU toolchain, I had to adopt to their style. When I later started to
>>>>> work with Linux, I had to also adopt there. And then for Xen. And all of
>>>>> that already past closed source projects I had been working on before.
>>>
>>> I am not sure I get the point. With this argument, we are not only
>>> putting load on the contributors but also on the reviewers because we
>>> have to check the style manually while reviewing the code.
>>>
>>> Do you really think this is a good use of our time? Personally I don't
>>> think so and definitely there are more unwritten rule than you let
>>> transpire above.
>>>
>>> A good example is the "_" vs "-". If even a maintainer can't guess it,
>>> then how can a contributor know it?
>>
>> I didn't even hint at anything unwritten, did I?
> 
> You didn't and that was my point. I don't think we can put the unwritten 
> rules aside when arguing about how easy it is to follow our coding 
> style. They are usually the ones that tends to be the most contentious 
> and trigger the most debate everytime they come up...

Hmm, I see how you received my comment. It wasn't meant that way, though.
Instead I was trying to convey that even the little that is written down
is largely ignored. Writing down more isn't going to help. But yes, an
automatic checker would likely help in that direction. I'm specifically
not ...

> Obviously if you intend to avoid the coding style checker, then it will 
> be more difficult...

... trying to avoid a checker. What I'm trying to avoid are perhaps yet
more intrusive changes to the entire code base than we're already seeing
with Misra work.

Jan

