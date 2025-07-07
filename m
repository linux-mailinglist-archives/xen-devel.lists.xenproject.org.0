Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C57AFAC3A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 08:54:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035225.1407431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYfjg-0002Dc-Oi; Mon, 07 Jul 2025 06:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035225.1407431; Mon, 07 Jul 2025 06:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYfjg-0002Ax-M0; Mon, 07 Jul 2025 06:53:56 +0000
Received: by outflank-mailman (input) for mailman id 1035225;
 Mon, 07 Jul 2025 06:53:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uYfjf-0002Ar-Ft
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 06:53:55 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2583ac65-5aff-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 08:53:54 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3b45edf2303so2542530f8f.2
 for <xen-devel@lists.xenproject.org>; Sun, 06 Jul 2025 23:53:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31a494237adsm9254543a91.0.2025.07.06.23.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jul 2025 23:53:53 -0700 (PDT)
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
X-Inumbo-ID: 2583ac65-5aff-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751871234; x=1752476034; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uws6Lbhoh9ys/vjuue6w35tjCN3S5klBrtxrG9TgOV4=;
        b=TRGNoNHuO9oNTR+FByqlu1lh1ocDiNkFeXXNVJV/ncVWvolzC8BAzZjHUwqLBExud2
         vm0zHysnRFSZ7GMzms3P+hB6ageaiIE57MEhDmFt1PUNOo5wXPEZFOLFMVIjlThOjLe6
         /3yL52yo37ko3hhPPaxEO9AADvYTnpBW+aa3J64ILGRaGscWNAxpVjggLNDWAeAtHGVh
         CYZtghWs77ijY40wI1lTDDE8uYFwdTW7P7axy8b4CYmktoNf0fL+NIGUZF1aPEEoGLvl
         eeIjxLBZaS/n6Vra5zZP8EcKMag90NkC3ade4S/usBg/CtdubqSSU6uSR+4R0PJr+6HB
         /SlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751871234; x=1752476034;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uws6Lbhoh9ys/vjuue6w35tjCN3S5klBrtxrG9TgOV4=;
        b=CaPGWax+oEJJF4sUIYavjv6W+Oot5iMWiups9nzubfvQLeZb1oa/RtS6Gqe94LavQc
         gnMxNJ8ZG1Ag0Y0/P1QY5LPF+/9DOzIkqjGepbTB9n02Yr8ECfDEF4z9Oz2+q2wtQepa
         /tb4GBWMeIsOWLRhyPnP5n3LZ1o+cjqI4JeEbt53SzULMWAA6fG6SZu12QVnKA2qjZIp
         lmP1JgtEgKqwMGuC3ZkmzmPuAgWy4ih4ELxs9L+sH86rOB+Rbqp90gnvFZW6qYNzTYyO
         omiQzRGaB2o4Q8T6nAXYOm4KGjTA9+SbfsxheXwgIrC6Oomfd1G2SBHBKL3llsPmlKj+
         FBKw==
X-Forwarded-Encrypted: i=1; AJvYcCW+3TPUaG0hnGvB0N7kFjMUexGOA8r3K5l8JpfA4MrPkC7DK3b0Yl6vKFxknYptl2I572eu7B8lQMY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx17c08Qo/zvnSZhLF3nhrlSor+bsBb+oW3tEfQGFkGejLoSEBv
	vXfZjJD8/fsoUsYcveg4F79QDyjBx64d/mHD8CgrzpIaS7Ohhm7pAANX5IMIU93kmg==
X-Gm-Gg: ASbGncvT8mgNFVGvV7k1n2v9NAeR1WGwJ+49kestEBF3GqNkhfoT5z29L7Pr1gAKfVG
	F7ikUjHOwD+moxN19QTtw9rvb8rfmOkFkroiT4plvUd40gDXR5Q0vjd2gF4uSyK87UC58HUAEq7
	4A9xwAxoXCixp4CLUQZTALLtUATiFLYjWObj4SpGOG4RNZby7lwGnf3/eil0VDEhsNNN0cuXYaB
	vGPtcn+eXkIL3MnA2q2+S4+guKG0tnOLrbUFwLIX+mnvLdCTJCGIfSNN4jniCS3nyw0fvJTAEuu
	T+nWY0twycVsAZLxPvCaxw6s4Pmz9BS9m+B9LYcNuCseRzdmjE0NZhA3+XtB7L/y66ojQoFbCfj
	7qVDKd4nZgrKQRf79qGKgifnwVdC467XYAbEfuU0KmOQGqCc=
X-Google-Smtp-Source: AGHT+IHQWEphqXMhaMBvjRcgbTfiOyhOca+UvpoqnzYl7Y3JEVW+S8H8TaboiXd1rE4Zhww/uH/kOA==
X-Received: by 2002:a05:6000:290a:b0:3a5:2949:6c38 with SMTP id ffacd0b85a97d-3b49aa82809mr5200973f8f.52.1751871233533;
        Sun, 06 Jul 2025 23:53:53 -0700 (PDT)
Message-ID: <e1381bec-b60e-4b7a-8070-04d4b1dc33af@suse.com>
Date: Mon, 7 Jul 2025 08:53:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] xen: Make the maximum number of altp2m views
 configurable for x86
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1751397919.git.w1benny@gmail.com>
 <c67fa5eca61e1058615d79ba836a9decf8d0fc89.1751397919.git.w1benny@gmail.com>
 <8733c6f6-27a6-4b5a-b921-e7f587d9baa6@suse.com>
 <CAKBKdXjavJtAH7zbcqepopcu5wa+tk8xNWxWic+1F2ePJpbSsQ@mail.gmail.com>
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
In-Reply-To: <CAKBKdXjavJtAH7zbcqepopcu5wa+tk8xNWxWic+1F2ePJpbSsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.07.2025 02:21, Petr Beneš wrote:
> On Wed, Jul 2, 2025 at 4:11 PM Jan Beulich <jbeulich@suse.com> wrote:
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -619,6 +619,8 @@ struct domain
>>>          unsigned int guest_request_sync          : 1;
>>>      } monitor;
>>>
>>> +    unsigned int nr_altp2m;    /* Number of altp2m tables. */
>>
>> We may have had that discussion earlier on, but it has been too long ago now:
>> Why is this not an x86-only field (i.e. in struct arch_domain)? Or one
>> dependent upon CONFIG_ALTP2M?
> 
> altp2m is not architecture specific. Though having it guarded with
> CONFIG_ALTP2M is a good idea. Of course, each of its ~40 usages (that
> is outside of altp2m.c) would have to be guarded, too.

Or you make a suitable wrapper, evaluating to compile-time-constant 0 when
ALTP2M=n.

Jan

