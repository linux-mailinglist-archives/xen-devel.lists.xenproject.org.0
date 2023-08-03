Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DCA76E57F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 12:22:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576172.902021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVSe-0003ts-Ig; Thu, 03 Aug 2023 10:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576172.902021; Thu, 03 Aug 2023 10:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVSe-0003rD-Fb; Thu, 03 Aug 2023 10:21:40 +0000
Received: by outflank-mailman (input) for mailman id 576172;
 Thu, 03 Aug 2023 10:21:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dmgz=DU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qRVSd-0003r5-48
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 10:21:39 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 874996f1-31e7-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 12:21:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 05703219AD;
 Thu,  3 Aug 2023 10:21:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C6ACF134B0;
 Thu,  3 Aug 2023 10:21:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mnITL7B/y2QEEAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 03 Aug 2023 10:21:36 +0000
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
X-Inumbo-ID: 874996f1-31e7-11ee-b268-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691058097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TWXN2ElWv8BEV6Ycc9EHkQ5nJH5s0YKDnJHm35J5odc=;
	b=Xpd292P6wH1JGfGsDH9pIqEALlHISNQPJ7n59HFk/x3ZnbvFYSuIVKsRofyJF43wqC21RB
	LnWQQOPMyBN+wvsPIGmKjEUOCwFnas8RWmqfIOU1QAH97oHc24Jltcsh9icMtLAuO6ADM8
	GE8vgKt4mYvLC92RbpXgGEpNEI9BUrU=
Message-ID: <2bd36102-0373-dcf4-552f-5b4bed67d595@suse.com>
Date: Thu, 3 Aug 2023 12:21:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 2/2] tools/xenstore: fix get_spec_node()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall
 <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20230724103324.4207-1-jgross@suse.com>
 <20230724103324.4207-3-jgross@suse.com>
 <5aaf37aa-cb7d-59e5-5e0b-40fa73177d35@suse.com>
 <a937b261-d42d-888f-7460-ed431b725c45@suse.com>
 <b82f46ab-d91c-c4cf-faa1-8a78d120fb73@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <b82f46ab-d91c-c4cf-faa1-8a78d120fb73@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RYAYTMBsjGHju0T6r5kKyxqG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RYAYTMBsjGHju0T6r5kKyxqG
Content-Type: multipart/mixed; boundary="------------vEj2nenpQEgjPku105qIaLnc";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall
 <jgrall@amazon.com>, xen-devel@lists.xenproject.org
Message-ID: <2bd36102-0373-dcf4-552f-5b4bed67d595@suse.com>
Subject: Re: [PATCH v3 2/2] tools/xenstore: fix get_spec_node()
References: <20230724103324.4207-1-jgross@suse.com>
 <20230724103324.4207-3-jgross@suse.com>
 <5aaf37aa-cb7d-59e5-5e0b-40fa73177d35@suse.com>
 <a937b261-d42d-888f-7460-ed431b725c45@suse.com>
 <b82f46ab-d91c-c4cf-faa1-8a78d120fb73@suse.com>
In-Reply-To: <b82f46ab-d91c-c4cf-faa1-8a78d120fb73@suse.com>

--------------vEj2nenpQEgjPku105qIaLnc
Content-Type: multipart/mixed; boundary="------------8noQYMSZeSBgEQGpPe9oSvND"

