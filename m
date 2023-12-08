Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B457A80A803
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 16:59:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650706.1016444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBdFg-0007SI-MY; Fri, 08 Dec 2023 15:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650706.1016444; Fri, 08 Dec 2023 15:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBdFg-0007Pk-JU; Fri, 08 Dec 2023 15:58:56 +0000
Received: by outflank-mailman (input) for mailman id 650706;
 Fri, 08 Dec 2023 15:58:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T8s0=HT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rBdFf-0007Pe-9o
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 15:58:55 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af85b6ce-95e2-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 16:58:53 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ED2EE1F454;
 Fri,  8 Dec 2023 15:58:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C34C813335;
 Fri,  8 Dec 2023 15:58:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id X5dbLjw9c2UiBAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 08 Dec 2023 15:58:52 +0000
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
X-Inumbo-ID: af85b6ce-95e2-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702051133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=taXJaQGc4vSI2qzWANpdVWbP5Wh/Jb1T634B3lhlZGY=;
	b=scybEx5lQ2B9kGxFpt4aG+JVzOXkyFoWfhJygCmH1avhL/bRI/BswyYgl8zGmsFQAlGSu3
	kIO7hAOXlx88rkwivPcDsEOkOo/XwiNfH8tt7670gzGN1sCqbj1DzcvEg2Ffv02aDmVL/1
	afnc7gfcAwoMqwSgjtJaFmFElmlNc3I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702051132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=taXJaQGc4vSI2qzWANpdVWbP5Wh/Jb1T634B3lhlZGY=;
	b=Qq5i2QHBqOrGd1GW2gbN7ws2XrXBiXSGzW1+xcgeKuLOwY5I/2SDPfJ5mmA+n680C6EIcO
	SmFtfygj3SvwzLOZ0TZLDhatitDuymVabeKVSlY52v7E3Wy+2qO4+S8eBWazBj2Ko2du3h
	2TbmGurNeac8xs8Sypo91sfg8KbverA=
Message-ID: <4add391b-cee8-4af3-be1f-56078e33e32d@suse.com>
Date: Fri, 8 Dec 2023 16:58:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] tools/xenstored: remove "-N" command line option
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20231121114048.31294-1-jgross@suse.com>
 <20231121114048.31294-6-jgross@suse.com>
 <fe647c65-1092-4a25-9af1-3528ac69f682@citrix.com>
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <fe647c65-1092-4a25-9af1-3528ac69f682@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lZRjSehrkeAQ7oL20F0C1fqK"
X-Spam-Level: ******************
X-Spam-Score: 18.14
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.79 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(5.10)[100.00%];
	 XM_UA_NO_VERSION(0.01)[];
	 TO_DN_SOME(0.00)[];
	 DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	 HAS_ATTACHMENT(0.00)[];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MIME_BASE64_TEXT(0.10)[];
	 DMARC_POLICY_ALLOW(0.00)[suse.com,quarantine];
	 MX_GOOD(-0.01)[];
	 DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	 SIGNED_PGP(-2.00)[];
	 NEURAL_HAM_SHORT(-0.19)[-0.972];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(0.00)[-all];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 WHITELIST_DMARC(-7.00)[suse.com:D:+];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1
X-Spam-Level: 
X-Rspamd-Queue-Id: ED2EE1F454
X-Spam-Score: -3.79
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Qq5i2QHB;
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com;
	dmarc=pass (policy=quarantine) header.from=suse.com

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lZRjSehrkeAQ7oL20F0C1fqK
Content-Type: multipart/mixed; boundary="------------eyALZId7EBlYqyMqwbm3cSH6";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <4add391b-cee8-4af3-be1f-56078e33e32d@suse.com>
Subject: Re: [PATCH v2 5/5] tools/xenstored: remove "-N" command line option
References: <20231121114048.31294-1-jgross@suse.com>
 <20231121114048.31294-6-jgross@suse.com>
 <fe647c65-1092-4a25-9af1-3528ac69f682@citrix.com>
In-Reply-To: <fe647c65-1092-4a25-9af1-3528ac69f682@citrix.com>

--------------eyALZId7EBlYqyMqwbm3cSH6
Content-Type: multipart/mixed; boundary="------------VF8A0re08FUnCAHtkJZXnlId"

