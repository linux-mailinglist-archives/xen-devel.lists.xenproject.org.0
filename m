Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mP1kHqhWuWnYAgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 14:27:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E252AAD7E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 14:27:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256115.1550819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2UR7-0006Am-3L; Tue, 17 Mar 2026 13:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256115.1550819; Tue, 17 Mar 2026 13:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2UR7-00068B-04; Tue, 17 Mar 2026 13:26:17 +0000
Received: by outflank-mailman (input) for mailman id 1256115;
 Tue, 17 Mar 2026 13:26:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vPV1=BR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1w2UR4-000682-Pg
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2026 13:26:14 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd61fde5-2204-11f1-b164-2bf370ae4941;
 Tue, 17 Mar 2026 14:26:12 +0100 (CET)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfout.phl.internal (Postfix) with ESMTP id A9FC3EC01DB;
 Tue, 17 Mar 2026 09:26:10 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Tue, 17 Mar 2026 09:26:10 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Mar 2026 09:26:08 -0400 (EDT)
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
X-Inumbo-ID: dd61fde5-2204-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1773753970;
	 x=1773840370; bh=II9/LYsuzrJHS5+ItRRewIdo70SGmby1E+yml1dRBOE=; b=
	lZ+2PzHd/+/IAqhPn1I5/+fnIPxqLv9o0rCdLPuV7jfk1bEb33hx4PzddLmqDcTN
	NCPTcEaI97BBC6vx66b9MtUrMW3tHvZJMuc6bOdiAYs44wdmVdg9TiJtPpvbmHni
	fQ9shA0pu1uO2M/Lz5A2xR2UX9OeNFXr4TI7FJuxy4lEpCitF8tqzyPEDdPX5Etk
	3HqEAsgPB7pAFtocELb56pAcLZPwspx3shpaS3OsFqA+PZUAvRXfe416oMVV4QIy
	CNozTL6g+6z9NpROa9tc+rrO3PfMuJKKGSI3APGsM3wElLLiMlPwSdnfmEdsJzHw
	OI7wRvmn4DIHeRvF/dcOjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1773753970; x=1773840370; bh=II9/LYsuzrJHS5+ItRRewIdo70SGmby1E+y
	ml1dRBOE=; b=00pH3jSWLQZ1NpaQ2f40AaV2y3O3iajtU8U9PFXoHi3YuKHzb5C
	gWGQE6cSqoSJPvi8uQiB5QC8Ce6D9lbDJZYJqpsjbGP0kpXR5txZ0BsNgffMopDA
	4Sh0ArCg97KkAq/tZi0w8VY3amfSe5BgXVKagWbZEJuMpoii0WQTFa4Lh5jyQPJT
	L+e/Pkzw2mfztRlBKvucLJ6BfTfutWT7mmj1N+aks5/feb+HcbCozN6hG1rSwnEA
	VWOSJQGXSxweI6sj/gTulQVAVejIKBw3cBjfOIwjGwE53smVc1tsJ2ql9nlVlM0o
	YNLD2/57qhBi01WjrPZYrQkPjAlp1/zs/7g==
X-ME-Sender: <xms:cla5aX6TasairNVoCZaermR5mZq_05dD6DjNgKgW8JQRL2fdyn3JIQ>
    <xme:cla5afIE2nY-PwLvEc1UwXQcnMya_XDovxUnZdSRzMRl-1fgpOwm04aYmu7tkdYsF
    Yrj-0L4Z4m2qbcXG5BqkYr6xRJM9yRNoZnVOAZlON2gTZQh>
X-ME-Received: <xmr:cla5aQtjodEUCt79R4O3qNnZ-NIWmOuMAsV7D3BvjcUA8ouCZ5KwQO77_T5-FrxdfFI7DWXAJ6jcwCbxATC5JkmU-8wXUzfOspg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftddufeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleehueff
    gffftdffffffteehvdekjeevhfekleduueevgeffgeeuleeggeeljeehnecuffhomhgrih
    hnpehgihhthhhusgdrtghomhdpphgrthgthhgvfidrohhrghdpghhithhlrggsrdgtohhm
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrh
    hmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghp
    thhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhouhhmhigrjhihoh
    htihhsrghrkhgrrhdvfeesghhmrghilhdrtghomhdprhgtphhtthhopeigvghnqdguvghv
    vghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehsrghrkh
    grrhhsohhumhihrghjhihothhivdefsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghn
    ughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopeguphhsmh
    hithhhsegrphgvrhhtuhhsshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehjsggv
    uhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghith
    hrihigrdgtohhm
X-ME-Proxy: <xmx:cla5aeJ7hqe_KUkf9xofYE1_C4PAhT8h-9kBG_ipiZEAvGrlTwhyLA>
    <xmx:cla5aZ-fnJ8aIbiqVfkGOWqk3ka7TBG16Uqkn2IEkdieUkdFay6T0w>
    <xmx:cla5aXww-ge1qHwEwoM3AxxDV9O76I5NWrkZguv1u6AwCERADzXLKQ>
    <xmx:cla5aW5oQNuVbhKKescqG24i97OaXMrT31E75vanHlldrMbbA2okkA>
    <xmx:cla5aQXsXfHZtNaZ-XGTZ8sEhvIVzcVu3QY-eCL9AK1UunHg1LsMCyOc>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 17 Mar 2026 14:26:07 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH v3 0/3] Fixing ACPI BGRT (Boot Graphics Resource
 Table) corruption
