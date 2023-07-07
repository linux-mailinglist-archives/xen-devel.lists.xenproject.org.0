Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 251F974B17F
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 15:10:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560492.876443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHlDp-0003ds-St; Fri, 07 Jul 2023 13:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560492.876443; Fri, 07 Jul 2023 13:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHlDp-0003bs-Os; Fri, 07 Jul 2023 13:10:05 +0000
Received: by outflank-mailman (input) for mailman id 560492;
 Fri, 07 Jul 2023 13:10:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6jVP=CZ=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qHlDo-0003KT-C4
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 13:10:04 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94d4175c-1cc7-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 15:10:01 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b6fdaf6eefso28725081fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jul 2023 06:10:01 -0700 (PDT)
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
X-Inumbo-ID: 94d4175c-1cc7-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688735401; x=1691327401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V+VJNI43NdR8+7vGNe1olqB6vdFbiPzrBn9hniTaJAg=;
        b=gBcnWYYr5/+EvZCUYkQPay+egjVtHhayY00j6LwQzvDE6AnMu5bhK75W4cvr1tp60p
         ARBGqKqxh4i0EHkfJcSfKyhR8lETLt26kSY4IJMj4DBvC91NnA4/4foM2Cgf86IB1QK5
         ocEBwZCKLdq3JSZoDc56tHEOqLP+Mt1LhPVjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688735401; x=1691327401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+VJNI43NdR8+7vGNe1olqB6vdFbiPzrBn9hniTaJAg=;
        b=XboadwKwZ9yXnLKfbAsuZPP6Mhk0VhDn8ZeFIwNt94tMgOaoTQjGRIWi5ESxmNaP3a
         FU3ZEW7Y/LjZR5PartanxWFNvEWVd+DzDkuD6Pjmgok//AH3dqLnQp+X5gXLB3fkVSJ9
         Eqiu/ja97Xo3faxfGrO+6RxgpY17oB5h07luo/ukgqxLHl9vLLTR0rYL8jdItNMzQz4K
         SQlX2lo7KOydnmIBII6soSN5XoZO7MrN7A4VloW3J6GQAoCGcNyiD56nZS+T3XO1+GIz
         RXNPsLj5sKLoFNu/4A1/nkslvuAgbCUv/I7kM9rk4MOwqhrNoZKVkluK4pEAh4ewp0mT
         K4Ag==
X-Gm-Message-State: ABy/qLaqi+muYej7Ytv/ippdYRQMdyVA9ZkKOnDewxwVkc7J5c195TD6
	Qn6+gG7fGSiMlEx5AckyazXoEg5kV/Xg7AE9EPXMcw==
X-Google-Smtp-Source: APBJJlHeB1ejxRKDnVgK8ew8Qc7Vi1/PH9ZBiYj5tYKtE/sG8LCteq3iD9qoqtGMo/SJMhSE0cueiYWbqTPuRzGPLNM=
X-Received: by 2002:a05:6512:252c:b0:4fb:820a:f87f with SMTP id
 be44-20020a056512252c00b004fb820af87fmr4429759lfb.10.1688735401146; Fri, 07
 Jul 2023 06:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <CA+zSX=Y4MwsDSd9oSG1NQyt==YAw9SeRdh=eJxTUhhOx57ihWg@mail.gmail.com>
 <4ee01a0f-063e-ef93-ac24-da387d5b3438@rabbit.lu> <a680ae62-7765-aa51-1edd-9a1a7e39e449@suse.com>
 <20b1a79c-23c1-93bc-2090-8052f143422c@rabbit.lu> <27a3e6a2-b150-1d75-c86f-dfa2b906b298@suse.com>
 <CA+zSX=ZCmmKQX7acx-oK4nSki9ONscxLP7E8t8USjdjXJ9UDpA@mail.gmail.com> <495946e9-191f-22fe-9ecf-08eb5af833ba@suse.com>
In-Reply-To: <495946e9-191f-22fe-9ecf-08eb5af833ba@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 7 Jul 2023 14:09:50 +0100
Message-ID: <CA+zSX=bEZ8LHmjZ2bBJAqpN4g02ayiB-a7zpL9NT8=1zd=FQZw@mail.gmail.com>
Subject: Re: Detecting whether dom0 is in a VM
To: Jan Beulich <jbeulich@suse.com>
Cc: zithro <slack@rabbit.lu>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000b48efe05ffe5599c"

