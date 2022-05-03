Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB5C518334
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 13:22:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319507.539766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlqbX-00020Q-Vl; Tue, 03 May 2022 11:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319507.539766; Tue, 03 May 2022 11:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlqbX-0001xs-RM; Tue, 03 May 2022 11:22:07 +0000
Received: by outflank-mailman (input) for mailman id 319507;
 Tue, 03 May 2022 11:22:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5nwV=VL=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nlqYO-0007fC-Qx
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 11:18:53 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfa12d87-cad2-11ec-a406-831a346695d4;
 Tue, 03 May 2022 13:18:51 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id g6so32830911ejw.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 04:18:51 -0700 (PDT)
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
X-Inumbo-ID: cfa12d87-cad2-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5ii/VPjSBiz3V9wv7B3XY7h3o+gkq07nEEQqTfzgRPY=;
        b=RFr+TWHqvBNXMOqsxxp82sywd5VkvzjSzw4VPqpv3JVORUcXAW1tpifGSr1hQBmpuc
         b/qm1C2+H6nU91lbG2LsN3JYZNVbRxoyvJNTDYAKOJSnELxSQAGX/zMusReSYwhuu/DQ
         SdZ2x5/828Ef+hdIc4IaZcNhXH5eoRFVFb/t0/f/SghxyruXMsx2DCiBE53LzsPAGbr2
         DbP2VhrME06z8M2C0u/miVDuRZg3mIuIxk4zXyxuoBHaoihYo6wq+wbhKLrrQUKlZpdu
         iazIFKormkNVJhyJ/euo7tWM4OgQY9oeBmfnCmqWDLcuclt5aV+EPlBXEpc7ZW44rdAG
         NmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5ii/VPjSBiz3V9wv7B3XY7h3o+gkq07nEEQqTfzgRPY=;
        b=f2UF4ddE+Z6bjzHRLNKmWZCQsPygc8k5ocIMjR3MP7NKyyS44WoRwQ0Gi32f3N3JVH
         ItJFkBnqbkzhV9gtltntyF3f0DgpijLgoeIyPb5hbPZ+YTaotAn17mihyuilGPZ+TKGg
         ZXcgApu7bLjBDrcg0wjosAkArFL1tGPvGKC6aAVybyFUw3Oi7YS8eLf5jlFNNXZCUoqJ
         APyXIkAHT21kihVS7JJkk83w85eeMCymyOmR4eRxgIgP7HcIIptk+C7KAzgR9OKRxC+k
         rTAMFND69SRf4PoWaB8fdy3KhBW5nDVPYU+3k7Okiay9u0MOWI7FUsHpkPye1mGRU9CQ
         rHrg==
X-Gm-Message-State: AOAM5339BthtVeKoQ/U40G3TLYr7giqOx12Ig7ZMhN1fDUhfdTo1WhAP
	RePj7SAAixobNIwZy5bew/nN/enwD+BJkNOFW8k=
X-Google-Smtp-Source: ABdhPJxvO1AgMJn+E5Afk3lxmqWsEqsKSy8oq0rKE0fV+LSVwCuuaeTbjpIylpaV1lGrMF+c0eyNVOtjoavmqQFRmGs=
X-Received: by 2002:a17:907:7dac:b0:6f3:be1f:af39 with SMTP id
 oz44-20020a1709077dac00b006f3be1faf39mr15056314ejc.467.1651576731331; Tue, 03
 May 2022 04:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
 <20220429205732.2030094-2-sstabellini@kernel.org>
In-Reply-To: <20220429205732.2030094-2-sstabellini@kernel.org>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Tue, 3 May 2022 14:18:38 +0300
Message-ID: <CAPD2p-kRz-03rfjPgDDsrx3O_uC20r_=zVr6BQ3kQz0rswiBYg@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] xen/arm: implement domU extended regions
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: multipart/alternative; boundary="00000000000063eff005de19ac13"

--00000000000063eff005de19ac13
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 29, 2022 at 11:58 PM Stefano Stabellini <sstabellini@kernel.org>
wrote:

> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>

Hello Stefano

[Sorry for the possible format issues]



