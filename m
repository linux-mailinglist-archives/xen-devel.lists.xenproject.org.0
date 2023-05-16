Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257857044FB
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 08:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534945.832457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pynr4-0001gc-CV; Tue, 16 May 2023 06:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534945.832457; Tue, 16 May 2023 06:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pynr4-0001db-9L; Tue, 16 May 2023 06:08:14 +0000
Received: by outflank-mailman (input) for mailman id 534945;
 Tue, 16 May 2023 06:08:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y0Pc=BF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pynr2-0001dS-RU
 for xen-devel@lists.xen.org; Tue, 16 May 2023 06:08:12 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0725c82b-f3b0-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 08:08:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6AFB61F88F;
 Tue, 16 May 2023 06:08:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2C631138F9;
 Tue, 16 May 2023 06:08:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /+jACccdY2QAagAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 16 May 2023 06:08:07 +0000
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
X-Inumbo-ID: 0725c82b-f3b0-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1684217287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GD/+EBI9SoZaAK8VDCEYu2eYK8G0RD7/2UU0BMpBuhY=;
	b=njqRSHzyf2dwL8Pzx4mrH3Mq7TW9NNwmubwHSfhwcx8luZM3mkP5yi/soWDkktE2iPPEgm
	6gdaiDJIMv/MgyBtFwB8iSXVZVXFBVSL49lOFN4YxBZ9RJmGOEb7HpD3NylGnYRBF5ssNW
	CgO2xwQT9UPuvDwWnw3ddohmCdvHn/4=
Message-ID: <c49127d5-be23-8aaf-0c6a-f8d9dfbd43cf@suse.com>
Date: Tue, 16 May 2023 08:08:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH V2 2/2] libxl: arm: Add grant_usage parameter for virtio
 devices
To: Viresh Kumar <viresh.kumar@linaro.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xen.org, Julien Grall <julien@xen.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Erik Schilling <erik.schilling@linaro.org>
References: <782a7b3f54c36a3930a031647f6778e8dd02131d.1683791298.git.viresh.kumar@linaro.org>
 <ccf5b1402fb7156be0ef33b44f7b114efbe76319.1683791298.git.viresh.kumar@linaro.org>
 <5dc217d6-ca8f-4c5f-ad7c-2ab30d6647bd@perard>
 <20230515120600.bsfw6pe3usae4sl4@vireshk-i7>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230515120600.bsfw6pe3usae4sl4@vireshk-i7>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fDmRZFZcHqwJ1E3tu0wmUO86"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fDmRZFZcHqwJ1E3tu0wmUO86
Content-Type: multipart/mixed; boundary="------------ZuyNh3NhdITfLJGveM6Brdo8";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xen.org, Julien Grall <julien@xen.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Erik Schilling <erik.schilling@linaro.org>
Message-ID: <c49127d5-be23-8aaf-0c6a-f8d9dfbd43cf@suse.com>
Subject: Re: [PATCH V2 2/2] libxl: arm: Add grant_usage parameter for virtio
 devices
References: <782a7b3f54c36a3930a031647f6778e8dd02131d.1683791298.git.viresh.kumar@linaro.org>
 <ccf5b1402fb7156be0ef33b44f7b114efbe76319.1683791298.git.viresh.kumar@linaro.org>
 <5dc217d6-ca8f-4c5f-ad7c-2ab30d6647bd@perard>
 <20230515120600.bsfw6pe3usae4sl4@vireshk-i7>
In-Reply-To: <20230515120600.bsfw6pe3usae4sl4@vireshk-i7>

--------------ZuyNh3NhdITfLJGveM6Brdo8
Content-Type: multipart/mixed; boundary="------------4xh0HsbVJAjb6gfQF1aE1YZ8"

