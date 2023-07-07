Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2138B74AE24
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 11:53:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560337.876191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHi99-0004IX-IM; Fri, 07 Jul 2023 09:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560337.876191; Fri, 07 Jul 2023 09:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHi99-0004Fo-Fi; Fri, 07 Jul 2023 09:53:03 +0000
Received: by outflank-mailman (input) for mailman id 560337;
 Fri, 07 Jul 2023 09:53:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6jVP=CZ=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qHi98-0004Fg-3l
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 09:53:02 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f295d66-1cac-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 11:53:01 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fbbfaacfc1so2631245e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jul 2023 02:53:01 -0700 (PDT)
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
X-Inumbo-ID: 0f295d66-1cac-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688723580; x=1691315580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k5SIxJJUaY8DfE7EQiJlAAncgJ/TBgj+FZMC18V2IAI=;
        b=gpHYzSLR9Vx5Vbg0f5rsXm47yJcMEncMEdGLb3+UxaS2RhpAM3gedYFxgsDnn9PDDF
         mF7+NZwCldq5NyO0txPFSrhG51hq+SzV2JSGZSxnLqVyrdpE+YY7z7B7OEOUP27nxlAj
         7zniFjwvIUi980p3ECIXNdiV2HGbzK7rcDZX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688723580; x=1691315580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5SIxJJUaY8DfE7EQiJlAAncgJ/TBgj+FZMC18V2IAI=;
        b=kX9gkiAKO3516YjqPiPw7pWcjW+eeBZe6IncvE2jbP4pdLZ3ziZcLgLeS57iiXvjdV
         OOulH4dPt43+d749r9d3wuEERBJabseZcTc8I+NMbdaWqwhwfh+94/GhdBfsyOR/LKKw
         iw/K6YHoxT6r8l+mZixrWyKgren7hAsN34D2jzYiZuJcEJKbDO0wQdr6piaNJluqrahZ
         5+ThI1WJdbeX8UEifw1womxzvC3WOcjR0f5alAboBVCimSImiRW+Xzmu5g/W75IEGxuj
         KSzMEHgpaElAbkGEy7skSzBabk4jDB4ou8HEZfXym7M4TrMt6biWyZoOcGzAWGBo8V0p
         2uRg==
X-Gm-Message-State: ABy/qLZ3ZNZJnNZZaI5vbSrPQSFFrqnf8UJMx1eQ/QbnwlcOnBu3mxK/
	62+Wbz+grvPrNSdyZlTWV2NvbgVB9ryWIoPwd8gMAg==
X-Google-Smtp-Source: APBJJlFB2o/BMnoc82X2y2ugLpp9sQVuGHTjS/JBQQDDApcMFn2pA4u+/nirSd43YuPyX+nLK6RfcPAgIO2Gz5fNQtw=
X-Received: by 2002:a05:6512:544:b0:4fb:73b5:e1cf with SMTP id
 h4-20020a056512054400b004fb73b5e1cfmr3427449lfl.64.1688723580467; Fri, 07 Jul
 2023 02:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <CA+zSX=Y4MwsDSd9oSG1NQyt==YAw9SeRdh=eJxTUhhOx57ihWg@mail.gmail.com>
 <4ee01a0f-063e-ef93-ac24-da387d5b3438@rabbit.lu> <a680ae62-7765-aa51-1edd-9a1a7e39e449@suse.com>
 <20b1a79c-23c1-93bc-2090-8052f143422c@rabbit.lu> <27a3e6a2-b150-1d75-c86f-dfa2b906b298@suse.com>
In-Reply-To: <27a3e6a2-b150-1d75-c86f-dfa2b906b298@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 7 Jul 2023 10:52:49 +0100
Message-ID: <CA+zSX=ZCmmKQX7acx-oK4nSki9ONscxLP7E8t8USjdjXJ9UDpA@mail.gmail.com>
Subject: Re: Detecting whether dom0 is in a VM
To: Jan Beulich <jbeulich@suse.com>
Cc: zithro <slack@rabbit.lu>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000023549705ffe299a8"

--00000000000023549705ffe299a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 7, 2023 at 9:00=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:

> On 06.07.2023 17:35, zithro wrote:
> > On 06 Jul 2023 09:02, Jan Beulich wrote:
> >> On 05.07.2023 18:20, zithro wrote:
> >>> So I'm wondering, isn't that path enough for correct detection ?
> >>> I mean, if "/sys/class/dmi/id/sys_vendor" reports Xen (or KVM, or any
> >>> other known hypervisor), it's nested, otherwise it's on hardware ?
> >>>
> >>> Is that really mandatory to use CPUID leaves ?
> >>
> >> Let me ask the other way around: In user mode code under a non-nested
> >> vs nested Xen, what would you be able to derive from CPUID? The
> >> "hypervisor" bit is going to be set in both cases. (All assuming you
> >> run on new enough hardware+Xen such that CPUID would be intercepted
> >> even for PV.)
> >
> > I'm a bit clueless about CPUID stuff, but if I understand correctly,
> > you're essentially saying that using CPUID may not be the perfect way ?
> > Also, I don't get why the cpuid command returns two different values,
> > depending on the -k switch :
> > # cpuid -l 0x40000000
> > hypervisor_id (0x40000000) =3D "\0\0\0\0\0\0\0\0\0\0\0\0"
> > # cpuid -k -l 0x40000000
> > hypervisor_id (0x40000000) =3D "XenVMMXenVMM"
>
> I'm afraid I can't comment on this without knowing what tool you're
> taking about. Neither of the two systems I checked have one of this
> name.
>
> >> Yet relying on DMI is fragile, too: Along the lines of
> >> https://lists.xen.org/archives/html/xen-devel/2022-01/msg00604.html
> >> basically any value in there could be "inherited" from the host (i.e.
> >> from the layer below, to be precise).
> >
> > So using "/sys/class/dmi/id/sys_vendor", or simply doing "dmesg | grep
> > DMI:" is also not perfect, as values can be inherited/spoofed by
> > underneath hypervisor ?
>
> That's my understanding, yes.
>
> >> The only way to be reasonably
> >> certain is to ask Xen about its view. The raw or host featuresets
> >> should give you this information, in the "mirror" of said respective
> >> CPUID leave's "hypervisor" bit.
> >
> > As said above, I'm clueless, can you expand please ?
>
> Xen's public interface offers access to the featuresets known / found /
> used by the hypervisor. See XEN_SYSCTL_get_cpu_featureset, accessible
> via xc_get_cpu_featureset().
>

