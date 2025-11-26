Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE26C8A2F8
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 15:10:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172882.1497974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOGDh-000197-5P; Wed, 26 Nov 2025 14:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172882.1497974; Wed, 26 Nov 2025 14:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOGDh-00017g-20; Wed, 26 Nov 2025 14:10:09 +0000
Received: by outflank-mailman (input) for mailman id 1172882;
 Wed, 26 Nov 2025 14:10:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtuU=6C=raptorengineering.com=tpearson@srs-se1.protection.inumbo.net>)
 id 1vOGDf-000876-Cy
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 14:10:07 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a8dc527-cad1-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 15:10:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8836C7790A35;
 Wed, 26 Nov 2025 08:10:03 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id OnLALyuuFyau; Wed, 26 Nov 2025 08:10:02 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id CF43C7790C9A;
 Wed, 26 Nov 2025 08:10:02 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id v08kJITkrjZS; Wed, 26 Nov 2025 08:10:02 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 9C8B87790A35;
 Wed, 26 Nov 2025 08:10:02 -0600 (CST)
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
X-Inumbo-ID: 9a8dc527-cad1-11f0-9d18-b5c5bf9af7f9
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com CF43C7790C9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1764166202; bh=c8UX381jorO4P93MYE0MpDOPABA3uCX7fsTDQ+AcfuI=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=hC3OGxA/XXacnmPDq2ezDcJqxXPwJsN4UNsvo7yKOl0C2bLjCnb1q4fvvzoRIp0HO
	 ojdT6ui4xhLxE0cTQ+DaejBsXYiZI5wPaSWDu5LX8LI4JAiCI1DmZRI9N3DU04QS7e
	 +2qZ9aB2KYDx7+xsnL+Vzrc4cyyPcUO9PAvktzzk=
X-Virus-Scanned: amavisd-new at rptsys.com
Date: Wed, 26 Nov 2025 08:10:02 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, 
	Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, 
	Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>, 
	Timothy Pearson <tpearson@raptorengineering.com>
Message-ID: <1720419004.127154.1764166202504.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <8717ed0f-e837-4054-a67b-b41c08449c1a@suse.com>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com> <8717ed0f-e837-4054-a67b-b41c08449c1a@suse.com>
Subject: Re: [PATCH 4/8] symbols/ppc: don't use symbols-dummy
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC141 (Linux)/8.5.0_GA_3042)
Thread-Topic: symbols/ppc: don't use symbols-dummy
Thread-Index: mj3TJu3Ey2QHTewB2QpgCog4nkWeGw==



----- Original Message -----
> From: "Jan Beulich" <jbeulich@suse.com>
> To: "xen-devel" <xen-devel@lists.xenproject.org>
> Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Julien Grall" <julien@x=
en.org>, "Stefano Stabellini"
> <sstabellini@kernel.org>, "Anthony PERARD" <anthony.perard@vates.tech>, "=
Michal Orzel" <michal.orzel@amd.com>, "Roger
> Pau Monn=C3=A9" <roger.pau@citrix.com>, "Timothy Pearson" <tpearson@rapto=
rengineering.com>
> Sent: Wednesday, November 26, 2025 7:43:46 AM
> Subject: [PATCH 4/8] symbols/ppc: don't use symbols-dummy

> In particular when linking with lld, which converts hidden symbols to
> local ones, the ELF symbol table can change in unhelpful ways between the
> first two linking passes, resulting in the .rodata contributions to chang=
e
> between the 2nd and 3rd pass. That, however, renders our embedded symbol
> table pretty much unusable; the recently introduced self-test may then
> also fail. (Another difference between compiling a C file and assembling
> the generated ones is that - with -fdata-sections in use - the .rodata
> contributions move between passes 1 and 2, when we'd prefer them not to.)
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Looks good to me.  Thanks!

Acked-by: Timothy Pearson <tpearson@raptorengineering.com>

> --- a/xen/arch/ppc/Makefile
> +++ b/xen/arch/ppc/Makefile
> @@ -12,8 +12,10 @@ $(TARGET): $(TARGET)-syms
> =09cp -f $< $@
>=20
> $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> +=09$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
> +=09$(MAKE) $(build)=3D$(@D) $(dot-target).0.o
> =09$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
> -=09    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
> +=09      $(dot-target).0.o -o $(dot-target).0
> =09$(NM) -pa --format=3Dsysv $(dot-target).0 \
> =09=09| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>  =09=09> $(dot-target).1.S

