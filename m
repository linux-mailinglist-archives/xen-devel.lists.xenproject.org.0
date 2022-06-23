Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E51557C8B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 15:09:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354996.582414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4MaZ-0001NA-CE; Thu, 23 Jun 2022 13:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354996.582414; Thu, 23 Jun 2022 13:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4MaZ-0001Ji-8j; Thu, 23 Jun 2022 13:09:39 +0000
Received: by outflank-mailman (input) for mailman id 354996;
 Thu, 23 Jun 2022 13:09:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ht1C=W6=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1o4MaX-0001JY-Np
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 13:09:37 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba849139-f2f5-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 15:09:36 +0200 (CEST)
Received: by mail-pl1-x636.google.com with SMTP id m2so10864298plx.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jun 2022 06:09:36 -0700 (PDT)
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
X-Inumbo-ID: ba849139-f2f5-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8ZpsnAi80ADwSdHbB9vVM+jLuyC83SXa1tFmJtVfbe4=;
        b=fpdKsfBQLliRSMz5lKSS/dqP1O2KD4Pp6k8CH9WHVKpO801XloQf7MNpRRsv4WWzFB
         ZSXg4hWnF9rq3jNDPqRBYtUhyrOzhcOg1SaOAIQ632opfP8DO9kFeZRnyvSKpmS87uLg
         YBSvD3UGaDSqNMmzt8+ZmgWuth82P8IfF5FuCU4RS/ikBwkpggyzkR8AywbKuvV35asP
         q79j9EbFs29YsxpZzYgSoj9HyphteUG1nVMRfBhd3NEfvqQwMKc+CbRQgsMaM/BSZAGd
         kOEKDop0DV2a+N0eBjBE2NUBpR2GGVY/S9aRo7OtoNvi0A6iI64n5r8QexL2mAm9xCIb
         joxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8ZpsnAi80ADwSdHbB9vVM+jLuyC83SXa1tFmJtVfbe4=;
        b=0w6Mf9ML5+EKqn10Vo8UaTjuVN2V1OHaT/5KUt5xu6Wi/H8c9yUeo5b/iVu6ugcTAi
         R4wEjlBtKgGZE8P6Tm3lmcFP3ixUroxCWYplZSsds3GXIeG/9TAspJPSz5V5BHIgIkOd
         Jjoxw8w8Ojq5lxCCqamWesHHQifBbukH0TY38+2Sn3Zpum1QYSttzja60wNQAFiz6h1R
         Q9Ctf0WlVk9lhqsLnN/7plLPrTw0Sp9+nwzTX654DrLoAxrCkuhsM7fwF57rxSC0qtzE
         1E4wJVcYnPnyZhPFSklz7VMXoZWGpwn1l1wNB+cJ7/B0Pe6Zz5TyI1BYnTPNyxjUzhV1
         nL0Q==
X-Gm-Message-State: AJIora/IaAhV4h46fFKI4gsIKh9RlwRD2wb1wj0vPOdq47Pep87IiXEE
	cjHl76hQDCVD32Z277roUcRhIIT6YmIp539S6S4=
X-Google-Smtp-Source: AGRyM1umc+jYrRjqwAPBwtDTi5dQZ6aiWvqjxRi5w6Al/riZWF+BzoEB3goj2Ep9Y2GMpEvum2/w9bnsjcIlS1PGHpU=
X-Received: by 2002:a17:903:247:b0:168:ecca:444 with SMTP id
 j7-20020a170903024700b00168ecca0444mr38327200plh.121.1655989774507; Thu, 23
 Jun 2022 06:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <62903b8e-6c20-600e-8283-5a3e3b853a18@gmail.com>
 <1655482471-16850-1-git-send-email-olekstysh@gmail.com> <YrQ/VrfzScUVK+PK@perard.uk.xensource.com>
In-Reply-To: <YrQ/VrfzScUVK+PK@perard.uk.xensource.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Thu, 23 Jun 2022 16:09:23 +0300
Message-ID: <CAPD2p-=AewSzyvxVwxdNAvrVbRoUdrSu-ZnCjE0A9ZY8UZoDnQ@mail.gmail.com>
Subject: Re: [PATCH V10.1 1/3] libxl: Add support for Virtio disk configuration
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: multipart/alternative; boundary="00000000000042e49305e21d2a0a"

--00000000000042e49305e21d2a0a
Content-Type: text/plain; charset="UTF-8"

Hello Anthony

[sorry for the possible format issues]

On Thu, Jun 23, 2022 at 1:24 PM Anthony PERARD <anthony.perard@citrix.com>
wrote:

