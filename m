Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2B373769D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 23:29:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552383.862440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBiub-0007za-Pv; Tue, 20 Jun 2023 21:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552383.862440; Tue, 20 Jun 2023 21:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBiub-0007x3-MC; Tue, 20 Jun 2023 21:29:17 +0000
Received: by outflank-mailman (input) for mailman id 552383;
 Tue, 20 Jun 2023 21:27:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=USJo=CI=raptorengineering.com=tpearson@srs-se1.protection.inumbo.net>)
 id 1qBisw-0007va-8Y
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 21:27:34 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4437ebd4-0fb1-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 23:27:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id BAC5F82858BC;
 Tue, 20 Jun 2023 16:27:31 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id jbWyyhWlvesr; Tue, 20 Jun 2023 16:27:30 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C8CC1828686B;
 Tue, 20 Jun 2023 16:27:30 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id PVP57mJJlp0z; Tue, 20 Jun 2023 16:27:30 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 9D0F682858BC;
 Tue, 20 Jun 2023 16:27:30 -0500 (CDT)
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
X-Inumbo-ID: 4437ebd4-0fb1-11ee-b234-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com C8CC1828686B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1687296450; bh=/3L4UVdpXvtlyeovjl59oqUwbrqbMtnAKQFimjF1UG8=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=D9VUrLmxMyT9EkcY+VeavrRqxdGAQxWcITXZ6ytztm/LqQI2XAuywmo7XDVI7e9dc
	 wSpg0S0B7uOOfP2/TiIpPld+s4ZvCx5TZpFCFthId8vsVwWzNfKLbndvz9gfvP3mNg
	 3hCY8tyANTg5XORl28SblgBgODBeN0vFF+/zPqcU=
X-Virus-Scanned: amavisd-new at rptsys.com
Date: Tue, 20 Jun 2023 16:27:28 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, 
	xen-devel@lists.xenproject.org, 
	Timothy Pearson <tpearson@raptorengineering.com>, 
	George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <321410422.7928643.1687296448794.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <8505b097-3191-ec7f-57f9-59cd49367981@citrix.com>
References: <cover.1687283294.git.sanastasio@raptorengineering.com> <a2acef7759c79df311b06428f0ab4b6a940fc0d4.1687283294.git.sanastasio@raptorengineering.com> <8505b097-3191-ec7f-57f9-59cd49367981@citrix.com>
Subject: Re: [PATCH v5 1/3] xen: Add files needed for minimal ppc64le build
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC114 (Linux)/8.5.0_GA_3042)
Thread-Topic: Add files needed for minimal ppc64le build
Thread-Index: OaknFPGOluVM7+W5VtgjDtanV7cE2g==



----- Original Message -----
> From: "Andrew Cooper" <andrew.cooper3@citrix.com>
> To: "Shawn Anastasio" <sanastasio@raptorengineering.com>, xen-devel@lists=
.xenproject.org
> Cc: "Timothy Pearson" <tpearson@raptorengineering.com>, "George Dunlap" <=
george.dunlap@citrix.com>, "Jan Beulich"
> <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini=
" <sstabellini@kernel.org>, "Wei Liu"
> <wl@xen.org>
> Sent: Tuesday, June 20, 2023 4:21:22 PM
> Subject: Re: [PATCH v5 1/3] xen: Add files needed for minimal ppc64le bui=
ld

> On 20/06/2023 7:12 pm, Shawn Anastasio wrote:
>> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
>> new file mode 100644
>> index 0000000000..f75d9be4ed
>> --- /dev/null
>> +++ b/xen/arch/ppc/xen.lds.S
>> <snip>
>> +/**
>> + * OF's base load address is 0x400000 (XEN_VIRT_START).
>> + * By defining sections this way, we can keep our virtual address base =
at
>> 0x400000
>> + * while keeping the physical base at 0x0.
>> + *
>> + * Without this, OF incorrectly loads .text at 0x400000 + 0x400000 =3D =
0x800000.
>> + * Taken from x86/xen.lds.S
>> + */
>=20
> Sorry, one last thing.
>=20
> What's OF?=C2=A0 Searching around suggests it might be OpenFirmware, but =
I'm
> not certain if that's applicable in this context either?
>=20
> ~Andrew

OF is indeed Open Firmware.  It was mainly used on old Apple machines, but =
its legacy lives on in SLOF (SlimLine Open Firmware) which is the QEMU boot=
loader for the pSeries machine type.

