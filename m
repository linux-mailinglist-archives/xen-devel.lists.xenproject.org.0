Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 776D3B037C0
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 09:21:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042590.1412642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubDUY-0004Hc-1i; Mon, 14 Jul 2025 07:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042590.1412642; Mon, 14 Jul 2025 07:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubDUX-0004Fq-Ug; Mon, 14 Jul 2025 07:20:49 +0000
Received: by outflank-mailman (input) for mailman id 1042590;
 Mon, 14 Jul 2025 07:20:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubDUW-0004ET-EM
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 07:20:48 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ff3b27c-6083-11f0-a318-13f23c93f187;
 Mon, 14 Jul 2025 09:20:47 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so3346297f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 00:20:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c22fdd815sm11052314a91.1.2025.07.14.00.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 00:20:46 -0700 (PDT)
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
X-Inumbo-ID: 0ff3b27c-6083-11f0-a318-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752477647; x=1753082447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7rZhWYI/Bl4CNnwHh4hqpLFs9DZA7fBK9VukbsxpWzM=;
        b=Dc0EVIKtb2yer2oKC4XtEnXyqdp8njKNw/oGwU3ibksG+cvrOyqS4+zkj3vuQ8hZqG
         msumDzPd9DtkBP+RZkP9g4sws+tZGcN4nVadDHo5i0oD+QCU8D2Iz7WL3N0om8/sV2Hj
         7Pka94ovstohhZDONmd9FTWI+VRBO8798ovUPnn5TMtOjcu80IEpYKHP+7Ok4Ss4u0+R
         09dl/SWayK8idzA0Fie/3TK22KW/MnTk+r7OSTxJpfppBnkCHDSk4hFIaixFjjNmSS/M
         tmJ1itb8JWg0vuls63iPmhq+073+biKoI7InHDHjRiMUVZFxarbnPUvEcEl1Qu5ngakd
         UPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752477647; x=1753082447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rZhWYI/Bl4CNnwHh4hqpLFs9DZA7fBK9VukbsxpWzM=;
        b=ZA0x00FQIXZcDSMVcRE1nufsATpAVUIZEGEVHi4XNpB4hh3n0NNf5GnNr2hXReGx5v
         yYypqzUv/by4vJLpCJghoWZA6hfkzvPO14a4DvDESMZM6AJ07PhlkG8Bovx4DygGW2qC
         TmOI1a1kli6UQJmG5m09UR9mBWIXNLqDzvzfKOFt5nHRGC2g1QlhrdtQr1TNdUtcGkn4
         jZ3slpNwWzgpURnfJ8EOzYrstdr3961hCwphJ8udUbym15U/4g27aHJvh/wLduYcwuCq
         Uw/fRbKNz7vsvQjfQeDzaduZnnS1UI87E7c7EJJv0dCQBvxb1DmGOufCF+vqwgpdR0w8
         Ujyg==
X-Forwarded-Encrypted: i=1; AJvYcCWZRPy4Vfo9t1+dLr0d9HriBN8KGpiZPbB0QCuRPT1XYjf45By4ZXE00ZumooRQt5ap0Be4SBueEJM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyX8YjnGnglvbo1YHfmW52YiQ4WSKJUUtSRqcxtsz4w0d3bByLD
	6Q26JsF8lwFax3EckcaP7kyHoovC5xcXgEodVutLyRm4UOZh3h4DPcipC5CqsGZ5Ww==
X-Gm-Gg: ASbGncuxtNwuVlbyoOVZrS/zl4EiXyKaKvrc1B/K6NOqKNv3xM/J4m1S0WBitggPCok
	1y6ENIkCvrf4iLMfsaBwrwjGffsB1P32B8o5Odb9M5hHT0babvna4U9RBJYqh0xZ0KaUHmEqR4E
	PUkaJ7gFDNBOYLJiNxgp9Rx0ivL5pzlua9eGqVnn65LfBzO0WIQQqQiSdejRNjxC7vwB4ZJXY7a
	p2WbsNbgfnUIkofOzxLLsasX3G+qEuVuPSjDjNviAPa1x9yD1Z/7oyl53MWxJF/AMCKkLPtBqwJ
	ZVzBrfNSvV9FEwlSbafiJpvnhYbk/23uxWLzKZaw1QzM6hD9WTkhgx4vz1CpRwJblClSf7GK/30
	taoAuUYYEqYS+juMi+sTBvAtQhgRAXBSzpxqCYy5gTr1SwU5DkhW+FmGxuszvT1eo+UcmTZtIMq
	iZymvHJSXxEXIDiCmaqw==
