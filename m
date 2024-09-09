Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80824971A7A
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 15:12:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794454.1203398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sneB0-0001A4-US; Mon, 09 Sep 2024 13:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794454.1203398; Mon, 09 Sep 2024 13:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sneB0-00017g-RU; Mon, 09 Sep 2024 13:11:30 +0000
Received: by outflank-mailman (input) for mailman id 794454;
 Mon, 09 Sep 2024 13:11:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tbp=QH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sneAz-00017a-Bn
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 13:11:29 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05656f36-6ead-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 15:11:27 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8a706236bfso228593166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 06:11:27 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd51f84sm2952070a12.41.2024.09.09.06.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 06:11:24 -0700 (PDT)
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
X-Inumbo-ID: 05656f36-6ead-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725887487; x=1726492287; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iclKmBleBAwpojxYPwjhLRVae6ODWHmR33e4ylYNVQk=;
        b=H69oai3riqXgcrF/cTAkbwARym7j9sZMd8q6glSSelIlWWEiYIR1POs4Lo00FsYFXX
         GWmJfYsPdcMOK7WOmUL4qhn/+I1CoHpS+onulx28q/QZzAlbdefhqKN4vIF6jx1jRWx/
         SGgLDI+9ifytyXe+vUrogbCQxUQWkkCcuar9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725887487; x=1726492287;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iclKmBleBAwpojxYPwjhLRVae6ODWHmR33e4ylYNVQk=;
        b=gFAWYfDt2m73EDL1SyGIs8MIAeaqEYfogrdZnd1waAhmytlr/OC1KK4Iz/pydsUcr4
         mL1NpqxaaLOgFWx2eLG6Yq3iW+rVbX163Mh6hisalYLoneihMl4xN1T/WQls19twQNgn
         aIcuRP8+ZitU4RXfryilLX9RiGXi8O2IwHOlGmMwKBL5Lj7lSyEjYQpGyoa9mYaQBjYB
         /zGvPNtzcdkCnM6DRXjUml7fdtmXMLz38/cTAuwMZjRbKUjCDye2LiAJ80J5urOHzsdG
         V7T2jHYpghcN/TQoKQPA8pkm6Z3RvehUp7KCvjdW0X0wHDktR2GbeMPSr6hYO4rKNFd2
         ZFMA==
X-Gm-Message-State: AOJu0YyympZxVuL8xpNKj019kDMpk8RClyZBuNu32yOUneb5Fe4f4wDP
	BK6oHO6uXw9VbFTEqV8l8j2Z40QO3Opjwz0AsMOMYVkRlhMLhz8OKD2eUtf68snC7uegukxS2/q
	B
X-Google-Smtp-Source: AGHT+IG6wqgajPsJRuFpevih7svM+Bh9FXE/E0hP1nZqzhh5oBDEv6XIlG0WrHL1NlX0VCiFSVqbkg==
X-Received: by 2002:a05:6402:13d3:b0:5c2:5f09:bb9c with SMTP id 4fb4d7f45d1cf-5c3dc7c054emr11220754a12.30.1725887486339;
        Mon, 09 Sep 2024 06:11:26 -0700 (PDT)
Message-ID: <bd467985-df05-4672-a4bd-bc42d663c0b8@citrix.com>
Date: Mon, 9 Sep 2024 14:11:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/ocaml: Rationalise .gitignore
To: Edwin Torok <edwin.torok@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Rob Hoes <Rob.Hoes@citrix.com>,
 Andrii Sultanov <andrii.sultanov@cloud.com>
References: <20240906145524.186148-1-andrew.cooper3@citrix.com>
 <CAEfZLv=9RtB-YLCbhi9ZWVxS6_ErRg6o-CXefRdVnXwdSpX9kw@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAEfZLv=9RtB-YLCbhi9ZWVxS6_ErRg6o-CXefRdVnXwdSpX9kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/09/2024 1:31 pm, Edwin Torok wrote:
> On Fri, Sep 6, 2024 at 3:55 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> The root .gitignore is quite stale from recent (and less recent) removals, but
>> also fails to work for the forthcoming dynamic plugin work.
>>
>> Strip all Ocaml content out of the root .gitignore, and provide a more local
>> .gitignore's with up-to-date patterns.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Christian Lindig <christian.lindig@citrix.com>
>> CC: David Scott <dave@recoil.org>
>> CC: Edwin Török <edwin.torok@cloud.com>
>> CC: Rob Hoes <Rob.Hoes@citrix.com>
>> CC: Andrii Sultanov <andrii.sultanov@cloud.com>
>>
>> I'm on the fence as to whether put paths.ml in the general ignore, but that
>> would be making an assumption about future code
>> ---
>>  .gitignore                       | 28 ----------------------------
>>  tools/ocaml/.gitignore           |  5 +++++
>>  tools/ocaml/libs/xc/.gitignore   |  1 +
>>  tools/ocaml/libs/xs/.gitignore   |  1 +
>>  tools/ocaml/xenstored/.gitignore |  3 +++
>>  5 files changed, 10 insertions(+), 28 deletions(-)
>>  create mode 100644 tools/ocaml/.gitignore
>>  create mode 100644 tools/ocaml/libs/xc/.gitignore
>>  create mode 100644 tools/ocaml/libs/xs/.gitignore
>>  create mode 100644 tools/ocaml/xenstored/.gitignore
>>
>> diff --git a/.gitignore b/.gitignore
>> index d8b57e32f888..d88be80b28d6 100644
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -92,7 +92,6 @@ stubdom/mini-os-*
>>  stubdom/mk-headers-*
>>  stubdom/newlib-1.*
>>  stubdom/newlib-x86*
>> -stubdom/ocaml-*
>>  stubdom/pciutils-*
>>  stubdom/pkg-config/*
>>  stubdom/polarssl-*
>> @@ -339,33 +338,6 @@ tools/misc/xen-hvmcrash
>>  tools/misc/xen-lowmemd
>>  tools/vchan/vchan-node[12]
>>  tools/vchan/vchan-socket-proxy
>> -tools/ocaml/*/.ocamldep.make
>> -tools/ocaml/*/*.cm[ixao]
>> -tools/ocaml/*/*.cmxa
>> -tools/ocaml/*/*.annot
>> -tools/ocaml/*/*/.ocamldep.make
>> -tools/ocaml/*/*/*.cm[ixao]
>> -tools/ocaml/*/*/*.cmxa
>> -tools/ocaml/*/*/*.annot
>> -tools/ocaml/*/*/META
>> -tools/ocaml/libs/xl/_libxl_types.inc
>> -tools/ocaml/libs/xl/_libxl_types.ml.in
>> -tools/ocaml/libs/xl/_libxl_types.mli.in
>> -tools/ocaml/libs/xl/xenlight.ml
>> -tools/ocaml/libs/xl/xenlight.mli
>> -tools/ocaml/libs/xentoollog/_xtl_levels.*
>> -tools/ocaml/libs/xentoollog/xentoollog.ml
>> -tools/ocaml/libs/xentoollog/xentoollog.mli
>> -tools/ocaml/libs/xs/paths.ml
>> -tools/ocaml/libs/xc/xenctrl_abi_check.h
>> -tools/ocaml/xenstored/oxenstored
>> -tools/ocaml/xenstored/oxenstored.conf
>> -tools/ocaml/xenstored/paths.ml
>> -tools/ocaml/test/xtl
>> -tools/ocaml/test/send_debug_keys
>> -tools/ocaml/test/list_domains
>> -tools/ocaml/test/dmesg
>> -tools/ocaml/test/raise_exception
>>  tools/debugger/kdd/kdd
>>  tools/firmware/etherboot/ipxe.tar.gz
>>  tools/firmware/etherboot/ipxe/
>> diff --git a/tools/ocaml/.gitignore b/tools/ocaml/.gitignore
>> new file mode 100644
>> index 000000000000..3687c2af4f26
>> --- /dev/null
>> +++ b/tools/ocaml/.gitignore
>> @@ -0,0 +1,5 @@
>> +/**/META
>> +/**/.ocamldep.make
>> +/**/*.annot
>> +/**/*.cm[ixao]
> There is .cmt too, so:
> *.cm[ioxat]
>
>> +/**/*.cmx[as]
> There is also this:
> *.cmti
>
> .cmt/.cmti files are the newer alternatives to .annot used by tools
> like Merlin and the OCaml LSP server to show type information.

I've included these.

>
> Looking through https://github.com/ocaml/ocaml/blob/trunk/.gitignore
> we probably have the other wildcards covered in the generic .gitignore
> (like *.o, *.a and *.so),

These are inherited from the top level .gitignore, as Xen is a
predominantly C-oriented project.

> and also it doesn't use the leading **/ either, just '*.cmti' for
> example, not sure which is better.

They're subtly different; it matters for some lines (META and
.ocamldep.make) we've got but not others, so I went for consistency.

~Andrew

