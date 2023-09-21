Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ED87A947C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 15:04:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606427.944326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjJKp-0001Pv-JM; Thu, 21 Sep 2023 13:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606427.944326; Thu, 21 Sep 2023 13:03:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjJKp-0001Ms-G7; Thu, 21 Sep 2023 13:03:11 +0000
Received: by outflank-mailman (input) for mailman id 606427;
 Thu, 21 Sep 2023 13:03:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UECe=FF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qjJKo-0001Mm-3e
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 13:03:10 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35c8fc4b-587f-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 15:03:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A89341F37C;
 Thu, 21 Sep 2023 13:03:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 68A36134B0;
 Thu, 21 Sep 2023 13:03:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id V4taGAs/DGX7KwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 21 Sep 2023 13:03:07 +0000
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
X-Inumbo-ID: 35c8fc4b-587f-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1695301387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5wPes3WFjwB8hbN4DT/6xAg/60Wobb6sl2oFbPH7Rs8=;
	b=N+K8Eta/DLC6q31ZV793O7j8P/+uYaiftuMfg7lPRtTo0mhmVfNKRqv7HtxGuy2DkalHFw
	CLZ57JnCaXGVJedCFDNJIUIK2IKfSxJpgdhc/MKf25HCbiq65Ztf1wxQvURToSXpbZe5JR
	/L0Vbr6wu0EI8tMDgRrVZMetqWpyYWY=
Message-ID: <06de9352-fa8e-4727-b3ab-93adcfc066de@suse.com>
Date: Thu, 21 Sep 2023 15:03:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] credit: Limit load balancing to once per
 millisecond
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
Cc: Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20230921122352.2307574-1-george.dunlap@cloud.com>
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
In-Reply-To: <20230921122352.2307574-1-george.dunlap@cloud.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------s2SuwTSbGZbcZK615QeImcw6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------s2SuwTSbGZbcZK615QeImcw6
Content-Type: multipart/mixed; boundary="------------ixmco0aWLsc2A02yL7yXNJV1";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
Cc: Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Message-ID: <06de9352-fa8e-4727-b3ab-93adcfc066de@suse.com>
Subject: Re: [PATCH v2 1/2] credit: Limit load balancing to once per
 millisecond
References: <20230921122352.2307574-1-george.dunlap@cloud.com>
In-Reply-To: <20230921122352.2307574-1-george.dunlap@cloud.com>

--------------ixmco0aWLsc2A02yL7yXNJV1
Content-Type: multipart/mixed; boundary="------------pjhagsKMRPuSNb0iNkCvQkvh"

