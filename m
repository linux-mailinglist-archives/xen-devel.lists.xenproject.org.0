Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB658729E3B
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 17:23:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546135.852773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7dxB-0007nQ-1L; Fri, 09 Jun 2023 15:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546135.852773; Fri, 09 Jun 2023 15:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7dxA-0007lj-Tn; Fri, 09 Jun 2023 15:23:04 +0000
Received: by outflank-mailman (input) for mailman id 546135;
 Fri, 09 Jun 2023 15:23:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+kj=B5=gmail.com=konrad.r.wilk@srs-se1.protection.inumbo.net>)
 id 1q7dx9-0007lW-Sr
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 15:23:03 +0000
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 854e3492-06d9-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 17:23:01 +0200 (CEST)
Received: by mail-ua1-f52.google.com with SMTP id
 a1e0cc1a2514c-78a57844f42so578811241.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jun 2023 08:23:01 -0700 (PDT)
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
X-Inumbo-ID: 854e3492-06d9-11ee-b232-6b7b168915f2
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686324180; x=1688916180;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQqVwNedjmV60oRhPco6EQYeo8VJiEqTl1Z9bsEQOPU=;
        b=PDoKd2BkuHhjROVQtN04GsVcjd56jgW4W3f21FTIx0QeLxKJlcMF7Cn5quS6/Gb8Pu
         VfRf84lfQ7Z/OirYoXl3v6ACngrhnUe+ipvlgB7xJy95mqKBz9VZhY7iCYYK+3qzz86c
         fI+dk99VuXcyHH+tldKadbl3I2W79VF6Oa1RSxGbw1GMqw6MUKd1uV9+3hU1UB+VjtQZ
         mmA6B+Nx7gILAQA1zbgRwRXA1guqSn0v+XyhWxUWYCNifQoZYAdTfnmaGu9rwOYyPA60
         kkM6brfyAheOOqGU7Kpd/KuwQxPcizbmOSwLdfgp7qh8vlraorRrNcfaAMXve0OfElxf
         mkoQ==
X-Gm-Message-State: AC+VfDyvTyuC9sCydePIUvj4a3Z8DikLgnV5WnW9Cy6orspjGGYzc59W
	oG9R235KKb7XQq4PGbZ7ka1HHkvVnQkhK94c0uw=
X-Google-Smtp-Source: ACHHUZ4yDgT/O64a7DQTPB5PKNSyMMwmN45AKeJo37e6UZwH+7lncvHgUnaepJI6DMXcxx55fG3VCzIpyAZBXMlptWk=
X-Received: by 2002:a67:e913:0:b0:43d:ca34:d016 with SMTP id
 c19-20020a67e913000000b0043dca34d016mr701555vso.1.1686324179948; Fri, 09 Jun
 2023 08:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230605102840.1521549-1-ross.lagerwall@citrix.com> <f2ccd563-4fac-084f-bd11-e6819dff5710@suse.com>
In-Reply-To: <f2ccd563-4fac-084f-bd11-e6819dff5710@suse.com>
Reply-To: konrad@darnok.org
From: Konrad Rzeszutek Wilk <konrad@darnok.org>
Date: Fri, 9 Jun 2023 11:22:48 -0400
Message-ID: <CAPbh3ruFn1to+t9QiuYM7h8CqL-fs2q73Rscj6PWGZuBkS8FEw@mail.gmail.com>
Subject: Re: [PATCH v3] iscsi_ibft: Fix finding the iBFT under Xen Dom 0
To: Juergen Gross <jgross@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, LKML <linux-kernel@vger.kernel.org>, 
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Peter Jones <pjones@redhat.com>, 
	Konrad Rzeszutek Wilk <konrad@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000b8d91605fdb3f14f"

--000000000000b8d91605fdb3f14f
Content-Type: text/plain; charset="UTF-8"

Feel free to add my Acked-by.

Dave, are you OK with the change in where the reserve call is made?

Thx

On Fri, Jun 9, 2023, 11:08 AM Juergen Gross <jgross@suse.com> wrote:

> On 05.06.23 12:28, Ross Lagerwall wrote:
> > To facilitate diskless iSCSI boot, the firmware can place a table of
> > configuration details in memory called the iBFT. The presence of this
> > table is not specified, nor is the precise location (and it's not in the
> > E820) so the kernel has to search for a magic marker to find it.
> >
> > When running under Xen, Dom 0 does not have access to the entire host's
> > memory, only certain regions which are identity-mapped which means that
> > the pseudo-physical address in Dom0 == real host physical address.
> > Add the iBFT search bounds as a reserved region which causes it to be
> > identity-mapped in xen_set_identity_and_remap_chunk() which allows Dom0
> > access to the specific physical memory to correctly search for the iBFT
> > magic marker (and later access the full table).
> >
> > This necessitates moving the call to reserve_ibft_region() somewhat
> > later so that it is called after e820__memory_setup() which is when the
> > Xen identity mapping adjustments are applied. The precise location of
> > the call is not too important so I've put it alongside dmi_setup() which
> > does similar scanning of memory for configuration tables.
> >
> > Finally in the iBFT find code, instead of using isa_bus_to_virt() which
> > doesn't do the right thing under Xen, use early_memremap() like the
> > dmi_setup() code does.
> >
> > The result of these changes is that it is possible to boot a diskless
> > Xen + Dom0 running off an iSCSI disk whereas previously it would fail to
> > find the iBFT and consequently, the iSCSI root disk.
> >
> > Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>
> Reviewed-by: Juergen Gross <jgross@suse.com>
>
>
> Juergen
>
>

--000000000000b8d91605fdb3f14f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Feel free to add my Acked-by.<div dir=3D"auto"><br></div>=
<div dir=3D"auto">Dave, are you OK with the change in where the reserve cal=
l is made?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thx</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On F=
ri, Jun 9, 2023, 11:08 AM Juergen Gross &lt;<a href=3D"mailto:jgross@suse.c=
om">jgross@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
On 05.06.23 12:28, Ross Lagerwall wrote:<br>
&gt; To facilitate diskless iSCSI boot, the firmware can place a table of<b=
r>
&gt; configuration details in memory called the iBFT. The presence of this<=
br>
&gt; table is not specified, nor is the precise location (and it&#39;s not =
in the<br>
&gt; E820) so the kernel has to search for a magic marker to find it.<br>
&gt; <br>
&gt; When running under Xen, Dom 0 does not have access to the entire host&=
#39;s<br>
&gt; memory, only certain regions which are identity-mapped which means tha=
t<br>
&gt; the pseudo-physical address in Dom0 =3D=3D real host physical address.=
<br>
&gt; Add the iBFT search bounds as a reserved region which causes it to be<=
br>
&gt; identity-mapped in xen_set_identity_and_remap_chunk() which allows Dom=
0<br>
&gt; access to the specific physical memory to correctly search for the iBF=
T<br>
&gt; magic marker (and later access the full table).<br>
&gt; <br>
&gt; This necessitates moving the call to reserve_ibft_region() somewhat<br=
>
&gt; later so that it is called after e820__memory_setup() which is when th=
e<br>
&gt; Xen identity mapping adjustments are applied. The precise location of<=
br>
&gt; the call is not too important so I&#39;ve put it alongside dmi_setup()=
 which<br>
&gt; does similar scanning of memory for configuration tables.<br>
&gt; <br>
&gt; Finally in the iBFT find code, instead of using isa_bus_to_virt() whic=
h<br>
&gt; doesn&#39;t do the right thing under Xen, use early_memremap() like th=
e<br>
&gt; dmi_setup() code does.<br>
&gt; <br>
&gt; The result of these changes is that it is possible to boot a diskless<=
br>
&gt; Xen + Dom0 running off an iSCSI disk whereas previously it would fail =
to<br>
&gt; find the iBFT and consequently, the iSCSI root disk.<br>
&gt; <br>
&gt; Signed-off-by: Ross Lagerwall &lt;<a href=3D"mailto:ross.lagerwall@cit=
rix.com" target=3D"_blank" rel=3D"noreferrer">ross.lagerwall@citrix.com</a>=
&gt;<br>
<br>
Reviewed-by: Juergen Gross &lt;<a href=3D"mailto:jgross@suse.com" target=3D=
"_blank" rel=3D"noreferrer">jgross@suse.com</a>&gt;<br>
<br>
<br>
Juergen<br>
<br>
</blockquote></div>

--000000000000b8d91605fdb3f14f--

