Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E0F75BA4E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 00:13:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566754.886019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMbt8-0007n8-6w; Thu, 20 Jul 2023 22:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566754.886019; Thu, 20 Jul 2023 22:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMbt8-0007kn-2c; Thu, 20 Jul 2023 22:12:46 +0000
Received: by outflank-mailman (input) for mailman id 566754;
 Thu, 20 Jul 2023 22:12:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DC1w=DG=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1qMbt6-0007kh-H3
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 22:12:44 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bb0d571-274a-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 00:12:42 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-51e28b299adso1794328a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 15:12:42 -0700 (PDT)
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
X-Inumbo-ID: 8bb0d571-274a-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689891161; x=1690495961;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fia0k+DTB2r8KZc5nHTVPKsuSqVAuPZDvXVIrBGCUuQ=;
        b=I3QM0is0pCufs9dzrwJap0WY+1FJxhknVOaPDwGUaCJmiFmzAI58894I7+Eh3HaH4j
         Qatzn8iEqtB0Nvt7C300rYveig9KVAlpe7LOPvIQrUDHeDnNH4dY8EyfM423YNgZu0Fo
         mXPrLFYYagk6uDi403ZCAq+qInn7ZVbVQfB9kIni1EEOEUHHSHJm8ViDbR23pqfYvNpJ
         9NxlRF6gButnnSDulDJfoiEpiBH20Dza1ZxpZsZ9UvEcMSiZ4FxzCFzttT/pDgzPtqO4
         xR5apQ2ulFjPKN4WXl8OZtqf4e32U4LET4Zn6NSE1gKciPgkC8QXMf5yspZdAuNTmUs8
         OqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689891161; x=1690495961;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fia0k+DTB2r8KZc5nHTVPKsuSqVAuPZDvXVIrBGCUuQ=;
        b=IyUMHVuAfn6L+CW66xHU2PePc/eutbnckTuf2Z6K/Z+ZcPCWUMLsCbF6KEY2KzCBeW
         zANX55STIa8/mf7awL8TjKfvnTITMSqvUukS2PVX49MYz8KFht0PECCGFklQVtNLDQFI
         zFTBgkfOryrcpxclws6MEnvNLFe/VTaKfqZXmfjMwmuJXgkfhkY2+6mP6eO4+nT7M1F1
         iSLWPfTumkMOV7UG2f9rbq7n7tDQnZwNZ0AAbjE6+o5cqoFDMND0StUjBQpVmdsWPheu
         MmFgb4lqVJoLZ8Fp6WAAcbMRt9ujEG6t2rPxbtp4QUeZtuPqYAmtj2JUEyeg+dz9uZgz
         s+OQ==
X-Gm-Message-State: ABy/qLYpySQ751mAJ2geG9XntX1uYA7Z0Y/9U2vTJusIcevVsFdTDY7c
	4Fof2skfQU7e5Lh+mR9l6BGypx/X2i9A5ud9ApU=
X-Google-Smtp-Source: APBJJlH4WfnY3J5XCy9VXXweyG9sihM0V+HIbUsb3NEkJmBOZeRBwAYBHM+1tcB3nA29RYNjIh8azrB3n4nFAOXqYdQ=
X-Received: by 2002:aa7:dcc7:0:b0:515:1e50:5498 with SMTP id
 w7-20020aa7dcc7000000b005151e505498mr124474edu.15.1689891161481; Thu, 20 Jul
 2023 15:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
 <20230701071835.41599-4-christopher.w.clark@gmail.com> <alpine.DEB.2.22.394.2307081144340.761183@ubuntu-linux-20-04-desktop>
 <CACMJ4GYE6PW1SY35dhs4XkXd9ru25igrvMCrh4pJMWEBNNz0YQ@mail.gmail.com>
In-Reply-To: <CACMJ4GYE6PW1SY35dhs4XkXd9ru25igrvMCrh4pJMWEBNNz0YQ@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 20 Jul 2023 15:12:29 -0700
Message-ID: <CACMJ4Gb_ZwKSjP7qzfQj98YQjSpBdFuWzeGQJUNNqst0GdXCOw@mail.gmail.com>
Subject: Re: [PATCH 03/10] x86 setup: change bootstrap map to accept new boot
 module structures
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, 
	Daniel Smith <dpsmith@apertussolutions.com>, stefano.stabellini@amd.com, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Rich Persaud <persaur@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000063a6a20600f272fd"

--00000000000063a6a20600f272fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 11:51=E2=80=AFPM Christopher Clark <
christopher.w.clark@gmail.com> wrote:

>
>
> On Sat, Jul 8, 2023 at 11:47=E2=80=AFAM Stefano Stabellini <sstabellini@k=
ernel.org>
> wrote:
>
>> On Sat, 1 Jul 2023, Christopher Clark wrote:
>> > To convert the x86 boot logic from multiboot to boot module structures=
,
>> > change the bootstrap map function to accept a boot module parameter.
>> >
>> > To allow incremental change from multiboot to boot modules across all
>> > x86 setup logic, provide a temporary inline wrapper that still accepts=
 a
>> > multiboot module parameter and use it where necessary. The wrapper is
>> > placed in a new arch/x86 header <asm/boot.h> to avoid putting a static
>> > inline function into an existing header that has no such functions
>> > already. This new header will be expanded with additional functions in
>> > subsequent patches in this series.
>> >
>> > No functional change intended.
>> >
>> > Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>> > Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> >
>>
>> [...]
>>
>> > diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
>> > index b72ae31a66..eb93cc3439 100644
>> > --- a/xen/include/xen/bootinfo.h
>> > +++ b/xen/include/xen/bootinfo.h
>> > @@ -10,6 +10,9 @@
>> >  #endif
>> >
>> >  struct boot_module {
>> > +    paddr_t start;
>> > +    size_t size;
>>
>> I think size should be paddr_t (instead of size_t) to make sure it is
>> the right size on both 64-bit and 32-bit architectures that support
>> 64-bit addresses.
>>
>
> Thanks, that explanation does make sense - ack.
>

I've come back to reconsider this as it doesn't seem right to me to store a
non-address value (which this will always be) in a type explicitly defined
to hold an address: addresses may have architectural alignment requirements
whereas a size value is just a number of bytes so will not. The point of a
size_t value is that size_t is defined to be large enough to hold the size
of any valid object in memory, so I think this was right as-is.

Christopher



>
> Christopher
>
>
>>
>>
>> >      struct arch_bootmodule *arch;
>> >  };
>>
>

--00000000000063a6a20600f272fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 13, 2023 at 11:51=E2=80=
=AFPM Christopher Clark &lt;<a href=3D"mailto:christopher.w.clark@gmail.com=
">christopher.w.clark@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On S=
at, Jul 8, 2023 at 11:47=E2=80=AFAM Stefano Stabellini &lt;<a href=3D"mailt=
o:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat, 1=
 Jul 2023, Christopher Clark wrote:<br>
&gt; To convert the x86 boot logic from multiboot to boot module structures=
,<br>
&gt; change the bootstrap map function to accept a boot module parameter.<b=
r>
&gt; <br>
&gt; To allow incremental change from multiboot to boot modules across all<=
br>
&gt; x86 setup logic, provide a temporary inline wrapper that still accepts=
 a<br>
&gt; multiboot module parameter and use it where necessary. The wrapper is<=
br>
&gt; placed in a new arch/x86 header &lt;asm/boot.h&gt; to avoid putting a =
static<br>
&gt; inline function into an existing header that has no such functions<br>
&gt; already. This new header will be expanded with additional functions in=
<br>
&gt; subsequent patches in this series.<br>
&gt; <br>
&gt; No functional change intended.<br>
&gt; <br>
&gt; Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.w.c=
lark@gmail.com" target=3D"_blank">christopher.w.clark@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Daniel P. Smith &lt;<a href=3D"mailto:dpsmith@apertusso=
lutions.com" target=3D"_blank">dpsmith@apertussolutions.com</a>&gt;<br>
&gt; <br>
<br>
[...]<br>
<br>
&gt; diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h<b=
r>
&gt; index b72ae31a66..eb93cc3439 100644<br>
&gt; --- a/xen/include/xen/bootinfo.h<br>
&gt; +++ b/xen/include/xen/bootinfo.h<br>
&gt; @@ -10,6 +10,9 @@<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 struct boot_module {<br>
&gt; +=C2=A0 =C2=A0 paddr_t start;<br>
&gt; +=C2=A0 =C2=A0 size_t size;<br>
<br>
I think size should be paddr_t (instead of size_t) to make sure it is<br>
the right size on both 64-bit and 32-bit architectures that support<br>
64-bit addresses.<br></blockquote><div><br></div><div>Thanks, that explanat=
ion does make sense - ack.</div></div></div></blockquote><div><br></div><di=
v>I&#39;ve come back to reconsider this as it doesn&#39;t seem right to me =
to store a non-address value (which this will always be) in a type explicit=
ly defined to hold an address: addresses may have architectural=C2=A0alignm=
ent requirements whereas a size value is just a number of bytes so will not=
. The point of a size_t value is that size_t is defined to be large enough =
to hold the size of any valid object in memory, so I think this was right a=
s-is.</div><div><br></div><div>Christopher</div><div><br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v class=3D"gmail_quote"><div><br></div><div>Christopher</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct arch_bootmodule *arch;<br>
&gt;=C2=A0 };<br>
</blockquote></div></div>
</blockquote></div></div>

--00000000000063a6a20600f272fd--

