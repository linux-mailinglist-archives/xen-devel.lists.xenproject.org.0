Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B88E9A3F90
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 15:28:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821915.1235892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1n1i-0001BE-7j; Fri, 18 Oct 2024 13:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821915.1235892; Fri, 18 Oct 2024 13:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1n1i-000198-3G; Fri, 18 Oct 2024 13:28:22 +0000
Received: by outflank-mailman (input) for mailman id 821915;
 Fri, 18 Oct 2024 13:28:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SHZo=RO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t1n1g-000169-7G
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 13:28:20 +0000
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [2607:f8b0:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5b5527d-8d54-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 15:28:18 +0200 (CEST)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3e5ea4cbcf9so1277086b6e.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 06:28:18 -0700 (PDT)
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
X-Inumbo-ID: d5b5527d-8d54-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729258097; x=1729862897; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upSoKpQfCmZYAp8KGYRI/oZvmRH5DQOTMB8V6GfpXag=;
        b=XusIaj6s8uLLRzY9EQ+TUf/kbqiL+n/zyzyrLDUpyGSeSEMSQLAV5ZHXqHtytOxgNg
         JGXFBMaQtd/lOdfkcjX+724PiPXcHlTMJBWqzutbNchfGb3iK0wqbF6OiVlyEoAHob51
         vSpeQBkP2eEGty+80nse0hRdGfc+yyh8l/0BM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258097; x=1729862897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upSoKpQfCmZYAp8KGYRI/oZvmRH5DQOTMB8V6GfpXag=;
        b=M9NSFPdfv876qEKFqMLNJWEE80WHfJhuPULZTtwJodeTK1Y6nofQjHMK621xDwDYlA
         4erD4xdakfGieV5jHmGs/oWa7iolzKUQXqoKP1cqVqVR776Dx3AGmnR4nqbTJMLHxgC0
         dTK/nJFaTwEprHsexj7QbsnmAXnPqYGPAHjJIyGMnn3B+hZz/7yDwkEtpvItfOoudOdh
         1Q9wc9ATf1oz15/G67tqiSt15+vmSutg0fvk3pMzDZaJV0sSdFLfqIyhr/30s1dUJm0v
         3d9jCrMr7pz7i2KWMufnUC4GD9sVl1b53O5hnMickhaKzJaXW+QKJQGeJphZEyhbRY0T
         9/RA==
X-Forwarded-Encrypted: i=1; AJvYcCWwd7Z8hgB+eTvlkFlImzKh3LdrSUypw5YEKozKMVDf9SPYKe7wA3GXYWbJqXkxnr/8msm8C1el/z8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIieRO8ZNACx6GYibYPGIPaEmg/Dgd8VmgzQUrd5O2l9g1IDnW
	YbpL8rNtySU9yBkTiYMezkksLzTahi4iNmOciGcf50219htIW3/B53WYOiGEDXsPpDLKteJ+yDh
	jCqgKoxyHtREhXUlwMHnfCHV6Enoix3rIl+T3pg==
X-Google-Smtp-Source: AGHT+IFyjEM0E22XBKlojIW+MJdt+JoUvn+/6NmijlyS4Wcxq1q5/W+lpQPrYssytNMladHPoRwqb5TE0sLf/PWmM4w=
X-Received: by 2002:a05:6808:2020:b0:3e5:d8b9:fcff with SMTP id
 5614622812f47-3e602da1233mr1515681b6e.42.1729258096813; Fri, 18 Oct 2024
 06:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
 <20241017133123.1946204-2-frediano.ziglio@cloud.com> <a5745a93-1d82-45f1-bb88-81a737ebcce3@citrix.com>
 <CACHz=ZhULqJpE8UK7kZQN0He5Poc85Cr6heTCKj1KLjxcPA6XQ@mail.gmail.com> <ZxJLUeMFyejFGCLc@macbook.local>
In-Reply-To: <ZxJLUeMFyejFGCLc@macbook.local>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 18 Oct 2024 14:28:05 +0100
Message-ID: <CACHz=ZhXFRG1PcCqvTUy6jQbbbFNHu7rwWP+CVtJuEeXRqQYXA@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] x86/boot: create a C bundle for 32 bit boot code
 and use it
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 12:49=E2=80=AFPM Roger Pau Monn=C3=A9 <roger.pau@ci=
trix.com> wrote:
>
> On Fri, Oct 18, 2024 at 09:42:48AM +0100, Frediano Ziglio wrote:
> > On Thu, Oct 17, 2024 at 6:13=E2=80=AFPM Andrew Cooper <andrew.cooper3@c=
itrix.com> wrote:
> > >
> > > On 17/10/2024 2:31 pm, Frediano Ziglio wrote:
> > > > The current method to include 32 bit C boot code is:
> > > > - compile each function we want to use into a separate object file;
> > > > - each function is compiled with -fpic option;
> > > > - convert these object files to binary files. This operation remove=
s GOP
> > > >   which we don't want in the executable;
> > > > - a small assembly part in each file add the entry point;
> > > > - code can't have external references, all possible variables are p=
assed
> > > >   by value or pointer;
> > > > - include these binary files in head.S.
> > > >
> > > > There are currently some limitations:
> > > > - code is compiled separately, it's not possible to share a functio=
n
> > > >   (like memcpy) between different functions to use;
> > > > - although code is compiled with -fpic there's no certainty there a=
re
> > > >   no relocations, specifically data ones. This can lead into hard t=
o
> > > >   find bugs;
> > > > - it's hard to add a simple function;
> > > > - having to pass external variables makes hard to do multiple thing=
s
> > > >   otherwise functions would require a lot of parameters so code wou=
ld
> > > >   have to be split into multiple functions which is not easy.
> > > >
> > > > Current change extends the current process:
> > > > - all object files are linked together before getting converted mak=
ing
> > > >   possible to share code between the function we want to call;
> > > > - a single object file is generated with all functions to use and
> > > >   exported symbols to easily call;
> > > > - variables to use are declared in linker script and easily used in=
side
> > > >   C code. Declaring them manually could be annoying but makes also
> > > >   easier to check them. Using external pointers can be still an iss=
ue if
> > > >   they are not fixed. If an external symbol is not declared this gi=
ves a
> > > >   link error.
> > > >
> > > > Some details of the implementation:
> > > > - C code is compiled with -fpic flags (as before);
> > > > - object files from C code are linked together;
> > > > - the single bundled object file is linked with 2 slightly differen=
t
> > > >   script files to generate 2 bundled object files;
> > > > - the 2 bundled object files are converted to binary removing the n=
eed
> > > >   for global offset tables;
> > > > - a Python script is used to generate assembly source from the 2
> > > >   binaries;
> > > > - the single assembly file is compiled to generate final bundled ob=
ject
> > > >   file;
> > > > - to detect possible unwanted relocation in data/code code is gener=
ated
> > > >   with different addresses. This is enforced starting .text section=
 at