Message-ID: <ablWb3STcioss8Jj@mail-itl>
References: <20260312111414.17808-1-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8hN24WjD+uI3YMbO"
Content-Disposition: inline
In-Reply-To: <20260312111414.17808-1-soumyajyotisarkar23@gmail.com>
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:soumyajyotisarkar23@gmail.com,m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,citrix.com,apertussolutions.com,suse.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,suse.com:email,messagingengine.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B3E252AAD7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--8hN24WjD+uI3YMbO
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Mar 2026 14:26:07 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH v3 0/3] Fixing ACPI BGRT (Boot Graphics Resource
 Table) corruption

On Thu, Mar 12, 2026 at 04:44:11PM +0530, Soumyajyotii Ssarkar wrote:
> This RFC series plans to addres ACPI BGRT (Boot Graphics Resource Table) =
corruption,
> that occured when Xen reuses the memory containing the boot logo
> image before dom0 is able to parse ACPI tables.
>=20
> The BGRT table contains a pointer to a BMP image stored in
> BootServicesData memory. When Xen reclaims this memory early in boot,
> the pointer becomes invalid, causing Linux dom0 to report:
> Xen: `(XEN) ACPI: BGRT: invalidating v1 image at 0x47cc2018`
> Linux (dom0): `ACPI BIOS Warning (bug): Incorrect checksum
> in table [BGRT] - 0xF9, should be 0xB4 (20250807/utcksum-58)`
>=20
> This series:
> 1. Adds BGRT image preservation infrastructure during EFI boot
> (validates BMP format, allocates EfiACPIReclaimMemory, stores pointers)
>=20
> 2. Integrates preservation with ACPI subsystem
> (clarifies acpi_invalidate_bgrt() safety net behavior,
> adds status reporting via efi_bgrt_status_info())
>=20
> 3. Provides opt-out mechanism
> (-nobgrt for xen.efi direct boot, efi=3Dno-bgrt
> for multiboot2, both via early EFI-phase parsing)
>=20
> The preservation is enabled by default to fix the corruption for all
> users, with minimal overhead (~1MB). Also, servers that don't need boot
> graphics can disable it using the "efi=3Dno-bgrt" option.
>=20
> Thank you everyone for the constructive feedback! It is really helpful,
> I hope this RFC series is upto standards, I would greatly appriciate furt=
her feedback.
>=20
> Changes since v1:
> - The BGRT invalidation behaviour should still presist
>   and server as a safety net when "efi=3Dno-bgrt" or the
>   preservation fails for some reason thus: Add Clarify comment
>   for BGRT invalidation behavior with preservation.
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
>=20
> Changes since v2:
> - Use existing ACPI headers (actbl.h, actbl3.h) instead of custom structs
> - Modify the function names and code in function to conform with Coding S=
tyle.
> - Reuse efi.acpi20 from efi_tables() instead of manual RSDP search
> - Use appropriate types: EFI types for firmware code, unsigned int for
>   loop counters (matching ESRT pattern)
> - Used of sizeof(<expression>) over sizeof(<type>)
> - Remove fixed-type widths & limited typecasting
> - Add Blank line ahead of the main return statement of a function.
> - Better wording error message for image cap size
> - Remove parse_boolean(no-bgrt) since it could be bit misleading
> - Add const qualifiers throughout for safety
> - Use %p format for pointers (32-bit compatibility)
> - Initialize failure_reason with string literal for proper relocation
> - Use memcmp() with ACPI_SIG_* constants for signature checks
> - Add direct Xen.efi calling.
> - Add opt-out mechanism with proper early parsing during EFI phase.
>=20
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Reported-by: Jan Beulich=C2=A0<jbeulich@suse.com>
>=20
> Please refer to QubesOS Issue for more context:
> https://github.com/QubesOS/qubes-issues/issues/10764
>=20
> This is a companion series to Linux Kernel side at
> https://patchew.org/linux/cover.751f45ebbb644244b1d9da3aff289d6b66db4c6b.=
1773058629.git-series.marmarek@invisiblethingslab.com/
>=20
> Testing:
> - Verified on Intel UEFI system with Fedora 43 dom0
> - Before: ACPI checksum errors in dom0
> - After: Clean boot, no ACPI warnings
> - Memory overhead: ~972 KB (preserved image size)
>=20
> Signed-off-by: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>

Hi,

I've pushed this series to CI, and it fails to build in several targets:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/2390562809

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--8hN24WjD+uI3YMbO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmm5Vm8ACgkQ24/THMrX
1yxgbwf6A835c9cFWek5xGt5j+pqG6tAo6JzbrM+7Z21qBUDhYMgkLYWVidtGvBm
YJaBkq/SfQNDm0VCXmOohrJT0pztgmFo1nx3VRUkYYyY4VANZgG32wCKxw3Dbrhf
DTdm7xolenXd/ffmf13FRMkni7QH34esOy+iLQMXNkoXfl7rgkNCHzYR8lxxq740
2RsbpT57ubTcOWiEvtkXnun/10VrZszdE35f0Pm9OFpgPWjmRcetf7LVOOJweFkj
7pvC5qdAM15sO+Tn0Jb7Yzk5Bk/HgghZ6F4ztzRm3L1OdBdHkkQl/wBok4lENkqr
vDyzL6azh9fkunAIzv7CcecP0xXNJw==
=CFRG
-----END PGP SIGNATURE-----

--8hN24WjD+uI3YMbO--

