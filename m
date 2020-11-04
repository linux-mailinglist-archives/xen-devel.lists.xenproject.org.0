Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2EE2A5F24
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 09:13:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18830.43842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaDug-0000G7-8v; Wed, 04 Nov 2020 08:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18830.43842; Wed, 04 Nov 2020 08:13:02 +0000
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
	id 1kaDug-0000Fi-5c; Wed, 04 Nov 2020 08:13:02 +0000
Received: by outflank-mailman (input) for mailman id 18830;
 Wed, 04 Nov 2020 08:13:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qpwB=EK=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1kaDuf-0000Fd-7e
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 08:13:01 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d5320e64-d160-492d-ae1e-2d178fd50cbf;
 Wed, 04 Nov 2020 08:13:00 +0000 (UTC)
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-t9KBmiWJMd6ejhfdPt5MOA-1; Wed, 04 Nov 2020 03:12:57 -0500
Received: by mail-pg1-f198.google.com with SMTP id e16so13334820pgm.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 00:12:57 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qpwB=EK=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
	id 1kaDuf-0000Fd-7e
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 08:13:01 +0000
X-Inumbo-ID: d5320e64-d160-492d-ae1e-2d178fd50cbf
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id d5320e64-d160-492d-ae1e-2d178fd50cbf;
	Wed, 04 Nov 2020 08:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604477580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ceiJjVJiuP39c7jvGZlPEkqo+iI/UIuc+xm9Ar02lws=;
	b=MnjR2DfFuINNNBiO5W3UWT9QHoQyaUFcm3Iz0IMtdqHAuTiDmrVfQ5kEcWRT/ta39vOxbj
	EhKAemSm7KSIcT94hSNDu7IVzuStHCQ9UY3X9CLyaLJbj53586+xQOi799MHOVn/q8XRSp
	TWnQXkktl5UsWZt2TIad5Q7Twu/eGsM=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-t9KBmiWJMd6ejhfdPt5MOA-1; Wed, 04 Nov 2020 03:12:57 -0500
X-MC-Unique: t9KBmiWJMd6ejhfdPt5MOA-1
Received: by mail-pg1-f198.google.com with SMTP id e16so13334820pgm.1
        for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 00:12:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ceiJjVJiuP39c7jvGZlPEkqo+iI/UIuc+xm9Ar02lws=;
        b=k+S75zqdscXwyR9mBFqLvRv/RjncJlzeMxn+tyxjsShknWL8N5DGV8GaUbtRvXO3Fy
         Ae4sD1F7FQ/151gz7BisC7mg0eCH7TBB6Ms3mRMqRmeqP34F2aJVvpai1VPXTLgVXljy
         pYkmGd+6elc1qaxRp63j2isVMgygUeIUvOaY1N80g9mra/+uyDw2SqR5RReRhDGnkbrH
         C74c0/wkrpE15Vh9aZYWAa0sjmOqX/MdK/lyMFu8nIZMBupBEC9RUBnj8R00V5gEU1ay
         6yyaRJbuYc1gF5/8O3gWw5NwhNtVzijc11kmEKhbrQRE0X3zoah228LPnA/muRxj4Ae7
         HDUw==
X-Gm-Message-State: AOAM533cBHj/eE4/5uUmEXLKk9R96gogYcWlUvuIVmlSHAoL7NHb92yz
	rgxBs8+v+lvqfZY8y4W6rtTLseAFsUc7CWtnFow7gvUsZvlmj62qJ+OJ3ddPn9kqEM3lnEhxJHl
	G4Pf/zqlailnfCH5VoDxKnGOhxbjY3+cY6WcBmV9CyaU=
X-Received: by 2002:a17:90b:783:: with SMTP id l3mr3441351pjz.122.1604477576528;
        Wed, 04 Nov 2020 00:12:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9VEpGaTs4FobVdmURAavhmVrSlcOVxSA8lQRAnf6DR3hx+8yKl8lKQ0FpfM8iza8JMrUtTBW+D3SUMqpvPJM=
X-Received: by 2002:a17:90b:783:: with SMTP id l3mr3441336pjz.122.1604477576301;
 Wed, 04 Nov 2020 00:12:56 -0800 (PST)
MIME-Version: 1.0
References: <20201103164604.2692357-1-philmd@redhat.com> <20201103164604.2692357-3-philmd@redhat.com>
 <20201103165247.GT205187@redhat.com> <7654e063-98d3-84e0-8116-5a1b41d14636@redhat.com>
 <21e90ddb-fe8a-c780-2741-9b7a2f7f1c9a@redhat.com> <alpine.DEB.2.21.2011031722100.3264@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2011031722100.3264@sstabellini-ThinkPad-T480s>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 4 Nov 2020 09:12:43 +0100
Message-ID: <CABgObfaAH1fty0y0Z10GALnhy4kL_FqSxPZc2-=PwJgtSrOX0g@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 2/3] gitlab-ci: Add a job to cover the
 --without-default-devices config
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Greg Kurz <groug@kaod.org>, 
	Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org, 
	Cornelia Huck <cohuck@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org, Fam Zheng <fam@euphon.net>, 
	Richard Henderson <rth@twiddle.net>, Matthew Rosato <mjrosato@linux.ibm.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000fca6bd05b3438b08"

--000000000000fca6bd05b3438b08
Content-Type: text/plain; charset="UTF-8"

Il mer 4 nov 2020, 03:27 Stefano Stabellini <sstabellini@kernel.org> ha
scritto:

> FYI I tried to build the latest QEMU on Alpine Linux 3.12 ARM64 and I
> get:
>
>   ninja: unknown tool 'query'
>
> Even after rebuilding ninja master by hand. Any ideas? I don't know much
> about ninja.
>

Are you sure you have ninja installed and not its clone samurai (yes, I am
serious)? I have contributed query support to samurai but it hasn't made it
to a release yet.

What is the output of "ninja -t list"?

Paolo


>
> So I gave up on that and I spinned up a Debian Buster x86 container for
> this build. That one got past the "ninja: unknown tool 'query'" error.
> The build completed without problems to the end.
>
> Either way I can't reproduce the build error above.

--000000000000fca6bd05b3438b08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 4 nov 2020, 03:27 Stefano Stabellini &lt;<a hre=
f=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; ha scrit=
to:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">FYI I tried to build the latest=
 QEMU on Alpine Linux 3.12 ARM64 and I<br>
get:<br>
<br>
=C2=A0 ninja: unknown tool &#39;query&#39;<br>
<br>
Even after rebuilding ninja master by hand. Any ideas? I don&#39;t know muc=
h<br>
about ninja.<br></blockquote></div></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Are you sure you have ninja installed and not its clone samurai=
 (yes, I am serious)? I have contributed query support to samurai but it ha=
sn&#39;t made it to a release yet.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">What is the output of &quot;ninja -t list&quot;?</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<br>
<br>
So I gave up on that and I spinned up a Debian Buster x86 container for<br>
this build. That one got past the &quot;ninja: unknown tool &#39;query&#39;=
&quot; error.<br>
The build completed without problems to the end.<br>
<br>
Either way I can&#39;t reproduce the build error above.</blockquote></div><=
/div></div>

--000000000000fca6bd05b3438b08--


