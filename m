Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9DCA54CA8
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 14:53:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903554.1311509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqBfA-0001e1-GD; Thu, 06 Mar 2025 13:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903554.1311509; Thu, 06 Mar 2025 13:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqBfA-0001cE-Aj; Thu, 06 Mar 2025 13:53:24 +0000
Received: by outflank-mailman (input) for mailman id 903554;
 Thu, 06 Mar 2025 13:53:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqBf9-0001bz-8i
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 13:53:23 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d11153b-fa92-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 14:53:20 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43bbb440520so7661495e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 05:53:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfcb8sm2142417f8f.33.2025.03.06.05.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 05:53:19 -0800 (PST)
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
X-Inumbo-ID: 5d11153b-fa92-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741269200; x=1741874000; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qT1x+ulaThyGriwOwx7YIEF9wd6WAWno+Iwl4h3I0mk=;
        b=Q3UvoR/1E+vvA9H9xCfg9N83ojdCv35nsb4scnhLJTrDRqbFS2l4ZFiuJWJPNgy/Hl
         wlmXv1ikwdKfWZBYZ9gi7hF8ft0clv0tepsnTNxygJf2jVl1jCM1IgRWitNz3oiq/rOL
         ti2FxAoY1tH6PUc42fHHOG00p74gBXfCtIoSxQFlEzAkq1qwLSxxERaHKJwfzzGRBgYz
         HvEvsIHozfPWz0T9nTyWUTzac89mkk6WcP0EZpWIIrL1LJ66d4pN62Z2pyxgRM9jt560
         pnUmg7WNFIuet1JK14E6nzzpMSNjN+D/R/22UPKnNooZCqCvBe57y+d4U4kmHLBeIjBL
         Obng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741269200; x=1741874000;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qT1x+ulaThyGriwOwx7YIEF9wd6WAWno+Iwl4h3I0mk=;
        b=jAbX0ikbL7BXaHkBoc3iOxTY6jMUvV7A0oekh2OfhwAQ3NuDOOp1d+PXDTeWWcOLjM
         1+vlST+xiyLz4ebKysFzUysATRDx/zNn0P+LCvAT0UKrrN7nvAoeKkZFcGD7vURwlupn
         W8yisnUNzUPW84VlS/dhoG54g+Lyy9b2xWODBM0Pi4Iw3BUMBeuTjxrZbdzzwsrxJwjL
         C0gGAM3UiKqn2l4vHKH/bLYVWNdJVPKuVWY/H718e77FLhbsz2JMRR4sdAgT/V/06U9e
         qYngXSjDiK3Xue4UrqBRLBlaMgAcLmuc5C3BTu7r8K+Q9X2tnRtrX7UsghcDOih7v+St
         KWVw==
X-Gm-Message-State: AOJu0YyL8ISM5BNwJ8GqJF2pFjDoCfw5hgnODzxFWXKauIKglojdQdMc
	ugIO3js/Y/+PDyl5T/dx16/2ZGh5ZWavONVXoie8XPVx47sVOhwBWYIkwt1yvQ==
X-Gm-Gg: ASbGncu0+hWzeK+wweoINeWtroJPUT31WPAtW2TIA4dZf1i31EQMx6BoBbSkDMXCwXO
	8fRY1PJQ4bIhiMpvRKoOJoO4TVGci3+gPl3ueIu2AV67UXTO17kKyFM031EXgZ23LG3j9JXgmHO
	Ljwu2Sm1bj8F2VcbENM7Mw8UqwsjYxHlKGjxd0w07fXemz23GXLaP5Va6SCrLB7ms+JIL0Nd/df
	tg1NzEK80dRO8bGr/3Iwz8EEdse+fbjL6YqTvhO56o549G3e6WF6+P13Km8uT2atNJ6frBCkaUn
	/kKpLpP9wmYk7K3J3wTM/2Mvk9j3vtt/2gOB6W9AAL9JNzcdewH9DB44LjzP5duf9V0aOqjUAkN
	y9DeuJle6UcH6545jHhUj1fwEk33LQw==
X-Google-Smtp-Source: AGHT+IF2X6notgrJdgunewzuoDmpOiR51gSMhSZbWSTcsC70c6A0eY25zVmR/MmpvP65u79uNxrppA==
X-Received: by 2002:adf:8b5e:0:b0:391:2a9a:4796 with SMTP id ffacd0b85a97d-3912a9a4963mr1980743f8f.18.1741269200038;
        Thu, 06 Mar 2025 05:53:20 -0800 (PST)
