Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16820835F40
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 11:16:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669733.1042100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRrL6-0004qC-SW; Mon, 22 Jan 2024 10:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669733.1042100; Mon, 22 Jan 2024 10:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRrL6-0004oB-Pi; Mon, 22 Jan 2024 10:15:36 +0000
Received: by outflank-mailman (input) for mailman id 669733;
 Mon, 22 Jan 2024 10:15:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VPlZ=JA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rRrL5-0004o5-AZ
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 10:15:35 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d3edd6e-b90f-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 11:15:33 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2cddb11b2e2so35194901fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 02:15:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c25-20020a5d9759000000b007bf78513320sm2218986ioo.1.2024.01.22.02.15.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 02:15:32 -0800 (PST)
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
X-Inumbo-ID: 2d3edd6e-b90f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705918532; x=1706523332; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HbjozXWzpx1hqffCkCwx2d/eeX4UlVOkuwO/uwYb+E0=;
        b=gA34OfAUZ1AfyomxVvBmB/3+FGiuVpyma1eMCVj5I2JI83dcZHxcHDEFh/chT0eBE5
         hmhBGwd723llcLdowbgeuaSaWxfts6xvNFy9/D0dvDXLc7wsQg1WYh7zqb1BB3CNbgLL
         b2jq8IJ0JiZGKairzDyu8Jdrk8P4ofs7yIQN1vF4YfucyjwO2YuO8NrPr6ZZ7m3ookNX
         /Jh6eyDWCT+IPcF8fXbbQtpoLplk22b1LLAqfqM1Laynt/TQNBsImKIGEnnuz7exzQh+
         n8sel7c032j/okD6VV5dL3w6CguYVnUw6cLYIBU3TzGDuRmE1XC4ezMk01ygY8tacL2E
         TXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705918532; x=1706523332;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbjozXWzpx1hqffCkCwx2d/eeX4UlVOkuwO/uwYb+E0=;
        b=AeC4gv61HKITJYKR8jSRWkZlOXBuFycUutdEUt2uTOMe2KkdR8pX9akqaxbbIc1/NZ
         IR95C0bm/eu7SZZD6YfDGZQY6Xq7gQHNe/eYsX/ZOEdNRn3DxLnC/7OLGQbWo0ay655J
         SsLlFDc7tSmvoMrARaCJ1nUfJax6bX9Wr5jEtazNGaFHNLR+VhGd8flrs06dlKywFp1c
         DQXs0VG+HXFOw05pr8DcP9SUVKMF7ITVyrkFaxLXCJwao2sEGZHY7q+EDiCURpkTLrgP
         NbT842+YfiV250OdFNx7An37cjQNIcXP8tiV78sJkPekPX7L3gxlAiWGGCbAcbf1+dK9
         WPRA==
X-Gm-Message-State: AOJu0Yww0iho/ejkJsfp8SzlGJV26ujXQnB5Kkn8xneayOOb8tyAn12Z
	O+OmcmDBJRjUrLHaAKtpJvajOEKRMCehbUOtWQV71Tm3IbwIjk6eP04mrT1cqw==
X-Google-Smtp-Source: AGHT+IEThq9FD8Q/ImCmARC2lxADcNrcuZuZenUuKTpn3dtGoC7nubZNNPusVRaqehc7B7BFea5C9g==
X-Received: by 2002:a2e:3806:0:b0:2cd:1ca6:87bf with SMTP id f6-20020a2e3806000000b002cd1ca687bfmr1625550lja.8.1705918532556;
        Mon, 22 Jan 2024 02:15:32 -0800 (PST)
Message-ID: <fb6c7b54-d63d-4e83-ba33-58dc61f4528f@suse.com>
Date: Mon, 22 Jan 2024 11:15:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Community Process Group - Proposal
To: Kelly Choi <kelly.choi@cloud.com>
Cc: xen-devel@lists.xenproject.org, committers@xenproject.org,
 Yann Dirson <yann.dirson@vates.tech>
References: <CAO-mL=yvVWjnOHSFSqcrknoXOqk-N3JY76qObQnzftrkmsq6xw@mail.gmail.com>
 <509c9419-650a-4a7c-83e4-7a5204c53645@vates.tech>
 <CAO-mL=zL2gknk5OE0NBcQjoq8sE=2c=Zs+9KhzKMxKcwtx4wpA@mail.gmail.com>
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
In-Reply-To: <CAO-mL=zL2gknk5OE0NBcQjoq8sE=2c=Zs+9KhzKMxKcwtx4wpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.01.2024 17:37, Kelly Choi wrote:
> On Thu, Jan 18, 2024 at 10:09 AM Yann Dirson <yann.dirson@vates.tech> wrote:
>> On 1/17/24 18:10, Kelly Choi wrote:
>>> A survey was recently conducted to identify how the community as a whole
>>> feels about a certain situation. It was not intended to ban specific
>>> wording or create a policy to do so, but more to give context that the
>>> community has a wide range of ideas, and individuals may agree and
>>> disagree a lot more frequently than we as individuals might think. It
>>> helps us understand that as a community there are many situations where
>>> it is not clear. As such, the results indicated a very even split among
>>> the community, which indicates a larger problem as we may not always
>>> come to agreement.
>>>
>>> There is obvious frustration with how certain matters are handled, as
>>> some members may want the project to move faster, whereas others like to
>>> take a cautious approach. Given we are an open source project,
>>> differences in opinion are likely to happen and what we don’t want to do
>>> is cause further frustration.
>>>
>>> *This is where I would like to propose the idea of a ‘Community Process
>>> Group’.*
>>
>> That made me look for a list of official roles in the project, which I
>> found at [0].  How up-to-date is this list?  The Release Manager role is
>> mentioned there but not described, the Community Manager role is not
>> mentioned at all, and the only link to get project leadership info [1]
>> redirects to unrelated information.
>>
>> [0] https://xenproject.org/developers/governance/#roles-local
>> [1] https://xenproject.org/developers/teams/hypervisor
>>
>> I feel it would be necessary to have a clear view on the current
>> situation, before adding more structures.
>>
> 
> Aspects of the information on the website are outdated and do require
> reviewing as part of a wider governance update.
> However, the majority of the information such as the roles of committers is
> still accurate. In this specific instance, the CPG would act fairly similar
> to a project lead in terms of progressing the project forward. Rather than
> it being one person, it will be a collective group of elected members. From
> my understanding, we haven't had a project lead for a very long time within
> the project and this was before the governance was formalized. If the
> community is happy, we can replace the project lead role with the CPG.

It was my understanding that with the departure of Keir, it was intentional
that the "project lead" became a team (the committers) rather than again a
(then largely randomly selected) individual. If that understanding of mine
matches that of others, I don't think there's a need to change anything.

Jan

