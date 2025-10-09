Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02567BC8E40
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 13:48:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140501.1475369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6p7w-0000oe-HV; Thu, 09 Oct 2025 11:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140501.1475369; Thu, 09 Oct 2025 11:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6p7w-0000mc-Eh; Thu, 09 Oct 2025 11:48:08 +0000
Received: by outflank-mailman (input) for mailman id 1140501;
 Thu, 09 Oct 2025 11:48:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6p7v-0000mU-FB
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 11:48:07 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d00369af-a505-11f0-9809-7dc792cee155;
 Thu, 09 Oct 2025 13:48:03 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-46e42fa08e4so8746165e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Oct 2025 04:48:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46faf183b6dsm43674855e9.17.2025.10.09.04.48.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 04:48:02 -0700 (PDT)
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
X-Inumbo-ID: d00369af-a505-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760010483; x=1760615283; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LFt9bnF6a5MWzpdPvVGbuwaQt/figOKrt6eplTNjfBM=;
        b=QpawV9pdSvOW7oCIu/56rJVRDsJwAQgLLNORwLRwO8m+fSK0kLzwJC0M+hmhHFqf9L
         kJOsabP91Ov8SqHk1pu91hJ7uz/0pqcFW56Z9jIuyNWOkqGk+iyCQ702v0ykSOzLZuTU
         3DqzlSKV+JCmQZAG47+MsVCdrLLbqbgbJkS3CfdsD16hD2XwaFgMerQFTsHmh6C050No
         fGCkW7Z0KBRqIQMhCnWw4HRC6Wbhhii5wPSv8wUi71CWgXYefrgJOTbcsdENixuco/nk
         7H1fmfrrZEaeRTFvSYv4+a58IT4UD9MUojyVLCANeiNbvejnelG5/licsv92s9a9zzCx
         /MRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760010483; x=1760615283;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFt9bnF6a5MWzpdPvVGbuwaQt/figOKrt6eplTNjfBM=;
        b=Iqj0qOiSqu1PJ9dDZ4X3mcxNh1vL9+oiiCtsrsu5FWZU0jqFeLGTVJiI4srZgQc6IP
         ZC/SFDoW/TptN1kObzrEAy9KSJQtNBaC03KUm/nRk3k2613OYLbATgDIiGz2q+NbSm2y
         Cr3PD49OLsWnjTg584Th9hWar7YBSim8k9Njwbf7Najl9cUniHNepuWI/C17CyJZCjbc
         TlcEf3W6OGEtUno7DzIfemDHKaK6CaiTVk4laMgVJpqmLBsOIfMk/g7K3KftWrUVmRpl
         /muVSa/wZ3oxtX3iDuvQPm3oOthygZuLaXK+3sFILUskmFQ66IShIIpNtG9U60IUh261
         dC/w==
X-Forwarded-Encrypted: i=1; AJvYcCUp22OHimAsntVBfoTYPRgoHubwyhGyzHiGU94/DvwTo6F7PgzwrvGWnHYgyGhOX7LrNhLzuUxUJVc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzaYoIPICDsYUUtMbBp9K22q1mEC84+9K67hu1AvErApqdjyWdj
	fDRWiexQhfLDzJnWqVjudlNrWiIDPpW5AFV7kkScC7YFRB6o41YQbdVErvHRU7u1TA==
X-Gm-Gg: ASbGncuolFjqfRPAuLVTkwPn1mbAf8eSmB/2zzu+WkxPumd1LU5OpUMtGwPJR/rawJv
	vg9dPGfKUph5R/HBbrZkJbdNVhOBI3Zhurv1/AGTZsesWH26eRO82U5SnCc9C0RsRWolnxg3FIB
	i3SPk2EMa+lKVQXdRWsqMkFZYHFcVcP2dpobzhU9Jbf6FVoTEClmpkQStSsuMal/Jpo6lcSrtEs
	UDC5Znh9FQS3FvDLGyKtVX1T7pGFiXUNCyAcvow9DYNS7phM6KSHtrQQ0rrK6QEJPuuZqm6sW61
	xbPgIjGcafigBpwwEQSvSgXI51b6e8seDyKOCy2MGx5QzUKPTXlmo0WUK4JqdGTClKiYOtkI+Os
	lzb3cVtVEXGmU52hU3iBxJj3PczW0TIUv3gdrG0Dtdb9ISmwLYoYigvjAYLNewgS8GchXURq4MF
	c/v5r3eMWFyq6V69+713Wf097Twl8OALebhTgzXJB3Nw==
