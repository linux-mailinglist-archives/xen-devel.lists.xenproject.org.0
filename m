Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C5TAOo69O2pCcAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 13:20:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBD26BD9B7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 13:20:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm1 header.b=n+nAzkQg;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=Yg1G1G4H;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1344819.1603850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcLe5-0002B8-W0; Wed, 24 Jun 2026 11:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344819.1603850; Wed, 24 Jun 2026 11:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcLe5-00028e-TB; Wed, 24 Jun 2026 11:19:53 +0000
Received: by outflank-mailman (input) for mailman id 1344819;
 Wed, 24 Jun 2026 11:19:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wcLe3-00028W-Tj
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 11:19:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcLe1-00DkUI-LU
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 13:19:49 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a3bbd50-5cb7-0a2a0a5109dd-0a2a450886ac-18
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 13:19:49 +0200
Received: from [202.12.124.145] (helo=fout-b2-smtp.messagingengine.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a3bbd53-9ee7-0a2a45080019-ca0c7c91b3e1-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 13:19:48 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 51C371D000D7;
 Wed, 24 Jun 2026 07:19:47 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Wed, 24 Jun 2026 07:19:47 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Jun 2026 07:19:45 -0400 (EDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782299987;
	 x=1782386387; bh=dK4ZwYkCGG6MjPwHudZXVGS0VA3mhzgXXHkKgD7TyKc=; b=
	n+nAzkQgPXDY7UGqAcn24f7I455jgKCckvBs5keItBcgyqFCQRC+INbQW+/CY1AQ
	4/LFz3PrPS1oRuizFA3VOxzFOgL1chiIjl29sgV/215Pj6xjZPpwWSGrHtyFsJh9
	+9DhYjheftlMVpt76wxpeFpHJIBK3GU4mvb4TaA4VOOZku0BT1hfLPNEgDV34TjO
	NHuJG1V4VKNJX6+zjych6cEXuwLfLGITJC89KiG/y9a13x/oyvJwVW1CB03qJwkP
	Df+o6jvTfHTCYEbYafcJrScS9U4CcKHvrgYNngK3dSriwH2DDomxA9BoQvgaVM/g
	SLmVtl/gq8Cm3aJWXV5wpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1782299987; x=1782386387; bh=dK4ZwYkCGG6MjPwHudZXVGS0VA3mhzgXXHk
	KgD7TyKc=; b=Yg1G1G4H4zWLiFJcMXcxajNUWWfM1NMkI+xmfDrX5gwoM062II+
	xPCq3iC1JATzzmSS9u+xrylaVeGy65IpLziPSJu6edZ5GbEeh+o2U4DPaTRnGoMh
	dgNzLBnKwD5xViYJVutMcn/rxk2OgzxDVovuFFMQQuM68nvycH/kBnCEqZP779zk
	wGS0+56X3H7PerAyMPtJc2Fz+3b6XyRux7Vj5Zsd1flcz2BfzUIYBDwSk2WIyf1K
	hK1W9cDm0BNVkk8ezRhYKBMO7RHNZV9U7XgiWb37CPzEAwdeV6rRuo6O6ndtOPcO
	27dzrtPS/pA46uA+mGkuc26OqUe9TOAwVCQ==
X-ME-Sender: <xms:Ur07ajI4MwJNLa6gtc7GCjTLJHQkXmjdQNbbkN0GKjjeW1yfVilhaw>
    <xme:Ur07apbdMR1MSyoMdyHuX-ZONa6OcD2OkSylltWW87EwBi2i61B9Jvg-P_NSu-i5j
    EpSy11lih3RU8YttQxomjly5t8Wuqbmk2hTFof5Jc6_pNpkaw>
X-ME-Received: <xmr:Ur07at_424BOOecrBLr8t-gc6unTEAMfUya6oyYPncnRjqL_J8dcjo5ytP-uUajo_v6GvyXUNjURdne5JJvpvBYuLY-vUw5uIfY>
X-ME-Proxy-Cause: dmFkZTF9hcJvyW3wCqtIzo6/LGE7crx0Svc5X1MCw2Xe/FoCKyDCi10PSG9yCwyl/wrfFJ
    ANcS0vSoh2tBLeWPyNJ+EIl8PHezXXbAbw68T4baHKrgG9PZlxZE8z5KwzGPw3IKx9DIE3
    yMa5yamAHKqNGMVWWoiX3RiOVAel7QoAtnWx3x49EbQBCPxlCzhoa1nEj1l3iQ2hZxjL4N
    7aHRiZjL59cwqyjeXirux3OsCf83bt1+fMiot6oJFzXeK1N048BROHbIaI0oHxq+w4IOCD
    72qC1fXrgGijHdGv4DLQBP2l5NLvzPUmHaTXQvs2g636XEh1dJ6m+Icdcsw3a1I2JLbxeM
    bciYiEk3sOvenyNRgsJmg9NhVrJFAJV5G87F0iAHDvI/q1USCfleKNpOSfTWoa+tNPkvYz
    aH7UqmGjQNWc7+g+1FzzGnpvd+sAcyXIdFJW5BRzkV9MpxlDgm3eDJj13v9svHqsrb8pwG
    xxJ0/C8NsnW4QpjVXqdNw6e7kiaFRDXZpAlkma16w74sbPii3Z4Ji2CI68cYf4rMlGdynt
    5Qir5qB1GEywlIG4vXGHwH8lX4LlSCvl3bcQ5NuZfIaVpwTJl8KK3Di+3KLl1kdmLvBpFC
    XddJVGiV4+hXnLm5SUbg0EBrONpneLkfYSpS9aJhLppGBYmI1usOZE6IB2xg
X-ME-Proxy: <xmx:Ur07aia_hN33i2n14b0kbF4_vQ8hzb0ycChcATmTe5Fcv4pvA44N4A>
    <xmx:Ur07apNb_gelXpXRyWr7pp-EsKGvCc4MYmHn_dWz_rWpiBeObfgspQ>
    <xmx:Ur07amBvZCUwS7wQvX9D9Qo9arw0gG1WYGbDaRSn_6iGRtHNdFnB5g>
    <xmx:Ur07aoIHLogbS1gy0vNUtm-FhynTR5aAVUPlOOIVwQQYw_lqxvTl8g>
    <xmx:U707auO_2fb1FkMr7TOo-A5n1qhznhte4es1muZJ4K2996dTRBfZtK2C>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 24 Jun 2026 13:19:43 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22?] x86/EFI: arrange for non-discardable .reloc in
 xen.efi
Message-ID: <aju9T5oCV7FK8agI@mail-itl>
References: <652b57e0-42f8-47c8-b94d-df862874aba3@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eIu06BDLJtj5LfkC"
Content-Disposition: inline
In-Reply-To: <652b57e0-42f8-47c8-b94d-df862874aba3@suse.com>
X-purgate-ID: tlsNG-c1860d/1782299989-65E250FA-9A621D18/0/0
X-purgate-type: clean
X-purgate-size: 4932
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.28 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,apertussolutions.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:dpsmith@apertussolutions.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,invisiblethingslab.com:dkim,invisiblethingslab.com:email,invisiblethingslab.com:from_mime,mail-itl:mid];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FBD26BD9B7


