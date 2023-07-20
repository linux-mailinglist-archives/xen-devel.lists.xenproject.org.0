Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24F375BAC3
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 00:45:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566786.886100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMcOO-0007st-AF; Thu, 20 Jul 2023 22:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566786.886100; Thu, 20 Jul 2023 22:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMcOO-0007q0-69; Thu, 20 Jul 2023 22:45:04 +0000
Received: by outflank-mailman (input) for mailman id 566786;
 Thu, 20 Jul 2023 22:45:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DC1w=DG=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1qMcON-0007bF-Hl
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 22:45:03 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f32608a-274f-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 00:45:00 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fbf09a9139so2147837e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 15:45:01 -0700 (PDT)
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
X-Inumbo-ID: 0f32608a-274f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689893101; x=1690497901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LNZIyJjieHXqss25LeS5v2p4NTUaN9JllMEq4pGJddI=;
        b=je2AyYkIzNPODyCre6CassnEctV1aS88D+TObgiMXGGkn0bxodkG7v0qZJhSm9wboQ
         PAu4gdJpK6I0WcvBdC8DMyIZ8A87pf/oELboyCYo2y1OwfxF8koJxjtPK0EDh7TmskPz
         xcR/Ly3Rk8ZmtccmzUW2JP2hd4IQ10rQwAqCEyMHtleilanj/eG3CL0zTUnmMQgQAH0g
         Gq8NnewW9i2wgqh1mfjki97ryahHYBDKOceUQ3U/1eqN3CpKzrZTFrAT3OVe7JXgsTaj
         m5mr+7GG5fHGBRADLMrV37KM/iPdgxflM0diprqssKtsfiAnwIIUako68Lj+OypLHGC+
         vVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689893101; x=1690497901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LNZIyJjieHXqss25LeS5v2p4NTUaN9JllMEq4pGJddI=;
        b=czcgFAdEtXn/DoZGeG7kFi0N7eFnC1Z2LZ8xtz63LFYFPpN3/xGRXpSnSjl9xIF9EA
         4gO6sgP4IuILa0YHnrtI6wyTju2za7BhLb4t0QSANB27zzg4fqmPxWPRDdoarGUwUUfG
         J7QfS1Zkji8aFDBOdLMyB65LXADeD7RfRLKZJEQLGi7jBUcR+3ODIHYJ5CYAep9jMykv
         twHqLmH4NSVE2Ewk4935uCgZAiVtJ8Alvy4pE/NoMjxHwO3JZhBsGrhUpfUVEvxqHXm1
         r/wxgPw1WY4KWwMNre/prmibbd+xeDu/OXW0xtIXwa3ATVg+3r21APNY3LQeiV6ossvJ
         16JQ==
X-Gm-Message-State: ABy/qLavc/Zr6r/37ChWiZsvfMDUg6U7QxGbX/lUfPX3mAJO7+mxZdw2
	ryd22l4RM8bT5qH6jck7JeYRKVikp3YmssUmoIQ=
X-Google-Smtp-Source: APBJJlHYJmfVjQSd5AA2VmOOT1o/zX6AQnPBa5zrp1uO1G4lGFsfBZ8yoCrjV4mTVSAcQk20bOMHMzIDYI+FxIH/OJY=
X-Received: by 2002:a05:6512:328d:b0:4fb:9050:1d92 with SMTP id
 p13-20020a056512328d00b004fb90501d92mr46362lfe.51.1689893100882; Thu, 20 Jul
 2023 15:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
 <20230701071835.41599-8-christopher.w.clark@gmail.com> <alpine.DEB.2.22.394.2307081522410.761183@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2307081522410.761183@ubuntu-linux-20-04-desktop>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 20 Jul 2023 15:44:49 -0700