X-Google-Smtp-Source: AGHT+IEM/SzNUrWRfi0VtMigiZzmg11lrRy6Z3tHd6BweNtxluF2DUy5u/3ukW1d73gFLkCtCNabQQ==
X-Received: by 2002:a05:600c:1d12:b0:468:9798:2043 with SMTP id 5b1f17b1804b1-46fa9b05607mr51034045e9.26.1760010482686;
        Thu, 09 Oct 2025 04:48:02 -0700 (PDT)
Message-ID: <bc4df23e-58b2-4cba-b25f-e8ba2da222eb@suse.com>
Date: Thu, 9 Oct 2025 13:48:01 +0200
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
 <e3db4a71-336c-4039-a2fc-7997fadc81b3@suse.com> <aOeeMtiJEhdEiadg@mail-itl>
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
In-Reply-To: <aOeeMtiJEhdEiadg@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.10.2025 13:36, Marek Marczykowski-Górecki wrote:
> On Tue, Oct 07, 2025 at 04:46:17PM +0200, Jan Beulich wrote:
>> On 07.10.2025 16:23, Marek Marczykowski-Górecki wrote:
>>> On Tue, Oct 07, 2025 at 04:12:13PM +0200, Jan Beulich wrote:
>>>> On 02.10.2025 16:10, Marek Marczykowski-Górecki wrote:
>>>>> On Thu, Oct 02, 2025 at 02:05:56PM +0100, Andrew Cooper wrote:
>>>>>> On 12/06/2025 11:07 am, Frediano Ziglio wrote:
>>>>>>> For xen.gz file we strip all symbols and have an additional
>>>>>>> xen-syms file version with all symbols.
>>>>>>> Make xen.efi more coherent stripping all symbols too.
>>>>>>> xen.efi.elf can be used for debugging.
>>>>>>>
>>>>>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>>>>>
>>>>> Generally,
>>>>> Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>>>
>>>> Just to double check: You offer this after having read (and discarded) my
>>>> comments on v1, which v2 left largely unaddressed? 
>>>
>>> You mean the one about objcopy result used for debugging? I didn't see
>>> that before, since I wasn't in cc on v1... 
>>>
>>> Anyway, are you aware of some specific objcopy issue. Or in other words:
>>> would xen.efi.elf _currently_ be broken (as in - unusable for
>>> debugging/disassembly)?
>>
>> I can't tell. I've seen fair parts of the code in the course of addressing
>> various issues, and I would be very surprised if all of that was working
>> correctly.
>>
>>> If not, then I take that relevant part of your
>>> objection is mostly about inconsistent naming (xen.gz -> xen-syms, vs
>>> xen.efi -> xen.efi.elf). Would xen-syms.efi.elf be better?
>>
>> Plus the one asking to strip only debug info, but not the symbol table.
>> (And no, none of the suggested names look really nice to me.)
>>
>> Plus the one indicating that the change better wouldn't be made in the
>> first place. As said, to deal with size issues we already have machinery
>> in place. Not very nice machinery, but it's apparently functioning.
> 
> I'm of the opinion that defaults matter. Just having ability to build a
> binary that works on more systems is not sufficient, if you'd need to
> spend a day (or more...) on debugging obscure error message to figure
> out which hidden option to use to get there. And while one could argue
> that CONFIG_DEBUG=y builds are only for people familiar with details to
> deal with such issues, IMO just CONFIG_DEBUG_INFO=y shouldn't need
> arcane knowledge to get it working... And since that's a common option
> to enable in distribution packages, person hitting the issue might not
> even be the one doing the build (and thus controlling the build
> options).
> 
> As for the details how to get there, I'm more flexible. Based on earlier
> comments, it seems that (not stripped) xen.efi isn't very useful for
> debugging directly, an ELF version of it is. So IMO it makes sense to
> have the debug binary already converted. But if you say you have use for
> xen.efi with all debug info too, I'm okay with keeping it too, maybe as
> xen-syms.efi. It's a bit of more space (to have both efi and elf version
> with debug info), but since it doesn't apply to the installed version,
> only the one kept in the build directory, not a big issue IMO.

Hmm, yes, having xen-syms.efi (unstripped) plus xen.efi (with debug info
stripped but symbol table retained, including file symbols) might indeed
be a reasonable approach. (And then no xen-syms.efi at all when we pass
--strip-debug to the linker anyway. For this to result in somewhat
manageable Makefile logic, we may need to first split the linking rule
into multiple steps, as iirc has been the plan for quite some time.)

Jan

