Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C78560DF9F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 13:35:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430476.682205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onegI-0000YU-NU; Wed, 26 Oct 2022 11:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430476.682205; Wed, 26 Oct 2022 11:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onegI-0000VF-Kh; Wed, 26 Oct 2022 11:34:46 +0000
Received: by outflank-mailman (input) for mailman id 430476;
 Wed, 26 Oct 2022 11:34:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/Fg=23=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1onegH-0000V9-Q5
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 11:34:45 +0000
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [2607:f8b0:4864:20::1129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 300db0b0-5522-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 13:34:44 +0200 (CEST)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-369c2f83697so136552167b3.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Oct 2022 04:34:44 -0700 (PDT)
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
X-Inumbo-ID: 300db0b0-5522-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4jtWY1izdVLRWtNkMLA9QHRnU+c79+aaIwQzbBtRnTg=;
        b=h6n7rYY9VIdSq53oe2a3k1wECaDtKJFWta6fGn94Sxa+4V5YcK37+hf7jHuCQQ4t46
         u8I6Q0nNv73S3+4OLW6GXhBA+m2KUkXh6fhV8hxF2CYuMFGhzY8uIbBYnIhL80Zx10PB
         EJxjFE1Aotw9P9alm33cuUNVIj+PMllks8IkXgJjyqVRf6vYvs7bLyA4eMi0j1f+R9w3
         5Ot6wEnbCSe8q3NyEZLzN4FqIPUcnMuTyv64CH6z7pda8IXevQA2EsVU6SqHqLH0dNSa
         fX3Pea33M8j9IVEII6z+VYTaZYuO+fmRLDRIllp4XqBAr/MqthKZpmvmuBO/qfFuKJqa
         2YAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4jtWY1izdVLRWtNkMLA9QHRnU+c79+aaIwQzbBtRnTg=;
        b=kYgCMGoCDEdEJPDTdgrsDPCb2Ff9tS70Uf1lkNj6vhnoc3cBfE8IFpyjBG70Phq6ra
         dTnCY8Ngx0ZmAjp47vJ0iHoF74WtoEyz2fpnIeDRdJMhFrDPrsXqe53YlXtdNLQfD8SN
         h8PpIT7/6QRaCtzlqDmtH7YOf/hlIFxGyo+A1C3CM8huInCqkpBc2oto5Jsxn93bNY7s
         0JOf1QnhJ6VSJmaSodJXrK3F8yEspueDqY495TFmwki6I508UHX5vRFn7mH43AiW7Lr3
         hJ2Mke5XMyUDsugHg4wpq8lnV5NYpQrtIUWqncuHsYdTOra7Nw/sFT1zk3/sOK25KhW2
         +Gqg==
X-Gm-Message-State: ACrzQf2E3H9fqKhSGO358kt/Zss5J4XaiOdOzlJeaACQnTly3GgCIpVU
	SEe/d0P4b54PgJHrkB3a19/bTLbnKMes6AiBZPw=
X-Google-Smtp-Source: AMsMyM663RanbA3obv/EBlnVL8Z+n+u67smkhijARG8vAfoFAXnR5mWFQ82C1+i1IKv5u6spWcdw2jU4CXd0SiZEEWo=
X-Received: by 2002:a81:a109:0:b0:367:efbe:e1f0 with SMTP id
 y9-20020a81a109000000b00367efbee1f0mr32256261ywg.365.1666784082649; Wed, 26
 Oct 2022 04:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <854cdedcdd2bfff08ea45a3c13367c610d710aaf.1666630317.git.tamas.lengyel@intel.com>
 <0c7ca888-3142-1719-13c2-4f006ecdf683@citrix.com>
In-Reply-To: <0c7ca888-3142-1719-13c2-4f006ecdf683@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 26 Oct 2022 07:34:31 -0400
Message-ID: <CABfawh=RXrPgj+MA-4QGogM0o3Oo4GEJ3ipbqHKE0TV4GHdCTg@mail.gmail.com>
Subject: Re: [PATCH] xen/x86: Make XEN_DOMCTL_get_vcpu_msrs more configurable
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Content-Type: multipart/alternative; boundary="00000000000029e55f05ebee69d7"

--00000000000029e55f05ebee69d7
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 26, 2022, 7:06 AM Andrew Cooper <Andrew.Cooper3@citrix.com>
wrote:

> On 24/10/2022 17:58, Tamas K Lengyel wrote:
> > Currently the XEN_DOMCTL_get_vcpu_msrs is only capable of gathering a
> handful
> > of predetermined vcpu MSRs. In our use-case gathering the vPMU MSRs by an
> > external privileged tool is necessary, thus we extend the domctl to
> allow for
> > querying for any guest MSRs. To remain compatible with the existing
> setup if
> > no specific MSR is requested via the domctl the default list is returned.
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
>
> Naming aside, XEN_DOMCTL_{get,set}_vcpu_msrs is supposed to be "get me
> all MSRs needed to migrate a vCPU".  (I do intend to retire the
> hypercall as part of fixing the Xen side of migration, but that's ages
> away)
>
> It seems like what you want is something more like
> XEN_DOMCTL_{rd,wr}msr_list  (convenient timing, given the recent ISE
> update).  I think those would be better as a separate pair of
> hypercalls, rather than trying to repurpose an existing hypercall.
>
>
> As for actually getting the values, please fix up guest_{rd,wr}msr() to
> access the perf MSRs safely.  I know the vpmu MSR handling is in a
> tragic state, but this new get_msr subop is making the problem even more
> tangled.
>