> > > >   different positions and adding a fixed "gap" at the beginning.
> > > >   This makes sure code and data is position independent;
> > > > - to detect used symbols in data/code symbols are placed in .text
> > > >   section at different offsets (based on the line in the linker scr=
ipt).
> > > >   This is needed as potentially a reference to a symbol is converte=
d to
> > > >   a reference to the containing section so multiple symbols could b=
e
> > > >   converted to reference to same symbol (section name) and we need =
to
> > > >   distinguish them;
> > > > - --orphan-handling=3Derror option to linker is used to make sure w=
e
> > > >   account for all possible sections from C code;
> > > >
> > > > Current limitations:
> > > > - the main one is the lack of support for 64 bit code. It would mak=
e
> > > >   sure that even the code used for 64 bit (at the moment EFI code) =
is
> > > >   code and data position independent. We cannot assume that code th=
at
> > > >   came from code compiled for 32 bit and compiled for 64 bit is cod=
e and
> > > >   data position independent, different compiler options lead to
> > > >   different code/data.
> > > >
> > > > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > >
> > > This commit message is not particularly easy to follow.  Can I recomm=
end
> > > the following:
> > >
> > > ---%<---
> > > x86/boot: Rework how 32bit C is linked/included for early boot
> > >
> > > Right now, the two functions which were really too complicated to wri=
te
> > > in asm are compiled as 32bit PIC, linked to a blob and included
> > > directly, using global asm() to arrange for them to have function sem=
antics.
> > >
> > > This is limiting and fragile; the use of data relocations will compil=
e
> > > fine but malfunction when used, creating hard-to-debug bugs.
> > >
> > > Furthermore, we would like to increase the amount of C, to
> > > deduplicate/unify Xen's boot logic, as well as making it easier to
> > > follow.  Therefore, rework how the 32bit objects are included.
> > >
> > > Link all 32bit objects together first.  This allows for sharing of lo=
gic
> > > between translation units.  Use differential linking and explicit
> > > imports/exports to confirm that we only have the expected relocations=
,
> > > and write the object back out as an assembly file so it can be linked
> > > again as if it were 64bit, to integrate with the rest of Xen.
> > >
> > > This allows for the use of external references (e.g. access to global
> > > variables) with reasonable assurance of doing so safely.
> > >
> > > No functional change.
> > > ---%<---
> > >
> > > which I think is an accurate and more concise summary of what's chang=
ing?
> > >
> >
> > You cut half of the explanation, replacing with nothing.
> > Why is a script needed? Why 2 linking? How the new method detects
> > unwanted relocations?
>
> TBH this is not clear to me even with your original commit message.
>

