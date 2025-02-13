Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 959DEA34DC7
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 19:33:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887925.1297355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tie16-0003F0-A7; Thu, 13 Feb 2025 18:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887925.1297355; Thu, 13 Feb 2025 18:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tie16-0003CD-6x; Thu, 13 Feb 2025 18:32:52 +0000
Received: by outflank-mailman (input) for mailman id 887925;
 Thu, 13 Feb 2025 18:32:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q8TG=VE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tie15-0003C7-8T
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 18:32:51 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed036439-ea38-11ef-abfc-e33de0ed8607;
 Thu, 13 Feb 2025 19:32:48 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5ded1395213so1535509a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 10:32:48 -0800 (PST)
Received: from [10.81.43.157] ([46.149.103.8])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dedc94688bsm21776a12.50.2025.02.13.10.32.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 10:32:47 -0800 (PST)
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
X-Inumbo-ID: ed036439-ea38-11ef-abfc-e33de0ed8607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739471568; x=1740076368; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Uu1U5YR++DcyNOE30oaIcO9JH/nSavqGiLmUpQMjlYU=;
        b=DMvtZE/seIUFU/sB09GW9Z2Repo74G9RzG75VrjOGOljZagnqR0w+DoC9vreOh9e/d
         dDFZh2XQs1WjwfinZRpgwfEN7ZkAXZBRnB3XEwz1Et55iwq7I3Tad/IALdpgLqSMtJNI
         h6rlPSDlEHFauArhPTFe59ItZFyb9kfc6GMWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739471568; x=1740076368;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uu1U5YR++DcyNOE30oaIcO9JH/nSavqGiLmUpQMjlYU=;
        b=cDuR7mMrngjiQ/Mp0ff+EuFRK4dnMQMdpySIQSJRIMD1XTsaApIxto6ddm8N2rRfsJ
         Y20TzI+33vj3XA8tpRDlONPsyKSgmuCQQMP25ibxsOFJ22JlrRT6j2q/4gfQpb7JBF/K
         XjdIeKWJ15b6MdBoGcZ+Qe9SdzLIT5FxO4PSXR6+dKeI21u9WorBFsjKxrU96thX0c6U
         TgXL1pa7Z5KZw0sDH7fzzQH+tSq7NZMHJmPI5qbyVIMXd/3z6jProPLx8Ql+GFKwx7ok
         Ka+RjUSSEDB8WgFpX6ApV14EHUbCWi20mii2zP0gZuSpkHXYmxC4WoAzdEXmcymVl3iY
         3ENA==
X-Forwarded-Encrypted: i=1; AJvYcCXm9S5VWqr1dp7PL2zFCAkLMT3G4ELgXa4Nfnf802etPMiMK7Z0BGgpON0AB33+fm+ydPdB8XoXT6Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGa3XR8t82aDCliuQWUnHVuXpWc7/dFcLbF8WgTV3PzmaCtOYR
	nzzq0jrRLDyfSU0Z9esKRyJOXUc2ue17Ptpz7gXnbtmstuZeMvkSXcaYQHqh1MI=
X-Gm-Gg: ASbGnctr/FM2KzIZszzH+U+e9/jJ0hGnz5yejzri2HLuU67V4FZFBcij9wBnqc1WnKP
	FJoc+fbgWJS/MC0jZGSmEZwTbPR18XXqpF4DrqqGDUzQBQkgkffN4Hmob22L2sVnioJUOw6ccs/
	YQ1kz4/iw378fb3N2lE7WWRiZy6l3nlwjqM3cqsalzdiam+eYq/xIqhEndZfh2kTm9q5PMJRCZn
	KiA5CxlhDEUTx2HJIvXsXIfOqKl2Y/Kx9KB04dy0pfxDDBrMalfvXyfnyraca2r03a4B1Aj9k1e
	O8ZVpHfofXlTHSN6f9E4hWHp