--------------VF8A0re08FUnCAHtkJZXnlId
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMTIuMjMgMTY6NDYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDIxLzExLzIw
MjMgMTE6NDAgYW0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBUaGUgIi1OIiAoZG8gbm90
IGRhZW1vbml6ZSkgY29tbWFuZCBsaW5lIG9wdGlvbiBpcyBvZiBxdWVzdGlvbmFibGUgdXNl
Og0KPj4gaXRzIHNvbGUgcHVycG9zZSBzZWVtcyB0byBiZSB0byBhaWQgZGVidWdnaW5nIG9m
IHhlbnN0b3JlZCBieSBtYWtpbmcgaXQNCj4+IGVhc2llciB0byBzdGFydCB4ZW5zdG9yZWQg
dW5kZXIgZ2RiLCBvciB0byBzZWUgYW55IGRlYnVnIG1lc3NhZ2VzDQo+PiBlYXNpbHkuDQo+
Pg0KPj4gRGVidWcgbWVzc2FnZXMgY2FuIGFzIHdlbGwgYmUgc2VudCB0byBzeXNsb2coKSwg
d2hpbGUgZ2RiIGNhbiBiZQ0KPj4gYXR0YWNoZWQgdG8gdGhlIGRhZW1vbiBlYXNpbHkuIFRo
ZSBvbmx5IG5vdCBjb3ZlcmVkIGNhc2UgaXMgYW4gZXJyb3INCj4+IHdoaWxlIGluaXRpYWxp
emluZyB4ZW5zdG9yZWQsIGJ1dCB0aGlzIGNvdWxkIGJlIGhhbmRsZWQgZS5nLiBieSBzYXZp
bmcNCj4+IGEgY29yZSBkdW1wLCB3aGljaCBjYW4gYmUgYW5hbHl6ZWQgbGF0ZXIuDQo+Pg0K
Pj4gVGhlIGNhbGwgb2YgdGFsbG9jX2VuYWJsZV9sZWFrX3JlcG9ydF9mdWxsKCkgZG9uZSBv
bmx5IHdpdGggIi1OIg0KPj4gc3BlY2lmaWVkIGlzIG5vIGxvbmdlciBuZWVkZWQsIGFzIHRo
ZSBzYW1lIGNhbiBiZSBhY2hpZXZlZCB2aWENCj4+ICJ4ZW5zdG9yZS1jb250cm9sIG1lbXJl
cG9ydCIuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPg0KPiANCj4gU3lzdGVtZCB3YW50cyBkYWVtb25zIHRvIG5vdCBmb3JrLCBiZWNh
dXNlIHN5c3RlbWQgY2FuIHN0YXJ0IHRoZW0gdXAgaW4NCj4gYSBiZXR0ZXItcHJlc2NyaWJl
ZCBlbnZpcm9ubWVudCB0aGFuIGRlYW1vbmlzZSgpIGNhbiBtYWtlLg0KPiANCj4gSXQgd2Fz
IGEgbGF6eSBwb3J0IHRvIHN5c3RlbSB3aGljaCBoYXMgY2F1c2VkIHVzIG5vdCB0byBiZSB1
c2luZyAtTiBpbg0KPiB0aGUgZmlyc3QgcGxhY2UuDQo+IA0KPiBTbyBubyAtIEkgdGhpbmsg
dGhpcyBvcHRpb24gc3BlY2lmaWNhbGx5IHdhbnRzIHRvIHN0YXksIGFuZCB0aGUgc3lzdGVt
ZA0KPiBpbnRlZ3JhdGlvbiBpbXByb3ZlZC4NCg0KVGhlIHByb2JsZW0gd2l0aCB0aGlzIGFw
cHJvYWNoIGlzIHRoYXQgd2UgaGF2ZSBzb21lIGZ1bmN0aW9uYWxpdHkgaW4gdGhlDQpsYXVu
Y2gteGVuc3RvcmUgc2NyaXB0IHJlbHlpbmcgb24gW29deGVuc3RvcmVkIGNvbWluZyBiYWNr
IGFmdGVyIGhhdmluZw0KZm9ya2VkIG9mZiB0aGUgZGFlbW9uOiB3ZSBhcmUgc2V0dGluZyB0
aGUgb29tLXNjb3JlLCB3aGljaCBjYW4gYmUgZG9uZQ0Kb25seSB3aGVuIGtub3dpbmcgdGhl
IHByb2Nlc3MgaWQuDQoNClNvIHdlIG5lZWQgYSBzb2x1dGlvbiBmb3IgdGhpcyBwcm9ibGVt
IGJlZm9yZSB3ZSBjYW4gcmVhbGx5IGVuY291cmFnZQ0KdXNlcnMgdG8gdXNlIHRoZSAtTiBv
cHRpb24uDQoNClBsZWFzZSBub3RlIHRoYXQgc2V0dGluZyB0aGUgb29tLXNjb3JlIGZyb20g
d2l0aGluIHhlbnN0b3JlZCB3YXMgcmVqZWN0ZWQNCmJhY2sgd2hlbiBJIHBvc3RlZCBhIHBh
dGNoIGluIHRoaXMgcmVnYXJkLCBlc3BlY2lhbGx5IGFzIGl0IGlzIHNwZWNpZmljIHRvDQpM
aW51eC4gQWRkaXRpb25hbGx5IHRoaXMgd291bGQgbWVhbiB3ZSBuZWVkIHRvIGFkZCB0aGlz
IGZ1bmN0aW9uYWxpdHkgdG8NCnhlbnN0b3JlZCBBTkQgb3hlbnN0b3JlZC4NCg0KDQpKdWVy
Z2VuDQo=
--------------VF8A0re08FUnCAHtkJZXnlId
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------VF8A0re08FUnCAHtkJZXnlId--

--------------eyALZId7EBlYqyMqwbm3cSH6--

--------------lZRjSehrkeAQ7oL20F0C1fqK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVzPTwFAwAAAAAACgkQsN6d1ii/Ey8U
Ewf9FiHNFJWyH4zte75yZ3L6SsOkmhAOkTE29X78wwGJdNxdodtMytZhPs3z45M7tqV5CpRa2JVW
+aS5dfZBlk3XHvA+AMW0ZF9EhuSCHN0x10kmPTkkA5HXY5XAbDjc5fXfZmMf8RqPTxumiAQCLUrT
qMI7i5p0ThQTqasuEDTZXF8+ixuGbYnZZwFb2p1/HSbuXiOVNYPbv50mWPqKphQMrzJqR0hOB9wD
GQ/xlpbd7zLs/Uifi1KBOXO2gza6huV3YqLaJSstUzdeJVAemScT4kZGlKBEnm5ecu5q4w45DTVf
W/Y7pxZUBh7VPHb1sPRTW7kp8E6AnNQBAP3WCt26tg==
=x9W4
-----END PGP SIGNATURE-----

--------------lZRjSehrkeAQ7oL20F0C1fqK--

