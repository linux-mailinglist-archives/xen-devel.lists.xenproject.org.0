Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6B3554E9C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 17:05:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354089.581127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41v8-0005ZF-Ic; Wed, 22 Jun 2022 15:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354089.581127; Wed, 22 Jun 2022 15:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41v8-0005X6-Ep; Wed, 22 Jun 2022 15:05:30 +0000
Received: by outflank-mailman (input) for mailman id 354089;
 Wed, 22 Jun 2022 15:05:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sIgH=W5=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1o41v6-0005Wd-Qu
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 15:05:28 +0000
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [2607:f8b0:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf49d918-f23c-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 17:05:27 +0200 (CEST)
Received: by mail-pg1-x533.google.com with SMTP id e63so14843878pgc.5
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jun 2022 08:05:27 -0700 (PDT)
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
X-Inumbo-ID: bf49d918-f23c-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m2fEB/71pwCE9eTd59Wtx1+QnU9ZX7ZeAeUZ1Zdu2CY=;
        b=HkBqb8OKZgr8BZAuwu7/uRTiw2h/4d1vkK/FDTWiKwXe3E759U+41JvecM5jDlJaaF
         q1W5c+Iibv6l/bMprfxNt/RCGGwO12DdL5DSO6O2qDN6h+7IB0hRqM6SftRcfAd6demW
         4kIdjdC16RxJqfMMMGP/SY6pLtX2ePobiaqPxNyS8L8ZFoW6j5RLJh71mWmvT+oHis/i
         /wfxtT31zJakpUivUDrpEqeW7OlEXAyKEQje73h7+lazcex4J8aAAU3+Yzb57b/qGRfi
         ra1eXDYVnrZip5Xl9hSFNY9E1+Ngn2hlSjANQrK4iAGGZefOKes4bDffYXeAtbE7LIcN
         hphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m2fEB/71pwCE9eTd59Wtx1+QnU9ZX7ZeAeUZ1Zdu2CY=;
        b=lNV6hqyujaTowivGDoNRC0mBPxf/ClgOGCG55vW47PWCqP9NfqQitPYysMw8sOd+55
         0xXJ8zH5JtztFO30KuuZXuubpjMQkjFBmN9DrZrH7Nxt6a0BS1BRXSV02vc8NjZSfSNX
         LXNWwDGS+4UHjvQHaIiqCee+1ATIEaczBLXk6KqZOTAktFzbkKAfiKU0SyasFBsdSeIz
         8msK7RwJZjfcea416NTbyYgUHQTKYNh+ultOtKNhdBfwUCfBOa0xVZiT9f/Xi10dJQ9M
         aJwz3eIRB4fcSJNnuIVLXBQ6a2C0880SXGJu0L/smgPXsD5AYq+56ookNfZ3clmSnhhm
         8wkA==
X-Gm-Message-State: AJIora+pA8v92yGnDkrwTY0mdSBayswB6dQkTwJ0FWDSO9twO/zwI2Pe
	LM+pQKwYjSSo6WTARdi8FYV+cjCAuoZPsQlP9W8=
X-Google-Smtp-Source: AGRyM1uVcd6HHyGLdfbG38FwTiu27y4hzDKVXD9r3fCHwb6GrneqzFQLlpMcEhleSM/1EFdJbM/D4rg8aWR5ILZl4SY=
X-Received: by 2002:aa7:9f9b:0:b0:525:1e0a:a6b4 with SMTP id
 z27-20020aa79f9b000000b005251e0aa6b4mr18385997pfr.5.1655910325447; Wed, 22
 Jun 2022 08:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220414091538.jijj4lbrkjiby6el@vireshk-i7> <CAPD2p-ks4ZxWB8YT0pmX1sF_Mu2H+n_SyvdzE8LwVP_k_+Biog@mail.gmail.com>
 <20220622114950.lpidph5ugvozhbu5@vireshk-i7>
In-Reply-To: <20220622114950.lpidph5ugvozhbu5@vireshk-i7>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Wed, 22 Jun 2022 18:05:13 +0300
Message-ID: <CAPD2p-kFeC8FygFcbpEbH3CzrAM7Td+G68t9ebOFR4V0w1dpEQ@mail.gmail.com>
Subject: Re: Virtio on Xen with Rust
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Stratos Mailing List <stratos-dev@op-lists.linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Mike Holmes <mike.holmes@linaro.org>, Wei Liu <wl@xen.org>, 
	xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, 
	Julien Grall <julien@xen.org>
Content-Type: multipart/alternative; boundary="000000000000ba6ecc05e20aaae9"

--000000000000ba6ecc05e20aaae9
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 22, 2022 at 2:49 PM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

> On 28-04-22, 16:52, Oleksandr Tyshchenko wrote:
> > FYI, currently we are working on one feature to restrict memory access
> > using Xen grant mappings based on xen-grant DMA-mapping layer for Linux
> [1].
> > And there is a working PoC on Arm based on an updated virtio-disk. As for
> > libraries, there is a new dependency on "xengnttab" library. In
> comparison
> > with Xen foreign mappings model (xenforeignmemory),
> > the Xen grant mappings model is a good fit into the Xen security model,
> > this is a safe mechanism to share pages between guests.
>
> Hi Oleksandr,
>

Hello Viresh

[sorry for the possible format issues]


>
> I started getting this stuff into our work and have few questions.
>
> - IIUC, with this feature the guest will allow the host to access only
> certain
>   parts of the guest memory, which is exactly what we want as well. I
> looked at
>   the updated code in virtio-disk and you currently don't allow the grant
> table
>   mappings along with MAP_IN_ADVANCE, is there any particular reason for
> that ?
>


MAP_IN_ADVANCE is the optimization which is only applicable if all incoming
addresses are guest physical addresses and the backend is allowed to map
arbitrary guest pages using foreign mappings.
This is an option to demonstrate how the trusted backend (running in dom0,
for example) can pre-map guest memory in advance and just only calculate a
host address at the runtime based on the incoming gpa which is used as an
offset (there are no xenforeignmemory_map/xenforeignmemory_unmap calls
every request). But if the guest uses grant mappings for the virtio
(CONFIG_XEN_VIRTIO=y), all incoming addresses are grants instead of gpa
(even the virtqueue descriptor rings addresses are grants). Even leaving
aside the fact that restricted virtio memory access in the guest means that
not all of guest memory can be accessed, so even having pre-maped guest
memory in advance, we are not able to calculate a host pointer as we don't
know which gpa the particular grant belongs to.



>
> - I understand that you currently map on the go, the virqueue descriptor
> rings
>   and then the protocol specific addresses later on, once virtio requests
> are
>   received from the guest.
>
>   But in our case, Vhost user with Rust based hypervisor agnostic backend,
> the
>   vhost master side can send a number of memory regions for the slave
> (backend)
>   to map and the backend won't try to map anything apart from that. The
>   virtqueue descriptor rings are available at this point and can be sent,
> but
>   not the protocol specific addresses, which are available only when a
> virtio
>   request comes.


> - And so we would like to map everything in advance, and access only the
> parts
>   which we need to, assuming that the guest would just allow those (as the
>   addresses are shared by the guest itself).
>
> - Will that just work with the current stuff ?
>


I am not sure that I understand this use-case.
Well, let's consider the virtio-disk example, it demonstrates three
possible memory mapping modes:
1. All addresses are gpa, map/unmap at runtime using foreign mappings
2. All addresses are gpa, map in advance using foreign mappings
3. All addresses are grants, only map/unmap at runtime using grants mappings

If you are asking about #4 which would imply map in advance together with
using grants then I think, no. This won't work with the current stuff.
These are conflicting opinions, either grants and map at runtime or gpa and
map in advance.
If there is a wish to optimize when using grants then "maybe" it is worth
looking into how persistent grants work for PV block device for example
(feature-persistent in blkif.h).



>
> - In Linux's drivers/xen/gntdev.c, we have:
>
>   static unsigned int limit = 64*1024;
>
>   which translates to 256MB I think, i.e. the max amount of memory we can
> map at
>   once. Will making this 128*1024 allow me to map 512 MB for example in a
> single
>   call ? Any other changes required ?
>

I am not sure, but I guess the total number is limited by the hypervisor
itself. Could you try to increase gnttab_max_frames in the first place?



>
> - When I tried that, I got few errors which I am still not able to fix:
>
>   The IOCTL_GNTDEV_MAP_GRANT_REF ioctl passed but there were failures after
>   that:
>
>   (XEN) common/grant_table.c:1055:d0v2 Bad ref 0x40000 for d1
>   (XEN) common/grant_table.c:1055:d0v2 Bad ref 0x40001 for d1
>
>   ...
>
>   (XEN) common/grant_table.c:1055:d0v2 Bad ref 0x5fffd for d1
>   (XEN) common/grant_table.c:1055:d0v2 Bad ref 0x5fffe for d1
>   (XEN) common/grant_table.c:1055:d0v2 Bad ref 0x5ffff for d1
>   gnttab: error: mmap failed: Invalid argument
>
>
> I am working on Linus's origin/master along with the initial patch from
> Juergen,
> picked your Xen patch for iommu node.
>

Yes, this is the correct environment. Please note that Juergen has recently
pushed new version [1]


>
> I am still at initial stages to properly test this stuff, just wanted to
> share
> the progress to help myself save some of the time debugging this :)
>
> Thanks.
>
> --
> viresh
>

