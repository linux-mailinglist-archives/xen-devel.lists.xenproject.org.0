Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB3EA27682
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 16:53:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881718.1291882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfLEV-0008Vv-9g; Tue, 04 Feb 2025 15:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881718.1291882; Tue, 04 Feb 2025 15:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfLEV-0008UT-72; Tue, 04 Feb 2025 15:53:03 +0000
Received: by outflank-mailman (input) for mailman id 881718;
 Tue, 04 Feb 2025 15:53:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O11r=U3=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1tfLEU-0008UL-04
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 15:53:02 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c433556-e310-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 16:53:00 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38daf156e97so425942f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 07:53:00 -0800 (PST)
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
X-Inumbo-ID: 1c433556-e310-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738684380; x=1739289180; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iyIJM4kJ8EZKU4gbQkWHhXo1ihgdkI8pX3SZmFUlwqQ=;
        b=VmENKnMJFWJbBs7gyMZOfQt1ZHeXKo9iqcS/VQgqEBBAzDeelGdslCVDFJF7Wi0Lqj
         DLS0AW+oyflfpl6lLO3CsMQppQ4lmAFCYYMJ61qnY+9N8sSn7WNa0LypmCyLDL8etK/0
         CjP+XUm3qUy91XigCwQF54LRG1RRiU9jKjmKVit4DtWWJo51EO3jZ5g9+FbfUZJ5TZfW
         MRnmi7vUj0ht/zmm3sPVLOlowb+ZOZ856RDej9uG6ISqA9znKREtstOw+xGsFM6rv2DH
         1RzWzk2ipoMmUNgC/A2TSm2ritX/Z/+tQJNL9Q+/4Ihl/8FquHOXi1Mq6PBT6sZ2Vh/K
         VfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738684380; x=1739289180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iyIJM4kJ8EZKU4gbQkWHhXo1ihgdkI8pX3SZmFUlwqQ=;
        b=Noe97TaG2BX6T5ezzZ1HNUoYTUu981UqqNS26aHJoAjvZe0hx6ovngpgSGL/v5HXU0
         vrXGkJwiD8eylOeEXk0pv8RGrv6Y4jgwXzZ5YeR2mTUUa+TU45Tf6PK5eufWNXYu1dIn
         5DPxp/w2wte1BNNDqyLXQvXKHK2zx17Vp8IrYcIWJ6tFS5y3klxNpai439qJcBepaNOZ
         yT09NAsPfqkMwTWUVePhswjBFV4ZTC3f8256G321n50pMVSlZ6bXI67od4CTr2tiQ709
         nTBjDlJPNIvSIY9fRmQQYzvMG/mcwvS8FwDUwO1UZRI4+d1xd3X0JFFEYv4v8JYYD3Of
         7EiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3tDuIITsOe8d7to82j56LgTwOoxLeNKhaXXunyyoskIUAcanUYPv+4bMEeWzc0njW2hDt1Ski4aE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoV2mv6034G5urBaSppCiRMCdhGP38VPYV9MwYKIicsIcnt7kR
	F/n3yebfnoO7eMS9ggwUTQn3p2dpUmRIXI52uXCvrTMgxFJhw+5xOHOvMpueVvlu9ILB3hi8Ofd
	saXqcmDnz/nnfLPVbGh4vOT6ibSA=
X-Gm-Gg: ASbGncsc/UHBqo9m+6CikoRs2IFsDUUPmSE57qdNEyLu4bRgDtMHFUQAuyvVQs9vWcS
	+WWNMYas9NqjaAGAQc1/KJOFLaeVvNsXO+Y1vjp7TrfXsYjAd/2/fB8RaURALpP97Vegf/qSDpA
	==
X-Google-Smtp-Source: AGHT+IFB20hyCS0GtEXjx59eXEdIIzqB/qxs7pAiYG49RaCdW5eZCyRq4tKk1oJlAxAXkWBVqEVBDbyhvxeUQhz7w1g=
X-Received: by 2002:a05:6000:1567:b0:38d:b14e:2fd9 with SMTP id
 ffacd0b85a97d-38db14e31d0mr645220f8f.7.1738684379755; Tue, 04 Feb 2025
 07:52:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1737470269.git.teddy.astie@vates.tech> <29f3e87532573bfc4196083ab0291326adae5100.1737470269.git.teddy.astie@vates.tech>
 <1ea6447c-3451-4aca-8a17-2848acd0868f@amd.com> <c4351594-e394-4949-8dd1-20cce54ec192@vates.tech>
 <alpine.DEB.2.22.394.2502030939470.11632@ubuntu-linux-20-04-desktop> <07423892-7f23-4e57-b1e9-4ef0fe45d6bc@vates.tech>
