Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937AAA737A9
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 18:04:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929852.1332633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txqeC-0003O1-LL; Thu, 27 Mar 2025 17:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929852.1332633; Thu, 27 Mar 2025 17:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txqeC-0003Lc-Hl; Thu, 27 Mar 2025 17:04:04 +0000
Received: by outflank-mailman (input) for mailman id 929852;
 Thu, 27 Mar 2025 17:04:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4IZU=WO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txqeB-0003LU-JW
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 17:04:03 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a6d9580-0b2d-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 18:04:00 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso13831695e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 10:04:00 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66d29csm75886f8f.60.2025.03.27.10.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 10:03:59 -0700 (PDT)
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
X-Inumbo-ID: 7a6d9580-0b2d-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743095040; x=1743699840; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tisDw70UoRXQaxjCMRCcDBANHnGYxyyeAWXsSY9kPUE=;
        b=UzX8ox4MbbiGxRBDgd0LrHQ+fI7DNgCUcFhBSVKFSCgPvDhre4LZqTxrdp5rh8XmT/
         D2Ye00z3TXz2+t/c7oao0M5KDKVNInFs0mB1PkrazKxzYPuOnecbSAvLDUxXUEA1zZzL
         +mdKhPu6sskchrKzvVu8JZA6HNmVr+ruGODU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743095040; x=1743699840;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tisDw70UoRXQaxjCMRCcDBANHnGYxyyeAWXsSY9kPUE=;
        b=pCzbLIF/xJDdFLr6B/gnjF+0W0zKxtpaaueXhZ57fh/wQjsqNajs16EybZwvpa9aT7
         o/csHLXam4+Mfy1j5Jg/IrclCkxXiyh6w3J7rN33tN9Ff/o6vPr7q6FVPePC03JGyjWQ
         NHvV8Icps2VAxqANcmUxGAMZZbbBxFger/hj7T7b6WRxQQy1Iu5ralB+FnlxLTZGay2l
         d1fhrW0HnunM/lyvd9XyjYL9c44owz7ZDTS/VmOPGD7vjdjYiCaxTAcd6kKGGn7UJP+B
         ISMtozy+k5cQqNquuxC2KM0ZdD3yLKRwxOvk6aIfsSkzbo4NHLv7/mDFS63EqN2LaPtc
         2QeA==
X-Forwarded-Encrypted: i=1; AJvYcCV3g3zQpL9W6yglNy3IbbG0BbL5L+hS9pUhk0cyXU5XEBqZkgVX82Zrc4Sxokia0eETB6JSpePAbgQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxGwgjCPk/5V9XYje7/pGYGSFO8+1jShNNTYbBXABAOcGaBab8
	S+4mle6/NBKI9j8Kq08pvYrA57be/kDAwIgsLzQMRhUykbKKIdNEYS0m9TsgtOo=
X-Gm-Gg: ASbGncudfeRZ5XjeMClL3vHCTGMNv9we1e0p17scBGqU29Ia98MvGeam4byfBwK74Bi
	c6pIpGWFcnQ6FFHUuEDnB6fUa2CIVPtl9fzcoyPLH2PijpCbRkBE91teII15RcH7L9MH2hVCRLl
	OEkibwbLDXyG4UMw8eosRBik1b/gFi5JHXgJZtwcleiA+kblCeZ6eb9YzUfResEtzeVcc+p7Mga
	TRZuwS9SDpv7WXbOZ9LmAblMaNOXfcnS0sjV3JoHPEELp79xVS38oWBFZPQNmQO1nn39Y0GKWw4
	E/uYVJ6EADzxitMh9aESGhEhfFDL0kFGy2flRZTx80ox3ogmLKN/knzbX/fIz5atq7SnjKJ3i6u
	qwBZ0J7VBA8xNd8X+z0j4
X-Google-Smtp-Source: AGHT+IF98MrMGFYrz6/MpVMXmhoK2OPz7frAiN09njHjJmZ+e484NKETPho3YWo+VE5/HXwer5KDbw==
X-Received: by 2002:a05:600c:4f89:b0:43c:ec0a:ddfd with SMTP id 5b1f17b1804b1-43d84f5a46dmr44859485e9.6.1743095039539;
        Thu, 27 Mar 2025 10:03:59 -0700 (PDT)
Message-ID: <31aa39ed-ffb3-40db-9ab8-8e0c93c3f498@citrix.com>
Date: Thu, 27 Mar 2025 17:03:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] CHANGELOG: Minimum toolchain requirements
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250320155908.43885-1-andrew.cooper3@citrix.com>
 <20250320155908.43885-4-andrew.cooper3@citrix.com>
 <c901f573-97dc-4ad0-9974-847fc58a0d44@gmail.com>
 <956eb48f-b2f6-4951-8b12-2cf0dcfa2c9e@citrix.com>
 <97e68799-a14a-4363-add8-63be6ad59f82@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <97e68799-a14a-4363-add8-63be6ad59f82@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/03/2025 4:55 pm, Oleksii Kurochko wrote:
