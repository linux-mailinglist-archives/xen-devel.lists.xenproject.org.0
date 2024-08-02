Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A03945AC9
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 11:18:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770788.1181379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZoQ9-0000LD-7I; Fri, 02 Aug 2024 09:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770788.1181379; Fri, 02 Aug 2024 09:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZoQ9-0000Io-2k; Fri, 02 Aug 2024 09:17:57 +0000
Received: by outflank-mailman (input) for mailman id 770788;
 Fri, 02 Aug 2024 09:17:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZoQ7-00005g-A2
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 09:17:55 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 191ee0d9-50b0-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 11:17:53 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52efbb55d24so12251512e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 02:17:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9d4379asm75221166b.138.2024.08.02.02.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Aug 2024 02:17:52 -0700 (PDT)
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
X-Inumbo-ID: 191ee0d9-50b0-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722590273; x=1723195073; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZK76z8aIs69JD8JU7H2Y5Zjmu8Sx0T3prGDbGcYxwk=;
        b=R8T2UqnzkeEo33+zoYzul1/iJ2xdD4q38m/fj8idtow2pxoe91TEZRL5rgJoJ/MKPK
         eLWRnnfuwNkWUEB3g1zY6U658fiWyRmbDD304vZzIuVVFoVJDyymOvYfTCEB7nTjxBV5
         aMAzQWM3tBllI7nHnR0iC7RlRnc8NYoivBydG8PgsB0Zix8JfJ0la26YZy+q+Sn24uDK
         TSKdDyFlIP1ryG0TEwcd2JM+aBdKb423O+eCN/pD/cB70mRvZZbz1VN2XIrlJeT1LisN
         l41kxuP45aTEi2QegtDoR7O+QpH5x3c6ExA6YzTk5AYaCBXP6LFdUPhpKDjLyzEmUalV
         0unQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722590273; x=1723195073;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZK76z8aIs69JD8JU7H2Y5Zjmu8Sx0T3prGDbGcYxwk=;
        b=ROH5N7cRs5zphmEXcxECR4lvC22Q6TMAzwUkkXwc1eaTVgbd7D3ucVub2HimY260VQ
         tUlHeurUXk/zKHo4VGz3H5YhRwgoUtIOB9Jxqa8CL49GExpbVhpvgjtw78/WdgJMXET7
         mO+YGeKhr2pVjF9c1YB6oOJmUBH3lanjJA5PyrtToDhwI1KhuZqNwt1UJclxXk3VKx1D
         O8Qc9gfvLxB/98ZIpRbrFgZ475/tfgowNIqnscGgLYzAG5pu0IzG2bVsL//7zBvAV/7F
         itdXr8b9E1uAmTH12GhjA4iEKJAJuep8qLc187BijDrLbX8DhGqF07yFly7TOwZ357Og
         43Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVvXP4voCEOjRnVwzEOEWQxsyTR3yB7y8IqTMWMGq2vUDVqT7JvKepurX8yzb9BuspsFN5LrRBZ8soUVoOxyk8V3n12oQfrzBzde3GkKJw=
X-Gm-Message-State: AOJu0YxMJUoK60UuNgnf7GAeUbi4+m/EvM7otOPb1bG9Qf3nCnOuEB/Y
	x1DsnFyI6b44PpQZK5vU4h7RcQktBjh3kQ2yCbogrCbMZom5eRINpYNrOfBgnw==
X-Google-Smtp-Source: AGHT+IEZa+3Rnvqd7ejylT4hm530vMludnq4Qyn2gi9imnnFCTi0ah98oKOhSIBGMWqOhwWNhdIXYQ==
X-Received: by 2002:ac2:4e0b:0:b0:52c:db76:2a7a with SMTP id 2adb3069b0e04-530bb393e72mr2318788e87.34.1722590273174;
        Fri, 02 Aug 2024 02:17:53 -0700 (PDT)
Message-ID: <ec1a68d4-a3a5-4c47-ad8c-9055abc9a2ec@suse.com>
Date: Fri, 2 Aug 2024 11:17:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>
References: <Zqn7HEuooChgRCuf@macbook>
 <d65ae152-22ee-4a57-8ff4-43ef0c234f5f@suse.com> <ZqoF55yapMxGN_WM@macbook>
 <fa33fbf8-32b6-48dc-a30c-dd76b021a76d@suse.com> <ZqogJVHV36ytYVP1@macbook>
 <ff922c7a-aa66-4b23-8b9f-63b0b403ff14@suse.com> <Zqo2N7CDshL7ZoMK@macbook>
 <BL1PR12MB584914D078416A5F0ECA0AE0E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZqyUxv7UcaRcksCG@macbook>
 <BL1PR12MB584967C87F8EBC9B753C7B10E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZqyaWryc_42KSnK_@macbook>
 <BL1PR12MB58493838F5F7A13AC3DC80E5E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58493838F5F7A13AC3DC80E5E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.08.2024 10:40, Chen, Jiqian wrote:
> On 2024/8/2 16:35, Roger Pau Monné wrote:
>> On Fri, Aug 02, 2024 at 08:17:15AM +0000, Chen, Jiqian wrote:
>>> On 2024/8/2 16:11, Roger Pau Monné wrote:
>>>> I think this patch needs to be adjusted to drop the change to
>>>> xen/arch/x86/physdev.c, as just allowing PHYSDEVOP_{,un}map_pirq
>>>> without any change to do_physdev_op() should result in the correct
>>>> behavior.
>>> Do you mean that I don't need to add any further restrictions in do_physdev_op(), just simply allow PHYSDEVOP_{,un}map_pirq in hvm_physdev_op() ?
>>
>> That's my understanding, yes, no further restrictions should be added.
> 
> Are you okey with this?

I think I already indicated so - yes, for the time being.

Jan

