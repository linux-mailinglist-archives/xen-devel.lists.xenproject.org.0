Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AA99A391D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 10:51:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821686.1235606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1ih9-0007Uc-98; Fri, 18 Oct 2024 08:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821686.1235606; Fri, 18 Oct 2024 08:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1ih9-0007Sv-5L; Fri, 18 Oct 2024 08:50:51 +0000
Received: by outflank-mailman (input) for mailman id 821686;
 Fri, 18 Oct 2024 08:50:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWMG=RO=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t1ih7-0007Sp-T0
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 08:50:50 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11357450-8d2e-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 10:50:46 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2fb57f97d75so18707121fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 01:50:46 -0700 (PDT)
Received: from jmerino-thinkstation ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ca0b0807f8sm455583a12.33.2024.10.18.01.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 01:50:45 -0700 (PDT)
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
X-Inumbo-ID: 11357450-8d2e-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729241446; x=1729846246; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fuL/P2AT5Kv+sre0CQ3J2lpLtaynLRHpaP6kVoT7GaM=;
        b=ACj6w5duaRupLAllCbEt7sznhYauzCU0b69G9+FL1jYHpNMNW8s5Oma8tva3fIhL0M
         8mkk+UMNpNRA78/6uKyzgzcXulXrmdav75xGaTTLPVtNkH6fN0HSfLOnUcRqvT1QiEJJ
         q4I7AqNyICu7yo0EyFmzDs/i5bqV2emsFAiD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729241446; x=1729846246;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fuL/P2AT5Kv+sre0CQ3J2lpLtaynLRHpaP6kVoT7GaM=;
        b=CqLxK7HeUM5Ca/6Ob7dUpkxnEVmAd/ok74rbEZKUun2CgprNpoIAA10ugvuB4L0gPP
         sFkFa1KdVVFr7Jolozkrq6siysAYBYNs4vr5lvcjXS7sBOvy/n85gJ4BrepjpZMwssOq
         y/CgeyTtUZPZ69fR4uUu31zSaNOTQRJa/OT+dl6UVe+uQ+W5etzldt3AODkmaRvj83G3
         bShfg7xCyKevcZefXjyd7Mz3LVZ1IHdqOvGsM3AtRgg+rq5waC6WehGB/JOQncZ2fz5/
         XjkZi23JsLdjisILGT6mi1wJW9/FPSSFoGmaMuwyHKY8iEG9CaYfECGzO5BMNM7v2/ro
         VLag==
X-Gm-Message-State: AOJu0Yxsxp59igiV9I3Vz7Dj17+mrZqCCV+I2W0qP5JnYhEVF8t9vW95
	igT6u192xeCU18Ul1sM4tP15CanFTkBzkOJfBXulT50csz9PqzQbdhvDOaOWT/U=
X-Google-Smtp-Source: AGHT+IHzVbkgI4Sj6Uv/p9TfuPiMxSXSbwU3GpD6OKxqGEgFnUIFyKehwjQ6zKnGtvNxS8eCETwAiQ==
X-Received: by 2002:a2e:e01:0:b0:2fb:45cf:5eef with SMTP id 38308e7fff4ca-2fb83260fe6mr5852401fa.30.1729241446141;
        Fri, 18 Oct 2024 01:50:46 -0700 (PDT)
Date: Fri, 18 Oct 2024 09:50:44 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, Andrii Sultanov <andrii.sultanov@cloud.com>
Subject: Re: [XEN PATCH v1 2/3] ocaml/libs: Fill build failure due to unused
 variable in ocaml macro
Message-ID: <nb2iahlpzuwvmoqtlu552uteujm27ywe3gzxnfzad26pguwreh@s5kjlxonlgdc>
References: <cover.1729170005.git.javi.merino@cloud.com>
 <d6b98ca75017bf4aa72a69468321705263e66f30.1729170005.git.javi.merino@cloud.com>
 <a2fb569d-4314-4d0e-b288-8891d8848d24@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2fb569d-4314-4d0e-b288-8891d8848d24@citrix.com>

On Thu, Oct 17, 2024 at 06:47:44PM +0100, Andrew Cooper wrote:
> On 17/10/2024 5:20 pm, Javi Merino wrote:
> > On Fedora 40, the build fails with:
> >
> >     gcc -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -Werror -O2 -fomit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -MMD -MP -MF .domain_getinfo_stubs_v1.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE   -fPIC -I/usr/lib64/ocaml -I /build/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/../../../libs -I /build/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/../../../libs/xsd_glue -I/build/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/../../../../../tools/include -D__XEN_TOOLS__ -I/build/tools/ocaml/libs\/xsd_glue/domain_getinfo_plugin_v1/../../../../../tools/include  -c -o domain_getinfo_stubs_v1.o domain_getinfo_stubs_v1.c
> >     In file included from domain_getinfo_stubs_v1.c:10:
> >     domain_getinfo_stubs_v1.c: In function 'xsd_glue_failwith':
> >     /usr/lib64/ocaml/caml/memory.h:275:29: error: unused variable 'caml__frame' [-Werror=unused-variable]
> >       275 |   struct caml__roots_block *caml__frame = *caml_local_roots_ptr
> >           |                             ^~~~~~~~~~~
> >     domain_getinfo_stubs_v1.c:48:9: note: in expansion of macro 'CAMLparam0'
> >       48 |         CAMLparam0();
> >          |         ^~~~~~~~~~
> >     cc1: all warnings being treated as errors
> >
> > The CAMLparam0 macro is defined in /usr/lib64/ocaml/caml/memory.h:255 as:
> >
> >     #define CAMLparam0()                                                    \
> >       struct caml__roots_block** caml_local_roots_ptr =                     \
> >         (DO_CHECK_CAML_STATE ? Caml_check_caml_state() : (void)0,           \
> >          &CAML_LOCAL_ROOTS);                                                \
> >       struct caml__roots_block *caml__frame = *caml_local_roots_ptr
> >
> > We can't modify the macro.  Mark the xsd_glue_failwith() function with
> > ignore "-Wunused-variable" to prevent gcc from failing the build due
> > to the unused variable.
> >
> > Fixes: a6576011a4d2 ("ocaml/libs: Implement a dynamically-loaded plugin for Xenctrl.domain_getinfo")
> > Signed-off-by: Javi Merino <javi.merino@cloud.com>
> 
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

Right!  I actually tried put a (void)caml__frame to silence the
warning, but I didn't think of looking for a macro that would do
exactly that.

Do I have to resend the series with your patch, or can you commit it
directly?

Cheers,
Javi

