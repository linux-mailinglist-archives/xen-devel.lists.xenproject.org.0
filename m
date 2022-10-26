Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A99BE60E019
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 13:59:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430495.682245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onf3e-0004b8-AV; Wed, 26 Oct 2022 11:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430495.682245; Wed, 26 Oct 2022 11:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onf3e-0004Yy-7M; Wed, 26 Oct 2022 11:58:54 +0000
Received: by outflank-mailman (input) for mailman id 430495;
 Wed, 26 Oct 2022 11:58:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/Fg=23=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1onf3c-0004Yq-7x
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 11:58:52 +0000
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [2607:f8b0:4864:20::112d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e20b18f-5525-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 13:58:51 +0200 (CEST)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-35befab86a4so144496537b3.8
 for <xen-devel@lists.xenproject.org>; Wed, 26 Oct 2022 04:58:51 -0700 (PDT)
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
X-Inumbo-ID: 8e20b18f-5525-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FNNv/mTy2IZyL2oJu7ZW8qmThCOYZYrApLznQoY3Pwo=;
        b=Kpo8VPAx9SVcgGqAC5Nb98jM/seoYnkNPXAWyZwIdq4nmVEfJuXUZTENRRIsv2h3gZ
         1uk75k/fIbdoHw7bHftkoviFbV7+JRRTCpSyOgHJ8hJbVLOKrWovceh3DVPiUpEtIuam
         1ZTjTZCk27TyiIH+iaQkKuPMf4tR6Bz0sGwr594pvD0f5CBqEHRthTmAiLJstiiuNwwh
         9h3oOW4TItvhN4US3nRvdbYkL0vJky8ZZ/WS+mQmZbs8DhwxqrIRmQ9pB5LoRX+Y/YNB
         hb9Vaxc0RWut7FkIh0LajhpCj7dHVoZhgXt7rS9YEK7up+Tb7WGxiU0iqnsjjCv+59IZ
         xWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNNv/mTy2IZyL2oJu7ZW8qmThCOYZYrApLznQoY3Pwo=;
        b=nObpMLBHCcfLUH9Q4sXe6Wm0ZwNAu/9GGnGfE4ybVuFmYBLI1KKF+nvMg+Zqmo7pBY
         Gfi+b0iZ0CmLXlk+Jmpct2mvh4wsTpGyjUcf2CNxZofy9DJfPS3wSnrEe8gqnzRsM1PZ
         rEoXmS0xVsRgPy8KJwCmQsnER8api/DSQcsxkM0m+CE3IH2f/jEis1wxofTbtQBas+d4
         zhififihdh7/XP65LsKDro9RttXTplTJ6Mub+iE7rzD8cnGOugaXw0E1yVmwFxf+yX7p
         83NleoGgay8Skl1psN+RPyW6kA0SY++leTN/cTxVMvJkNLYwe3fgOI9HVJtVMIzobtvo
         1/aA==
X-Gm-Message-State: ACrzQf09sjfTKLW+7REkV7DsvvpH0fiIhOGc4Ss81r7A1AqZ2cBbCLF0
	cxk6tfDA5vpg3SD6ZADX+yhUFZSvtX1ZukOhJjM=
X-Google-Smtp-Source: AMsMyM4w9LyKIfJwxj1siA/Zt3QL7HU/CRE5o0x0CZZiYTMLKLQmyBNdjzUB3e10ZpodHhvY6eFF8+l+kIDUwRxDH/k=
X-Received: by 2002:a81:1713:0:b0:36b:3a6b:4b49 with SMTP id
 19-20020a811713000000b0036b3a6b4b49mr20009316ywx.500.1666785529991; Wed, 26
 Oct 2022 04:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <854cdedcdd2bfff08ea45a3c13367c610d710aaf.1666630317.git.tamas.lengyel@intel.com>
 <0c7ca888-3142-1719-13c2-4f006ecdf683@citrix.com> <CABfawh=RXrPgj+MA-4QGogM0o3Oo4GEJ3ipbqHKE0TV4GHdCTg@mail.gmail.com>
 <f5673a0a-853e-fa2c-2f4c-e76b7b7aba87@suse.com>
In-Reply-To: <f5673a0a-853e-fa2c-2f4c-e76b7b7aba87@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 26 Oct 2022 07:58:38 -0400
Message-ID: <CABfawhmjcv0mu4cqjTaOPxgrOuMQ5VyAA1OoNtOmr6g34a6Ezw@mail.gmail.com>
Subject: Re: [PATCH] xen/x86: Make XEN_DOMCTL_get_vcpu_msrs more configurable
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Roger Pau Monne <roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, 
	Kevin Tian <kevin.tian@intel.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000006e97b305ebeebf52"

--0000000000006e97b305ebeebf52
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 26, 2022, 7:48 AM Jan Beulich <jbeulich@suse.com> wrote:

> On 26.10.2022 13:34, Tamas K Lengyel wrote:
> > On Wed, Oct 26, 2022, 7:06 AM Andrew Cooper <Andrew.Cooper3@citrix.com>
> > wrote:
> >
> >> On 24/10/2022 17:58, Tamas K Lengyel wrote:
> >>> Currently the XEN_DOMCTL_get_vcpu_msrs is only capable of gathering a
> >> handful
> >>> of predetermined vcpu MSRs. In our use-case gathering the vPMU MSRs by
> an
> >>> external privileged tool is necessary, thus we extend the domctl to
> >> allow for
> >>> querying for any guest MSRs. To remain compatible with the existing
> >> setup if
> >>> no specific MSR is requested via the domctl the default list is
> returned.
> >>>
> >>> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> >>
> >> Naming aside, XEN_DOMCTL_{get,set}_vcpu_msrs is supposed to be "get me
> >> all MSRs needed to migrate a vCPU".  (I do intend to retire the
> >> hypercall as part of fixing the Xen side of migration, but that's ages
> >> away)
> >>
> >> It seems like what you want is something more like
> >> XEN_DOMCTL_{rd,wr}msr_list  (convenient timing, given the recent ISE
> >> update).  I think those would be better as a separate pair of
> >> hypercalls, rather than trying to repurpose an existing hypercall.
> >>
> >>
> >> As for actually getting the values, please fix up guest_{rd,wr}msr() to
> >> access the perf MSRs safely.  I know the vpmu MSR handling is in a
> >> tragic state, but this new get_msr subop is making the problem even more
> >> tangled.
> >>
> >
> > Adding a separate hypercall is fine.
>
> Which will then also avoid altering the behavior of the existing hypercall:
> You can't just assume e.g. input fields to be zeroed (or otherwise
> suitably set) by existing callers, when those were previously output only.
>

