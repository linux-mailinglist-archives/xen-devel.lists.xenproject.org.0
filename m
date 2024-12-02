Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3A99DFB72
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 08:52:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846298.1261472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI1E8-00038c-FY; Mon, 02 Dec 2024 07:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846298.1261472; Mon, 02 Dec 2024 07:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI1E8-00035T-CB; Mon, 02 Dec 2024 07:52:16 +0000
Received: by outflank-mailman (input) for mailman id 846298;
 Mon, 02 Dec 2024 07:52:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI1E7-00035N-7s
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 07:52:15 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 569d48db-b082-11ef-a0d2-8be0dac302b0;
 Mon, 02 Dec 2024 08:52:11 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-53df6322ea7so6322913e87.0
 for <xen-devel@lists.xenproject.org>; Sun, 01 Dec 2024 23:52:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996c11b4sm475657566b.7.2024.12.01.23.52.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Dec 2024 23:52:10 -0800 (PST)
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
X-Inumbo-ID: 569d48db-b082-11ef-a0d2-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMjkiLCJoZWxvIjoibWFpbC1sZjEteDEyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjU2OWQ0OGRiLWIwODItMTFlZi1hMGQyLThiZTBkYWMzMDJiMCIsInRzIjoxNzMzMTI1OTMxLjc4NTA5Mywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733125931; x=1733730731; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eYJcoq7J1jS9DVNCfMAeodJSCSDwO0i5nsagRkXfgvc=;
        b=Fa/T024bbn9LbgRIyLoLO1Bu+UZ23w2MnsSNrh/NkXvVoDysvUr0ZtOaYh9lgtBmZp
         q7u2RQGgZqhbxhHSG/qYsLziSqw8XQg8LKWYZxLc8UNDPKbLgqM0UJ/nh/AJxr9tqmxo
         a53K9mgKtN68k8+8ii4jwxC1th304X2zrkIytm9SjoB1E9EknnUnJ0STvIOHqahoioH3
         I+G2CvXKvL4eSmrNi1EEWBfcLXEQ/4oPImyP4S9CFktq6V1yvAUoOU6wv/e7pbnC9j9l
         tFBZuQeVDm1YWiax6padCZAOEjwYY+XAtlzCKr5j7SCBboBlbuCQkzvpZOjaA5FkRncE
         r0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733125931; x=1733730731;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYJcoq7J1jS9DVNCfMAeodJSCSDwO0i5nsagRkXfgvc=;
        b=kEqPeaTtm9sjx1LBkrHr8j4uvp8pFe/MOYCGlfTemkzAW3elpyrd9DK+RaHKEyTs6s
         s+KM7+BZ9hm/5cnsNNo15dR1tt3V36nZwcAdS55JfQcaLB/7QE0AH5GaKjXwBIeNR90v
         fMHCPJCBzmIN0Y2Huh1kbjijyhvZJGeYqk6uU7yI75IdVW9XjiqNGyZg/6bJNWTNxnPr
         UCkDuMHb6VSrH3uutoDdk5bcr0pumgCtFa1mqzqztTtSyZpAksz6Bqyj19yJZQSiFu3U
         1W+yUdz52n3SdZQESPQPecaUF0OzNl6zN257HUrrcpjvoUkF416GCYJIA7FGdIIZq3sh
         V7jw==
X-Forwarded-Encrypted: i=1; AJvYcCUlGUroK7vi7Nj395jm/abXzyE5kV39l36SNPdQvKuW/68W1y04UsvTmbYcvr89QlpXu7fAuSR+JIE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyz/XtmsKfhxvF2aq6B9PuhLpMzQNDjPDZoOYlh1UWAskqpUQ2h
	g0q0Wrqpb3AKrxxP9jxbhOrnMm5fbXLzdwap47L3CsqtTWMPOHqB5cQb/4J7Dr8lgGvKtY4iR8I
	=
X-Gm-Gg: ASbGnctaQ/G2XvP13mq+2CqG2IUK5B+Mk6N/mz/2825OmOCcBW2zxgcdRLjLKv18HYD
	yhsz2UorNun2J1x8csNsa59dmR4YQP7hsgAMjvCBHmXnkcnaexwGO15OIJ3EDMgqgiOeuhR2BiC
	qkEUwBQhSJRwASTee3Tvt6Gs6LaYwYjhebt0q8GIoJ1tyoepOgbvzHnxH3PgGNYaOLIcqmqulp4
	A+OUIwqV/eqeCgAOKOiJZckRQwIwcDOYvI+VM1AOT2qzLMj2H2XCijuDFTcZ2v99UUQ8+da3adl
	SP3Nr8YFIXnof03PLU8P6fpgK1LUWf2W/sA=
X-Google-Smtp-Source: AGHT+IG7FaBiVcySqAkI69JjtQh1oVB9uBi5GCCVV6P/xJRkwEzSjj+fUGnadUdpp5uSQt9zV0HY1Q==
X-Received: by 2002:a05:6512:3d24:b0:53d:e5c0:b9bf with SMTP id 2adb3069b0e04-53df011716dmr16421166e87.52.1733125931125;
        Sun, 01 Dec 2024 23:52:11 -0800 (PST)
Message-ID: <faefeec9-15db-4ab5-9c51-613056418755@suse.com>
Date: Mon, 2 Dec 2024 08:52:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] build: arm64: provide -target and -march if using
 clang
To: Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20241129014850.2852844-1-volodymyr_babchuk@epam.com>
 <20241129014850.2852844-4-volodymyr_babchuk@epam.com>
 <d8bdd084-3e0a-40aa-b829-534219b24df7@suse.com> <87iks5bsgd.fsf@epam.com>
 <8df584b8-fb23-4db4-af87-903fde91e42e@xen.org>
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
In-Reply-To: <8df584b8-fb23-4db4-af87-903fde91e42e@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.11.2024 18:15, Julien Grall wrote:
> On 29/11/2024 22:12, Volodymyr Babchuk wrote:
>> Jan Beulich <jbeulich@suse.com> writes:
>>> On 29.11.2024 02:49, Volodymyr Babchuk wrote:
>>>> --- a/config/arm64.mk
>>>> +++ b/config/arm64.mk
>>>> @@ -5,6 +5,10 @@ CONFIG_XEN_INSTALL_SUFFIX :=
>>>>   
>>>>   CFLAGS += #-marm -march= -mcpu= etc
>>>>   
>>>> +ifeq ($(clang),y)
>>>> +CFLAGS += -target aarch64 -march=armv8-a
>>>> +endif
>>>
>>> Why is this dependent on (just?) $(clang), not (also?) $(llvm)?
>>
>> Because this parameter is handled by clang only. There is no harm in
>> providing it explicitly. When building on arm64, value of this parameter
>> will match the default value for the platform. When building on x86, we
>> need to tell clang that it should generate arm64 code anyways. There is
>> no reason in trying to make ARM build with x86 instruction set.
>>
>>> Also
>>> this affects both toolstack builds and hypervisor. Is applying -march
>>> like this actually appropriate for the toolstack?
>>
>> This is a good question. I can't see why this can't be appropriate for
>> toolstack. I.e. what bad can happen when building the toolstack.
> 
> In the future, we may want to build the tools for Armv8-M. So I think 
> the -march should also applies for the toolstack.

Perhaps I don't know enough of the Arm world, but: Wouldn't it be possible
to build a tool stack suitable for a wide range for Arm64 flavors, while
requiring more targeted hypervisor binaries?

Jan

