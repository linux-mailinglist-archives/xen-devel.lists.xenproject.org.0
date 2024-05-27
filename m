Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F018CFE77
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 12:58:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730682.1135844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBY3a-0005DY-Bk; Mon, 27 May 2024 10:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730682.1135844; Mon, 27 May 2024 10:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBY3a-0005C0-8d; Mon, 27 May 2024 10:58:22 +0000
Received: by outflank-mailman (input) for mailman id 730682;
 Mon, 27 May 2024 10:58:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9k1s=M6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sBY3Y-0005Bm-Qh
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 10:58:20 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06609585-1c18-11ef-b4bb-af5377834399;
 Mon, 27 May 2024 12:58:18 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B5BA821B1B;
 Mon, 27 May 2024 10:58:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 83C3713A6B;
 Mon, 27 May 2024 10:58:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /1KJHklnVGbEAwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 27 May 2024 10:58:17 +0000
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
X-Inumbo-ID: 06609585-1c18-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1716807497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OUaamV24W6oWhF4J0lRbAl4NhZatFacXTrb9FeqRlLc=;
	b=m0/klhO6ex5yNmvPBdXsTDgQTvyqY4Mz0Ml1rWgfBnUEtwaGsJjwkYlaIgBVa6Bxzn0+Lq
	rKjsCV7xjZLaZkXdy/QuJ591/9IE82kMmVm1+6lJgx3lyINQtO9xOqRYwUsdi4aIwiztXV
	FKH4hmcHg6lc7UMel3+3UiehvVNiw+w=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="m0/klhO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1716807497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OUaamV24W6oWhF4J0lRbAl4NhZatFacXTrb9FeqRlLc=;
	b=m0/klhO6ex5yNmvPBdXsTDgQTvyqY4Mz0Ml1rWgfBnUEtwaGsJjwkYlaIgBVa6Bxzn0+Lq
	rKjsCV7xjZLaZkXdy/QuJ591/9IE82kMmVm1+6lJgx3lyINQtO9xOqRYwUsdi4aIwiztXV
	FKH4hmcHg6lc7UMel3+3UiehvVNiw+w=
Message-ID: <9fba239d-2e22-425b-b45f-86ecf016c2fd@suse.com>
Date: Mon, 27 May 2024 12:58:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Juergen Gross <jgross@suse.com>
Subject: Re: CVE-2021-47377: kernel: xen/balloon: use a kernel thread instead
 a workqueue
To: gregkh@linuxfoundation.org
Cc: cve@kernel.org, linux-cve-announce@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Xen.org security team" <security@xen.org>
References: <2024041747-CVE-2024-26908-4690@gregkh>
Content-Language: en-US
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
In-Reply-To: <2024041747-CVE-2024-26908-4690@gregkh>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dVaJww6PxA11a6ZZ7Kz9oRix"
X-Spam-Level: 
X-Spamd-Result: default: False [-7.20 / 50.00];
	BAYES_HAM(-2.80)[99.15%];
	SIGNED_PGP(-2.00)[];
	DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.992];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.com:+];
	HAS_ATTACHMENT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B5BA821B1B
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -7.20

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dVaJww6PxA11a6ZZ7Kz9oRix
Content-Type: multipart/mixed; boundary="------------G3ihLASy2vtu3dMCGzkOqHQy";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: gregkh@linuxfoundation.org
Cc: cve@kernel.org, linux-cve-announce@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Xen.org security team" <security@xen.org>
Message-ID: <9fba239d-2e22-425b-b45f-86ecf016c2fd@suse.com>
Subject: Re: CVE-2021-47377: kernel: xen/balloon: use a kernel thread instead
 a workqueue
