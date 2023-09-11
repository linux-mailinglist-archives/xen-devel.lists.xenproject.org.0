Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E35279A9FC
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 17:53:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599602.935088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfjDG-0003co-Ja; Mon, 11 Sep 2023 15:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599602.935088; Mon, 11 Sep 2023 15:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfjDG-0003ab-Gp; Mon, 11 Sep 2023 15:52:34 +0000
Received: by outflank-mailman (input) for mailman id 599602;
 Mon, 11 Sep 2023 15:52:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Yi3=E3=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1qfjDF-0003ZB-7c
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 15:52:33 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37273e7c-50bb-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 17:52:31 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3ff7d73a6feso48977625e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 08:52:31 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a1cf70b000000b00401d8810c8bsm13620840wmh.15.2023.09.11.08.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 08:52:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A24441FFBB;
 Mon, 11 Sep 2023 16:52:29 +0100 (BST)
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
X-Inumbo-ID: 37273e7c-50bb-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694447550; x=1695052350; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zb1+wi30CnuBBhAaP6rYq/qdnkDNBGUjT1rxgMg7Os4=;
        b=F9yz8QXD6hXM8j6DlRhN25sNRT2BpXGWa0edgfO011TT8Y2TRb2Qqi/H5a4zBP3FoR
         zBBAUSn354d4TCvW0TgpEFkFyxquw1YulTv9YCGqEKU6PKFJGEftPzGkUDIEFf7QMqiN
         8lJE2iE+yfyrr5XSTawhCltTu6ZkGzdokicSSbLFSFdqjjAA6sOnzVvt2CI8w3kNLRwG
         trDkd5VxnJerEOvd9AybrJ81kxjRksIDhTSmLNYnuLF602YooRBbkTZkBqj4pqPTMX/7
         mSKbMh9978QiI1D/zwhfULAjGwzhraLiZ+JTOS1+XqAd0QmVTBrGcf2/KNC9NLVbw/f/
         NFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694447550; x=1695052350;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zb1+wi30CnuBBhAaP6rYq/qdnkDNBGUjT1rxgMg7Os4=;
        b=PqjZZw8TX8dAVG6tuof6WY6nQ+j9SIrxEV4u5PrivmRVytZ0j+cH07p0o6N5ZStwiM
         uWwpZgCKabFM4TXBASinQc60G7eB3OHMbVXmVPjR3EN1ZvuJCTn1HovFf33b/LXL4JVT
         FukWxIuV2GUmeYoPGeMCOqyJlzvSZ/ok1PLHTTN4PZ8Qzv7fGH4gOLDd/4iyGlLtCOMF
         2NFEvejbPd7GJ+oUP1AkWH5L8/etPhPvKgGy+xR2LDD8HFj5Mto4pfY5u95aE1+g4Ggw
         0H1mp1cdMZQuC62WP+lHJAeGgHO/i3OxriBX0bBBeAKBZwnbnN7YxvqQbDdJsgKqELbJ
         5gYQ==
X-Gm-Message-State: AOJu0YzFdBHsTfWcCT1mFoXghk/alcbe9HXB3fkzW7Ei4jLjgyw9pA0Q
	MhMAn9ZE3d4xkH6c7MOFLq1+rQ==
X-Google-Smtp-Source: AGHT+IFwVy2Io7j/R9zTW3T811BVaUE+NHklEDhN5YUZ5MT+CJRW5HJcyon+UDrFG1J42TWENVYkZg==
X-Received: by 2002:a05:600c:2483:b0:401:d2cb:e6f3 with SMTP id 3-20020a05600c248300b00401d2cbe6f3mr9640429wms.1.1694447550469;
        Mon, 11 Sep 2023 08:52:30 -0700 (PDT)
References: <20230902151351.10325-1-javi.merino@cloud.com>
 <ce6e7abd-40ee-dd9e-b17c-10c39ca0e422@suse.com>
User-agent: mu4e 1.11.17; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Javi Merino <javi.merino@cloud.com>, Henry Wang <Henry.Wang@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] coverage: update gcov info for newer versions of gcc
Date: Mon, 11 Sep 2023 16:26:01 +0100
In-reply-to: <ce6e7abd-40ee-dd9e-b17c-10c39ca0e422@suse.com>
Message-ID: <87y1hcogg2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Jan Beulich <jbeulich@suse.com> writes:

> On 02.09.2023 17:11, Javi Merino wrote:
>> --- a/xen/common/coverage/Makefile
>> +++ b/xen/common/coverage/Makefile
>> @@ -5,7 +5,9 @@ obj-y +=3D $(call cc-ifversion,-lt,0407, \
>>  		gcc_3_4.o, $(call cc-ifversion,-lt,0409, \

This isn't even supported, see below:

>>  		gcc_4_7.o, $(call cc-ifversion,-lt,0500, \
>>  		gcc_4_9.o, $(call cc-ifversion,-lt,0700, \
>> -		gcc_5.o, gcc_7.o))))
>> +		gcc_5.o, $(call cc-ifversion,-lt,1000, \
>> +		gcc_7.o,  $(call cc-ifversion,-lt,1200, \
>> +		gcc_10.o, gcc_12.o))))))
>
> This is getting unwieldy, so I think we ought to try to limit the number
> of different files we have. Already gcc_4_9.c and gcc_7.c specify the
> same GCOV_COUNTERS and differ only in the version checks (which could be
> combined). Therefore ...

You may want to consider your policy on supported GCC versions. I see
you still support:

    * C compiler and linker:
      - For x86:
        - GCC 4.1.2_20070115 or later
        - GNU Binutils 2.16.91.0.5 or later
        or
        - Clang/LLVM 3.5 or later
      - For ARM 32-bit:
        - GCC 4.9 or later
        - GNU Binutils 2.24 or later
      - For ARM 64-bit:
        - GCC 5.1 or later
        - GNU Binutils 2.24 or later

While also having some commented out warnings because the base GCC is so ol=
d:

  CFLAGS   +=3D -Wmissing-prototypes
  # (gcc 4.3x and later)   -Wconversion -Wno-sign-conversion

For reference QEMU's minimum GCC is 7.4

  if compiler.get_id() =3D=3D 'gcc' and compiler.version().version_compare(=
'>=3D7.4')

and while our support cycle is based off distro LTS releases I have to
wonder do you actually need to support users building the
latest/greatest version of the hypervisor on ancient user-spaces with
old compilers?

I think the oldest distro you have in your CI is jessie (still hanging
on with extended LTS support) and that uses GCC 4.9.

I see there are various scripts to gather support status into the
documentation but I couldn't find a general statement on the projects
overall approach to supported versions of components.

>
>> --- /dev/null
>> +++ b/xen/common/coverage/gcc_10.c
>> @@ -0,0 +1,31 @@
>> +/*
>> + *  This code provides functions to handle gcc's profiling data format
>> + *  introduced with gcc 10.
>> + *
>> + *  For a better understanding, refer to gcc source:
>> + *  gcc/gcov-io.h
>> + *  libgcc/libgcov.c
>> + *
>> + *  Uses gcc-internal data definitions.
>> + */
>> +
>> +#include "gcov.h"
>> +
>> +#if GCC_VERSION < 100000 || GCC_VERSION > 120000
>> +#error "Wrong version of GCC used to compile gcov"
>> +#endif
>> +
>> +#define GCOV_COUNTERS 8
>> +#define GCOV_UNIT_SIZE 1
>> +
>> +#include "gcc_4_7.c"
>
> ... this could simply re-use gcc_4_7.c directly, with just the version
> check there suitably tweaked.
>
>> --- a/xen/common/coverage/gcc_4_7.c
>> +++ b/xen/common/coverage/gcc_4_7.c
>> @@ -27,6 +27,7 @@
>>  #  error "Wrong version of GCC used to compile gcov"
>>  # endif
>>  #define GCOV_COUNTERS 8
>> +#define GCOV_UNIT_SIZE 1
>>  #endif
>
> If further this became a separate #ifdef, ...
>
>> --- a/xen/common/coverage/gcc_4_9.c
>> +++ b/xen/common/coverage/gcc_4_9.c
>> @@ -19,6 +19,7 @@
>>  #endif
>>=20=20
>>  #define GCOV_COUNTERS 9
>> +#define GCOV_UNIT_SIZE 1
>>=20=20
>>  #include "gcc_4_7.c"
>>=20=20
>> --- a/xen/common/coverage/gcc_5.c
>> +++ b/xen/common/coverage/gcc_5.c
>> @@ -19,6 +19,7 @@
>>  #endif
>>=20=20
>>  #define GCOV_COUNTERS 10
>> +#define GCOV_UNIT_SIZE 1
>>=20=20
>>  #include "gcc_4_7.c"
>>=20=20
>
> ... touching these two files could be avoided altogether.
>
> Henry - afaict this was submitted after the feature submission deadline,
> so you may want to consider giving it an exception.
>
> Jan


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

