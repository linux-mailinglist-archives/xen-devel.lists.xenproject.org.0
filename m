Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3871B41304B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 10:43:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191577.341666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSbMg-0001Ut-Qa; Tue, 21 Sep 2021 08:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191577.341666; Tue, 21 Sep 2021 08:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSbMg-0001RO-Lp; Tue, 21 Sep 2021 08:42:58 +0000
Received: by outflank-mailman (input) for mailman id 191577;
 Tue, 21 Sep 2021 08:42:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWt1=OL=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1mSbMe-0001RI-IP
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 08:42:56 +0000
Received: from mail-oi1-x232.google.com (unknown [2607:f8b0:4864:20::232])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d514461-600e-4a08-8b8b-8ef0d48f4c91;
 Tue, 21 Sep 2021 08:42:55 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id 24so7619209oix.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Sep 2021 01:42:55 -0700 (PDT)
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
X-Inumbo-ID: 4d514461-600e-4a08-8b8b-8ef0d48f4c91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NvE6Ye47LR0TteUVXln1IsRXjg42V7WUT9XlhMTBCws=;
        b=UTZI9WhoM/P7Wkf5vlXwbbuVUEPqVQELG5W09fwrlq2jVMCl5V9Mp0MzRYwoqyNAsq
         j3m9HosZXGo6lm4dbfL/u7lY7ZmlRyL0ppZKgsM9wRC9eH6y93euNCRWHDvelzwlxDsQ
         g81vq5WGzFw535YeEyBSx5q6GKJxy5s+YkyVK+NOPgFfS0caV07MwIHvZFLzdvKzkCLQ
         HBh3utvL6pJS3LR7vaWMXiEStW8muXSgUNLbwyYHC4mTHVa6MDjwhZwwfJ7xvtxY5iNT
         FTwE/Px8l9ymJ3ImTJEG2Rr8s+ionL+ieOyLpQneSPU8rvbIfqKJ6yqWZmbFgovxMctc
         /K/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NvE6Ye47LR0TteUVXln1IsRXjg42V7WUT9XlhMTBCws=;
        b=NWOwR8IyCOalgq+hC7vNcduZJLqCv151htTgQJwQ/JH6Zj7H5VMVwaTR5djg30bcKn
         YUKrVr2h5wvHOBRDEIVWxMDFXkxLyTcNT8FG393oPFmLB4ufxMPi+fu9e4b8BvoT3aCp
         bF8t8duszqEojCMJ53x2+MukhyNlXdhuSNmsWVXOUR3uEq2FDBOqoyiTXhbEsscQZsic
         15/vMJWCFS2CnGTywnkDx9+2LGpE/+BeTV3ss+Cw+aYp95cuhGDy69heOEfS3/OGCpec
         OiRnTuWNIGgxkCO8ZojjmUhVtaiYeVrwhXqi224ovYtVChBvJEwrDNzgyA0Zh2oScV3o
         eopw==
X-Gm-Message-State: AOAM53044z7q/Zu1gpqGGQ/5WmF7jamJLW2DLMk2BALR+Fj+c3/26nYx
	DNzMh9UPRkI6D7yWjtSWHcA+gIF+Y8m/cC32NFM=
X-Google-Smtp-Source: ABdhPJybzOXPasHC7W/GTuPP+KISuIjezig8BMq/GrM7LgAD0XO9wOGEgecvHQYPmpf8UzhkHJ0STUkUJ0UpK9Vw7bI=
X-Received: by 2002:a54:4d8f:: with SMTP id y15mr2685122oix.122.1632213774708;
 Tue, 21 Sep 2021 01:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2109131441520.10523@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109131441520.10523@sstabellini-ThinkPad-T480s>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 21 Sep 2021 01:42:43 -0700
Message-ID: <CACMJ4GZGk_Rz0T+uZpKYxwLBgwudbR7KVzP1LhY7O2W++Zq0qg@mail.gmail.com>
Subject: Re: Dom0less + Argo enablement
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Alec.Kwapis@dornerworks.com, 
	Jason Andryuk <jandryuk@gmail.com>, eric chanudet <eric.chanudet@gmail.com>, james.mckenzie@hp.com, 
	christian.limpach@hp.com, Daniel Smith <dpsmith@apertussolutions.com>, 
	Rich Persaud <persaur@gmail.com>, openxt <openxt@googlegroups.com>, 
	Nicholas Tsirakis <tsirakisn@ainfosec.com>
