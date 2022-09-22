Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 180195E63C2
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 15:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410144.653140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMMr-0002aD-HW; Thu, 22 Sep 2022 13:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410144.653140; Thu, 22 Sep 2022 13:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMMr-0002YQ-EU; Thu, 22 Sep 2022 13:35:53 +0000
Received: by outflank-mailman (input) for mailman id 410144;
 Thu, 22 Sep 2022 13:35:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JObk=ZZ=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1obMMp-0002XY-Vs
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 13:35:52 +0000
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [2607:f8b0:4864:20::112d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78bdcbf7-3a7b-11ed-9374-c1cf23e5d27e;
 Thu, 22 Sep 2022 15:35:50 +0200 (CEST)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-3450a7358baso98547197b3.13
 for <xen-devel@lists.xenproject.org>; Thu, 22 Sep 2022 06:35:50 -0700 (PDT)
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
X-Inumbo-ID: 78bdcbf7-3a7b-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=z30lOYnst2tpbJr59CCMps8P2Smk1vfNrNzHWtQ5szU=;
        b=bnM9aAgpAyEH2qr6w45j6+Zmkk7DPwjEU7z/mrU/HhuHyhmGnioCROydWrehDAV86g
         +AHZ1J4qrKSAojXpkqeVgQvR/P9JTMks/HFpWsEfza2wKLh1b3nlHgVeNjick7LZnWso
         TuVuXovPCE+M0wyDa9Rm4tvLmHixzlWLC2zq3n9toJ1aWeygfDaimOFRhiwx9ALF2Vy8
         3obprZj9F6InCEhr2cggR0VR5ojwu4cuCf5IIaiVbbd1d+jG9P4IlI8TKEKl1X3LN3QL
         Eq90vjub2tMxGXyCHtK2/Ez+IB5DMS9CiH6DhL+zSNaJwESOLd3TqdkKPJ+Ny2nT/ve6
         dplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=z30lOYnst2tpbJr59CCMps8P2Smk1vfNrNzHWtQ5szU=;
        b=dd9mKu+2CgdkIo7jsa+rUPqh6ex+MwNkBwDkDSo8HLgwHSraNKbAHaBZzi2lSo8a9Z
         5eCABD7Ixxt7D2lwhYzXqY0lhPJHG81/WNs7OkbbtcgQUOjMTESEc4GHhhdHE+4q7/0X
         WMqwJEJw4qllmSRXtrXnzlGkHI9Q6/kPVR9ii6CTD2rMylIva3HqyRJ2tNOpqli+4tAq
         WvtSteXVMnwMKU0y7ank4ltVa8OTxwfDkJ52XZh4Zeemx5CpfAtXF+5/acZSMphiTbln
         zEuYXO+zfbumTTKhCmK3j+CBcwSzs8ebQkLTCXA86FOoq0YaLmjGH0WgAwL9aCaS7ugz
         5Q3g==
X-Gm-Message-State: ACrzQf1SCq+z5vChF8T5nxKZ4bby0gA0UWYG0zf9vetQvBU1Ltv0yL+b
	BcnyaSsikFrtAsLvBeFED4jgdZk5flVfWq3Vm0o=
X-Google-Smtp-Source: AMsMyM5zGbssEQGhBCN6Wd0+hmoYSfak4yL+WQzH+dgWY1VPUMiLMVNWd2z8ChBeTADwRqdJnNGmQ/hd/BKG05UzB1I=
X-Received: by 2002:a81:c02:0:b0:34d:829a:20f3 with SMTP id
 2-20020a810c02000000b0034d829a20f3mr2576953ywm.168.1663853749438; Thu, 22 Sep
 2022 06:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <8294476a707d7f20799a40479cc0bf9a1cf07673.1663249988.git.tamas.lengyel@intel.com>
 <9fa4a72f-8b38-fbf0-40c7-8fcd6b34cf10@suse.com> <9e79155f-0836-1b18-b648-b6e5422e89c8@oracle.com>
 <737386d2-ceeb-ad97-39a1-42585b913b9d@suse.com> <CABfawhk+TByRwVvGjv-e6-2UFeO7g6xBz3-CR_QOtYM2_37U=Q@mail.gmail.com>
 <29d29f64-b799-d56c-1292-661fb5127728@suse.com> <CABfawhnRUhQAc0cRybz8sLLkxjuZCO6JVA5QYHBERG7gf0zpZQ@mail.gmail.com>
 <406b7f6e-d092-fb6a-d0dd-60a9743027f6@suse.com> <CABfawhmrnL1HGOWS1fkEv5X4CwfkrBj-+APJ=hM1GCzzgjW4zA@mail.gmail.com>
 <5d1b06f0-fc20-585e-9da0-fb24c5931ad3@suse.com> <ffc59d24-7862-b7fb-e11e-b5f773129b0c@oracle.com>
 <8c0c9e20-f3d5-86fc-647f-ee89d63f2118@suse.com> <4d317c1e-3481-6d9e-c5ab-dfd9c559d89d@oracle.com>
 <a895f8ef-1135-7a44-07db-3c2f3d685a1a@suse.com> <2c0e506a-e494-68d5-f4d0-1b54cca2b970@oracle.com>
 <CABfawh=2tgzwjYw52fWdZQLmpFAUVOWJ=KMTb4hfVno2UCSaDg@mail.gmail.com>
In-Reply-To: <CABfawh=2tgzwjYw52fWdZQLmpFAUVOWJ=KMTb4hfVno2UCSaDg@mail.gmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 22 Sep 2022 09:35:13 -0400
Message-ID: <CABfawhmS9680zPu55y6BeVzJTjuhcgpx6nLU7N7MtLHGhWWmDw@mail.gmail.com>
Subject: Re: [PATCH] x86/vpmu: fix race-condition in vpmu_load
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	xen-devel@lists.xenproject.org, Tamas K Lengyel <tamas.lengyel@intel.com>
Content-Type: multipart/alternative; boundary="000000000000b1903e05e94423a8"

--000000000000b1903e05e94423a8
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 20, 2022 at 2:27 PM Tamas K Lengyel <tamas.k.lengyel@gmail.com>
wrote:

>
>
> On Tue, Sep 20, 2022 at 2:12 PM Boris Ostrovsky <
> boris.ostrovsky@oracle.com> wrote:
>
>>
>> On 9/20/22 10:54 AM, Jan Beulich wrote:
>> > On 20.09.2022 16:26, Boris Ostrovsky wrote:
>> >> On 9/20/22 4:01 AM, Jan Beulich wrote:
>> >>> On 20.09.2022 00:42, Boris Ostrovsky wrote:
>> >>>> It is saving vpmu data from current pcpu's MSRs for a remote vcpu so
>> @v
>> >>>> in vmx_find_msr() is not @current:
>> >>>>
>> >>>>         vpmu_load()
>> >>>>             ...
>> >>>>             prev = per_cpu(last_vcpu, pcpu);
>> >>>>             vpmu_save_force(prev)
>> >>>>                 core2_vpmu_save()
>> >>>>                     __core2_vpmu_save()
>> >>>>                         vmx_read_guest_msr()
>> >>>>                             vmx_find_msr()
>> >>>>
>> >>>>
>> >>>> The call to vmx_find_msr() was introduced by 755087eb9b10c. I wonder
>> though whether
>> >>>> this call is needed when code path above is executed (i.e. when we
>> are saving
>> >>>> remove vcpu)
>> >>> How could it not be needed? We need to obtain the guest value. The
>> >>> thing I don't understand is why this forced saving is necessary,
>> >>> when context_switch() unconditionally calls vpmu_switch_from().
>> >>
>> >> IIRC the logic is:
>> >>
>> >> 1. vcpuA runs on pcpu0
>> >> 2. vcpuA is de-scheduled and is selected to run on pcpu1. It has not
>> yet called vpmu_load() from pcpu1
>> > The calling of vpmu_load() shouldn't matter here. What does matter is
>> > that vpmu_save() was necessarily called already.
>>
>>
>> I thought we don't always save MSRs on context switch because we optimize
>> for case when the same vcpu gets scheduled again. But I am not sure I see
>> this now that I am looking at the code.
>>
>
> I see context_switch calling vpmu_save_from before __context_switch, but
> if that did actually save the vPMU state it would have reset
> VPMU_CONTEXT_LOADED, so by the time vpmu_load calls vpmu_save_force it
> would have just bailed before hitting the ASSERT failure in vmx_find_msrs.
> The context must still be loaded at that point (I'm trying to verify right
> now by adding some printks).
>

OK, Boris was correct above, MSRs are not saved on context switch
automatically because of that optimization. VPMU_CONTEXT_SAVE isn't set, so
the only thing vpmu_switch_from does is set global control to 0 in case it
was a PV vCPU (see core2_vpmu_save checks for both VPMU_CONTEXT_SAVE and
VPMU_CONTEXT_LOADED) and vpmu_switch_from doesn't set VPMU_CONTEXT_SAVE. So
for HVM vCPUs it does nothing, that's why we still see the context still
loaded when we get to vpmu_load.

It would be a simple enough change to make vpmu_switch_from always save the
context and then we could get rid of vpmu_load trying to do it later and
getting into that ASSERT failure. Thoughts?

Tamas

--000000000000b1903e05e94423a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 20, 2022 at 2:27 PM Tamas=
 K Lengyel &lt;<a href=3D"mailto:tamas.k.lengyel@gmail.com">tamas.k.lengyel=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 20, 2022 at 2:=
12 PM Boris Ostrovsky &lt;<a href=3D"mailto:boris.ostrovsky@oracle.com" tar=
get=3D"_blank">boris.ostrovsky@oracle.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><br>
On 9/20/22 10:54 AM, Jan Beulich wrote:<br>
&gt; On 20.09.2022 16:26, Boris Ostrovsky wrote:<br>
&gt;&gt; On 9/20/22 4:01 AM, Jan Beulich wrote:<br>
&gt;&gt;&gt; On 20.09.2022 00:42, Boris Ostrovsky wrote:<br>
&gt;&gt;&gt;&gt; It is saving vpmu data from current pcpu&#39;s MSRs for a =
remote vcpu so @v<br>
&gt;&gt;&gt;&gt; in vmx_find_msr() is not @current:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vpmu_load()<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prev =3D pe=
r_cpu(last_vcpu, pcpu);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vpmu_save_f=
orce(prev)<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0core2_vpmu_save()<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0__core2_vpmu_save()<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmx_read_guest_msr()<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmx_find_msr()<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; The call to vmx_find_msr() was introduced by 755087eb9b10c=
. I wonder though whether<br>
&gt;&gt;&gt;&gt; this call is needed when code path above is executed (i.e.=
 when we are saving<br>
&gt;&gt;&gt;&gt; remove vcpu)<br>
&gt;&gt;&gt; How could it not be needed? We need to obtain the guest value.=
 The<br>
&gt;&gt;&gt; thing I don&#39;t understand is why this forced saving is nece=
ssary,<br>
&gt;&gt;&gt; when context_switch() unconditionally calls vpmu_switch_from()=
.<br>
&gt;&gt;<br>
&gt;&gt; IIRC the logic is:<br>
&gt;&gt;<br>
&gt;&gt; 1. vcpuA runs on pcpu0<br>
&gt;&gt; 2. vcpuA is de-scheduled and is selected to run on pcpu1. It has n=
ot yet called vpmu_load() from pcpu1<br>
&gt; The calling of vpmu_load() shouldn&#39;t matter here. What does matter=
 is<br>
&gt; that vpmu_save() was necessarily called already.<br>
<br>
<br>
I thought we don&#39;t always save MSRs on context switch because we optimi=
ze for case when the same vcpu gets scheduled again. But I am not sure I se=
e this now that I am looking at the code.<br></blockquote><div><br></div><d=
iv>I see context_switch calling vpmu_save_from before __context_switch, but=
 if that did actually save the vPMU state it would have reset VPMU_CONTEXT_=
LOADED, so by the time vpmu_load calls vpmu_save_force it would have just b=
ailed before hitting the ASSERT failure in vmx_find_msrs. The context must =
still be loaded at that point (I&#39;m trying to verify right now by adding=
 some printks).</div></div></div></blockquote><div><br></div><div>OK, Boris=
 was correct above, MSRs are not saved on context switch automatically beca=
use of that optimization. VPMU_CONTEXT_SAVE isn&#39;t set, so the only thin=
g vpmu_switch_from does is set global control to 0 in case it was a PV vCPU=
 (see core2_vpmu_save checks for both VPMU_CONTEXT_SAVE and VPMU_CONTEXT_LO=
ADED) and vpmu_switch_from doesn&#39;t set VPMU_CONTEXT_SAVE. So for HVM vC=
PUs it does nothing, that&#39;s why we still see the context still loaded w=
hen we get to vpmu_load.</div><div><br></div><div>It would be a simple enou=
gh change to make vpmu_switch_from always save the context and then we coul=
d get rid of vpmu_load trying to do it later and getting into that ASSERT f=
ailure. Thoughts?<br></div><div><br></div><div>Tamas <br></div></div></div>

--000000000000b1903e05e94423a8--