--000000000000b48efe05ffe5599c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 7, 2023 at 11:17=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 07.07.2023 11:52, George Dunlap wrote:
> > On Fri, Jul 7, 2023 at 9:00=E2=80=AFAM Jan Beulich <jbeulich@suse.com> =
wrote:
> >
> >> On 06.07.2023 17:35, zithro wrote:
> >>> On 06 Jul 2023 09:02, Jan Beulich wrote:
> >>>> On 05.07.2023 18:20, zithro wrote:
> >>>>> So I'm wondering, isn't that path enough for correct detection ?
> >>>>> I mean, if "/sys/class/dmi/id/sys_vendor" reports Xen (or KVM, or a=
ny
> >>>>> other known hypervisor), it's nested, otherwise it's on hardware ?
> >>>>>
> >>>>> Is that really mandatory to use CPUID leaves ?
> >>>>
> >>>> Let me ask the other way around: In user mode code under a non-neste=
d
> >>>> vs nested Xen, what would you be able to derive from CPUID? The
> >>>> "hypervisor" bit is going to be set in both cases. (All assuming you
> >>>> run on new enough hardware+Xen such that CPUID would be intercepted
> >>>> even for PV.)
> >>>
> >>> I'm a bit clueless about CPUID stuff, but if I understand correctly,
> >>> you're essentially saying that using CPUID may not be the perfect way=
 ?
> >>> Also, I don't get why the cpuid command returns two different values,
> >>> depending on the -k switch :
> >>> # cpuid -l 0x40000000
> >>> hypervisor_id (0x40000000) =3D "\0\0\0\0\0\0\0\0\0\0\0\0"
> >>> # cpuid -k -l 0x40000000
> >>> hypervisor_id (0x40000000) =3D "XenVMMXenVMM"
> >>
> >> I'm afraid I can't comment on this without knowing what tool you're
> >> taking about. Neither of the two systems I checked have one of this
> >> name.
> >>
> >>>> Yet relying on DMI is fragile, too: Along the lines of
> >>>> https://lists.xen.org/archives/html/xen-devel/2022-01/msg00604.html
> >>>> basically any value in there could be "inherited" from the host (i.e=
.
> >>>> from the layer below, to be precise).
> >>>
> >>> So using "/sys/class/dmi/id/sys_vendor", or simply doing "dmesg | gre=
p
> >>> DMI:" is also not perfect, as values can be inherited/spoofed by
> >>> underneath hypervisor ?
> >>
> >> That's my understanding, yes.
> >>
> >>>> The only way to be reasonably
> >>>> certain is to ask Xen about its view. The raw or host featuresets
> >>>> should give you this information, in the "mirror" of said respective
> >>>> CPUID leave's "hypervisor" bit.
> >>>
> >>> As said above, I'm clueless, can you expand please ?
> >>
> >> Xen's public interface offers access to the featuresets known / found =
/
> >> used by the hypervisor. See XEN_SYSCTL_get_cpu_featureset, accessible
> >> via xc_get_cpu_featureset().
> >>
> >
> > Are any of these exposed in dom0 via sysctl, or hypfs?
>
> sysctl - yes (as the quoted name also says). hypfs no, afaict.
>

Sorry, that was a typo; I meant Linux's sysfs.  But of course if it's a
sysctl, I expect that to be a "no".

 -George

--000000000000b48efe05ffe5599c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 7, 2023 at 11:17=E2=80=AF=
AM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D"_blank">j=
beulich@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On 07.07.2023 11:52, George Dunlap wrote:<br>
&gt; On Fri, Jul 7, 2023 at 9:00=E2=80=AFAM Jan Beulich &lt;<a href=3D"mail=
to:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; wrote:<br=
>
&gt; <br>
&gt;&gt; On 06.07.2023 17:35, zithro wrote:<br>
&gt;&gt;&gt; On 06 Jul 2023 09:02, Jan Beulich wrote:<br>
&gt;&gt;&gt;&gt; On 05.07.2023 18:20, zithro wrote:<br>
&gt;&gt;&gt;&gt;&gt; So I&#39;m wondering, isn&#39;t that path enough for c=
orrect detection ?<br>
&gt;&gt;&gt;&gt;&gt; I mean, if &quot;/sys/class/dmi/id/sys_vendor&quot; re=
ports Xen (or KVM, or any<br>
&gt;&gt;&gt;&gt;&gt; other known hypervisor), it&#39;s nested, otherwise it=
&#39;s on hardware ?<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Is that really mandatory to use CPUID leaves ?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Let me ask the other way around: In user mode code under a=
 non-nested<br>