Message-ID: <CACMJ4GbULNDTSQKUOJByv-C5u4ZX+OyhP_+5HmpiAcFU93=RzA@mail.gmail.com>
Subject: Re: [PATCH 07/10] x86 boot: define paddr_t and add macros for
 typedefing struct pointers
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, 
	Daniel Smith <dpsmith@apertussolutions.com>, stefano.stabellini@amd.com, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Rich Persaud <persaur@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000fc92070600f2e54a"

--000000000000fc92070600f2e54a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 8, 2023 at 3:24=E2=80=AFPM Stefano Stabellini <sstabellini@kern=
el.org>
wrote:

> On Sat, 1 Jul 2023, Christopher Clark wrote:
> > Pointer fields within structs need to be defined as fixed size types in
> > the x86 boot build environment. Using a typedef for the field type
> > rather than a struct pointer type enables the type definition to
> > be changed in the 32-bit boot build and the main hypervisor build,
> > allowing for a single common structure definition and a common header
> file.
>
> Sorry for my ignorance, but why?
>
> struct boot_module is not used as part of any ABI, right? It is
> populated by Xen at boot by hand. Why do we need a specific memory
> layout for it?
>

Fair question! In the early x86 boot logic, which runs in 32-bit CPU mode,
struct boot_module is allocated and populated, so the structure needs to be
defined and available to code that is compiled in 32-bit to do that. The
same structures are also accessed later in 64-bit hypervisor logic, and the
memory layout of the structure needs to be the same in both cases, so we
want all the fields to be fixed-width types, and that includes pointers.

These macros help with declaring pointers as always-64-bit-sized struct
fields in a single definition of the struct. They're not strictly necessary
though - providing alternative definitions for typedefs can be used
instead, and I've been looking at doing that since posting this patch.

Christopher