[1] https://lore.kernel.org/xen-devel/20220622063838.8854-1-jgross@suse.com/



-- 
Regards,

Oleksandr Tyshchenko

--000000000000ba6ecc05e20aaae9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 22, 2022 at 2:49 PM Vires=
h Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org">viresh.kumar@linaro.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On 28-04-22, 16:52, Oleksandr Tyshchenko wrote:<br>
&gt; FYI, currently we are working on one feature to restrict memory access=
<br>
&gt; using Xen grant mappings based on xen-grant DMA-mapping layer for Linu=
x [1].<br>
&gt; And there is a working PoC on Arm based on an updated virtio-disk. As =
for<br>
&gt; libraries, there is a new dependency on &quot;xengnttab&quot; library.=
 In comparison<br>
&gt; with Xen foreign mappings model (xenforeignmemory),<br>
&gt; the Xen grant mappings model is a good fit into the Xen security model=
,<br>
&gt; this is a safe mechanism to share pages between guests.<br>
<br>
Hi Oleksandr,<br></blockquote><div><br></div><div>Hello=C2=A0Viresh</div><d=
iv><br></div><div>[sorry for the possible format issues]</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I started getting this stuff into our work and have few questions.<br>
<br>
- IIUC, with this feature the guest will allow the host to access only cert=
ain<br>
=C2=A0 parts of the guest memory, which is exactly what we want as well. I =
looked at<br>
=C2=A0 the updated code in virtio-disk and you currently don&#39;t allow th=
e grant table<br>
=C2=A0 mappings along with MAP_IN_ADVANCE, is there any particular reason f=
or that ?<br></blockquote><div><br></div><div>=C2=A0<br></div><div>MAP_IN_A=
DVANCE is the optimization which is only applicable if all incoming address=
es are guest physical addresses and the backend is allowed to map arbitrary=
 guest pages using foreign mappings. <br>This is an option to demonstrate h=