Are any of these exposed in dom0 via sysctl, or hypfs?  SYSCTLs are
unfortunately not stable interfaces, correct?  So it wouldn't be practical
for systemd to use them.

 -George

--00000000000023549705ffe299a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 7, 2023 at 9:00=E2=80=AFA=
M Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
06.07.2023 17:35, zithro wrote:<br>
&gt; On 06 Jul 2023 09:02, Jan Beulich wrote:<br>
&gt;&gt; On 05.07.2023 18:20, zithro wrote:<br>
&gt;&gt;&gt; So I&#39;m wondering, isn&#39;t that path enough for correct d=
etection ?<br>
&gt;&gt;&gt; I mean, if &quot;/sys/class/dmi/id/sys_vendor&quot; reports Xe=
n (or KVM, or any<br>
&gt;&gt;&gt; other known hypervisor), it&#39;s nested, otherwise it&#39;s o=
n hardware ?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Is that really mandatory to use CPUID leaves ?<br>
&gt;&gt;<br>
&gt;&gt; Let me ask the other way around: In user mode code under a non-nes=
ted<br>
&gt;&gt; vs nested Xen, what would you be able to derive from CPUID? The<br=
>
&gt;&gt; &quot;hypervisor&quot; bit is going to be set in both cases. (All =
assuming you<br>
&gt;&gt; run on new enough hardware+Xen such that CPUID would be intercepte=
d<br>
&gt;&gt; even for PV.)<br>
&gt; <br>
&gt; I&#39;m a bit clueless about CPUID stuff, but if I understand correctl=
y, <br>
&gt; you&#39;re essentially saying that using CPUID may not be the perfect =
way ?<br>
&gt; Also, I don&#39;t get why the cpuid command returns two different valu=
es, <br>
&gt; depending on the -k switch :<br>
&gt; # cpuid -l 0x40000000<br>
&gt; hypervisor_id (0x40000000) =3D &quot;\0\0\0\0\0\0\0\0\0\0\0\0&quot;<br=
>
&gt; # cpuid -k -l 0x40000000<br>
&gt; hypervisor_id (0x40000000) =3D &quot;XenVMMXenVMM&quot;<br>
<br>
I&#39;m afraid I can&#39;t comment on this without knowing what tool you&#3=
9;re<br>
taking about. Neither of the two systems I checked have one of this<br>
name.<br>
<br>
&gt;&gt; Yet relying on DMI is fragile, too: Along the lines of<br>
&gt;&gt; <a href=3D"https://lists.xen.org/archives/html/xen-devel/2022-01/m=
sg00604.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xen.org/ar=
chives/html/xen-devel/2022-01/msg00604.html</a><br>
&gt;&gt; basically any value in there could be &quot;inherited&quot; from t=
he host (i.e.<br>
&gt;&gt; from the layer below, to be precise).<br>
&gt; <br>
&gt; So using &quot;/sys/class/dmi/id/sys_vendor&quot;, or simply doing &qu=
ot;dmesg | grep <br>
&gt; DMI:&quot; is also not perfect, as values can be inherited/spoofed by =
<br>
&gt; underneath hypervisor ?<br>
<br>
That&#39;s my understanding, yes.<br>
<br>
&gt;&gt; The only way to be reasonably<br>
&gt;&gt; certain is to ask Xen about its view. The raw or host featuresets<=
br>
&gt;&gt; should give you this information, in the &quot;mirror&quot; of sai=
d respective<br>
&gt;&gt; CPUID leave&#39;s &quot;hypervisor&quot; bit. <br>
&gt; <br>
&gt; As said above, I&#39;m clueless, can you expand please ?<br>
<br>
Xen&#39;s public interface offers access to the featuresets known / found /=
<br>
used by the hypervisor. See XEN_SYSCTL_get_cpu_featureset, accessible<br>
via xc_get_cpu_featureset().<br></blockquote><div><br></div><div>Are any of=
 these exposed in dom0 via sysctl, or hypfs?=C2=A0 SYSCTLs are unfortunatel=
y not stable interfaces, correct?=C2=A0 So it wouldn&#39;t be practical for=
 systemd to use them.</div><div><br></div><div>=C2=A0-George</div></div></d=
iv>

--00000000000023549705ffe299a8--

