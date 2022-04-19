Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 459BC507117
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 16:56:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308239.523884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngpHK-0002lx-9G; Tue, 19 Apr 2022 14:56:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308239.523884; Tue, 19 Apr 2022 14:56:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngpHK-0002jb-5q; Tue, 19 Apr 2022 14:56:30 +0000
Received: by outflank-mailman (input) for mailman id 308239;
 Tue, 19 Apr 2022 14:56:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Io9b=U5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ngpHI-0002jV-AL
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 14:56:28 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e38bb880-bff0-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 16:56:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E5D66210ED;
 Tue, 19 Apr 2022 14:56:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A4DD8139BE;
 Tue, 19 Apr 2022 14:56:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +vsVJ5rNXmLwLAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 19 Apr 2022 14:56:26 +0000
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
X-Inumbo-ID: e38bb880-bff0-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650380186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M6rMU2PX27ALjPb21UoOmGD7knmyGClA6GL0BOOXZpQ=;
	b=oLCfeNjQJ7Q7xtHzDdsLcIPu85UxKX1CCGVHmC/ee8sHUpqz4BxslYPx56Ifx58H1X42nm
	qwNwF/3v78MF0LEY4UBN+EOsl6WdUVJLelSQKyTPemtmvLlE62exPxHKoF/fX5WtjzZQbj
	Ih+Z2lfG3BvpildzphipF0Xy75PR66c=
Message-ID: <93390fcd-4bef-588a-a8e4-ae0a5278acd1@suse.com>
Date: Tue, 19 Apr 2022 16:56:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 3/3] xen/iommu: cleanup iommu related domctl handling
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
References: <20220419135254.21729-1-jgross@suse.com>
 <20220419135254.21729-4-jgross@suse.com>
 <1d1dfeec-6268-1be1-48e1-44b38eed36fd@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <1d1dfeec-6268-1be1-48e1-44b38eed36fd@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rCov8yll0gKavLIpJ3xhqrcz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rCov8yll0gKavLIpJ3xhqrcz
Content-Type: multipart/mixed; boundary="------------Lh9003DIksB5bUK0500eenqH";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <93390fcd-4bef-588a-a8e4-ae0a5278acd1@suse.com>
Subject: Re: [PATCH v3 3/3] xen/iommu: cleanup iommu related domctl handling
References: <20220419135254.21729-1-jgross@suse.com>
 <20220419135254.21729-4-jgross@suse.com>
 <1d1dfeec-6268-1be1-48e1-44b38eed36fd@citrix.com>
In-Reply-To: <1d1dfeec-6268-1be1-48e1-44b38eed36fd@citrix.com>

--------------Lh9003DIksB5bUK0500eenqH
Content-Type: multipart/mixed; boundary="------------rCeKdXYHK9g5v9Hd13ri0ry0"

--------------rCeKdXYHK9g5v9Hd13ri0ry0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDQuMjIgMTY6NTEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDE5LzA0LzIw
MjIgMTQ6NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBUb2RheSBpb21tdV9kb19kb21j
dGwoKSBpcyBiZWluZyBjYWxsZWQgZnJvbSBhcmNoX2RvX2RvbWN0bCgpIGluIHRoZQ0KPj4g
ImRlZmF1bHQ6IiBjYXNlIG9mIGEgc3dpdGNoIHN0YXRlbWVudC4gVGhpcyBoYXMgbGVkIGFs
cmVhZHkgdG8gY3Jhc2hlcw0KPj4gZHVlIHRvIHVudmFsaWRhdGVkIHBhcmFtZXRlcnMuDQo+
Pg0KPj4gRml4IHRoYXQgYnkgbW92aW5nIHRoZSBjYWxsIG9mIGlvbW11X2RvX2RvbWN0bCgp
IHRvIHRoZSBtYWluIHN3aXRjaA0KPj4gc3RhdGVtZW50IG9mIGRvX2RvbWN0bCgpLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+
IC0tLQ0KPj4gQW5vdGhlciBwb3NzaWJpbGl0eSB3b3VsZCBldmVuIGJlIHRvIG1lcmdlIGlv
bW11X2RvX2RvbWN0bCgpIGNvbXBsZXRlbHkNCj4+IGludG8gZG9fZG9tY3RsKCksIGJ1dCBJ
IHdhbnRlZCB0byBzdGFydCB3aXRoIGEgbGVzcyBpbnRydXNpdmUgdmFyaWFudC4NCj4+IFYz
Og0KPj4gLSBuZXcgcGF0Y2gNCj4gDQo+IEkgZGVmaW5pdGVseSBwcmVmZXIgdGhpcyBhcHBy
b2FjaCwgdGhhbmtzLsKgIEluIGFkZGl0aW9uIHRvIGJlaW5nDQo+IGNsZWFyZXIsIGl0J3Mg
YWxzbyBmYXN0ZXIgYmVjYXVzZSB0aGVyZSBpc24ndCBhIGxvbmcgbGluZSBvZiAiZG8geW91
DQo+IHVuZGVyc3RhbmQgdGhpcyBzdWJvcD8iIGNhbGxzIHdoZW4gd2Uga25vdyBleGFjdGx5
IHdoYXQgaXQgaXMuDQo+IA0KPiBIb3dldmVyLCBJIHRoaW5rIHdlIG5lZWQgc3R1YiBmb3Ig
dGhlICFIQVNfUEFTU1RIUk9VR0ggY2FzZSBub3cgdGhhdCBpdA0KPiBpcyBiZWluZyBjYWxs
ZWQgZnJvbSBjb21tb24gY29kZS4NCg0KT2theSwgSSdsbCBhZGQgaXQuIEphbiwgYXJlIHlv
dSBmaW5lIHdpdGggYSBzdHViPw0KDQoNCkp1ZXJnZW4NCg==
--------------rCeKdXYHK9g5v9Hd13ri0ry0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------rCeKdXYHK9g5v9Hd13ri0ry0--

--------------Lh9003DIksB5bUK0500eenqH--

--------------rCov8yll0gKavLIpJ3xhqrcz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJezZoFAwAAAAAACgkQsN6d1ii/Ey+D
9wf7BYyfLD0ImPqVZmmIBpFqlTN6yXy68CWv8PaWXz6JzZZlCGxBv1ZRI9KHQ+jUSCCVWB5vUiQ0
JFCikPRzJRoknYaIoJZPI8stHgO3Ew4ueBQ7UALFXaiD5gsRVVSKm5OdT9KyWKAIE9IJjen5Fvmq
hLTGuf4mRb2EYcheWebsvyhX5WHxFzQqciwAf24xKLYQIM3WRPWx9/yRGcHxfnXurb+fJsCw9D0T
1TzX4uyqvB7WhKCRLiCRI1IYHJ1YTiWa73SL8tp0wCt9HKfmLS3F4xceYXCssCi0+3Dpy61ccpSb
pWxL1gyG49foJWrF7NKat7g7ePf9SZJSladz6rKpoQ==
=9+lx
-----END PGP SIGNATURE-----

--------------rCov8yll0gKavLIpJ3xhqrcz--

