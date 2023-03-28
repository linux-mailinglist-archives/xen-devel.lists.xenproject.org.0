Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 123036CBD2F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 13:13:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515662.798770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph7Fw-0007HX-Og; Tue, 28 Mar 2023 11:12:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515662.798770; Tue, 28 Mar 2023 11:12:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph7Fw-0007F5-Ly; Tue, 28 Mar 2023 11:12:48 +0000
Received: by outflank-mailman (input) for mailman id 515662;
 Tue, 28 Mar 2023 11:12:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyHB=7U=tklengyel.com=bounce+v2+e181d6.cd840.1680001961.BAABAAWg_Frc9p6JxGBL7ZUexnUQBwSqZA==~xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1ph7Fu-0007Ex-Gp
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 11:12:46 +0000
Received: from so254-35.mailgun.net (so254-35.mailgun.net [198.61.254.35])
 by se1-gles-flk1.inumbo.com (Halon) with UTF8SMTPS
 id 75561bd4-cd59-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 13:12:43 +0200 (CEST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170]) by
 6aa516786f5e with SMTP id 6422cba9eb301e4528ed4ec0 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Tue, 28 Mar 2023 11:12:41 GMT
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-545e907790fso106817747b3.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Mar 2023 04:12:41 -0700 (PDT)
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
X-Inumbo-ID: 75561bd4-cd59-11ed-b464-930f4c7d94ae
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1680001961; x=1680009161; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=3WZBG9TLPspWHZDsLArweosNPiAFJFpnR91857ID/Qg=;
 b=jn9x5H2eycb4NaJXxkCAH2tVZaI/UtrSmztil320GAmsd8lShYoWzNcJfQEcX+C/gKcSAY3h/XonQCJsoQlLAESdO+de6BHthZ4d0lLyMaRg0GvQifXxwZebMaRGZ3tEtgXV067u2LjOtLukgHXT3COuDnNFkzdmSTuU5dejBDSZeTml5ChOXlR9+zOiHY41N/f8mwNXCIVJZTPe6LaT1k4v6MkjfwEkJ4WTqkg8Q3NFKXkjrAwbTmAQZt1fRxuqrSWIwDmPPjypvXp13NwHh2FfMsdno5IgB9Qn/yKh+VWouOOpIA//K5XpG8txU3SRH0lzenNWQzqJHwZkLIHvpA==
X-Mailgun-Sending-Ip: 198.61.254.35
X-Mailgun-Sid: WyIyYTNmOCIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsImNkODQwIl0=
Sender: tamas@tklengyel.com
X-Gm-Message-State: AAQBX9etTXJegcLVNdQ56PdM8thXmEtpgGZ1yVVjoaVNtfSMBRRwhYNS
	6j57XcL85KzqErihNInoXJKsQnrLTXoYLjrtBcU=
X-Google-Smtp-Source: AKy350ZXiRmNTJ18hlDi07yMcjhgDV03/bQBH4JJbAeTAQVYe9v46y02fkpgI8/sq/gMz4kyEc0cYXgBTblwjXSf8KI=
X-Received: by 2002:a81:b617:0:b0:544:b864:5532 with SMTP id
 u23-20020a81b617000000b00544b8645532mr6614883ywh.3.1680001961002; Tue, 28 Mar
 2023 04:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <7bd5ec4ff75ea0157d782f8820db1d17b6ad1289.1679406554.git.isaikin-dmitry@yandex.ru>
 <77245440-079f-50bd-7237-a44317642b3f@suse.com>
In-Reply-To: <77245440-079f-50bd-7237-a44317642b3f@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 28 Mar 2023 07:12:04 -0400
X-Gmail-Original-Message-ID: <CABfawhku1rH336Lrxji816vZ1hjdgtXjkPHvhPCVKFEovQ=mqg@mail.gmail.com>
Message-ID: <CABfawhku1rH336Lrxji816vZ1hjdgtXjkPHvhPCVKFEovQ=mqg@mail.gmail.com>
Subject: Re: [XEN PATCH v5] x86/monitor: Add new monitor event to catch I/O instructions
To: Jan Beulich <jbeulich@suse.com>
Cc: Dmitry Isaykin <isaikin-dmitry@yandex.ru>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	Anton Belousov <abelousov@ptsecurity.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000001b8ca905f7f3f0e3"

--0000000000001b8ca905f7f3f0e3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 4:59=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 21.03.2023 14:58, Dmitry Isaykin wrote:
> > Adds monitor support for I/O instructions.
> >
> > Signed-off-by: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
> > Signed-off-by: Anton Belousov <abelousov@ptsecurity.com>
>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

--0000000000001b8ca905f7f3f0e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Tue, Mar 28, 2023 at 4:59=E2=80=AFAM Jan Beulic=
h &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:=
<br>&gt;<br>&gt; On 21.03.2023 14:58, Dmitry Isaykin wrote:<br>&gt; &gt; Ad=
ds monitor support for I/O instructions.<br>&gt; &gt;<br>&gt; &gt; Signed-o=
ff-by: Dmitry Isaykin &lt;<a href=3D"mailto:isaikin-dmitry@yandex.ru">isaik=
in-dmitry@yandex.ru</a>&gt;<br>&gt; &gt; Signed-off-by: Anton Belousov &lt;=
<a href=3D"mailto:abelousov@ptsecurity.com">abelousov@ptsecurity.com</a>&gt=
;<br>&gt;<br>&gt; Acked-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse=
.com">jbeulich@suse.com</a>&gt;<br><div><br></div><div>
Acked-by: Tamas K Lengyel &lt;<a href=3D"mailto:tamas@tklengyel.com" target=
=3D"_blank">tamas@tklengyel.com</a>&gt;

</div></div>

--0000000000001b8ca905f7f3f0e3--

