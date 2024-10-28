Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB559B328C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 15:07:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826598.1240912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5QOC-0003dc-Ez; Mon, 28 Oct 2024 14:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826598.1240912; Mon, 28 Oct 2024 14:06:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5QOC-0003al-Bz; Mon, 28 Oct 2024 14:06:36 +0000
Received: by outflank-mailman (input) for mailman id 826598;
 Mon, 28 Oct 2024 14:06:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lrK=RY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5QOA-0003ad-QF
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 14:06:34 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6943c72-9535-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 15:06:33 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c94c4ad9d8so5478346a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 07:06:33 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb62bf6d9sm3198286a12.41.2024.10.28.07.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 07:06:32 -0700 (PDT)
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
X-Inumbo-ID: d6943c72-9535-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730124393; x=1730729193; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NJdvdSdjih30FFj9NiSBsZom9mpswneW2CqtQ3UJp/E=;
        b=I5UDeAoppad5ZSu8025rg+qwH0dMlgpC1OJH5naj0GMzFUkJ6lTQJ72zRyuBuPPhyN
         Z/e8RkQQ0DT8cHVXrV1rENvQ6+hZchAgR9SA+g61C1p7SaPpYENzgBGIoFq/1ml/CILc
         0fE9BIba7Ry81Qp7jTeqnmzDFB2KGZqE5S9Fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124393; x=1730729193;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJdvdSdjih30FFj9NiSBsZom9mpswneW2CqtQ3UJp/E=;
        b=BppUbwaFTAPzF6Nc1/v8KNrpMvmzhI2bDuUFIm4fMfIWOWyixlFJDaD4xcbct5MexY
         kPbiBUb0R7qnWICNP17lzuXnByr2NEV5vdTenrth/mLJIDLEJjgOakbjHKVRvXAXQOvM
         NUM1GZhD04I6MOIYWuhDO6G3eIxZiYPJ42a1UrfBvkPuLInGkHhjK1I6axfgzaErfrmz
         68lzLXGbtUqxoHXMxxmERBv/K4rRNoeIZdvE97kn5epSYoBI6Cp18zbXPuRI5Bu7iX/t
         /KL1DlTg/MlaqT0VXS/1INC7+rtT4GfFozOAOLWmpE/f4WF6yCttnS73XMskOrZfzKCt
         qpsg==
X-Forwarded-Encrypted: i=1; AJvYcCWdKPw+0j7QM5d7UbB18v2bZ3oLL8wLGguurSzbZP0cVIcrXbXgkrLuTtJP/g+2iGep5SBRxZbYMok=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx88kT9ZkUgwTHp3t5awQ7JF4CiWoOBC5ss6zdiaZmDv00ILavY
	4rj8CM9ZG8cbaCptd+ZMOOPnAFwPnoEOoG0RnhkUTpdKS1/9wCqfQMiNHESH66M=
X-Google-Smtp-Source: AGHT+IGs6cIgsryQev9kpCiZlKkDbiuryucsDoP934kEoitsCBt4p3W6GyHv/ODBvvky9tMdHrNZSg==
X-Received: by 2002:a05:6402:51cb:b0:5c9:45cf:483d with SMTP id 4fb4d7f45d1cf-5cbbf8c092bmr7219494a12.15.1730124393170;
        Mon, 28 Oct 2024 07:06:33 -0700 (PDT)
Message-ID: <29611a56-f55c-4185-91e6-7b05965854f4@citrix.com>
Date: Mon, 28 Oct 2024 14:06:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] x86/ucode: Enforce invariant about module selection
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-7-andrew.cooper3@citrix.com>
 <901cfadc-c58e-4154-a5d3-ecf65c2a6336@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <901cfadc-c58e-4154-a5d3-ecf65c2a6336@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/10/2024 1:56 pm, Jan Beulich wrote:
> On 28.10.2024 10:18, Andrew Cooper wrote:
>> The work to add the `ucode=nmi` cmdline option left a subtle corner case.
>> Both scan and an explicit index could be selected, and we could really find a
>> CPIO archive and explicit microcode file.
>>
>> Worse, because the if/else chains for processing ucode_{blob,mod} are opposite
>> ways around in early_microcode_load() and microcode_init_cache(), we can
>> genuinely perform early microcode loading from the CPIO archive, then cache
>> from the explicit file.
>>
>> Therefore, enforce that only one selection method can be active.
> Question is - is this really the best of all possible behaviors? One may want
> to use one approach as the fallback for the other, e.g. preferably use what
> the CPIO has, but fall back to something pre-installed on the boot or EFI
> partition.

It is unfortunate behaviour.

I've seen explicit complains about it on the archlinux forums; putting a
CPIO fragment in EFI's ucode= argument and getting confused as to why it
doesn't work.

However, it is (reasonably) necessary to dis-enagle this path, and we
currently document it as "undefined behaviour".

I think that we should re-evaluate the behaviour, after the rest of the
boot cleanup is done and we have an easier time reasoning about what is
what.
>> @@ -139,12 +148,16 @@ static int __init cf_check parse_ucode(const char *s)
>>          else if ( !ucode_mod_forced ) /* Not forced by EFI */
>>          {
>>              if ( (val = parse_boolean("scan", s, ss)) >= 0 )
>> -                ucode_scan = val;
>> +            {
>> +                opt_scan = val;
>> +                opt_mod_idx = 0;
>> +            }
>>              else
>>              {
>>                  const char *q;
>>  
>> -                ucode_mod_idx = simple_strtol(s, &q, 0);
>> +                opt_scan = false;
>> +                opt_mod_idx = simple_strtol(s, &q, 0);
>>                  if ( q != ss )
>>                      rc = -EINVAL;
>>              }
> I think this latter part rather wants to be
>
>                 opt_mod_idx = simple_strtol(s, &q, 0);
>                 if ( q != ss )
>                 {
>                     opt_mod_idx = 0;
>                     rc = -EINVAL;
>                 }
>                 else
>                     opt_scan = false;
>
> to prevent a malformed ucode= to clobber an earlier wellformed ucode=scan.
> (There are limits to this of course, as an out-of-range value would still
> invalidate the "scan" request.)

Fine.  I'm not overly fussed.  We don't make any pretence that erroneous
cmdline settings are handled nicely.

>
>> @@ -817,17 +830,42 @@ static int __init early_microcode_load(struct boot_info *bi)
>>      const void *data = NULL;
>>      size_t size;
>>      struct microcode_patch *patch;
>> +    int idx = opt_mod_idx;
>> +
>> +    /*
>> +     * Cmdline parsing ensures this invariant holds, so that we don't end up
>> +     * trying to mix multiple ways of finding the microcode.
>> +     */
>> +    ASSERT(idx == 0 || !opt_scan);
>>  
>> -    if ( ucode_mod_idx < 0 )
>> -        ucode_mod_idx += bi->nr_modules;
>> -    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= bi->nr_modules ||
>> -         !__test_and_clear_bit(ucode_mod_idx, bi->module_map) )
>> -        goto scan;
>> -    ucode_mod = *bi->mods[ucode_mod_idx].mod;
>> - scan:
> Oh, the goto and label are going away here anyway. Never mind the comment on
> the earlier patch then.

Thanks, and yes.

I did play with the order quite a lot.  The first iteration did clean
this up as part of merging into early_microcode_load(), but it turned
into a mess.

This way around (straight fold in the previous patch, rework here given
the invariant) was the cleanest I came up with.

~Andrew

