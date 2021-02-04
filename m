Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9075D30F3E5
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 14:30:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81300.150019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7ei1-0001wt-M2; Thu, 04 Feb 2021 13:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81300.150019; Thu, 04 Feb 2021 13:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7ei1-0001wU-Il; Thu, 04 Feb 2021 13:30:09 +0000
Received: by outflank-mailman (input) for mailman id 81300;
 Thu, 04 Feb 2021 13:30:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gi2U=HG=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l7ei0-0001wP-26
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 13:30:08 +0000
Received: from mail-wm1-x32f.google.com (unknown [2a00:1450:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23cb9d6f-2c9a-4a5f-8414-eae2d14b12a3;
 Thu, 04 Feb 2021 13:30:05 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id m1so3001844wml.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Feb 2021 05:30:04 -0800 (PST)
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
X-Inumbo-ID: 23cb9d6f-2c9a-4a5f-8414-eae2d14b12a3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mmsArc9oeZABtX7/wQSk8VFRxMuFAKbD7as/N6J0WOw=;
        b=b7Y+2RA7QPCIO6c+//EbpZoeaUcdLqV3aTvIGy7z587ktTUhZ2KJSfKmKLemU974Or
         i43RXqgMMEuIv8Mv0oEstJV3wXNUu9oQNEyNr9htUcEPJzXeyqd/hauTmbuSuSfxhytA
         6idjsfzk87lS/AeqID9JA2loMePSu7r1qhVI4hjx2cw3IW27Dz6+c73JyaIHyZLe9o04
         ki870UihxVB1ZUbpNCC42u0yDPx5MK01qMQjx2XL2o74GILfDOhtexjHiktN98jxp3sP
         fSeGFfCHEchSYv3340D8GvHFXxpMJ4qCAxC4/p4MJPV0rfpYiU4K9ncsjSVUxMeAPiPL
         c8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mmsArc9oeZABtX7/wQSk8VFRxMuFAKbD7as/N6J0WOw=;
        b=SkjF1H+KHURwyvLR7DBYgXi5PJAAnyJ0YRm6knBY60aJsQESgdyLhsa5vNLut0Vsda
         mjJQe+LZaIjFduLn6NpMbDjhbTuGLgbvapGLM+A9IUyPaA8yAodJTjXBX0kIm6FfltZw
         HPDX4KgCFoT7tAFUvX7z0ABc67jh75kYR4yxCBSyx/H/K21xVfkuy74OrWfHp+yIqI/i
         DpaPTmH7avU3WtPbosZtDRpFJzl3vWpm5O5SkN+dJyivPSoGZt3rvg+00MW1yTB6YCFi
         J4VZNgd+fdaVpj7jI2RQP4ql8vLYtYaknPFSmDh3V+XAu8SYdy7tutkFpb3zy/8Fvjx2
         eVzA==
X-Gm-Message-State: AOAM531gJJkRCLyyYZLHbFWfHzYbThjo8kqnq5q78C2+Ois+HhdNpE9l
	jQuJ/hdx/OWj2f/qA+hKu8XvqfisOQG5kMIKWM8=
X-Google-Smtp-Source: ABdhPJxWgXqmG4uWbX55w8z+9aw5rZpjSiF1AMmkjYR8Hz1F+tW3/7djSThqlnmj1uvkYxKgj4RH5oyCpaMUm1m9jlk=
X-Received: by 2002:a7b:cd8e:: with SMTP id y14mr7693955wmj.61.1612445404100;
 Thu, 04 Feb 2021 05:30:04 -0800 (PST)
MIME-Version: 1.0
References: <20210202190937.30206-1-andrew.cooper3@citrix.com>
In-Reply-To: <20210202190937.30206-1-andrew.cooper3@citrix.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Thu, 4 Feb 2021 15:29:52 +0200
Message-ID: <CAPD2p-nPr_OD7cMT-Ny6vyGsY4nMXuENgrqv0pfYRYtE5srnkQ@mail.gmail.com>
Subject: Re: [PATCH for-4.15] tools/tests: Introduce a test for acquire_resource
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, 
	Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/alternative; boundary="00000000000087fd7105ba82b332"

--00000000000087fd7105ba82b332
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew.
[Sorry for the possible format issues]

On Tue, Feb 2, 2021 at 9:10 PM Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> For now, simply try to map 40 frames of grant table.  This catches most o=
f
> the
> basic errors with resource sizes found and fixed through the 4.15 dev
> window.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Wei Liu <wl@xen.org>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Oleksandr <olekstysh@gmail.com>
>
> Fails against current staging:
>
>   XENMEM_acquire_resource tests
>   Test x86 PV
>     d7: grant table
>       Fail: Map 7 - Argument list too long
>   Test x86 PVH
>     d8: grant table
>       Fail: Map 7 - Argument list too long
>
> The fix has already been posted:
>   [PATCH v9 01/11] xen/memory: Fix mapping grant tables with
> XENMEM_acquire_resource
>
> and the fixed run is:
>
>   XENMEM_acquire_resource tests
>   Test x86 PV
>     d7: grant table
>   Test x86 PVH
>     d8: grant table
>
> ARM folk: would you mind testing this?  I'm pretty sure the create
> parameters
> are suitable, but I don't have any way to test this.
>
Yes, as it was agreed on IRC, I will test this today's evening and inform
about the results)



>
> I've got more plans for this, but insufficient time right now.
> ---
>  tools/tests/Makefile                 |   1 +
>  tools/tests/resource/.gitignore      |   1 +
>  tools/tests/resource/Makefile        |  40 ++++++++++
>  tools/tests/resource/test-resource.c | 138
> +++++++++++++++++++++++++++++++++++
>  4 files changed, 180 insertions(+)
>  create mode 100644 tools/tests/resource/.gitignore
>  create mode 100644 tools/tests/resource/Makefile
>  create mode 100644 tools/tests/resource/test-resource.c
>
> diff --git a/tools/tests/Makefile b/tools/tests/Makefile
> index fc9b715951..c45b5fbc1d 100644
> --- a/tools/tests/Makefile
> +++ b/tools/tests/Makefile
> @@ -2,6 +2,7 @@ XEN_ROOT =3D $(CURDIR)/../..
>  include $(XEN_ROOT)/tools/Rules.mk
>
>  SUBDIRS-y :=3D
> +SUBDIRS-y :=3D resource
>  SUBDIRS-$(CONFIG_X86) +=3D cpu-policy
>  SUBDIRS-$(CONFIG_X86) +=3D mce-test
>  ifneq ($(clang),y)
> diff --git a/tools/tests/resource/.gitignore
> b/tools/tests/resource/.gitignore
> new file mode 100644
> index 0000000000..4872e97d4b
> --- /dev/null
> +++ b/tools/tests/resource/.gitignore
> @@ -0,0 +1 @@
> +test-resource
> diff --git a/tools/tests/resource/Makefile b/tools/tests/resource/Makefil=
e
> new file mode 100644
> index 0000000000..8a3373e786
> --- /dev/null
> +++ b/tools/tests/resource/Makefile
> @@ -0,0 +1,40 @@
> +XEN_ROOT =3D $(CURDIR)/../../..
> +include $(XEN_ROOT)/tools/Rules.mk
> +
> +TARGET :=3D test-resource
> +
> +.PHONY: all
> +all: $(TARGET)
> +
> +.PHONY: run
> +run: $(TARGET)
> +       ./$(TARGET)
> +
> +.PHONY: clean
> +clean:
> +       $(RM) -f -- *.o .*.d .*.d2 $(TARGET)
> +
> +.PHONY: distclean
> +distclean: clean
> +       $(RM) -f -- *~
> +
> +.PHONY: install
> +install: all
> +
> +.PHONY: uninstall
> +uninstall:
> +
> +CFLAGS +=3D -Werror -D__XEN_TOOLS__
> +CFLAGS +=3D $(CFLAGS_xeninclude)
> +CFLAGS +=3D $(CFLAGS_libxenctrl)
> +CFLAGS +=3D $(CFLAGS_libxenforeginmemory)
> +CFLAGS +=3D $(APPEND_CFLAGS)
> +
> +LDFLAGS +=3D $(LDLIBS_libxenctrl)
> +LDFLAGS +=3D $(LDLIBS_libxenforeignmemory)
> +LDFLAGS +=3D $(APPEND_LDFLAGS)
> +
> +test-resource: test-resource.o
> +       $(CC) $(LDFLAGS) -o $@ $<
> +
> +-include $(DEPS_INCLUDE)
> diff --git a/tools/tests/resource/test-resource.c
> b/tools/tests/resource/test-resource.c
> new file mode 100644
> index 0000000000..81a2a5cd12
> --- /dev/null
> +++ b/tools/tests/resource/test-resource.c
> @@ -0,0 +1,138 @@
> +#include <err.h>
> +#include <errno.h>
> +#include <error.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/mman.h>
> +
> +#include <xenctrl.h>
> +#include <xenforeignmemory.h>
> +#include <xendevicemodel.h>
> +#include <xen-tools/libs.h>
> +
> +static unsigned int nr_failures;
> +#define fail(fmt, ...)                          \
> +({                                              \
> +    nr_failures++;                              \
> +    (void)printf(fmt, ##__VA_ARGS__);           \
> +})
> +
> +static xc_interface *xch;
> +static xenforeignmemory_handle *fh;
> +static xendevicemodel_handle *dh;
> +
> +static void test_gnttab(uint32_t domid, unsigned int nr_frames)
> +{
> +    xenforeignmemory_resource_handle *res;
> +    void *addr =3D NULL;
> +    size_t size;
> +    int rc;
> +
> +    printf("  d%u: grant table\n", domid);
> +
> +    rc =3D xenforeignmemory_resource_size(
> +        fh, domid, XENMEM_resource_grant_table,
> +        XENMEM_resource_grant_table_id_shared, &size);
> +    if ( rc )
> +        return fail("    Fail: Get size: %d - %s\n", errno,
> strerror(errno));
> +
> +    if ( (size >> XC_PAGE_SHIFT) !=3D nr_frames )
> +        return fail("    Fail: Get size: expected %u frames, got %zu\n",
> +                    nr_frames, size >> XC_PAGE_SHIFT);
> +
> +    res =3D xenforeignmemory_map_resource(
> +        fh, domid, XENMEM_resource_grant_table,
> +        XENMEM_resource_grant_table_id_shared, 0, size >> XC_PAGE_SHIFT,
> +        &addr, PROT_READ | PROT_WRITE, 0);
> +    if ( !res )
> +        return fail("    Fail: Map %d - %s\n", errno, strerror(errno));
> +
> +    rc =3D xenforeignmemory_unmap_resource(fh, res);
> +    if ( rc )
> +        return fail("    Fail: Unmap %d - %s\n", errno, strerror(errno))=
;
> +}
> +
> +static void test_domain_configurations(void)
> +{
> +    static struct test {
> +        const char *name;
> +        struct xen_domctl_createdomain create;
> +    } tests[] =3D {
> +#if defined(__x86_64__) || defined(__i386__)
> +        {
> +            .name =3D "x86 PV",
> +            .create =3D {
> +                .max_vcpus =3D 2,
> +                .max_grant_frames =3D 40,
> +            },
> +        },
> +        {
> +            .name =3D "x86 PVH",
> +            .create =3D {
> +                .flags =3D XEN_DOMCTL_CDF_hvm,
> +                .max_vcpus =3D 2,
> +                .max_grant_frames =3D 40,
> +                .arch =3D {
> +                    .emulation_flags =3D XEN_X86_EMU_LAPIC,
> +                },
> +            },
> +        },
> +#elif defined(__aarch64__) || defined(__arm__)
> +        {
> +            .name =3D "ARM",
> +            .create =3D {
> +                .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> +                .max_vcpus =3D 2,
> +                .max_grant_frames =3D 40,
> +            },
> +        },
> +#endif
> +    };
> +
> +    for ( unsigned int i =3D 0; i < ARRAY_SIZE(tests); ++i )
> +    {
> +        struct test *t =3D &tests[i];
> +        uint32_t domid =3D 0;
> +        int rc;
> +
> +        printf("Test %s\n", t->name);
> +
> +        rc =3D xc_domain_create(xch, &domid, &t->create);
> +        if ( rc )
> +        {
> +            if ( errno =3D=3D EINVAL || errno =3D=3D EOPNOTSUPP )
> +                printf("  Skip: %d - %s\n", errno, strerror(errno));
> +            else
> +                fail("  Domain create failure: %d - %s\n",
> +                     errno, strerror(errno));
> +            continue;
> +        }
> +
> +        test_gnttab(domid, t->create.max_grant_frames);
> +
> +        rc =3D xc_domain_destroy(xch, domid);
> +        if ( rc )
> +            fail("  Failed to destroy domain: %d - %s\n",
> +                 errno, strerror(errno));
> +    }
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    printf("XENMEM_acquire_resource tests\n");
> +
> +    xch =3D xc_interface_open(NULL, NULL, 0);
> +    fh =3D xenforeignmemory_open(NULL, 0);
> +    dh =3D xendevicemodel_open(NULL, 0);
> +
> +    if ( !xch )
> +        err(1, "xc_interface_open");
> +    if ( !fh )
> +        err(1, "xenforeignmemory_open");
> +    if ( !dh )
> +        err(1, "xendevicemodel_open");
> +
> +    test_domain_configurations();
> +
> +    return !!nr_failures;
> +}
> --
> 2.11.0
>
>

--=20
Regards,

Oleksandr Tyshchenko

--00000000000087fd7105ba82b332
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div>Hi Andrew.</div><div>[Sorr=
y for the possible format issues]</div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 2, 2021 at 9:10 PM Andrew Coop=
er &lt;<a href=3D"mailto:andrew.cooper3@citrix.com">andrew.cooper3@citrix.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">For now, simply try to map 40 frames of grant table.=C2=A0 This catches m=
ost of the<br>
basic errors with resource sizes found and fixed through the 4.15 dev windo=
w.<br>
<br>
Signed-off-by: Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.co=
m" target=3D"_blank">andrew.cooper3@citrix.com</a>&gt;<br>
---<br>
CC: Ian Jackson &lt;<a href=3D"mailto:iwj@xenproject.org" target=3D"_blank"=
>iwj@xenproject.org</a>&gt;<br>
CC: Wei Liu &lt;<a href=3D"mailto:wl@xen.org" target=3D"_blank">wl@xen.org<=
/a>&gt;<br>
CC: Jan Beulich &lt;<a href=3D"mailto:JBeulich@suse.com" target=3D"_blank">=
JBeulich@suse.com</a>&gt;<br>
CC: Roger Pau Monn=C3=A9 &lt;<a href=3D"mailto:roger.pau@citrix.com" target=
=3D"_blank">roger.pau@citrix.com</a>&gt;<br>
CC: Wei Liu &lt;<a href=3D"mailto:wl@xen.org" target=3D"_blank">wl@xen.org<=
/a>&gt;<br>
CC: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
CC: Julien Grall &lt;<a href=3D"mailto:julien@xen.org" target=3D"_blank">ju=
lien@xen.org</a>&gt;<br>
CC: Volodymyr Babchuk &lt;<a href=3D"mailto:Volodymyr_Babchuk@epam.com" tar=
get=3D"_blank">Volodymyr_Babchuk@epam.com</a>&gt;<br>
CC: Oleksandr &lt;<a href=3D"mailto:olekstysh@gmail.com" target=3D"_blank">=
olekstysh@gmail.com</a>&gt;<br>
<br>
Fails against current staging:<br>
<br>
=C2=A0 XENMEM_acquire_resource tests<br>
=C2=A0 Test x86 PV<br>
=C2=A0 =C2=A0 d7: grant table<br>
=C2=A0 =C2=A0 =C2=A0 Fail: Map 7 - Argument list too long<br>
=C2=A0 Test x86 PVH<br>
=C2=A0 =C2=A0 d8: grant table<br>
=C2=A0 =C2=A0 =C2=A0 Fail: Map 7 - Argument list too long<br>
<br>
The fix has already been posted:<br>
=C2=A0 [PATCH v9 01/11] xen/memory: Fix mapping grant tables with XENMEM_ac=
quire_resource<br>
<br>
and the fixed run is:<br>
<br>
=C2=A0 XENMEM_acquire_resource tests<br>
=C2=A0 Test x86 PV<br>
=C2=A0 =C2=A0 d7: grant table<br>
=C2=A0 Test x86 PVH<br>
=C2=A0 =C2=A0 d8: grant table<br>
<br>
ARM folk: would you mind testing this?=C2=A0 I&#39;m pretty sure the create=
 parameters<br>
are suitable, but I don&#39;t have any way to test this.<br></blockquote><d=
iv>Yes, as it was agreed on IRC, I will test this today&#39;s evening and i=
nform about the results)</div><div><br></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
I&#39;ve got more plans for this, but insufficient time right now.<br>
---<br>
=C2=A0tools/tests/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0tools/tests/resource/.gitignore=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +=
<br>
=C2=A0tools/tests/resource/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 40 +=
+++++++++<br>
=C2=A0tools/tests/resource/test-resource.c | 138 ++++++++++++++++++++++++++=
+++++++++<br>
=C2=A04 files changed, 180 insertions(+)<br>
=C2=A0create mode 100644 tools/tests/resource/.gitignore<br>
=C2=A0create mode 100644 tools/tests/resource/Makefile<br>
=C2=A0create mode 100644 tools/tests/resource/test-resource.c<br>
<br>
diff --git a/tools/tests/Makefile b/tools/tests/Makefile<br>
index fc9b715951..c45b5fbc1d 100644<br>
--- a/tools/tests/Makefile<br>
+++ b/tools/tests/Makefile<br>
@@ -2,6 +2,7 @@ XEN_ROOT =3D $(CURDIR)/../..<br>
=C2=A0include $(XEN_ROOT)/tools/Rules.mk<br>
<br>
=C2=A0SUBDIRS-y :=3D<br>
+SUBDIRS-y :=3D resource<br>
=C2=A0SUBDIRS-$(CONFIG_X86) +=3D cpu-policy<br>
=C2=A0SUBDIRS-$(CONFIG_X86) +=3D mce-test<br>
=C2=A0ifneq ($(clang),y)<br>
diff --git a/tools/tests/resource/.gitignore b/tools/tests/resource/.gitign=
ore<br>
new file mode 100644<br>
index 0000000000..4872e97d4b<br>
--- /dev/null<br>
+++ b/tools/tests/resource/.gitignore<br>
@@ -0,0 +1 @@<br>
+test-resource<br>
diff --git a/tools/tests/resource/Makefile b/tools/tests/resource/Makefile<=
br>
new file mode 100644<br>
index 0000000000..8a3373e786<br>
--- /dev/null<br>
+++ b/tools/tests/resource/Makefile<br>
@@ -0,0 +1,40 @@<br>
+XEN_ROOT =3D $(CURDIR)/../../..<br>
+include $(XEN_ROOT)/tools/Rules.mk<br>
+<br>
+TARGET :=3D test-resource<br>
+<br>
+.PHONY: all<br>
+all: $(TARGET)<br>
+<br>
+.PHONY: run<br>
+run: $(TARGET)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0./$(TARGET)<br>
+<br>
+.PHONY: clean<br>
+clean:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(RM) -f -- *.o .*.d .*.d2 $(TARGET)<br>
+<br>
+.PHONY: distclean<br>
+distclean: clean<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(RM) -f -- *~<br>
+<br>
+.PHONY: install<br>
+install: all<br>
+<br>
+.PHONY: uninstall<br>
+uninstall:<br>
+<br>
+CFLAGS +=3D -Werror -D__XEN_TOOLS__<br>
+CFLAGS +=3D $(CFLAGS_xeninclude)<br>
+CFLAGS +=3D $(CFLAGS_libxenctrl)<br>
+CFLAGS +=3D $(CFLAGS_libxenforeginmemory)<br>
+CFLAGS +=3D $(APPEND_CFLAGS)<br>
+<br>
+LDFLAGS +=3D $(LDLIBS_libxenctrl)<br>
+LDFLAGS +=3D $(LDLIBS_libxenforeignmemory)<br>
+LDFLAGS +=3D $(APPEND_LDFLAGS)<br>
+<br>
+test-resource: test-resource.o<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $(LDFLAGS) -o $@ $&lt;<br>
+<br>
+-include $(DEPS_INCLUDE)<br>
diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/te=
st-resource.c<br>
new file mode 100644<br>
index 0000000000..81a2a5cd12<br>
--- /dev/null<br>
+++ b/tools/tests/resource/test-resource.c<br>
@@ -0,0 +1,138 @@<br>
+#include &lt;err.h&gt;<br>
+#include &lt;errno.h&gt;<br>
+#include &lt;error.h&gt;<br>
+#include &lt;stdio.h&gt;<br>
+#include &lt;string.h&gt;<br>
+#include &lt;sys/mman.h&gt;<br>
+<br>
+#include &lt;xenctrl.h&gt;<br>
+#include &lt;xenforeignmemory.h&gt;<br>
+#include &lt;xendevicemodel.h&gt;<br>
+#include &lt;xen-tools/libs.h&gt;<br>
+<br>
+static unsigned int nr_failures;<br>
+#define fail(fmt, ...)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+({=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 nr_failures++;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 (void)printf(fmt, ##__VA_ARGS__);=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0\<br>
+})<br>
+<br>
+static xc_interface *xch;<br>
+static xenforeignmemory_handle *fh;<br>
+static xendevicemodel_handle *dh;<br>
+<br>
+static void test_gnttab(uint32_t domid, unsigned int nr_frames)<br>
+{<br>
+=C2=A0 =C2=A0 xenforeignmemory_resource_handle *res;<br>
+=C2=A0 =C2=A0 void *addr =3D NULL;<br>
+=C2=A0 =C2=A0 size_t size;<br>
+=C2=A0 =C2=A0 int rc;<br>
+<br>
+=C2=A0 =C2=A0 printf(&quot;=C2=A0 d%u: grant table\n&quot;, domid);<br>
+<br>
+=C2=A0 =C2=A0 rc =3D xenforeignmemory_resource_size(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fh, domid, XENMEM_resource_grant_table,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 XENMEM_resource_grant_table_id_shared, &amp;si=
ze);<br>
+=C2=A0 =C2=A0 if ( rc )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return fail(&quot;=C2=A0 =C2=A0 Fail: Get size=
: %d - %s\n&quot;, errno, strerror(errno));<br>
+<br>
+=C2=A0 =C2=A0 if ( (size &gt;&gt; XC_PAGE_SHIFT) !=3D nr_frames )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return fail(&quot;=C2=A0 =C2=A0 Fail: Get size=
: expected %u frames, got %zu\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nr_f=
rames, size &gt;&gt; XC_PAGE_SHIFT);<br>
+<br>
+=C2=A0 =C2=A0 res =3D xenforeignmemory_map_resource(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fh, domid, XENMEM_resource_grant_table,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 XENMEM_resource_grant_table_id_shared, 0, size=
 &gt;&gt; XC_PAGE_SHIFT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;addr, PROT_READ | PROT_WRITE, 0);<br>
+=C2=A0 =C2=A0 if ( !res )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return fail(&quot;=C2=A0 =C2=A0 Fail: Map %d -=
 %s\n&quot;, errno, strerror(errno));<br>
+<br>
+=C2=A0 =C2=A0 rc =3D xenforeignmemory_unmap_resource(fh, res);<br>
+=C2=A0 =C2=A0 if ( rc )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return fail(&quot;=C2=A0 =C2=A0 Fail: Unmap %d=
 - %s\n&quot;, errno, strerror(errno));<br>
+}<br>
+<br>
+static void test_domain_configurations(void)<br>
+{<br>
+=C2=A0 =C2=A0 static struct test {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct xen_domctl_createdomain create;<br>
+=C2=A0 =C2=A0 } tests[] =3D {<br>
+#if defined(__x86_64__) || defined(__i386__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;x86 PV&quot;,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .create =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_vcpus =3D 2,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_grant_frames =
=3D 40,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;x86 PVH&quot;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .create =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D XEN_DOM=
CTL_CDF_hvm,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_vcpus =3D 2,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_grant_frames =
=3D 40,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arch =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .emu=
lation_flags =3D XEN_X86_EMU_LAPIC,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+#elif defined(__aarch64__) || defined(__arm__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;ARM&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .create =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D XEN_DOM=
CTL_CDF_hvm | XEN_DOMCTL_CDF_hap,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_vcpus =3D 2,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_grant_frames =
=3D 40,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+#endif<br>
+=C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 for ( unsigned int i =3D 0; i &lt; ARRAY_SIZE(tests); ++i )<=
br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct test *t =3D &amp;tests[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t domid =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int rc;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Test %s\n&quot;, t-&gt;name);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D xc_domain_create(xch, &amp;domid, &amp;=
t-&gt;create);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( rc )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( errno =3D=3D EINVAL || errn=
o =3D=3D EOPNOTSUPP )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;=C2=
=A0 Skip: %d - %s\n&quot;, errno, strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fail(&quot;=C2=A0 =
Domain create failure: %d - %s\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0errno, strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_gnttab(domid, t-&gt;create.max_grant_fram=
es);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D xc_domain_destroy(xch, domid);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( rc )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fail(&quot;=C2=A0 Failed to dest=
roy domain: %d - %s\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno, strer=
ror(errno));<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+int main(int argc, char **argv)<br>
+{<br>
+=C2=A0 =C2=A0 printf(&quot;XENMEM_acquire_resource tests\n&quot;);<br>
+<br>
+=C2=A0 =C2=A0 xch =3D xc_interface_open(NULL, NULL, 0);<br>
+=C2=A0 =C2=A0 fh =3D xenforeignmemory_open(NULL, 0);<br>
+=C2=A0 =C2=A0 dh =3D xendevicemodel_open(NULL, 0);<br>
+<br>
+=C2=A0 =C2=A0 if ( !xch )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 err(1, &quot;xc_interface_open&quot;);<br>
+=C2=A0 =C2=A0 if ( !fh )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 err(1, &quot;xenforeignmemory_open&quot;);<br>
+=C2=A0 =C2=A0 if ( !dh )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 err(1, &quot;xendevicemodel_open&quot;);<br>
+<br>
+=C2=A0 =C2=A0 test_domain_configurations();<br>
+<br>
+=C2=A0 =C2=A0 return !!nr_failures;<br>
+}<br>
-- <br>
2.11.0<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><font size=
=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Reg=
ards,</span></font></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"=
><div><span style=3D"background-color:rgb(255,255,255)"><font size=3D"2">Ol=
eksandr Tyshchenko</font></span></div></div></div></div></div></div></div><=
/div>

--00000000000087fd7105ba82b332--