References: <2024041747-CVE-2024-26908-4690@gregkh>
In-Reply-To: <2024041747-CVE-2024-26908-4690@gregkh>
Autocrypt-Gossip: addr=security@xen.org; keydata=
 xsBNBE+hNqgBCADYua5OFR0/Jeu0rByk+Obk6+SewIeGej1FAcjo+Cvpcr1dfnLBAhmmhbfM
 b++qr6SG6Ek+cUQogYAFvZcEcusbRPy4MIzJkqoPSyOUhCxZoxWNWUfhDdt0TWA3Hs1vYmFO
 e+2jvlL3h7yAsGMYO8jo6ow8ceBEOmf8Q5BLq2OPkNpGcaHEhbSv0VZ3mdHM30ynY6GubIws
 c68LZ5hTORTSjKaj2WVCe4OorBMZte5Im+6MOEUbCjynqPJSU9KNFhIhUuyXp1vn0gZ2N5QS
 pkghpzBJLzeBNEI6ecV3Q0p+/pq8EvEAuUSNLUEbIZ/NSLqyTVMc9HZxnPu59im8wB9rABEB
 AAHNK1hlbi5vcmcgKGluY29taW5nIGVtYWlsKSA8c2VjdXJpdHlAeGVuLm9yZz7CwHgEEwEC
 ACIFAk+hNqgCGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHQ6P8qC06lk1y0H/2Pj
 jQyPDZVS4zIVnR4xQOQ1KphPCdSTPlhj+VVrjZZNXWGCUKvJShL84XIONH62fIgQE/6CTWXJ
 tx6i4u1oAtFH4+8HayFjg609lxx9frJ4tJkJitw5TT6VEGAambchIG5QaP9hepgyrVXjQ0X2
 ot0jgpwL6G3sx0L1gewiMALXtGT6oTqLjXius/nv69yRe26wxU1GX80oWWH/5p585xt54C1X
 nhDEVzp0S9UW7VAAVDCWuSefSrihh3jZi4QE1fnGRwO0RfeLh1sXeuMn9uFIz0CmaCbAp5Pe
 UyNb6wgG60h4JLCDyhJntoHfq8pQLEJ8G9nvjDfw8BLvkBKYNvbOwE0ET6E2qAEIALqWNlGF
 d3uIj+DXZ40/i7fsoPb+HaYaG6Y+7+ZWxMxUeQDTLBnTYiAa+EGVutc4v52BXH8RZc9I/NH9
 lBT2/AwaEVSomxLicbixXUGoFC9kMp/VP1xwWJ+gm+ZEnQzY+2AFJGMvqEsGocQA7yLw121J
 UOrorny3CqpHykPUF3fqp4n/GL47VTaKxlsoV8o2JgZZ62NJlkBtnbA4ODzhWr6cA21smWFg
 sfFJ+EkXb1NEeYLs8CWtTn2EiQXlZTQ8OgBPahfvLZ+AJ4sM/Raoi2c3UIQrlCsg9BoojKMk
 Li8XUrywr8HEJYjhBYObCgbmaeIEfmrw5XJqOKlMg40XY+MAEQEAAcLAXwQYAQIACQUCT6E2
 qAIbDAAKCRB0Oj/KgtOpZDhJB/0XtxrlVuRttpjK1PEYK/A/9h47VH9p0UvVYCH+ZS2a+sTg
 sapx0zp4uni8wtytkvGw/EM06D4ZoaWAUcjXILNKGdi62q/z+WAfdEY/WrONxAbr2Dtv/LT0
 0/2nifYU9O1vGYS1Kx/B3D8fU0w+2Sjv+hYjbGDWn619etC8dNEIxczH6V/cVOZf0D2KhoBf
 MCHUoKeuAfaIKDMxOZjb7sajfUW70cxFFWYqH96Py01oxDroOKzy0x62iVdsYFGB3FvcD9tD
 WsxVWwGHA8DKEfKMuNPiuapzdxdrNm5AQilSUlfD65KK9d3kQdoOUPdPWoIQnz8GnHMPDe99
 7SuwxWGb

--------------G3ihLASy2vtu3dMCGzkOqHQy
Content-Type: multipart/mixed; boundary="------------emd4kqbqlUBoHXDuj7s7yzqQ"

--------------emd4kqbqlUBoHXDuj7s7yzqQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkknZCBsaWtlIHRvIGRpc3B1dGUgQ1ZFLTIwMjEtNDczNzc6IHRoZSBpc3N1ZSBm
aXhlZCBieSB1cHN0cmVhbSBjb21taXQNCjg0ODBlZDljMmJiZDU2ZmM4NjUyNDk5OGU1ZjJl
M2UyMmY1MDM4ZjYgY2FuIGluIG5vIHdheSBiZSB0cmlnZ2VyZWQgYnkNCmFuIHVucHJpdmls
ZWdlZCB1c2VyIG9yIGJ5IGEgcmVtb3RlIGF0dGFjayBvZiB0aGUgc3lzdGVtLCBhcyBpdCBy
ZXF1aXJlcw0KaW5pdGlhdGlvbiBvZiBtZW1vcnkgYmFsbG9vbmluZyBvZiB0aGUgcnVubmlu
ZyBzeXN0ZW0uIFRoaXMgY2FuIGJlIGRvbmUNCm9ubHkgYnkgZWl0aGVyIGEgaG9zdCBhZG1p
biBvciBieSBhbiBhZG1pbiBvZiB0aGUgZ3Vlc3Qgd2hpY2ggbWlnaHQNCnN1ZmZlciB0aGUg
ZGV0ZWN0aW9uIG9mIHRoZSBoYW5naW5nIHdvcmtxdWV1ZS4NCg0KUGxlYXNlIHJldm9rZSB0
aGlzIENWRS4NCg0KDQpKdWVyZ2VuDQo=
--------------emd4kqbqlUBoHXDuj7s7yzqQ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----


--------------emd4kqbqlUBoHXDuj7s7yzqQ--

--------------G3ihLASy2vtu3dMCGzkOqHQy--

--------------dVaJww6PxA11a6ZZ7Kz9oRix
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmZUZ0kFAwAAAAAACgkQsN6d1ii/Ey9F
GQf9FgVPyzTFKIgeWrwPDxN9H9ZslHo23VxxgV3zePI48TpLefea4JqyovD7dc/BBWK5FW/Fre2N
s5pRkzPERlvTXx8HqvIEdIAAOYx8j1MZPRUMPwZ6YOb+4o6LtE0XxRXHnTlnNOBbV/L9W3R9Nu13
ZnQVqOfy+GXrwoD/K2Ja/gh8jRtZUEriAKH3x7oJIDuyD4mpaLK36tqLq1b/cKca4tYfY+wzoX1i
/Lf2+M51VWLLL0qJl1pk2wUnXej7BnpGit5f4I5qDiiAY6Kuh1CknXadw7r4XWYuWNcm2eVOlJ5e
h2qRzZ+V42KALNAs9bXpebMhKVDQnEfgrRAxU+03tQ==
=FxZe
-----END PGP SIGNATURE-----

--------------dVaJww6PxA11a6ZZ7Kz9oRix--

