Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBDAC3EB02
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 08:04:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157353.1486151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHGWP-0001S4-7Z; Fri, 07 Nov 2025 07:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157353.1486151; Fri, 07 Nov 2025 07:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHGWP-0001P5-4e; Fri, 07 Nov 2025 07:04:33 +0000
Received: by outflank-mailman (input) for mailman id 1157353;
 Fri, 07 Nov 2025 07:04:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QcrT=5P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vHGWN-0001Ox-Pg
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 07:04:31 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 016d408d-bba8-11f0-9d17-b5c5bf9af7f9;
 Fri, 07 Nov 2025 08:04:30 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b72bf7e703fso73882466b.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 23:04:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf9bd741sm157835466b.57.2025.11.06.23.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 23:04:29 -0800 (PST)
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
X-Inumbo-ID: 016d408d-bba8-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762499070; x=1763103870; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tHfuwdz9s2xsTd7gl1mH7DeJLTGqHu52PmKN81cOOvk=;
        b=TcytoPG80s70ONH2eCeJPaCS1/xnFz4AubvnMLUSq7meM2GQvYeu4DSSdjVbHEhZwm
         TRa7CcitHfYVEW/fQH9WWd+4mTlapaLlaME6Q4+VKS+WUYYc4imvfNSmACVYBBbWAKuR
         2qbwhKybgw6WgLi6SjtjRKGt9lj1Kn9QY8x4v+bTU9LQHjeoA9PlmIxrqfg6Lf67aToV
         VvjH92HMR1wbLWGnPUOKOvwrWPl4wuZy+vqCudKNanlmvNyTqMZvVHXj5bY084qWH/UF
         0yyQ59TSFMFUKXVWeWeA6DKBURAmq36Weg7svzy0fEAteFUgYyKIxtehnnU2mmgSESfH
         iozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762499070; x=1763103870;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHfuwdz9s2xsTd7gl1mH7DeJLTGqHu52PmKN81cOOvk=;
        b=kjop2WkSpMBkDZXu3pw+DizR9bSZrlgQCEdjT+oLUS3xUywlCXHD2tZXVTcAmh2jC1
         oE2Lxb8OA8wEXKUcw7Xp8G91Yfvdtg8fl976BD15GaligM/WtGM9++uBaWHIFRb3IQQs
         oEN9ZKsfnV9nFnQGMC7CCC+FqsNR0OsMQL3XNFC26GjU8qAMrOSAEKJz0YM4/azleapx
         rn6iiAq7tvkdw9KLfp6Kl09Z9UjQFm/Itd2spMKYhhR4jMWpixOlU2YBm9YZpwH7kQfy
         XeBhM84Ul1OLI7xJOPPPIMy2+Cl2EYT2QDW9vjD6Tkb+WsKJCJgLvAkXdOSP7kcwVzbY
         ETjw==
X-Gm-Message-State: AOJu0Yw1S8NbyN8MemBHyPEJgnEgoPYA4MkpuxaVPS70zYAqqwgnA8YO
	i7vRGBG+zUXnhc7gYQrJfzt9LIveMag+jSVchSDs6r/+zL9ooeJJa3TyILYGX46f7g==
X-Gm-Gg: ASbGncvHZ/Dlfv4jMTtqimUQ8VwpAyYbpEhWT0CuwnKVb9O1jelORnSCMemUisyMFqX
	2vlEmVHOX4dOopi/UJFMTrtVWc7K24WWffGg4rTqGMCzBIvkwrDgPCrilVTMwp+2BpEbLeDJmPM
	IBu4NZXwd93wzYuommk1lnxWTsw6Exw3nf7+n8gqVd4HRfk5bq92/L7MoDd5AXS+CrrOJ+lgXbZ
	se9ZS85d52OkCIEbYKgJOF7lzFrfcTCc/v4k1zUUXeOaXz7xOmSewk0G33CMPZ830f0hoabeZQ4
	ruQQ4kdKnRf8XxpmC0cAWU2sFniIK2VsiFEAacjoE4lZPV1p0sS5bYRLsWHLVAub59uUxIb1T5D
	YmtLNZ7vUFFDS6DPSYtHOhyevLiqWpoKC85pJg+bU1cIXxP0J+TZe7aLd8im4F+cNq5m2iUiMIG
	SQKtttRiWi76IecQHfP1xdNguJ9fXJqd5Nv+P5iFIk1m3baPksYG+8IANPD/rN
