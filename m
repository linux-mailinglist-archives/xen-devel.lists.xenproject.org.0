Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C392D52A2B7
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 15:08:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330797.554188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqww0-0005ka-Eq; Tue, 17 May 2022 13:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330797.554188; Tue, 17 May 2022 13:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqww0-0005in-BP; Tue, 17 May 2022 13:08:20 +0000
Received: by outflank-mailman (input) for mailman id 330797;
 Tue, 17 May 2022 13:08:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TCcn=VZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nqwvy-0005ih-TZ
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 13:08:18 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b090e1d-d5e2-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 15:08:17 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 623321F88E;
 Tue, 17 May 2022 13:08:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0D75C13AA2;
 Tue, 17 May 2022 13:08:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4eHzAUGeg2IqKgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 17 May 2022 13:08:17 +0000
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
X-Inumbo-ID: 6b090e1d-d5e2-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1652792897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2X+dWmW4qKk1Omh9IGkzJeCFLP+bmUHDbneLtJzaIM=;
	b=MNXYKYMrj7OjU2uaHxXw4zzElf+6m9LS0giVYc2sDErtL7RwbtRiQZisR3yBX2U2g+ipy6
	voZuM7Juaj9eQO9TxGLEvfDPqqf7svOcJztUbFSqJZIMl9s0ORcXTDLHiyT8XCm0gTNlCq
	j6k/XTYZXR4q9QBWUFVhBXAJzzWRrqc=
Message-ID: <d64b7a15-8c67-dbca-6413-cd75ad372328@suse.com>
Date: Tue, 17 May 2022 15:08:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [REGRESSION] Re: [PATCH v8 6/7] arm/dom0less: assign dom0less
 guests to cpupools
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 "wei.chen@arm.com" <wei.chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
References: <20220506120012.32326-1-luca.fancellu@arm.com>
 <20220506120012.32326-7-luca.fancellu@arm.com>
 <e434527b-5804-324c-3619-51a552802d2f@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <e434527b-5804-324c-3619-51a552802d2f@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HZCuOs24YbxrBd6jU7GCSObh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HZCuOs24YbxrBd6jU7GCSObh
Content-Type: multipart/mixed; boundary="------------xG1vAtTagHOH00IiOvW02PHg";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 "wei.chen@arm.com" <wei.chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
Message-ID: <d64b7a15-8c67-dbca-6413-cd75ad372328@suse.com>
Subject: Re: [REGRESSION] Re: [PATCH v8 6/7] arm/dom0less: assign dom0less
 guests to cpupools
References: <20220506120012.32326-1-luca.fancellu@arm.com>
 <20220506120012.32326-7-luca.fancellu@arm.com>
 <e434527b-5804-324c-3619-51a552802d2f@citrix.com>
In-Reply-To: <e434527b-5804-324c-3619-51a552802d2f@citrix.com>

--------------xG1vAtTagHOH00IiOvW02PHg
Content-Type: multipart/mixed; boundary="------------ueL1SpFutTJM6oQ2rISvCl16"

--------------ueL1SpFutTJM6oQ2rISvCl16
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDUuMjIgMTU6MDEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDA2LzA1LzIw
MjIgMTM6MDAsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiBJbnRyb2R1Y2UgZG9tYWluLWNw
dXBvb2wgcHJvcGVydHkgb2YgYSB4ZW4sZG9tYWluIGRldmljZSB0cmVlIG5vZGUsDQo+PiB0
aGF0IHNwZWNpZmllcyB0aGUgY3B1cG9vbCBkZXZpY2UgdHJlZSBoYW5kbGUgb2YgYSB4ZW4s
Y3B1cG9vbCBub2RlDQo+PiB0aGF0IGlkZW50aWZpZXMgYSBjcHVwb29sIGNyZWF0ZWQgYXQg
Ym9vdCB0aW1lIHdoZXJlIHRoZSBndWVzdCB3aWxsDQo+PiBiZSBhc3NpZ25lZCBvbiBjcmVh
dGlvbi4NCj4+DQo+PiBBZGQgbWVtYmVyIHRvIHRoZSB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFp
biBwdWJsaWMgaW50ZXJmYWNlIHNvIHRoZQ0KPj4gWEVOX0RPTUNUTF9JTlRFUkZBQ0VfVkVS
U0lPTiB2ZXJzaW9uIGlzIGJ1bXBlZC4NCj4+DQo+PiBBZGQgcHVibGljIGZ1bmN0aW9uIHRv
IHJldHJpZXZlIGEgcG9vbCBpZCBmcm9tIHRoZSBkZXZpY2UgdHJlZQ0KPj4gY3B1cG9vbCBu
b2RlLg0KPj4NCj4+IFVwZGF0ZSBkb2N1bWVudGF0aW9uIGFib3V0IHRoZSBwcm9wZXJ0eS4N
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFy
bS5jb20+DQo+PiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPg0KPiANCj4gVGhpcyBoYXMgYnJva2VuIHRoZSBPY2FtbCBiaW5kaW5n
cywgYW5kIGlzIGNvbmNlcHR1YWxseSB3cm9uZy4NCj4gDQo+IFRoZSBjcHVwb29sIHRvIHVz
ZSBpcyBhIHByb3BlcnR5IG9mIHRoZSB2Y3B1LCBub3QgdGhlIGRvbWFpbi7CoCBJdCBpc24n
dA0KPiBsZWdpdGltYXRlbHkgcGFydCBvZiBjcmVhdGVkb21haW4uDQoNCldoYXQ/DQoNCkFs
bCB2Y3B1cyBvZiBhIGRvbWFpbiBhcmUgYWx3YXlzIGluIHRoZSBzYW1lIGNwdXBvb2wuIFRo
ZXJlIGlzIG5vIG9wZXJhdGlvbg0KIm1vdmUgdmNwdSB0byBjcHVwb29sIiwgYnV0ICJtb3Zl
IGRvbWFpbiB0byBjcHVwb29sIi4gU28geW91ciBjbGFpbSB0aGF0DQp0aGUgY3B1cG9vbCB3
b3VsZG4ndCBiZSBhIHByb3BlcnR5IG9mIHRoZSBkb21haW4gIGlzIElNTyB3cm9uZy4NCg0K
DQpKdWVyZ2VuDQo=
--------------ueL1SpFutTJM6oQ2rISvCl16
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ueL1SpFutTJM6oQ2rISvCl16--

--------------xG1vAtTagHOH00IiOvW02PHg--

--------------HZCuOs24YbxrBd6jU7GCSObh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKDnkAFAwAAAAAACgkQsN6d1ii/Ey+H
uwf/aM1GkyiHdEWN1tCwD+0Jon//DOTvXHgVNnyy68YaQP6pnQMOqgIr4D8bjHMiN6e9siazTvtf
VYE/0aBwasKXsFJRDBj5/YEQR+gpSrutMFjQ/ERHqPSW+bHgQz7a4/lJyzO2mZeLw+Ki8xmx3GdT
qsqyKSTU1iQu3kiGGNv31UMB31Ay9i2MtAevl1Io1Z2etE8U2ldwWVmGc6neb6y1bbOpq30unWs6
KvowsXKP2PJEdniLiKUZkfIX9D1NHS+oZpv+yr87hN3lH9rEM0F3vyJQ5MOJw9KJ7hPkjKCQsH0Q
piwypKY8m7tx22pDTnzJR1l3kH6j3kPNlOwlFAPLMg==
=qjif
-----END PGP SIGNATURE-----

--------------HZCuOs24YbxrBd6jU7GCSObh--

