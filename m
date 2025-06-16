Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF3AADA835
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:28:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016481.1393372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3Jv-0004Xh-3l; Mon, 16 Jun 2025 06:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016481.1393372; Mon, 16 Jun 2025 06:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3Jv-0004Ue-16; Mon, 16 Jun 2025 06:27:51 +0000
Received: by outflank-mailman (input) for mailman id 1016481;
 Mon, 16 Jun 2025 06:27:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uR3Jt-0004UY-3j
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:27:49 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04540091-4a7b-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 08:27:46 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ad89c32a7b5so626664766b.2
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jun 2025 23:27:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec88ff1a1sm589809066b.89.2025.06.15.23.27.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jun 2025 23:27:45 -0700 (PDT)
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
X-Inumbo-ID: 04540091-4a7b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750055266; x=1750660066; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JfU75DuIdo9Kgu/QrbsMWKdVFXqewUQLfKGYI3wuzEI=;
        b=b0qIac6CBA0wWrMQQkHzWDmO43hbjUg3vr9IMPUKQdU0w5OJjEvzlUM5/YVBtFaq5t
         b0XAQTAMRQD0IFGQWwZ8aiND2H/c1jh9ChzKMPQ63KqDcCZoT+/z3xJe/JJbySM1KRXx
         xnlJcLJYIF5QZiZ5dMxRheB2AcJeiziz/Z3ZmtxCKyJdXSjj2ss4Sdatn70wWFO3z556
         S14qo23jLo0Cjl+gwfazbqBLexFmsSiNe5UoAAGb9+/VQ3Ha5Qx2EaI50HHJo98gC5h+
         mzs9jLwugJjsWSFMBUDpmGSJmEvs4FdThe3VIxq8OTd7kEYdRunh3rMruN8Ve2m9ASTG
         U55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750055266; x=1750660066;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfU75DuIdo9Kgu/QrbsMWKdVFXqewUQLfKGYI3wuzEI=;
        b=c/6VyF0E+ct0frdFp/LwZNc2FFa3AzAnGNXN90YJ/wWbFHcPVbQV0T/wN6CtV4rO3t
         MP5ILIx7eDf0Okujx13S/G48RYVLLTlaWSO9XkU9wtEYFMZFy2u+s5m8lgLfFIsg5YEd
         W5s+dwLx81KRfN67Vh4fMtCUt961XlnpsEIMGaeENIv5dADRqfTz4pz/AkIfz3RigJrT
         bFtp69+SA9aSbZ6QBRSXYDwV6MvIvG6eZFlROI05fCurheAVrgjvtJ94qNn4JEumC3dP
         FnxdKX61Qb/ahB3W+M7RGyQ7Up30B2RkoZuzb4VE6LwJrxsXJdDVMYUkWJe8yjJRULin
         JY3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU47djK6Piz7uKyClXm9ODbCkEgb04VuaZKg8paok6uE0bxgXcXTidTlOmIFOBOZ7p1sF8W/+IY8qw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybuDn3H8rLKsrru1VO3+pkZrAVhB7sei9bZJqtVY81PMoCPFLW
	wbfhi7z8jlRHMUaUHqRUjQhNr9Y47Nncqxrt8xC4cbEpoY+9PmW829hMvezvt0AFRg==
X-Gm-Gg: ASbGnct3c6ksWsukbZh1UemuWCmE79rjdVHmZppFzl66WXaWU7WfLwz6tjaCCn09plY
	E0OUkXaF9Sk2wAwVGBDmutEsRn3zaq5cd5o8m87mNaP+XJocHaZad3WJ2wK7Yv1NZpn9kz4d7sm
	ebe6cNym0mtcxoSxmsHQiBwQBnXBGhlfgdWxx0XuUdRcmg/aachft4E0IS2QAklgSTN3QnaOXET
	gr7SUybm5lWXqMagMyKhjpycyHJwM7XRFy4mIx/T7UCpPMsYUDKBD1WpgkbJTU/lTNd5b9UDbbA
	B6FhThvBDv0pjI4RyUInluaOI1fUfcj8VFM8aSaKqlwqXv9gMl4nUfEsODufafId8HAejoPeAJ/
	BXBefI3xIHHhYlBihFNtmSEUUghe75uvjGfBsxH/rbuKSxXU=
