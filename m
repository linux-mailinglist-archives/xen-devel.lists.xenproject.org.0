Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 265385F2B21
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 09:48:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414773.659162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofGAh-0006I8-IB; Mon, 03 Oct 2022 07:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414773.659162; Mon, 03 Oct 2022 07:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofGAh-0006En-FG; Mon, 03 Oct 2022 07:47:27 +0000
Received: by outflank-mailman (input) for mailman id 414773;
 Mon, 03 Oct 2022 07:47:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEQx=2E=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ofGAg-0006Eh-1a
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 07:47:26 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e905b36-42ef-11ed-964a-05401a9f4f97;
 Mon, 03 Oct 2022 09:47:24 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 072E121985;
 Mon,  3 Oct 2022 07:47:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D123D1332F;
 Mon,  3 Oct 2022 07:47:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pwNpMYuTOmOTTwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 03 Oct 2022 07:47:23 +0000
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
X-Inumbo-ID: 9e905b36-42ef-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664783244; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uWX7RFJSJ1NYVsarb0IojJUfEmcfN7y8PFYpoIZ60HY=;
	b=OCz1qupSkkysk4MXEC3Gt2c6RM6roOFmCEsvGUQvEFKDc+MFjnwyvUiHDLYWCdYVVnamib
	ZP9lgwjcQYmEpgk6l/oI+Yof2AlfdrGZSffAdbNnfR+gLpGDzxB1F5d2wkn5vTBsS2A9GS
	vcjPAkFh2QvcQBsyfd7qhIunOpXkqL8=
Message-ID: <601e21a6-f42b-f972-1eb0-52d5f97804e5@suse.com>
Date: Mon, 3 Oct 2022 09:47:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] xen: credit2: respect credit2_runqueue=all when arranging
 runqueues
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20220919150927.30081-1-marmarek@invisiblethingslab.com>
 <a0f02ef8-d93e-6083-a0b7-c8dae8905ada@suse.com> <Yym+1k7YlkMpvvaU@mail-itl>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <Yym+1k7YlkMpvvaU@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1taOcUNHkTpgYSIr9oBnQ9m0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1taOcUNHkTpgYSIr9oBnQ9m0
Content-Type: multipart/mixed; boundary="------------KTB59QFqkZoIAaqa0vYRr5OF";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Message-ID: <601e21a6-f42b-f972-1eb0-52d5f97804e5@suse.com>
Subject: Re: [PATCH] xen: credit2: respect credit2_runqueue=all when arranging
 runqueues
References: <20220919150927.30081-1-marmarek@invisiblethingslab.com>
 <a0f02ef8-d93e-6083-a0b7-c8dae8905ada@suse.com> <Yym+1k7YlkMpvvaU@mail-itl>
In-Reply-To: <Yym+1k7YlkMpvvaU@mail-itl>

--------------KTB59QFqkZoIAaqa0vYRr5OF
Content-Type: multipart/mixed; boundary="------------A9pEQZbTgTMNnAgOdKwPSNC4"

