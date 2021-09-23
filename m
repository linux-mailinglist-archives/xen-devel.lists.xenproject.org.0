Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4217E41555E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 04:07:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193266.344242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTE92-00013a-Em; Thu, 23 Sep 2021 02:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193266.344242; Thu, 23 Sep 2021 02:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTE92-00011X-9s; Thu, 23 Sep 2021 02:07:28 +0000
Received: by outflank-mailman (input) for mailman id 193266;
 Thu, 23 Sep 2021 02:07:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nnny=ON=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1mTE90-00011R-SF
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 02:07:26 +0000
Received: from mail-ed1-x52f.google.com (unknown [2a00:1450:4864:20::52f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc4d5898-ac11-42db-af2f-d7a0c487c853;
 Thu, 23 Sep 2021 02:07:25 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id y89so6797781ede.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Sep 2021 19:07:24 -0700 (PDT)
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
X-Inumbo-ID: fc4d5898-ac11-42db-af2f-d7a0c487c853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cdt1FGOHqROmUnm/Tq+/DCK4YuTmqt2i34HvBS17N7w=;
        b=Tk8VTmS5FNlQpN6WIjCAkZ0wHSkkHGxyGTdy8w+0R8nxGHGVQM78BrLmOLfb3Jpo2N
         Ip49RSH8Zf2rX89whOuQ1XnE6j869JZW+UVDc7/MRgqP9Az5L4VSuR/JDpR3PT5/e3HN
         83mcTMUry2rWN4i137e/6ZWyJD0uxuE43lE2cqzM2K5dXDefT152YvZzTzdACG2k7gIh
         HnzgxNWO9yJ/7fHffgQF2z2CYd3rTJvO/oGA6Os7w7G6dXtTfvMSBmgLmiIQc4RWwrag
         y2hTDQkoRRgK+mI7eNA991Zk0rJOwNUcXZzWSJFU5oxFna449U03xEavFLfs0665oxiW
         vpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cdt1FGOHqROmUnm/Tq+/DCK4YuTmqt2i34HvBS17N7w=;
        b=6T746zjrX1TxLs+nlQ3pr5wd8uFPTTOfSr6ea8IQWkld4wGzi4ktW4g6O8DSsD3LH0
         wpLLAj/lLBID8bKHI25JwWi1tRX4pOIOCE9iwtp/u8ccd/aS2YLRu8sYSar3CNHTcAdV
         8ggJPe95WD9b66oA06AsypD46eU+AVQ1zlBRzMds2YbLcnK9Itqhxc9m7qY2KRMqMf4E
         l+39xQBndDIxzENClBlAOStuBJftKrz7zfmGUHVnVCyCKXThoXd/BmWV2Wgdfj+etnBk
         P8+c+EsYSNe59gEbs5ykiEyHzpao2Enz2SgawTiXOlNTJqwtSFqJ0FZLjrXZi+TeXC64
         LByA==
X-Gm-Message-State: AOAM532zZ4iKAtku0K348eucJvGuLByB4te3XNgRcAxclTzhVEPNAbUc
	M/G5OZtYQvz/AcWYoJ6ip6N6atG1KulVgZjIN3o=
X-Google-Smtp-Source: ABdhPJzTciH6flz/xE6K5fQlnGD/ZOmH1G2TM81wrTKkKCLDKt8EqIzKsjMk9gIJ/SFviH7ch1/sieFFjoN7Jys61N8=
X-Received: by 2002:a50:cf41:: with SMTP id d1mr2707716edk.219.1632362843954;
 Wed, 22 Sep 2021 19:07:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1632307952.git.rahul.singh@arm.com> <b6a9c007061f963332af63da544e5031e18a7850.1632307952.git.rahul.singh@arm.com>
In-Reply-To: <b6a9c007061f963332af63da544e5031e18a7850.1632307952.git.rahul.singh@arm.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 23 Sep 2021 07:07:12 +0500
Message-ID: <CAJ=z9a32OsxxMbPnOEO4cEJweiBkF61U0niZDX2Z77gv+-zAQQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/17] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled
To: Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Andre Przywara <andre.przywara@arm.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/alternative; boundary="00000000000075605e05cca017ec"

--00000000000075605e05cca017ec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 22 Sep 2021, 16:36 Rahul Singh, <rahul.singh@arm.com> wrote:

> Compilation error is observed when HAS_PCI is enabled for ARM
> architecture.


In general, when I read "compilation error" I interpret as a user can
trigger it in the current staging.

However, without the full series applied, HAS_PCI cannot be selected on Arm=
.

So I think the message is a bit misleading because this is more
implementing stubs to enable a feature rather than fixing compilation
errors (AFAICT all of them are not fixed here).

How about the following commit message:

xen/arm: pci: Add stubs to allow selecting HAS_PCI

In a follow-up we will enable PCI support in Xen on Arm (i.e select
HAS_PCI).

The generic code expects the arch to implement a few functions:

<List the functions>

Note that this is not yet sufficient to enable HAS_PCI and will be
addressed in follow-ups.


> Add definition for arch_iommu_use_permitted() and
> arch_pci_clean_pirqs().
>
> pci.c: In function =E2=80=98deassign_device=E2=80=99:
> pci.c:849:49: error: implicit declaration of function =E2=80=98pci_to_dev=
=E2=80=99;
> did you mean =E2=80=98dt_to_dev=E2=80=99? [-Werror=3Dimplicit-function-de=
claration]
>             pci_to_dev(pdev));
> pci.c:880: undefined reference to `arch_pci_clean_pirqs=E2=80=99
> pci.c:1392: undefined reference to `arch_iommu_use_permitted'
>
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Change in v2:
> - Remove pci_conf_read*(..) dummy implementation
> - Add in code comment for arch_pci_clean_pirqs() and
> arch_iommu_use_permitted()
> - Fixed minor comments
> ---
>  xen/arch/arm/Makefile               |  1 +
>  xen/arch/arm/pci/Makefile           |  1 +
>  xen/arch/arm/pci/pci.c              | 33 +++++++++++++++++++++++++++++
>  xen/drivers/passthrough/arm/iommu.c |  9 ++++++++
>  xen/include/asm-arm/pci.h           | 31 ++++++++++++++++++++++++---
>  5 files changed, 72 insertions(+), 3 deletions(-)
>  create mode 100644 xen/arch/arm/pci/Makefile
>  create mode 100644 xen/arch/arm/pci/pci.c
>
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 3d3b97b5b4..44d7cc81fa 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -2,6 +2,7 @@ obj-$(CONFIG_ARM_32) +=3D arm32/
>  obj-$(CONFIG_ARM_64) +=3D arm64/
>  obj-$(CONFIG_ARM_64) +=3D efi/
>  obj-$(CONFIG_ACPI) +=3D acpi/
> +obj-$(CONFIG_HAS_PCI) +=3D pci/
>  ifneq ($(CONFIG_NO_PLAT),y)
>  obj-y +=3D platforms/
>  endif
> diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
> new file mode 100644
> index 0000000000..a98035df4c
> --- /dev/null
> +++ b/xen/arch/arm/pci/Makefile
> @@ -0,0 +1 @@
> +obj-y +=3D pci.o
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> new file mode 100644
> index 0000000000..a7a7bc3213
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci.c
> @@ -0,0 +1,33 @@
> +/*
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <xen/pci.h>
> +
> +/*
> + * PIRQ event channels are not supported on Arm, so nothing to do.
> + */
> +int arch_pci_clean_pirqs(struct domain *d)
> +{
> +    return 0;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/drivers/passthrough/arm/iommu.c
> b/xen/drivers/passthrough/arm/iommu.c
> index db3b07a571..ee653a9c48 100644
> --- a/xen/drivers/passthrough/arm/iommu.c
> +++ b/xen/drivers/passthrough/arm/iommu.c
> @@ -135,3 +135,12 @@ void arch_iommu_domain_destroy(struct domain *d)
>  void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>  {
>  }
> +
> +/*
> + * Unlike x86, Arm doesn't support mem-sharing, mem-paging and log-dirty
> (yet).
> + * So there is no restriction to use the IOMMU.
> + */
> +bool arch_iommu_use_permitted(const struct domain *d)
> +{
> +    return true;
> +}
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index de13359f65..7dd9eb3dba 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -1,7 +1,32 @@
> -#ifndef __X86_PCI_H__
> -#define __X86_PCI_H__
> +/*
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
>
> +#ifndef __ARM_PCI_H__
> +#define __ARM_PCI_H__
> +
> +#ifdef CONFIG_HAS_PCI
> +
> +#define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
> +
> +/* Arch pci dev struct */
>  struct arch_pci_dev {
> +    struct device dev;
>  };
>
> -#endif /* __X86_PCI_H__ */
> +#else   /*!CONFIG_HAS_PCI*/
> +
> +struct arch_pci_dev { };
> +
> +#endif  /*!CONFIG_HAS_PCI*/
> +#endif /* __ARM_PCI_H__ */
> --
> 2.17.1
>
>

--00000000000075605e05cca017ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,<br><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, 22 Sep 2021, 16:36 Rahul Singh, &lt;<a href=
=3D"mailto:rahul.singh@arm.com">rahul.singh@arm.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">Compilation error is observed when HAS_PCI =
is enabled for ARM<br>
architecture.</blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">In general, when I read &quot;compilation error&quot; I interpret=
 as a user can trigger it in the current staging.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">However, without the full series applied, HAS_PCI=
 cannot be selected on Arm.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">So I think the message is a bit misleading because this is more impleme=
nting stubs to enable a feature rather than fixing compilation errors (AFAI=
CT all of them are not fixed here).</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">How about the following commit message:</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">xen/arm: pci: Add stubs to allow selecting HAS_=
PCI</div><div dir=3D"auto"><br></div><div dir=3D"auto">In a follow-up we wi=
ll enable PCI support in Xen on Arm (i.e select HAS_PCI).</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">The generic code expects the arch to impl=
ement a few functions:</div><div dir=3D"auto"><br></div><div dir=3D"auto">&=
lt;List the functions&gt;</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">Note that this is not yet sufficient to enable HAS_PCI and will be addres=
sed in follow-ups.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Add definition for arch_iommu_use_permitted() and<br>
arch_pci_clean_pirqs().<br>
<br>
pci.c: In function =E2=80=98deassign_device=E2=80=99:<br>
pci.c:849:49: error: implicit declaration of function =E2=80=98pci_to_dev=
=E2=80=99;<br>
did you mean =E2=80=98dt_to_dev=E2=80=99? [-Werror=3Dimplicit-function-decl=
aration]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_to_dev(pdev));<br>
pci.c:880: undefined reference to `arch_pci_clean_pirqs=E2=80=99<br>
pci.c:1392: undefined reference to `arch_iommu_use_permitted&#39;<br>
<br>
Signed-off-by: Rahul Singh &lt;<a href=3D"mailto:rahul.singh@arm.com" targe=
t=3D"_blank" rel=3D"noreferrer">rahul.singh@arm.com</a>&gt;<br>
---<br>
Change in v2:<br>
- Remove pci_conf_read*(..) dummy implementation<br>
- Add in code comment for arch_pci_clean_pirqs() and arch_iommu_use_permitt=
ed()<br>
- Fixed minor comments<br>
---<br>
=C2=A0xen/arch/arm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 1 +<br>
=C2=A0xen/arch/arm/pci/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 1 +<br>
=C2=A0xen/arch/arm/pci/pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 33 +++++++++++++++++++++++++++++<br>
=C2=A0xen/drivers/passthrough/arm/iommu.c |=C2=A0 9 ++++++++<br>
=C2=A0xen/include/asm-arm/pci.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3=
1 ++++++++++++++++++++++++---<br>
=C2=A05 files changed, 72 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 xen/arch/arm/pci/Makefile<br>
=C2=A0create mode 100644 xen/arch/arm/pci/pci.c<br>
<br>
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile<br>
index 3d3b97b5b4..44d7cc81fa 100644<br>
--- a/xen/arch/arm/Makefile<br>
+++ b/xen/arch/arm/Makefile<br>
@@ -2,6 +2,7 @@ obj-$(CONFIG_ARM_32) +=3D arm32/<br>
=C2=A0obj-$(CONFIG_ARM_64) +=3D arm64/<br>
=C2=A0obj-$(CONFIG_ARM_64) +=3D efi/<br>
=C2=A0obj-$(CONFIG_ACPI) +=3D acpi/<br>
+obj-$(CONFIG_HAS_PCI) +=3D pci/<br>
=C2=A0ifneq ($(CONFIG_NO_PLAT),y)<br>
=C2=A0obj-y +=3D platforms/<br>
=C2=A0endif<br>
diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile<br>
new file mode 100644<br>
index 0000000000..a98035df4c<br>
--- /dev/null<br>
+++ b/xen/arch/arm/pci/Makefile<br>
@@ -0,0 +1 @@<br>
+obj-y +=3D pci.o<br>
diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c<br>
new file mode 100644<br>
index 0000000000..a7a7bc3213<br>
--- /dev/null<br>
+++ b/xen/arch/arm/pci/pci.c<br>
@@ -0,0 +1,33 @@<br>
+/*<br>
+ * This program is free software; you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU General Public License version 2 as<br>
+ * published by the Free Software Foundation.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+ * GNU General Public License for more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License<br>
+ * along with this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gn=
u.org/licenses/" rel=3D"noreferrer noreferrer" target=3D"_blank">http://www=
.gnu.org/licenses/</a>&gt;.<br>
+ */<br>
+<br>
+#include &lt;xen/pci.h&gt;<br>
+<br>
+/*<br>
+ * PIRQ event channels are not supported on Arm, so nothing to do.<br>
+ */<br>
+int arch_pci_clean_pirqs(struct domain *d)<br>
+{<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+/*<br>
+ * Local variables:<br>
+ * mode: C<br>
+ * c-file-style: &quot;BSD&quot;<br>
+ * c-basic-offset: 4<br>
+ * tab-width: 4<br>
+ * indent-tabs-mode: nil<br>
+ * End:<br>
+ */<br>
diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthrough/=
arm/iommu.c<br>
index db3b07a571..ee653a9c48 100644<br>
--- a/xen/drivers/passthrough/arm/iommu.c<br>
+++ b/xen/drivers/passthrough/arm/iommu.c<br>
@@ -135,3 +135,12 @@ void arch_iommu_domain_destroy(struct domain *d)<br>
=C2=A0void __hwdom_init arch_iommu_hwdom_init(struct domain *d)<br>
=C2=A0{<br>
=C2=A0}<br>
+<br>
+/*<br>
+ * Unlike x86, Arm doesn&#39;t support mem-sharing, mem-paging and log-dir=
ty (yet).<br>
+ * So there is no restriction to use the IOMMU.<br>
+ */<br>
+bool arch_iommu_use_permitted(const struct domain *d)<br>
+{<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h<br>
index de13359f65..7dd9eb3dba 100644<br>
--- a/xen/include/asm-arm/pci.h<br>
+++ b/xen/include/asm-arm/pci.h<br>
@@ -1,7 +1,32 @@<br>
-#ifndef __X86_PCI_H__<br>
-#define __X86_PCI_H__<br>
+/*<br>
+ * This program is free software; you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU General Public License version 2 as<br>
+ * published by the Free Software Foundation.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+ * GNU General Public License for more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License<br>
+ * along with this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gn=
u.org/licenses/" rel=3D"noreferrer noreferrer" target=3D"_blank">http://www=
.gnu.org/licenses/</a>&gt;.<br>
+ */<br>
<br>
+#ifndef __ARM_PCI_H__<br>
+#define __ARM_PCI_H__<br>
+<br>
+#ifdef CONFIG_HAS_PCI<br>
+<br>
+#define pci_to_dev(pcidev) (&amp;(pcidev)-&gt;<a href=3D"http://arch.dev" =
rel=3D"noreferrer noreferrer" target=3D"_blank">arch.dev</a>)<br>
+<br>
+/* Arch pci dev struct */<br>
=C2=A0struct arch_pci_dev {<br>
+=C2=A0 =C2=A0 struct device dev;<br>
=C2=A0};<br>
<br>
-#endif /* __X86_PCI_H__ */<br>
+#else=C2=A0 =C2=A0/*!CONFIG_HAS_PCI*/<br>
+<br>
+struct arch_pci_dev { };<br>
+<br>
+#endif=C2=A0 /*!CONFIG_HAS_PCI*/<br>
+#endif /* __ARM_PCI_H__ */<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div></div>

--00000000000075605e05cca017ec--