--------------8noQYMSZeSBgEQGpPe9oSvND
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDguMjMgMTE6NTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNy4wNy4yMDIz
IDA5OjU1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjcuMDcuMjMgMDk6NTMsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI0LjA3LjIwMjMgMTI6MzMsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IEluIGNhc2UgZ2V0X3NwZWNfbm9kZSgpIGlzIGJlaW5nIGNhbGxl
ZCBmb3IgYSBzcGVjaWFsIG5vZGUgc3RhcnRpbmcNCj4+Pj4gd2l0aCAnQCcgaXQgd29uJ3Qg
c2V0ICpjYW5vbmljYWxfbmFtZS4gVGhpcyBjYW4gcmVzdWx0IGluIGEgY3Jhc2ggb2YNCj4+
Pj4geGVuc3RvcmVkIGR1ZSB0byBkZXJlZmVyZW5jaW5nIHRoZSB1bmluaXRpYWxpemVkIG5h
bWUgaW4NCj4+Pj4gZmlyZV93YXRjaGVzKCkuDQo+Pj4+DQo+Pj4+IFRoaXMgaXMgbm8gc2Vj
dXJpdHkgaXNzdWUgYXMgaXQgcmVxdWlyZXMgZWl0aGVyIGEgcHJpdmlsZWdlZCBjYWxsZXIg
b3INCj4+Pj4gb3duZXJzaGlwIG9mIHRoZSBzcGVjaWFsIG5vZGUgaW4gcXVlc3Rpb24gYnkg
YW4gdW5wcml2aWxlZ2VkIGNhbGxlcg0KPj4+PiAod2hpY2ggaXMgcXVlc3Rpb25hYmxlLCBh
cyB0aGlzIHdvdWxkIG1ha2UgdGhlIG93bmVyIHByaXZpbGVnZWQgaW4gc29tZQ0KPj4+PiB3
YXkpLg0KPj4+Pg0KPj4+PiBGaXhlczogZDZiYjYzOTI0ZmMyICgidG9vbHMveGVuc3RvcmU6
IGludHJvZHVjZSBkdW1teSBub2RlcyBmb3Igc3BlY2lhbCB3YXRjaCBwYXRocyIpDQo+Pj4+
IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+Pj4g
UmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+Pj4NCj4+
PiBJJ3ZlIGNvbW1pdHRlZCB0aGUgdHdvIHBhdGNoZXMsIGFuZCBJJ3ZlIHF1ZXVlZCB0aGlz
IG9uZSBmb3IgYmFja3BvcnRpbmcuDQo+Pg0KPj4gVGhhbmtzLg0KPj4NCj4+PiBDYW4gYXQg
bGVhc3Qgb25lIG9mIHlvdSBwbGVhc2UgY29uZmlybSB0aGF0IHRoZSBlYXJsaWVyIHBhdGNo
IGlzIG5vdA0KPj4+IGludGVuZGVkIHRvIGJlIGJhY2twb3J0ZWQsIGFuZCB0aGF0IGluc3Rl
YWQgYSBjYXN0IHdpbGwgbmVlZCBhZGRpbmcgaW4NCj4+PiB0aGUgYmFja3BvcnQgb2YgdGhl
IG9uZSBoZXJlPw0KPj4NCj4+IFllcywgdGhhdCB3YXMgdGhlIHBsYW4uDQo+IA0KPiBIbW0s
IGxvb2tzIGxpa2UgdGhlIG9mZmVuZGluZyBwYXRjaCBleGlzdHMgb25seSBvbiB0aGUgbWFz
dGVyIGJyYW5jaC4NCg0KT2gsIGluZGVlZC4gSXQgc2VlbWVkIHRvIGJlIHNvIGxvbmcgYWdv
IHRoYXQgSSBjaGFuZ2VkIHRoaXMgLi4uDQoNCg0KSnVlcmdlbg0K
--------------8noQYMSZeSBgEQGpPe9oSvND
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------8noQYMSZeSBgEQGpPe9oSvND--

--------------vEj2nenpQEgjPku105qIaLnc--

--------------RYAYTMBsjGHju0T6r5kKyxqG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTLf7AFAwAAAAAACgkQsN6d1ii/Ey+y
/wf/Vi+zGDyf8XONEfpwO5juD9g6AHJFjbE4Ts6T/FWYq0lYwVuCyYtOAjQKdXhMvN5K9IQlPuD3
kE8eqD+ujlQS7cRGxMrgNLYBgQ1lbGpah3GoLYTedmMj+QabmmNPjr8oY/s33zK2VQgCgzbwI466
JtTGBpGzb5PAvKUWXWfKIh5heQa1LEYfVxDjkUtFXojgB3jdtU1f8TzF1TjSjmd2Ooq7OHUPNff5
zmIZZpLp6U5bjm5+2SFMzl1Y8054IlmB5yRkv2IBxlQBQ1F8t+QAd2ghQPJYTRU+D0lWpB28zBsx
UGmIv1dxMs5Fmku06X29PTNGorQqqxOo0ZZSAATy0A==
=9g84
-----END PGP SIGNATURE-----

--------------RYAYTMBsjGHju0T6r5kKyxqG--