X-Google-Smtp-Source: AGHT+IFcX9G7lZBDk4EkJwcPsdTXIeengT650LQjZa1uTOlhLf3lu9uhwgshX3Yml7+Tj3sh/RIehQ==
X-Received: by 2002:a17:907:3ccb:b0:ad8:8364:d4ac with SMTP id a640c23a62f3a-adfad4feca7mr743711166b.55.1750055265729;
        Sun, 15 Jun 2025 23:27:45 -0700 (PDT)
Message-ID: <134c69c8-ccff-475c-8bf7-241ec4805754@suse.com>
Date: Mon, 16 Jun 2025 08:27:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/EFI: Fix detection of buildid
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
 <20250605111638.2869914-2-andrew.cooper3@citrix.com>
 <0a314400-126a-4c2a-b36c-dda61bb0b751@suse.com>
 <a477369d-77d0-48fa-8ac4-120d49e32d11@citrix.com>
 <4d1f1b70-e309-453b-bae6-e066d49a417a@suse.com>
 <9200277c-aa8e-4fd9-ab6a-f9e106114f54@citrix.com>
 <6eaf2b27-969a-4326-9726-8b6e0994e006@suse.com>
 <3f9c5a18-2ea1-4e2d-80a0-773abc3598ae@citrix.com>
 <ab3ad5c1-fd4c-4fa4-abfd-89641173a862@suse.com>
 <f2092e8a-2f13-40c5-b961-8a15d8298387@citrix.com>
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
In-Reply-To: <f2092e8a-2f13-40c5-b961-8a15d8298387@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.06.2025 23:28, Andrew Cooper wrote:
> On 10/06/2025 9:01 am, Jan Beulich wrote:
>> On 06.06.2025 17:01, Andrew Cooper wrote:
>>> On 06/06/2025 8:22 am, Jan Beulich wrote:
>>>> And then, based on your reasoning above, why don't you also drop the
>>>> #ifdef CONFIG_X86?
>>> Because that's the one non-buggy way of excluding an impossible case.
>>>
>>> x86 is the only architecture possibly linking with pep emulation, and
>>> therefore the only architecture to possibly have a CodeView record.
>> And how's the, say, Arm case different from the x86 case with no such
>> record built in? 
> 
> Because its currently impossible for ARM to have a codeview record.

There must be some pretty fundamental misunderstanding then: I can only
ask again - how's this different from xen.gz? There's not going to be
CodeView record there, yet still you enable the logic there. Hence the
body of the conditional is unreachable in that case.

To expand on my earlier suggestion (ab)using the "efi" global: With
the linker script having this

#ifdef EFI
  .reloc ALIGN(4) : {
    __base_relocs_start = .;
    *(.reloc)
    __base_relocs_end = .;
  }
#elif defined(XEN_BUILD_EFI)
  /*
   * Due to the way EFI support is currently implemented, these two symbols
   * need to be defined.  Their precise values shouldn't matter (the consuming
   * function doesn't get called), but to be on the safe side both values would
   * better match.  Of course the need to be reachable by the relocations
   * referencing them.
   */
  PROVIDE(__base_relocs_start = .);
  PROVIDE(__base_relocs_end = .);
#else
  efi = .;
#endif

where only the #if applies to xen.efi, can't we (ab)use the combination of the
other two symbols here to decide between xen.efi vs xen.gz?
__base_relocs_{start,efi} won't possibly be equal for xen.efi, except in an
extremely theoretical situation (and we could cover for that case by an ASSERT
in the linker script). Pseudo code:

#ifdef XEN_BUILD_EFI
    if ( __base_relocs_start != __base_relocs_end )
    {
        ...
    }
#endif

IOW that #if could simply replace the CONFIG_X86 one that's there right now.

> Remember that ARM writes a MZ/PE header by hand in a flat binary.  It
> does not use a PEP linker.

Of course. Much like for xen.gz there's no PEP linking involved.

Jan