I'm starting to think that either me or Andrew are not the right
persons to write this, there's a lot of assumptions we assume for
granted.

From what I see, in my message:
----
- to detect possible unwanted relocation in data/code code is generated
  with different addresses. This is enforced starting .text section at
  different positions and adding a fixed "gap" at the beginning.
  This makes sure code and data is position independent;
- to detect used symbols in data/code symbols are placed in .text
  section at different offsets (based on the line in the linker script).
  This is needed as potentially a reference to a symbol is converted to
  a reference to the containing section so multiple symbols could be
  converted to reference to same symbol (section name) and we need to
  distinguish them;
----

in Andrew message:
----
Use differential linking and explicit imports/exports to confirm that
we only have the expected relocations,
----

probably both are cryptic, but getting from "differential linking" you
really need to know in advance what you are explaining.

> > Why wasn't possible to share functions?

mine:
----
- code is compiled separately, it's not possible to share a function
  (like memcpy) between different functions to use;
----

in Andrew message:
----
Link all 32bit objects together first.  This allows for sharing of
logic between translation units.
----

I would agree Andrew comment is clearer here.

> > Why using --orphan-handling option?

mine:
----
- --orphan-handling=3Derror option to linker is used to make sure we
  account for all possible sections from C code;
---

in Andrew message:
----
----

still, Andrew more clear, but not carrying any information.

> >
> > The description has been there for about 2 months without many objectio=
ns.
>
> IMO it's fine to use lists to describe specific points, but using
> lists exclusively to write a commit message makes the items feel
> disconnected between them.
>
> The format of the commit message by Andrew is clearer to undertsand
> for me.  Could you add what you think it's missing to the proposed
> message by Andrew?
>
> Thanks, Roger.

Probably, as said above, we (me and Andrew) have too many assumptions.
This commit is doing quite some magic that's not easy to grasp.
I can try to explain, and possibly you can suggest something that
makes sense also to people not too involved in this.

There are quite some challenges here. This code is executed during the
boot process and the environment is pretty uncommon. Simply writing a
message is not that easy. We are not sure if we have VGA, serial, BIOS
or UEFI. We are not executing in the location code was compiled/linked
to run so assuming it is wrong and causes issue; in other word the
code/data should be position independent. This code is meant to be
compiled and run in 32 mode, however Xen is 64 bit, so compiler output
can't be linked to the final executable. And obviously you cannot call
64 bit code from 32 bit code. Even if code would be compiled and run
in 64 bit mode, calling functions like printk would probably crash (it
does, we discovered recently) as Xen code assumes some environment
settings (in case of printk, just as example, it was missing per-cpu
info leading to pointer to garbage). In 32 bit mode, you can get code
position independence with -fpic, but this requires linker to generate
GOT table but 64 bit linker would generate that table in a position
not compatible with 32 bit code (and that's not the only issue of
using 64 bit linker on 32 bit code). So, to solve this code/data is
linked to a 32 bit object and converted to binary (note: this is an
invariant, it was done like that before and after this commit). Solved
the code with -fpic, what about data? Say we have something like
"const char *message =3D "hello";"... a pointer is a pointer, which is
the location of the data pointed. But as said before, we are in an
uncommon environment where code/data could be run at a different
location than compiled/linked! There's no magic option for doing that,
so instead of hoping for the best (as we are doing at the moment) we
check to not have pointers. How? We link code+data at different
locations which will generate different binary in that case and we
compare the 2 binaries to make sure there are no such differences
(well, this is a simplification of the process).


So... somebody willing to translate the above, surely poor and
unclear, explanation is somethig digestible by people less involved in
it?

Frediano

