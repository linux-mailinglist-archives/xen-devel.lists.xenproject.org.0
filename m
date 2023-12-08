Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC1B80A81A
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 17:04:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650736.1016513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBdL8-0004aD-U7; Fri, 08 Dec 2023 16:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650736.1016513; Fri, 08 Dec 2023 16:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBdL8-0004YU-Qy; Fri, 08 Dec 2023 16:04:34 +0000
Received: by outflank-mailman (input) for mailman id 650736;
 Fri, 08 Dec 2023 16:04:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T8s0=HT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rBdL7-0004YH-AJ
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 16:04:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78a3e816-95e3-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 17:04:31 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6A93621C85;
 Fri,  8 Dec 2023 16:04:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4F5C513335;
 Fri,  8 Dec 2023 16:04:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uspkEY4+c2XABQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 08 Dec 2023 16:04:30 +0000
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
X-Inumbo-ID: 78a3e816-95e3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702051470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=d6HvQdxCqcYProiLvIK0Ob2qIKKqMENDogB7txp9m6Q=;
	b=OnRAj1kXFMT1Vmq9fZrKHl8g/dXuu1Lvsq1a6mpuLP8EpuwTafnvxfuxKJpfcoEAoW4yjP
	xHM0919wIWYXOr0NYA1KT1Y8LCyUBzg/J/4HXcmkKKC+r0F6YfOJ67obtYFlJDtmShP9ik
	ZG0kLihxlstkbx2GxZrN3QF6Oogtgwo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702051470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=d6HvQdxCqcYProiLvIK0Ob2qIKKqMENDogB7txp9m6Q=;
	b=OnRAj1kXFMT1Vmq9fZrKHl8g/dXuu1Lvsq1a6mpuLP8EpuwTafnvxfuxKJpfcoEAoW4yjP
	xHM0919wIWYXOr0NYA1KT1Y8LCyUBzg/J/4HXcmkKKC+r0F6YfOJ67obtYFlJDtmShP9ik
	ZG0kLihxlstkbx2GxZrN3QF6Oogtgwo=
