Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 268794266FB
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 11:36:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204604.359771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYmIh-0003KK-Mv; Fri, 08 Oct 2021 09:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204604.359771; Fri, 08 Oct 2021 09:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYmIh-0003Ha-J4; Fri, 08 Oct 2021 09:36:23 +0000
Received: by outflank-mailman (input) for mailman id 204604;
 Fri, 08 Oct 2021 09:36:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TEpG=O4=gmail.com=charles.fg@srs-us1.protection.inumbo.net>)
 id 1mYmIf-0003HU-UJ
 for xen-devel@lists.xen.org; Fri, 08 Oct 2021 09:36:22 +0000
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8529afbc-ec75-4218-8564-d45b04a77cdb;
 Fri, 08 Oct 2021 09:36:20 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id t8so27987919wri.1
 for <xen-devel@lists.xen.org>; Fri, 08 Oct 2021 02:36:20 -0700 (PDT)
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
X-Inumbo-ID: 8529afbc-ec75-4218-8564-d45b04a77cdb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KxPsuHHXR6kXB0FZjugaOY84qeJ3/5bFJ2P6FDCd7uI=;
        b=TYIoQhw61puQKy2Hl7+NwM0SNpSzqb94AR5vpaa5XPNnhMrvonRyhLnFbm8k0xtsj6
         VrNmgHox1+L3TyMrXDG0iGBF/spg15EyDdL60Zp655iWTAGIVsHVqFu3FdFUj5y+hGmB
         A2TfmxcpLGrJD5ZLOH4MXsKv6O3uTdw6MnE2IaGOXw02F7SwEz6e0BQaAKMyXTNWXUe0
         1Hz44e0Mlx+ZqckFR+xju8hIv50fyabVZfPvvMb8DNUkt1CCyw1xqaB7WjYnlAa/zJ+1
         JaGaV4sRmYjKu+kc1hVEgiiZD5Sm2PopXKKiNlcaraT7SOAZ0m6vTadu3+qyB1XdSOFr
         Uyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KxPsuHHXR6kXB0FZjugaOY84qeJ3/5bFJ2P6FDCd7uI=;
        b=eQ/W+h0Eyz9sAG3E5L9xnw+i1FmmCgyDJp1zELOLZZkJihePZMORfud4ynBq8QigPI
         8oB9ZqaTlV7ApyHW2C4p21KxbHssG6nrNp87fIq0rP3sNdoEj2TaOTQgPv2hp7tKL6Oc
         F9zRcdwa2A89PHx2mCfYhO0vqqITXdDLMYFFAO9hk7onPVTgPMS0lUNiU/N94NJRMu1d
         e1loPdJ8K9ooO1U2twC4Hq6n9kJcss4DRxcgzJVyp5v5N4W41ND/RgkJ58MaKnc+RkJf
         gTGWntUTiZnWckQz9kucKzhqNKodgK7z7YpIo1A8CbPdoW0iR4DXfamUUpqmg84kja6P
         qgEg==
X-Gm-Message-State: AOAM530VbKWFSmO+VpuY9I+lKCZoiicPL931c58UPU1ihugIA8KCVj6M
	6xlF2JsZcf35XqgwXAbzRDZ4+byi2zLAKvZDpC8=
X-Google-Smtp-Source: ABdhPJxuecr+96oNujE7WfqtdF2LMH6GrPBJUQ90NJYnX81mMQMDrv7BDMaYFk7qqOTiHqr2vdYZt7Ze+QCEVEspflU=
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr2371693wmh.140.1633685779643;
 Fri, 08 Oct 2021 02:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAAQRGoBQZ4mMWy2ibectwbN85oWvgcwus2rwO23u7BA7JWbf+A@mail.gmail.com>
 <4c622d73-6907-35aa-2701-4aea73fdb160@suse.com>
In-Reply-To: <4c622d73-6907-35aa-2701-4aea73fdb160@suse.com>
From: =?UTF-8?Q?Charles_Gon=C3=A7alves?= <charles.fg@gmail.com>
Date: Fri, 8 Oct 2021 10:36:07 +0100
Message-ID: <CAAQRGoA5MnfSfYdNeA=DKCGo+wMb0OZAtdqDJkEen00Uz3GnAQ@mail.gmail.com>
Subject: Re: PV - different behavior of pgd_offset in xen 4.6 and 4.13 for
 GUEST ACCESSIBLE memory area
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="0000000000009201e605cdd41c7d"

--0000000000009201e605cdd41c7d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for pointing this fix Jan. It helped me a lot.
Best!

On Fri, Oct 8, 2021, 10:30 Jan Beulich <jbeulich@suse.com> wrote:

> On 07.10.2021 17:10, Charles Gon=C3=A7alves wrote:
> > During some experiments in my PhD I've tried to reused a code from
> > Jann Horn (
> https://bugs.chromium.org/p/project-zero/issues/detail?id=3D1184
> > ) that used the mapping in
> >
> > ```
> > 0xffff804000000000 - 0xffff807fffffffff [256GB, 2^38 bytes, PML4:256]
> > Reserved for future shared info with the guest OS (GUEST ACCESSIBLE)
> > ```
> > to map some temporary page table data to be able to attack the system.
> >
> > This used to work on Xen 4.6:
> >
> > ```
> > #define MY_SECOND_AREA 0xffff804000000000ULL
> > printk("PML4 entry: 0x%lx\n", (unsigned
> > long)pgd_val(*pgd_offset(current->mm, MY_SECOND_AREA)));
> > ```
> >
> > In xen 4.6 :
> >
> > `[ 3632.620105] PML4 entry: 0x183d125067 `
> > Returns a valid PGD ( pgd_present(*pdg) =3D=3D true )
> >
> > but has different behavior in Xen 4.13 (despite no change in the
> > asm-x86/config.h .
> >
> > In xen 4.13:
> >
> > `[70386.796119] PML4 entry: 0x800000021a445025`
> > Return a bad PGD ( pgd_bad(*pdg) =3D=3D true )
>
> There's nothing really bad in this entry afaics. The entry is r/o
> and nx, yes, but that ought to be fine (i.e. I think pgd_bad() is
> too rigid here, but may not be valid to be used on hypervisor
> controlled entries in the first place).
>
> > I could not find any reference on the branch RELEASE-4.13.0 of why
> > this happens this way.
> > Any hint of what is happening here?
> > Has Xen changed the way it handles memory from regions in range
> > 0xffff804000000000 - 0xffff807fffffffff  across those versions?
>
> Yes - see a5a5d1ee949d ("x86/mm: Further restrict permissions on some
> virtual mappings"). The page table arrangement underlying this VA
> range isn't part of the ABI, i.e. we're free to change it at any time.
>
> Jan
>
>

--0000000000009201e605cdd41c7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for pointing this fix Jan. It helped me a lot.<div=
 dir=3D"auto">Best!</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Fri, Oct 8, 2021, 10:30 Jan Beulich &lt;<a href=
=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 07.10.2021 17:10, Charles Gon=C3=A7alves wro=
te:<br>
&gt; During some experiments in my PhD I&#39;ve tried to reused a code from=
<br>
&gt; Jann Horn (<a href=3D"https://bugs.chromium.org/p/project-zero/issues/=
detail?id=3D1184" rel=3D"noreferrer noreferrer" target=3D"_blank">https://b=
ugs.chromium.org/p/project-zero/issues/detail?id=3D1184</a><br>
&gt; ) that used the mapping in<br>
&gt; <br>
&gt; ```<br>
&gt; 0xffff804000000000 - 0xffff807fffffffff [256GB, 2^38 bytes, PML4:256]<=
br>
&gt; Reserved for future shared info with the guest OS (GUEST ACCESSIBLE)<b=
r>
&gt; ```<br>
&gt; to map some temporary page table data to be able to attack the system.=
<br>
&gt; <br>
&gt; This used to work on Xen 4.6:<br>
&gt; <br>
&gt; ```<br>
&gt; #define MY_SECOND_AREA 0xffff804000000000ULL<br>
&gt; printk(&quot;PML4 entry: 0x%lx\n&quot;, (unsigned<br>
&gt; long)pgd_val(*pgd_offset(current-&gt;mm, MY_SECOND_AREA)));<br>
&gt; ```<br>
&gt; <br>
&gt; In xen 4.6 :<br>
&gt; <br>
&gt; `[ 3632.620105] PML4 entry: 0x183d125067 `<br>
&gt; Returns a valid PGD ( pgd_present(*pdg) =3D=3D true )<br>
&gt; <br>
&gt; but has different behavior in Xen 4.13 (despite no change in the<br>
&gt; asm-x86/config.h .<br>
&gt; <br>
&gt; In xen 4.13:<br>
&gt; <br>
&gt; `[70386.796119] PML4 entry: 0x800000021a445025`<br>
&gt; Return a bad PGD ( pgd_bad(*pdg) =3D=3D true )<br>
<br>
There&#39;s nothing really bad in this entry afaics. The entry is r/o<br>
and nx, yes, but that ought to be fine (i.e. I think pgd_bad() is<br>
too rigid here, but may not be valid to be used on hypervisor<br>
controlled entries in the first place).<br>
<br>
&gt; I could not find any reference on the branch RELEASE-4.13.0 of why<br>
&gt; this happens this way.<br>
&gt; Any hint of what is happening here?<br>
&gt; Has Xen changed the way it handles memory from regions in range<br>
&gt; 0xffff804000000000 - 0xffff807fffffffff=C2=A0 across those versions?<b=
r>
<br>
Yes - see a5a5d1ee949d (&quot;x86/mm: Further restrict permissions on some<=
br>
virtual mappings&quot;). The page table arrangement underlying this VA<br>
range isn&#39;t part of the ABI, i.e. we&#39;re free to change it at any ti=
me.<br>
<br>
Jan<br>
<br>
</blockquote></div>

--0000000000009201e605cdd41c7d--