In-Reply-To: <07423892-7f23-4e57-b1e9-4ef0fe45d6bc@vates.tech>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Tue, 4 Feb 2025 12:52:48 -0300
X-Gm-Features: AWEUYZnT5-rnKVMAMKN4EmmZW0EDsWw3xtvL4VP9LrGLifzvU-wY_so3ByLVu8k
Message-ID: <CAJ=z9a0DxkmeQU4U1sHnqCohrgVBjSOzs=u-x0E_QWAB36yV7w@mail.gmail.com>
Subject: Re: [XEN RFC PATCH v5 3/5] xen/public: Introduce PV-IOMMU hypercall interface
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>, 
	xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: multipart/alternative; boundary="000000000000d4fe07062d53007d"

--000000000000d4fe07062d53007d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 4 Feb 2025 at 11:46, Teddy Astie <teddy.astie@vates.tech> wrote:

> If the hardware supports it, there is a alternative (still being
> drafted) interface to allow the guest to directly provide native
> pagetables.
>
> This is exposed through the "_nested" subcommands, there is no
> implementation of this feature in this patch series yet.


Out of interest, if the HW support two stage translations, then why do we
need a PV interface? Wouldn=E2=80=99t it be better to exposed an emulated i=
ommu?
This would reduce the amount of enlightenment required in the guest OS. In
the long run, this would provide some better performance  because some
IOMMU HW can now accelerate TLB flush commands (among other things). For
instance, see the NVIDIA vIOMMU.

Cheers,


> /**
>   * IOMMU_alloc_nested
>   * Create a nested IOMMU context (needs IOMMUCAP_nested).
>   *
>   * This context uses a platform-specific page table from domain address
> space
>   * specified in pgtable_gfn and use it for nested translations.
>   *
>   * Explicit flushes needs to be submited with IOMMU_flush_nested on
>   * modification of the nested pagetable to ensure coherency between
> IOTLB and
>   * nested page table.
>   *
>   * This context can be destroyed using IOMMU_free_context.
>   * This context cannot be modified using map_pages, unmap_pages.
>   */
> struct pv_iommu_alloc_nested {
>      /* OUT: allocated IOMMU context number */
>      uint16_t ctx_no;
>
>      /* IN: guest frame number of the nested page table */
>      uint64_aligned_t pgtable_gfn;
>
>      /* IN: nested mode flags */
>      uint64_aligned_t nested_flags;
> };
> typedef struct pv_iommu_alloc_nested pv_iommu_alloc_nested_t;
> DEFINE_XEN_GUEST_HANDLE(pv_iommu_alloc_nested_t);
>
> /**
>   * IOMMU_flush_nested (needs IOMMUCAP_nested)
>   * Flush the IOTLB for nested translation.
>   */
> struct pv_iommu_flush_nested {
>      /* TODO */
> };
> typedef struct pv_iommu_flush_nested pv_iommu_flush_nested_t;
> DEFINE_XEN_GUEST_HANDLE(pv_iommu_flush_nested_t);
>
>
> >
> >
> >
> >> [1] Originally
> >> https://lists.xen.org/archives/html/xen-devel/2024-06/msg01145.html bu=
t
> >> this patch got quite old and probably doesn't work anymore with this n=
ew
> >> Xen patch series.
> >> I have a updated patch in my xen-pviommu branch
> >>
> https://gitlab.com/xen-project/people/tsnake41/linux/-/commit/125d67a09fa=
9f66a32f9175641cfccca22dbbdb6
> >>
> >> [2] You also need to set "vfio_iommu_type1.allow_unsafe_interrupts=3D1=
" to
> >> make VFIO work for now.
>
> Thanks
> Teddy
>
>
>
> Teddy Astie | Vates XCP-ng Developer
>
> XCP-ng & Xen Orchestra - Vates solutions
>
> web: https://vates.tech
>
>

