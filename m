Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD3B96DFE7
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 18:35:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791288.1201163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smFRw-0008Eb-Qo; Thu, 05 Sep 2024 16:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791288.1201163; Thu, 05 Sep 2024 16:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smFRw-0008C0-OB; Thu, 05 Sep 2024 16:35:12 +0000
Received: by outflank-mailman (input) for mailman id 791288;
 Thu, 05 Sep 2024 16:35:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y9DX=QD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1smFRv-0008Bt-Q6
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 16:35:11 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d08fd441-6ba4-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 18:35:09 +0200 (CEST)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5dfaccba946so617816eaf.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 09:35:09 -0700 (PDT)
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
X-Inumbo-ID: d08fd441-6ba4-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725554108; x=1726158908; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=03x10nnDo94RY+2/K61t10UtZkk5tsb33sD8xTn/Vl4=;
        b=XkiV0D415wMBhb7DYaqdD73tPG85FYYetlnt3KgPYMl5twfyLgomQnLgMyoCjaYKku
         +DC9LBnVEYW580v3GnjmPAzEeXGdPJo/+4uJFJMjlBtTYsJ+jz6y4BVcoR8EoGAtTroY
         u7cre6xWqlr5J6hf0Ccvs/gFfwEW91yXXHeZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725554108; x=1726158908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=03x10nnDo94RY+2/K61t10UtZkk5tsb33sD8xTn/Vl4=;
        b=BA74X4ekR426b6GsTEXbqQ6pIAWf2cNXRMmJoJ8BgSPRFEb05FtEBA9Yvg9KPffJcQ
         gA4xx63Xu00PC7EN+8SXAGS9wNnlAio0UnqLJd4P2E8mUgoLXIMwMxr9agX1Gcle0quN
         Unzf1DvigU85MMg0l3HIzXjCj0A3rgloD/ZjT4a4KzCrE9TnZzSSzgED3UiM++LEk57T
         QKTeWBrCf1w7+7Owd8asoWt14MZELGQ/hgl5RajLjZjNvRqbWFkjmk+v1Ujo3B7am917
         6SJmkoDUN6W1lI63R2SwhIGyob298pzRYSVZyezFd0ruqyjTQ/BJba9WwiyvrSHBkm5w
         Ap5A==
X-Forwarded-Encrypted: i=1; AJvYcCUokkeR+hRtxqXX/c0Pz1JpTa0uf1vJ7xBqAtiWY4amHdcyRYZA/G4ZVEUtwuiiCmuZhaImO3ftnhM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLdu3ii88RRBAUle31YDsidvMZv+N2e4DROublJ2R0EOQ4PEGN
	1FcZG3aktu/VXKFpOVzOJ3f8ex9UV20YVjWl/xq1BFSX6i8EHbktW3fsV1CO/CWkCv2YvRt/5tg
	2zydJNXSLmdXxnB+0x4GfmfIYnvVrshJzoNVJKg==
X-Google-Smtp-Source: AGHT+IHOoCj6I2NIJzttTz1hC+tm9OGv4C/4K0SrcqwIrMPdOMBm/xQelKx7lyB9eBNbmDPAuaEDJi6QHbUUxPe8naY=
X-Received: by 2002:a05:6870:e2d4:b0:270:276d:fb54 with SMTP id
 586e51a60fabf-277ccc0ff6fmr20857808fac.21.1725554108274; Thu, 05 Sep 2024
 09:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240905130657.4075906-1-andrew.cooper3@citrix.com>
 <20240905130657.4075906-4-andrew.cooper3@citrix.com> <092700d9-101b-4bac-a500-7f03bd471d89@suse.com>
 <341fa9f8-eabe-44fd-a291-4032d5fa5994@citrix.com>
In-Reply-To: <341fa9f8-eabe-44fd-a291-4032d5fa5994@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 5 Sep 2024 17:34:57 +0100
Message-ID: <CACHz=Zh9jdcUfR9dFqUcx1V+DVED14gnasy53TjGy5bk4a4jdQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] x86/trampoline: Collect other scattered trampoline symbols
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alejandro Vallejo <alejandro.vallejo@cloud.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000aa327d062161df10"

--000000000000aa327d062161df10
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 5:10=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com>
wrote:

> On 05/09/2024 4:42 pm, Jan Beulich wrote:
> > On 05.09.2024 15:06, Andrew Cooper wrote:
> >> --- a/xen/arch/x86/efi/efi-boot.h
> >> +++ b/xen/arch/x86/efi/efi-boot.h
> >> @@ -102,9 +102,6 @@ static void __init efi_arch_relocate_image(unsigne=
d
> long delta)
> >>      }
> >>  }
> >>
> >> -extern const s32 __trampoline_rel_start[], __trampoline_rel_stop[];
> >> -extern const s32 __trampoline_seg_start[], __trampoline_seg_stop[];
> > I'd prefer if these stayed here, leaving the 4 symbols as minimally
> exposed as
> > possible. Recall that efi-boot.h isn't really a header in that sense, b=
ut
> > rather a .c file. Elsewhere we keep decls in .c files when they're used
> in just
> > one CU.
>
> See Frediano's RFC series, which needs to change this in order to move
> the 32bit relocation logic from asm to C.
>
> Not strictly necessary, I can declare in the C file as they were declared
in efi-boot.h (which is more a .c file as an header as Jan said).
I think the idea of declaring into a source file is that if another file
wants to use it has to declare it again, so a bit more friction.
But any access to trampoline variables should be considered as something to
limit in any case, so having in a separate header helps (this does not mean
that removing from the header is still increasing the friction).

Personally, I'm not strong about the 2 options here. Slightly prefer having
all variable declared in a single header.

The only reason efi-boot.h can get away with this right now is because
> the other logic is written entirely in asm.
>
>
> Scope-limiting linker section boundaries more than regular variables is
> weird to me.  It's not as if they magically take more care to use than
> regular variables, and trampoline.h is not a wide scope by any means.
>
>
Frediano

--000000000000aa327d062161df10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Sep 5, 2024 at 5:10=E2=80=AFPM Andrew Cooper &lt;<a href=3D"=
mailto:andrew.cooper3@citrix.com">andrew.cooper3@citrix.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 05/09/2024 4:=
42 pm, Jan Beulich wrote:<br>
&gt; On 05.09.2024 15:06, Andrew Cooper wrote:<br>
&gt;&gt; --- a/xen/arch/x86/efi/efi-boot.h<br>
&gt;&gt; +++ b/xen/arch/x86/efi/efi-boot.h<br>
&gt;&gt; @@ -102,9 +102,6 @@ static void __init efi_arch_relocate_image(uns=
igned long delta)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; -extern const s32 __trampoline_rel_start[], __trampoline_rel_stop[=
];<br>
&gt;&gt; -extern const s32 __trampoline_seg_start[], __trampoline_seg_stop[=
];<br>
&gt; I&#39;d prefer if these stayed here, leaving the 4 symbols as minimall=
y exposed as<br>
&gt; possible. Recall that efi-boot.h isn&#39;t really a header in that sen=
se, but<br>
&gt; rather a .c file. Elsewhere we keep decls in .c files when they&#39;re=
 used in just<br>
&gt; one CU.<br>
<br>
See Frediano&#39;s RFC series, which needs to change this in order to move<=
br>
the 32bit relocation logic from asm to C.<br>
<br></blockquote><div>Not strictly necessary, I can declare in the C file a=
s they were declared in efi-boot.h (which is more a .c file as an header as=
 Jan said).</div><div>I think the idea of declaring into a source file is t=
hat if another file wants to use it has to declare it again, so a bit more =
friction.</div><div>But any access to trampoline variables should be consid=
ered as something to limit in any case, so having in a separate header help=
s (this does not mean that removing from the header is still increasing the=
 friction).</div><div><br></div><div>Personally, I&#39;m not strong about t=
he 2 options here. Slightly prefer having all variable declared in a single=
 header.<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
The only reason efi-boot.h can get away with this right now is because<br>
the other logic is written entirely in asm.<br>
<br>
<br>
Scope-limiting linker section boundaries more than regular variables is<br>
weird to me.=C2=A0 It&#39;s not as if they magically take more care to use =
than<br>
regular variables, and trampoline.h is not a wide scope by any means.<br>
<br></blockquote><div>=C2=A0</div><div>Frediano</div><div>=C2=A0<br></div><=
/div></div>

--000000000000aa327d062161df10--