ow the trusted backend (running in dom0, for example) can pre-map guest mem=
ory in advance and just only calculate a host address at the runtime based =
on the incoming gpa which is used as an offset (there are no xenforeignmemo=
ry_map/xenforeignmemory_unmap calls every request). But if the guest uses g=
rant mappings for the virtio (CONFIG_XEN_VIRTIO=3Dy), all incoming addresse=
s are grants instead of gpa (even the virtqueue descriptor rings addresses =
are grants). Even leaving aside the fact that restricted virtio memory acce=
ss in the guest means that not all of guest memory can be accessed, so even=
 having pre-maped guest memory in advance, we are not able to calculate a h=
ost pointer as we don&#39;t know which gpa the particular grant belongs to.=
=C2=A0=C2=A0<br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
- I understand that you currently map on the go, the virqueue descriptor ri=
ngs<br>
=C2=A0 and then the protocol specific addresses later on, once virtio reque=
sts are<br>
=C2=A0 received from the guest.<br>
<br>
=C2=A0 But in our case, Vhost user with Rust based hypervisor agnostic back=
end, the<br>
=C2=A0 vhost master side can send a number of memory regions for the slave =
(backend)<br>
=C2=A0 to map and the backend won&#39;t try to map anything apart from that=
. The<br>
=C2=A0 virtqueue descriptor rings are available at this point and can be se=
nt, but<br>
=C2=A0 not the protocol specific addresses, which are available only when a=
 virtio<br>
