Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 071D6B084BD
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 08:20:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046141.1416368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucHyM-0008BK-IR; Thu, 17 Jul 2025 06:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046141.1416368; Thu, 17 Jul 2025 06:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucHyM-00087T-Ey; Thu, 17 Jul 2025 06:20:02 +0000
Received: by outflank-mailman (input) for mailman id 1046141;
 Thu, 17 Jul 2025 06:20:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XrhN=Z6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ucHyK-0007z0-K9
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 06:20:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e538896-62d6-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 08:19:55 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 528C01F7D0;
 Thu, 17 Jul 2025 06:19:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C8BB13A75;
 Thu, 17 Jul 2025 06:19:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EzwVAQmWeGitGwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 17 Jul 2025 06:19:53 +0000
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
X-Inumbo-ID: 0e538896-62d6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752733194; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0OF3s5CHOWEeck6Z4OTGFoffXmfNpOVJWZavcEC1X5M=;
	b=ErhvRdAyxESSresDAfA4ZLuIqB2fiFyq3Q+Mt+C40FQNVLPAVLfePOKrvBks1wGkq5Xt+x
	j26GYO43OQ+C6A3HPg8r8D4DJ5+0TiI8xHni7WHKbW5ipJGogBzbpvfq9wzciI7goweQK1
	O5oOITAHebQyK2WDyLWyO6vhdVkcCRk=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752733193; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0OF3s5CHOWEeck6Z4OTGFoffXmfNpOVJWZavcEC1X5M=;
	b=GhOQvRAR1adWngoKICGJmmtUYD8yDgz6H25q1KsO6kldbCGzQxoUA2QcVfuxZDs2wxZXJm
	BqiAHshqWe2lt/0mAWF7UB9xCaxm2eOqHe6gxBBEhVtzYGqdhKpGAqANTtuP9YPn7XSMZO
	3+Lq/RORJyTPaVQhbSvMnPeUTw9nWQI=
Message-ID: <eca10872-aafe-4990-a86a-1582e87a6af2@suse.com>
Date: Thu, 17 Jul 2025 08:19:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/17] xen/dom0less: store xenstore event channel in
 page
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-10-jason.andryuk@amd.com>
Content-Language: en-US
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
In-Reply-To: <20250716211504.291104-10-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------23RnhSsS2SvWPJf7cluBLqyQ"
X-Spam-Level: 
X-Spamd-Result: default: False [-5.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,amd.com:email];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -5.20

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------23RnhSsS2SvWPJf7cluBLqyQ
Content-Type: multipart/mixed; boundary="------------o8rpJUMPKXUjLyKAZOmFWoiN";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Message-ID: <eca10872-aafe-4990-a86a-1582e87a6af2@suse.com>
Subject: Re: [PATCH v2 09/17] xen/dom0less: store xenstore event channel in
 page
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-10-jason.andryuk@amd.com>
In-Reply-To: <20250716211504.291104-10-jason.andryuk@amd.com>

--------------o8rpJUMPKXUjLyKAZOmFWoiN
Content-Type: multipart/mixed; boundary="------------Ip9taDgr0wS8nk6ohdYeFylI"

