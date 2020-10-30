Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7DC29FE7B
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 08:34:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15428.38434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYOvZ-0001H4-1p; Fri, 30 Oct 2020 07:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15428.38434; Fri, 30 Oct 2020 07:34:25 +0000
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
	id 1kYOvY-0001Gf-UR; Fri, 30 Oct 2020 07:34:24 +0000
Received: by outflank-mailman (input) for mailman id 15428;
 Fri, 30 Oct 2020 07:34:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AXzT=EF=gmail.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1kYOvX-0001Ga-0W
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 07:34:23 +0000
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 879efc71-4952-4112-8859-2501a4f17b6d;
 Fri, 30 Oct 2020 07:34:22 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k9so5614658edo.5
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2020 00:34:22 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=AXzT=EF=gmail.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
	id 1kYOvX-0001Ga-0W
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 07:34:23 +0000
X-Inumbo-ID: 879efc71-4952-4112-8859-2501a4f17b6d
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 879efc71-4952-4112-8859-2501a4f17b6d;
	Fri, 30 Oct 2020 07:34:22 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k9so5614658edo.5
        for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2020 00:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QecOoWQ/HZb8eLncR1EKgGqUdTzbd3QYBazcsejlCn8=;
        b=ujrjISZg77YgswczqnGmqLCmD8a6h4MPRyt1NHmMmnkpJXhbeT0O+rgJX3GZi8Si+G
         rDQQy2PQOnNsF3XnHMVYDOXCJuPB6/0XoU81UkR6yMofcbFZcrJX5FvkALRY0hrLJkDh
         248wTeLxRhp6GMHvTgkum4wjs1iTw4rKjQ8zRRIsL07x7XxJF5bZomRWcCdRhSyzh4Eh
         OUGvXipVheIUlmdsYhB8w29X+83G04YAkrQuHd7PpDPMbls4tSr6AF4Eb8Uvebwf1Rtu
         xcFq8d7jGjV/OA7eeY0MnLVz/t3jEs42qWSICjUZYIAK8btREG2Qj3lmlqizcKYz4yDb
         fdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QecOoWQ/HZb8eLncR1EKgGqUdTzbd3QYBazcsejlCn8=;
        b=mFMrKMXrAu1b8vARL7vveGhLeH+Sw+YAtFUoAnijs7lBahYv4Rs42f0QkCNLxs5l0l
         T+rNA10G/GMv5Q/XZ0zcCvYpQ8ithW1KD8qP7u94UfjQU4E4MNABb/um1Dbxb8GccwaP
         657V8u/DgYbGCmfhvrk7hkkhM9aGKiR8UHSDqJChLYYgKStKBpY2s+noWjbzwi31sKJ8
         gJ8edkECiD+sS7YwnNUAszOGsSmkyN4fKGTs/TIqitAmXXUCcEDCc9/kx33qfgFLsHjq
         j3/GkSIJhTNgewCSyK47x+jaht72uzJyA9ETGuxkWqt8XOQeOvvnbyDBCmdSyur8FRpJ
         UCbQ==
X-Gm-Message-State: AOAM531nJ5WMzfMxe69vgNQqH4hFurD9hYfPI0svHyQg3SM/ue0JcIrw
	wM20S+7sILHQ2hzhaM6SkzWS+sENb96rbzl9rSA=
X-Google-Smtp-Source: ABdhPJwHdlUXIcvql7BaxkEQ5qq2IjRF1QtV14hIqZo+aMFSkt+speVDDuk/H/QhE4pezbuAlNycJUmN/TXFmcdeYIA=
X-Received: by 2002:a05:6402:6ca:: with SMTP id n10mr927720edy.314.1604043261375;
 Fri, 30 Oct 2020 00:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201029220246.472693-1-ehabkost@redhat.com> <20201029220246.472693-10-ehabkost@redhat.com>
 <CAJ+F1CKqo3D20=qSAovVKWCGz4otctaWnGC0O5p-Z1ZG9Pj_Mw@mail.gmail.com>
In-Reply-To: <CAJ+F1CKqo3D20=qSAovVKWCGz4otctaWnGC0O5p-Z1ZG9Pj_Mw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 30 Oct 2020 11:34:09 +0400
Message-ID: <CAJ+F1CKLtKeoP43OV5dpbHLFNO8OnMdsjD=atDo=pjqvFkX2fg@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="000000000000cc7dc705b2de6c6f"

--000000000000cc7dc705b2de6c6f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 11:29 AM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

>
>
> On Fri, Oct 30, 2020 at 2:07 AM Eduardo Habkost <ehabkost@redhat.com>
> wrote:
>
>> Make the code more generic and not specific to TYPE_DEVICE.
>>
>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>>
>
> Nice cleanup!, but fails to build atm
>
> ../hw/block/xen-block.c:403:9: error: =E2=80=98dev=E2=80=99 undeclared (f=
irst use in this
> function); did you mean =E2=80=98vdev=E2=80=99?
>   403 |     if (dev->realized) {
>
>
That seems to be the only issue though, so with that fixed:
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000cc7dc705b2de6c6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 30, 2020 at 11:29 AM Marc=
-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com">marcan=
dre.lureau@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 30, 2=
020 at 2:07 AM Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" t=
arget=3D"_blank">ehabkost@redhat.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Make the code more generic and not spec=
ific to TYPE_DEVICE.<br>
<br>
Signed-off-by: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" t=
arget=3D"_blank">ehabkost@redhat.com</a>&gt;<br></blockquote><div><br></div=
><div>Nice cleanup!, but fails to build atm</div><div><br></div><div>../hw/=
block/xen-block.c:403:9: error: =E2=80=98dev=E2=80=99 undeclared (first use=
 in this function); did you mean =E2=80=98vdev=E2=80=99?<br>=C2=A0 403 | =
=C2=A0 =C2=A0 if (dev-&gt;realized) {</div><br></div></div></blockquote></d=
iv><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">That see=
ms to be the only issue though, so with that fixed:</div><div class=3D"gmai=
l_quote">Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandr=
e.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div class=3D=
"gmail_quote"><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">M=
arc-Andr=C3=A9 Lureau<br></div></div>

--000000000000cc7dc705b2de6c6f--

