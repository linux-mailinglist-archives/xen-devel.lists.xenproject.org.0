Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB07962A0D
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 16:20:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784883.1194291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjJXP-00043U-7M; Wed, 28 Aug 2024 14:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784883.1194291; Wed, 28 Aug 2024 14:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjJXP-00041z-4W; Wed, 28 Aug 2024 14:20:43 +0000
Received: by outflank-mailman (input) for mailman id 784883;
 Wed, 28 Aug 2024 14:20:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjJXN-00041t-Ja
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 14:20:41 +0000
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [2001:4860:4864:20::36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3ab33a9-6548-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 16:20:40 +0200 (CEST)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-27022a3536dso4837755fac.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 07:20:40 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a67f341defsm643471685a.28.2024.08.28.07.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 07:20:38 -0700 (PDT)
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
X-Inumbo-ID: b3ab33a9-6548-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724854839; x=1725459639; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ODmkmzjojR3IXzIVniL2oQ6WHIyDJC/mL6mCiOia3Aw=;
        b=TIJbNPG8gGSh8+e++SWZ5KF2WMOZP+hSCz0uVTFX9BzVueDbhbhoH8ZvteGyVRZEor
         42eupB4M1D67R3Fwg/OFfGlH4AkYAxlkNY2E3Hwu+BAR9mgH7QVG32zB412cuacplEJ3
         GhEe7C27VzWo1aUZ76HzNLavbqc5956wQBkis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724854839; x=1725459639;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODmkmzjojR3IXzIVniL2oQ6WHIyDJC/mL6mCiOia3Aw=;
        b=lGButjLNOdkKhwZL8NVtmu3rmWLOPX50UwnLxWdrrHnlv6d3aswfNZjIYqUffPLCZf
         AFRY4tn5cjf+yCH1Ndwwxef30peJSaxSASTlyB1ouH+uDa9eJSxLHe9zmznowsORUAcs
         s7/YH1skhdLwnZWN2VjnB0Frk8qkUxUUIBwedg2xR/6KOGBswnJnOf3WHwmZgZKKZri8
         LLgAqDtEoA1EX7GBBzKNF83R81E9LLY/3qfHwcNXhYBDmEl5kI1gCIHjq9BJopljH5rE
         kkiSxTwQufmSw2ROb3/g7vqa06cDgwdB0wcxvS8tckmiS7lXYwO92h6VZ5XORe2KB2jE
         pfrA==
X-Gm-Message-State: AOJu0YxODrPRsnZ/VgLRiajULbuf8QU/BP5oNNT6SRLoEBa9cbjXP+tU
	0dq0MAj7Ky3KZZo2SD2C4wEMzK+Rq78RUIW0gTWcU01w0cMbJCGZj3169CARi88=
X-Google-Smtp-Source: AGHT+IFmCinpX1DrG+DDqk3XRxAW/6A89MXsB1oQphwZ13V726wuYQKVZrL9fS0OvuL5lZNwguij+A==
X-Received: by 2002:a05:6870:96a1:b0:261:26be:2606 with SMTP id 586e51a60fabf-273e64e6c5emr19532297fac.25.1724854839096;
        Wed, 28 Aug 2024 07:20:39 -0700 (PDT)
Message-ID: <a30f26be-b460-449b-a80c-f5d3a85f0550@citrix.com>
Date: Wed, 28 Aug 2024 15:20:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/ocaml: Factor out compatiblity handling
To: Edwin Torok <edwin.torok@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Rob Hoes <Rob.Hoes@citrix.com>,
 Andrii Sultanov <andrii.sultanov@cloud.com>
References: <20240828133033.2378322-1-andrew.cooper3@citrix.com>
 <CAEfZLvmJAw5wiKu5BZokgpbHdAv6Msro_ANgJ06NmATWuHiMNA@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAEfZLvmJAw5wiKu5BZokgpbHdAv6Msro_ANgJ06NmATWuHiMNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2024 3:15 pm, Edwin Torok wrote:
> On Wed, Aug 28, 2024 at 2:30 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> ... rather than having each library implement its own subset.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Christian Lindig <christian.lindig@citrix.com>
>> CC: David Scott <dave@recoil.org>
>> CC: Edwin Török <edwin.torok@cloud.com>
>> CC: Rob Hoes <Rob.Hoes@citrix.com>
>> CC: Andrii Sultanov <andrii.sultanov@cloud.com>
>>
>> Broken out of a larger series, to help Andrii with his dynlib work.
>> ---
>>  tools/ocaml/libs/xc/Makefile        |  2 +-
>>  tools/ocaml/libs/xc/xenctrl_stubs.c | 13 +++----------
>>  tools/ocaml/libs/xen-caml-compat.h  | 23 +++++++++++++++++++++++
>>  3 files changed, 27 insertions(+), 11 deletions(-)
>>  create mode 100644 tools/ocaml/libs/xen-caml-compat.h
>>
>> diff --git a/tools/ocaml/libs/xc/Makefile b/tools/ocaml/libs/xc/Makefile
>> index 1d9fecb06ef2..cdf4d01dac52 100644
>> --- a/tools/ocaml/libs/xc/Makefile
>> +++ b/tools/ocaml/libs/xc/Makefile
>> @@ -2,7 +2,7 @@ OCAML_TOPLEVEL=$(CURDIR)/../..
>>  XEN_ROOT=$(OCAML_TOPLEVEL)/../..
>>  include $(OCAML_TOPLEVEL)/common.make
>>
>> -CFLAGS += -I../mmap $(CFLAGS_libxenctrl) $(CFLAGS_libxenguest)
>> +CFLAGS += -I../ -I../mmap $(CFLAGS_libxenctrl) $(CFLAGS_libxenguest)
>>  CFLAGS += $(APPEND_CFLAGS)
>>  OCAMLINCLUDE += -I ../mmap -I ../eventchn
>>
>> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
>> index a52908012960..c78191f95abc 100644
>> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
>> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
>> @@ -25,6 +25,8 @@
>>  #include <caml/fail.h>
>>  #include <caml/callback.h>
>>
>> +#include "xen-caml-compat.h"
>> +
>>  #include <sys/mman.h>
>>  #include <stdint.h>
>>  #include <string.h>
>> @@ -37,14 +39,6 @@
>>
>>  #include "mmap_stubs.h"
>>
>> -#ifndef Val_none
>> -#define Val_none (Val_int(0))
>> -#endif
>> -
>> -#ifndef Tag_some
>> -#define Tag_some 0
>> -#endif
>> -
>>  static inline xc_interface *xch_of_val(value v)
>>  {
>>         xc_interface *xch = *(xc_interface **)Data_custom_val(v);
>> @@ -744,8 +738,7 @@ CAMLprim value stub_xc_evtchn_status(value xch_val, value domid, value port)
>>         Store_field(result_status, 0, Val_int(status.vcpu));
>>         Store_field(result_status, 1, stat);
>>
>> -       result = caml_alloc_small(1, Tag_some);
>> -       Store_field(result, 0, result_status);
>> +       result = caml_alloc_some(result_status);
>>
>>         CAMLreturn(result);
>>  }
>> diff --git a/tools/ocaml/libs/xen-caml-compat.h b/tools/ocaml/libs/xen-caml-compat.h
>> new file mode 100644
>> index 000000000000..b4a0ca4ce90c
>> --- /dev/null
>> +++ b/tools/ocaml/libs/xen-caml-compat.h
>> @@ -0,0 +1,23 @@
>> +/* SPDX-License-Identifier: LGPL-2.1-only WITH OCaml-LGPL-linking-exception */
>> +#ifndef XEN_CAML_COMPAT_H
>> +#define XEN_CAML_COMPAT_H
>> +
>> +#ifndef Val_none /* Option handling.  Compat for Ocaml < 4.12 */
>> +
>> +#define Val_none Val_int(0)
>> +#define Tag_some 0
>> +#define Some_val(v) Field(v, 0)
>> +
>> +static inline value caml_alloc_some(value v)
>> +{
>> +    CAMLparam1(v);
>> +
>> +    value some = caml_alloc_small(1, Tag_some);
>> +    Store_field(some, 0, v);
> The compiler uses Field() rather than Store_field() here.
> I think using Store_field here can potentially read uninitialized
> data, because 'caml_alloc_small' gives you uninitialized memory
> that you must immediately fill with valid values.
> Looking at the implementation Store_field calls caml_modify which will
> read the old value to figure out whether it was in minor or major
> heap,
> and doing that on uninitialized data is unpredictable.
>
> We should follow what the manual says and use Field() when
> caml_alloc_small() is used, and use Store_field() when caml_alloc() is
> used,
> and not attempt to mix them:
> See https://ocaml.org/manual/5.2/intfc.html#ss:c-low-level-gc-harmony

Lovely, this got changed in Ocaml with no information or justification...

https://github.com/ocaml/ocaml/pull/9819

I'll resync this locally, but I shaltn't repost.

~Andrew

