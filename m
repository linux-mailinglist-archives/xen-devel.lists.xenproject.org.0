Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E5C79AAA0
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 19:50:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599692.935223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfl2z-0006t5-5i; Mon, 11 Sep 2023 17:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599692.935223; Mon, 11 Sep 2023 17:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfl2z-0006q4-2m; Mon, 11 Sep 2023 17:50:05 +0000
Received: by outflank-mailman (input) for mailman id 599692;
 Mon, 11 Sep 2023 17:50:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Yi3=E3=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1qfl2x-0006T5-6p
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 17:50:03 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a11fb0a1-50cb-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 19:50:00 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31c4d5bd69cso4888553f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 10:50:00 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f8-20020adff588000000b0030ae53550f5sm10748962wro.51.2023.09.11.10.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 10:49:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 484921FFBB;
 Mon, 11 Sep 2023 18:49:59 +0100 (BST)
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
X-Inumbo-ID: a11fb0a1-50cb-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694454600; x=1695059400; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmmhkTlkET3a5MfSU++LiQw+rki5ezPn5mesYA13vjQ=;
        b=s+srD6v7LxCck/1GRXm+33lkYX2WlxB/R4NMJofXn9EjLkP2kZVtxq9hbz5R9axJXl
         ZJX8e2w4XOLxbXDE4MXwytqmyELxfn+gR4QaCZfSBv1d9O1JCbUgNU8UUsbLYVr3+UHL
         glAc0CrtyNr9eeY/C9DkiaGDjoUo4u6tlNM/GzYl1j9zS+aJVM2vuqNZ/NKzf4e0rXSE
         69fFzjf0XYyeABE4IXPVMEPj4QPI3N2ZkxpF3T5n7UJKxr1gvINQn6Mzo8x2Ma7szMik
         UWqjuaKVzwe0CsuPLDTZUwHWQ50Spx92yJ1MQrWDCcj6oEhgFIMUydjZxB/O/oFqEInh
         kZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694454600; x=1695059400;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rmmhkTlkET3a5MfSU++LiQw+rki5ezPn5mesYA13vjQ=;
        b=UBNDs7yqbl1zAB04OPIR1KWp/EfNfDqmGbo8UwLsLTOqbPYo773ZjqK+7cXkojwMnI
         ZZ97hi8dkxFyqb2/0cLfS5qlLtLQ28VUzutmzq52jq3cuU9ANfJWJ7k1jb4wuQz5rWJn
         tq+anMpBSmtsGoS8ENREtUbFaxyWco+wEACXsrMWWeW9lZU/fuprS8hPfGLoUitg2eAW
         2LCG7Mgfh4Ji7ydvSJ2vJnI2x3O9d0/TWvxSuz7HpIrO7uKw3PInNcw+X3X0erESzhcK
         k4bew6iSGCUaGRW5OpfpcwyftsVgU8K1onWyp8rUZiOT5KfRU4vsgUptQ1J02XKqhMk+
         +MHg==
X-Gm-Message-State: AOJu0YwA2/z7c/ZMH1FZPuh5kLWHp4Gk2yXDSOgJjc6GC9AGP9ehBnNp
	sa9JrD8mWiHi3pZjtFczC6Zz4w==
X-Google-Smtp-Source: AGHT+IHBY6i/8qE64TgCqFlQcDGg1T8I3lT/xERbUXTwlHyoZAAzpTqxzlpsllGn+zZjfcOG6v/d0g==
X-Received: by 2002:adf:fec3:0:b0:317:6b0d:1b1 with SMTP id q3-20020adffec3000000b003176b0d01b1mr8113916wrs.4.1694454600100;
        Mon, 11 Sep 2023 10:50:00 -0700 (PDT)
References: <20230902151351.10325-1-javi.merino@cloud.com>
 <ce6e7abd-40ee-dd9e-b17c-10c39ca0e422@suse.com>
 <87y1hcogg2.fsf@linaro.org>
 <7975f360-9608-3495-67ed-1dbfec330668@suse.com>
User-agent: mu4e 1.11.17; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Javi Merino <javi.merino@cloud.com>, Henry Wang <Henry.Wang@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] coverage: update gcov info for newer versions of gcc
Date: Mon, 11 Sep 2023 18:43:16 +0100
In-reply-to: <7975f360-9608-3495-67ed-1dbfec330668@suse.com>
Message-ID: <87pm2oob08.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Jan Beulich <jbeulich@suse.com> writes:

