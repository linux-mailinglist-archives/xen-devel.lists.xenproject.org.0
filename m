Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B99AC8A269
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 15:07:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172862.1497954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOGB5-0007d1-IU; Wed, 26 Nov 2025 14:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172862.1497954; Wed, 26 Nov 2025 14:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOGB5-0007ap-Fj; Wed, 26 Nov 2025 14:07:27 +0000
Received: by outflank-mailman (input) for mailman id 1172862;
 Wed, 26 Nov 2025 14:07:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtuU=6C=raptorengineering.com=tpearson@srs-se1.protection.inumbo.net>)
 id 1vOGB4-0007aj-BP
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 14:07:26 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 399535ca-cad1-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 15:07:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8B04C7790B09;
 Wed, 26 Nov 2025 08:07:20 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id BibQTzd0XfcA; Wed, 26 Nov 2025 08:07:19 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7855E7790B20;
 Wed, 26 Nov 2025 08:07:19 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Aq7p-nBmhEW2; Wed, 26 Nov 2025 08:07:19 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4ECC07790B09;
 Wed, 26 Nov 2025 08:07:19 -0600 (CST)
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
X-Inumbo-ID: 399535ca-cad1-11f0-9d18-b5c5bf9af7f9
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 7855E7790B20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1764166039; bh=D4QVMlsRByIqVfzo12mK+nBVHl9crz7Fs1tyj79CzbQ=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=Aipig2AqUexl7jUiu7vjInLf//XjaR49SN18AoiJDa558YJvUvD+TyVdkXsJeC78u
	 MCxeQFjza2JUKC+2Syvh6r2Zi/yx3yFa1OzEgKF5fQ9biVqIKrOd7f5rNxrJ+s8vHw
	 FHTjHL8doHckSc4R7JI5jwp4IEhMB/hlv0T5IYiM=
X-Virus-Scanned: amavisd-new at rptsys.com
Date: Wed, 26 Nov 2025 08:07:19 -0600 (CST)
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
Message-ID: <1755986020.127148.1764166039180.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <b915451d-62c9-4128-807a-42b908dbaef4@suse.com>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com> <b915451d-62c9-4128-807a-42b908dbaef4@suse.com>
Subject: Re: [PATCH 3/8] symbols/ppc: re-number intermediate files
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC141 (Linux)/8.5.0_GA_3042)
Thread-Topic: symbols/ppc: re-number intermediate files
Thread-Index: 2/rOy079hYQV4M4phLOA1U+lm5WsKg==



----- Original Message -----
> From: "Jan Beulich" <jbeulich@suse.com>
> To: "xen-devel" <xen-devel@lists.xenproject.org>
> Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Julien Grall" <julien@x=
en.org>, "Stefano Stabellini"
> <sstabellini@kernel.org>, "Anthony PERARD" <anthony.perard@vates.tech>, "=
Michal Orzel" <michal.orzel@amd.com>, "Roger
> Pau Monn=C3=A9" <roger.pau@citrix.com>, "Timothy Pearson" <tpearson@rapto=
rengineering.com>
> Sent: Wednesday, November 26, 2025 7:43:17 AM
> Subject: [PATCH 3/8] symbols/ppc: re-number intermediate files

> In preparation to do away with symbols-dummy, re-number the assembly and
> object files used, for the numbers to match the next passes real output.
> This is to make 0 available to use for what now is handled by
> symbols-dummy.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Looks good to me.

Acked-by: Timothy Pearson <tpearson@raptorengineering.com>

> --- a/xen/arch/ppc/Makefile
> +++ b/xen/arch/ppc/Makefile
> @@ -16,16 +16,16 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
> =09    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
> =09$(NM) -pa --format=3Dsysv $(dot-target).0 \
> =09=09| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> -=09=09> $(dot-target).0.S
> -=09$(MAKE) $(build)=3D$(@D) $(dot-target).0.o
> +=09=09> $(dot-target).1.S
> +=09$(MAKE) $(build)=3D$(@D) $(dot-target).1.o
> =09$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
> -=09    $(dot-target).0.o -o $(dot-target).1
> +=09    $(dot-target).1.o -o $(dot-target).1
> =09$(NM) -pa --format=3Dsysv $(dot-target).1 \
> =09=09| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> -=09=09> $(dot-target).1.S
> -=09$(MAKE) $(build)=3D$(@D) $(dot-target).1.o
> +=09=09> $(dot-target).2.S
> +=09$(MAKE) $(build)=3D$(@D) $(dot-target).2.o
> =09$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
> -=09    $(dot-target).1.o -o $@
> +=09    $(dot-target).2.o -o $@
> =09$(NM) -pa --format=3Dsysv $@ \
> =09=09| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>  =09=09> $@.map

