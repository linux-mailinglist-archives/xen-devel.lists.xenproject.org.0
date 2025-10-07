Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFF0BC1CB2
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 16:47:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138945.1474525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v68xD-0008Lh-6W; Tue, 07 Oct 2025 14:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138945.1474525; Tue, 07 Oct 2025 14:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v68xD-0008K4-2v; Tue, 07 Oct 2025 14:46:15 +0000
Received: by outflank-mailman (input) for mailman id 1138945;
 Tue, 07 Oct 2025 14:46:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v68xB-0008Jw-3U
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 14:46:13 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e0dcbe3-a38c-11f0-9d15-b5c5bf9af7f9;
 Tue, 07 Oct 2025 16:46:11 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-631787faf35so11578494a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 07:46:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-637881010ffsm12599149a12.27.2025.10.07.07.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 07:46:09 -0700 (PDT)
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
X-Inumbo-ID: 5e0dcbe3-a38c-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759848371; x=1760453171; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SxWgx81tFcacAgqzc0X1Yi0yB6gXZFmdLSSn854w3Oo=;
        b=E1rTZ5+CU7A9PJVSC3oFOIsRM+/8msA8jBuRqrhplvfTT9F0Ii5m4qwheWPvuML836
         qHP3smV3PywU0nmncCoYfj3nBoRjmt/K/gbIUB/kmOxpBx2FuWxSthfczLggXEBDpykH
         0ny56R4Vn7tp6RVHZIvNZOweOjCIt7X1tdMKHHbRqbdNDhfMX6TNf9hmfk5oHQ5Xs6sU
         OmGYoFGrabrU2yCz1smJqNXvIE8TyW35yb6gwqjal+gMJ2GPhVrvhOidz+7FU+cs9Tpe
         6gsLA2AQVnkWKlouU50EOByX3jd/gzgHlrGnOyIPx7AoFCW6qZ6k/tjdwVtUvrJOG6wR
         jm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759848371; x=1760453171;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxWgx81tFcacAgqzc0X1Yi0yB6gXZFmdLSSn854w3Oo=;
        b=vv9cXu/UYQDE4X3kLnoEpIXiZrOo4r/ZMyethITeB8bufpEA1pmxj4bFOARLfXHOYl
         SHlWY1312yboQ/UlGhcTddOUnbfvAh4DKfZK0P8cGDCIDsWYeQ++AH8IinEcLis5/wGD
         fUPuWE0jyaFrTG2CSIQzCudF+IaWjnQ6JrRZCoTPZTSxyjt5qlmdB19XLnJ0d0l7MI5u
         jXZe+R4c8T3AhHlKKL6/RQhHnx/tmpeWusgSCLo+SjErNasUswudxwoKSipnJ2LaPSOy
         V65iRLS7ggAv4b7Qt75BVwOTKiamVAuFEOwQJHhm9D3oAxO2hDEopBjAJD3A4QA+ubdh
         WeTg==
X-Forwarded-Encrypted: i=1; AJvYcCUTnexVm89FSyynHPVVP6eSelsT500/kAZo7tdFf+6veNchUSMQ3knrYW2oGJ1p/SSjm/YicbS5m/I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXDKrFkOz7DMeBLI9jfcl81DjtPLuAO5qw0YOpN9AcOzxAUdIB
	wsxt1g4D/CbgA+1nYbOPF9IQED64soUe9cQzWm6bgquIHe/gvAErGzW5P/FL5Z6d4A==
