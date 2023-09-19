Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EE67A599D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 07:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604350.941672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiTi0-0004yJ-QQ; Tue, 19 Sep 2023 05:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604350.941672; Tue, 19 Sep 2023 05:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiTi0-0004wA-Nt; Tue, 19 Sep 2023 05:55:40 +0000
Received: by outflank-mailman (input) for mailman id 604350;
 Tue, 19 Sep 2023 05:55:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Oxb=FD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qiThz-0004w1-KQ
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 05:55:39 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 286ee577-56b1-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 07:55:38 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 894AA22839;
 Tue, 19 Sep 2023 05:55:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3293D13458;
 Tue, 19 Sep 2023 05:55:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zoLyCtk3CWVPQwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 19 Sep 2023 05:55:37 +0000
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
X-Inumbo-ID: 286ee577-56b1-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1695102937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NqK2AzLjcSSziUXv/bRsgo92hGjv4vqcHTVq9z+bJUs=;
	b=S6RFLxGsdYKiAAZnCMFAgl0LoF6l1MPDh02afDmCYyAqR5IKsyjHRk7gAUXnIKvT+86FI6
	VFvPtLmxdA7N8e6a0Pfer6jYLuWlPszyR2YBjtnXwKcrqcQgLK0WmXP5U5Lb4zlO+R5FcW
	hapJJwAu6vpuqRkUTq2pf57Ei0T+Os8=
Message-ID: <6ca5e35a-515e-4205-a8f2-13c0176f93cd@suse.com>
Date: Tue, 19 Sep 2023 07:55:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: refactor deprecated strncpy
Content-Language: en-US
To: Justin Stitt <justinstitt@google.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, Kees Cook <keescook@chromium.org>
References: <20230911-strncpy-arch-x86-xen-efi-c-v1-1-96ab2bba2feb@google.com>
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
In-Reply-To: <20230911-strncpy-arch-x86-xen-efi-c-v1-1-96ab2bba2feb@google.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JLHfp2JVY4v5vNtIURUkIWuZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JLHfp2JVY4v5vNtIURUkIWuZ
Content-Type: multipart/mixed; boundary="------------vs6263xuQCyPAXuihv3xaRux";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Justin Stitt <justinstitt@google.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, Kees Cook <keescook@chromium.org>
Message-ID: <6ca5e35a-515e-4205-a8f2-13c0176f93cd@suse.com>
Subject: Re: [PATCH] xen/efi: refactor deprecated strncpy
References: <20230911-strncpy-arch-x86-xen-efi-c-v1-1-96ab2bba2feb@google.com>
In-Reply-To: <20230911-strncpy-arch-x86-xen-efi-c-v1-1-96ab2bba2feb@google.com>

--------------vs6263xuQCyPAXuihv3xaRux
Content-Type: multipart/mixed; boundary="------------P6Yp5JLuOoYDSWVGOGON5fDh"

--------------P6Yp5JLuOoYDSWVGOGON5fDh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDkuMjMgMjA6NTksIEp1c3RpbiBTdGl0dCB3cm90ZToNCj4gYHN0cm5jcHlgIGlz
IGRlcHJlY2F0ZWQgZm9yIHVzZSBvbiBOVUwtdGVybWluYXRlZCBkZXN0aW5hdGlvbiBzdHJp
bmdzIFsxXS4NCj4gDQo+IGBlZmlfbG9hZGVyX3NpZ25hdHVyZWAgaGFzIHNwYWNlIGZvciA0
IGJ5dGVzLiBXZSBhcmUgY29weWluZyAiWGVuIiAoMyBieXRlcykNCj4gcGx1cyBhIE5VTC1i
eXRlIHdoaWNoIG1ha2VzIDQgdG90YWwgYnl0ZXMuIFdpdGggdGhhdCBiZWluZyBzYWlkLCB0
aGVyZSBpcw0KPiBjdXJyZW50bHkgbm90IGEgYnVnIHdpdGggdGhlIGN1cnJlbnQgYHN0cm5j
cHkoKWAgaW1wbGVtZW50YXRpb24gaW4gdGVybXMgb2YNCj4gYnVmZmVyIG92ZXJyZWFkcyBi
dXQgd2Ugc2hvdWxkIGZhdm9yIGEgbW9yZSByb2J1c3Qgc3RyaW5nIGludGVyZmFjZQ0KPiBl
aXRoZXIgd2F5Lg0KPiANCj4gQSBzdWl0YWJsZSByZXBsYWNlbWVudCBpcyBgc3Ryc2NweWAg
WzJdIGR1ZSB0byB0aGUgZmFjdCB0aGF0IGl0IGd1YXJhbnRlZXMNCj4gTlVMLXRlcm1pbmF0
aW9uIG9uIHRoZSBkZXN0aW5hdGlvbiBidWZmZXIgd2hpbGUgYmVpbmcgZnVuY3Rpb25hbGx5
IHRoZQ0KPiBzYW1lIGluIHRoaXMgY2FzZS4NCj4gDQo+IExpbms6IHd3dy5rZXJuZWwub3Jn
L2RvYy9odG1sL2xhdGVzdC9wcm9jZXNzL2RlcHJlY2F0ZWQuaHRtbCNzdHJuY3B5LW9uLW51
bC10ZXJtaW5hdGVkLXN0cmluZ3NbMV0NCj4gTGluazogaHR0cHM6Ly9tYW5wYWdlcy5kZWJp
YW4ub3JnL3Rlc3RpbmcvbGludXgtbWFudWFsLTQuOC9zdHJzY3B5LjkuZW4uaHRtbCBbMl0N
Cj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0tTUFAvbGludXgvaXNzdWVzLzkwDQo+IENj
OiBsaW51eC1oYXJkZW5pbmdAdmdlci5rZXJuZWwub3JnDQo+IENjOiBLZWVzIENvb2sgPGtl
ZXNjb29rQGNocm9taXVtLm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogSnVzdGluIFN0aXR0IDxq
dXN0aW5zdGl0dEBnb29nbGUuY29tPg0KDQpQdXNoZWQgdG8geGVuL3RpcC5naXQgZm9yLWxp
bnVzLTYuNmENCg0KDQpKdWVyZ2VuDQoNCg==
--------------P6Yp5JLuOoYDSWVGOGON5fDh
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------P6Yp5JLuOoYDSWVGOGON5fDh--

--------------vs6263xuQCyPAXuihv3xaRux--

--------------JLHfp2JVY4v5vNtIURUkIWuZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmUJN9gFAwAAAAAACgkQsN6d1ii/Ey9b
Bgf8CTf585RCh50vukpF14vtoVOLQzRwI5l+KakkqgIo2ZZnsFuAx7/VDacR6DEZFv/09CLD349E
+6v1grvdGCORORr8CzFuD5u4Ou1Vmuosze6qwkq7Mmuez738yFLOyMU8XXm+vB1a8FwgpwGyNiq7
sc1rZ2VdNGCqT93m1ykuF2YJjvjsHEQqQ8twmg8FoKh83U8JWQoFphxw3aKcXSZge1rpz/9/4kY+
jVcmKg1QU9M+9HmhrRnz4tnxqMs/sARqxTUd0JqWwiEmf8jn3o5tpYdGcVOujVeN60U/rTLsMYyP
60G1Zhv6TiL+q+Au4qdYW7YdGQRv8Ca6buyUWIS/hg==
=NvJy
-----END PGP SIGNATURE-----

--------------JLHfp2JVY4v5vNtIURUkIWuZ--

