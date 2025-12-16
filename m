Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B608CC165A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 08:56:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187626.1508978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVPuV-00050l-J3; Tue, 16 Dec 2025 07:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187626.1508978; Tue, 16 Dec 2025 07:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVPuV-0004yB-EU; Tue, 16 Dec 2025 07:55:55 +0000
Received: by outflank-mailman (input) for mailman id 1187626;
 Tue, 16 Dec 2025 07:55:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vVPuT-0004y5-Gr
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 07:55:53 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a45e52a0-da54-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 08:55:52 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso51524985e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 23:55:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f6e5baasm243042955e9.13.2025.12.15.23.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 23:55:50 -0800 (PST)
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
X-Inumbo-ID: a45e52a0-da54-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765871751; x=1766476551; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RlPtpsfMLI3vNX0v+D09nikJBlZj/5sGKY+71A649M0=;
        b=T37IHYCbMQtagagP6JrPzX9sJnQlhKDC4S/AGRbUNIm1ywkWMWtlCxETnXGtC7vIin
         +RW/9ce3Z9uTiMVJIo70kjmhA9WtoFFDt3LMcjWquZJvjpPvHvzaIWOmYwGPubSug5vj
         YULhu3Re750Efm7LOa9BOlDbLFDY5zG0jQ1KxhXnIOyl6VofkKaGzGeHBDfdteHdMMVw
         Ay/KClcsvnwLpT8i+4e5PYXAW/768m+lE2+FMOvV5BjKSPJo4mZzbs4jRe4+UTdEZYfB
         HqZPdIwBb8E0vxeKtXCslyiyiuFTqi0T+d8RaeboYgoFoxE2HFxwZptFp9ppiEjpss5b
         yRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765871751; x=1766476551;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlPtpsfMLI3vNX0v+D09nikJBlZj/5sGKY+71A649M0=;
        b=NK/cjHKCmICRNxBw6Vop9fLL8ataBqoSzl4rihOCKw5ggRhvMoXe8eLUmm5q8SPjRD
         YNgwNyE4hIsnlh7r9iysmgwin9ul3sSfZf8w0gfGEIilWEqWz0F6A1DgCXcL2ClDGQgx
         2PoGm2644RCt9gPWO35Bvs+wZQqdvIkLpMiEeq6F2YPH3PIrNeBqq3vRZUgEuWa9V91B
         CDdONgyPWdT+mFc4UDPzxFOYcqqyVLboegDy9Pi6WUEf599iZvHgcFpFT79PUiIBmsgS
         5DGAEp6+tAzJGVwQMkabMOTGywCo2kAkdDbNBEoP6UJ5n1KA/PtXra1bSDo4WLr8SPJA
         ZCVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXgcHTQsKihZyviFnxHq2s6Fskf2/jV3QFhAfVy8ICC2yzAHqPvwb+uN4UUirvkM2qM2yfLzREYwk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJO4wu/WHaxIhZ/DzqH/2hRyZLrymXCfrBAKjGmCXoX8xHQREm
	75ahu2xTfWPKJS9iWkrMag9LYnGKbBAu4nqibldOjIPA4o2HhAF4OpyXzi+R5SvgNA==
X-Gm-Gg: AY/fxX7YEqOmzVKPbj19+mB9z1zMjv7eREfU7rM3pcI9KnWQHff2RLW5zM9EpQ522C/
	kyBsRmzyNcvg3hM+/QvLuxRNB4J4DDhPTlUa6GeRk085CBhROAFi0+uW68zA58Mzt6mFD4eyyFa
	NbMj46ui1BWhBlNolBRww6ca+eWHIoMH2gmE5Whf9qu1LYqQlikb6Wgltn21z/dQDx5/6gfecXk
	eBJdUwWe/DcHfg3nXoPPb4/0Z7T5d7YxNwD8tWsGd0Tsz5ijCLh4ROA/zpoGKO8L0d1Dpg2GH+L
	maDCtwwBIOMF4X82hZNn0q6Efm/BOHMuVwblgGbnNO9FYUP4Nnp+xeAo4PCwUFOUM6EanSJkp1u
	/RQAc9VTg7+HdK0xSLpBm9OBtOwm3luhxo8qUWxk5Vig0RMQS+C3wHNfyJVkXMy6/0O2BhcYlxa
	7Nv76+HtWhk003dHdl01wacbgBFknaXiC+oggiamP838UPCxBD03bSiwt8XHQWN4PwgV6O46Uq0
	9c=
X-Google-Smtp-Source: AGHT+IFIWEVxfsS5q4qSBoHiHXIOmMdHqkp+2xTLVG0cMIds/QRKNPQVl0ahq5KcAQ/DpDNUlwNAQw==
X-Received: by 2002:a05:600c:470e:b0:471:13fa:1b84 with SMTP id 5b1f17b1804b1-47a8f8c0527mr153840435e9.12.1765871751317;
        Mon, 15 Dec 2025 23:55:51 -0800 (PST)
