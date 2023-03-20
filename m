Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA9B6C2017
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 19:39:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512066.791688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peKPj-0004ya-FN; Mon, 20 Mar 2023 18:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512066.791688; Mon, 20 Mar 2023 18:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peKPj-0004vD-CJ; Mon, 20 Mar 2023 18:39:23 +0000
Received: by outflank-mailman (input) for mailman id 512066;
 Mon, 20 Mar 2023 18:39:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4LM=7M=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1peKPh-0004v7-Lu
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 18:39:21 +0000
Received: from rs227.mailgun.us (rs227.mailgun.us [209.61.151.227])
 by se1-gles-flk1.inumbo.com (Halon) with UTF8SMTPS
 id 859ddeac-c74e-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 19:39:19 +0100 (CET)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177]) by
 88001cc23a1c with SMTP id 6418a854061a559e84d33861 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Mon, 20 Mar 2023 18:39:16 GMT
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-544787916d9so239634527b3.13
 for <xen-devel@lists.xenproject.org>; Mon, 20 Mar 2023 11:39:16 -0700 (PDT)
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
X-Inumbo-ID: 859ddeac-c74e-11ed-b464-930f4c7d94ae
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1679337556; x=1679344756; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=hrDp51DhFoX/YZk/0G0Jzcc7Cdfae+rRAMlZRhBZKec=;
 b=TLaQL98yuivPyr5h5Y8IVKn4dWEUKCDbThKYnnHZRBebfZJX1DiBZzhFITE8svjthgcHZwIdAQ0Ojfna/Ytvb95hB5o5BJjKW5uGld/LIjW42rFEs5BWXyvIPv3ONgielMqjp2I3kx2+6tQMYg05QMtidEzHUfcd+wDguPvBd9if3ob92EWG85SWivsgOs0L+k50shyikFgEpYdBmul7x5q9sTy5rLkC6x4T1SGk5rVohHnXIPVd5pg3UuOECiMqaPIQG8DoZYmTyiXvMjvx6+gswtvfwrbErpO5bKP7BsHpPuQ0/umTLz7B7D/uv0G/gFteN8OTRdCFUSgv6J2BYw==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sid: WyIyYTNmOCIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsImNkODQwIl0=
Sender: tamas@tklengyel.com
X-Gm-Message-State: AO0yUKUcwSX7CYUV0wSpWGYt5iOK+B6uu0FSObPJWxsF+o13tVLJz9Uf
	DI/MMls7UdCGoM1YYFpZDA4cE/ExkneFNizCbsE=
X-Google-Smtp-Source: AK7set+teOTIitWntHCNKc8hIZreEClezJzRgGX6bocZI9eevsFe0hPJ0YEETDGnfQaCb7TBR1PKf5ha+qyQDzNSzXY=
X-Received: by 2002:a81:4302:0:b0:541:7266:3fd7 with SMTP id
 q2-20020a814302000000b0054172663fd7mr10045070ywa.3.1679337556022; Mon, 20 Mar
 2023 11:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <858e4c67d14ec9d9c6737dd0b33056e3610c00f6.1679054228.git.isaikin-dmitry@yandex.ru>
 <8aeee329-460f-0f79-a381-2dd0559e01d6@suse.com>
In-Reply-To: <8aeee329-460f-0f79-a381-2dd0559e01d6@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 20 Mar 2023 18:38:39 -0400
X-Gmail-Original-Message-ID: <CABfawhnWGezKs5YmH=KkrLVVJgrRKLJtDi_9oFKGE7wzPYeDqA@mail.gmail.com>
Message-ID: <CABfawhnWGezKs5YmH=KkrLVVJgrRKLJtDi_9oFKGE7wzPYeDqA@mail.gmail.com>
Subject: Re: [XEN PATCH v3] x86/monitor: Add new monitor event to catch I/O instructions
To: Jan Beulich <jbeulich@suse.com>
Cc: Dmitry Isaykin <isaikin-dmitry@yandex.ru>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	Anton Belousov <abelousov@ptsecurity.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000007c1ffd05f7593ef7"

--0000000000007c1ffd05f7593ef7
Content-Type: text/plain; charset="UTF-8"

> Are you actually sure you want to tie the vm-event interface to the ioreq
> one (this is also a question to you, Tamas)? It would look slightly better
> to me if this was a simple boolean named after its purpose (e.g. "write"
> or "out" when it's meant to be set for OUT / OUTS and clear for IN / INS).

A boolean would be preferred indeed.

Tamas

--0000000000007c1ffd05f7593ef7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>&gt; Are you actually sure you want to tie the vm-even=
t interface to the ioreq<br>&gt; one (this is also a question to you, Tamas=
)? It would look slightly better<br>&gt; to me if this was a simple boolean=
 named after its purpose (e.g. &quot;write&quot;<br>&gt; or &quot;out&quot;=
 when it&#39;s meant to be set for OUT / OUTS and clear for IN / INS).<br><=
div><br></div><div>A boolean would be preferred indeed.</div><div><br></div=
><div>Tamas<br></div></div>

--0000000000007c1ffd05f7593ef7--