&gt;&gt;&gt;&gt; vs nested Xen, what would you be able to derive from CPUID=
? The<br>
&gt;&gt;&gt;&gt; &quot;hypervisor&quot; bit is going to be set in both case=
s. (All assuming you<br>
&gt;&gt;&gt;&gt; run on new enough hardware+Xen such that CPUID would be in=
tercepted<br>
&gt;&gt;&gt;&gt; even for PV.)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;m a bit clueless about CPUID stuff, but if I understand =
correctly,<br>
&gt;&gt;&gt; you&#39;re essentially saying that using CPUID may not be the =
perfect way ?<br>
&gt;&gt;&gt; Also, I don&#39;t get why the cpuid command returns two differ=
ent values,<br>
&gt;&gt;&gt; depending on the -k switch :<br>
&gt;&gt;&gt; # cpuid -l 0x40000000<br>
&gt;&gt;&gt; hypervisor_id (0x40000000) =3D &quot;\0\0\0\0\0\0\0\0\0\0\0\0&=
quot;<br>
&gt;&gt;&gt; # cpuid -k -l 0x40000000<br>
&gt;&gt;&gt; hypervisor_id (0x40000000) =3D &quot;XenVMMXenVMM&quot;<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m afraid I can&#39;t comment on this without knowing what to=
ol you&#39;re<br>
&gt;&gt; taking about. Neither of the two systems I checked have one of thi=
s<br>
&gt;&gt; name.<br>
&gt;&gt;<br>
&gt;&gt;&gt;&gt; Yet relying on DMI is fragile, too: Along the lines of<br>
&gt;&gt;&gt;&gt; <a href=3D"https://lists.xen.org/archives/html/xen-devel/2=
022-01/msg00604.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xe=
n.org/archives/html/xen-devel/2022-01/msg00604.html</a><br>
&gt;&gt;&gt;&gt; basically any value in there could be &quot;inherited&quot=
; from the host (i.e.<br>
&gt;&gt;&gt;&gt; from the layer below, to be precise).<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; So using &quot;/sys/class/dmi/id/sys_vendor&quot;, or simply d=
oing &quot;dmesg | grep<br>
&gt;&gt;&gt; DMI:&quot; is also not perfect, as values can be inherited/spo=
ofed by<br>
&gt;&gt;&gt; underneath hypervisor ?<br>
&gt;&gt;<br>
&gt;&gt; That&#39;s my understanding, yes.<br>
&gt;&gt;<br>
&gt;&gt;&gt;&gt; The only way to be reasonably<br>
&gt;&gt;&gt;&gt; certain is to ask Xen about its view. The raw or host feat=
uresets<br>
&gt;&gt;&gt;&gt; should give you this information, in the &quot;mirror&quot=
; of said respective<br>
&gt;&gt;&gt;&gt; CPUID leave&#39;s &quot;hypervisor&quot; bit.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; As said above, I&#39;m clueless, can you expand please ?<br>
&gt;&gt;<br>
&gt;&gt; Xen&#39;s public interface offers access to the featuresets known =
/ found /<br>
&gt;&gt; used by the hypervisor. See XEN_SYSCTL_get_cpu_featureset, accessi=
ble<br>
&gt;&gt; via xc_get_cpu_featureset().<br>
&gt;&gt;<br>
&gt; <br>
&gt; Are any of these exposed in dom0 via sysctl, or hypfs?<br>
<br>
sysctl - yes (as the quoted name also says). hypfs no, afaict.<br></blockqu=
ote><div><br></div><div>Sorry, that was a typo; I meant Linux&#39;s sysfs.=
=C2=A0 But of course if it&#39;s a sysctl, I expect that to be a &quot;no&q=
uot;.</div><div><br></div><div>=C2=A0-George</div><div>=C2=A0</div></div></=
div>

--000000000000b48efe05ffe5599c--

