Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDEE6AACD4
	for <lists+xen-devel@lfdr.de>; Sat,  4 Mar 2023 23:02:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505931.779600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYZwd-0002ON-Bb; Sat, 04 Mar 2023 22:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505931.779600; Sat, 04 Mar 2023 22:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYZwd-0002Bc-2j; Sat, 04 Mar 2023 22:01:35 +0000
Received: by outflank-mailman (input) for mailman id 505931;
 Fri, 03 Mar 2023 11:57:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cEYq=63=zedat.fu-berlin.de=glaubitz@srs-se1.protection.inumbo.net>)
 id 1pY42h-0000BG-W3
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 11:57:43 +0000
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a6b7a22-b9ba-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 12:57:42 +0100 (CET)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pY42W-004B3D-QC; Fri, 03 Mar 2023 12:57:32 +0100
Received: from p57bd9bc2.dip0.t-ipconnect.de ([87.189.155.194]
 helo=[192.168.178.81]) by inpost2.zedat.fu-berlin.de (Exim 4.95)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1pY42W-0029Jx-I9; Fri, 03 Mar 2023 12:57:32 +0100
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
X-Inumbo-ID: 9a6b7a22-b9ba-11ed-96af-2f268f93b82a
Message-ID: <366865d17d130de0d75e9ea18e540bf4979b8ab7.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v2 0/6] Deprecate support for 32-bit x86 and arm hosts
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thomas Huth <thuth@redhat.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Daniel
 Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>, qemu-arm@nongnu.org, Maxim Levitsky
 <mlevitsk@redhat.com>, libvir-list@redhat.com, Richard Henderson
 <richard.henderson@linaro.org>, xen-devel@lists.xenproject.org, Reinoud
 Zandijk <reinoud@netbsd.org>, Michael Tokarev <mjt@tls.msk.ru>, Helge
 Deller <deller@gmx.de>, Laurent Vivier <lvivier@redhat.com>
Date: Fri, 03 Mar 2023 12:57:31 +0100
In-Reply-To: <2c7f837f-c156-8525-005f-f47d50591a85@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
	 <4bed38c3-ab4f-cd32-05a4-afa090ad8b9a@linaro.org>
	 <6c1f0d05-924e-854e-0175-5e345945e086@redhat.com>
	 <89fd1c916b6c8094ea1a7a52396b3f91025c75c1.camel@physik.fu-berlin.de>
	 <2c7f837f-c156-8525-005f-f47d50591a85@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.155.194
X-ZEDAT-Hint: PO

Hi Thomas!

On Fri, 2023-03-03 at 12:22 +0100, Thomas Huth wrote:
> The ticket is very long and hard to read, but ... oh my, does that mean y=
ou=20
> need to compile qemu-user in 32-bit mode on a 64-bit x86 host to properly=
=20
> run 32-bit binaries from other architectures? ... uh, that's ugly ... and=
=20
> sounds like bug in QEMU's user mode emulation ... and what if you're runn=
ing=20
> a distro (or different 64-bit host architecutre) that does not support=
=20
> 32-bit userspace libraries anymore? Then you're lost?

Perhaps the explanation here by Florian Weimer is a bit easier to understan=
d:

> https://lore.kernel.org/lkml/87bm56vqg4.fsf@mid.deneb.enyo.de/

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

