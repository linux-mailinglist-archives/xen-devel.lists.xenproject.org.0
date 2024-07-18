Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D480934DAF
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 15:03:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760500.1170364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUQmZ-00010I-GM; Thu, 18 Jul 2024 13:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760500.1170364; Thu, 18 Jul 2024 13:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUQmZ-0000y9-D1; Thu, 18 Jul 2024 13:02:51 +0000
Received: by outflank-mailman (input) for mailman id 760500;
 Thu, 18 Jul 2024 13:02:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sUQmX-0000Ux-Nz
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 13:02:49 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0818d6fc-4506-11ef-8776-851b0ebba9a2;
 Thu, 18 Jul 2024 15:02:48 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2eedea0fd88so10258101fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 06:02:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bbad94bsm92292205ad.90.2024.07.18.06.02.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 06:02:46 -0700 (PDT)
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
X-Inumbo-ID: 0818d6fc-4506-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721307767; x=1721912567; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=snVWHu7MPggGB85XDWjEwVlnnwSqiGMLocUJqm9G8f0=;
        b=NTIXri9hXRqq5N4INcfMtR5j5Vw491RSLh8YtVLb8LVVNzRVzOhKv6tflfCsXhYiJo
         mZ2KzuApH+WsbsUqLeLEXmMgSTTF7JRrzRiY3twdk8xdaMupQTRQWh5sMhXnjRB5oGIL
         5DBko7WufMHbzQH6GD7rTV8FP5Ad7DE0Pb8uq3hNF78q0KLbfzu+gXtXxnavLXSVa8Xt
         L+XyZqJ4RJVXmEnfk9t0N7fMGeEiPhkzBMmDz6Q8kwO8kCR/ByYaPqcvXPjTMQ9KKRE/
         zBK7ob3tgfDk6y/QbRisKn6nFoO8p39zCDQtpZqeg3GeKHRtBYBnuAVmi3Vy9DWjsi0m
         zm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721307767; x=1721912567;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snVWHu7MPggGB85XDWjEwVlnnwSqiGMLocUJqm9G8f0=;
        b=XKL6kFDO/Y4q00Lr7S8N8UaerMK2X0AaQ7HbaoABJveD/SaL87sFh7Al6Nocfb9TXF
         Ji0oJcJzFwOVeus9lxvVIUdVQLR09sph6eIwmadfldC4ybhqoFleSCfCxU3/cSih5KNk
         iaQ6XcfDxqoFzqxlhkHw0byYKisPDlvEXoP1/XnbtgD9MN942eKKXFhq81327Yz3jfMd
         qEVsw/RimuO486u3I23EfMfjhwpftwmBuIm2rRnK4YT9L+subTDzPW6NJx8y0BWBERYy
         03dCZzmEkQ7DEV1/htJH9p2ECzo7hNjBkyGFq0Rz9GLjOYA1oPOj4rU4HIdu9bu1EVCp
         fxEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCF5JsJh+W5ckzU0Y82WLYBMEdRG+/MsRfAJNPYuDB1wi6ycaF+T6x8gqYHcCNEMO+txl63ur6Q5KCCnTmkeT3Sh3zfPuh/6NhJKMhWlM=
X-Gm-Message-State: AOJu0YykFlfYN7w946XZyf6WFA4+OJ0g/s947yD6AdSOQMymQxigryak
	5GedxmdPoj97bnrJo5zCTKbYPPCMRmX4yLG7drED3lHYaAhbwNKMP45FWCIRWQ==
X-Google-Smtp-Source: AGHT+IEppIJiRv/YrwEZRSvCrpMZmfiFcJmlmP8H/5L3H2RUufJNpXTXGgp4Fc0CQ3ggKTkYgbf2wg==
X-Received: by 2002:a05:651c:548:b0:2ee:83f7:8b32 with SMTP id 38308e7fff4ca-2ef05c9f497mr18064391fa.21.1721307767426;
        Thu, 18 Jul 2024 06:02:47 -0700 (PDT)
Message-ID: <93a47d78-dcfb-46d4-ae1a-2854971fe107@suse.com>
Date: Thu, 18 Jul 2024 15:02:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Add scripts/oss-fuzz/build.sh
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com>
 <d0974cc40ca68fe197ba7941edd934970d3a92cf.1719355322.git.tamas@tklengyel.com>
 <53e3356e-4cc1-475a-91a1-8fc17fda07ab@suse.com>
 <CABfawhkLCziShB6x5J1OXL=M6AqquL-9SpTCQRVDNCeu_dqPNw@mail.gmail.com>
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
In-Reply-To: <CABfawhkLCziShB6x5J1OXL=M6AqquL-9SpTCQRVDNCeu_dqPNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.07.2024 14:54, Tamas K Lengyel wrote:
> On Thu, Jul 18, 2024 at 7:17 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 26.06.2024 00:47, Tamas K Lengyel wrote:
>>> +cd xen
>>
>> This looks to suggest that the expectation is for the script to be invoked
>> from the root of a xen.git clone. Imo something like
>>
>> cd $(dirname $0)/../../xen
>>
>> would be more flexible.
> 
> No, it will be invoked after a git clone is made, so you have to enter
> the xen folder that was just cloned.

Yet the suggested alternative would still work then, wouldn't it? And
it would permit easier use of the script from outside of that very
specific environment, e.g. when wanting to re-invoke it without
running a full cloning process every time.

>>> +make clang=y -C tools/include
>>> +make clang=y -C tools/fuzz/x86_instruction_emulator libfuzzer-harness
>>
>> In how far is it a requirement to have "clang=y" here? Wasn't this question
>> even asked before? I'm not even sure whether mid- or long-term we mean to
>> retain that functionality. Overrides of tool chain (components) may better
>> be done using CC= and friends. Plus perhaps by whoever is invoking this
>> script?
> 
> It is an absolute requirement to use clang=y here as oss-fuzz uses a
> specific clang as compiler for C/C++ projects. The CC environment
> variables are already set by the oss-fuzz docker environment but it's
> insufficient for a successful clang build. Without clang=y the
> following error is encountered:
> 
> gcc: error: unrecognized debug output level 'line-tables-only'
> gcc: error: unrecognized argument to '-fsanitize=' option: 'fuzzer-no-link'

Could you add a sentence to this effect to the description?

Jan