X-Google-Smtp-Source: AGHT+IHsmN4v8IiAF8LOhSyxGrMxp+uGAtsNmoCEzDXSIvDeXAuakqKLUyobkvQhQoLLdiM4We8Hbg==
X-Received: by 2002:a17:907:9304:b0:b6d:5f52:eee8 with SMTP id a640c23a62f3a-b72c07f7f09mr202790866b.29.1762499069429;
        Thu, 06 Nov 2025 23:04:29 -0800 (PST)
Message-ID: <1fa1ca4d-62ce-49ee-8a8a-8d0d9e8abf2e@suse.com>
Date: Fri, 7 Nov 2025 08:04:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen: Strip xen.efi by default
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Demi Marie Obenour <demiobenour@gmail.com>
References: <20251105153808.20278-1-frediano.ziglio@citrix.com>
 <fdc9fd41-2224-4672-911e-3e17b428d32a@gmail.com>
 <CAHt6W4eyH_7c4Q-KYaDjNJnSXjKSVNT1iSw0sNbLMXnK3iEHRg@mail.gmail.com>
 <d193feac-3285-4c26-9a8a-ba09437e7e76@gmail.com>
 <CAHt6W4fEbuk+VzjFxfz5=T8GXCVW_jSoqqMAkiQTXL79B93SPg@mail.gmail.com>
 <98e2f19f-5fce-4ad1-b821-f5abb1f815f6@suse.com>
 <CAHt6W4fscR1zAPbEmmgy5ARUGN5R2XBLF=Lkbjw3GU_RwibTfA@mail.gmail.com>
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
In-Reply-To: <CAHt6W4fscR1zAPbEmmgy5ARUGN5R2XBLF=Lkbjw3GU_RwibTfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.11.2025 17:32, Frediano Ziglio wrote:
> On Thu, 6 Nov 2025 at 10:27, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 06.11.2025 10:58, Frediano Ziglio wrote:
>>> On Thu, 6 Nov 2025 at 03:52, Demi Marie Obenour <demiobenour@gmail.com> wrote:
>>>> Does objdump on the signed file return correct section names?
>>>
>>> From objdump -x
>>>
>>> Sections:
>>> Idx Name          Size      VMA               LMA               File off  Algn
>>>   0 .text         0016c9ae  ffff82d040200000  ffff82d040200000  00000320  2**4
>>>                   CONTENTS, ALLOC, LOAD, READONLY, CODE
>>>   1 .rodata       0006b9e8  ffff82d040400000  ffff82d040400000  0016cce0  2**2
>>>                   CONTENTS, ALLOC, LOAD, DATA
>>>   2 .buildid      00000035  ffff82d04046c000  ffff82d04046c000  001d86e0  2**2
>>>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>>>   3 .init.text    0004d123  ffff82d040600000  ffff82d040600000  001d8720  2**2
>>>                   CONTENTS, ALLOC, LOAD, READONLY, CODE
>>>   4 .init.data    0006c9b0  ffff82d040800000  ffff82d040800000  00225860  2**2
>>>                   CONTENTS, ALLOC, LOAD, DATA
>>>   5 .data.read_mostly 00028da8  ffff82d040a00000  ffff82d040a00000
>>> 00292220  2**4
>>>                   CONTENTS, ALLOC, LOAD, DATA
>>>   6 .data         0000feec  ffff82d040a29000  ffff82d040a29000  002bafe0  2**4
>>>                   CONTENTS, ALLOC, LOAD, DATA
>>>   7 .bss          00223108  ffff82d040a39000  ffff82d040a39000  00000000  2**4
>>>                   ALLOC
>>>   8 .reloc        000016b8  ffff82d040c5d000  ffff82d040c5d000  002caee0  2**2
>>>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>>>   9 .sbat         000000a6  ffff82d040c5f000  ffff82d040c5f000  002cc5a0  2**2
>>>                   CONTENTS, READONLY
>>>
>>> Which looks correct.
>>>
>>> From hexdump -C I can see close to the end
>>>
>>> ...
>>> 002cc580  30 ae 38 ae 60 ae 00 00  00 80 a3 00 10 00 00 00  |0.8.`...........|
>>> 002cc590  a0 ae c0 ae e0 ae 00 00  00 00 00 00 00 00 00 00  |................|
>>> 002cc5a0  73 62 61 74 2c 31 2c 53  42 41 54 20 56 65 72 73  |sbat,1,SBAT Vers|
>>> 002cc5b0  69 6f 6e 2c 73 62 61 74  2c 31 2c 68 74 74 70 73  |ion,sbat,1,https|
>>> 002cc5c0  3a 2f 2f 67 69 74 68 75  62 2e 63 6f 6d 2f 72 68  |://github.com/rh|
>>> 002cc5d0  62 6f 6f 74 2f 73 68 69  6d 2f 62 6c 6f 62 2f 6d  |boot/shim/blob/m|
>>> 002cc5e0  61 69 6e 2f 53 42 41 54  2e 6d 64 0a 78 65 6e 2e  |ain/SBAT.md.xen.|
>>> 002cc5f0  78 73 2c 31 2c 43 6c 6f  75 64 20 53 6f 66 74 77  |xs,1,Cloud Softw|
>>> 002cc600  61 72 65 20 47 72 6f 75  70 2c 78 65 6e 2c 34 2e  |are Group,xen,4.|
>>> 002cc610  32 30 2e 31 2d 37 2e 32  32 2e 67 33 65 30 36 37  |20.1-7.22.g3e067|
>>> 002cc620  32 36 62 2e 78 73 39 2c  6d 61 69 6c 74 6f 3a 73  |26b.xs9,mailto:s|
>>> 002cc630  65 63 75 72 69 74 79 40  78 65 6e 73 65 72 76 65  |ecurity@xenserve|
>>> 002cc640  72 2e 63 6f 6d 0a 00 00  00 00 00 00 00 00 00 00  |r.com...........|
>>> 002cc650  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
>>> 002cc660  2c 00 00 00 2e 69 6e 69  74 2e 74 65 78 74 00 2e  |,....init.text..|
>>> 002cc670  69 6e 69 74 2e 64 61 74  61 00 2e 64 61 74 61 2e  |init.data..data.|
>>> 002cc680  72 65 61 64 5f 6d 6f 73  74 6c 79 00 00 00 00 00  |read_mostly.....|
>>> 002cc690  9e 05 00 00 00 02 02 00  30 82 05 92 06 09 2a 86  |........0.....*.|
>>> 002cc6a0  48 86 f7 0d 01 07 02 a0  82 05 83 30 82 05 7f 02  |H..........0....|
>>> 002cc6b0  01 01 31 0f 30 0d 06 09  60 86 48 01 65 03 04 02  |..1.0...`.H.e...|
>>> 002cc6c0  01 05 00 30 5c 06 0a 2b  06 01 04 01 82 37 02 01  |...0\..+.....7..|
>>> 002cc6d0  04 a0 4e 30 4c 30 17 06  0a 2b 06 01 04 01 82 37  |..N0L0...+.....7|
>>> 002cc6e0  02 01 0f 30 09 03 01 00  a0 04 a2 02 80 00 30 31  |...0..........01|
>>> 002cc6f0  30 0d 06 09 60 86 48 01  65 03 04 02 01 05 00 04  |0...`.H.e.......|
>>> 002cc700  20 e2 47 64 f8 e8 7b 62  eb 17 e0 13 0a 0d 93 02  | .Gd..{b........|
>>> 002cc710  7a d8 3b f0 20 a8 ee 3d  49 98 3f de c1 47 de 15  |z.;. ..=I.?..G..|
>>> 002cc720  43 a0 82 03 2c 30 82 03  28 30 82 02 10 a0 03 02  |C...,0..(0......|
>>> 002cc730  01 02 02 11 00 8f fc 11  bf 41 54 40 74 89 2c 53  |.........AT@t.,S|
>>> 002cc740  a5 78 c1 e8 32 30 0d 06  09 2a 86 48 86 f7 0d 01  |.x..20...*.H....|
>>> 002cc750  01 0b 05 00 30 1c 31 1a  30 18 06 03 55 04 03 13  |....0.1.0...U...|
>>> 002cc760  11 58 65 6e 53 65 72 76  65 72 20 58 65 6e 20 64  |.XenServer Xen d|
>>> 002cc770  65 76 30 1e 17 0d 32 35  30 33 32 30 31 36 35 35  |ev0...2503201655|
>>> 002cc780  30 37 5a 17 0d 33 37 30  31 31 39 30 33 31 34 30  |07Z..37011903140|
>>> 002cc790  37 5a 30 1c 31 1a 30 18  06 03 55 04 03 13 11 58  |7Z0.1.0...U....X|
>>> 002cc7a0  65 6e 53 65 72 76 65 72  20 58 65 6e 20 64 65 76  |enServer Xen dev|
>>> ...
>>>
>>> So, this confirms that the string table is there to support larger
>>> section names and the signature is there and it's working.
>>
>> But is it going to work on all EFI implementations, or merely the one you tried?
> 
> Can you be more specific ?
> The file was tested using dozens of different hardware and under Qemu.
> Only x64 if it's what you mean.

No, I was referring to the fact that there are distinct EFI implementations,
which may differ in their loader behavior. But see also Demi's clarification
on her original remark.

Jan

