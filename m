Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C21AC9A2B58
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:48:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821234.1234973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UbG-0000Gd-NG; Thu, 17 Oct 2024 17:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821234.1234973; Thu, 17 Oct 2024 17:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UbG-0000EH-Ki; Thu, 17 Oct 2024 17:47:50 +0000
Received: by outflank-mailman (input) for mailman id 821234;
 Thu, 17 Oct 2024 17:47:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/Py=RN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t1UbF-0000EB-C7
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:47:49 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb3d2d16-8caf-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:47:47 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a9a0c40849cso180837366b.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 10:47:47 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a29719522sm319492566b.28.2024.10.17.10.47.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 10:47:45 -0700 (PDT)
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
X-Inumbo-ID: eb3d2d16-8caf-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729187266; x=1729792066; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R9LMWjL7Ko3oKrrr/ibTnCEa4SwijRoFqkZNkg83gD8=;
        b=YTECeo5w0zpNsFtWh1MRqzpUZuU6SqCDkDBn3lqb86sOyGDoW4FF1+CZYT36oP+nYA
         UKTyvLFj/miR4++jtLYQLnrPYGBWRVAk/Ywaj/TpRceVMGrruDGkEvqMSF+ssN2qEUVM
         DChYf+Dmz5/3qpv5Krm+zVObJ9l0EmOzYui6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729187266; x=1729792066;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9LMWjL7Ko3oKrrr/ibTnCEa4SwijRoFqkZNkg83gD8=;
        b=DTLxNIdGbtEwWCBKgfD1YVxBEPkOZgbLk8jXghdeKM6fZm+Bk4VHDqToykTXdF7K2b
         I2rRn5fSmJg2iJ41zNO7iT4IDpENmWQBiEFB8K7P+BJJpLeG41S9fV6GscgiJlnsSzj3
         rWQ9omwFdpXb5jn4zVOT2WvKXPh3clfYZ93hpizIFFWcuRwzEwNAwTC5UlLTfgf90lmZ
         4xrn6J+Ju47dEZqVI1ymOjkcQPcrXWj+wrOTQJKmNXqAxSGL8bJbCN0RdOXWFvPJf9Jf
         4qKiA0B8kF20HaVGsj8gMX1cOGLI/PmySxzEn8dKtM3yfAONz99jwNH6Fn+B8Az+cvxh
         daHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeqANDALWOaVayGv297YxKIk32vt2xEGaoIX+ysqDJep41rAE9UibER/OGVyA1+g+tmoCIzipQhMw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVkPnas1W9z5DD38BVNanD43WVC/gRo5CT7LW5CumqBsmXyne/
	I6P8YcDibg49jpl52X/ZB1HfUdSJ+PiIDGieAAsdZJpKdhILA/AYulUOD+r9HBIYNgykPNdCDkh
	QY9Q=
X-Google-Smtp-Source: AGHT+IF9q7umOZPFy+wzMabUBEuEN5j7ew7pp/3MOn1h7B7NPctrv5bmlbNuo5aqbMQkBHHYg1sGbQ==
X-Received: by 2002:a17:907:930d:b0:a9a:dac:2ab9 with SMTP id a640c23a62f3a-a9a0dac2ec0mr1574105766b.42.1729187266080;
        Thu, 17 Oct 2024 10:47:46 -0700 (PDT)
Message-ID: <a2fb569d-4314-4d0e-b288-8891d8848d24@citrix.com>
Date: Thu, 17 Oct 2024 18:47:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 2/3] ocaml/libs: Fill build failure due to unused
 variable in ocaml macro
To: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Andrii Sultanov <andrii.sultanov@cloud.com>
References: <cover.1729170005.git.javi.merino@cloud.com>
 <d6b98ca75017bf4aa72a69468321705263e66f30.1729170005.git.javi.merino@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d6b98ca75017bf4aa72a69468321705263e66f30.1729170005.git.javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/10/2024 5:20 pm, Javi Merino wrote:
> On Fedora 40, the build fails with:
>
>     gcc -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -Werror -O2 -fomit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -MMD -MP -MF .domain_getinfo_stubs_v1.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE   -fPIC -I/usr/lib64/ocaml -I /build/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/../../../libs -I /build/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/../../../libs/xsd_glue -I/build/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/../../../../../tools/include -D__XEN_TOOLS__ -I/build/tools/ocaml/libs\/xsd_glue/domain_getinfo_plugin_v1/../../../../../tools/include  -c -o domain_getinfo_stubs_v1.o domain_getinfo_stubs_v1.c
>     In file included from domain_getinfo_stubs_v1.c:10:
>     domain_getinfo_stubs_v1.c: In function 'xsd_glue_failwith':
>     /usr/lib64/ocaml/caml/memory.h:275:29: error: unused variable 'caml__frame' [-Werror=unused-variable]
>       275 |   struct caml__roots_block *caml__frame = *caml_local_roots_ptr
>           |                             ^~~~~~~~~~~
>     domain_getinfo_stubs_v1.c:48:9: note: in expansion of macro 'CAMLparam0'
>       48 |         CAMLparam0();
>          |         ^~~~~~~~~~
>     cc1: all warnings being treated as errors
>
> The CAMLparam0 macro is defined in /usr/lib64/ocaml/caml/memory.h:255 as:
>
>     #define CAMLparam0()                                                    \
>       struct caml__roots_block** caml_local_roots_ptr =                     \
>         (DO_CHECK_CAML_STATE ? Caml_check_caml_state() : (void)0,           \
>          &CAML_LOCAL_ROOTS);                                                \
>       struct caml__roots_block *caml__frame = *caml_local_roots_ptr
>
> We can't modify the macro.  Mark the xsd_glue_failwith() function with
> ignore "-Wunused-variable" to prevent gcc from failing the build due
> to the unused variable.
>
> Fixes: a6576011a4d2 ("ocaml/libs: Implement a dynamically-loaded plugin for Xenctrl.domain_getinfo")
> Signed-off-by: Javi Merino <javi.merino@cloud.com>

That's horrible...

I note the Ocaml manual even says:

"Some C compilers give bogus warnings about unused variables
caml__dummy_xxx at each use of CAMLparam and CAMLlocal. You should
ignore them."  which a brave claim to make...


The problem with pragma gcc is that we support Clang too.

Having had a play, this works too

@@ -45,7 +45,9 @@ static struct custom_operations xsd_glue_xenctrl_ops = {
 static void Noreturn xsd_glue_failwith(
        xc_interface *xch, const char *func, unsigned int line)
 {
+#define caml__frame __attribute__((unused)) caml__frame
        CAMLparam0();
+#undef caml__frame
        CAMLlocal1(msg);
        const xc_error *error = xch ? xc_get_last_error(xch) : NULL;
        char *str = NULL;

and is rather more selective.


However, looking through other bits of memory.h, there's this gem:

#define CAMLnoreturn ((void) caml__frame)

which has existed since db3745919 "suppression des warnings "unused
variable" de gcc" in 2004.

So, I think this is a better fix:

@@ -69,6 +69,7 @@ static void Noreturn xsd_glue_failwith(
        free(str);
 
        caml_raise_with_arg(*caml_named_value("xsg.error_v1"), msg);
+       CAMLnoreturn;
 }
 #define xsd_glue_failwith(xch) xsd_glue_failwith(xch, __func__, __LINE__)
 
and F40 seem happy with the result.

~Andrew

