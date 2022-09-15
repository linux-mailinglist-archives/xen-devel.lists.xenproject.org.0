Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 100915B9A2D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 13:56:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407342.649822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYnTv-00051S-Jc; Thu, 15 Sep 2022 11:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407342.649822; Thu, 15 Sep 2022 11:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYnTv-0004ze-Gl; Thu, 15 Sep 2022 11:56:35 +0000
Received: by outflank-mailman (input) for mailman id 407342;
 Thu, 15 Sep 2022 11:56:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/0/a=ZS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oYnTt-0004zV-Jp
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 11:56:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70c90343-34ed-11ed-a31c-8f8a9ae3403f;
 Thu, 15 Sep 2022 13:56:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DD9E41F88D;
 Thu, 15 Sep 2022 11:56:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A3E6213A49;
 Thu, 15 Sep 2022 11:56:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id l3iIJu8SI2OrNQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 15 Sep 2022 11:56:31 +0000
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
X-Inumbo-ID: 70c90343-34ed-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1663242991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/og/nJIu9CtXSSOQWEO2KGDGYXfSlySFkKWBQQPtySk=;
	b=ulp3LGXigxWDVOVFIaLjB8Qvy7Pu/bnWitzuO3UcPHTcv4nhlM1rN8Ld3uKMDD9xczh7HC
	q+OBB/SD+9IYqxnA8YDBgoMVkft1lNZ02oAvOzQN4d+ux3HIJ3X1O3/hNkTYMbNwcZgHnU
	0cXR6u6hs2r87tW/eH1EKxvS2/luQgg=
Message-ID: <3bc938e9-c00e-577c-38be-f0d345dd1524@suse.com>
Date: Thu, 15 Sep 2022 13:56:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/2] xen/gnttab: reduce size of struct
 active_grant_entry
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220913093256.22880-1-jgross@suse.com>
 <20220913093256.22880-3-jgross@suse.com>
 <232141b4-88ab-34d4-389d-e354f15e56ef@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <232141b4-88ab-34d4-389d-e354f15e56ef@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HSj2JuEAjAHa5Jnfnrz07YjZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HSj2JuEAjAHa5Jnfnrz07YjZ
Content-Type: multipart/mixed; boundary="------------wIVk9Pedx3FzXTWYpkpLcqoN";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <3bc938e9-c00e-577c-38be-f0d345dd1524@suse.com>
Subject: Re: [PATCH v2 2/2] xen/gnttab: reduce size of struct
 active_grant_entry
References: <20220913093256.22880-1-jgross@suse.com>
 <20220913093256.22880-3-jgross@suse.com>
 <232141b4-88ab-34d4-389d-e354f15e56ef@suse.com>
In-Reply-To: <232141b4-88ab-34d4-389d-e354f15e56ef@suse.com>

--------------wIVk9Pedx3FzXTWYpkpLcqoN
Content-Type: multipart/mixed; boundary="------------ND74CCRPSZodvN0km9mi3mBW"