I did add a memset to zero it on the single caller I could find.

Tamas

>

--0000000000006e97b305ebeebf52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Oct 26, 2022, 7:48 AM Jan Beulich &lt;<a href=
=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 26.10.2022 13:34, Tamas K Lengyel wrote:<br>
&gt; On Wed, Oct 26, 2022, 7:06 AM Andrew Cooper &lt;<a href=3D"mailto:Andr=
ew.Cooper3@citrix.com" target=3D"_blank" rel=3D"noreferrer">Andrew.Cooper3@=
citrix.com</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt;&gt; On 24/10/2022 17:58, Tamas K Lengyel wrote:<br>
&gt;&gt;&gt; Currently the XEN_DOMCTL_get_vcpu_msrs is only capable of gath=
ering a<br>
&gt;&gt; handful<br>
&gt;&gt;&gt; of predetermined vcpu MSRs. In our use-case gathering the vPMU=
 MSRs by an<br>
&gt;&gt;&gt; external privileged tool is necessary, thus we extend the domc=
tl to<br>
&gt;&gt; allow for<br>
&gt;&gt;&gt; querying for any guest MSRs. To remain compatible with the exi=
sting<br>
&gt;&gt; setup if<br>
&gt;&gt;&gt; no specific MSR is requested via the domctl the default list i=
s returned.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Tamas K Lengyel &lt;<a href=3D"mailto:tamas.len=
gyel@intel.com" target=3D"_blank" rel=3D"noreferrer">tamas.lengyel@intel.co=
m</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Naming aside, XEN_DOMCTL_{get,set}_vcpu_msrs is supposed to be &qu=
ot;get me<br>
&gt;&gt; all MSRs needed to migrate a vCPU&quot;.=C2=A0 (I do intend to ret=
ire the<br>
&gt;&gt; hypercall as part of fixing the Xen side of migration, but that&#3=
9;s ages<br>
&gt;&gt; away)<br>
&gt;&gt;<br>
&gt;&gt; It seems like what you want is something more like<br>
&gt;&gt; XEN_DOMCTL_{rd,wr}msr_list=C2=A0 (convenient timing, given the rec=
ent ISE<br>
&gt;&gt; update).=C2=A0 I think those would be better as a separate pair of=
<br>
&gt;&gt; hypercalls, rather than trying to repurpose an existing hypercall.=
<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; As for actually getting the values, please fix up guest_{rd,wr}msr=
() to<br>
&gt;&gt; access the perf MSRs safely.=C2=A0 I know the vpmu MSR handling is=
 in a<br>
&gt;&gt; tragic state, but this new get_msr subop is making the problem eve=
n more<br>
&gt;&gt; tangled.<br>
&gt;&gt;<br>
&gt; <br>
&gt; Adding a separate hypercall is fine.<br>
<br>
Which will then also avoid altering the behavior of the existing hypercall:=
<br>
You can&#39;t just assume e.g. input fields to be zeroed (or otherwise<br>
suitably set) by existing callers, when those were previously output only.<=
br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I=
 did add a memset to zero it on the single caller I could find.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Tamas</div><div dir=3D"auto"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000006e97b305ebeebf52--

