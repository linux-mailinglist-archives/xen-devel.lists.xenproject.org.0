Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37621B2F49B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 11:52:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088324.1446083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up1y8-0003vy-5Z; Thu, 21 Aug 2025 09:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088324.1446083; Thu, 21 Aug 2025 09:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up1y8-0003tP-2P; Thu, 21 Aug 2025 09:52:28 +0000
Received: by outflank-mailman (input) for mailman id 1088324;
 Thu, 21 Aug 2025 09:52:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Hha=3B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1up1y6-0003s3-46
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 09:52:26 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a4dc3bd-7e74-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 11:52:25 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-afcb79db329so113683966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 02:52:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded479868sm358933966b.58.2025.08.21.02.52.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 02:52:24 -0700 (PDT)
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
X-Inumbo-ID: 8a4dc3bd-7e74-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755769944; x=1756374744; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DGvzAJ5la8F34sMYmVBXoIu/QJlwI8wttBjk8XB0yFg=;
        b=QAEbcQ/sVpMU1ncT5x/Wy7w0mzTsYhYWHEGVhN0T2T+nIN0yHNcWVIJ4l4g7/bu5e3
         SzmUB0u9DwapAHn7C18dXFbOBGd9mN9e67uWjAT1B8va6LZ8wuDwLlQN8+KITDRdKynk
         GliRX9ETqA728/dDF5c3U9qAUGHRsFyKmty26q9OfDMgMCBWxH/ydbzQCMzKcSJDrsov
         dzNmrCuBxKAZn5OC/+sTYtxGzvfZpT/HMDM2JfErwq1T3dX2180erirnMXc+JcPpJgFi
         10IHQ15B6PUU3ZCrHm9E5diCh2zed7y38mJmR3NwSt77mRQDISP1sSZmBF6xfyUi8h37
         ZAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755769944; x=1756374744;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGvzAJ5la8F34sMYmVBXoIu/QJlwI8wttBjk8XB0yFg=;
        b=BIZ7PGgeJ7LVKdSzXQMX1trG3Bx7MIwOzHhRw3trWEa9raV5XYXbAujZo9IpuSeKrm
         AzipQallmfyLGs942Pa/i4uV5bEZnYSt+jc8GhgkYzwd6j652bpOoIQUz2KGN4jkAXMN
         At+WVSznvcT4aKKvg4ITWR4Aio8Hu/g1SRtPTLzvB4bgbSZrxbHqSFQzqRFgE0m43g7C
         ZaMtgcISafqSdbp3/vXam2Ci6Kdl7dWdx6BUdnawnB8VGMfoyV4acPlR4SkbsaoCTcDA
         yswdVDY6gpsEkrKjYU46eu41zAOgg6p6J/OTBuABHGOXTszpS18RUVUfdOJqUxekH6GM
         GYUA==
X-Forwarded-Encrypted: i=1; AJvYcCWU4mIUWK4GYnand1Ap+ivJEQC3chC97Co13RmkxdwHNqXqcg+Sst7x+33Uvqp7/TB72+jXuq047oc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwCSP8+g7bMgbgnpXY/KwcpQxRJFGKuRwnm9e5uSF7vGmCArzD
	J2ctzer71v1YAWVzfexDFiFZg5n3T5BE32Ud/q4FkjhMlnHs/Oes3Oh2xEPDHLD4jA==
X-Gm-Gg: ASbGnctMofqudVdmXcgeSKbfBmKefaio8Qw0Q5QGonzOSmZ9JI23CMxTg9tQCg9w7Ol
	S6CsjuZixCQmrpzT9gVzfE4rbhDOJeNAqhFxzNhG8jMK1HOFGmPPayH0TdRq8ef0Gzi8+lOL548
	0FaXNHhPf+/nCtTuRQXOsoqhh5/sT394TlnbnlFyQ6g1cBa/JwBaQ1yLYuAOJG+1zUUAHKQIJ8R
	O7L2/5/m/Ja7DgMuT3OQExkPpQsIoUPdsNNLCbGAwstam1ZC9DrDdCcaQbmtZ/z32goHUofUbad
	cyOIpmT0VDsTvc9TsWwEYgsdo4hkDGGaM+ApW7SG/YtSC0hhRKQNl39WV+a9Lqjh4aJA3PL3pVG
	MEFmL3baUFTOUfU72HY7b6mmYo5+XdHDuqS9hQZbvrlsnoU5fPu+NhgsIrM6fMk8dXeVPhxixdV
	pK018naCUyjcoNcBIBAXx5IdXn4VQe