--------------A9pEQZbTgTMNnAgOdKwPSNC4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDkuMjIgMTU6MjMsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gT24gVHVlLCBTZXAgMjAsIDIwMjIgYXQgMTE6MDY6NTdBTSArMDIwMCwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+PiBPbiAxOS4wOS4yMDIyIDE3OjA5LCBNYXJlayBNYXJjenlrb3dza2kt
R8OzcmVja2kgd3JvdGU6DQo+Pj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9jcmVkaXQyLmMN
Cj4+PiArKysgYi94ZW4vY29tbW9uL3NjaGVkL2NyZWRpdDIuYw0KPj4+IEBAIC05OTYsOSAr
OTk2LDEzIEBAIGNwdV9hZGRfdG9fcnVucXVldWUoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAq
b3BzLCB1bnNpZ25lZCBpbnQgY3B1KQ0KPj4+ICAgICAgICAgICAgICAgICoNCj4+PiAgICAg
ICAgICAgICAgICAqIE90aGVyd2lzZSwgbGV0J3MgdHJ5IHRvIG1ha2Ugc3VyZSB0aGF0IHNp
YmxpbmdzIHN0YXkgaW4gdGhlDQo+Pj4gICAgICAgICAgICAgICAgKiBzYW1lIHJ1bnF1ZXVl
LCBwcmV0dHkgbXVjaCB1bmRlciBhbnkgY2lucmN1bW5zdGFuY2VzLg0KPj4+ICsgICAgICAg
ICAgICAgKg0KPj4+ICsgICAgICAgICAgICAgKiBGdXJ0aGVybW9yZSwgdHJ5IHRvIHJlc3Bl
Y3QgY3JlZGl0Ml9ydW5xdWV1ZT1hbGwsIGFzIGxvbmcgYXMNCj4+PiArICAgICAgICAgICAg
ICogbWF4X2NwdXNfcnVucSBpc24ndCB2aW9sYXRlZC4NCj4+DQo+PiBUaGlzIGxhc3QgcGFy
dCBpcyBxdWVzdGlvbmFibGUsIHBhcnRseSBiZWNhdXNlIHRoZSBjb21tYW5kIGxpbmUgZG9j
IGlzDQo+PiBhbWJpZ3VvdXMgYXMgdG8gd2hpY2ggb2YgdGhlIHR3byBvcHRpb25zIGlzIGlu
dGVuZGVkIHRvICJ3aW4iLiBJIGd1ZXNzDQo+PiBvbmUgbmVlZHMgdG8ga25vdyB0aGUgb3Jp
Z2luYWwgaW50ZW50aW9ucyB0byByZXNvbHZlIHRoaXMuDQo+IA0KPiBSaWdodCwgSSd2ZSBj
aG9zZW4gdGhpcyBhcHByb2FjaCwgYmVjYXVzZSB5b3UgY2FuIHN0aWxsIGVtdWxhdGUgdGhl
DQo+IG90aGVyIGJ5IHNldHRpbmcgc3VmZmljaWVudGx5IGxhcmdlIG1heF9jcHVzX3J1bnEu
IEkgY2FuIGFkZCBkb2MNCj4gY2xhcmlmaWNhdGlvbiBpbiB2Mi4NCj4gDQoNCkkgdGhpbmsg
dGhpcyBpcyB0aGUgYmV0dGVyIGFwcHJvYWNoLCBhcyBpdCBhbGxvd3MgbW9yZSBmbGV4aWJp
bGl0eS4NCg0KVXBkYXRpbmcgdGhlIGRvYyB3b3VsZCBiZSBtYW5kYXRvcnksIHRob3VnaC4g
V2l0aCB0aGF0IGFkZGVkIHlvdSBjYW4NCmhhdmUgbXk6DQoNClJldmlld2VkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------A9pEQZbTgTMNnAgOdKwPSNC4
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------A9pEQZbTgTMNnAgOdKwPSNC4--

--------------KTB59QFqkZoIAaqa0vYRr5OF--

--------------1taOcUNHkTpgYSIr9oBnQ9m0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmM6k4sFAwAAAAAACgkQsN6d1ii/Ey/t
/Qf+MyU67JKHXriyUxXEIFIm5fdlEwQ5/a9kPdDNy/4v5LFMzMb45ahYDaxtHMRL0CkTK6abFxEe
HSVgYgQVku7n7eqWs2Gq7SxrJEBi5DYgcwOdqp8k+N3qVfW9SCtFurWhlwcxuTBvB9BhFijR6B51
ixJ0Z13Ub9Uo718dSsBvd11pw8avy5ToP8G9txsN8Ikkyu+p+S0FUYUWQk9Lh0pQhWt24Z5cFVF1
5AgpmeuStDN2g5PhnmwCdOXCmuGExWFeC6Y0313mAwAOnPuzUdfPYdTJUU3ScWZweNLVTFOsRxNd
5ZaNcvXCmSVaTi47MYPmR9LrxyfhDOhB1K0NbCURZg==
=tAcQ
-----END PGP SIGNATURE-----

--------------1taOcUNHkTpgYSIr9oBnQ9m0--