--------------pjhagsKMRPuSNb0iNkCvQkvh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDkuMjMgMTQ6MjMsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IFRoZSBjcmVkaXQg
c2NoZWR1bGVyIHRyaWVzIGFzIGhhcmQgYXMgaXQgY2FuIHRvIGVuc3VyZSB0aGF0IGl0IGFs
d2F5cw0KPiBydW5zIHNjaGVkdWxpbmcgdW5pdHMgd2l0aCBwb3NpdGl2ZSBjcmVkaXQgKFBS
SV9UU19VTkRFUikgYmVmb3JlDQo+IHJ1bm5pbmcgdGhvc2Ugd2l0aCBuZWdhdGl2ZSBjcmVk
aXQgKFBSSV9UU19PVkVSKS4gIElmIHRoZSBuZXh0DQo+IHJ1bm5hYmxlIHNjaGVkdWxpbmcg
dW5pdCBpcyBvZiBwcmlvcml0eSBPVkVSLCBpdCB3aWxsIGFsd2F5cyBydW4gdGhlDQo+IGxv
YWQgYmFsYW5jZXIsIHdoaWNoIHdpbGwgc2NvdXIgdGhlIHN5c3RlbSBsb29raW5nIGZvciBh
bm90aGVyDQo+IHNjaGVkdWxpbmcgdW5pdCBvZiB0aGUgVU5ERVIgcHJpb3JpdHkuDQo+IA0K
PiBVbmZvcnR1bmF0ZWx5LCBhcyB0aGUgbnVtYmVyIG9mIGNvcmVzIG9uIGEgc3lzdGVtIGhh
cyBncm93biwgdGhlIGNvc3QNCj4gb2YgdGhlIHdvcmstc3RlYWxpbmcgYWxnb3JpdGhtIGhh
cyBkcmFtYXRpY2FsbHkgaW5jcmVhc2VkOyBhIHJlY2VudA0KPiB0cmFjZSBvbiBhIHN5c3Rl
bSB3aXRoIDEyOCBjb3JlcyBzaG93ZWQgdGhpcyB0YWtpbmcgb3ZlciA1MA0KPiBtaWNyb3Nl
Y29uZHMuDQo+IA0KPiBBZGQgYSBwYXJhbWV0ZXIsIGxvYWRfYmFsYW5jZV9yYXRlbGltaXQs
IHRvIGxpbWl0IHRoZSBmcmVxdWVuY3kgb2YNCj4gbG9hZCBiYWxhbmNlIG9wZXJhdGlvbnMg
b24gYSBnaXZlbiBwY3B1LiAgRGVmYXVsdCB0aGlzIHRvIDENCj4gbWlsbGlzZWNvbmQuDQo+
IA0KPiBJbnZlcnQgdGhlIGxvYWQgYmFsYW5jaW5nIGNvbmRpdGlvbmFsIHRvIG1ha2UgaXQg
bW9yZSBjbGVhciwgYW5kIGxpbmUNCj4gdXAgbW9yZSBjbG9zZWx5IHdpdGggdGhlIGNvbW1l
bnQgYWJvdmUgaXQuDQo+IA0KPiBPdmVyYWxsIGl0IG1pZ2h0IGJlIGNsZWFuZXIgdG8gaGF2
ZSB0aGUgbGFzdF9sb2FkX2JhbGFuY2UgY2hlY2tpbmcNCj4gaGFwcGVuIGluc2lkZSBjc2No
ZWRfbG9hZF9iYWxhbmNlKCksIGJ1dCB0aGF0IHdvdWxkIHJlcXVpcmUgZWl0aGVyDQo+IHBh
c3NpbmcgYm90aCBub3cgYW5kIHNwYyBpbnRvIHRoZSBmdW5jdGlvbiwgb3IgbG9va2luZyB0
aGVtIHVwIGFnYWluOw0KPiBib3RoIG9mIHdoaWNoIHNlZW1lZCB0byBiZSB3b3JzZSB0aGFu
IHNpbXBseSBjaGVja2luZyBhbmQgc2V0dGluZyB0aGUNCj4gdmFsdWVzIGJlZm9yZSBjYWxs
aW5nIGl0Lg0KPiANCj4gT24gYSBzeXN0ZW0gd2l0aCBhIHZjcHU6cGNwdSByYXRpbyBvZiAy
OjEsIHJ1bm5pbmcgV2luZG93cyBndWVzdHMNCj4gKHdoaWNoIHdpbGwgZW5kIHVwIGNhbGxp
bmcgWUlFTEQgZHVyaW5nIHNwaW5sb2NrIGNvbnRlbnRpb24pLCB0aGlzDQo+IHBhdGNoIGlu
Y3JlYXNlZCBwZXJmb3JtYW5jZSBzaWduaWZpY2FudGx5Lg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjbG91ZC5jb20+DQoNClJldmlld2Vk
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0KDQo=

--------------pjhagsKMRPuSNb0iNkCvQkvh
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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------pjhagsKMRPuSNb0iNkCvQkvh--

--------------ixmco0aWLsc2A02yL7yXNJV1--

--------------s2SuwTSbGZbcZK615QeImcw6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmUMPwoFAwAAAAAACgkQsN6d1ii/Ey8+
Hwf+OCeCChT9S7MQUxl1ciY/UxlqQH8K7dghn2sumAwQsqMbUagxllcxUuPAxWYE7ifNuArCrfR6
QW+IuHqlAD0zq5eVNDAE1ReFFp0urTyQIlbGKXzFuddZnji7GSHkmn+EVj6xHs//PdEN/rg4Xmtb
zKwMI4dTIWlGRc6jJTLZbJt4EylE2MeHwT+IZ8Xv2nrHmRJGKypqERNZA2arPWTXF41ZWp63phMH
3Thl6LXbUI9y1YW5u4JM3X3EnkUuuXdkXROUOiREMFENGLOjfwwzlGd02tbCrxqnirmER0cZJ70q
hnIngiQ0LJKdEkxr6CpmJOY7e6giEGfy9DyM+Plk5w==
=IBLr
-----END PGP SIGNATURE-----

--------------s2SuwTSbGZbcZK615QeImcw6--

