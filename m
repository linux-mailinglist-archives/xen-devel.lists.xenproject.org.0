Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CF2AECCF5
	for <lists+xen-devel@lfdr.de>; Sun, 29 Jun 2025 15:48:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028636.1402431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVsNm-0007K1-Qp; Sun, 29 Jun 2025 13:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028636.1402431; Sun, 29 Jun 2025 13:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVsNm-0007Gx-Ku; Sun, 29 Jun 2025 13:47:46 +0000
Received: by outflank-mailman (input) for mailman id 1028636;
 Sun, 29 Jun 2025 13:47:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uVsNl-0007Gr-Mx
 for xen-devel@lists.xenproject.org; Sun, 29 Jun 2025 13:47:45 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0e9399a-54ef-11f0-a311-13f23c93f187;
 Sun, 29 Jun 2025 15:47:42 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a575a988f9so2253538f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 29 Jun 2025 06:47:42 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2ee:1da9:2a84:806b:ad68?
 (p200300cab711f2ee1da92a84806bad68.dip0.t-ipconnect.de.
 [2003:ca:b711:f2ee:1da9:2a84:806b:ad68])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45380705351sm114164475e9.0.2025.06.29.06.47.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jun 2025 06:47:41 -0700 (PDT)
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
X-Inumbo-ID: a0e9399a-54ef-11f0-a311-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751204862; x=1751809662; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s6Q61zuRf61D1alO3tt+0aoy+hlcumsezRb1wUXTQh8=;
        b=flbD3RTjwBXCgWRxkOcnY8/2oMVe/cQCNPRqWXuV/DpMu+2Vp3Gp2VkVT3JKCynqyB
         FQkLaYMaGNrESWFu2hEPq6SOIdigvVP90B+Q7xEf1rWNIeuvHozy6ow5n/72bfT6oXms
         xGBtr2s18sp7owrVGSYEec+6R3hQs6/FKs2XWSSWKRb13bo9uqJBGSJHmBfwCKRIKPfT
         Fgt6dNGKktONktNp00qe2H/XxYYx7xz6iKQ34kq6sU/3QLLfkfWWUwxBfEM6jLEjEocF
         GFsSf5GFIv5P1Pt59OKEZE/7VrAc1Sev4DbfgXOs7ZVbdv95C19Y20co1wg7D1eaS9mb
         0o1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751204862; x=1751809662;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6Q61zuRf61D1alO3tt+0aoy+hlcumsezRb1wUXTQh8=;
        b=L5Sx9+Nj18KogN5UEV2eq7ieQ53L2JGGRLRu0c19VitPw/6axgwV7ubZpuuud0AwAN
         h4+vWnaZgka1Cyu1at+ufwCB5/PEruA2I7Vo1B1mXKjSj3/zDnFs2ADQAfv2PW5M4tcD
         5Je67yVG2Ejf67fhf5CZXAe5dHvKHVAmEb8cdrrFnQphyc+C7ShjxHL1FB3dxFAggeL0
         eXLAC5aG1ebOqojfj+ZC5Goh3Y1/c0j6pP7tGEVTtSP0QwSoSpihZmscYWQFnsQg/l1v
         k+YXa2vODlUQsT+wpLvxHtokMGN4Ck54eoRaC3X5ec1eXqUqFbIFslk51sa1dUMADZ9g
         jpEg==
X-Forwarded-Encrypted: i=1; AJvYcCXGC7MIvyEEdRCLqDj4/EtLYrSzFE70PO6uoFg440Km6dlOvmVtEhEsYXomo8jRCJU2DhS43+RjYvM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzj2+TjSUyZq1sbIJrdW4p9wMdPrzwS/vvQGuAMpOYm875HpiNM
	Ede4NXIlTb4EIhKf4afJw2mvU55SSQWloYePi4TqfPDWTWmdyBUB8kNBk/x4mSRdEQ==
X-Gm-Gg: ASbGncsMmkQBSV46SpgcvMJVdJQW5ZqsSKtpAiRB10pFQUQBX1aUHuGTQnGcAJrL2LL
	eXpYkH8I/37Chp/Z5ZWEZK9e0nTBiqiSauiUIBeaolLwe0vuijYwMpRNgYv2V0f4cDJ9EkBrlIp
	q5wL3Qd3c7lA+XeLj9K3OLMU2u7/6I3GNtFEG8k6Fg3bs/IfRbSt2pAa5sBwA/J448Fx06a4t3E
	gNtoQ8uv173JYJnBRqzC8QPrTDcj5ruCEM2S1frK4//9GDxX+GN2xWeyJAcTc7evWcLSVQgK3ow
	pxBYsMksO3X0/Tpju302izCDQU+WYt2kbTI5GixALMGclchND14TYb2ElhuEwIUuaFf5tqBj8LJ
	/xIb0TxhKrLPW2qZgStPRSEj/buqr7jJRJC020AxQPn0z5Br2YEBhtr/piNM0RwKOd4huy2xjSK
	V9aHHpb5ft/Ls2owrLkhsK