Adding a separate hypercall is fine. Unfortunately wiring it into
guest_rdmsr failed on the first attempt when I tried. This is because the
guest itself will hit that path when it reads its own vpmu msrs. The
guest_rdmsr actually fails in that path and a separate fall-back path is
where the vpmu do_rdmsr is called. Now if I wire in the vpmu msrs into
guest_rdmsr I short circuit the existing setup and it looked like a can of
worms. I would have to figure out who is trying to get the vpmu msrs and do
things differently based on that, and the only info we have is if v ==
current. That just looked fragile to me.

Tamas

>

--00000000000029e55f05ebee69d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Oct 26, 2022, 7:06 AM Andrew Cooper &lt;<a hre=
f=3D"mailto:Andrew.Cooper3@citrix.com">Andrew.Cooper3@citrix.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">On 24/10/2022 17:58, Tamas K L=
engyel wrote:<br>
&gt; Currently the XEN_DOMCTL_get_vcpu_msrs is only capable of gathering a =
handful<br>
&gt; of predetermined vcpu MSRs. In our use-case gathering the vPMU MSRs by=
 an<br>
&gt; external privileged tool is necessary, thus we extend the domctl to al=
low for<br>
&gt; querying for any guest MSRs. To remain compatible with the existing se=
tup if<br>
&gt; no specific MSR is requested via the domctl the default list is return=
ed.<br>
&gt;<br>
&gt; Signed-off-by: Tamas K Lengyel &lt;<a href=3D"mailto:tamas.lengyel@int=
el.com" target=3D"_blank" rel=3D"noreferrer">tamas.lengyel@intel.com</a>&gt=
;<br>
<br>
Naming aside, XEN_DOMCTL_{get,set}_vcpu_msrs is supposed to be &quot;get me=
<br>
all MSRs needed to migrate a vCPU&quot;.=C2=A0 (I do intend to retire the<b=
r>
hypercall as part of fixing the Xen side of migration, but that&#39;s ages =
away)<br>
<br>
It seems like what you want is something more like<br>
XEN_DOMCTL_{rd,wr}msr_list=C2=A0 (convenient timing, given the recent ISE<b=
r>
update).=C2=A0 I think those would be better as a separate pair of<br>
hypercalls, rather than trying to repurpose an existing hypercall.<br>
<br>
<br>
As for actually getting the values, please fix up guest_{rd,wr}msr() to<br>
access the perf MSRs safely.=C2=A0 I know the vpmu MSR handling is in a<br>
tragic state, but this new get_msr subop is making the problem even more<br=
>
tangled.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Adding a separate hypercall is fine. Unfortunately wiring it into=
 guest_rdmsr failed on the first attempt when I tried. This is because the =
guest itself will hit that path when it reads its own vpmu msrs. The guest_=
rdmsr actually fails in that path and a separate fall-back path is where th=
e vpmu do_rdmsr is called. Now if I wire in the vpmu msrs into guest_rdmsr =
I short circuit the existing setup and it looked like a can of worms. I wou=
ld have to figure out who is trying to get the vpmu msrs and do things diff=
erently based on that, and the only info we have is if v =3D=3D current. Th=
at just looked fragile to me.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Tamas</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
</blockquote></div></div></div>

--00000000000029e55f05ebee69d7--

