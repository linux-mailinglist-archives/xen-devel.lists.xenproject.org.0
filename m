Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A061C9501AD
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 11:53:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776099.1186255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdoDc-0003Ji-Jq; Tue, 13 Aug 2024 09:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776099.1186255; Tue, 13 Aug 2024 09:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdoDc-0003Hl-Gy; Tue, 13 Aug 2024 09:53:32 +0000
Received: by outflank-mailman (input) for mailman id 776099;
 Tue, 13 Aug 2024 09:53:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tqRM=PM=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sdoDb-0003Hf-Ld
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 09:53:31 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e54339bc-5959-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 11:53:30 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a7d26c2297eso604151166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 02:53:30 -0700 (PDT)
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
X-Inumbo-ID: e54339bc-5959-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723542810; x=1724147610; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAfJZaiUMefJ2qlSYDOVvyNgZLULawJJLqsegllNfuw=;
        b=eMcbV/0yo5aQ35Y19GFiMc8eLyDf4bjbykIhaI/8VMT3S7hJODPNAsIbkqPj8TmTMh
         RPb21fVY14aUIDs7v/1sv5qunVUtx110oaioUtSLHHnAkEZzOFZt5Dlg71C+O7g0HWpn
         PkH2W+0Ai78rWQVT2UHForrMjO3/uwyFazri8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723542810; x=1724147610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAfJZaiUMefJ2qlSYDOVvyNgZLULawJJLqsegllNfuw=;
        b=o/WUiIBKXA8AFlJ2A/Mje6dtgB87shueLECvMXWkeuPFZnCp31J1XzjXF1YAfxpCAQ
         GnXemlgs9mK9OJXxLt2EQFgf4twfxWvNX1yxRD8VzS801dd3XV1r+NcHlu4/Nh9rWvtw
         R5wKqs8bY/ckndkb3xeoch1iF23GhW0YgecGdZUrjTeCaxdt1Dv7vSaljev8mPtR9M1j
         yLAC+to4RbIqQtjfRaNQBBLiP8gE+9FLLGVk6RS+Hy1Wmitt7gh6Aa71yMmuM7CX5LiQ
         pI5a6/4CuQlDePoP95w84Tq4tXx512LGllEsbc/3oU/UFiyQx1YIKhUInLGJ2PcIH+Zo
         3W6g==
X-Gm-Message-State: AOJu0Yy/sUTCGfZI9OKldHCqE9xaHgYtubnOXHrL1Ru9ogXo1DNE6Jfx
	/g3P/IS3ehUI5XctCiu0sezrgipBcVv4Vqt5HnujZ4651o1ufFXiZ6HOTJed9viG3lL+H4Ikb4/
	4cILOS/yzY97HCgEG6WoKEjBH7KAm44SyXqho1w==
X-Google-Smtp-Source: AGHT+IG6PH6g+jl+oZl842zhhqt0Vt8HkLSKibaZYD/YQlh4APjANkBl1uufn8uasHYkUdEY1hJokrbVS+t95v6IZbU=
X-Received: by 2002:a17:907:e68d:b0:a6f:dc17:500a with SMTP id
 a640c23a62f3a-a80ed1cef94mr212197266b.23.1723542809928; Tue, 13 Aug 2024
 02:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240809130418.10431-1-alejandro.vallejo@cloud.com>
In-Reply-To: <20240809130418.10431-1-alejandro.vallejo@cloud.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 13 Aug 2024 10:53:15 +0100
Message-ID: <CACHz=Zg=CDv=rmsmYCSvQ7GbaXyXCt0vXNDoBChiOXYucE7w4w@mail.gmail.com>
Subject: Re: [RFC PATCH] xen: Remove -Wdeclaration-after-statement
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 2:04=E2=80=AFPM Alejandro Vallejo
<alejandro.vallejo@cloud.com> wrote:
>
> This warning only makes sense when developing using a compiler with C99
> support on a codebase meant to be built with C89 compilers too, and
> that's no longer the case (nor should it be, as it's been 25 years since
> C99 came out already).
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> Yes, I'm opening this can of worms. I'd like to hear others people's
> thoughts on this and whether this is something MISRA has views on. If
> there's an ulterior non-obvious reason besides stylistic preference I
> think it should be documented somewhere, but I haven't seen such an
> explanation.
>
> IMO, the presence of this warning causes several undesirable effects:
>
>   1. Small functions are hampered by the preclusion of check+declare
>      patterns that improve readability via concision. e.g: Consider a
>      silly example like:
>
>      /* with warning */                     /* without warning */
>      void foo(uint8_t *p)                   void foo(uint8_t *p)
>      {                                      {
>          uint8_t  tmp1;                         if ( !p )
>          uint16_t tmp2;                             return;
>          uint32_t tmp3;
>                                                 uint8_t  tmp1 =3D OFFSET1=
 + *p;
>          if ( !p )                              uint16_t tmp2 =3D OFFSET2=
 + *p;
>              return;                            uint32_t tmp3 =3D OFFSET3=
 + *p;
>
>          tmp1 =3D OFFSET1 + *p;                   /* Lots of uses of `tmp=
X` */
>          tmp2 =3D OFFSET2 + *p;               }
>          tmp2 =3D OFFSET2 + *p;
>
>          /* Lots of uses of tmpX */
>      }
>
>   2. Promotes scope-creep. On small functions it doesn't matter much,
>      but on bigger ones to prevent declaring halfway through the body
>      needlessly increases variable scope to the full scope in which they
>      are defined rather than the subscope of point-of-declaration to
>      end-of-current-scope. In cases in which they can be trivially
>      defined at that point, it also means they can be trivially misused
>      before they are meant to. i.e: On the example in (1) assume the
>      conditional in "with warning" is actually a large switch statement.
>
>   3. It facilitates a disconnect between time-of-declaration and
>      time-of-use that lead very easily to "use-before-init" bugs.
>      While a modern compiler can alleviate the most egregious cases of
>      this, there's cases it simply cannot cover. A conditional
>      initialization on anything with external linkage combined with a
>      conditional use on something else with external linkage will squash
>      the warning of using an uninitialised variable. Things are worse
>      where the variable in question is preinitialised to something
>      credible (e.g: a pointer to NULL), as then that can be misused
>      between its declaration and its original point of intended use.
>
> So... thoughts? yay or nay?

Hi,
   I personally agree with this change. Even compiler is stating that
this is just C89 compatibility.
Yes, it's question of style and surely having all declaration at the
beginning reduce the options however there are technical reason why
having mixed declarations can help
- you can use "const" to tell compiler (and code editor) that
something should not be changed;
- in many cases reduces commit changes;

> ---
>  xen/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/Makefile b/xen/Makefile
> index 2e1a925c8417..288b7ac8bb2d 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -394,7 +394,7 @@ CFLAGS-$(CONFIG_CC_SPLIT_SECTIONS) +=3D -ffunction-se=
ctions -fdata-sections
>
>  CFLAGS +=3D -nostdinc -fno-builtin -fno-common
>  CFLAGS +=3D -Werror -Wredundant-decls -Wwrite-strings -Wno-pointer-arith
> -CFLAGS +=3D -Wdeclaration-after-statement -Wuninitialized
> +CFLAGS +=3D -Wuninitialized
>  $(call cc-option-add,CFLAGS,CC,-Wvla)
>  $(call cc-option-add,CFLAGS,CC,-Wflex-array-member-not-at-end)
>  $(call cc-option-add,CFLAGS,CC,-Winit-self)

Frediano