>
>
> On 3/27/25 4:45 PM, Andrew Cooper wrote:
>> On 21/03/2025 4:24 pm, Oleksii Kurochko wrote:
>>> On 3/20/25 4:59 PM, Andrew Cooper wrote:
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>>> CC: Michal Orzel <michal.orzel@amd.com>
>>>> CC: Jan Beulich <jbeulich@suse.com>
>>>> CC: Julien Grall <julien@xen.org>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>> ---
>>>>  CHANGELOG.md | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>>> index 9a5919585d43..4e333e608a96 100644
>>>> --- a/CHANGELOG.md
>>>> +++ b/CHANGELOG.md
>>>> @@ -7,6 +7,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>>  ## [4.21.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>>>>  
>>>>  ### Changed
>>>> + - The minimum toolchain requirements have been increased to either:
>>>> +   - GCC 5.1 and Binutils 2.25, or
>>>> +   - Clang/LLVM 11
>>> I think we want here to specify for which architectures it was done as RISC-V, for example, uses
>>> different versions:
>>>  - GCC 12.2 or later
>>>  - GNU Binutils 2.39 or later
>>> And for clang the version will be 17 as:
>>>   f873029386dd415cd9caa78f600a593d9570c9ae("[BOLT] Add minimal RISC-V 64-bit support")
>>>   $ git tag --contains f873029386dd415cd9caa78f600a593d9570c9ae
>>>     llvmorg-17.0.0
>>>   ...
>>> I have some patch to build Xen RISC-V using clang-17 but I haven't sent to upstream yet as I am not
>>> really sure that if we need (or why we need) clang support just from the start.
>> The same reason why we got an almost-nothing build in CI first, and are
>> currently looking for a "hello world" message on boot.
>>
>> Keeping it working as you go is much easier than retrofitting at a later
>> point, and supporting more than 1 of any $THING (not just compilers) is
>> good to prevent accidental reliance on an implementation specific property.
>>
>> The only question is what version of Clang exists in Debian bookworm, as
>> that affects how easy/hard it is to add to CI.
>>
>> According to https://packages.debian.org/search?keywords=clang, bookworm
>> has Clang 14, while trixie has Clang 19.
>>
>> So, how hard a limit is Clang-17?  Is Clang-14 doable or not?
> I think it is pretty hard limit because:
> 1. I haven't checked all the extension but, for example, we required 'H' extension and
>    the support for it was added in 16.0.0:
>    [f4c887c3a8406d85f4f942c8350f10026994f4d8("RISCV] Add H extension")
>    $ git tag --contains f4c887c3a8406d85f4f942c8350f10026994f4d8
>      llvmorg-16.0.0
>      ...
> 2. Minimal support for RISCV-64 was added in clang17:
>    f873029386dd415cd9caa78f600a593d9570c9ae("[BOLT] Add minimal RISC-V 64-bit support")
>    $ git tag --contains f873029386dd415cd9caa78f600a593d9570c9ae
>      llvmorg-17.0.0
>      ...
> And, actually, the second one reason was the reason why I tried to build with clang17 and suggests to use
> it as a baseline.

That's fine.  It means we can't use Debian bookworm for this purpose.

>
>> Alternatively, we could start adding some trixie containers.  We have
>> passed the toolchain freeze (was 15th March), so the build container
>> should be stable now, even if it isn't quite released yet.
> clang has nice script to add any version. I did that in the following way
> for bookworm docker container:
> +    DEPS=(
> +        # Clang
> +        wget
> +        gnupg
> +        ca-certificates
> +        lsb-release
> +        software-properties-common
> ...
> +    update-ca-certificates
> +
> +    wget -O - https://apt.llvm.org/llvm.sh | bash -s 17
> +    wget -O - https://apt.llvm.org/llvm.sh | bash -s 18
> +    wget -O - https://apt.llvm.org/llvm.sh | bash -s 19
> +    wget -O - https://apt.llvm.org/llvm.sh | bash -s 20
> +    # ln -s /usr/bin/clang-17 /usr/bin/clang

We used to do this.

It backfired spectacularly when rebuilding a container after versions of
clang had been dropped, and took out testing on the stable-* trees as a
consequence.

Therefore, we don't do this any more.  (Or at least, not in a container
marked for blocking failures.)

~Andrew

