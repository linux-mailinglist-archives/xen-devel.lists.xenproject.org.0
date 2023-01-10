Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83772663A7D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:07:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474369.735502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF9fZ-0004SZ-R2; Tue, 10 Jan 2023 08:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474369.735502; Tue, 10 Jan 2023 08:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF9fZ-0004Qk-Na; Tue, 10 Jan 2023 08:07:41 +0000
Received: by outflank-mailman (input) for mailman id 474369;
 Tue, 10 Jan 2023 08:07:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLW0=5H=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pF9fY-0004IQ-Cn
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:07:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8637e25-90bd-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 09:07:38 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A68AB4D6EE;
 Tue, 10 Jan 2023 08:07:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 374CE1358A;
 Tue, 10 Jan 2023 08:07:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LNETDMgcvWNKBgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 10 Jan 2023 08:07:36 +0000
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
X-Inumbo-ID: d8637e25-90bd-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673338056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xohioAh1kapJutPJWQnyJIvtrut+K4fCdUNvyrvvEps=;
	b=F/1x9PdCXjPQpN04iGPzwZgJ9ewZMUL6Am2p+uO7S6oRkx1yxxHLC2OkN2nirzqHxJ/eiO
	lkmdc9OI/RFJP8wF1UH6d3f1vS4dNjAaB2KDnNinVFybpOkVE9FUHcIiTtwx/x5UwgvwJP
	3X8qReklSQNoZijRLpF81364vnxmPVA=
Message-ID: <8a2abe27-361a-aab1-60fe-00a3cc8684ff@suse.com>
Date: Tue, 10 Jan 2023 09:07:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] xen: make remove callback of xen driver void returned
Content-Language: en-US
To: Dawei Li <set_pte_at@outlook.com>, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com
Cc: roger.pau@citrix.com, peterhuewe@gmx.de,
 oleksandr_andrushchenko@epam.com, airlied@gmail.com,
 dmitry.torokhov@gmail.com, wei.liu@kernel.org, bhelgaas@google.com,
 jejb@linux.ibm.com, gregkh@linuxfoundation.org, ericvh@gmail.com,
 tiwai@suse.com, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <TYCP286MB23238119AB4DF190997075C9CAE39@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <TYCP286MB23238119AB4DF190997075C9CAE39@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0lgsG4DjM2bogqj9tDjcsDeD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0lgsG4DjM2bogqj9tDjcsDeD
Content-Type: multipart/mixed; boundary="------------r84Y64pzyXf8LsYbXQjpT04r";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Dawei Li <set_pte_at@outlook.com>, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com
Cc: roger.pau@citrix.com, peterhuewe@gmx.de,
 oleksandr_andrushchenko@epam.com, airlied@gmail.com,
 dmitry.torokhov@gmail.com, wei.liu@kernel.org, bhelgaas@google.com,
 jejb@linux.ibm.com, gregkh@linuxfoundation.org, ericvh@gmail.com,
 tiwai@suse.com, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <8a2abe27-361a-aab1-60fe-00a3cc8684ff@suse.com>
Subject: Re: [PATCH v2] xen: make remove callback of xen driver void returned
References: <TYCP286MB23238119AB4DF190997075C9CAE39@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TYCP286MB23238119AB4DF190997075C9CAE39@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>

--------------r84Y64pzyXf8LsYbXQjpT04r
Content-Type: multipart/mixed; boundary="------------BJxvnO001IhyRZyK5BKNLhzp"

--------------BJxvnO001IhyRZyK5BKNLhzp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTIuMjIgMTY6NDYsIERhd2VpIExpIHdyb3RlOg0KPiBTaW5jZSBjb21taXQgZmM3
YTYyMDlkNTcxICgiYnVzOiBNYWtlIHJlbW92ZSBjYWxsYmFjayByZXR1cm4gdm9pZCIpDQo+
IGZvcmNlcyBidXNfdHlwZTo6cmVtb3ZlIGJlIHZvaWQtcmV0dXJuZWQsIGl0IGRvZXNuJ3Qg
bWFrZSBtdWNoIHNlbnNlIGZvcg0KPiBhbnkgYnVzIGJhc2VkIGRyaXZlciBpbXBsZW1lbnRp
bmcgcmVtb3ZlIGNhbGxiYWxrIHRvIHJldHVybiBub24tdm9pZCB0bw0KPiBpdHMgY2FsbGVy
Lg0KPiANCj4gVGhpcyBjaGFuZ2UgaXMgZm9yIHhlbiBidXMgYmFzZWQgZHJpdmVycy4NCj4g
DQo+IEFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IFNpZ25l
ZC1vZmYtYnk6IERhd2VpIExpIDxzZXRfcHRlX2F0QG91dGxvb2suY29tPg0KDQpQdXNoZWQg
dG8geGVuL3RpcC5naXQgZm9yLWxpbnVzLTYuMg0KDQoNCkp1ZXJnZW4NCg0K
--------------BJxvnO001IhyRZyK5BKNLhzp
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------BJxvnO001IhyRZyK5BKNLhzp--

--------------r84Y64pzyXf8LsYbXQjpT04r--

--------------0lgsG4DjM2bogqj9tDjcsDeD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmO9HMcFAwAAAAAACgkQsN6d1ii/Ey+f
1wf+K+5GUrDsbaaoBFao/iA/yd9cCF6PTSRa8C28Z0Xu+s5K30n0thAK7JjyRMZJmzbemu4XZVA6
OxCGIQdrkLTmgoGRTZjdYbFhz7C4ByTAEqkgk72umn3WZEqthOfZY1EE2Imd1beYJzeLfjM6U32h
DuUK14cuf7PbMVfAxpMgPvk+awBFO7fjD5gdNRpAE/F1eseawanTnJSeD5AVm4MRJCwnQr9/8xWA
M0lm0kk3xCfAu1tlqV2XXuAXF8pZCdXr6/heuDpg2UwwakevfI3rHCsGO85anJ1vWiWJR+5N3hrz
8f7fsLu5VuBRJPVziQO8zwQUNBXYTCjlBj7/Ba8lJQ==
=VY/4
-----END PGP SIGNATURE-----

--------------0lgsG4DjM2bogqj9tDjcsDeD--