--------------Ip9taDgr0wS8nk6ohdYeFylI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDcuMjUgMjM6MTQsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IFdyaXRlIHRoZSBh
c3NvY2lhdGVkIGV2ZW50IGNoYW5uZWwgaW50byB0aGUgeGVuc3RvcmUgcGFnZSBzbyB4ZW5z
dG9yZWQNCj4gY2FuIHJlYWQgaXQuICB4ZW5zdG9yZWQgY2FuIG1hcCB0aGUgZ3JhbnQgYnkg
dGhlIHJlc2VydmVkIGdyYW50IHRhYmxlDQo+IGVudHJ5LCBhbmQgdGhlbiByZWFkIG91dCB0
aGUgZXZlbnQgY2hhbm5lbCBhbmQgYmluZCBpdC4gIFRoaXMgZWxpbWluYXRlcw0KPiB0aGUg
bmVlZCBmb3IgYW4gYWRkaXRpb25hbCBtZWNoYW5pc20gdG8gZGlzY292ZXIgdGhlIGV2ZW50
IGNoYW5uZWwuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYXNvbi5h
bmRyeXVrQGFtZC5jb20+DQo+IC0tLQ0KPiAgIHhlbi9jb21tb24vZGV2aWNlLXRyZWUvZG9t
MGxlc3MtYnVpbGQuYyB8IDcgKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RldmljZS10cmVlL2Rv
bTBsZXNzLWJ1aWxkLmMgYi94ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBsZXNzLWJ1aWxk
LmMNCj4gaW5kZXggYTI3ODllM2JkZi4uMjg0MTM5YmYxNCAxMDA2NDQNCj4gLS0tIGEveGVu
L2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVzcy1idWlsZC5jDQo+ICsrKyBiL3hlbi9jb21t
b24vZGV2aWNlLXRyZWUvZG9tMGxlc3MtYnVpbGQuYw0KPiBAQCAtMjYsNiArMjYsNyBAQA0K
PiAgICNpbmNsdWRlIDxwdWJsaWMvaW8veHNfd2lyZS5oPg0KPiAgIA0KPiAgICNpbmNsdWRl
IDxhc20vZG9tMGxlc3MtYnVpbGQuaD4NCj4gKyNpbmNsdWRlIDxhc20vZ3Vlc3RfYWNjZXNz
Lmg+DQo+ICAgI2luY2x1ZGUgPGFzbS9zZXR1cC5oPg0KPiAgIA0KPiAgICNpbmNsdWRlIDx4
ZW4vc3RhdGljLW1lbW9yeS5oPg0KPiBAQCAtMTI2LDggKzEyNywxNCBAQCBzdGF0aWMgdm9p
ZCBfX2luaXQgaW5pdGlhbGl6ZV9kb21VX3hlbnN0b3JlKHZvaWQpDQo+ICAgDQo+ICAgICAg
ICAgICBpZiAoIGdmbiAhPSBYRU5TVE9SRV9QRk5fTEFURV9BTExPQyAmJiBJU19FTkFCTEVE
KENPTkZJR19HUkFOVF9UQUJMRSkgKQ0KPiAgICAgICAgICAgew0KPiArICAgICAgICAgICAg
ZXZ0Y2huX3BvcnRfdCBwb3J0ID0gZC0+YXJjaC5odm0ucGFyYW1zW0hWTV9QQVJBTV9TVE9S
RV9FVlRDSE5dOw0KPiArICAgICAgICAgICAgcGFkZHJfdCBldnRjaG5fZ2FkZHIgPSBnZm5f
dG9fZ2FkZHIoX2dmbihnZm4pKSArDQo+ICsgICAgICAgICAgICAgICAgb2Zmc2V0b2Yoc3Ry
dWN0IHhlbnN0b3JlX2RvbWFpbl9pbnRlcmZhY2UsIGV2dGNobl9wb3J0KTsNCj4gKw0KPiAg
ICAgICAgICAgICAgIEFTU0VSVChnZm4gPCBVSU5UMzJfTUFYKTsNCj4gICAgICAgICAgICAg
ICBnbnR0YWJfc2VlZF9lbnRyeShkLCBHTlRUQUJfUkVTRVJWRURfWEVOU1RPUkUsIHhzX2Rv
bWlkLCBnZm4pOw0KPiArICAgICAgICAgICAgYWNjZXNzX2d1ZXN0X21lbW9yeV9ieV9ncGEo
ZCwgZXZ0Y2huX2dhZGRyLCAmcG9ydCwgc2l6ZW9mKHBvcnQpLA0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdHJ1ZSAvKiBpc193cml0ZSAqLyk7DQoNCkkg
Y291bGRuJ3QgZmluZCBhY2Nlc3NfZ3Vlc3RfbWVtb3J5X2J5X2dwYSgpIGZvciB4ODYuIEkg
dGhpbmsgeW91IGVpdGhlciBuZWVkIHRvDQppbnRyb2R1Y2UgaXQgZm9yIGFsbCBhcmNocywg
b3IgeW91IG5lZWQgdG8gaGFuZGxlIHRoaXMgZGlmZmVyZW50bHkuDQoNCg0KSnVlcmdlbg0K

--------------Ip9taDgr0wS8nk6ohdYeFylI
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

--------------Ip9taDgr0wS8nk6ohdYeFylI--

--------------o8rpJUMPKXUjLyKAZOmFWoiN--

--------------23RnhSsS2SvWPJf7cluBLqyQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmh4lggFAwAAAAAACgkQsN6d1ii/Ey+A
Wwf+LHE6dDiIfUSVASsXaQ7d8mgzu9gmQFbRzS0T3aSkrlLFE+zHPZs4cR4nqaTw5jQd9Wndvmds
5/+njdJh95h5Dz8vRaaJtug6wpzWucN7fmdQJ6I2NdbXybdTgoSdtJlGn3C63/CZx5BCg//Ams4Y
28WJkdX5dPZMyQ5gDY9liGiEWZlO5Juqw1EBeJON7Olwx2t86Lw5ukTpStb+hiEQY9e9t04Ap7ut
q8JvBmZqcH8N4XS/ghwuIfosfJSxJDm7rkeojrQE3J5EUE+XR4sAaziLUvduzev9cAKrDIhLe9+G
YARdH9qVG/CLvK867UdUGRwXrfvWNfdxeBw/rxHZlA==
=HCX4
-----END PGP SIGNATURE-----

--------------23RnhSsS2SvWPJf7cluBLqyQ--

