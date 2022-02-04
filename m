Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E08334A964A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 10:24:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265256.458594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFuph-0008K7-Tw; Fri, 04 Feb 2022 09:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265256.458594; Fri, 04 Feb 2022 09:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFuph-0008Hk-QI; Fri, 04 Feb 2022 09:24:45 +0000
Received: by outflank-mailman (input) for mailman id 265256;
 Fri, 04 Feb 2022 09:24:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wIUc=ST=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nFupg-0006TE-4j
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 09:24:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 494da17e-859c-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 10:24:43 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3A8391F44E;
 Fri,  4 Feb 2022 09:24:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A0BB13322;
 Fri,  4 Feb 2022 09:24:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id obCkBNvw/GE8eQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 04 Feb 2022 09:24:43 +0000
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
X-Inumbo-ID: 494da17e-859c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1643966683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DqdA+DBRa90BxqXlpLNlJ+Ze+BNHIBaKbH8YkKc6bwY=;
	b=mIoHGcrlxPMh8V8FNHV09dweAwlxMFd3Ztd9zaPXm0JLU3W+nO3jL15LM0dsHLp6uVAoZm
	bXzINg1hr53CmYZHX0tOHod1IlYg/2aNDXMrxXfbbtUEpYvnoiq7fze5it3vMuKWlREV2V
	8m9Y8L8r6MW+ca2QkuANLUDqpNFXaas=
Message-ID: <c522051d-41c9-cbe8-68bd-0d10b5bef2ab@suse.com>
Date: Fri, 4 Feb 2022 10:24:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] x86/Xen: streamline (and fix) PV CPU enumeration
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2dbd5f0a-9859-ca2d-085e-a02f7166c610@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <2dbd5f0a-9859-ca2d-085e-a02f7166c610@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jy0qU0Z4HDMvLq5kabIuetKE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jy0qU0Z4HDMvLq5kabIuetKE
Content-Type: multipart/mixed; boundary="------------HKl3OGvg2lKkHce4tyNUhLKo";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <c522051d-41c9-cbe8-68bd-0d10b5bef2ab@suse.com>
Subject: Re: [PATCH] x86/Xen: streamline (and fix) PV CPU enumeration
References: <2dbd5f0a-9859-ca2d-085e-a02f7166c610@suse.com>
In-Reply-To: <2dbd5f0a-9859-ca2d-085e-a02f7166c610@suse.com>

--------------HKl3OGvg2lKkHce4tyNUhLKo
Content-Type: multipart/mixed; boundary="------------xDKk03bowPY1c0pJSn9zYuQ6"

--------------xDKk03bowPY1c0pJSn9zYuQ6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDIuMjIgMTE6NTcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBUaGlzIHN0YXJ0ZWQg
b3V0IHdpdGggbWUgbm90aWNpbmcgdGhhdCAiZG9tMF9tYXhfdmNwdXM9PE4+IiB3aXRoIDxO
Pg0KPiBsYXJnZXIgdGhhbiB0aGUgbnVtYmVyIG9mIHBoeXNpY2FsIENQVXMgcmVwb3J0ZWQg
dGhyb3VnaCBBQ1BJIHRhYmxlcw0KPiB3b3VsZCBub3QgYnJpbmcgdXAgdGhlICJleGNlc3Mi
IHZDUFUtcy4gQWRkcmVzc2luZyB0aGlzIGlzIHRoZSBwcmltYXJ5DQo+IHB1cnBvc2Ugb2Yg
dGhlIGNoYW5nZTsgQ1BVIG1hcHMgaGFuZGxpbmcgaXMgYmVpbmcgdGlkaWVkIG9ubHkgYXMg
ZmFyIGFzDQo+IGlzIG5lY2Vzc2FyeSBmb3IgdGhlIGNoYW5nZSBoZXJlICh3aXRoIHRoZSBl
ZmZlY3Qgb2YgYWxzbyBhdm9pZGluZyB0aGUNCj4gc2V0dGluZyB1cCBvZiB0b28gbXVjaCBw
ZXItQ1BVIGluZnJhc3RydWN0dXJlLCBpLmUuIGZvciBDUFVzIHdoaWNoIGNhbg0KPiBuZXZl
ciBjb21lIG9ubGluZSkuDQo+IA0KPiBOb3RpY2luZyB0aGF0IHhlbl9maWxsX3Bvc3NpYmxl
X21hcCgpIGlzIGNhbGxlZCB3YXkgdG9vIGVhcmx5LCB3aGVyZWFzDQo+IHhlbl9maWx0ZXJf
Y3B1X21hcHMoKSBpcyBjYWxsZWQgdG9vIGxhdGUgKGFmdGVyIHBlci1DUFUgYXJlYXMgd2Vy
ZQ0KPiBhbHJlYWR5IHNldCB1cCksIGFuZCBmdXJ0aGVyIG9ic2VydmluZyB0aGF0IGVhY2gg
b2YgdGhlIGZ1bmN0aW9ucyBzZXJ2ZXMNCj4gb25seSBvbmUgb2YgRG9tMCBvciBEb21VLCBp
dCBsb29rZWQgbGlrZSBpdCB3YXMgYmV0dGVyIHRvIHNpbXBsaWZ5IHRoaXMuDQo+IFVzZSB0
aGUgLmdldF9zbXBfY29uZmlnIGhvb2sgaW5zdGVhZCwgdW5pZm9ybWx5IGZvciBEb20wIGFu
ZCBEb21VLg0KPiB4ZW5fZmlsbF9wb3NzaWJsZV9tYXAoKSBjYW4gYmUgZHJvcHBlZCBhbHRv
Z2V0aGVyLCB3aGlsZQ0KPiB4ZW5fZmlsdGVyX2NwdV9tYXBzKCkgaXMgcmUtcHVycG9zZWQg
YnV0IG5vdCBvdGhlcndpc2UgY2hhbmdlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUHVzaGVkIHRvIHhlbi90aXAuZ2l0IGZv
ci1saW51cy01LjE3YQ0KDQoNCkp1ZXJnZW4NCg==
--------------xDKk03bowPY1c0pJSn9zYuQ6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------xDKk03bowPY1c0pJSn9zYuQ6--

--------------HKl3OGvg2lKkHce4tyNUhLKo--

--------------jy0qU0Z4HDMvLq5kabIuetKE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmH88NoFAwAAAAAACgkQsN6d1ii/Ey9F
4Af/UGUOzoHkvC9hE+u/irb3LpecWG83u9+plkvKcC2JQb7y2dvUG84ZMblndiLi4WbnmTXe3ydh
ZfEU+ONtakSq5fqgl7x4fVtNzHYGG7gDkfKhH4FVXi1iqHiQIkq4aWqHgTWC2x+hOzHy8bhPG76j
5uPUV5r+8PT+X43/FkBH+OR6/Z/65T0MvJF97VxUfO5MfV6pEWWYeEkgQe98erxIlvxiahqhMV1h
so756Fupl6npLANUROUzelTR6t/j05eROYVhLRLotbjghZuxAlyEpKle0QAQ2gn6i+0yaRDdWp0Q
goCf+Ijs7O7NkWM0ueUdKcbKuAB6QlRbd2ndNm4QaA==
=Chy+
-----END PGP SIGNATURE-----

--------------jy0qU0Z4HDMvLq5kabIuetKE--