--------------4xh0HsbVJAjb6gfQF1aE1YZ8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDUuMjMgMTQ6MDYsIFZpcmVzaCBLdW1hciB3cm90ZToNCj4gT24gMTItMDUtMjMs
IDExOjQzLCBBbnRob255IFBFUkFSRCB3cm90ZToNCj4+IE9uIFRodSwgTWF5IDExLCAyMDIz
IGF0IDAxOjIwOjQzUE0gKzA1MzAsIFZpcmVzaCBLdW1hciB3cm90ZToNCj4+PiBkaWZmIC0t
Z2l0IGEvZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluIGIvZG9jcy9tYW4veGwuY2ZnLjUucG9k
LmluDQo+Pj4gaW5kZXggMjRhYzkyNzE4Mjg4Li4wNDA1ZjZlZmU2MmEgMTAwNjQ0DQo+Pj4g
LS0tIGEvZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluDQo+Pj4gKysrIGIvZG9jcy9tYW4veGwu
Y2ZnLjUucG9kLmluDQo+Pj4gQEAgLTE2MTksNiArMTYxOSwxOCBAQCBoZXhhZGVjaW1hbCBm
b3JtYXQsIHdpdGhvdXQgdGhlICIweCIgcHJlZml4IGFuZCBhbGwgaW4gbG93ZXIgY2FzZSwg
bGlrZQ0KPj4+ICAgU3BlY2lmaWVzIHRoZSB0cmFuc3BvcnQgbWVjaGFuaXNtIGZvciB0aGUg
VmlydGlvIGRldmljZSwgb25seSAibW1pbyIgaXMNCj4+PiAgIHN1cHBvcnRlZCBmb3Igbm93
Lg0KPj4+ICAgDQo+Pj4gKz1pdGVtIEI8Z3JhbnRfdXNhZ2U9U1RSSU5HPg0KPj4+ICsNCj4+
PiArU3BlY2lmaWVzIHRoZSBncmFudCB1c2FnZSBkZXRhaWxzIGZvciB0aGUgVmlydGlvIGRl
dmljZS4gVGhpcyBjYW4gYmUgc2V0IHRvDQo+Pj4gK2ZvbGxvd2luZyB2YWx1ZXM6DQo+Pj4g
Kw0KPj4+ICstICJkZWZhdWx0IjogVGhlIGRlZmF1bHQgZ3JhbnQgc2V0dGluZyB3aWxsIGJl
IHVzZWQsIGVuYWJsZSBncmFudHMgaWYNCj4+PiArICBiYWNrZW5kLWRvbWlkICE9IDAuDQo+
Pg0KPj4gSSBkb24ndCB0aGluayB0aGlzICJkZWZhdWx0IiBzZXR0aW5nIGlzIHVzZWZ1bC4g
V2UgY291bGQganVzdCBkZXNjcmliZQ0KPj4gd2hhdCB0aGUgZGVmYXVsdCBpcyB3aGVuICJn
cmFudF91c2FnZSIgc2V0dGluZyBpcyBtaXNzaW5nIGZyb20gdGhlDQo+PiBjb25maWd1cmF0
aW9uLg0KPiANCj4gVGhpcyBpcyB3aGF0IEkgc3VnZ2VzdGVkIGVhcmxpZXIgWzFdLCBtYXli
ZSBJIG1pc3VuZGVyc3Rvb2Qgd2hhdA0KPiBKdWVyZ2VuIHNhaWQuDQoNCkkgdGhpbmsgSSBq
dXN0IGhhZCBhbm90aGVyIG9waW5pb24uIEJ1dCB0aGUgb25lIG9mIHRoZSBtYWludGFpbmVy
IGlzIHRoZSBvbmUNCmNvdW50aW5nIGluIHRoaXMgY2FzZSBJTU8uIDotKQ0KDQoNCkp1ZXJn
ZW4NCg0K
--------------4xh0HsbVJAjb6gfQF1aE1YZ8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------4xh0HsbVJAjb6gfQF1aE1YZ8--

--------------ZuyNh3NhdITfLJGveM6Brdo8--

--------------fDmRZFZcHqwJ1E3tu0wmUO86
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRjHcYFAwAAAAAACgkQsN6d1ii/Ey9D
Uwf/QoK/ljTbasCTTz6fEEdYMzVwBiz+ZMQG+61Uul3x15lTUgqq2hyt92Eysi8gp7As4u9QitZg
RC/O9sIBFVNKEePUAxAsEU3igOnE2rw63YRAf8BdPU/ejlFqazjNG3sFlR1V1bWhsvCfD+72wqQP
x5ypW5g+5XQ9iHu1s7LI377NkQflhDUvO9uVU7pZbrtFP+4icmQOwzneYsQJoKhfUKqWX232Z2+U
qYY56OyCeA8GUjeicJzddTbyoyjgV+aim+3GQQJsvuXkMOJxv6qAuEXKRfxw6J669S7CQqHaZxp4
mDahkrtDzVn5sNgC5XzNOtc1dIZ4guRQELOGF4qENA==
=1Dbr
-----END PGP SIGNATURE-----

--------------fDmRZFZcHqwJ1E3tu0wmUO86--

