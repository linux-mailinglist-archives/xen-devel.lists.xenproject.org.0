Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5702B832AC5
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 14:51:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669061.1041662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQpGf-0005CJ-TC; Fri, 19 Jan 2024 13:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669061.1041662; Fri, 19 Jan 2024 13:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQpGf-0005Ak-QE; Fri, 19 Jan 2024 13:50:45 +0000
Received: by outflank-mailman (input) for mailman id 669061;
 Fri, 19 Jan 2024 13:50:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPDw=I5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQpGd-0005Ae-T1
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 13:50:43 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcc7e43d-b6d1-11ee-98f2-6d05b1d4d9a1;
 Fri, 19 Jan 2024 14:50:42 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ce01779f1aso4981591fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2024 05:50:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 y63-20020a029545000000b0046e77bd393dsm1649965jah.144.2024.01.19.05.50.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jan 2024 05:50:41 -0800 (PST)
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
X-Inumbo-ID: bcc7e43d-b6d1-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705672242; x=1706277042; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zBxPh72R3cVWWjj4FvbacfKAiDZjQ8VqCNbpa6/rz1U=;
        b=APQ+jEUNKH1/N5dsYL+tLemJkOmDjjhFHKJ+hTo+yjFMbI2Ko+3B6d9VZnZhKmFAAv
         3vmuVgBsHLr9DvrInSqYW64yL7Nni5FGKq3NcGVMYrGllr5OYqki8DKDil5eQXQiE/t7
         5bzkaJpYJxOl5B0nPkg1OR8yqyGkEZXDyvkFjn5a948Qxj99k9qWvTJs41Denqv9QOFz
         /a4ndBHya52tukFyyeankZIZGA1AiTHRJDD5wfB2K2sePlojtCDjMHfRsWNByHNHJ0N/
         Uk36pJJ9L/5M96gkybwfea0G8R673W0h6e7ZFw3vJKs/8FfGkTjtZpdwEhaVQP+9D4qv
         3B8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705672242; x=1706277042;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBxPh72R3cVWWjj4FvbacfKAiDZjQ8VqCNbpa6/rz1U=;
        b=OdRiiOUtu4G/s75Vae5djhTLG4IWiQ7QzDkOSa+NsxfbgoFLnURUbUISEnIk5JSe5+
         Ho9iRwsc9cM3vbWQwqktmsUFe/B3YEWsgfopL7HlYBSQFq0Iwyk1j/ijueksnx7rvgVp
         NZNYa4YAp3d6HvlpSwNcoKcvJmKanCJGodrpwGya7ZlAHd9xIEHh794t7+W/zL2m9bPr
         KTgsHwatHw9y62OAwHCsyTC6Fp7soxhdHU6+G+S9ofWfhkC1JYrv8lmDg/vhhFUJYg1i
         zqL61GD0IK6mF9OfPihfvRgMFZoBSk5Fw5laDkSUuvawvvdK5Op4zxkYzkkuHODDmzv3
         0yXQ==
X-Gm-Message-State: AOJu0YytIk3OqhILrMvqwc7adz2efmIOxubRjLp1uopXOIvyvdeG5NJw
	r+Jfzj7gNaXvIDOYY3CjgvJuJUgr9D/h3zJJRMfBlcrqiyElhM3rt1ajZXWPTQ==
X-Google-Smtp-Source: AGHT+IFeaP/vMWVSEFqJAySV6j2sDaDGkc5fmCon8hqAiygW+SHJ1Xpa61bK4sVTwtYaG/p/s18Lhw==
X-Received: by 2002:a2e:8754:0:b0:2cd:39ec:c31d with SMTP id q20-20020a2e8754000000b002cd39ecc31dmr1425681ljj.46.1705672242275;
        Fri, 19 Jan 2024 05:50:42 -0800 (PST)
Message-ID: <8e84f558-a4be-4410-a16a-230864f42a1a@suse.com>
Date: Fri, 19 Jan 2024 14:50:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: E820 memory allocation issue on Threadripper platforms
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Patrick Plenefisch <simonpatp@gmail.com>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com>
 <CAOCpoWf4CMkCWx8uR2NbFrZrKSS78wj1-hFsAUqsjCfsmqooVA@mail.gmail.com>
 <Zap7uX3k0kfoMOoF@mail-itl>
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
In-Reply-To: <Zap7uX3k0kfoMOoF@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.01.2024 14:40, Marek Marczykowski-Górecki wrote:
> On Thu, Jan 18, 2024 at 01:23:56AM -0500, Patrick Plenefisch wrote:
>> On Wed, Jan 17, 2024 at 3:46 AM Jan Beulich <jbeulich@suse.com> wrote:
>>> On 17.01.2024 07:12, Patrick Plenefisch wrote:
>>>> As someone who hasn't built a kernel in over a decade, should I figure
>>> out
>>>> how to do a kernel build with CONFIG_PHYSICAL_START=0x2000000 and report
>>>> back?
>>>
>>> That was largely a suggestion to perhaps allow you to gain some
>>> workable setup. It would be of interest to us largely for completeness.
>>>
>>
>> Typo aside, setting the boot to 2MiB works! It works better for PV
> 
> Are there any downsides of running kernel with
> CONFIG_PHYSICAL_START=0x200000? I can confirm it fixes the issue on
> another affected system, and if there aren't any practical downsides,
> I'm tempted to change it the default kernel in Qubes OS.

There must have been a reason to make the default 16Mb. You may want
to fish out the commit doing so ... In Qubes, though, I understand
you're always running with Xen underneath, so unless this same kernel
is also needed to run in HVM guests, some of whatever the reasons may
have been may go away.

Jan

