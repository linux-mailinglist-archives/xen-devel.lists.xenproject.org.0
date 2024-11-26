Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 834239D9B71
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 17:29:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843878.1259464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFyQn-0002e7-T6; Tue, 26 Nov 2024 16:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843878.1259464; Tue, 26 Nov 2024 16:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFyQn-0002cS-QX; Tue, 26 Nov 2024 16:28:53 +0000
Received: by outflank-mailman (input) for mailman id 843878;
 Tue, 26 Nov 2024 16:28:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFyQm-0002cK-SH
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 16:28:52 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83cd499a-ac13-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 17:28:48 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3824a089b2cso3495883f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 08:28:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde8fcdfsm167214035e9.32.2024.11.26.08.28.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 08:28:48 -0800 (PST)
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
X-Inumbo-ID: 83cd499a-ac13-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmEiLCJoZWxvIjoibWFpbC13cjEteDQyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjgzY2Q0OTlhLWFjMTMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjM4NTI4Ljk2NzI5Mywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732638528; x=1733243328; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6LbY2/Z8g3yZAlSZ2+2/h3c1vYNCFGWYirCl7GAhQYM=;
        b=EDWar1TBZing8oL3WffM2IQ3OWIKCsPIxa/uPowshDzLVzzjq3g4CmxzEiclC7GUoh
         TKOVz+QzNR8zptFSWUgo3ZFyx/rAld6tFXLk65bgUkV6GoERvKocLgUUYFkIrPSHf1mb
         sXSRxmBnPuHyPF/0eozamoYbGcPSulNsgWvK8hy1P3zQf2epLMsrt9HpVEDm6E6UEEDK
         /BSMS8VYzr+x/LRkzfSR+ADwsgJrQIv3M5HSEeLK7uE+S/0POb2O4mqpwniwwOOoXHNp
         X73f7mnzIs2C+pzUL5iRK9Yv+ES8ETJjdNDLVKMQOJfdNttytrZE3s8KRXDqgiWckT8z
         5wtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638528; x=1733243328;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LbY2/Z8g3yZAlSZ2+2/h3c1vYNCFGWYirCl7GAhQYM=;
        b=HM2B+Jkpm09N/3gmtca0Tlg2R6rETa/JQ8gLULjYWCHY/jLNxkTjpCqRhwW3w7zU5E
         aEquVCc3XGp2dW1XE0z4zk5JEq4FqJ1yAo6d/E/HlFCw8EloAbVXg2Topv7nXWhsUVlI
         xE/hr7T8R/g8eH3hEVBwcuzF6ckEdRXJCdgW27PM/stV/6IYZ24Mw0C6Ko7FFzbtlOrq
         hSOfF46EnsABKN9G9NcPGkMYYbGap2vjKnxzlBH4xI63VRXrEiEAom9i1zp6Ga81DIyA
         82g9LG6Rfk9PktCdG/MGc6PnVOh+C/nfm8gpATIu4EY4rK4j809hkvVaQySxsFfYLL2P
         PsUA==
X-Forwarded-Encrypted: i=1; AJvYcCWugr8jxBpiB3AcXIEAePrxAgmzM64VC5PIdc0NYR42kb/zYIRiqnlbz+NwZH9aDAqM0j373ihv52Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygPkTraa1c/oSvRFBwipzK+fDiFo6uymcrxgvBmVk5jXLCe4qY
	3FiJcsRNwVc/gzL5wZ7w2Qb6HfUsF2A1aXkSrBTN0gM8bL7SkpLtmUHZiyrkIg==
X-Gm-Gg: ASbGncsUH1rWBcLJCad/LDvK66Ib/Q2GPI+36D6VCGrgSWSjrz3bsNiiEbKf1r4sXvz
	b/Eog2+o6p+YWZbGjqh+jTIy2FV2ZHSSy7VM0rq+9g6u52EnDWTeqLT87oDubSRsVOfYMbERf5/
	i1jkiOB3Cwy06v+RfGIwHXnyTjeoh9KiBgQhojavci48hxEkstr+JmIWnM8VHftAp40jWFE0m26
	3voJbLP6NahxAZgph84CkVB2rbM87aItxUjuYO6xNu6/Sk9f0jJrYhvsh8/mieQ4HT5zsdS+Zyw
	A9uaFIYwWqJ2GGhtef3v9t2+1ChYH0/tEx0=
X-Google-Smtp-Source: AGHT+IFuwqCo23vZ7CQ2AEXcwrXSl4eUFZb+ZirE/SQjeBEt1ET2dlTeEk9vv6esat38KQBFkVeX7w==
X-Received: by 2002:a5d:64ce:0:b0:382:38e6:1eb3 with SMTP id ffacd0b85a97d-38260b86501mr12498017f8f.30.1732638528340;
        Tue, 26 Nov 2024 08:28:48 -0800 (PST)
Message-ID: <be2c69d0-2d6a-4774-a6b6-a71b44aaa41b@suse.com>
Date: Tue, 26 Nov 2024 17:28:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/25] xen: Replace sysctl/readconsole with
 autogenerated version
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
 <20241115115200.2824-13-alejandro.vallejo@cloud.com>
 <0a5a66d9-4fd4-4084-b7f9-0923d5a4c6d5@suse.com>
 <D5VHI2OA8QTK.1H4ZDUSP5EZX5@cloud.com>
 <737292fd-1c4a-4fd6-ae98-a701adb0b88e@suse.com>
 <D5W3YYDE2F09.IHJMRBUBE6EV@cloud.com>
 <e40ed7c2-6111-468e-8655-884953bd33e7@suse.com>
 <6bba75e1-72d9-482e-be11-40c549651f10@vates.tech>
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
In-Reply-To: <6bba75e1-72d9-482e-be11-40c549651f10@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.11.2024 15:39, Teddy Astie wrote:
> Le 26/11/2024 à 14:20, Jan Beulich a écrit :
>>>> Signed-ness of plain char doesn't really matter as long as it's used only for
>>>> what really are characters (or strings thereof). And that looks the be pretty
>>>> much the case throughout the public headers.
>>> Maybe. Still, as a general principle caller and callee ought to agree on size,
>>> alignment and sign for every type. I'd rather not make exceptions for that
>>> invariant unless truly well motivated. And in this case it's a case of
>>> requiring trivial non-functional changes.
>> In how far they're non-functional will need to be seen. You also need to keep
>> consumers in mind: They may face sudden type disagreement that compilers may
>> complain about. Yet "stable" for the public headers means not just the ABI
>> itself being stable, but updated headers also being usable as drop-in
>> replacements for older versions.
> 
> I don't think we currently enforce stability on all Xen headers 
> (especially not those control-domain related).
> For instance
> 
> Commit 21e3ef57e0406b6b9a783f721f29df8f91a00f99
> x86: Rename {domctl,sysctl}.cpu_policy.{cpuid,msr}_policy fields
> 
> actually modifies the name of some fields in a struct of sysctl.h, so I 
> suppose modifying the type of fields with more defined variants is 
> acceptable.

Context shifted away from what the subject says, towards doing replacement
on _all_ public headers. For domctl/sysctl and other toolstack-only ones
the transformation would indeed be less problematic (it would be mainly us
who need to adjust the wrapper functions in the libraries).

> One thing remain is that if the user is not careful of this change and 
> char is silently replaced by uint8_t, could that break something by 
> possibly changing the signed-ness ?

Well, sure, such a risk exists. Much would depend on how the wrapper
functions were adjusted.

Jan

