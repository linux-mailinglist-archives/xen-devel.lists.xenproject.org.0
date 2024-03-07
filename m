Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6248749DF
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 09:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689672.1074884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri9Hm-0000Bu-9M; Thu, 07 Mar 2024 08:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689672.1074884; Thu, 07 Mar 2024 08:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri9Hm-00009V-6h; Thu, 07 Mar 2024 08:39:30 +0000
Received: by outflank-mailman (input) for mailman id 689672;
 Thu, 07 Mar 2024 08:39:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ri9Hk-00009N-Un
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 08:39:28 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34af9da5-dc5e-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 09:39:26 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a36126ee41eso80262166b.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 00:39:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fy21-20020a170906b7d500b00a45c8b6e965sm753680ejb.3.2024.03.07.00.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 00:39:25 -0800 (PST)
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
X-Inumbo-ID: 34af9da5-dc5e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709800766; x=1710405566; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=we4U2tzwhZPs/jF6fgksLO1+xacGitITsRSu/NC2LTM=;
        b=FbQdwjYrRCGe60Jx/B5zZFt17USKlzIymQhtUvx/obPT0/3DAaqQAxjkQuU7suaZ1q
         wKhoiR6aP47dZBnhtr32NRREPndjhUaCyY8TnVZHwqEJBmdrdySit8wSsviH3zU/bjU6
         8WVZxeYJxYGDw8pgn/VnIB7jZ9oF83P7E2g0fBwiu7lInXeQtfmjm0/3dUzW9fV6YAn4
         lzdzzJyuW5jJ4LTSAppN/+TRFupqYThQwKEbihxxYw2ttcYZ8qJiIePrbNZ4PhETpp9Y
         IkuulFi60xPLLC2CWbGLK0n1fWm5TZEMhr+uWoqyC3LY6wieIkoYudCoexWbVSaG2yj7
         a6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709800766; x=1710405566;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=we4U2tzwhZPs/jF6fgksLO1+xacGitITsRSu/NC2LTM=;
        b=WgYSYMWsA5Kgi1m9ITdfTpGDFjD8xQneENpPpotil9oVTnk4k0QqfUeuRAufZNxmb+
         rt4/NOO8kFOsTNSSGLDfg3fiXdEjc6nFYBhccBGaY0pVISwRTgFADTyySh/NgO8GTGw6
         cinJgcrXhNHKD7/kV+IwQfRXBMOfmvTZAnV+D16EjSokYIwureNRvQ9J/5HWvoHd0fWQ
         j3Hz9/jBpV4SO2kTvyGMaR14FcSonkh/SFpqjwSfvCr5AwbXcd5qP4yKTFm0iqxhDaur
         ozCN4b82fH6rD4O29miSU6ZMfOSo/YeN1+whCfNnsn3xgcZscru6s632fCmfnGDv/Kyt
         WQvA==
X-Forwarded-Encrypted: i=1; AJvYcCU0yKxiJ6/Sbl3oQAhyNug3YR15NvJMsl3HRGjnG7U0LIZRdWRaOnQziDRXZsCKFtT0EUncazBKe/nxNDul7EawD086jbYoYYUEmci3MTQ=
X-Gm-Message-State: AOJu0YwAN5hNME0qFWGoGLKSnyaDY0rt/F5+7ssg3OUOis1IQxqKxQVR
	Ug3+kp4uMkg9AHp1z/F+XhYSaf88iMHHb0EiZ/S7UirvCrhjaySaoaWAcfumaQ==
X-Google-Smtp-Source: AGHT+IFrCLnJndWLjMsx1taV4EjvErmrHUJ1/I6GLZkn9emWz5Ygxf6qQmfpI71cokFqCZaay0puMw==
X-Received: by 2002:a17:906:3e48:b0:a45:a9da:cc38 with SMTP id t8-20020a1709063e4800b00a45a9dacc38mr5059392eji.7.1709800765975;
        Thu, 07 Mar 2024 00:39:25 -0800 (PST)
