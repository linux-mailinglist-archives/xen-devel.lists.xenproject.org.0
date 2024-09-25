Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4456985790
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 13:03:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803841.1214665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stPnT-00069j-LF; Wed, 25 Sep 2024 11:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803841.1214665; Wed, 25 Sep 2024 11:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stPnT-000677-IN; Wed, 25 Sep 2024 11:03:03 +0000
Received: by outflank-mailman (input) for mailman id 803841;
 Wed, 25 Sep 2024 11:03:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mw3j=QX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1stPnS-00066x-8c
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 11:03:02 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba44c684-7b2d-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 13:03:00 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c42e7adbe0so7621931a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 04:03:00 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4c5157sm1725688a12.60.2024.09.25.04.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 04:02:58 -0700 (PDT)
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
X-Inumbo-ID: ba44c684-7b2d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727262180; x=1727866980; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1iKlygRZhEZzz54kWrhh++XdJGFa+ZKhyxVXwHZ7wg0=;
        b=D9bVVBbTrdu2A7HiUWbIw2skSkQDvIe5G+keW7T7azDa7UouF0OOmvmbHNmmmitnYc
         e8aVK5dtTnqBQodYg/MwDXgOaW339gVtoMsCC2aufv1PGUrLahg2TebaPnhnFhBcPj/j
         pe8FEYF4a0ZdR87HuJZ63Q0T9RYHjU228paTDIpq0ZsLMFx/POK5ZWPu1ISkeeddJAmr
         O1h/u/PkQDPFbn5+dRufANeGttWsSQKQXngp1J8+YfOpW1LJd2Q69U5hqIPhn18IPJ81
         hgTVwlNIPZJEuJ6oRjkP/3HR46ZyCP0o5w0xXUrIh5tQpOBewLLiCYfzV3FxMd2xdLlE
         u5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727262180; x=1727866980;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1iKlygRZhEZzz54kWrhh++XdJGFa+ZKhyxVXwHZ7wg0=;
        b=d9TtIK/F9A9lKq0ga3FJ/aWRrwWEZbFw4ga1O4y/fLFWEScXcRxQqmxCWZsRxReO8/
         IwYDQn+nxRqx/0KMQWPNklPrlBqkfc+b8i7MaoP8sF3Kvsjjxjy1y06FZ8cCWEAfIAe+
         vu94iiL93N7DBgYQi9f+qhWah2R0RQqn8athvo9K+ygGcYl2VtjYfyOr/IP/Sss+yC/v
         nwuJVvI1X94PeFfpEiM2iIm5B0kTv9HYViRfHy6MBkpmo77nGnuSP9Z7/3zXRfMqU2Lu
         CV2ALnVe3htPiMOhf/BJl404K3doFXUo68QfagcHkbrrkLBdv98iH120J6TOnmGbV2N3
         C8jg==
X-Forwarded-Encrypted: i=1; AJvYcCXiz4K5ZysoDriLgZ/6YLe4t6QfNzMID+bPpCkbU1CK+QzuHuID3q4adkTeknFoILDqnljOqDFPSVM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWVltOXJfMTZTkP3F3n/vzggKRoYMYUwUUzL1whLZ4keQKues5
	6awg1J1P+dvu0rD7ZovbOt6KjuDS+WZBJP/UmalmXQxE+LsKEe4sBe2LgA==
X-Google-Smtp-Source: AGHT+IFCgX7vmOxX7yhd4QtKkfHVLz2FFrtpAIt1zyfIew+TCr8QF9YoIiuI1be+UAbilMMI43+DoQ==
X-Received: by 2002:a05:6402:1e8d:b0:5be:d7d8:49ad with SMTP id 4fb4d7f45d1cf-5c72073e20emr1585173a12.22.1727262179198;
        Wed, 25 Sep 2024 04:02:59 -0700 (PDT)
Message-ID: <4ae840502ca2b60e0e46a1760e9170e1474b5c7e.camel@gmail.com>
Subject: Re: [PATCH v3 1/5] xen: define ACPI and DT device info sections
 macros
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2024 13:02:57 +0200
In-Reply-To: <82125953-99b5-4fde-83b8-51643cce793b@suse.com>
References: <cover.1727193766.git.oleksii.kurochko@gmail.com>
	 <7521839bd265e0520fc448adf50361d18dfe53df.1727193766.git.oleksii.kurochko@gmail.com>
	 <82125953-99b5-4fde-83b8-51643cce793b@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-09-25 at 10:36 +0200, Jan Beulich wrote:
> On 24.09.2024 18:42, Oleksii Kurochko wrote:
> > --- a/xen/include/xen/xen.lds.h
> > +++ b/xen/include/xen/xen.lds.h
> > @@ -114,6 +114,11 @@
> > =C2=A0
> > =C2=A0/* List of constructs other than *_SECTIONS in alphabetical order=
.
> > */
> > =C2=A0
> > +#define ADEV_INFO=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _asdevice =3D .;=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.adev.info)=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _aedevice =3D .;
> > +
> > =C2=A0#define BUGFRAMES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > =C2=A0=C2=A0=C2=A0=C2=A0 __start_bug_frames_0 =3D .;=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
> > =C2=A0=C2=A0=C2=A0=C2=A0 *(.bug_frames.0)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > @@ -131,6 +136,11 @@
> > =C2=A0=C2=A0=C2=A0=C2=A0 *(.bug_frames.3)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > =C2=A0=C2=A0=C2=A0=C2=A0 __stop_bug_frames_3 =3D .;
> > =C2=A0
> > +#define DT_DEV_INFO \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _sdevice =3D .; \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.dev.info)=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _edevice =3D .;
>=20
> I have a question more to the Arm maintainers than to you, Oleksii:
> Section
> names as well as the names of the symbols bounding the sections are
> overly
> unspecific. There's nothing indicating DT at all, and it's solely 'a'
> to
> indicate ACPI. I consider this a possible problem going forward, when
> this
> is now being generalized.
>=20
> In turn I wonder about ADEV_INFO when comparing with DT_DEV_INFO. The
> latter makes clear it's DT. The former doesn't make clear it's ACPI;
> 'A'
> could stand for about anything, including "a device" (of any kind).
>=20
> Finally, Oleksii, looking at Arm's present uses - why is the
> abstraction
> limited to the inner part of the section statements in the linker
> script?
I tried to abstract not only inner part of the section statements but
based on the comments to previous patch series, at least, I made an
abstraction not in the best way but I considered the comments as it
would be better to limit everything to the inner part.

> IOW why isn't it all (or at least quite a bit more) of
>=20
> =C2=A0 . =3D ALIGN(8);
> =C2=A0 .dev.info : {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _sdevice =3D .;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.dev.info)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _edevice =3D .;
> =C2=A0 } :text
>=20
> that moves into DT_DEV_INFO? I can see that the :text may want
> leaving
> to the architectures (yet then perhaps as a macro argument).
I prefer using a macro argument, but in this case (or a similar section
for ACPI), I think we could place the :text into common macros. If
someone needs to update the :text part in the future, it would be
better to introduce a macro argument when it becomes necessary as every
architecture uses :text for these sections.

>  I could
> also see a remote need for the ALIGN()'s value to be arch-controlled.
> (Why is it uniformly 8 anyway on Arm?)
I think it was done just to cover Arm32 and Arm64 alignment
requirements. Probably, POINTER_ALIGN hadn't been introduced before
this section was declared.
But it could align value could be make as macro argument.

>=20
> PPC's desire to use DECL_SECTION() can certainly be covered by
> providing
> a (trivial) DECL_SECTION() also for Arm and RISC-V. Seeing that even
> x86
> overrides the default to the trivial form for building xen.efi, I'm
> inclined to suggest we should actually have a way for an arch to
> indicate
> to xen.lds.h that it wants just the trivial form (avoiding a later
> #undef).
In the first version I wanted to introduce the following:
   #ifndef USE_TRIVIAL_DECL_SECTION
  =20
   #ifdef CONFIG_LD_IS_GNU
   # define DECL_SECTION(x) x : AT(ADDR(#x) - __XEN_VIRT_START)
   #else
   # define DECL_SECTION(x) x : AT(ADDR(x) - __XEN_VIRT_START)
   #endif
  =20
   #else /* USE_TRIVIAL_DECL_SECTION
   # define DECL_SECTION(x) x :
   #endif
But I decided that it would be too much just to make ACPI_DEV_INFO and
DT_DEV_INFO more abstract and that was the reason why I had another
macro argument for DT_DEV_INFO() to abstract the usage of DECL_SECTION:
+#define USE_DECL_SECTION(x) DECL_SECTION(x)
+
+#define NOUSE_DECL_SECTION(x) x :
+
+#define ACPI_DEV_INFO_SEC(secname, DECL_SECTION_MACROS_NAME)\
+    DECL_SECTION_MACROS_NAME(secname) {                     \
+      _asdevice =3D .;                                        \
+      *(secname)                                            \
+      _aedevice =3D .;                                        \
+    } :text

>=20
> When to be generalized I further wonder whether the ALIGN()s are
> actually
> well placed. I'd have expected
>=20
> =C2=A0 .dev.info ALIGN(POINTER_ALIGN) : {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _sdevice =3D .;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.dev.info)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _edevice =3D .;
> =C2=A0 } :text
But in case of PPC which is using DECL_SECTION then shouldn't
DECL_SECTION macros have an align value as a macro argument?


Considering everything what was said above could we consider the
updated version of the initial abstraction for DT_DEV_INFO section (
and the similar for ACPI dev info )?
   +#define DT_DEV_INFO_SEC(secname)  \
   +    DECL_SECTION(secname) {       \
   +      _sdevice =3D .;               \
   +      *(secname)                  \
   +      _edevice =3D .;               \
   +    } :text

Or alignment could be also inside the macros:
 (if Arm is okay with using POINTER_ALIGN instead of 8 ):
   +#define DT_DEV_INFO_SEC(secname)  \
   +    . =3D ALIGN(POINTER_ALIGN)      \
   +    DECL_SECTION(secname) {       \
   +      _sdevice =3D .;               \
   +      *(secname)                  \
   +      _edevice =3D .;               \
   +    } :text
 ( or if Arm isn't okay ):
   +#define DT_DEV_INFO_SEC(secname, align)  \
   +    . =3D ALIGN(align)              \
   +    DECL_SECTION(secname) {       \
   +      _sdevice =3D .;               \
   +      *(secname)                  \
   +      _edevice =3D .;               \
   +    } :text


~ Oleksii

