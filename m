Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 592BEB2EF86
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 09:26:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087872.1445674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uozgS-0008ER-JJ; Thu, 21 Aug 2025 07:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087872.1445674; Thu, 21 Aug 2025 07:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uozgS-0008Bm-Fv; Thu, 21 Aug 2025 07:26:04 +0000
Received: by outflank-mailman (input) for mailman id 1087872;
 Thu, 21 Aug 2025 07:26:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Hha=3B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uozgR-0008Bf-GS
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 07:26:03 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 172b362e-7e60-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 09:26:02 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6188b6f501cso893314a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 00:26:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a757a48e2sm4588866a12.40.2025.08.21.00.26.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 00:26:01 -0700 (PDT)
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
X-Inumbo-ID: 172b362e-7e60-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755761161; x=1756365961; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bBq09f9kFg7RGpG/fvb2n8wMx0wExarpxgfmogGcM9g=;
        b=TfdXVMtyCJSkBmuHuNLu9nsSGHT3b1WfD44MyPNAj+nljxBQIcey6QdOtk6cTZjeD9
         zeXrdYU/9D6IPf8QxTtng5UW7Xh564hQazhYB2EuDx7B1NF2CmGYR7GE0exEj6EQXGj6
         e15LfLFlkR9ERQ6sxPpIXKaE4VUkyBrG+xrErzGWBYAAKfh89AScxGur8posfkn3vcOV
         Cm/O3sjjR9RA07MuF+PLbLA5GZj0tzwpMV5C9ENu2vJKjW8wsFmnYk67pttU1BPbvdsW
         kYEh20KbpM10iJfOAmlC1lDN82zK5lWo0bTO5ex1VHJ+8eRfv0WYq43wSx887akLMNxL
         4yfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755761161; x=1756365961;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBq09f9kFg7RGpG/fvb2n8wMx0wExarpxgfmogGcM9g=;
        b=TbrY1tvjqwMlLAfv8GSV6IYUQEW0jsnbbqw/Xl8/thg8RLwJJcCEmkZyKSQgeojj5Z
         Y5i6S6nQZIG0PUsFRG+ZWUbVC7D7IxhrzG0lzR5Pq7wlLXF2x3TXBTQOU1rq1IPT3ZQD
         dPs78sD+N3RxClM5v+ffjnDJz4i7DSpmM8N5ntvhT5v6FZNPvRzDEarx4D0L5d/NpPpz
         utUwnBOUNQt7tSDoRUsi1IFfWFmm+EsaEeEOwfCtcPYLu53I+5137uVJdrmEDk4HgBvt
         KgL6DZOjif7smXE4ovfDT83ijjunlhADHaU9UQ3WUHcs3AcjC1OUHREVlR9jsLRE22Ml
         q8zA==
X-Forwarded-Encrypted: i=1; AJvYcCUci2kMWzNkTBr63xHIy5abZMqJEadlH6rFo1JgiC8HWnGggyPqXP2QLFie77ZQItrAlT3Og4xqdXo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNlbWs9Qgj8gLrIyAPTgLVjp5DHXQXkLkjB2iNDIu5XIBQr8aM
	c5mwmwZRs/uB6A5EQkuSU6ozLJ9TwsjCx964Wsj8/GQ8M/yb6vxiT6NTjycJTyiqDQ==
X-Gm-Gg: ASbGncvidwxe8akBiF+s8VvYNsHreXmQRepfOa4tX2vdxam+0/w/cnFgVRl5DC2AWPl
	f8GRAFBsXVODuO7qRhzM1hjmnSe4RWpSZQg5RrEchdMvOYkf09pT1Mo5eF867ApCnT3IxDXXQj0
	qtGKWUz0QfdnEfNYnEAr/oOg85/xx6F2S/P9gcfGW/mI5PtqN/c9zXvQKIpD1fORZ8v99SUKSl6
	gCTWKSue2/CVSiI+UpeUCDsLS/dYv1lJY7/vgSPN9BjvxpWgs6iDjusukPOY7FYmsGDyLabAI0o
	BNY2siG3gJxisTpvCo81UOeOTtVD6Gd+OhIU/Z4l+HI/2l1C7hPOuibPkhgH8s0lbZIYlJ91Q8B
	9yjWxYOMS8uSPH3ytBHgzxDjc+Lzn8cAM7C8D5BETZAW7/0+1oFXnPv9p5ooo5zOctVQrd9xu7o
	7vgvZxp1w=