>
> Implement extended regions for dom0less domUs. The implementation is
> based on the libxl implementation.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
> Changes in v5:
> - print the domain
> - coding style
> - simplify the code in find_domU_holes
> - return error if no regions allocated in find_domU_holes
> - use ROUNDUP
> - uint64_t/paddr_t
> ---
>  xen/arch/arm/domain_build.c | 56 +++++++++++++++++++++++++++++++------
>  1 file changed, 48 insertions(+), 8 deletions(-)
>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 8be01678de..34d3e5ce30 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1324,6 +1324,37 @@ out:
>      return res;
>  }
>
> +static int __init find_domU_holes(const struct kernel_info *kinfo,
> +                                  struct meminfo *ext_regions)
> +{
> +    unsigned int i;
> +    paddr_t bankend;
> +    const paddr_t bankbase[] = GUEST_RAM_BANK_BASES;
> +    const paddr_t banksize[] = GUEST_RAM_BANK_SIZES;
> +    int res = -ENOENT;
> +
> +    for ( i = 0; i < GUEST_RAM_BANKS; i++ )
> +    {
> +        struct membank *ext_bank =
> &(ext_regions->bank[ext_regions->nr_banks]);
> +
> +        ext_bank->start = ROUNDUP(bankbase[i] + kinfo->mem.bank[i].size,
> +                                  SZ_2M);
> +
> +        bankend = ~0ULL >> (64 - p2m_ipa_bits);
> +        bankend = min(bankend, bankbase[i] + banksize[i] - 1);
> +        if ( bankend > ext_bank->start )
> +            ext_bank->size = bankend - ext_bank->start + 1;
> +
> +        /* 64MB is the minimum size of an extended region */
> +        if ( ext_bank->size < MB(64) )
> +            continue;
> +        ext_regions->nr_banks++;
> +        res = 0;
> +    }
> +
> +    return res;
> +}
> +
>  static int __init make_hypervisor_node(struct domain *d,
>                                         const struct kernel_info *kinfo,
>                                         int addrcells, int sizecells)
> @@ -1360,12 +1391,13 @@ static int __init make_hypervisor_node(struct
> domain *d,
>
>      if ( !opt_ext_regions )
>


ok, I think, the comment for *opt_ext_regions* at the beginning of this
file and the description for *ext_regions* in xen-command-line.pandoc need
to be updated,
as they both mention Dom0 only.




>      {
> -        printk(XENLOG_INFO "The extended regions support is disabled\n");
> +        printk(XENLOG_INFO "%pd: extended regions support is disabled\n",
> d);
>          nr_ext_regions = 0;
>      }
>      else if ( is_32bit_domain(d) )
>      {
> -        printk(XENLOG_WARNING "The extended regions are only supported
> for 64-bit guest currently\n");
> +        printk(XENLOG_WARNING "%pd: extended regions are only supported
> for 64-bit guest currently\n",
> +               d);
>          nr_ext_regions = 0;
>      }
>      else
> @@ -1374,13 +1406,21 @@ static int __init make_hypervisor_node(struct
> domain *d,
>          if ( !ext_regions )
>              return -ENOMEM;
>
> -        if ( !is_iommu_enabled(d) )
> -            res = find_unallocated_memory(kinfo, ext_regions);
> +        if ( is_domain_direct_mapped(d) )
> +        {
> +            if ( !is_iommu_enabled(d) )
> +                res = find_unallocated_memory(kinfo, ext_regions);
> +            else
> +                res = find_memory_holes(kinfo, ext_regions);
> +        }
>          else
> -            res = find_memory_holes(kinfo, ext_regions);
> +        {
> +            res = find_domU_holes(kinfo, ext_regions);
> +        }
>
>          if ( res )
> -            printk(XENLOG_WARNING "Failed to allocate extended
> regions\n");
> +            printk(XENLOG_WARNING "%pd: failed to allocate extended
> regions\n",
> +                   d);
>          nr_ext_regions = ext_regions->nr_banks;
>      }
>
> @@ -1401,8 +1441,8 @@ static int __init make_hypervisor_node(struct domain
> *d,
>          u64 start = ext_regions->bank[i].start;
>          u64 size = ext_regions->bank[i].size;
>
> -        printk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
> -               i, start, start + size);
> +        printk("%pd: extended region %d: %#"PRIx64"->%#"PRIx64"\n",
> +               d, i, start, start + size);
>
>          dt_child_set_range(&cells, addrcells, sizecells, start, size);
>      }
> --
> 2.25.1
>
>
>

-- 
Regards,

Oleksandr Tyshchenko

--00000000000063eff005de19ac13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 29, 2022 at 11:58 PM Stef=
ano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@ke=
rnel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">From: Stefano Stabellini &lt;<a href=3D"mailto:stefano.stabellini@x=
ilinx.com" target=3D"_blank">stefano.stabellini@xilinx.com</a>&gt;<br></blo=
ckquote><div><br></div><div>Hello Stefano</div><div><br></div><div>[Sorry f=
or the possible format issues]</div><div><br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
Implement extended regions for dom0less domUs. The implementation is<br>
based on the libxl implementation.<br>
<br>
Signed-off-by: Stefano Stabellini &lt;<a href=3D"mailto:stefano.stabellini@=
xilinx.com" target=3D"_blank">stefano.stabellini@xilinx.com</a>&gt;<br>
---<br>
Changes in v5:<br>
- print the domain<br>
- coding style<br>
- simplify the code in find_domU_holes<br>
- return error if no regions allocated in find_domU_holes<br>
- use ROUNDUP<br>
- uint64_t/paddr_t<br>
---<br>
=C2=A0xen/arch/arm/domain_build.c | 56 +++++++++++++++++++++++++++++++-----=
-<br>
=C2=A01 file changed, 48 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c<br>
index 8be01678de..34d3e5ce30 100644<br>
--- a/xen/arch/arm/domain_build.c<br>
+++ b/xen/arch/arm/domain_build.c<br>
@@ -1324,6 +1324,37 @@ out:<br>
=C2=A0 =C2=A0 =C2=A0return res;<br>
=C2=A0}<br>
<br>
+static int __init find_domU_holes(const struct kernel_info *kinfo,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct meminfo *ext_regions)<=
br>
+{<br>
+=C2=A0 =C2=A0 unsigned int i;<br>
+=C2=A0 =C2=A0 paddr_t bankend;<br>
+=C2=A0 =C2=A0 const paddr_t bankbase[] =3D GUEST_RAM_BANK_BASES;<br>
+=C2=A0 =C2=A0 const paddr_t banksize[] =3D GUEST_RAM_BANK_SIZES;<br>
+=C2=A0 =C2=A0 int res =3D -ENOENT;<br>
+<br>
+=C2=A0 =C2=A0 for ( i =3D 0; i &lt; GUEST_RAM_BANKS; i++ )<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct membank *ext_bank =3D &amp;(ext_regions=
-&gt;bank[ext_regions-&gt;nr_banks]);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ext_bank-&gt;start =3D ROUNDUP(bankbase[i] + k=
info-&gt;mem.bank[i].size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SZ_2M);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bankend =3D ~0ULL &gt;&gt; (64 - p2m_ipa_bits)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bankend =3D min(bankend, bankbase[i] + banksiz=
e[i] - 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( bankend &gt; ext_bank-&gt;start )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ext_bank-&gt;size =3D bankend - =
ext_bank-&gt;start + 1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 64MB is the minimum size of an extended reg=
ion */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( ext_bank-&gt;size &lt; MB(64) )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ext_regions-&gt;nr_banks++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return res;<br>
+}<br>
+<br>
=C2=A0static int __init make_hypervisor_node(struct domain *d,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const st=
ruct kernel_info *kinfo,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int addr=
cells, int sizecells)<br>
@@ -1360,12 +1391,13 @@ static int __init make_hypervisor_node(struct domai=
n *d,<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ( !opt_ext_regions )<br></blockquote><div><br></div>=
<div><br></div><div>ok, I think, the comment for *opt_ext_regions* at the b=
eginning=C2=A0of this file and the description for *ext_regions* in xen-com=
mand-line.pandoc need to be updated,</div><div>as they both mention Dom0 on=
ly.</div><div><br></div><div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(XENLOG_INFO &quot;The extended regions =
support is disabled\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(XENLOG_INFO &quot;%pd: extended regions=
 support is disabled\n&quot;, d);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nr_ext_regions =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0else if ( is_32bit_domain(d) )<br>
=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(XENLOG_WARNING &quot;The extended regio=
ns are only supported for 64-bit guest currently\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(XENLOG_WARNING &quot;%pd: extended regi=
ons are only supported for 64-bit guest currently\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nr_ext_regions =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0else<br>
@@ -1374,13 +1406,21 @@ static int __init make_hypervisor_node(struct domai=
n *d,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !ext_regions )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( !is_iommu_enabled(d) )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D find_unallocated_memory(=
kinfo, ext_regions);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( is_domain_direct_mapped(d) )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( !is_iommu_enabled(d) )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D find_unall=
ocated_memory(kinfo, ext_regions);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D find_memor=
y_holes(kinfo, ext_regions);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D find_memory_holes(kinfo,=
 ext_regions);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D find_domU_holes(kinfo, e=
xt_regions);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( res )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(XENLOG_WARNING &quot;Fail=
ed to allocate extended regions\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(XENLOG_WARNING &quot;%pd:=
 failed to allocate extended regions\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nr_ext_regions =3D ext_regions-&gt;nr_ban=
ks;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -1401,8 +1441,8 @@ static int __init make_hypervisor_node(struct domain =
*d,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u64 start =3D ext_regions-&gt;bank[i].sta=
rt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u64 size =3D ext_regions-&gt;bank[i].size=
;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(&quot;Extended region %d: %#&quot;PRIx6=
4&quot;-&gt;%#&quot;PRIx64&quot;\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, start, start + s=
ize);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(&quot;%pd: extended region %d: %#&quot;=
PRIx64&quot;-&gt;%#&quot;PRIx64&quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d, i, start, start =
+ size);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dt_child_set_range(&amp;cells, addrcells,=
 sizecells, start, size);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><font size=
=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Reg=
ards,</span></font></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"=
><div><span style=3D"background-color:rgb(255,255,255)"><font size=3D"2">Ol=
eksandr Tyshchenko</font></span></div></div></div></div></div></div></div><=
/div>

--00000000000063eff005de19ac13--