X-Google-Smtp-Source: AGHT+IHzt+tfDNgcndzcUZjq9e6tShbd3AdlAZy8mP9q1Nj7bCTSTTgqns/9VDmge6mQo+q2t3+ZrA==
X-Received: by 2002:a17:907:9287:b0:afc:a190:848b with SMTP id a640c23a62f3a-afe07b3905fmr198568566b.39.1755769944377;
        Thu, 21 Aug 2025 02:52:24 -0700 (PDT)
Message-ID: <b4677d1f-436b-4afe-ab51-dbd1b874b926@suse.com>
Date: Thu, 21 Aug 2025 11:52:23 +0200
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
 <eac220b7-d5e9-4710-a0fd-e69a0162df7d@suse.com>
 <5b87bb85-3e52-453e-82ab-6d4f9b7eec28@citrix.com>
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
In-Reply-To: <5b87bb85-3e52-453e-82ab-6d4f9b7eec28@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.08.2025 11:31, Andrew Cooper wrote:
> On 21/08/2025 8:26 am, Jan Beulich wrote:
>> On 20.08.2025 14:15, Andrew Cooper wrote:
>>> On 15/07/2025 7:33 am, Jan Beulich wrote:
>>>> It's unclear to me why we have git create a tarball, extract that, just
>>>> to then make a tarball again (without any special options, like to
>>>> override owner or timestamps;
>>> That's because in c5be91eb8140 you deleted the intermediate step of
>>> merging qemus
>> Hmm, perhaps - I'm generally trying to keep the size of such changes down,
>> when working in an area I'm not overly familiar with.
>>
>>>> in this context I notice that tarballs
>>>> created by Andrew have file ownership of andrew/andrew, while ones made
>>>> by Julien use root/root).
>>> Ownership where exactly?  the tarball itself (which will be down to
>>> accounts on downloads.xenproject.org) or the tarball contents itself?
>> tarball contents.
>>
>>>> lzip, unlike the other two tools, doesn't really show a progress
>>>> indicator with -v. Merely having final statistics may make the use of
>>>> the option here questionable.
>>> I can't say I find any of the stats relevant.
>> Happy to drop the v options.
>>
>>>> --- a/tools/misc/mktarball
>>>> +++ b/tools/misc/mktarball
>>>> @@ -31,4 +31,14 @@ git_archive_into $xen_root $tdir/xen-$de
>>>>  
>>>>  GZIP=-9v tar cz -f $xen_root/dist/xen-$desc.tar.gz -C $tdir xen-$desc
>>>>  
>>>> -echo "Source tarball in $xen_root/dist/xen-$desc.tar.gz"
>>>> +if [ -n "$(command -v xz)" ]
>>>> +then
>>>> +  tar c -C $tdir xen-$desc | $(command -v xz) -v -9 >$xen_root/dist/xen-$desc.tar.xz
>>>> +fi
>>>> +
>>>> +if [ -n "$(command -v lzip)" ]
>>>> +then
>>>> +  tar c -C $tdir xen-$desc | $(command -v lzip) -v -9 >$xen_root/dist/xen-$desc.tar.lz
>>>> +fi
>>>> +
>>>> +echo "Source tarball in $xen_root/dist/xen-$desc".tar.[glx]z
>>> If we're deciding to use multiple compressions, they want to not be
>>> optional here.  I'd far rather have a reminder to install the package,
>>> than for it to simply be omitted.
>>>
>>> We don't want to be re-tar-ing now that the qemu's are gone, so I think
>>> the structure wants to end up as:
>>>
>>> git archive --format=tar HEAD > tmp.tar
>>> gzip -9 < tmp.tar > $xen_root/dist/xen-$desc.tar.gz &
>>> zx -9 < tmp.tar > $xen_root/dist/xen-$desc.tar.xz &
>>> lzip -9 < tmp.tar > $xen_root/dist/xen-$desc.tar.lz &
>>> wait
>>>
>>> Might as well use the multiple cores better...
>> I, too, was thinking of that. Yet as per above, when fiddling with code I'm
>> not overly familiar with, I try to limit the amount of change done. As you
>> ask for a bigger change, I can certainly do so.
> 
> Would you like me to do the patch then?

No worries, I'll make a v2. It's just that in some cases I'm asked to limit changes
to what's strictly necessary, yet then (when I try to from the start) in others I'm
asked to make a bigger change.

Jan

