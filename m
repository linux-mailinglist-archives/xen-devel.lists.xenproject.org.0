Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7386FA06A
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 09:02:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531275.826859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvut6-0008Aa-Md; Mon, 08 May 2023 07:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531275.826859; Mon, 08 May 2023 07:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvut6-00087E-JD; Mon, 08 May 2023 07:02:24 +0000
Received: by outflank-mailman (input) for mailman id 531275;
 Mon, 08 May 2023 07:02:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SOTd=A5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pvut5-000875-20
 for xen-devel@lists.xen.org; Mon, 08 May 2023 07:02:23 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 475b669a-ed6e-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 09:02:21 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8C44F22038;
 Mon,  8 May 2023 07:02:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3F0C81346B;
 Mon,  8 May 2023 07:02:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id b1GqDX2eWGT/KAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 08 May 2023 07:02:21 +0000
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
X-Inumbo-ID: 475b669a-ed6e-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683529341; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NLWDrEm93LZyOFp9xeXo6/XT6xDUF7ihv0pjc2/CGE4=;
	b=G5rh8vPRZ3AJXEFa9qc8uv/cQ6qd63PNGotWqAGoOyNk9W1u6bDIc/lviWZoL0eGt5KG4o
	uMogbfhwDjVZ5o/cLe2m1kmzSxj5wZ1jQf+B9Gshok8mwd9LdXn107jT/NWaz9dhtYB6XD
	/UfZ7bukKYbQWU3gvj9kDMWcDs6YTt4=
Message-ID: <016edde8-e47e-a988-e5c1-f5aad0d4b60d@suse.com>
Date: Mon, 8 May 2023 09:02:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] libxl: arm: Allow grant mappings for backends running on
 Dom0
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, xen-devel@lists.xen.org,
 stratos-dev@op-lists.linaro.org, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Mathieu Poirier <mathieu.poirier@linaro.com>,
 Erik Schilling <erik.schilling@linaro.org>
References: <817f0320316dd144826add0ac834618026b91160.1680165772.git.viresh.kumar@linaro.org>
 <25fb2b71-b663-b712-01cd-5c75aa4ccf9b@gmail.com>
 <20230404234228.vghxrrj6auy7zw4c@vireshk-i7>
 <20230505061934.jm3bwjgsl5hf5rns@vireshk-i7>
 <CAPD2p-nvLXdxkwik-UPjS1JAjz6z2FNuxb1JYrj4bNwusEZpPg@mail.gmail.com>
 <20230508040927.uhgwfkhknwyvsowu@vireshk-i7>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230508040927.uhgwfkhknwyvsowu@vireshk-i7>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8TdY1rGaWKCJvGGRqi62EHVh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8TdY1rGaWKCJvGGRqi62EHVh
Content-Type: multipart/mixed; boundary="------------LljxTwaMiE7SpQZT1QMO5GRq";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, xen-devel@lists.xen.org,
 stratos-dev@op-lists.linaro.org, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Mathieu Poirier <mathieu.poirier@linaro.com>,
 Erik Schilling <erik.schilling@linaro.org>
Message-ID: <016edde8-e47e-a988-e5c1-f5aad0d4b60d@suse.com>
Subject: Re: [PATCH] libxl: arm: Allow grant mappings for backends running on
 Dom0
References: <817f0320316dd144826add0ac834618026b91160.1680165772.git.viresh.kumar@linaro.org>
 <25fb2b71-b663-b712-01cd-5c75aa4ccf9b@gmail.com>
 <20230404234228.vghxrrj6auy7zw4c@vireshk-i7>
 <20230505061934.jm3bwjgsl5hf5rns@vireshk-i7>
 <CAPD2p-nvLXdxkwik-UPjS1JAjz6z2FNuxb1JYrj4bNwusEZpPg@mail.gmail.com>
 <20230508040927.uhgwfkhknwyvsowu@vireshk-i7>
In-Reply-To: <20230508040927.uhgwfkhknwyvsowu@vireshk-i7>

--------------LljxTwaMiE7SpQZT1QMO5GRq
Content-Type: multipart/mixed; boundary="------------SfLWA0MwlAA6q5B9qosBCs3a"

