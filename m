Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0584D663A77
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:07:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474363.735491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF9ex-0003tY-E9; Tue, 10 Jan 2023 08:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474363.735491; Tue, 10 Jan 2023 08:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF9ex-0003qX-Ag; Tue, 10 Jan 2023 08:07:03 +0000
Received: by outflank-mailman (input) for mailman id 474363;
 Tue, 10 Jan 2023 08:07:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLW0=5H=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pF9ev-0003qN-OP
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:07:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c272e00a-90bd-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 09:07:00 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E669438644;
 Tue, 10 Jan 2023 08:06:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 42E641358A;
 Tue, 10 Jan 2023 08:06:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OCfgDqMcvWP8BQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 10 Jan 2023 08:06:59 +0000
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
X-Inumbo-ID: c272e00a-90bd-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673338019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zFXGBYfEGk+Jg1p3t9ncmeM1OkJ5SOgglsWjtD+4D3E=;
	b=MU0PDUFJ2NOK1/QtTmhG08jj+/hc3DiAuRHDHTX1+NVJc1guSrtQvC8BVMTDUdfLTtyHGF
	6APJegbUQMpu/JSlQUeDOXjwRXvediBWLPQiIOxWIiWdsx/2uu14gNsCvHo9CWNCj9U567
	FAJqat2f5hJEHt/USBs7CM7dZZ25UOc=
Message-ID: <76596dba-efb7-eab1-bca9-60ab67823ade@suse.com>
Date: Tue, 10 Jan 2023 09:06:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] hvc/xen: lock console list traversal
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linuxppc-dev@lists.ozlabs.org
References: <20221130163611.14686-1-roger.pau@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20221130163611.14686-1-roger.pau@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6nQNq6G02bf1dW0c6lDPjjkY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6nQNq6G02bf1dW0c6lDPjjkY
Content-Type: multipart/mixed; boundary="------------Kb0uGwizoLvibEvRPqCzPKl8";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linuxppc-dev@lists.ozlabs.org
Message-ID: <76596dba-efb7-eab1-bca9-60ab67823ade@suse.com>
Subject: Re: [PATCH v2] hvc/xen: lock console list traversal
References: <20221130163611.14686-1-roger.pau@citrix.com>
In-Reply-To: <20221130163611.14686-1-roger.pau@citrix.com>

--------------Kb0uGwizoLvibEvRPqCzPKl8
Content-Type: multipart/mixed; boundary="------------gP0Ef10fixcPW6kf2HHiGOoT"

--------------gP0Ef10fixcPW6kf2HHiGOoT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMTEuMjIgMTc6MzYsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gVGhlIGN1cnJl
bnRseSBsb2NrbGVzcyBhY2Nlc3MgdG8gdGhlIHhlbiBjb25zb2xlIGxpc3QgaW4NCj4gdnRl
cm1ub190b194ZW5jb25zKCkgaXMgaW5jb3JyZWN0LCBhcyBhZGRpdGlvbnMgYW5kIHJlbW92
YWxzIGZyb20gdGhlDQo+IGxpc3QgY2FuIGhhcHBlbiBhbnl0aW1lLCBhbmQgYXMgc3VjaCB0
aGUgdHJhdmVyc2FsIG9mIHRoZSBsaXN0IHRvIGdldA0KPiB0aGUgcHJpdmF0ZSBjb25zb2xl
IGRhdGEgZm9yIGEgZ2l2ZW4gdGVybW5vIG5lZWRzIHRvIGhhcHBlbiB3aXRoIHRoZQ0KPiBs
b2NrIGhlbGQuICBOb3RlIHVzZXJzIHRoYXQgbW9kaWZ5IHRoZSBsaXN0IGFscmVhZHkgZG8g
c28gd2l0aCB0aGUNCj4gbG9jayB0YWtlbi4NCj4gDQo+IEFkanVzdCBjdXJyZW50IGxvY2sg
dGFrZXJzIHRvIHVzZSB0aGUgX2lycXtzYXZlLHJlc3RvcmV9IGhlbHBlcnMsDQo+IHNpbmNl
IHRoZSBjb250ZXh0IGluIHdoaWNoIHZ0ZXJtbm9fdG9feGVuY29ucygpIGlzIGNhbGxlZCBj
YW4gaGF2ZQ0KPiBpbnRlcnJ1cHRzIGRpc2FibGVkLiAgVXNlIHRoZSBfaXJxe3NhdmUscmVz
dG9yZX0gc2V0IG9mIGhlbHBlcnMgdG8NCj4gc3dpdGNoIHRoZSBjdXJyZW50IGNhbGxlcnMg
dG8gZGlzYWJsZSBpbnRlcnJ1cHRzIGluIHRoZSBsb2NrZWQgcmVnaW9uLg0KPiBJIGhhdmVu
J3QgY2hlY2tlZCBpZiBleGlzdGluZyB1c2VycyBjb3VsZCBpbnN0ZWFkIHVzZSB0aGUgX2ly
cQ0KPiB2YXJpYW50LCBhcyBJIHRoaW5rIGl0J3Mgc2FmZXIgdG8gdXNlIF9pcnF7c2F2ZSxy
ZXN0b3JlfSB1cGZyb250Lg0KPiANCj4gV2hpbGUgdGhlcmUgc3dpdGNoIGZyb20gdXNpbmcg
bGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlIHRvDQo+IGxpc3RfZm9yX2VhY2hfZW50cnk6IHRo
ZSBjdXJyZW50IGVudHJ5IGN1cnNvciB3b24ndCBiZSByZW1vdmVkIGFzDQo+IHBhcnQgb2Yg
dGhlIGNvZGUgaW4gdGhlIGxvb3AgYm9keSwgc28gdXNpbmcgdGhlIF9zYWZlIHZhcmlhbnQg
aXMNCj4gcG9pbnRsZXNzLg0KPiANCj4gRml4ZXM6IDAyZTE5ZjljN2NhYyAoJ2h2Y194ZW46
IGltcGxlbWVudCBtdWx0aWNvbnNvbGUgc3VwcG9ydCcpDQo+IFNpZ25lZC1vZmYtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQpQdXNoZWQgdG8geGVu
L3RpcC5naXQgZm9yLWxpbnVzLTYuMg0KDQoNCkp1ZXJnZW4NCg0K
--------------gP0Ef10fixcPW6kf2HHiGOoT
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------gP0Ef10fixcPW6kf2HHiGOoT--

--------------Kb0uGwizoLvibEvRPqCzPKl8--

--------------6nQNq6G02bf1dW0c6lDPjjkY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmO9HKIFAwAAAAAACgkQsN6d1ii/Ey+t
twf/SCL+Qbrvyi0dgYX3s8xBkFvBU9UzEaa6MxDE1aev/pt1IndKUcFrciE11V00rdeqb+jb/PbR
K5b1n843/V+EbAEFfAIV9K9LCH9YiDFqUJ49yKQEL58vieL2FVD4OvZTWuKTgeTwu1kPrD4O4m7V
UVhWsedPcHGFHWvLs3e8oujnke1Jhj2lfD5DqGWdht1X/4te+j6Owzy3JO69M3FYVRZYzn+72qv/
NON65BQg2FuDujwdzvDP4Vvsqz684JxVc3qi9bI9JH7VJH1FbwApJ1mQKU5xmWx24MxfAPgNEajB
uaJ48m4NrF4BTw4QmhmEQ4vlGS2Ilb4GalWyksQypA==
=E2fh
-----END PGP SIGNATURE-----

--------------6nQNq6G02bf1dW0c6lDPjjkY--