> On Fri, Jun 17, 2022 at 07:14:31PM +0300, Oleksandr Tyshchenko wrote:
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >
> > This patch adds basic support for configuring and assisting virtio-mmio
> > based virtio-disk backend (emulator) which is intended to run out of
> > Qemu and could be run in any domain.
> > Although the Virtio block device is quite different from traditional
> > Xen PV block device (vbd) from the toolstack's point of view:
> >  - as the frontend is virtio-blk which is not a Xenbus driver, nothing
> >    written to Xenstore are fetched by the frontend currently ("vdev"
> >    is not passed to the frontend). But this might need to be revised
> >    in future, so frontend data might be written to Xenstore in order to
> >    support hotplugging virtio devices or passing the backend domain id
> >    on arch where the device-tree is not available.
> >  - the ring-ref/event-channel are not used for the backend<->frontend
> >    communication, the proposed IPC for Virtio is IOREQ/DM
> > it is still a "block device" and ought to be integrated in existing
> > "disk" handling. So, re-use (and adapt) "disk" parsing/configuration
> > logic to deal with Virtio devices as well.
> >
> > For the immediate purpose and an ability to extend that support for
> > other use-cases in future (Qemu, virtio-pci, etc) perform the following
> > actions:
> > - Add new disk backend type (LIBXL_DISK_BACKEND_OTHER) and reflect
> >   that in the configuration
> > - Introduce new disk "specification" and "transport" fields to struct
> >   libxl_device_disk. Both are written to the Xenstore. The transport
> >   field is only used for the specification "virtio" and it assumes
> >   only "mmio" value for now.
> > - Introduce new "specification" option with "xen" communication
> >   protocol being default value.
> > - Add new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
> >   one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model
> >
> > An example of domain configuration for Virtio disk:
> > disk = [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=other,
> specification=virtio']
> >
> > Nothing has changed for default Xen disk configuration.
> >
> > Please note, this patch is not enough for virtio-disk to work
> > on Xen (Arm), as for every Virtio device (including disk) we need
> > to allocate Virtio MMIO params (IRQ and memory region) and pass
> > them to the backend, also update Guest device-tree. The subsequent
> > patch will add these missing bits. For the current patch,
> > the default "irq" and "base" are just written to the Xenstore.
> > This is not an ideal splitting, but this way we avoid breaking
> > the bisectability.
> >
> > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > ---
> > Changes V10 -> V10.1:
> >    - fix small coding style issue in libxl__device_disk_get_path()
> >    - drop specification check in main_blockattach() and add
> >      required check in libxl__device_disk_setdefault()
> >    - update specification check in main_blockdetach()
>
> For this v10.1: Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
>


perfect, thanks!


>
> BTW, the subject of this updated patch still state "v10" instead of
> "v10.1", hopefully committers can pick the right version.
>


Oh, sorry, I was thinking to use "v10.1", but I wasn't sure that commit
with updated subject would properly appear in the current thread if being
sent using git send-email --in-reply-to))


>
> Cheers,
>
> --
> Anthony PERARD
>


-- 
Regards,

Oleksandr Tyshchenko

--00000000000042e49305e21d2a0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello=C2=A0Anthony</div><div><br></div><div>[sorry fo=
r the possible format issues]</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jun 23, 2022 at 1:24 PM Anthony PERAR=
D &lt;<a href=3D"mailto:anthony.perard@citrix.com" target=3D"_blank">anthon=
y.perard@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Fri, Jun 17, 2022 at 07:14:31PM +0300, Oleksandr Tysh=
chenko wrote:<br>
&gt; From: Oleksandr Tyshchenko &lt;<a href=3D"mailto:oleksandr_tyshchenko@=
epam.com" target=3D"_blank">oleksandr_tyshchenko@epam.com</a>&gt;<br>
&gt; <br>
&gt; This patch adds basic support for configuring and assisting virtio-mmi=
o<br>
&gt; based virtio-disk backend (emulator) which is intended to run out of<b=
r>
&gt; Qemu and could be run in any domain.<br>
&gt; Although the Virtio block device is quite different from traditional<b=
r>
&gt; Xen PV block device (vbd) from the toolstack&#39;s point of view:<br>
&gt;=C2=A0 - as the frontend is virtio-blk which is not a Xenbus driver, no=
thing<br>
&gt;=C2=A0 =C2=A0 written to Xenstore are fetched by the frontend currently=
 (&quot;vdev&quot;<br>
&gt;=C2=A0 =C2=A0 is not passed to the frontend). But this might need to be=
 revised<br>
&gt;=C2=A0 =C2=A0 in future, so frontend data might be written to Xenstore =
in order to<br>
&gt;=C2=A0 =C2=A0 support hotplugging virtio devices or passing the backend=
 domain id<br>