Message-ID: <962cad57-21a8-4882-a23a-95add04cac9b@suse.com>
Date: Thu, 7 Mar 2024 09:39:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
Content-Language: en-US
To: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <CAKm-Umbs2D7NHFE+NW2xKOu7-AZhFpH4uzE5QTuQusnGA_eNWA@mail.gmail.com>
 <f539144c-885a-461c-a506-bdb73e626a65@suse.com>
 <CAKm-UmY126AfdGhWcZ3s9vwN9+ksVRRFEhOu0ZFMoDvxrqOibw@mail.gmail.com>
 <CAKm-UmYt3iV8zOhSmtqMGhi_8T93c_nCbnefs4m3UC+3UABqeQ@mail.gmail.com>
 <CAKm-UmY-KXEAtBagikW4Jvp=SFXtmEg8P62pHfSo3Hr2s-0_-A@mail.gmail.com>
 <CAKm-UmYbMCfXc1Ny0=qfB+UaLSXV9oEHZiSgS=mwKMwmOFGVrQ@mail.gmail.com>
 <77c1c05d-a0a0-4292-9257-9b7fbebee0e3@suse.com>
 <2859ad22-8714-4628-8142-fc77fc2072c3@amd.com>
 <CAKm-UmZpyGkWXugYTJqU+qqVDyCFEKghtd=NTr2wK5EMCeL9Ww@mail.gmail.com>
 <214585d5-689d-4ba6-bd48-359428a7ed8f@amd.com>
 <CAKm-UmZoKwre8-G793VqRNFCmzAti1o-0Kp3ZyV_Z5cc0YNiKw@mail.gmail.com>
 <CAKm-Umb=kGFqc5je9E3bbfQ0bcbZeY_Ntv5JDmO-vXj3N0MvPg@mail.gmail.com>
 <CAKm-UmZ113q-a8wEE5yo0OPPM3JpNqJzKaU1eNiCzT2YkGU0pQ@mail.gmail.com>
 <CAKm-UmaG3KRtDkrEH7cNgLkRkRs2HG357S=BUjomhN6Ad-AkCQ@mail.gmail.com>
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
In-Reply-To: <CAKm-UmaG3KRtDkrEH7cNgLkRkRs2HG357S=BUjomhN6Ad-AkCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.03.2024 18:28, Sébastien Chaumat wrote:
> Reasoning backward  (using a  kernel without the pinctrl_amd driver to
>> ensure xen only is at stake) :
>>  checking the diff in IOAPIC  between bare metal and xen  (IRQ7 is on
>> pin07 on APIC )
>>
>> using kernel argument : apic=debug
>>
>> bare metal :
>> [    0.715330] fedora kernel: ... APIC VERSION: 81050010
>> ...
>> [    0.715433] fedora kernel:  pin07, disabled, edge , high, V(00),
>> IRR(0), S(0), physical, D(0000), M(0)
>>
>> xen :
>> [    2.249582] fedora kernel: ... APIC VERSION: 00000014
>> ...
>> [    2.249730] fedora kernel:  pin07, disabled, level, low , V(60),
>> IRR(0), S(0), physical, D(0000), M(0)
>>
>> So the APIC table is not the same.
>>
>> As strange as it looks the  (IOAPIC 0) pin07 is correctly described by the
>> APIC in xen but yet differently than in baremetal.
>> But the APIC message comes long after the
>> [    1.833145] fedora kernel: xen: registering gsi 7 triggering 0 polarity
>> 1
>>
>> so I wonder if the APIC pin07 info had any influence.
>>
>> Finally found the fix : adding ioapic_ack=new to xen boot parameters.
> Not only the trackpad is now working but also the ACPI Embedded Controller
> which is completely disabled.

Hmm, interesting. From someone else's laptop many years ago I had actually
an indication in the opposite direction: That didn't work because of our
defaulting to new (no directed EOI in sight yet back at that time). I
wonder if overriding the ack method isn't actually just papering over the
underlying actual issue here, whatever that is. IOW with the edge vs level
mismatch addressed I'd hope the override could then be dropped again.

Jan