Message-ID: <613a6a35-80e2-4020-98b8-3fa3ff9074f7@suse.com>
Date: Fri, 8 Dec 2023 17:04:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] OSStest: use CONFIG_X86_GENERIC for 32-bit x86 kernel
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20231207080953.27976-1-jgross@suse.com>
 <f681f49e-a9cd-45b8-bba1-527f108c44e4@perard>
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
In-Reply-To: <f681f49e-a9cd-45b8-bba1-527f108c44e4@perard>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DGtNXM0bNlCijcahtGKURl3V"
X-Spam-Level: ******************
X-Spam-Score: 18.32
X-Spam-Flag: NO
X-Spamd-Result: default: False [-8.89 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 TO_DN_SOME(0.00)[];
	 DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	 HAS_ATTACHMENT(0.00)[];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_TWO(0.00)[2];
	 MX_GOOD(-0.01)[];
	 DMARC_POLICY_ALLOW(0.00)[suse.com,quarantine];
	 SIGNED_PGP(-2.00)[];
	 NEURAL_HAM_SHORT(-0.19)[-0.963];
	 DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
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
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1
X-Spam-Level: 
X-Rspamd-Queue-Id: 6A93621C85
X-Spam-Score: -8.89
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=OnRAj1kX;
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com;
	dmarc=pass (policy=quarantine) header.from=suse.com

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DGtNXM0bNlCijcahtGKURl3V
Content-Type: multipart/mixed; boundary="------------sCU2OO74rA9Sez0rn145LwfL";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org
Message-ID: <613a6a35-80e2-4020-98b8-3fa3ff9074f7@suse.com>
Subject: Re: [PATCH] OSStest: use CONFIG_X86_GENERIC for 32-bit x86 kernel
References: <20231207080953.27976-1-jgross@suse.com>
 <f681f49e-a9cd-45b8-bba1-527f108c44e4@perard>
In-Reply-To: <f681f49e-a9cd-45b8-bba1-527f108c44e4@perard>

--------------sCU2OO74rA9Sez0rn145LwfL
Content-Type: multipart/mixed; boundary="------------MJsyf0CR80lMF8DEbU7Ic68n"

--------------MJsyf0CR80lMF8DEbU7Ic68n
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMTIuMjMgMTY6NTksIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUaHUsIERl
YyAwNywgMjAyMyBhdCAwOTowOTo1M0FNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gVG9kYXkgdGhlIGNwdSB0eXBlIGZvciBhIDMyLWJpdCB4ODYga2VybmVsIGlzIG5vdCBz
cGVjaWZpZWQgaW4gdGhlDQo+PiB1c2VkIGtlcm5lbCBjb25maWcsIHJlc3VsdGluZyBpbiB0
aGUgTTY4NiB0byBiZSB1c2VkLg0KPj4NCj4+IEluc3RlYWQgb2YgdXNpbmcgdGhlIE02ODYg
d2hpY2ggaXNuJ3QgZXZlbiBhIDY0LWJpdCBjcHUgKHRodXMgbm90DQo+PiBjYXBhYmxlIHRv
IHJ1biBhIFhlbiBndWVzdCksIHVzZSB0aGUgWDg2X0dFTkVSSUMgdmFyaWFudCB3aGljaCBp
cw0KPj4gbW9yZSBhcHByb3ByaWF0ZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+ICAgdHMta2VybmVsLWJ1aWxk
IHwgNSArKysrLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3RzLWtlcm5lbC1idWlsZCBiL3RzLWtl
cm5lbC1idWlsZA0KPj4gaW5kZXggNzE5YjMzYWEuLmQ5ZTAzM2M0IDEwMDc1NQ0KPj4gLS0t
IGEvdHMta2VybmVsLWJ1aWxkDQo+PiArKysgYi90cy1rZXJuZWwtYnVpbGQNCj4+IEBAIC02
MDgsNyArNjA4LDEwIEBAIHNldG9wdCBDT05GSUdfUE9XRVJfUkVTRVRfWEdFTkUgeQ0KPj4g
ICBzZXRvcHQgQ09ORklHX1JUQ19EUlZfWEdFTkUgeQ0KPj4gICANCj4+ICAgY2FzZSAke1hF
Tl9UQVJHRVRfQVJDSH0gaW4NCj4+IC0gICAgeDg2XzMyKSBzZXRvcHQgQ09ORklHXzY0QklU
IG4gOzsNCj4+ICsgICAgeDg2XzMyKQ0KPj4gKwlzZXRvcHQgQ09ORklHXzY0QklUIG4NCj4+
ICsJc2V0b3B0IENPTkZJR19YODZfR0VORVJJQyB5DQo+IA0KPiBJdCB3b3VsZCBiZSBuaWNl
IGlmIHRoYXQgd2FzIHdvcmtpbmcsIGJ1dCBYRU5fVEFSR0VUX0FSQ0ggaXMgbmV2ZXIgc2V0
LA0KPiBzbyB0aGUgY2hhbmdlIGlzbid0IGdvaW5nIHRvIHdvcmsuDQo+IA0KPiBJJ20gcHJl
cGFyaW5nIHBhdGNoZXMgdG8gc2V0IFg4Nl9HRU5FUklDIG9uIGkzODYgYnVpbGRzLCBhbmQg
Zml4aW5nIHNvbWUNCj4gaXNzdWVzLg0KDQpPaCwgQlRXLCBJIHRoaW5rIGl0IG1pZ2h0IGJl
IGEgZ29vZCBpZGVhIHRvIGFkZCBhIE1BSU5UQUlORVJTIGVudHJ5IGluIHRoZQ0KWGVuIGdp
dCB0cmVlIGZvciBPU1N0ZXN0LiBJIHdhcyBwcmV0dHkgc3VyZSB5b3UgYXJlIHRoZSBvbmUg
dG8gc2VuZCBwYXRjaGVzDQp0bywgYnV0IG1heWJlIHNvbWVvbmUgZWxzZSBzaG91bGQgcmVj
ZWl2ZSB0aGVtPw0KDQoNCkp1ZXJnZW4NCg==
--------------MJsyf0CR80lMF8DEbU7Ic68n
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------MJsyf0CR80lMF8DEbU7Ic68n--

--------------sCU2OO74rA9Sez0rn145LwfL--

--------------DGtNXM0bNlCijcahtGKURl3V
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVzPo0FAwAAAAAACgkQsN6d1ii/Ey8p
UQgAhFbwLrcG6ld0jk5ex+yeKNuG3kQVkUrk7NU4gF+VulVhOnuJFuMFVDk5Il2vj33bchoM6E/Q
G/76ZgKtAXYRdPRFDVb/NMyC8dpd7/Y7vBDxpbKMXS+Y4AaorSgNvLAF81Qjl58iPQoS5Q72gwuH
U5nEzZ4xu7q4VaDedVu+pM355dUsQJU060NNfgmkKGsIXPwenF72SbRs6fx6h5oF2nrwi+dsjZFa
Uuosj5ljEv86807DOOFY2wL0TnlNb9e+Wcf+Jg13QY7xHPWzgOoHLsFcQUDEPJNpH4fZgMXDzdu0
kZ0Rgv9j768nWrYhHCYOqVh7gnbPK7SJ54IrJr8gxg==
=SOeN
-----END PGP SIGNATURE-----

--------------DGtNXM0bNlCijcahtGKURl3V--