--000000000000d4fe07062d53007d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 4 Feb 2025 at 11:46, Teddy Astie &lt;teddy.ast=
ie@vates.tech&gt; wrote:</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;paddin=
g-left:1ex;border-left-color:rgb(204,204,204)">
If the hardware supports it, there is a alternative (still being <br>
drafted) interface to allow the guest to directly provide native pagetables=
.<br>
<br>
This is exposed through the &quot;_nested&quot; subcommands, there is no <b=
r>
implementation of this feature in this patch series yet.</blockquote><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Out of interest, if the HW support =
two stage translations, then why do we need a PV interface? Wouldn=E2=80=99=
t it be better to exposed an emulated iommu? This would reduce the amount o=
f enlightenment required in the guest OS. In the long run, this would provi=
de some better performance =C2=A0because some IOMMU HW can now accelerate T=
LB flush commands (among other things). For instance, see the NVIDIA vIOMMU=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex=
;border-left-color:rgb(204,204,204)" dir=3D"auto"></blockquote><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,2=
04)" dir=3D"auto"><br>
/**<br>
=C2=A0 * IOMMU_alloc_nested<br>
=C2=A0 * Create a nested IOMMU context (needs IOMMUCAP_nested).<br>
=C2=A0 *<br>
=C2=A0 * This context uses a platform-specific page table from domain addre=
ss <br>
space<br>
=C2=A0 * specified in pgtable_gfn and use it for nested translations.<br>
=C2=A0 *<br>
=C2=A0 * Explicit flushes needs to be submited with IOMMU_flush_nested on<b=
r>
=C2=A0 * modification of the nested pagetable to ensure coherency between <=
br>
IOTLB and<br>
=C2=A0 * nested page table.<br>
=C2=A0 *<br>
=C2=A0 * This context can be destroyed using IOMMU_free_context.<br>
=C2=A0 * This context cannot be modified using map_pages, unmap_pages.<br>
=C2=A0 */<br>
struct pv_iommu_alloc_nested {<br>
=C2=A0 =C2=A0 =C2=A0/* OUT: allocated IOMMU context number */<br>
=C2=A0 =C2=A0 =C2=A0uint16_t ctx_no;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* IN: guest frame number of the nested page table */<b=
r>
=C2=A0 =C2=A0 =C2=A0uint64_aligned_t pgtable_gfn;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* IN: nested mode flags */<br>
=C2=A0 =C2=A0 =C2=A0uint64_aligned_t nested_flags;<br>
};<br>
typedef struct pv_iommu_alloc_nested pv_iommu_alloc_nested_t;<br>
DEFINE_XEN_GUEST_HANDLE(pv_iommu_alloc_nested_t);<br>
<br>
/**<br>
=C2=A0 * IOMMU_flush_nested (needs IOMMUCAP_nested)<br>
=C2=A0 * Flush the IOTLB for nested translation.<br>
=C2=A0 */<br>
struct pv_iommu_flush_nested {<br>
=C2=A0 =C2=A0 =C2=A0/* TODO */<br>
};<br>
typedef struct pv_iommu_flush_nested pv_iommu_flush_nested_t;<br>
DEFINE_XEN_GUEST_HANDLE(pv_iommu_flush_nested_t);<br>
<br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;&gt; [1] Originally<br>
&gt;&gt; <a href=3D"https://lists.xen.org/archives/html/xen-devel/2024-06/m=
sg01145.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xen.org/ar=
chives/html/xen-devel/2024-06/msg01145.html</a> but<br>
&gt;&gt; this patch got quite old and probably doesn&#39;t work anymore wit=
h this new<br>
&gt;&gt; Xen patch series.<br>
&gt;&gt; I have a updated patch in my xen-pviommu branch<br>
&gt;&gt; <a href=3D"https://gitlab.com/xen-project/people/tsnake41/linux/-/=
commit/125d67a09fa9f66a32f9175641cfccca22dbbdb6" rel=3D"noreferrer" target=
=3D"_blank">https://gitlab.com/xen-project/people/tsnake41/linux/-/commit/1=
25d67a09fa9f66a32f9175641cfccca22dbbdb6</a><br>
&gt;&gt;<br>
&gt;&gt; [2] You also need to set &quot;vfio_iommu_type1.allow_unsafe_inter=
rupts=3D1&quot; to<br>
&gt;&gt; make VFIO work for now.<br>
<br>
Thanks<br>
Teddy<br>
<br>
<br>
<br>
Teddy Astie | Vates XCP-ng Developer<br>
<br>
XCP-ng &amp; Xen Orchestra - Vates solutions<br>
<br>
web: <a href=3D"https://vates.tech" rel=3D"noreferrer" target=3D"_blank">ht=
tps://vates.tech</a><br>
<br>
</blockquote></div></div>

--000000000000d4fe07062d53007d--