>
>
>
> > Introduces DEFINE_STRUCT_PTR_TYPE and DEFINE_PTR_TYPE which will
> > generate typedefs with a _ptr_t suffix for pointers to the specified
> > type. This is then used in <xen/bootinfo.h> for pointers within structs
> > as preparation for using these headers in the x86 boot build.
> >
> > The 32-bit behaviour is obtained by inclusion of "defs.h" first with a
> > check for such an existing definition on the <xen/types.h> version.
> >
> > paddr_t is used in <xen/bootinfo.h> so a definition is added here to
> > the x86 boot environment defs.h header.
> >
> > Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> > Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>
>
> > ---
> > Changes since v2: This is two v2 patches merged into one for v3.
> > Changes since v1: New in v2 of series.
> >
> >  xen/arch/x86/boot/defs.h            |  9 +++++++++
> >  xen/arch/x86/include/asm/bootinfo.h |  4 +++-
> >  xen/include/xen/bootinfo.h          |  9 +++++----
> >  xen/include/xen/types.h             | 11 +++++++++++
> >  4 files changed, 28 insertions(+), 5 deletions(-)
> >
> > diff --git a/xen/arch/x86/boot/defs.h b/xen/arch/x86/boot/defs.h
> > index f9840044ec..bc0f1b5cf8 100644
> > --- a/xen/arch/x86/boot/defs.h
> > +++ b/xen/arch/x86/boot/defs.h
> > @@ -60,4 +60,13 @@ typedef u64 uint64_t;
> >  #define U16_MAX              ((u16)(~0U))
> >  #define UINT_MAX     (~0U)
> >
> > +typedef unsigned long long paddr_t;
> > +
> > +#define DEFINE_STRUCT_PTR_TYPE(struct_name) \
> > +    typedef uint64_t struct_name ## _ptr_t;
> > +
> > +#define DEFINE_PTR_TYPE(type) \
> > +    typedef uint64_t type ## _ptr_t;
> > +DEFINE_PTR_TYPE(char);
> > +
> >  #endif /* __BOOT_DEFS_H__ */
> > diff --git a/xen/arch/x86/include/asm/bootinfo.h
> b/xen/arch/x86/include/asm/bootinfo.h
> > index 30c27980e0..989fb7a1da 100644
> > --- a/xen/arch/x86/include/asm/bootinfo.h
> > +++ b/xen/arch/x86/include/asm/bootinfo.h
> > @@ -6,6 +6,7 @@ struct arch_bootmodule {
> >      uint32_t flags;
> >      unsigned headroom;
> >  };
> > +DEFINE_STRUCT_PTR_TYPE(arch_bootmodule);
> >
> >  struct arch_boot_info {
> >      uint32_t flags;
> > @@ -14,11 +15,12 @@ struct arch_boot_info {
> >  #define BOOTINFO_FLAG_X86_MEMMAP       1U << 6
> >  #define BOOTINFO_FLAG_X86_LOADERNAME   1U << 9
> >
> > -    char *boot_loader_name;
> > +    char_ptr_t boot_loader_name;
> >
> >      uint32_t mmap_length;
> >      paddr_t mmap_addr;
> >  };
> > +DEFINE_STRUCT_PTR_TYPE(arch_boot_info);
> >
> >  struct __packed mb_memmap {
> >      uint32_t size;
> > diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
> > index 2f4284a91f..8389da4f72 100644
> > --- a/xen/include/xen/bootinfo.h
> > +++ b/xen/include/xen/bootinfo.h
> > @@ -35,17 +35,18 @@ struct boot_module {
> >      mfn_t mfn;
> >      size_t size;
> >
> > -    struct arch_bootmodule *arch;
> > +    arch_bootmodule_ptr_t arch;
> >      struct boot_string string;
> >  };
> > +DEFINE_STRUCT_PTR_TYPE(boot_module);
> >
> >  struct boot_info {
> > -    char *cmdline;
> > +    char_ptr_t cmdline;
> >
> >      unsigned int nr_mods;
> > -    struct boot_module *mods;
> > +    boot_module_ptr_t mods;
> >
> > -    struct arch_boot_info *arch;
> > +    arch_boot_info_ptr_t arch;
> >  };
> >
> >  #endif
> > diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
> > index 6aba80500a..e807ffe255 100644
> > --- a/xen/include/xen/types.h
> > +++ b/xen/include/xen/types.h
> > @@ -71,4 +71,15 @@ typedef bool bool_t;
> >  #define test_and_set_bool(b)   xchg(&(b), true)
> >  #define test_and_clear_bool(b) xchg(&(b), false)
> >
> > +#ifndef DEFINE_STRUCT_PTR_TYPE
> > +#define DEFINE_STRUCT_PTR_TYPE(struct_name) \
> > +    typedef struct struct_name * struct_name ## _ptr_t;
> > +#endif
> > +
> > +#ifndef DEFINE_PTR_TYPE
> > +#define DEFINE_PTR_TYPE(type) \
> > +    typedef type * type ## _ptr_t;
> > +DEFINE_PTR_TYPE(char);
> > +#endif
> > +
> >  #endif /* __TYPES_H__ */
> > --
> > 2.25.1
> >
> >
>

--000000000000fc92070600f2e54a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 8, 2023 at 3:24=E2=80=AFP=
M Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabell=
ini@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Sat, 1 Jul 2023, Christopher Clark wrote:<br>
&gt; Pointer fields within structs need to be defined as fixed size types i=
n<br>
&gt; the x86 boot build environment. Using a typedef for the field type<br>
&gt; rather than a struct pointer type enables the type definition to<br>
&gt; be changed in the 32-bit boot build and the main hypervisor build,<br>
&gt; allowing for a single common structure definition and a common header =
file.<br>
<br>
Sorry for my ignorance, but why?<br>
<br>
struct boot_module is not used as part of any ABI, right? It is<br>
populated by Xen at boot by hand. Why do we need a specific memory<br>
layout for it?<br></blockquote><div><br></div><div>Fair question! In the ea=
rly x86 boot logic, which runs in 32-bit CPU mode, struct boot_module is al=
located and populated, so the structure needs to be defined and available t=
o code that is compiled in 32-bit to do that. The same structures are also =
accessed later in 64-bit hypervisor logic, and the memory layout of the str=
ucture needs to be the same in both cases, so we want all the fields to be =
fixed-width types, and that includes pointers.</div><div><br>These macros h=
elp with declaring pointers as always-64-bit-sized struct fields in a singl=
e definition of the struct. They&#39;re not strictly necessary though - pro=
viding alternative definitions for typedefs can be used instead, and I&#39;=
ve been looking at doing that since posting this patch.<br></div><div><br><=
/div><div>Christopher</div><div><br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
<br>
<br>
&gt; Introduces DEFINE_STRUCT_PTR_TYPE and DEFINE_PTR_TYPE which will<br>
&gt; generate typedefs with a _ptr_t suffix for pointers to the specified<b=
r>
&gt; type. This is then used in &lt;xen/bootinfo.h&gt; for pointers within =
structs<br>
&gt; as preparation for using these headers in the x86 boot build.<br>
&gt; <br>
&gt; The 32-bit behaviour is obtained by inclusion of &quot;defs.h&quot; fi=
rst with a<br>
&gt; check for such an existing definition on the &lt;xen/types.h&gt; versi=
on.<br>
&gt; <br>
&gt; paddr_t is used in &lt;xen/bootinfo.h&gt; so a definition is added her=
e to<br>
&gt; the x86 boot environment defs.h header.<br>
&gt; <br>
&gt; Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.w.c=
lark@gmail.com" target=3D"_blank">christopher.w.clark@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Daniel P. Smith &lt;<a href=3D"mailto:dpsmith@apertusso=
lutions.com" target=3D"_blank">dpsmith@apertussolutions.com</a>&gt;<br>
<br>
<br>
&gt; ---<br>
&gt; Changes since v2: This is two v2 patches merged into one for v3.<br>
&gt; Changes since v1: New in v2 of series.<br>
&gt; <br>
&gt;=C2=A0 xen/arch/x86/boot/defs.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 9 +++++++++<br>
&gt;=C2=A0 xen/arch/x86/include/asm/bootinfo.h |=C2=A0 4 +++-<br>
&gt;=C2=A0 xen/include/xen/bootinfo.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 9 +++++----<br>
&gt;=C2=A0 xen/include/xen/types.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 11 +++++++++++<br>
&gt;=C2=A0 4 files changed, 28 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/xen/arch/x86/boot/defs.h b/xen/arch/x86/boot/defs.h<br>
&gt; index f9840044ec..bc0f1b5cf8 100644<br>
&gt; --- a/xen/arch/x86/boot/defs.h<br>
&gt; +++ b/xen/arch/x86/boot/defs.h<br>
&gt; @@ -60,4 +60,13 @@ typedef u64 uint64_t;<br>
&gt;=C2=A0 #define U16_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
((u16)(~0U))<br>
&gt;=C2=A0 #define UINT_MAX=C2=A0 =C2=A0 =C2=A0(~0U)<br>
&gt;=C2=A0 <br>
&gt; +typedef unsigned long long paddr_t;<br>
&gt; +<br>
&gt; +#define DEFINE_STRUCT_PTR_TYPE(struct_name) \<br>
&gt; +=C2=A0 =C2=A0 typedef uint64_t struct_name ## _ptr_t;<br>
&gt; +<br>
&gt; +#define DEFINE_PTR_TYPE(type) \<br>
&gt; +=C2=A0 =C2=A0 typedef uint64_t type ## _ptr_t;<br>
&gt; +DEFINE_PTR_TYPE(char);<br>
&gt; +<br>
&gt;=C2=A0 #endif /* __BOOT_DEFS_H__ */<br>
&gt; diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/includ=
e/asm/bootinfo.h<br>
&gt; index 30c27980e0..989fb7a1da 100644<br>
&gt; --- a/xen/arch/x86/include/asm/bootinfo.h<br>
&gt; +++ b/xen/arch/x86/include/asm/bootinfo.h<br>
&gt; @@ -6,6 +6,7 @@ struct arch_bootmodule {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t flags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsigned headroom;<br>
&gt;=C2=A0 };<br>
&gt; +DEFINE_STRUCT_PTR_TYPE(arch_bootmodule);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 struct arch_boot_info {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t flags;<br>
&gt; @@ -14,11 +15,12 @@ struct arch_boot_info {<br>
&gt;=C2=A0 #define BOOTINFO_FLAG_X86_MEMMAP=C2=A0 =C2=A0 =C2=A0 =C2=A01U &l=
t;&lt; 6<br>
&gt;=C2=A0 #define BOOTINFO_FLAG_X86_LOADERNAME=C2=A0 =C2=A01U &lt;&lt; 9<b=
r>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 char *boot_loader_name;<br>
&gt; +=C2=A0 =C2=A0 char_ptr_t boot_loader_name;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t mmap_length;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 paddr_t mmap_addr;<br>
&gt;=C2=A0 };<br>
&gt; +DEFINE_STRUCT_PTR_TYPE(arch_boot_info);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 struct __packed mb_memmap {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t size;<br>
&gt; diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h<b=
r>
&gt; index 2f4284a91f..8389da4f72 100644<br>
&gt; --- a/xen/include/xen/bootinfo.h<br>
&gt; +++ b/xen/include/xen/bootinfo.h<br>
&gt; @@ -35,17 +35,18 @@ struct boot_module {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mfn_t mfn;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 size_t size;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 struct arch_bootmodule *arch;<br>
&gt; +=C2=A0 =C2=A0 arch_bootmodule_ptr_t arch;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct boot_string string;<br>
&gt;=C2=A0 };<br>
&gt; +DEFINE_STRUCT_PTR_TYPE(boot_module);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 struct boot_info {<br>
&gt; -=C2=A0 =C2=A0 char *cmdline;<br>
&gt; +=C2=A0 =C2=A0 char_ptr_t cmdline;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsigned int nr_mods;<br>
&gt; -=C2=A0 =C2=A0 struct boot_module *mods;<br>
&gt; +=C2=A0 =C2=A0 boot_module_ptr_t mods;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 struct arch_boot_info *arch;<br>
&gt; +=C2=A0 =C2=A0 arch_boot_info_ptr_t arch;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #endif<br>
&gt; diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h<br>
&gt; index 6aba80500a..e807ffe255 100644<br>
&gt; --- a/xen/include/xen/types.h<br>
&gt; +++ b/xen/include/xen/types.h<br>
&gt; @@ -71,4 +71,15 @@ typedef bool bool_t;<br>
&gt;=C2=A0 #define test_and_set_bool(b)=C2=A0 =C2=A0xchg(&amp;(b), true)<br=
>
&gt;=C2=A0 #define test_and_clear_bool(b) xchg(&amp;(b), false)<br>
&gt;=C2=A0 <br>
&gt; +#ifndef DEFINE_STRUCT_PTR_TYPE<br>
&gt; +#define DEFINE_STRUCT_PTR_TYPE(struct_name) \<br>
&gt; +=C2=A0 =C2=A0 typedef struct struct_name * struct_name ## _ptr_t;<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#ifndef DEFINE_PTR_TYPE<br>
&gt; +#define DEFINE_PTR_TYPE(type) \<br>
&gt; +=C2=A0 =C2=A0 typedef type * type ## _ptr_t;<br>
&gt; +DEFINE_PTR_TYPE(char);<br>
&gt; +#endif<br>
&gt; +<br>
&gt;=C2=A0 #endif /* __TYPES_H__ */<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt; <br>
</blockquote></div></div>

--000000000000fc92070600f2e54a--

