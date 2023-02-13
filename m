Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C24B1693F70
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 09:19:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494175.764150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRU3g-00087z-2l; Mon, 13 Feb 2023 08:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494175.764150; Mon, 13 Feb 2023 08:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRU3f-00085e-WA; Mon, 13 Feb 2023 08:19:31 +0000
Received: by outflank-mailman (input) for mailman id 494175;
 Mon, 13 Feb 2023 08:19:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DRhn=6J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pRU3e-0007Wh-5z
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 08:19:30 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 230e11df-ab77-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 09:19:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8786C376F7;
 Mon, 13 Feb 2023 08:19:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 56D66138E6;
 Mon, 13 Feb 2023 08:19:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ib2uE5Hy6WNHNgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Feb 2023 08:19:29 +0000
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
X-Inumbo-ID: 230e11df-ab77-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676276369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SkuA5xII7+Ncctp/H+cyI401E5MSoxuprPOZVgQ02vo=;
	b=RsY/DEF/MS2viQV0EowO8KkuorK0OAk9TqN2MF3+Y0loY5yTQXypryN9WHlbOQBegkBb+j
	19GPh5bx7AQfjUQThikP6/lw6f1j5gHpGYBGADt3mdpXvj5aQdHXggXqNr3x9tR1Xywz6H
	n5ZuwDwtBbAkR/AC6h+jVNnmwxS9GQE=
Message-ID: <dc9269b1-c91e-86d1-fd6d-9a3ffddf3ed9@suse.com>
Date: Mon, 13 Feb 2023 09:19:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] xen/pvcalls-back: fix permanently masked event channel
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
References: <20230119211037.1234931-1-volodymyr_babchuk@epam.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230119211037.1234931-1-volodymyr_babchuk@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------o02q2LSfjS5J4W0k0xTSfHED"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------o02q2LSfjS5J4W0k0xTSfHED
Content-Type: multipart/mixed; boundary="------------VrHgZmgU9EkzvUMOgLaXDPLp";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Message-ID: <dc9269b1-c91e-86d1-fd6d-9a3ffddf3ed9@suse.com>
Subject: Re: [PATCH] xen/pvcalls-back: fix permanently masked event channel
References: <20230119211037.1234931-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230119211037.1234931-1-volodymyr_babchuk@epam.com>

--------------VrHgZmgU9EkzvUMOgLaXDPLp
Content-Type: multipart/mixed; boundary="------------YxAi6fY1IXewUiJhyUIbZRaX"

--------------YxAi6fY1IXewUiJhyUIbZRaX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDEuMjMgMjI6MTEsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOg0KPiBUaGVyZSBp
cyBhIHNlcXVlbmNlIG9mIGV2ZW50cyB0aGF0IGNhbiBsZWFkIHRvIGEgcGVybWFuZW50bHkg
bWFza2VkDQo+IGV2ZW50IGNoYW5uZWwsIGJlY2F1c2UgeGVuX2lycV9sYXRlZW9pKCkgaXMg
bmV3ZXIgY2FsbGVkLiBUaGlzIGhhcHBlbnMNCj4gd2hlbiBhIGJhY2tlbmQgcmVjZWl2ZXMg
c3B1cmlvdXMgd3JpdGUgZXZlbnQgZnJvbSBhIGZyb250ZW5kLiBJbiB0aGlzDQo+IGNhc2Ug
cHZjYWxsc19jb25uX2JhY2tfd3JpdGUoKSByZXR1cm5zIGVhcmx5IGFuZCBpdCBkb2VzIG5v
dCBjbGVhcnMgdGhlDQo+IG1hcC0+d3JpdGUgY291bnRlci4gQXMgbWFwLT53cml0ZSA+IDAs
IHB2Y2FsbHNfYmFja19pb3dvcmtlcigpIHJldHVybnMNCj4gd2l0aG91dCBjYWxsaW5nIHhl
bl9pcnFfbGF0ZWVvaSgpLiBUaGlzIGxlYXZlcyB0aGUgZXZlbnQgY2hhbm5lbCBpbg0KPiBt
YXNrZWQgc3RhdGUsIGEgYmFja2VuZCBkb2VzIG5vdCByZWNlaXZlIGFueSBuZXcgZXZlbnRz
IGZyb20gYQ0KPiBmcm9udGVuZCBhbmQgdGhlIHdob2xlIGNvbW11bmljYXRpb24gc3RvcHMu
DQo+IA0KPiBNb3ZlIGF0b21pY19zZXQoJm1hcC0+d3JpdGUsIDApIHRvIHRoZSB2ZXJ5IGJl
Z2lubmluZyBvZg0KPiBwdmNhbGxzX2Nvbm5fYmFja193cml0ZSgpIHRvIGZpeCB0aGlzIGlz
c3VlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15
cl9iYWJjaHVrQGVwYW0uY29tPg0KPiBSZXBvcnRlZC1ieTogT2xla3NpaSBNb2lzaWVpZXYg
PG9sZWtzaWlfbW9pc2llaWV2QGVwYW0uY29tPg0KDQpQdXNoZWQgdG86IHhlbi90aXAuZ2l0
IGZvci1saW51cy02LjMNCg0KDQpKdWVyZ2VuDQoNCg==
--------------YxAi6fY1IXewUiJhyUIbZRaX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------YxAi6fY1IXewUiJhyUIbZRaX--

--------------VrHgZmgU9EkzvUMOgLaXDPLp--

--------------o02q2LSfjS5J4W0k0xTSfHED
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPp8pAFAwAAAAAACgkQsN6d1ii/Ey/c
nAf/cLnO2nQuoqUvqA94flf8a/e5q/wYnPzoH8W0BT+b4NvK0eJedhEb30hd3Xg5SPhALA8npJE+
/10ZXbYDuWbJYrEGMDs3ztFoGCLc+HlCbN7lIrbaBtHZMPCBUn5VUJe7mhoMYaOEqwT9Df6J8CPF
5TASi6wAl14sivDM05X8KAcAqYcst8KrsNAspCNL0dFGlx+OhPRHD5JQyy232pUB7rldYkDheplh
OPEDMAjE1qFCTmWAY7E8j+8a80At+Drhrmf29AC8lLF+H5dO8SdYvKtu2vMjk/rzymd0e9KVdtn7
0Cmq35jyn6zfFiHTq0OYJbmPtH9xuQxdn7cWUYfrGw==
=pCG1
-----END PGP SIGNATURE-----

--------------o02q2LSfjS5J4W0k0xTSfHED--