X-Google-Smtp-Source: AGHT+IEOysRN1qEpAD1FP5Xvh4nPaPTenJWpcCzPnRX6vKG9jb4BJqjq9jLCjeg19Hxj91n54G732Q==
X-Received: by 2002:a05:6000:20c1:b0:3a6:d604:a017 with SMTP id ffacd0b85a97d-3a8fe891725mr6274267f8f.24.1751204861687;
        Sun, 29 Jun 2025 06:47:41 -0700 (PDT)
Message-ID: <ad15a6b0-59bf-48ab-89d1-e763923f6f4a@suse.com>
Date: Sun, 29 Jun 2025 15:47:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen/console: unify printout behavior for UART
 emulators
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: dmkhn@proton.me, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <20250606201102.2414022-1-dmukhin@ford.com>
 <20250606201102.2414022-3-dmukhin@ford.com>
 <bcb3d553-b8aa-42ab-a9c8-7abf6f5d02c3@suse.com> <aEjInVF3zaa+VVd2@kraken>
 <b27f7652-424f-479c-a4bc-ed2ecd46ccc8@suse.com>
 <alpine.DEB.2.22.394.2506111155400.542113@ubuntu-linux-20-04-desktop>
 <b9c263e0-3d8d-4966-8f54-611e58572118@suse.com>
 <alpine.DEB.2.22.394.2506171735440.1780597@ubuntu-linux-20-04-desktop>
 <2f726960-4bdc-4996-b204-722c0253e2ab@suse.com>
 <alpine.DEB.2.22.394.2506181742281.1780597@ubuntu-linux-20-04-desktop>
 <c444b8ff-13ab-4c54-8ba9-5cee72f0f155@xen.org>
 <alpine.DEB.2.22.394.2506271454160.862517@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2506271454160.862517@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.06.2025 23:58, Stefano Stabellini wrote:
> On Fri, 27 Jun 2025, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 19/06/2025 01:45, Stefano Stabellini wrote:
>>> On Wed, 18 Jun 2025, Jan Beulich wrote:
>>>> On 18.06.2025 02:39, Stefano Stabellini wrote:
>>>>> On Thu, 12 Jun 2025, Jan Beulich wrote:
>>>>>> On 11.06.2025 21:07, Stefano Stabellini wrote:
>>>>>>> On Wed, 11 Jun 2025, Jan Beulich wrote:
>>>>>>>> On 11.06.2025 02:07, dmkhn@proton.me wrote:
>>>>>>>>> On Tue, Jun 10, 2025 at 10:21:40AM +0200, Jan Beulich wrote:
>>>>>>>>>> On 06.06.2025 22:11, dmkhn@proton.me wrote:
>>>>>>>>>>> From: Denis Mukhin <dmukhin@ford.com>
>>>>> If I understood correctly I like your proposal. Let me rephrase it to
>>>>> make sure we are aligned. You are suggesting that:
>>>>>
>>>>> - domains without input focus will print with a (d<N>) prefix
>>>>> - the domain with input focus will print without a (d<N>) prefix
>>>>> - this applies to both DomUs and Dom0
>>>>
>>>> Except in the non-dom0less case, at least up and until there's at least
>>>> one other domain. I.e. I'd like to keep Dom0 boot output as it is today,
>>>> regardless of the presence of e.g. "conswitch=".
>>>
>>> In the non-dom0less case, since dom0 has focus, it would naturally be
>>> without (d<N>) prefix. Unless the user passes "conswitch=". Honestly, I
>>> wouldn't special-case conswitch= that way and would prefer keep things
>>> simple and consistent without corner cases. I don't think conswitch= is
>>> so widely used that it is worth the complexity to special-case it.
>>
>> I am a bit confused with the wording. Before I can provide another opinion, I
>> want to understand a bit more the concern.
>>
>> From my understanding the command line option "conswitch" is to allow the
>> admin to change with key is used to switch between Dom0 and Xen. By default
>> this is 'a'. So are you referring to the fact a trailing "x" (to not switch to
>> dom0 console) can be added?
> 
> Yes, conswitch can also be used to ask Xen to keep the input focus to
> itself, instead of giving it away to Dom0. I think this is the specific
> feature Jan was referring to when he said he is using conswitch and the
> proposal would change the way the output looks like for him, which is
> true.
> 
> Today, dom0 would still print without any prefix.
> 
> Tomorrow with this proposal, dom0 would print with a "(d0)" prefix
> because it doesn't have input focus.
> 
> The question is, with the new policy in place, whether this is worth the
> trouble of having a special case to remove the "(d0)" prefix in the
> conswitch=x case. I think it is not worth it, Jan thinks it is.

Just to clarify: Along with this mode being entered by conswitch=, I also
expect the behavior to remain unaltered when booting (non-dom0less)
without that option, and later flipping focus between Xen and Dom0 by
using triple Ctrl-a. I'm saying this just to make sure that an eventual
change to the patch wouldn't be keyed to the use of the command line
option.

Jan