--------------SfLWA0MwlAA6q5B9qosBCs3a
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDUuMjMgMDY6MDksIFZpcmVzaCBLdW1hciB3cm90ZToNCj4gT24gMDUtMDUtMjMs
IDE2OjExLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToNCj4+IEkgd2FzIGdvaW5nIHRv
IHByb3Bvc2UgYW4gaWRlYSwgYnV0IEkgaGF2ZSBqdXN0IHJlYWxpemVkIHRoYXQgeW91IGFs
cmVhZHkNCj4+IHZvaWNlZCBpdCBoZXJlIFsxXSApKQ0KPj4gU28gd2hhdCB5b3UgcHJvcG9z
ZWQgdGhlcmUgc291bmRzIHJlYXNvbmFibGUgdG8gbWUuDQo+Pg0KPj4gSSB3aWxsIGp1c3Qg
cmVwaHJhc2UgaXQgYWNjb3JkaW5nIHRvIG15IHVuZGVyc3RhbmRpbmc6DQo+Pg0KPj4gV2Ug
cHJvYmFibHkgbmVlZCB0byBjb25zaWRlciB0cmFuc2Zvcm1pbmcgeW91ciAiZm9yY2VkX2dy
YW50IiB0byBzb21ldGhpbmcNCj4+IHRocmVlLXN0YXRlLCBmb3IgZXhhbXBsZQ0KPj4gImdy
YW50X3VzYWdlIiAob3IgInVzZV9ncmFudCIgYXMgeW91IHN1Z2dlc3RlZCkgd2hpY2ggY291
bGQgYmUgImRlZmF1bHQNCj4+IGJlaGF2aW91ciIgb3IgImFsd2F5cyBkaXNhYmxlZCIsIG9y
ICJhbHdheXMgZW5hYmxlZCIuDQo+Pg0KPj4gV2l0aCAiZ3JhbnRfdXNhZ2U9ZGVmYXVsdCIg
d2Ugd2lsbCBnZXQgZXhhY3Qgd2hhdCB3ZSBoYXZlIGF0IHRoZSBtb21lbnQNCj4+IChvbmx5
IGNyZWF0ZSBpb21tdSBub2RlcyBpZiBiYWNrZW5kLWRvbWlkICE9IDApDQo+PiBXaXRoICJn
cmFudF91c2FnZT1kaXNhYmxlZCIgd2Ugd2lsbCBmb3JjZSBncmFudHMgdG8gYmUgYWx3YXlz
IGRpc2FibGVkDQo+PiAoZG9uJ3QgY3JlYXRlIGlvbW11IG5vZGVzIGlycmVzcGVjdGl2ZSBv
ZiB0aGUgZG9tYWluKQ0KPj4gV2l0aCAiZ3JhbnRfdXNhZ2U9ZW5hYmxlZCIgd2Ugd2lsbCBm
b3JjZSBncmFudHMgdG8gYmUgYWx3YXlzIGVuYWJsZWQNCj4+IChhbHdheXMgY3JlYXRlIGlv
bW11IG5vZGVzIGlycmVzcGVjdGl2ZSBvZiB0aGUgZG9tYWluKQ0KPiANCj4gSSB3YXMgd29u
ZGVyaW5nIGlmICJncmFudF91c2FnZT1kZWZhdWx0IiBjYW4gYmUgaW50ZXJwcmV0ZWQgYnkg
dGhlDQo+IGFic2VuY2Ugb2YgdGhlIGdyYW50X3VzYWdlIHBhcmFtZXRlci4gU28ganVzdCBn
cmFudF91c2FnZT0xIG9yIDAsDQo+IHdoaWNoIHdvdWxkIG1lYW4gZW5hYmxlZCBvciBkaXNh
YmxlZCBhbmQgaWYgZ3JhbnRfdXNhZ2UgaXNuJ3QgcGFzc2VkLA0KPiB3ZSB3b3VsZCBzd2l0
Y2ggYmFjayB0byBkZWZhdWx0Lg0KDQpJIGRvbid0IHRoaW5rIHRoaXMgaXMgYSBnb29kIGlk
ZWEuIEkgdGhpbmsgeW91J2QgbmVlZCB0aGUgM3JkIHN0YXRlIGFscmVhZHkNCmluIHRoZSBp
bnRlcmZhY2UgYmV0d2VlbiB4bCBhbmQgbGlieGwuDQoNCg0KSnVlcmdlbg0KDQo=
--------------SfLWA0MwlAA6q5B9qosBCs3a
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------SfLWA0MwlAA6q5B9qosBCs3a--

--------------LljxTwaMiE7SpQZT1QMO5GRq--

--------------8TdY1rGaWKCJvGGRqi62EHVh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRYnnwFAwAAAAAACgkQsN6d1ii/Ey/L
LwgAm1/ilqFa/bVlI3stWVraQeJ83u7kj8C+bB1tElWemvPL7UjiGuxuRKJhEH5jQY35HvcEZk1i
PKiTecPd9ze0ZvuPFq2nh7cSszAOlAJK6EMluAzd3TaEfPNv6PqfB08+qbm9ZG0aX0XsqeJ383lf
aMXoa+F+DBVjFKIMANswxVtrDkowGFTD9T8wLGY5jncavIKDI4ko6EJgUc8XvF5aIvNbhDgbw8dC
53j7ya9EVEiJaFPiTamJhtHewit3ZOJAujvltf4IQGA5XlHQuIJUubZM56rCt11V+tke4k/Nq5VW
EULruSEA7aNdOywxiAFT4g8HpKnTSKwPeKX2UGq9TA==
=MC4x
-----END PGP SIGNATURE-----

--------------8TdY1rGaWKCJvGGRqi62EHVh--