X-Google-Smtp-Source: AGHT+IE4VE07GgSxbHdJ2m0p8dlRkrPqnqQNmUfUSiYjBsBMK2HGTS2ZF95VWtkOpYVwimPE6XlzfQ==
X-Received: by 2002:a05:6402:3606:b0:5dc:7fbe:730a with SMTP id 4fb4d7f45d1cf-5dec9b70130mr4671610a12.0.1739471568174;
        Thu, 13 Feb 2025 10:32:48 -0800 (PST)
Message-ID: <a8df54e6-1fef-4eff-9846-d24bcfdd5bd4@citrix.com>
Date: Thu, 13 Feb 2025 18:32:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: blowfish failure to compile
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <65338578-dd6c-4f01-807e-da389cc60cb8@citrix.com>
 <a2ef5618-b719-4c7b-ac6c-6861ba146ce2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a2ef5618-b719-4c7b-ac6c-6861ba146ce2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/02/2025 10:06 am, Jan Beulich wrote:
> On 12.02.2025 18:20, Andrew Cooper wrote:
>> I've noticed the following failure in XenServer's build environment
>>
>>> make[6]: Leaving directory
>>> '/builddir/build/BUILD/xen-4.19.1/tools/tests/x86_emulator'
>>> In file included from /usr/include/features.h:535,
>>>                  from /usr/include/bits/libc-header-start.h:33,
>>>                  from /usr/include/stdint.h:26,
>>>                  from
>>> /usr/lib/gcc/x86_64-xenserver-linux/12/include/stdint.h:9,
>>>                  from blowfish.c:18:
>>> /usr/include/gnu/stubs.h:7:11: fatal error: gnu/stubs-32.h: No such
>>> file or directory
>>>     7 | # include <gnu/stubs-32.h>
>>>       |           ^~~~~~~~~~~~~~~~
>>> compilation terminated.
>>> make[6]: *** [testcase.mk:15: blowfish.bin] Error 1
>> It's non-fatal, but it reduces the content in test_x86_emulator which we
>> do care about running.
> Hmm, yes, I did see such in the past, and solved it by putting the seemingly
> missing header in place on the distro.

It's awkward.  With glibc, it's the glibc-i386-devel headers you need,
but this doesn't work in clean-64bit-only build environments, or in
Alpine where Musl has Opinions on how glibc works, and they go as far as
patching gcc to behave differently.

Alpine is what caused us to finally stop trying to use the compiler stdint.h