--------------ND74CCRPSZodvN0km9mi3mBW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDkuMjIgMTM6NTAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMy4wOS4yMDIy
IDExOjMyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gVGhlIHNpemUgb2Ygc3RydWN0IGFj
dGl2ZV9ncmFudF9lbnRyeSBmb3IgNjQtYml0IGJ1aWxkcyBpcyA0MCBvciA0OA0KPj4gYnl0
ZXMgdG9kYXkgKHdpdGggb3Igd2l0aG91dCBOREVCVUcpLg0KPj4NCj4+IEl0IGNhbiBlYXNp
bHkgYmUgcmVkdWNlZCBieSA4IGJ5dGVzIGJ5IHJlcGxhY2luZyB0aGUgdHJhbnNfZG9tYWlu
DQo+PiBwb2ludGVyIHdpdGggdGhlIGRvbWlkIG9mIHRoZSByZWxhdGVkIGRvbWFpbi4gdHJh
bnNfZG9tYWluIGlzIG9ubHkgZXZlcg0KPj4gdXNlZCBmb3IgdHJhbnNpdGl2ZSBncmFudHMs
IHdoaWNoIGRvZXNuJ3QgaGF2ZSBhbnkga25vd24gdXNlcnMuDQo+Pg0KPj4gVGhpcyByZWR1
Y3Rpb24gd2lsbCByZXN1bHQgaW4gbGVzcyBtZW1vcnkgdXNhZ2UgYW5kIChmb3IgcHJvZHVj
dGlvbg0KPj4gYnVpbGRzKSBpbiBmYXN0ZXIgY29kZSwgYXMgaW5kZXhpbmcgaW50byB0aGUg
YWN0aXZlX2dyYW50X2VudHJ5IGFycmF5DQo+PiB3aWxsIGJlIG11Y2ggZWFzaWVyIHdpdGgg
YW4gZW50cnkgaGF2aW5nIGEgcG93ZXItb2YtMiBzaXplLg0KPj4NCj4+IFRoZSBwZXJmb3Jt
YW5jZSBsb3NzIHdoZW4gdXNpbmcgdHJhbnNpdGl2ZSBncmFudHMgc2hvdWxkbid0IHJlYWxs
eQ0KPj4gbWF0dGVyLCBnaXZlbiB0aGUgcHJvYmFiaWxpdHkgdGhhdCB0aG9zZSBhcmVuJ3Qg
aW4gdXNlIGF0IGFsbC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+IFYyOg0KPj4gLSByZW5hbWUgdHJhbnNfZG9t
aWQgdG8gc3JjX2RvbWlkIChKYW4gQmV1bGljaCkNCj4+IC0tLQ0KPj4gICB4ZW4vY29tbW9u
L2dyYW50X3RhYmxlLmMgfCAxMyArKysrKysrLS0tLS0tDQo+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYw0K
Pj4gaW5kZXggZmJhMzI5ZGNjMi4uNTkzNDJkZjNiNyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9j
b21tb24vZ3JhbnRfdGFibGUuYw0KPj4gKysrIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5j
DQo+PiBAQCAtMzgxLDEzICszODEsMTMgQEAgc3RydWN0IGFjdGl2ZV9ncmFudF9lbnRyeSB7
DQo+PiAgIH0pDQo+PiAgIA0KPj4gICAgICAgZG9taWRfdCAgICAgICBkb21pZDsgIC8qIERv
bWFpbiBiZWluZyBncmFudGVkIGFjY2Vzcy4gICAgICAgICAgICAgKi8NCj4+ICsgICAgZG9t
aWRfdCAgICAgICBzcmNfZG9taWQ7IC8qIERvbWFpbiBncmFudGluZyBhY2Nlc3MuICAgICAg
ICAgICAgICAgKi8NCj4gDQo+IEknbSBhZnJhaWQgSSBzdGlsbCB2aWV3IHRoZSBjb21tZW50
IGFzIGFtYmlndW91cywgZm9yIHRoZXJlIGJlaW5nIHR3bw0KPiBkb21haW5zIGludm9sdmVk
IGluIGdyYW50aW5nIGFjY2VzcyBmb3IgdHJhbnNpdGl2ZSBncmFudHMuIFByZWZlcmFibHkN
Cj4gd2l0aCBlLmcgIk9yaWdpbmFsIiBhZGRlZCAod2hpY2ggb2YgY291cnNlIGNvdWxkIGJl
IGRvbmUgYnkgdGhlDQo+IGNvbW1pdHRlciwgcHJvdmlkZWQgdGhpcyBpc24ndCBsb3N0IGJ5
IHRoZSB0aW1lIDQuMTggb3BlbnMpLA0KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KDQpUaGFua3MuDQoNCkknbGwganVzdCBzZW5kIGFuIHVwZGF0
ZWQgVjMgKHByb2JhYmx5IHRvbW9ycm93KS4NCg0KDQpKdWVyZ2VuDQo=
--------------ND74CCRPSZodvN0km9mi3mBW
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ND74CCRPSZodvN0km9mi3mBW--

--------------wIVk9Pedx3FzXTWYpkpLcqoN--

--------------HSj2JuEAjAHa5Jnfnrz07YjZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMjEu8FAwAAAAAACgkQsN6d1ii/Ey9g
FQf+PDv4j82Elws+o63y/Hk7IZBKMdP+0P9DZ0R3SjuJwVag+HevqiU7SFP+ybTpOOX++tDuj1+i
wp2N6Fk7UN90b4bOcRr9QKowInOcTrVXlCqpIKmDV5EKLW4n/M7z/iaEdD9yvmhs08PQ1BH/f8Ln
pPYnEcoLlTtYfE1Fd5ScZrHjvdidNagdwh9RkT4rc4MA1JDO0sDJMR3B1g+02fNW0mdKL5n3UZDh
nTze3ujvm2MuU2Y573KkkuGXJpaRWfhnXYmjjmULnlIoE8ZUADBFlYt5ZGxxxp0j8ApKgy8lGwjy
By6iu+wg8pNDLiZqtFgL3nEoISrwNdoJy5Y71YHswQ==
=jmdR
-----END PGP SIGNATURE-----

--------------HSj2JuEAjAHa5Jnfnrz07YjZ--