Content-Type: multipart/alternative; boundary="0000000000003d350c05cc7d6259"

--0000000000003d350c05cc7d6259
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 3:41 PM Stefano Stabellini <sstabellini@kernel.org>
wrote:

> Hi all,
>
> This email is for anybody interested in using Argo with Dom0less setups
> for domain-to-domain communications.
>
> Argo is a secure VM-to-VM communication mechanism based on hypercalls
> [1]. It is a good fit for Dom0less setups because Argo is lightweight
> and doesn't make use of PV frontends, backends, and xenstore. Thus, it
> is easier to enable in simple Dom0less setups where VMs are booting in
> parallel, backends cannot be assumed to be already up and running, and
> the goal is just to get two VMs to talk to each others.
>

Excellent - I am very happy to see interest in Argo for this


>
> Argo makes use of event channels for notifications. Dom0less VMs don't
> have event channels support yet, although it is work-in-progress. The
> attached patch for Linux (not ready for upstreaming) enables the
> necessary event channels initialization.
>
> In addition, you also need to add the following to the DomU device tree
> (see xen/arch/arm/domain_build.c:prepare_dtb_domU):
>
> event-channel {
>         compatible = "xen,xen-4.15", "xen,xen";
>         interrupts = <0x01 0x0f 0xf08>;
>         interrupt-parent = <0xfde8>;
> };
>
>
> The final pieces to enable Argo are:
> - CONFIG_ARGO in the Xen build
> - the Argo Linux kernel module
>   https://github.com/OpenXT/linux-xen-argo


This is an important pointer. The argo-linux directory in the repo contains
the source for the current best Linux Argo driver, which has been in use
and actively maintained in OpenXT for an extended period. It is derived
from the original XenClient v4v driver -- Nicolas Tsirakis did great work
porting all the OpenXT v4v software over to this Argo driver and the
libargo userspace component when we migrated. Jason Andryuk has recently
just completed some strong modernization work that advances this Argo
driver's use of Linux synchronization primitives.

For the curious, an alternative Linux Argo driver written by Eric Chanudet
is in also the same repository in the vsock-argo directory: it explores a
different approach for Linux to use the Argo primitives under the Vsock
address family to allow socket communication between Xen domains. A third
code base that could be of interest for developing a new Linux driver for
Argo would be a port of the HP uxen hypervisor's v4v driver, which has a
good modular structure, to Argo on Xen. The code for the starting point
(for a fairly adventurous project) is here:
https://github.com/uxen-virt/uxen/tree/ascara/vm-support/linux


> - the Yocto recipe was based on
>   https://github.com/dozylynx/meta-argo-linux


Ack - this Yocto layer shows recipes for the several components involved
with building an Argo-enabled system.


>
> - pass dom0less_domU to the domU kernel command line


>
> Then you are good to go for using Argo in your Dom0less VMs, e.g.:
>
> From receiver domain: streamTest -domid 5 -port 8022 -file test.txt
> -receive
> From sender domain: streamTest -domid 4 -port 8022 -file test.txt -send
> -connect
>
> Many thanks to Alec Kwapis from DornerWorks for all the information and
> the patch!
>

Thanks, Alec, for exploring Argo with dom0less and for developing the patch
-- excellent work! I am certain that it will be helpful.

Christopher



>
> Cheers,
>
> Stefano
>
>
> [1]
> https://wiki.xenproject.org/wiki/Argo:_Hypervisor-Mediated_Exchange_(HMX)_for_Xen

