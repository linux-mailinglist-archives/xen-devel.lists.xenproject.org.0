Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C88A6FAC74
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 13:24:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531383.826988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvyxq-0000vv-A0; Mon, 08 May 2023 11:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531383.826988; Mon, 08 May 2023 11:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvyxq-0000sf-6e; Mon, 08 May 2023 11:23:34 +0000
Received: by outflank-mailman (input) for mailman id 531383;
 Mon, 08 May 2023 11:23:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SOTd=A5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pvyxp-0000ru-81
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 11:23:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c13d83fa-ed92-11ed-8611-37d641c3527e;
 Mon, 08 May 2023 13:23:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CE2151FE34;
 Mon,  8 May 2023 11:23:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 95B2F1346B;
 Mon,  8 May 2023 11:23:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id t5UXI6/bWGQ2KgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 08 May 2023 11:23:27 +0000
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
X-Inumbo-ID: c13d83fa-ed92-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683545007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BvpHVm1k2zYQtgm6kSRpmTVy7RWuaY1Ad2jZD6vQ65s=;
	b=q/KpXFUXmdwfU74NLloJMeqsObhR6H7BQPN0IWdMYTvOgvoXaHhPhOSgjUOVns2NMVsU8Y
	CDksf+Jmr7Zg6n1KyMSYdnv8ClNXYcnEZ+lkx8kk5M2RIkGGAwnHJaj8tlx9JTKOarMUOE
	gXvgQW7Wgqjru2ox4r9Xb8mzPuJ/qEo=
Message-ID: <324fd699-dcd8-9881-a276-167be38622b1@suse.com>
Date: Mon, 8 May 2023 13:23:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v1] tools: convert bitfields to unsigned type
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <20230503150142.4987-1-olaf@aepfle.de>
 <d8224847-ffc5-3faf-1bc5-6ad3d7966b26@suse.com>
 <20230508120038.74246111.olaf@aepfle.de>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230508120038.74246111.olaf@aepfle.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GucqRMVKOv2enaXkTjBlexBR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GucqRMVKOv2enaXkTjBlexBR
Content-Type: multipart/mixed; boundary="------------nttb7OYmMOnGDlecJH2qQa0o";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Message-ID: <324fd699-dcd8-9881-a276-167be38622b1@suse.com>
Subject: Re: [PATCH v1] tools: convert bitfields to unsigned type
References: <20230503150142.4987-1-olaf@aepfle.de>
 <d8224847-ffc5-3faf-1bc5-6ad3d7966b26@suse.com>
 <20230508120038.74246111.olaf@aepfle.de>
In-Reply-To: <20230508120038.74246111.olaf@aepfle.de>

--------------nttb7OYmMOnGDlecJH2qQa0o
Content-Type: multipart/mixed; boundary="------------WkhGyOghj6QDnSnCZmAhIFRK"

--------------WkhGyOghj6QDnSnCZmAhIFRK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDUuMjMgMTI6MDAsIE9sYWYgSGVyaW5nIHdyb3RlOg0KPiBNb24sIDggTWF5IDIw
MjMgMTE6MDY6MTEgKzAyMDAgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPjoNCj4g
DQo+Pj4gLSAgICBpbnQgc2hvcnRfc3VtbWFyeV9kb25lOjEsIHByZWFsbG9jX3VucGluOjEs
IHdybWFwX2JmOjE7DQo+Pj4gKyAgICB1bnNpZ25lZCBzaG9ydF9zdW1tYXJ5X2RvbmU6MSwg
cHJlYWxsb2NfdW5waW46MSwgd3JtYXBfYmY6MTsNCj4+IFBsZWFzZSB1c2UgInVuc2lnbmVk
IGludCIgaW5zdGVhZCBvZiBhIHB1cmUgInVuc2lnbmVkIi4NCj4gDQo+IFRoZSBlbnRpcmUg
ZmlsZSB1c2VzIGp1c3QgJ3Vuc2lnbmVkJyBmb3IgYml0ZmllbGRzLg0KDQpJIGhhdmUgZm91
bmQgMTggbGluZXMgdXNpbmcgInVuc2lnbmVkIGludCIgZm9yIGJpdGZpZWxkcyBpbiB0aGlz
IGZpbGUuDQoNCg0KSnVlcmdlbg0K
--------------WkhGyOghj6QDnSnCZmAhIFRK
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------WkhGyOghj6QDnSnCZmAhIFRK--

--------------nttb7OYmMOnGDlecJH2qQa0o--

--------------GucqRMVKOv2enaXkTjBlexBR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRY268FAwAAAAAACgkQsN6d1ii/Ey+3
Mgf/WAyWGxiLFA687yBCTRCN6wg5/pHH+F1oRL2M9yJpgar9Bd+l47X6Afkkcat+bZz8NejrLqLF
twC27U34pP+U54+zL+pQZBArpvmjRY1rZWK1A/C2IaOEt4TRjzR1TyuNxWropLBNLabmbulvP6Su
WAu5aD/Nax1WLIvq93sgiIqN7sUoV3hhhNWqxw+IrBvywCL29HOouCUaDMcraVChacaA2TR8+Pvr
L2N8fdmLu14jrW6bq6TBf30Vo9UHChVAe4Kd1Xbesgoz2hnE3KvIg6attO97XG+RzAbQnciKjoIr
vwUG1FSIR+WQGuJj3m9Pu/a386NMOYvf+XvQGIkExg==
=4z1t
-----END PGP SIGNATURE-----

--------------GucqRMVKOv2enaXkTjBlexBR--