>
>> Elsewhere in the tree we fix this with -ffreestanding -nostdinc
>> -I$(XEN_ROOT)/tools/firmware/include but that isn't an option for
>> test_x86_emulator in general which is hosted.
>>
>> However, it is an option for blowfish.c specifically which is
>> freestanding, and for which we build a 32bit form in an otherwise 64bit
>> build.
>>
>> Therefore, it stands to reason that:
>>
>> diff --git a/tools/tests/x86_emulator/Makefile
>> b/tools/tests/x86_emulator/Makefile
>> index 294d27ebaa08..e46fd8becb96 100644
>> --- a/tools/tests/x86_emulator/Makefile
>> +++ b/tools/tests/x86_emulator/Makefile
>> @@ -33,8 +33,8 @@ HOSTCFLAGS += -m32 -I..
>>  
>>  else
>>  
>> -blowfish-cflags := ""
>> -blowfish-cflags-x86_32 := "-mno-accumulate-outgoing-args -Dstatic="
>> +blowfish-cflags := "-ffreestanding -nostdinc
>> -I$(XEN_ROOT)/tools/firmware/include "
>> +blowfish-cflags-x86_32 := "$(blowfish-cflags)
>> -mno-accumulate-outgoing-args -Dstatic="
> What this does is request the shared (between 32- and 64-bit)) flavor to
> be built differently, with the options "-ffreestanding -nostdinc
> -I$(XEN_ROOT)/tools/firmware/include". And then the (kind of) nested use
> of double quotes in blowfish-cflags-x86_32 ends up asking for several
> 32-bit flavors: One with -ffreestanding, one with -nostdinc, one with
> -I$(XEN_ROOT)/tools/firmware/include (which is what causes the
> strangeness you saw), and the pre-existing one with
> "-mno-accumulate-outgoing-args -Dstatic=".
>
> Every set of options grouped together by double quotes (or any unquoted
> option) designates a flavor (while the quotation isn't meaningful to
> make aiui, its use is in a shell construct, where those quotes play
> their usual role). That is,
>
> blowfish-cflags := ""
>
> designates a flavor without any special options. What I understand you
> want, though, is to have these flags passed to all of the blowfish
> flavors.
>
> What complicates things slightly is that the first of the options names
> the flavor (i.e. prior to your change, but with my APX changes in place,
> we have
>
> blowfish_x86_32[]
> blowfish_x86_32_mno_accumulate_outgoing_args[]
> blowfish_x86_64[]
> blowfish_x86_64_DREX2[]
> blowfish_x86_64_mapxf[]
>
> resulting from
>
> blowfish-cflags := ""
> blowfish-cflags-x86_32 := "-mno-accumulate-outgoing-args -Dstatic="
> blowfish-cflags-x86_64 := "-DREX2 -Dstatic=" "-mapxf -Dstatic="
>
> . I think you can see now how the compiler ends up choking on
>
> blowfish_x86_32_I/local/xen.spec/scm/tools/tests/x86_emulator/../../../tools/firmware/include[]
>
> .) Surely we could accommodate for the added options by changing the
> references from test_x86_emulator.c, but maybe there's a better way
> (and also potentially useful for other test blobs going forward),
> modifying the .h generator rule(s):
>
> 		$(MAKE) -f testcase.mk TESTCASE=$* XEN_TARGET_ARCH=$(arch) $*-cflags="$$cflags $($*-cflags-common)" all; \
>
> and then the needed addition simply being
>
> blowfish-cflags-common := -ffreestanding -nostdinc -I$(XEN_ROOT)/tools/firmware/include
>
> Entirely untested, though, for now.
>
> However, further: The freestanding-ness does apply to all of the test
> blobs, doesn't it? Why don't we alter
>
> CFLAGS += -fno-builtin -g0 $($(TESTCASE)-cflags) $(CFLAGS-VSZ)
>
> in testcase.mk to become
>
> CFLAGS += -ffreestanding -nostdinc -I$(XEN_ROOT)/tools/firmware/include
> CFLAGS += -g0 $($(TESTCASE)-cflags) $(CFLAGS-VSZ)
>
> (which doesn't appear to become dependent upon anything we don't already
> have available in this file, i.e. in particular $(XEN_ROOT) is already
> used elsewhere), seeing that -ffreestanding implies -fno-builtin?

-ffreestanding seems fine.

And while -nostdinc -I... works for the 32bit builds, they break the
64bit builds.

> In file included from blowfish.c:18:
> /builddir/build/BUILD/xen-4.20.0/tools/tests/x86_emulator/../../../tools/firmware/include/stdint.h:5:2:
> error: #error "32bit only header"
>     5 | #error "32bit only header"
>       |  ^~~~~
> make[6]: *** [testcase.mk:16: blowfish.bin] Error 1

which is because we've only provided half a stdint.h

I think that means we only want the -nostdinc -I... in the cross-build
case, which I guess means searching CFLAGS for `-m32`.




>
>>> blowfish.h:617:99: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or
>>> ‘__attribute__’ before ‘/’ token
>>>   617 | static const unsigned int __attribute__((section(".test,
>>> \"ax\", @progbits #")))
>>> blowfish_x86_32_I/local/xen.spec/scm/tools/tests/x86_emulator/../../../tools/firmware/include[]
>>> = {
>>>      
>>> |                                                                                                  
>>> ^
>> and at this point I've got completely lost in this build system.  The .h
>> generation seems to loop over each cflag, and while that looks plausible
>> for vector generation, I can't see how it works (except by accident) for
>> blowfish.
>>
>> The problem is the generation of $flavor, but this logic is completely
>> opaque.
> Can you suggest how to achieve the same in a less opaque way? (Surely it
> having grown over time has made quite a bit worse what may have been
> okay-ish in the beginning.)

I don't have a good suggestion.  More an observation than this is too
complicated for me to figure out how it works with half an hour of trying?

~Andrew

