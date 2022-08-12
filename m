Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EEC590EBA
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 12:08:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385520.621190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMRaL-000788-Mn; Fri, 12 Aug 2022 10:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385520.621190; Fri, 12 Aug 2022 10:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMRaL-00076K-K2; Fri, 12 Aug 2022 10:08:09 +0000
Received: by outflank-mailman (input) for mailman id 385520;
 Fri, 12 Aug 2022 10:08:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Og4R=YQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oMRaK-000769-Ay
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 10:08:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9357b2b-1a26-11ed-924f-1f966e50362f;
 Fri, 12 Aug 2022 12:08:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 879F7350DB;
 Fri, 12 Aug 2022 10:08:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3374413AAE;
 Fri, 12 Aug 2022 10:08:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9flUC4Ym9mJTUgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 12 Aug 2022 10:08:06 +0000
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
X-Inumbo-ID: a9357b2b-1a26-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660298886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NVDaw5p6vNmZ1enCOm+8lhIUA8xJXt69X+TrhCsmmOs=;
	b=sZXDfUc1QdR7k+JAv4/a6LESF14+YRl+Gca69T3ek3RPBP315/oT1/6hqB/32mWvHlpKFM
	ibVaptRHK9fqjQ30jXbckue5efWgUFRdUnyd7Re6XwVexRLg4VzkyyUCx1v+/g6V0cyimT
	IdUYqMWuNsY1k/0VvkLKdn+xRf7nOpY=
Message-ID: <0fe2bac3-1002-62d0-b016-ec0aab5136af@suse.com>
Date: Fri, 12 Aug 2022 12:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 0/3] xen-blk{back,front}: Fix two bugs in
 'feature_persistent'
Content-Language: en-US
To: SeongJae Park <sj@kernel.org>, roger.pau@citrix.com
Cc: axboe@kernel.dk, boris.ostrovsky@oracle.com, olekstysh@gmail.com,
 andrii.chepurnyi82@gmail.com, mheyne@amazon.de,
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20220715225108.193398-1-sj@kernel.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220715225108.193398-1-sj@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------szlUbWexBBD0WsyUA303s8ws"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------szlUbWexBBD0WsyUA303s8ws
Content-Type: multipart/mixed; boundary="------------zNXfOtpsK813uOMQ0CgwDvnS";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: SeongJae Park <sj@kernel.org>, roger.pau@citrix.com
Cc: axboe@kernel.dk, boris.ostrovsky@oracle.com, olekstysh@gmail.com,
 andrii.chepurnyi82@gmail.com, mheyne@amazon.de,
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Message-ID: <0fe2bac3-1002-62d0-b016-ec0aab5136af@suse.com>
Subject: Re: [PATCH v4 0/3] xen-blk{back,front}: Fix two bugs in
 'feature_persistent'
References: <20220715225108.193398-1-sj@kernel.org>
In-Reply-To: <20220715225108.193398-1-sj@kernel.org>

--------------zNXfOtpsK813uOMQ0CgwDvnS
Content-Type: multipart/mixed; boundary="------------t9UXksdrowSK7pI6N0fKWlL9"

