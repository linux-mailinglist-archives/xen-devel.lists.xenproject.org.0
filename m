Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3CA9A2BB3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 20:09:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821246.1234995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UvE-0002pH-DF; Thu, 17 Oct 2024 18:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821246.1234995; Thu, 17 Oct 2024 18:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UvE-0002n9-Ac; Thu, 17 Oct 2024 18:08:28 +0000
Received: by outflank-mailman (input) for mailman id 821246;
 Thu, 17 Oct 2024 18:08:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/Py=RN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t1UvD-0002lh-2o
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 18:08:27 +0000
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [2a00:1450:4864:20::542])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd49b8b9-8cb2-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 20:08:25 +0200 (CEST)
Received: by mail-ed1-x542.google.com with SMTP id
 4fb4d7f45d1cf-5c984352742so1409800a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 11:08:24 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d777fb3sm2994634a12.59.2024.10.17.11.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 11:08:23 -0700 (PDT)
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
X-Inumbo-ID: cd49b8b9-8cb2-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729188504; x=1729793304; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rZfFk2ZgNUx0mu+VU3eD6F1IqPGzjpLkZfAYsb+kTXU=;
        b=FO4QJYI0KrZO98wkOgKlPptoG52aomFEORauMv7Co1xi2ROfiwEHe68bHjRCrgFx0c
         /0O1lV7lMaqet4RDxMzSLQj86nnb9WYszOGjTZtSaEZdfD1DRQ1HZHBMW/qDyU4eWbzk
         amcOQms60ERS/tWqt2PZYdnM4mEi4taFUb4EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729188504; x=1729793304;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZfFk2ZgNUx0mu+VU3eD6F1IqPGzjpLkZfAYsb+kTXU=;
        b=cOb3gZ45baJ+nRK9JrDbzQ4aXRh9/7JXzdKJax+LbV+A+4muy+mD6WEesmxhTQKrTE
         Lq4GqFp12r9fAaRvU3to6lZvVsJ4jTvCL4HtcBMhK1pi1HleEqxMMKCdW4HncBdtOhNk
         UpDKSw8WcyrvFBK5w/6fJcFbC3HYb+zJvVBdoLrthKORod1glr13How1/B0Sh1+ruOal
         YuEkU/JXy+OKEsEteCstW1v4aMMM/Zivm3hR64ucjpa5d/ldfcuFWgyq81e5MyWZr2OX
         LBKY4tZMzubqnIiw/G1DgjUSCn+cDQWbjOSpbmLtE19aT+vGBK/F0udPld5pnoKdiOVu
         qquw==
X-Forwarded-Encrypted: i=1; AJvYcCXyW6Q8dSyHJV7G2NziQRngo0blJL8EPfSt5wYACAU3WK100KX75rUKSrZfQM9Va7Kv7HrLVdTy2S8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxFXqPoTygWuvgpDVII4jLXBlHUyhOg/dOR6nQUHURhtdLycEc
	N3olKpm73aVUb3EuMqhCYsVlT3TCi2Er3rMQ1qzJvJ2mwoP3pT6lAQJ2tGlojxo=
X-Google-Smtp-Source: AGHT+IHgI6ffCwdpp/Pxn9JH7uKr3TJ/j1CLF4L5MixL7nw1qbWrqXJAwCK5plgxCnGM0pbHhsAnyQ==
X-Received: by 2002:a05:6402:280a:b0:5c9:62c3:e7fd with SMTP id 4fb4d7f45d1cf-5c99510f6c3mr7413754a12.16.1729188504272;
        Thu, 17 Oct 2024 11:08:24 -0700 (PDT)
Message-ID: <a3b46327-9bd7-419c-8d31-bff94830a6c6@citrix.com>
Date: Thu, 17 Oct 2024 19:08:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 2/3] ocaml/libs: Fill build failure due to unused
 variable in ocaml macro
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Andrii Sultanov <andrii.sultanov@cloud.com>
References: <cover.1729170005.git.javi.merino@cloud.com>
 <d6b98ca75017bf4aa72a69468321705263e66f30.1729170005.git.javi.merino@cloud.com>
 <a2fb569d-4314-4d0e-b288-8891d8848d24@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a2fb569d-4314-4d0e-b288-8891d8848d24@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/10/2024 6:47 pm, Andrew Cooper wrote:
> On 17/10/2024 5:20 pm, Javi Merino wrote:
>> On Fedora 40, the build fails with:
>>
>>     gcc -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -Werror -O2 -fomit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -MMD -MP -MF .domain_getinfo_stubs_v1.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE   -fPIC -I/usr/lib64/ocaml -I /build/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/../../../libs -I /build/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/../../../libs/xsd_glue -I/build/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/../../../../../tools/include -D__XEN_TOOLS__ -I/build/tools/ocaml/libs\/xsd_glue/domain_getinfo_plugin_v1/../../../../../tools/include  -c -o domain_getinfo_stubs_v1.o domain_getinfo_stubs_v1.c
>>     In file included from domain_getinfo_stubs_v1.c:10:
>>     domain_getinfo_stubs_v1.c: In function 'xsd_glue_failwith':
>>     /usr/lib64/ocaml/caml/memory.h:275:29: error: unused variable 'caml__frame' [-Werror=unused-variable]
>>       275 |   struct caml__roots_block *caml__frame = *caml_local_roots_ptr
>>           |                             ^~~~~~~~~~~
>>     domain_getinfo_stubs_v1.c:48:9: note: in expansion of macro 'CAMLparam0'
>>       48 |         CAMLparam0();
>>          |         ^~~~~~~~~~
>>     cc1: all warnings being treated as errors
>>
>> The CAMLparam0 macro is defined in /usr/lib64/ocaml/caml/memory.h:255 as:
>>
>>     #define CAMLparam0()                                                    \
>>       struct caml__roots_block** caml_local_roots_ptr =                     \
>>         (DO_CHECK_CAML_STATE ? Caml_check_caml_state() : (void)0,           \
>>          &CAML_LOCAL_ROOTS);                                                \
>>       struct caml__roots_block *caml__frame = *caml_local_roots_ptr
>>
>> We can't modify the macro.  Mark the xsd_glue_failwith() function with
>> ignore "-Wunused-variable" to prevent gcc from failing the build due
>> to the unused variable.
>>
>> Fixes: a6576011a4d2 ("ocaml/libs: Implement a dynamically-loaded plugin for Xenctrl.domain_getinfo")
>> Signed-off-by: Javi Merino <javi.merino@cloud.com>
> That's horrible...
>
> I note the Ocaml manual even says:
>
> "Some C compilers give bogus warnings about unused variables
> caml__dummy_xxx at each use of CAMLparam and CAMLlocal. You should
> ignore them."  which a brave claim to make...
>
>
> The problem with pragma gcc is that we support Clang too.
>
> Having had a play, this works too
>
> @@ -45,7 +45,9 @@ static struct custom_operations xsd_glue_xenctrl_ops = {
>  static void Noreturn xsd_glue_failwith(
>         xc_interface *xch, const char *func, unsigned int line)
>  {
> +#define caml__frame __attribute__((unused)) caml__frame
>         CAMLparam0();
> +#undef caml__frame
>         CAMLlocal1(msg);
>         const xc_error *error = xch ? xc_get_last_error(xch) : NULL;
>         char *str = NULL;
>
> and is rather more selective.
>
>
> However, looking through other bits of memory.h, there's this gem:
>
> #define CAMLnoreturn ((void) caml__frame)
>
> which has existed since db3745919 "suppression des warnings "unused
> variable" de gcc" in 2004.
>
> So, I think this is a better fix:
>
> @@ -69,6 +69,7 @@ static void Noreturn xsd_glue_failwith(
>         free(str);
>  
>         caml_raise_with_arg(*caml_named_value("xsg.error_v1"), msg);
> +       CAMLnoreturn;
>  }
>  #define xsd_glue_failwith(xch) xsd_glue_failwith(xch, __func__, __LINE__)
>  
> and F40 seem happy with the result.

And https://github.com/ocaml/ocaml/pull/13561 to update Ocaml's
documentation on the matter.

~Andrew