--eIu06BDLJtj5LfkC
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 13:19:43 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22?] x86/EFI: arrange for non-discardable .reloc in
 xen.efi

On Tue, Jun 16, 2026 at 06:17:54PM +0200, Jan Beulich wrote:
> Loaders respecting IMAGE_SCN_MEM_DISCARDABLE would not load such sections,
> yet we need to access it ourselves when switching out of "physical mode".
> Leverage behavior new to GNU ld 2.46: Any contribution to .reloc which
> doesn't have the discardable flag set (which cannot even be expressed in
> ELF) will yield the output section also non-discardable.
>=20
> Since for intermediate binaries we don't care about section attributes,
> link in the new object only on the final linking pass.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This seems to be enough to indeed make xen.efi .reloc non-discardable
with binutils 2.46.

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> With a new enough linker, $(dot-target).2r.o could be leveraged instead:
> $(dot-target).2r.S is going to be empty (or if it's not, the .reloc
> section there would already have the wanted property), so instead of
> adding the new relocs-empty.S we could also insert the section directive
> there. Overall that seemed more convoluted to me, though.
>=20
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -196,7 +196,8 @@ note_file_option ?=3D $(note_file)
> =20
>  extra-$(XEN_BUILD_PE) +=3D efi.lds
>  ifeq ($(XEN_BUILD_PE),y)
> -$(TARGET).efi: $(objtree)/prelink.o $(note_file) $(obj)/efi.lds $(obj)/e=
fi/relocs-dummy.o $(obj)/efi/mkreloc
> +$(TARGET).efi: $(obj)/efi/relocs-dummy.o $(obj)/efi/relocs-empty.o $(obj=
)/efi/mkreloc
> +$(TARGET).efi: $(objtree)/prelink.o $(note_file) $(obj)/efi.lds
>  ifeq ($(CONFIG_DEBUG_INFO),y)
>  	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug i=
nfo from $(@F)"
>  endif
> @@ -227,7 +228,7 @@ endif
>  	$(MAKE) $(build)=3D$(@D) .$(@F).2r.o .$(@F).2s.o
>  	$(call compare-symbol-tables, $(dot-target).1r.o, $(dot-target).2r.o)
>  	$(call compare-symbol-tables, $(dot-target).1s.o, $(dot-target).2s.o)
> -	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
> +	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< $(obj)/efi/=
relocs-empty.o \
>  	      $(dot-target).2r.o $(dot-target).2s.o $(orphan-handling-y) \
>  	      $(note_file_option) -o $@
>  	$(NM) -pa --format=3Dsysv $@ \
> @@ -247,7 +248,7 @@ $(TARGET).efi: FORCE
>  endif
> =20
>  # These should already have been rebuilt when building the prerequisite =
of "prelink.o"
> -$(obj)/efi/buildid.o $(obj)/efi/relocs-dummy.o: ;
> +$(obj)/efi/buildid.o $(obj)/efi/relocs-dummy.o $(obj)/efi/relocs-empty.o=
: ;
> =20
>  .PHONY: include
>  include: $(objtree)/arch/x86/include/asm/asm-macros.h
> --- a/xen/arch/x86/efi/Makefile
> +++ b/xen/arch/x86/efi/Makefile
> @@ -17,5 +17,5 @@ obj-y :=3D common-stub.o stub.o
>  obj-$(XEN_BUILD_EFI) :=3D $(filter-out %.init.o,$(EFIOBJ-y))
>  obj-bin-$(XEN_BUILD_EFI) :=3D $(filter %.init.o,$(EFIOBJ-y))
>  obj-bin-y +=3D mbi2.init.o
> -extra-$(XEN_BUILD_EFI) +=3D buildid.o relocs-dummy.o
> +extra-$(XEN_BUILD_EFI) +=3D buildid.o relocs-dummy.o relocs-empty.o
>  nocov-$(XEN_BUILD_EFI) +=3D stub.o
> --- /dev/null
> +++ b/xen/arch/x86/efi/relocs-empty.S
> @@ -0,0 +1,8 @@
> +/*
> + * Empty .reloc section, simply to indicate to GNU ld that the output .r=
eloc
> + * section in xen.efi should not be marked IMAGE_SCN_MEM_DISCARDABLE.  T=
his
> + * requires GNU ld 2.46 or newer to actually be understood in the intend=
ed way.
> + */
> +
> +	.section .reloc, "a", @progbits
> +	.balign 4

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--eIu06BDLJtj5LfkC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmo7vU8ACgkQ24/THMrX
1ywHBQf+PqK0BHrML8eD+TBmbAvLQp3veSnR7YHCdqzWEWqT4NpFKMMwqlsHPehS
92QvtyaSMxEJa0y54dzlV8VTCEh3aBRBlKcTzdv5JVkndGwz2TtmmiGdO2S1nBt/
YwoJq2ymbznvnjbsUBvNOL5Ao3/Vinh6PFMUENfkEMG9Xs5oPVbxYX2rg53ee8PM
jVK9M1b2kbt/JeutYcNdiJwhjSpHj9ycuU/eqkEpypgGxO4BpLOOsHSyKxvwMRd6
1mzVKMtrxxxOHZM05A2+JAeOtIr3XqxqRlG7NGC7njHpQYGYRdmF20Q82SPA9RcX
OIA+PVIoewU0PC4t5EhHxf5NAsbV9w==
=JSb9
-----END PGP SIGNATURE-----

--eIu06BDLJtj5LfkC--