X-Gm-Gg: ASbGncut+50Fh5bnpzEI1LseL3X7vniFGLFqMcLwEDIkcxsU7stt49N2lno9VfpEHiY
	B4UoeUIQ106LiD5U/74FE+UQ0QBamhC5AzKFoIA81n+GPcXr7z44k9oWjBbf1HUxtxd363WJPbH
	4Jf9+ny2gB2waWp5F5dqWIiEqBv0SKMXLtjh6GRO5HTTjjJ2M2Qaar4GXCPoR+tPNx7IiRHVgqE
	8cUsMUBPuKkhd5a9ZAATxhicmVMgDUvgTyrvDG7a3GqK6+AnGajkTuPuT3cy0VFEWPxw/CF6U/b
	rZXILjKi14dVejiKXSzshXvXnyp9bAkTLQwLzCYpEvPXZA9SiQZ9Qz7UalS90YfhZdxwM+Nn5nB
	GGVBqDBlHRdTVnzl5VDLkCWqVmbowAwIB0PzkL7tXTaiMR1+q/4X2LP+0oizsv9zNlI18FIY/Ha
	U5avoNSQKnp4xqneQwPDTUSIs5Z9k3tZboOZgb5xQCyQ==
X-Google-Smtp-Source: AGHT+IHezq6KC3hxBK7xO7XoSs4nudyVtMqP4T3mnZJa34tIam4PsqaLys1i/e/PtXYBkjgvWL7Izg==
X-Received: by 2002:a05:6402:786:b0:634:c4b4:e627 with SMTP id 4fb4d7f45d1cf-63939c26104mr13422677a12.29.1759848369666;
        Tue, 07 Oct 2025 07:46:09 -0700 (PDT)
Message-ID: <e3db4a71-336c-4039-a2fc-7997fadc81b3@suse.com>
Date: Tue, 7 Oct 2025 16:46:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Strip xen.efi by default
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 "michal.zygowski@3mdeb.com" <michal.zygowski@3mdeb.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250612100705.21988-1-frediano.ziglio@cloud.com>
 <586a66e5-4b11-485e-955a-da5fc3183737@citrix.com> <aN6H8dOlea2Um8y8@mail-itl>
 <1708c939-4b06-4d09-acb8-6965383d91f4@suse.com> <aOUiU86LtvsVFukW@mail-itl>
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
In-Reply-To: <aOUiU86LtvsVFukW@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.10.2025 16:23, Marek Marczykowski-Górecki wrote:
> On Tue, Oct 07, 2025 at 04:12:13PM +0200, Jan Beulich wrote:
>> On 02.10.2025 16:10, Marek Marczykowski-Górecki wrote:
>>> On Thu, Oct 02, 2025 at 02:05:56PM +0100, Andrew Cooper wrote:
>>>> On 12/06/2025 11:07 am, Frediano Ziglio wrote:
>>>>> For xen.gz file we strip all symbols and have an additional
>>>>> xen-syms file version with all symbols.
>>>>> Make xen.efi more coherent stripping all symbols too.
>>>>> xen.efi.elf can be used for debugging.
>>>>>
>>>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>>>
>>> Generally,
>>> Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>
>> Just to double check: You offer this after having read (and discarded) my
>> comments on v1, which v2 left largely unaddressed? 
> 
> You mean the one about objcopy result used for debugging? I didn't see
> that before, since I wasn't in cc on v1... 
> 
> Anyway, are you aware of some specific objcopy issue. Or in other words:
> would xen.efi.elf _currently_ be broken (as in - unusable for
> debugging/disassembly)?

I can't tell. I've seen fair parts of the code in the course of addressing
various issues, and I would be very surprised if all of that was working
correctly.

> If not, then I take that relevant part of your
> objection is mostly about inconsistent naming (xen.gz -> xen-syms, vs
> xen.efi -> xen.efi.elf). Would xen-syms.efi.elf be better?

Plus the one asking to strip only debug info, but not the symbol table.
(And no, none of the suggested names look really nice to me.)

Plus the one indicating that the change better wouldn't be made in the
first place. As said, to deal with size issues we already have machinery
in place. Not very nice machinery, but it's apparently functioning.

For context, and to avoid the argument that GNU objcopy and strip are
built from the same source file: The objcopy invocation here is to alter
the format, whereas the strip invocation is merely to remove data without
changing the format. The weakness in binutils, to a fair part due to a
lack of routine testing, is with format conversions. (And yes, routine
testing, as nice as it would be to have such, doesn't fit very well with
how testing overall works, as commonly only the default format of a
particular target would be tested.)

Jan