--------------t9UXksdrowSK7pI6N0fKWlL9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDcuMjIgMDA6NTEsIFNlb25nSmFlIFBhcmsgd3JvdGU6DQo+IEludHJvZHVjdGlv
biBvZiAnZmVhdHVyZV9wZXJzaXN0ZW50JyBtYWRlIHR3byBidWdzLiAgRmlyc3Qgb25lIGlz
IHdyb25nDQo+IG92ZXJ3cml0ZSBvZiAndmJkLT5mZWF0dXJlX2dudF9wZXJzaXN0ZW50JyBp
biAnYmxrYmFjaycgZHVlIHRvIHdyb25nDQo+IHBhcmFtZXRlciB2YWx1ZSBjYWNoaW5nIHBv
c2l0aW9uLCBhbmQgdGhlIHNlY29uZCBvbmUgaXMgdW5pbnRlbmRlZA0KPiBiZWhhdmlvcmFs
IGNoYW5nZSB0aGF0IGNvdWxkIGJyZWFrIHByZXZpb3VzIGR5bmFtaWMgZnJvbnRlbmQvYmFj
a2VuZA0KPiBwZXJzaXN0ZW50IGZlYXR1cmUgc3VwcG9ydCBjaGFuZ2VzLiAgVGhpcyBwYXRj
aHNldCBmaXhlcyB0aGUgaXNzdWVzLg0KPiANCj4gQ2hhbmdlcyBmcm9tIHYzDQo+IChodHRw
czovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMjAyMjA3MTUxNzU1MjEuMTI2NjQ5LTEt
c2pAa2VybmVsLm9yZy8pDQo+IC0gU3BsaXQgJ2Jsa2JhY2snIHBhdGNoIGZvciBlYWNoIG9m
IHRoZSB0d28gaXNzdWVzDQo+IC0gQWRkICdSZXBvcnRlZC1ieTogQW5kcmlpIENoZXB1cm55
aSA8YW5kcmlpLmNoZXB1cm55aTgyQGdtYWlsLmNvbT4nDQo+IA0KPiBDaGFuZ2VzIGZyb20g
djINCj4gKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8yMDIyMDcxNDIyNDQx
MC41MTE0Ny0xLXNqQGtlcm5lbC5vcmcvKQ0KPiAtIEtlZXAgdGhlIGJlaGF2aW9yYWwgY2hh
bmdlIG9mIHYxDQo+IC0gVXBkYXRlIGJsa2Zyb250J3MgY291bnRlcnBhcnQgdG8gZm9sbG93
IHRoZSBjaGFuZ2VkIGJlaGF2aW9yDQo+IC0gVXBkYXRlIGRvY3VtZW50cyBmb3IgdGhlIGNo
YW5nZWQgYmVoYXZpb3INCj4gDQo+IENoYW5nZXMgZnJvbSB2MQ0KPiAoaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcveGVuLWRldmVsLzIwMjIwMTA2MDkxMDEzLjEyNjA3Ni0xLW1oZXluZUBh
bWF6b24uZGUvKQ0KPiAtIEF2b2lkIHRoZSBiZWhhdmlvcmFsIGNoYW5nZQ0KPiAgICAoaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzIwMjIwMTIxMTAyMzA5LjI3ODAyLTEt
c2pAa2VybmVsLm9yZy8pDQo+IC0gUmViYXNlIG9uIGxhdGVzdCB4ZW4vdGlwL2xpbnV4LW5l
eHQNCj4gLSBSZS13b3JrIGJ5IFNlb25nSmFlIFBhcmsgPHNqQGtlcm5lbC5vcmc+DQo+IC0g
Q2Mgc3RhYmxlQA0KPiANCj4gTWF4aW1pbGlhbiBIZXluZSAoMSk6DQo+ICAgIHhlbi1ibGti
YWNrOiBBcHBseSAnZmVhdHVyZV9wZXJzaXN0ZW50JyBwYXJhbWV0ZXIgd2hlbiBjb25uZWN0
DQo+IA0KPiBTZW9uZ0phZSBQYXJrICgyKToNCj4gICAgeGVuLWJsa2JhY2s6IGZpeCBwZXJz
aXN0ZW50IGdyYW50cyBuZWdvdGlhdGlvbg0KPiAgICB4ZW4tYmxrZnJvbnQ6IEFwcGx5ICdm
ZWF0dXJlX3BlcnNpc3RlbnQnIHBhcmFtZXRlciB3aGVuIGNvbm5lY3QNCj4gDQo+ICAgLi4u
L0FCSS90ZXN0aW5nL3N5c2ZzLWRyaXZlci14ZW4tYmxrYmFjayAgICAgIHwgIDIgKy0NCj4g
ICAuLi4vQUJJL3Rlc3Rpbmcvc3lzZnMtZHJpdmVyLXhlbi1ibGtmcm9udCAgICAgfCAgMiAr
LQ0KPiAgIGRyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMgICAgICAgICAgICB8
IDIwICsrKysrKysrLS0tLS0tLS0tLS0NCj4gICBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9u
dC5jICAgICAgICAgICAgICAgICAgfCAgNCArLS0tDQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAx
MSBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkNCj4gDQoNCkZvciB0aGUgc2VyaWVz
Og0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoN
Ckp1ZXJnZW4NCg==
--------------t9UXksdrowSK7pI6N0fKWlL9
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------t9UXksdrowSK7pI6N0fKWlL9--

--------------zNXfOtpsK813uOMQ0CgwDvnS--

--------------szlUbWexBBD0WsyUA303s8ws
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmL2JoUFAwAAAAAACgkQsN6d1ii/Ey+Y
vAf/W9Zv8JzlafFxgkSemVJjs++2j5yl9eNLRXRPUIuesj6vJMsPb8uHJ0H5z2Rcg6+cmOGDIfFP
fyaamCoxQNFGfoqltM5fNRPENQ/m2EVFj84Rrxk1XpweX5W6v3jbMPOsaCQYM3dFRwNMmaCzAjZu
U0VwAiiKJDtcJaBoRBQ0+LEhuGVj72dnVcOIW2xjjJUa9kDq7MQBzuiX4AsHWyiJKHplFLWOazQU
02+BDUMl9QnPkRPUWMgCdSUzi+sl+kpMp7r3crCasG3lUb+8IXjS8JlxIZVasR3NckN4JHMyHJad
e2LSWs15iGFn+tpjEU6iAMArT5Mx6fXgXo5ztg3WXw==
=gaCM
-----END PGP SIGNATURE-----

--------------szlUbWexBBD0WsyUA303s8ws--

