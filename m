Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 756D3844D98
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 01:07:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674184.1048960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVKb2-0008CI-62; Thu, 01 Feb 2024 00:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674184.1048960; Thu, 01 Feb 2024 00:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVKb2-00089m-34; Thu, 01 Feb 2024 00:06:24 +0000
Received: by outflank-mailman (input) for mailman id 674184;
 Thu, 01 Feb 2024 00:06:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F6Mk=JK=proton.me=johnlpoole@srs-se1.protection.inumbo.net>)
 id 1rVKb0-00089g-3y
 for xen-devel@lists.xen.org; Thu, 01 Feb 2024 00:06:22 +0000
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8c1a7b3-c095-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 01:06:19 +0100 (CET)
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
X-Inumbo-ID: b8c1a7b3-c095-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1706745976; x=1707005176;
	bh=Zkfr6o6QSmCjTM/cjg8EpuSt+sqLtvN4C2pPrvDN4hM=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=dlaw3VA6LHfOfu5V1SBYAX0kzy7OrJVDZ4L8v3jViejRL/3VNMshrRFq8PM4aZhxf
	 wdr93jWPS1/7w7dw1B/fN7Uuov0IleBNzlEWGdDV+x5xiHM08Im5xG8/YzPaDi8zcw
	 3n1c1pDg8Uxu8PZBFhuRokauO25Xr4lgce9c8puhtOnOEsM3zxYckL6BC93bYsQ5hu
	 Ait3+og2WYiRj79+4rS2GNXk+y/851HBu5EIV05+Kcyh6wYAjl2Sg/37bONDKYdbTd
	 p8/XW+CfVfp7100d96fZTA6EwTznIp9PWFAldGK/mtkxmB4U13UuZSKmMqTI9KD5TQ
	 YoR1xtqefg5uQ==
Date: Thu, 01 Feb 2024 00:05:58 +0000
To: xen-devel@lists.xen.org
From: "John L. Poole" <johnlpoole@proton.me>
Subject: Nullifying Recently Introduced Xen Headers Check
Message-ID: <fb379476-f6ae-4eb7-b3c6-6f0ad175964d@proton.me>
Feedback-ID: 80499891:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Greetings,

Gentoo Linux maintains two packages for Xen:

 =C2=A0 1) app-emulation/xen-tools ("xen-tools")
 =C2=A0 2) app-emulation/xen ("xen")

xen-tools is a prerequisite to xen.=C2=A0 So a failure
to install xen-tools will preclude any attempt to install xen.
I acknowledge that building xen-tools before building xen
is backwards and/or runs contrary to your project's way of
building, but that is what the Gentoo paradigm has been.

In trying to troubleshoot why a Gentoo 4.18.0 ebuild fails,
I ended up downloading your archive and successfully building it.
I then decided to compare the products built to see where
they varied in processing order.=C2=A0 The Xen Project builds xen first,
then the tools.

To see a visualization of the to build systems and the object
files they create matched in chronological order, see:

https://salemdata.us/xen/gentoo-4.18.0/comparison_of_build_orders_Xen_4.18.=
xhtml
 =C2=A0=C2=A0=C2=A0 or the LibreOffice workbook I created the comparison in=
:
https://salemdata.us/xen/gentoo-4.18.0/comparison_of_build_orders_Xen_4.18.=
ods

In March 2023, this commit added some sort of headers check:

https://xenbits.xen.org/gitweb/?p=3Dqemu-xen.git;a=3Dcommit;f=3Dinclude/hw/=
xen/xen_native.h;h=3De2abfe5ec67b69fb310fbeaacf7e68d61d16609e

Specifically, the lines 4-6 in [qemu-xen.git] / include / hw / xen /
xen_native.h:

 =C2=A0=C2=A0 4 #ifdef __XEN_INTERFACE_VERSION__
 =C2=A0=C2=A0 5 #error In Xen native files, include xen_native.h before oth=
er Xen
headers
 =C2=A0=C2=A0 6 #endif

cause Gentoo's build to error out.=C2=A0 See line 24790:

 =C2=A0=C2=A0 5 | #error In Xen native files, include xen_native.h before o=
ther
Xen headers

at https://salemdata.us/xen/xen_tools_20240128_Sun_174740.script.html.

What I have done is create a patch for a draft Gentoo ebuild which nullifie=
s
lines 4-6 by wrapping them in a comment:

 =C2=A0=C2=A0=C2=A0 --- a/tools/qemu-xen/include/hw/xen/xen_native.h
 =C2=A0=C2=A0=C2=A0 +++ b/tools/qemu-xen/include/hw/xen/xen_native.h
 =C2=A0=C2=A0=C2=A0 @@ -1,9 +1,9 @@
 =C2=A0=C2=A0=C2=A0=C2=A0 #ifndef QEMU_HW_XEN_NATIVE_H
 =C2=A0=C2=A0=C2=A0=C2=A0 #define QEMU_HW_XEN_NATIVE_H

 =C2=A0=C2=A0=C2=A0 -#ifdef __XEN_INTERFACE_VERSION__
 =C2=A0=C2=A0=C2=A0 +/* #ifdef __XEN_INTERFACE_VERSION__
 =C2=A0=C2=A0=C2=A0=C2=A0 #error In Xen native files, include xen_native.h =
before other Xen
headers
 =C2=A0=C2=A0=C2=A0 -#endif
 =C2=A0=C2=A0=C2=A0 +#endif */

This patch allows the Gentoo xen-tools ebuild to successfully build.

Question: is there a risk nullifying the above 3 lines in xen_native.h
given Gentoo's backward build paradigm?

Thank you.

John Poole