Message-ID: <2a661e47-78f1-4569-9ed9-b4c3e62af646@suse.com>
Date: Tue, 16 Dec 2025 08:55:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/ucode: Adjust parse_ucode() to match other list
 handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251215153245.2675388-1-andrew.cooper3@citrix.com>
 <b14362f4-aaa2-4ded-943f-4ad4a246f521@suse.com>
 <b6dc5f41-9504-44d2-ad17-72d0b20f1434@citrix.com>
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
In-Reply-To: <b6dc5f41-9504-44d2-ad17-72d0b20f1434@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.12.2025 18:08, Andrew Cooper wrote:
> On 15/12/2025 5:00 pm, Jan Beulich wrote:
>> On 15.12.2025 16:32, Andrew Cooper wrote:
>>> parse_ucode() is abnormal compared to similar parsing elsewhere in Xen.
>>>
>>> Invert the ucode_mod_forced check with respect to the "scan" and integer
>>> handling, so we can warn the user when we've elected to ignore the parameters,
>>> and yield -EINVAL for any unrecognised list element.
>>>
>>> Rewrite the ucode= command line docs for clarity.
>>>
>>> No practical change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> albeit I'm not quite happy with ...
>>
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -2752,34 +2752,52 @@ performance.
>>>     Alternatively, selecting `tsx=1` will re-enable TSX at the users own risk.
>>>  
>>>  ### ucode
>>> -> `= List of [ <integer> | scan=<bool>, nmi=<bool>, digest-check=<bool> ]`
>>> +> `= List of [ <integer>, scan=<bool>, nmi=<bool>, digest-check=<bool> ]`
>> ... this change when ...
>>
>>>      Applicability: x86
>>>      Default: `scan` is selectable via Kconfig, `nmi,digest-check`
>>>  
>>> -Controls for CPU microcode loading. For early loading, this parameter can
>>> -specify how and where to find the microcode update blob. For late loading,
>>> -this parameter specifies if the update happens within a NMI handler.
>>> -
>>> -'integer' specifies the CPU microcode update blob module index. When positive,
>>> -this specifies the n-th module (in the GrUB entry, zero based) to be used
>>> -for updating CPU micrcode. When negative, counting starts at the end of
>>> -the modules in the GrUB entry (so with the blob commonly being last,
>>> -one could specify `ucode=-1`). Note that the value of zero is not valid
>>> -here (entry zero, i.e. the first module, is always the Dom0 kernel
>>> -image). Note further that use of this option has an unspecified effect
>>> -when used with xen.efi (there the concept of modules doesn't exist, and
>>> -the blob gets specified via the `ucode=<filename>` config file/section
>>> -entry; see [EFI configuration file description](efi.html)).
>>> -
>>> -'scan' instructs the hypervisor to scan the multiboot images for an cpio
>>> -image that contains microcode. Depending on the platform the blob with the
>>> -microcode in the cpio name space must be:
>>> -  - on Intel: kernel/x86/microcode/GenuineIntel.bin
>>> -  - on AMD  : kernel/x86/microcode/AuthenticAMD.bin
>>> -When using xen.efi, the `ucode=<filename>` config file setting takes
>>> -precedence over `scan`. The default value for `scan` is set with
>>> -`CONFIG_UCODE_SCAN_DEFAULT`.
>>> +Controls for CPU microcode loading.
>>> +
>>> +In order to load microcode at boot, Xen needs to find a suitable update
>>> +amongst the modules provided by the bootloader.  Two kinds of microcode update
>>> +are supported:
>>> +
>>> + 1. Raw microcode containers.  The format of the container is CPU vendor
>>> +    specific.
>>> +
>>> + 2. CPIO archive.  This is Linux's preferred mechanism, and involves having
>>> +    the raw containers expressed as files
>>> +    (e.g. `kernel/x86/microcode/{GenuineIntel,AuthenticAMD}.bin`) in a CPIO
>>> +    archive, typically prepended to the initrd.
>>> +
>>> +The `<integer>` and `scan=<bool>` options are mutually exclusive and select
>>> +between these two options.  Further restrictions exist for booting xen.efi
>>> +(see below).
>> ... then you say verbally that the two are exclusive of one another. That's
>> what the | there was intended to indicate. IOW I would prefer that line to
>> be left alone, but I'm not intending to insist.
> 
> You said that last time around, but it's still not how the parsing works.
> 
> ucode=1,1,1,scan,scan,scan,2 is legal.  The latest takes priority and
> cancels prior selections.
> 
> The reality is that | used in this context is meaningless when there's a
> comma separated loop around the whole thing.
> 
> If you don't like "mutually exclusive", what else do you suggest?

I'm happy with mutually exclusive. What I said I don't like is the dropping
of the |, expressing the same "mutually exclusive" in a non-verbal way. Imo
those short forms aren't supposed to describe how parsing works, but how the
options are intended to be used.

Jan