=C2=A0 request comes.</blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
- And so we would like to map everything in advance, and access only the pa=
rts<br>
=C2=A0 which we need to, assuming that the guest would just allow those (as=
 the<br>
=C2=A0 addresses are shared by the guest itself).<br>
<br>
- Will that just work with the current stuff ?<br></blockquote><div><br></d=
iv><div><br></div><div>I am not sure that I understand this use-case.<br>We=
ll, let&#39;s consider the virtio-disk example, it demonstrates three possi=
ble memory mapping modes:<br>1. All addresses are gpa, map/unmap at runtime=
 using foreign mappings<br>2. All addresses are gpa, map in advance using f=
oreign mappings<br>3. All addresses are grants, only map/unmap at runtime u=
sing grants mappings<br><br>If you are asking about #4 which would imply ma=
p in advance together with using grants then I think, no. This won&#39;t wo=
rk with the current stuff. These are conflicting opinions, either grants an=
d map at runtime or gpa and map in advance.<br>If there is a wish to optimi=
ze when using grants then &quot;maybe&quot; it is worth looking into how pe=
rsistent grants work for PV block device=C2=A0for=C2=A0example (feature-per=
sistent in blkif.h).=C2=A0 =C2=A0<br></div><div><br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
- In Linux&#39;s drivers/xen/gntdev.c, we have:<br>
<br>
=C2=A0 static unsigned int limit =3D 64*1024;<br>
<br>
=C2=A0 which translates to 256MB I think, i.e. the max amount of memory we =
can map at<br>
=C2=A0 once. Will making this 128*1024 allow me to map 512 MB for example i=
n a single<br>
=C2=A0 call ? Any other changes required ?<br></blockquote><div><br></div><=
div>I am not sure, but I guess the total number is limited by the hyperviso=
r itself. Could you try to increase gnttab_max_frames in the first place?</=
div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
- When I tried that, I got few errors which I am still not able to fix:<br>
<br>
=C2=A0 The IOCTL_GNTDEV_MAP_GRANT_REF ioctl passed but there were failures =
after<br>
=C2=A0 that:<br>
<br>
=C2=A0 (XEN) common/grant_table.c:1055:d0v2 Bad ref 0x40000 for d1<br>
=C2=A0 (XEN) common/grant_table.c:1055:d0v2 Bad ref 0x40001 for d1<br>
<br>
=C2=A0 ...<br>
<br>
=C2=A0 (XEN) common/grant_table.c:1055:d0v2 Bad ref 0x5fffd for d1<br>
=C2=A0 (XEN) common/grant_table.c:1055:d0v2 Bad ref 0x5fffe for d1<br>
=C2=A0 (XEN) common/grant_table.c:1055:d0v2 Bad ref 0x5ffff for d1<br>
=C2=A0 gnttab: error: mmap failed: Invalid argument<br>
<br>
<br>
I am working on Linus&#39;s origin/master along with the initial patch from=
 Juergen,<br>
picked your Xen patch for iommu node.<br></blockquote><div><br></div><div>Y=
es, this is the correct environment. Please note that Juergen has recently =
pushed new version [1]</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
I am still at initial stages to properly test this stuff, just wanted to sh=
are<br>
the progress to help myself save some of the time debugging this :)<br>
<br>
Thanks.<br>
<br>
-- <br>
viresh<br></blockquote><div><br></div><div>[1]=C2=A0<a href=3D"https://lore=
.kernel.org/xen-devel/20220622063838.8854-1-jgross@suse.com/">https://lore.=
kernel.org/xen-devel/20220622063838.8854-1-jgross@suse.com/</a>=C2=A0</div>=
</div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" class=3D"gma=
il_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">=
<span style=3D"background-color:rgb(255,255,255)"><font size=3D"2"><span st=
yle=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Regards,</span></f=
ont></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div><span sty=
le=3D"background-color:rgb(255,255,255)"><font size=3D"2">Oleksandr Tyshche=
nko</font></span></div></div></div></div></div></div></div></div>

--000000000000ba6ecc05e20aaae9--

