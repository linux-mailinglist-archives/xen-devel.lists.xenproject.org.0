Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AC729FE74
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 08:30:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15423.38422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYOqy-0000P4-Eo; Fri, 30 Oct 2020 07:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15423.38422; Fri, 30 Oct 2020 07:29:40 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYOqy-0000Of-BX; Fri, 30 Oct 2020 07:29:40 +0000
Received: by outflank-mailman (input) for mailman id 15423;
 Fri, 30 Oct 2020 07:29:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AXzT=EF=gmail.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1kYOqx-0000Oa-Cg
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 07:29:39 +0000
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35735104-b085-42c1-b633-aa28adafaa88;
 Fri, 30 Oct 2020 07:29:38 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id dg9so5534092edb.12
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2020 00:29:38 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=AXzT=EF=gmail.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
	id 1kYOqx-0000Oa-Cg
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 07:29:39 +0000
X-Inumbo-ID: 35735104-b085-42c1-b633-aa28adafaa88
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 35735104-b085-42c1-b633-aa28adafaa88;
	Fri, 30 Oct 2020 07:29:38 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id dg9so5534092edb.12
        for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2020 00:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G5Y2ybGQFFg/Q1IWxTbgDWrthNCdA5cUZUHcaXIADVo=;
        b=juU6YdlGOZQXGNSlK6wUIxSw0U6XVMJQsmW5ibCAI622UsHp5E6SjA0yRhdlz6lAIP
         evU517XRKe2S5Fpk9P4VTTju9LQenjJZCPfj3qXLMcjWjYOJTEqL1xZ6oQPcG38NwdHc
         Dh5K7GdPUEmgCh9cOtdLqayGtqbpm5xHi1sS6WWttMqRk+PBBF2s3rw2tQEZw16vsGCs
         PtSBs1A4BvvkqG+sdoFmuTaTPoAchM4twXNwVJQsrRmNuIFvnCTPViRnYIK4Dv8HbhPN
         fmBS+HcBbGvyYgBJNzao06S9VzmPgMFMyTJ7FkhjmEmwWtArTT+zlkYGm5wS8/qIPiCp
         lF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G5Y2ybGQFFg/Q1IWxTbgDWrthNCdA5cUZUHcaXIADVo=;
        b=FrcY8tPTKIAYY94NT/upTfHXPhwYbNZSsyaBjC4P0/8te24Hcy85vtGcGinFLhfc+W
         F/BsL8tWfSe3xmT/3sBi7Ou949+17YLuJbYnnNluhCwn8XbfurX+I2aG11dCRQhqAffv
         VAlknHmRQHZ6lZVCtA6qwCvxPqlKeJLALBGBQ/RrhaomlrVaAf9TUqL8yaLxRj1Gz2sB
         /ocxm1Cm7gdwph5MSLF06Hnxwsb3/bPrrl2BgG8ia2L6lBCm3VdUW+csUcX7P26U3wRG
         e202E6JiIQwIckVFtJZV+XmGaog8C/KlHUi7gg+UIfXdSZOX8t/RuuS5wN7VqSBr4Jtp
         DMOA==
X-Gm-Message-State: AOAM5314CqCxlfQd0TgsxhfRAOrIJeMUMjNbERTlaqz81HWCYvb7rSv/
	faPOy0I8V6iNJkLM5gJyrhxhNXC3ochLewlcfdA=
X-Google-Smtp-Source: ABdhPJzgtC+eSdWPUt4jhEkUAj9Oql/sHSTe5c6CKejoOmRHDQyaVOsgc0U8MOpXF2K9JdY6i3DC7Y1XTKxw/FXy4f4=
X-Received: by 2002:a50:a441:: with SMTP id v1mr905994edb.30.1604042977710;
 Fri, 30 Oct 2020 00:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20201029220246.472693-1-ehabkost@redhat.com> <20201029220246.472693-10-ehabkost@redhat.com>
In-Reply-To: <20201029220246.472693-10-ehabkost@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 30 Oct 2020 11:29:25 +0400
Message-ID: <CAJ+F1CKqo3D20=qSAovVKWCGz4otctaWnGC0O5p-Z1ZG9Pj_Mw@mail.gmail.com>
Subject: Re: [PATCH 09/36] qdev: Make qdev_get_prop_ptr() get Object* arg
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Matthew Rosato <mjrosato@linux.ibm.com>, 
	Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	"open list:Block layer core" <qemu-block@nongnu.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>, 
	David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard <anthony.perard@citrix.com>, 
	xen-devel@lists.xenproject.org, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>, 
	Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>, 
	"Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
	Qemu-s390x list <qemu-s390x@nongnu.org>, Max Reitz <mreitz@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e41a3005b2de5b99"

--000000000000e41a3005b2de5b99
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 2:07 AM Eduardo Habkost <ehabkost@redhat.com> wrote=
:

> Make the code more generic and not specific to TYPE_DEVICE.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>

Nice cleanup!, but fails to build atm

../hw/block/xen-block.c:403:9: error: =E2=80=98dev=E2=80=99 undeclared (fir=
st use in this
function); did you mean =E2=80=98vdev=E2=80=99?
  403 |     if (dev->realized) {

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e41a3005b2de5b99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 30, 2020 at 2:07 AM Eduar=
do Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Ma=
ke the code more generic and not specific to TYPE_DEVICE.<br>
<br>
Signed-off-by: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" t=
arget=3D"_blank">ehabkost@redhat.com</a>&gt;<br></blockquote><div><br></div=
><div>Nice cleanup!, but fails to build atm</div><div><br></div><div>../hw/=
block/xen-block.c:403:9: error: =E2=80=98dev=E2=80=99 undeclared (first use=
 in this function); did you mean =E2=80=98vdev=E2=80=99?<br>=C2=A0 403 | =
=C2=A0 =C2=A0 if (dev-&gt;realized) {</div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e41a3005b2de5b99--