&gt;=C2=A0 =C2=A0 on arch where the device-tree is not available.<br>
&gt;=C2=A0 - the ring-ref/event-channel are not used for the backend&lt;-&g=
t;frontend<br>
&gt;=C2=A0 =C2=A0 communication, the proposed IPC for Virtio is IOREQ/DM<br=
>
&gt; it is still a &quot;block device&quot; and ought to be integrated in e=
xisting<br>
&gt; &quot;disk&quot; handling. So, re-use (and adapt) &quot;disk&quot; par=
sing/configuration<br>
&gt; logic to deal with Virtio devices as well.<br>
&gt; <br>
&gt; For the immediate purpose and an ability to extend that support for<br=
>
&gt; other use-cases in future (Qemu, virtio-pci, etc) perform the followin=
g<br>
&gt; actions:<br>
&gt; - Add new disk backend type (LIBXL_DISK_BACKEND_OTHER) and reflect<br>
&gt;=C2=A0 =C2=A0that in the configuration<br>
&gt; - Introduce new disk &quot;specification&quot; and &quot;transport&quo=
t; fields to struct<br>
&gt;=C2=A0 =C2=A0libxl_device_disk. Both are written to the Xenstore. The t=
ransport<br>
&gt;=C2=A0 =C2=A0field is only used for the specification &quot;virtio&quot=
; and it assumes<br>
&gt;=C2=A0 =C2=A0only &quot;mmio&quot; value for now.<br>
&gt; - Introduce new &quot;specification&quot; option with &quot;xen&quot; =
communication<br>
&gt;=C2=A0 =C2=A0protocol being default value.<br>
&gt; - Add new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current<br>
&gt;=C2=A0 =C2=A0one (LIBXL__DEVICE_KIND_VBD) doesn&#39;t fit into Virtio d=
isk model<br>
&gt; <br>
&gt; An example of domain configuration for Virtio disk:<br>
&gt; disk =3D [ &#39;phy:/dev/mmcblk0p3, xvda1, backendtype=3Dother, specif=
ication=3Dvirtio&#39;]<br>
&gt; <br>
&gt; Nothing has changed for default Xen disk configuration.<br>
&gt; <br>
&gt; Please note, this patch is not enough for virtio-disk to work<br>
&gt; on Xen (Arm), as for every Virtio device (including disk) we need<br>
&gt; to allocate Virtio MMIO params (IRQ and memory region) and pass<br>
&gt; them to the backend, also update Guest device-tree. The subsequent<br>
&gt; patch will add these missing bits. For the current patch,<br>
&gt; the default &quot;irq&quot; and &quot;base&quot; are just written to t=
he Xenstore.<br>
&gt; This is not an ideal splitting, but this way we avoid breaking<br>
&gt; the bisectability.<br>
&gt; <br>
&gt; Signed-off-by: Oleksandr Tyshchenko &lt;<a href=3D"mailto:oleksandr_ty=
shchenko@epam.com" target=3D"_blank">oleksandr_tyshchenko@epam.com</a>&gt;<=
br>
&gt; ---<br>
&gt; Changes V10 -&gt; V10.1:<br>
&gt;=C2=A0 =C2=A0 - fix small coding style issue in libxl__device_disk_get_=
path()<br>
&gt;=C2=A0 =C2=A0 - drop specification check in main_blockattach() and add<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 required check in libxl__device_disk_setdefault()<=
br>
&gt;=C2=A0 =C2=A0 - update specification check in main_blockdetach()<br>
<br>
For this v10.1: Reviewed-by: Anthony PERARD &lt;<a href=3D"mailto:anthony.p=
erard@citrix.com" target=3D"_blank">anthony.perard@citrix.com</a>&gt;<br></=
blockquote><div>=C2=A0</div><div><br></div><div>perfect, thanks!</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
BTW, the subject of this updated patch still state &quot;v10&quot; instead =
of<br>
&quot;v10.1&quot;, hopefully committers can pick the right version.<br></bl=
ockquote><div>=C2=A0</div><div><br></div><div>Oh, sorry, I was thinking to =
use=C2=A0&quot;v10.1&quot;, but I wasn&#39;t sure that commit with updated =
subject would properly appear in the current thread if being sent using git=
 send-email --in-reply-to))=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
-- <br>
Anthony PERARD<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><span style=
=3D"background-color:rgb(255,255,255)"><font size=3D"2"><span style=3D"colo=
r:rgb(51,51,51);font-family:Arial,sans-serif">Regards,</span></font></span>=
</div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div><span style=3D"backg=
round-color:rgb(255,255,255)"><font size=3D"2">Oleksandr Tyshchenko</font><=
/span></div></div></div></div></div></div></div></div>

--00000000000042e49305e21d2a0a--

