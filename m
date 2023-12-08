Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE9F80A809
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 17:01:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650711.1016464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBdHn-0001l9-9z; Fri, 08 Dec 2023 16:01:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650711.1016464; Fri, 08 Dec 2023 16:01:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBdHn-0001iQ-6U; Fri, 08 Dec 2023 16:01:07 +0000
Received: by outflank-mailman (input) for mailman id 650711;
 Fri, 08 Dec 2023 16:01:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T8s0=HT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rBdHl-0001iK-7r
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 16:01:05 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd5d99b5-95e2-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 17:01:04 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E3FCA21C86;
 Fri,  8 Dec 2023 16:01:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C8E1813335;
 Fri,  8 Dec 2023 16:01:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id T3WHL789c2XSBAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 08 Dec 2023 16:01:03 +0000
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
X-Inumbo-ID: fd5d99b5-95e2-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702051263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CZ+jGJrLHr0bDYqcpGKcdnv4w5HMpd6emuDtpLdDAHg=;
	b=HD5fRN0o1hc+v+pa6YvamGLVbH0VnVfFhVWAJoa/p24CoRA8d/n1So8cjHdAMMTbadZTnw
	Cfd28RSQfULli5XtNbL7zvsfydJ9MKKOYNGirbIVFFJxYz87AqA+DpH6JNggrUk3giKMr/
	rEmA7Nm7Hw92HegBSQ7hqEUb3FD+q0k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702051263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CZ+jGJrLHr0bDYqcpGKcdnv4w5HMpd6emuDtpLdDAHg=;
	b=HD5fRN0o1hc+v+pa6YvamGLVbH0VnVfFhVWAJoa/p24CoRA8d/n1So8cjHdAMMTbadZTnw
	Cfd28RSQfULli5XtNbL7zvsfydJ9MKKOYNGirbIVFFJxYz87AqA+DpH6JNggrUk3giKMr/
	rEmA7Nm7Hw92HegBSQ7hqEUb3FD+q0k=
Message-ID: <2f8eda22-d4cd-463f-9a9c-8efaf6843dfb@suse.com>
Date: Fri, 8 Dec 2023 17:01:03 +0100
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
 boundary="------------N20y1KnNYbQ2oyoyLuGOonwm"
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -4.17
X-Spamd-Result: default: False [-4.17 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.18)[-0.922];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_TWO(0.00)[2];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -4.17
Authentication-Results: smtp-out1.suse.de;
	none

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------N20y1KnNYbQ2oyoyLuGOonwm
Content-Type: multipart/mixed; boundary="------------0hFK000BAMETCVlTXY96xHPZ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org
Message-ID: <2f8eda22-d4cd-463f-9a9c-8efaf6843dfb@suse.com>
Subject: Re: [PATCH] OSStest: use CONFIG_X86_GENERIC for 32-bit x86 kernel
References: <20231207080953.27976-1-jgross@suse.com>
 <f681f49e-a9cd-45b8-bba1-527f108c44e4@perard>
In-Reply-To: <f681f49e-a9cd-45b8-bba1-527f108c44e4@perard>

--------------0hFK000BAMETCVlTXY96xHPZ
Content-Type: multipart/mixed; boundary="------------Qoq0CSjvu74VR9mxVpwfk4h7"

--------------Qoq0CSjvu74VR9mxVpwfk4h7
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
LA0KPiBzbyB0aGUgY2hhbmdlIGlzbid0IGdvaW5nIHRvIHdvcmsuDQoNCk9oLCBob3cgLi4u
IGZ1bm55PyB3ZWlyZD8gc3RyYW5nZT8NCg0KPiANCj4gSSdtIHByZXBhcmluZyBwYXRjaGVz
IHRvIHNldCBYODZfR0VORVJJQyBvbiBpMzg2IGJ1aWxkcywgYW5kIGZpeGluZyBzb21lDQo+
IGlzc3Vlcy4NCg0KVGhhbmtzLA0KDQoNCkp1ZXJnZW4NCg0K
--------------Qoq0CSjvu74VR9mxVpwfk4h7
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Qoq0CSjvu74VR9mxVpwfk4h7--

--------------0hFK000BAMETCVlTXY96xHPZ--

--------------N20y1KnNYbQ2oyoyLuGOonwm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVzPb8FAwAAAAAACgkQsN6d1ii/Ey9e
GAgAk5/0rkveZy0yr6/NMxckQMfoaHMZslhLqsHDrsU3Ue7x7R5+FexK0rqDev7pter9OnBycBS+
vaBZJPWx6OWpsqMXLdW76OyfiQTXsxzY7BG7BWup0BcnizlIB5Gt/nKzVe0LWUUkOVTVbw9f4Du6
Z3m/m9Yte/6/+ygzqmCjvzA53KVA3ebPl1J+h8GfO9iOH2O5TDJpBqPpeleI+ouPTEHVUIs3Y/q+
OGw6UI/ivGv+ib4poHJyEyIJHx6Pj8StoA9hSMYyooHFUWgdKHXZWBk9PWaQzK7kdj+aRjx/G0W3
QsAMzYSq9TmBGgrxQptuOko+pSMu8285A6+YiByciA==
=uVYh
-----END PGP SIGNATURE-----

--------------N20y1KnNYbQ2oyoyLuGOonwm--