Message-ID: <98ed1cc8-48e9-4db0-8d0c-78c63fc2e4fe@suse.com>
Date: Thu, 6 Mar 2025 14:53:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/9] remove libxenctrl usage from xenstored
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250204113407.16839-1-jgross@suse.com>
 <6e63a858-9554-440b-92f1-55dc34256e0b@suse.com>
 <9c8f50d4-9139-4541-8acb-ff407b61ef97@suse.com>
 <alpine.DEB.2.22.394.2503051531380.1303386@ubuntu-linux-20-04-desktop>
 <c26a91be-8f13-4e22-be87-a96b81df0aa4@suse.com>
 <0ef805d0-68f1-4fb2-a6bb-5901304270bd@suse.com>
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
In-Reply-To: <0ef805d0-68f1-4fb2-a6bb-5901304270bd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.03.2025 14:27, Jürgen Groß wrote:
> On 06.03.25 14:13, Jan Beulich wrote:
>> On 06.03.2025 00:32, Stefano Stabellini wrote:
>>> On Wed, 5 Mar 2025, Juergen Gross wrote:
>>>> On 25.02.25 12:10, Juergen Gross wrote:
>>>>> Ping? Especially ...
>>>>>
>>>>> On 04.02.25 12:33, Juergen Gross wrote:
>>>>>> Xenstored is using libxenctrl for only one purpose: to get information
>>>>>> about state of domains.
>>>>>>
>>>>>> This patch series is removing that dependency by introducing a new
>>>>>> stable interface which can be used by xenstored instead.
>>>>>>
>>>>>> There was a RFC series sent out 3 years ago, which I have taken as a
>>>>>> base and by addressing all comments from back then.
>>>>>>
>>>>>> The main differences since that RFC series are:
>>>>>>
>>>>>> - Instead of introducing an new main hypercall for a stable management
>>>>>>     interface I have just added a new domctl sub-op, as requested in 2021.
>>>>>>
>>>>>> - I have added a new library libxenmanage for easy use of the new
>>>>>>     stable hypervisor interface. Main motivation for adding the library
>>>>>>     was the recent attempt to decouple oxenstored from the Xen git tree.
>>>>>>     By using the new library, oxenstored could benefit in the same way as
>>>>>>     xenstored from the new interface: it would be possible to rely on
>>>>>>     stable libraries only.
>>>>>>
>>>>>> - Mini-OS has gained some more config options recently, so it was rather
>>>>>>     easy to make xenstore[pvh]-stubdom independent from libxenctrl, too.
>>>>>>
>>>>>> Please note that the last 4 patches can be committed only after the
>>>>>> related Mini-OS patch "config: add support for libxenmanage" has gone in
>>>>>> AND the Mini-OS commit-id has been updated in Config.mk accordingly! The
>>>>>> Mini-OS patch has been Acked already, so it can go in as soon as patch
>>>>>> 5 of this series (the one introducing libxenmanage) has been committed.
>>>>>>
>>>>>> As patches 1 and 2 change current behavior, Jan didn't want to give his
>>>>>> Ack (he didn't reject the patch either). So I'm asking other "Rest"
>>>>>> maintainers to look at those patches specifically.
>>>>>
>>>>> ... patches 1 and 2 could need an additional opinion.
>>>>
>>>> And another ping.
>>>>
>>>> One of Andrew, Stefano, Julien, Roger, Anthony, Mical: Please have a look.
>>>>
>>>> The related discussion between Jan and me can be found here (patches 2 and 3):
>>>>
>>>> https://lore.kernel.org/xen-devel/20250107101711.5980-1-jgross@suse.com/
>>>
>>> I didn't do an in-details review but based on Jan's comments and your
>>> replies, I think they are an improvement. If someone else wants to do a
>>> proper review, they would be welcome.
>>>
>>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> I've taken the conservative approach and interpreted this as an ack for the
>> two patches in question only, rather than the entire series. Please indicate
>> if it was meant the other way around, as then the final 3 patches could also
>> go in.
> 
> Sorry, but please revert the last patch of this series you've committed
> already. As stated in the cover letter AND that patch, a Mini-OS patch and
> the bump of the Mini-OS commit in Config.mk are required in order to avoid
> build failures when trying to build the Xenstore-stubdom binaries.

Indeed, I overlooked this while preparing what to commit (while I remember
noticing it earlier on). Still it's probably sub-optimal to have a series
split in the middle like this.

Instead of reverting, let's bump the MiniOS ref in staging instead, as you
did suggest on Matrix.

Jan