X-Google-Smtp-Source: AGHT+IHC75TNSd8kdtjNSxD3coS17rpoYW8/m2X4Qv2Bb22e09+aUsXyP3NbXPqhU0bMTus97KMz8Q==
X-Received: by 2002:a05:6000:2f84:b0:3a4:f70d:a65e with SMTP id ffacd0b85a97d-3b5f2e1bb53mr8471562f8f.37.1752477646665;
        Mon, 14 Jul 2025 00:20:46 -0700 (PDT)
Message-ID: <838d4cf8-771b-41cf-8332-b94e7a41a35f@suse.com>
Date: Mon, 14 Jul 2025 09:20:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] xen/arm: Support ARM standard PV time for domains
 created via toolstack
To: Koichiro Den <den@valinux.co.jp>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250705142703.2769819-1-den@valinux.co.jp>
 <20250705142703.2769819-6-den@valinux.co.jp>
 <fd8ce200-320a-406f-85b1-8087b9cc90a2@suse.com>
 <csgkv2lsyinwlmffu5sdr7tivhkd5zfykk6wyadon4cdncedmd@bulrngfqh6qj>
 <db37fd37-0896-4570-8002-834f0760353b@suse.com>
 <cfmt745ekbvxrbvnp2hoadf7vz5drpzbbf2n2s3zgkj4dadinb@2abe5g3bb25o>
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
In-Reply-To: <cfmt745ekbvxrbvnp2hoadf7vz5drpzbbf2n2s3zgkj4dadinb@2abe5g3bb25o>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.07.2025 10:31, Koichiro Den wrote:
> On Wed, Jul 09, 2025 at 11:16:02AM +0200, Jan Beulich wrote:
>> On 09.07.2025 10:04, Koichiro Den wrote:
>>> On Mon, Jul 07, 2025 at 10:01:47AM +0200, Jan Beulich wrote:
>>>> On 05.07.2025 16:27, Koichiro Den wrote:
>>>>> +        mfn = virt_to_mfn(d->arch.pv_time_regions[idx]);
>>>>> +        t = p2m_ram_ro;
>>>>
>>>> Is this the correct type to use here? That is, do you really mean guest write
>>>> attempts to be silently dropped, rather than being reported to the guest as a
>>>> fault? Then again I can't see such behavior being implemented on Arm, despite
>>>> the comment on the enumerator saying so (likely inherited from x86).
>>>
>>> No I didn't intend the "silently drop" behavior. IIUC, we may as well
>>> correct the comment on the enum for Arm:
>>>
>>>     diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
>>>     index 2d53bf9b6177..927c588dbcb0 100644
>>>     --- a/xen/arch/arm/include/asm/p2m.h
>>>     +++ b/xen/arch/arm/include/asm/p2m.h
>>>     @@ -123,7 +123,7 @@ struct p2m_domain {
>>>      typedef enum {
>>>          p2m_invalid = 0,    /* Nothing mapped here */
>>>          p2m_ram_rw,         /* Normal read/write guest RAM */
>>>     -    p2m_ram_ro,         /* Read-only; writes are silently dropped */
>>>     +    p2m_ram_ro,         /* Read-only */
>>
>> Don't know whether that's a good idea, as it'll diverge Arm from the same-
>> name P2M type that x86 has. (Arguably x86'es type may better be named
>> p2m_ram_write_ignore or some such.)
> 
> Thanks for sharing your thought. Incidentally, there seems to be the same
> comment in ppc's p2m.h as well.

That's likely (sorry to be blunt) due to blindly copying from Arm.

> I'm not sure at all but I'm guessing that
> "writes are silently dropped" line would make sense only when PoD

You can't silently drop writes in PoD mode, and PoD entries also have their
own type. All you can drop there are writes which store 0.

> and/or VM
> forking is to be supported by arm/ppc, and leaving it as it is for arm/ppc
> might be acceptable at the moment.

Leaving _behavior_ as is may indeed be acceptable. But naming and commentary
would still better change for things to be consistent across architectures,
rather than explicitly confusing people.

Jan

