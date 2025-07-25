Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFB5B117E0
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 07:22:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057085.1425004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufAtJ-0005Lw-LV; Fri, 25 Jul 2025 05:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057085.1425004; Fri, 25 Jul 2025 05:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufAtJ-0005K4-IG; Fri, 25 Jul 2025 05:22:45 +0000
Received: by outflank-mailman (input) for mailman id 1057085;
 Fri, 25 Jul 2025 05:22:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ufAtI-0005Jw-J5
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 05:22:44 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63829745-6917-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 07:22:42 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b77683cc5bso98934f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 22:22:42 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2ab:e91f:46e4:60d0:c444?
 (p200300cab711f2abe91f46e460d0c444.dip0.t-ipconnect.de.
 [2003:ca:b711:f2ab:e91f:46e4:60d0:c444])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fcc2c4csm3938341f8f.73.2025.07.24.22.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 22:22:41 -0700 (PDT)
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
X-Inumbo-ID: 63829745-6917-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753420962; x=1754025762; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S7M5HNSXKYaQ7D0WVEVllFYM9NzQPgDInQBwlS+wld8=;
        b=GfV9A0DA8EhXVC+H9l6yScifAaW9kdqUFSlHFJnskhHAhdPC7llRAgHmgbzdkTtO88
         H9R88djiuVmspQjAdzCcI7xXjSjSmGVBY8u7Y6oroitI1wk0/hgEc+kiv2P5gA2TQ1sP
         KSXelFrneqeHOF17HCoYDrKsGoNDkypTO+PETfmng8IBf39cv4bXje4Hi4KV1gg3cFEF
         gNdsBZg/RuFjtNkipx5/rc6x8lx1sBBYCRutp/jDQwn/ZVzEZ2ee7hyIS1WiFW4uxSEf
         +Evxz03HuZKaWIvZsdGE5lZn3D5LJZNrIzBHGVh1Zk5Mrl9pZCAyC9+xLoAnOjxAbp13
         Ym8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753420962; x=1754025762;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7M5HNSXKYaQ7D0WVEVllFYM9NzQPgDInQBwlS+wld8=;
        b=mc3OTZM7xY3l2T4P8hvPx23FGcpR0dJN18/zl/fUnWXAie9DVtsR5KKlT8O7FDqNbd
         tTURfIGDMbOlcFtewyw1CpLu1A2kETAXdJWecxH48/GSouecEA1Y0S3b7xp9yHecvsBh
         JQGZHHyC5PYk0DDrO2FVMg/Ll2mq4zEcER05ZW/W6Mwgcem1tJajOKwuz8V+OxSf8csc
         RGLPBEEJ1YTfgMp1s7WxDlC+cwd8pHrFLvXO9nj33liPdkfh+HQtUCC4KI6jFE7lXgbw
         oujVARdMoqjgSTC5rl1KNrKp3MCJmOBQwP6kRLhg4sbPIf7YFhGfna1z9E9ij50ru2dM
         moBw==
X-Forwarded-Encrypted: i=1; AJvYcCXpNLXAibk2qCKDWsaTaqrwJ3r0TEYexN1SBlZQbffYB4Sv5DHhI+6BWpliGcccERcM9sd7pXG/5JE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHiHEou7KXJ61bVcYBR6Zqu+2VBc5LuXLV6o9RwCEsrbCvO8Uf
	EGq8h/tBqP1CIuzxDfr/3YDn/Bn6hJSP0EVoS0WHT0xgrvKBfjR34hI2q65KYimWvg==