> On 11.09.2023 17:26, Alex Benn=C3=A9e wrote:
>> Jan Beulich <jbeulich@suse.com> writes:
>>> On 02.09.2023 17:11, Javi Merino wrote:
>>>> --- a/xen/common/coverage/Makefile
>>>> +++ b/xen/common/coverage/Makefile
>>>> @@ -5,7 +5,9 @@ obj-y +=3D $(call cc-ifversion,-lt,0407, \
>>>>  		gcc_3_4.o, $(call cc-ifversion,-lt,0409, \
>>=20
>> This isn't even supported, see below:
>>=20
>>>>  		gcc_4_7.o, $(call cc-ifversion,-lt,0500, \
>>>>  		gcc_4_9.o, $(call cc-ifversion,-lt,0700, \
>>>> -		gcc_5.o, gcc_7.o))))
>>>> +		gcc_5.o, $(call cc-ifversion,-lt,1000, \
>>>> +		gcc_7.o,  $(call cc-ifversion,-lt,1200, \
>>>> +		gcc_10.o, gcc_12.o))))))
>>>
>>> This is getting unwieldy, so I think we ought to try to limit the number
>>> of different files we have. Already gcc_4_9.c and gcc_7.c specify the
>>> same GCOV_COUNTERS and differ only in the version checks (which could be
>>> combined). Therefore ...
>>=20
>> You may want to consider your policy on supported GCC versions. I see
>> you still support:
>>=20
>>     * C compiler and linker:
>>       - For x86:
>>         - GCC 4.1.2_20070115 or later
>>         - GNU Binutils 2.16.91.0.5 or later
>>         or
>>         - Clang/LLVM 3.5 or later
>>       - For ARM 32-bit:
>>         - GCC 4.9 or later
>>         - GNU Binutils 2.24 or later
>>       - For ARM 64-bit:
>>         - GCC 5.1 or later
>>         - GNU Binutils 2.24 or later
>>=20
>> While also having some commented out warnings because the base GCC is so=
 old:
>>=20
>>   CFLAGS   +=3D -Wmissing-prototypes
>>   # (gcc 4.3x and later)   -Wconversion -Wno-sign-conversion
>>=20
>> For reference QEMU's minimum GCC is 7.4
>>=20
>>   if compiler.get_id() =3D=3D 'gcc' and compiler.version().version_compa=
re('>=3D7.4')
>>=20
>> and while our support cycle is based off distro LTS releases I have to
>> wonder do you actually need to support users building the
>> latest/greatest version of the hypervisor on ancient user-spaces with
>> old compilers?
>>=20
>> I think the oldest distro you have in your CI is jessie (still hanging
>> on with extended LTS support) and that uses GCC 4.9.
>>=20
>> I see there are various scripts to gather support status into the
>> documentation but I couldn't find a general statement on the projects
>> overall approach to supported versions of components.
>
> That's the problem - we've been intending to raise the baseline for quite
> some time, but figuring at least a rule of thumb by which to go both now
> and in the future turns out problematic.

FWIW QEMU states:

  The project aims to support the most recent major version at all times
  for up to five years after its initial release. Support for the
  previous major version will be dropped 2 years after the new major
  version is released or when the vendor itself drops support, whichever
  comes first. In this context, third-party efforts to extend the
  lifetime of a distro are not considered, even when they are endorsed
  by the vendor (eg. Debian LTS); the same is true of repositories that
  contain packages backported from later releases (e.g. Debian
  backports). Within each major release, only the most recent minor
  release is considered.

  For the purposes of identifying supported software versions available
  on Linux, the project will look at CentOS, Debian, Fedora, openSUSE,
  RHEL, SLES and Ubuntu LTS. Other distros will be assumed to ship
  similar software versions.

We also make some specific statements about python runtimes and optional
dependencies. Again this is perhaps easier for us as a user-space
program but it's worthwhile writing something up as a policy even if you
find you need to tweak it later. We also document our feature
deprecation policy and what has been removed.

If you want to crib anything from QEMU as an initial stab at it please
see:

  https://qemu.readthedocs.io/en/master/about/index.html

(this is docs/about/ in our source tree).

>
> Jan


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