X-Google-Smtp-Source: AGHT+IEgObsfh055ty++CgfK9N/0T11igltGYlh/R8yWlWZftv/gHjCmD6BO6sVJ320AdApHyLZczg==
X-Received: by 2002:a05:6402:5244:b0:618:1e1:c204 with SMTP id 4fb4d7f45d1cf-61bf86e9477mr1265723a12.12.1755761161490;
        Thu, 21 Aug 2025 00:26:01 -0700 (PDT)
Message-ID: <eac220b7-d5e9-4710-a0fd-e69a0162df7d@suse.com>
Date: Thu, 21 Aug 2025 09:26:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] releases: use newer compression methods for tarballs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fdd60576-c852-4ce9-921d-9e77a86a3e66@suse.com>
 <f2105411-ac78-4283-a7d7-45f5b1bc0bfe@citrix.com>
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
In-Reply-To: <f2105411-ac78-4283-a7d7-45f5b1bc0bfe@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.08.2025 14:15, Andrew Cooper wrote:
> On 15/07/2025 7:33 am, Jan Beulich wrote:
>> It's unclear to me why we have git create a tarball, extract that, just
>> to then make a tarball again (without any special options, like to
>> override owner or timestamps;
> 
> That's because in c5be91eb8140 you deleted the intermediate step of
> merging qemus

Hmm, perhaps - I'm generally trying to keep the size of such changes down,
when working in an area I'm not overly familiar with.

>> in this context I notice that tarballs
>> created by Andrew have file ownership of andrew/andrew, while ones made
>> by Julien use root/root).
> 
> Ownership where exactly?  the tarball itself (which will be down to
> accounts on downloads.xenproject.org) or the tarball contents itself?

tarball contents.

>> lzip, unlike the other two tools, doesn't really show a progress
>> indicator with -v. Merely having final statistics may make the use of
>> the option here questionable.
> 
> I can't say I find any of the stats relevant.

Happy to drop the v options.

>> --- a/tools/misc/mktarball
>> +++ b/tools/misc/mktarball
>> @@ -31,4 +31,14 @@ git_archive_into $xen_root $tdir/xen-$de
>>  
>>  GZIP=-9v tar cz -f $xen_root/dist/xen-$desc.tar.gz -C $tdir xen-$desc
>>  
>> -echo "Source tarball in $xen_root/dist/xen-$desc.tar.gz"
>> +if [ -n "$(command -v xz)" ]
>> +then
>> +  tar c -C $tdir xen-$desc | $(command -v xz) -v -9 >$xen_root/dist/xen-$desc.tar.xz
>> +fi
>> +
>> +if [ -n "$(command -v lzip)" ]
>> +then
>> +  tar c -C $tdir xen-$desc | $(command -v lzip) -v -9 >$xen_root/dist/xen-$desc.tar.lz
>> +fi
>> +
>> +echo "Source tarball in $xen_root/dist/xen-$desc".tar.[glx]z
> 
> If we're deciding to use multiple compressions, they want to not be
> optional here.  I'd far rather have a reminder to install the package,
> than for it to simply be omitted.
> 
> We don't want to be re-tar-ing now that the qemu's are gone, so I think
> the structure wants to end up as:
> 
> git archive --format=tar HEAD > tmp.tar
> gzip -9 < tmp.tar > $xen_root/dist/xen-$desc.tar.gz &
> zx -9 < tmp.tar > $xen_root/dist/xen-$desc.tar.xz &
> lzip -9 < tmp.tar > $xen_root/dist/xen-$desc.tar.lz &
> wait
> 
> Might as well use the multiple cores better...

I, too, was thinking of that. Yet as per above, when fiddling with code I'm
not overly familiar with, I try to limit the amount of change done. As you
ask for a bigger change, I can certainly do so.

Jan