X-Gm-Gg: ASbGncvsgdDeJ05JUzp2K/K54I7e6YDS8hrrMWNL69yZkvmehoI91ZoJlAlmeQnrC4Q
	3Kx82EVOz0NQa79yqf1gNsNlxEzH/jGbPFSVeogpjLtokXsaqNefZDCCiiW8eUb1B0nCfhmH3Dy
	Xar0FY9N6PPR5gdMfn7xUa1G1gt4H+7fFCdnoATCxCgNkl9Ji1+o97vQc4L2R35eIifCDyVNCTS
	szTwoLFwx1RJBzAhb/UoB3bJfpp4QlIKBIfkcg9vgQiCEPlkmVMJlbJ59OZlJSkk8Kqod28FBpQ
	lw092MGMezMNMTan5//7Pa8NNN7U+RM1QIdgE6p5JZjZMyuoaQvxrDxIYqQt0HkaiGjTewX5O3d
	nVDKU/sdczPFQz2HA7BmcIJJNG9SZFU/gr+/bEI8jPiw/5WrJX+KpygIKe63KBDmn6qRxXqbn7u
	7pMKDD/L80IHXa+AiI2l8ZNLh8Irh4VEm24cIRv9Kqs5lYpKYLEYMQ5Xyl
X-Google-Smtp-Source: AGHT+IHcMkhGBQ4rW8x1UDYfZqqe97cVmHwS7OFQOzpQ1XNJ665DrX0Jz6NdhoWKICxCgiT17qVHgA==
X-Received: by 2002:a05:6000:1ac6:b0:3a5:8a68:b81b with SMTP id ffacd0b85a97d-3b776674a27mr455759f8f.44.1753420962044;
        Thu, 24 Jul 2025 22:22:42 -0700 (PDT)
Message-ID: <64155a46-7cdd-4a96-802d-d3bfe5487111@suse.com>
Date: Fri, 25 Jul 2025 07:22:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/domain: Dump domain paging pool sizes with the rest
 of the pageframe info
To: Aidan Allen <aidan.allen1@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bernhard Kaindl <Bernhard.Kaindl@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <CANgacT8YrH66iUEPr60AVytXYMivPzxC0SO4_RPohjk1Vo2w8Q@mail.gmail.com>
 <a0892208-84c5-4cd6-b246-869e38ecf73c@suse.com>
 <CANgacT_idZJtjxo2v5RFBf3rBL6fmz1drtWt9o5y8yGJNc15ZQ@mail.gmail.com>
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
In-Reply-To: <CANgacT_idZJtjxo2v5RFBf3rBL6fmz1drtWt9o5y8yGJNc15ZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.07.2025 17:59, Aidan Allen wrote:
> On Thu, Jul 24, 2025 at 12:52 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 24.07.2025 13:40, Aidan Allen wrote:
>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -253,6 +253,10 @@ void dump_pageframe_info(struct domain *d)
>>>                 page->count_info, page->u.inuse.type_info);
>>>      }
>>>
>>> +    printk("    Domain paging pool: total: %d, free: %d, p2m: %d\n",
>>> +           d->arch.paging.total_pages, d->arch.paging.free_pages,
>>> +           d->arch.paging.p2m_pages);
>>
>> Should this perhaps be gated, to avoid printing all zeroes for domains not
>> using an paging mode? Whether to use paging_mode_enabled() to do so I'm not
>> sure, as a domain with no paging mode enabled could still have a paging
>> pool configured.
> 
> I can gate this on total_pages > 0 if that would address your concern
> with paging_mode_enabled().
> 
> However, regarding the gating itself, I don't believe that the line
> saved by not printing this
> is worth the potential confusion of somebody looking for this
> information and not finding
> it, I would prefer to leave it printing all zeroes.

While I can see your point, I also have to state that already on earlier
additions to the (bulky) output I was concerned of the overall (and
long term) output size growth. Especially when transmitted over a slow
serial line, any shortening counts imo. Anyway, I'm not going to insist,
first and foremost because I expect I'm the only one with this concern.

Somewhat related: With HVM=n and SHADOW_PAGING=n, this output isn't
useful at all, even if non-zero values were logged. All non-zero values
would indicate then is that someone pointlessly set up a paging pool
for a domain.

Jan

