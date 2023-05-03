Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3821D6F5CD0
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 19:15:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529408.823807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puG4j-0004On-CW; Wed, 03 May 2023 17:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529408.823807; Wed, 03 May 2023 17:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puG4j-0004Ln-90; Wed, 03 May 2023 17:15:33 +0000
Received: by outflank-mailman (input) for mailman id 529408;
 Wed, 03 May 2023 17:15:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFVo=AY=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1puG4i-0004Lf-87
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 17:15:32 +0000
Received: from rs227.mailgun.us (rs227.mailgun.us [209.61.151.227])
 by se1-gles-sth1.inumbo.com (Halon) with UTF8SMTPS
 id 1ae33198-e9d6-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 19:15:31 +0200 (CEST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172]) by
 628c2f3507a6 with SMTP id 645296b08a040ae8e218a377 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Wed, 03 May 2023 17:15:28 GMT
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-b9a6f17f2b6so4533649276.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 May 2023 10:15:28 -0700 (PDT)
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
X-Inumbo-ID: 1ae33198-e9d6-11ed-b225-6b7b168915f2
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1683134128; x=1683141328; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=TirsW8/KIZ0QmHxWPC0SOfA+JzpVCBqdOLxkFAQMwV4=;
 b=8BSDSsNsgeenPXKChP/CNp0bd6CSJS08K51I5h2jBzcVm7nc9hSlZl5xkerUSrcZyV/S/VsiVrlacePnX4tpyjtHYZaXrVQ/ib4yz0zFCQZTrpefIHa1VOXcwGHMVq/72gZKRB7TPaWRFd7IZX59gGLqXYPXy8Kpt+qCnX+BQGAHh24gSZt4GtK2fRjrQHM8V/eQTHa5AEHXQfqg4Tx/Z7s7CWKEYYxwYQN0u6TVqdjg9Hx4rra8XMXHw8UuXsFDKPRQq5o8Kh0e4gYwPv2VxCBeehG0Ts+tgM+CkSB++my5ls20NevHTN+Ffq6T9Qi88JC8ChDm1C3LyapMZ50ZQg==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sid: WyIyYTNmOCIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsImNkODQwIl0=
Sender: tamas@tklengyel.com
X-Gm-Message-State: AC+VfDz5HOCAGu+5FavMDCVam1aBe8Vmh9/34MphLR1/dymX8k/h7ow9
	3y3KnJF4wUNEEs46w6OlIiXIPJ19FYAjIdYqbzM=
X-Google-Smtp-Source: ACHHUZ767567dvazsFs+5+/XAzI0om2r5wjeBctqT0Wjowi5pEXIaqiZcoTMxgrROd1AJ8YZpsNPt6doCFvFF/LxWXo=
X-Received: by 2002:a81:5284:0:b0:55a:c779:d8c0 with SMTP id
 g126-20020a815284000000b0055ac779d8c0mr2918180ywb.22.1683134128464; Wed, 03
 May 2023 10:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com> <a79d2a8b-6d6e-bd31-b079-a30b555e5fd0@suse.com>
In-Reply-To: <a79d2a8b-6d6e-bd31-b079-a30b555e5fd0@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 3 May 2023 13:14:52 -0400
X-Gmail-Original-Message-ID: <CABfawhn4CRnctzV-17di4eYyNhSGTSMckZjgphS1Rg6HUGOtHw@mail.gmail.com>
Message-ID: <CABfawhn4CRnctzV-17di4eYyNhSGTSMckZjgphS1Rg6HUGOtHw@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] x86/mem-sharing: copy GADDR based shared guest areas
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000d62b1705facd33c8"

--000000000000d62b1705facd33c8
Content-Type: text/plain; charset="UTF-8"

> @@ -1974,7 +2046,10 @@ int mem_sharing_fork_reset(struct domain
>
>   state:
>      if ( reset_state )
> +    {
>          rc = copy_settings(d, pd);
> +        /* TBD: What to do here with -ERESTART? */

Ideally we could avoid hitting code-paths that are restartable during fork
reset since it gets called from vm_event replies that have no concept of
handling errors. If we start having errors like this we would just have to
drop the vm_event reply optimization and issue a standalone fork reset
hypercall every time which isn't a big deal, it's just slower. My
preference would actually be that after the initial forking is performed a
local copy of the parent's state is maintained for the fork to reset to so
there would be no case of hitting an error like this. It would also allow
us in the future to unpause the parent for example..

Tamas

--000000000000d62b1705facd33c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; @@ -1974,7 +2046,10 @@ int mem_sharing_fork_reset(str=
uct domain<br>&gt;<br>&gt; =C2=A0 state:<br>&gt; =C2=A0 =C2=A0 =C2=A0if ( r=
eset_state )<br>&gt; + =C2=A0 =C2=A0{<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0rc =3D copy_settings(d, pd);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
TBD: What to do here with -ERESTART? */<br><div><br></div><div>Ideally we c=
ould avoid hitting code-paths that are restartable during fork reset since =
it gets called from vm_event replies that have no concept of handling error=
s. If we start having errors like this we would just have to drop the vm_ev=
ent reply optimization and issue a standalone fork reset hypercall every ti=
me which isn&#39;t a big deal, it&#39;s just slower. My preference would ac=
tually be that after the initial forking is performed a local copy of the p=
arent&#39;s state is maintained for the fork to reset to so there would be =
no case of hitting an error like this. It would also allow us in the future=
 to unpause the parent for example..<br></div><div><br></div><div>Tamas<br>=
</div></div>

--000000000000d62b1705facd33c8--