--0000000000003d350c05cc7d6259
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Sep 13, 2021 at 3:41 PM Stefano S=
tabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.=
org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Hi all,<br>
<br>
This email is for anybody interested in using Argo with Dom0less setups<br>
for domain-to-domain communications.<br>
<br>
Argo is a secure VM-to-VM communication mechanism based on hypercalls<br>
[1]. It is a good fit for Dom0less setups because Argo is lightweight<br>
and doesn&#39;t make use of PV frontends, backends, and xenstore. Thus, it<=
br>
is easier to enable in simple Dom0less setups where VMs are booting in<br>
parallel, backends cannot be assumed to be already up and running, and<br>
the goal is just to get two VMs to talk to each others.<br></blockquote><di=
v><br></div><div>Excellent - I am very happy to see interest in Argo for th=
is<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
Argo makes use of event channels for notifications. Dom0less VMs don&#39;t<=
br>
have event channels support yet, although it is work-in-progress. The<br>
attached patch for Linux (not ready for upstreaming) enables the<br>
necessary event channels initialization.<br>
<br>
In addition, you also need to add the following to the DomU device tree<br>
(see xen/arch/arm/domain_build.c:prepare_dtb_domU):<br>
<br>
event-channel {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;xen,xen-4.15&quot;, &quot;=
xen,xen&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupts =3D &lt;0x01 0x0f 0xf08&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupt-parent =3D &lt;0xfde8&gt;;<br>
};<br>
<br>
<br>
The final pieces to enable Argo are:<br>
- CONFIG_ARGO in the Xen build<br>
- the Argo Linux kernel module<br>
=C2=A0 <a href=3D"https://github.com/OpenXT/linux-xen-argo" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/OpenXT/linux-xen-argo</a></blockqu=
ote><div><br></div><div>This is an important pointer. The argo-linux direct=
ory in the repo contains the source for the current best Linux Argo driver,=
 which has been in=C2=A0use and actively maintained in OpenXT for an extend=
ed period. It is derived from the original XenClient v4v driver -- Nicolas =
Tsirakis did great work porting all the OpenXT v4v software over to this Ar=
go driver and the libargo userspace component when we migrated. Jason Andry=
uk has recently just completed some strong modernization work that advances=
 this Argo driver&#39;s use of Linux synchronization primitives.=C2=A0</div=
><div><br></div><div>For the curious, an alternative Linux Argo driver writ=
ten by Eric Chanudet is in also the same repository in the vsock-argo direc=
tory: it explores a different approach for Linux to use the Argo primitives=
 under the Vsock address family to allow socket communication between Xen d=
omains. A third code base that could be of interest for developing a new Li=
nux driver for Argo would be a port of the HP uxen hypervisor&#39;s=C2=A0v4=
v driver, which has a good modular structure, to Argo on Xen. The code for =
the starting point (for a fairly adventurous project) is here:</div><div><a=
 href=3D"https://github.com/uxen-virt/uxen/tree/ascara/vm-support/linux">ht=
tps://github.com/uxen-virt/uxen/tree/ascara/vm-support/linux</a><br></div><=
div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
- the Yocto recipe was based on<br>
=C2=A0 <a href=3D"https://github.com/dozylynx/meta-argo-linux" rel=3D"noref=
errer" target=3D"_blank">https://github.com/dozylynx/meta-argo-linux</a></b=
lockquote><div><br></div><div><div>Ack - this Yocto layer shows recipes for=
 the several components involved with building an Argo-enabled system.</div=
><div>=C2=A0<br></div></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><br>
- pass dom0less_domU to the domU kernel command line=C2=A0</blockquote><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
Then you are good to go for using Argo in your Dom0less VMs, e.g.:<br>
<br>
From receiver domain: streamTest -domid 5 -port 8022 -file test.txt -receiv=
e <br>
From sender domain: streamTest -domid 4 -port 8022 -file test.txt -send -co=
nnect<br>
<br>
Many thanks to Alec Kwapis from DornerWorks for all the information and<br>
the patch!<br></blockquote><div><br></div><div>Thanks, Alec, for exploring =
Argo with dom0less=C2=A0and for developing the patch -- excellent work! I a=
m certain that it will be helpful.</div><div><br></div><div>Christopher</di=
v><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Cheers,<br>
<br>
Stefano<br>
<br>
<br>
[1] <a href=3D"https://wiki.xenproject.org/wiki/Argo:_Hypervisor-Mediated_E=
xchange_(HMX)_for_Xen" rel=3D"noreferrer" target=3D"_blank">https://wiki.xe=
nproject.org/wiki/Argo:_Hypervisor-Mediated_Exchange_(HMX)_for_Xen</a></blo=
ckquote></div></div>

--0000000000003d350c05cc7d6259--

