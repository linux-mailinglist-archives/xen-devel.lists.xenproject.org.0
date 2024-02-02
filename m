Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF49847398
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 16:44:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675123.1050342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVvhj-0007wG-Qg; Fri, 02 Feb 2024 15:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675123.1050342; Fri, 02 Feb 2024 15:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVvhj-0007uY-No; Fri, 02 Feb 2024 15:43:47 +0000
Received: by outflank-mailman (input) for mailman id 675123;
 Fri, 02 Feb 2024 15:43:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PMC9=JL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rVvhi-0007uN-Ck
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 15:43:46 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d91520ba-c1e1-11ee-8a43-1f161083a0e0;
 Fri, 02 Feb 2024 16:43:45 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 626811F795;
 Fri,  2 Feb 2024 15:43:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 344E5139AB;
 Fri,  2 Feb 2024 15:43:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tHGECrANvWU0NQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 02 Feb 2024 15:43:44 +0000
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
X-Inumbo-ID: d91520ba-c1e1-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706888624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HIS7Q8cV+NYLcorvsLrbiSHVDcbRqskySy2I/KGPvcM=;
	b=p3Eq9rrqa4sUFtSpc/MwnbSJ2j0przft+3FsLqZJExebsolNbs1ijzIu5RDryKKkDMybz9
	1vwlETe6lW6oLQZb+q5Qp6osWqgIJndnv2rjM1AoKHv+EB7KH/p2rFP/zu0tjiyW13Fdwx
	AFw8BqbZKA4dU+JDq5QH1QRwMxq7gYI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706888624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HIS7Q8cV+NYLcorvsLrbiSHVDcbRqskySy2I/KGPvcM=;
	b=p3Eq9rrqa4sUFtSpc/MwnbSJ2j0przft+3FsLqZJExebsolNbs1ijzIu5RDryKKkDMybz9
	1vwlETe6lW6oLQZb+q5Qp6osWqgIJndnv2rjM1AoKHv+EB7KH/p2rFP/zu0tjiyW13Fdwx
	AFw8BqbZKA4dU+JDq5QH1QRwMxq7gYI=
Message-ID: <cba89cf3-a77f-4394-ba19-42cf5a206f77@suse.com>
Date: Fri, 2 Feb 2024 16:43:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/33] tools/xl: support new 9pfs backend xen-9pfsd
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-18-jgross@suse.com>
 <43cb6d28-34da-47b9-b61f-0be8298f9d8b@perard>
 <3ce7fa13-fb64-438d-ba7d-455e2b42854b@suse.com>
 <d92da5e1-3d96-4073-bf67-7d891aec6411@suse.com>
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
In-Reply-To: <d92da5e1-3d96-4073-bf67-7d891aec6411@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fNQKDuzUFvKKQrqZ3dNqzJwR"
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=p3Eq9rrq
X-Spamd-Result: default: False [-2.25 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MIME_BASE64_TEXT(0.10)[];
	 MX_GOOD(-0.01)[];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-0.05)[59.50%];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[lists.xenproject.org,xen.org,gmail.com];
	 RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 626811F795
X-Spam-Level: 
X-Spam-Score: -2.25
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fNQKDuzUFvKKQrqZ3dNqzJwR
Content-Type: multipart/mixed; boundary="------------udv00NbYVSiNj5QC2430E3ee";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Message-ID: <cba89cf3-a77f-4394-ba19-42cf5a206f77@suse.com>
Subject: Re: [PATCH v3 17/33] tools/xl: support new 9pfs backend xen-9pfsd
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-18-jgross@suse.com>
 <43cb6d28-34da-47b9-b61f-0be8298f9d8b@perard>
 <3ce7fa13-fb64-438d-ba7d-455e2b42854b@suse.com>
 <d92da5e1-3d96-4073-bf67-7d891aec6411@suse.com>
In-Reply-To: <d92da5e1-3d96-4073-bf67-7d891aec6411@suse.com>

--------------udv00NbYVSiNj5QC2430E3ee
Content-Type: multipart/mixed; boundary="------------xb0Qaq3CzA4Dop537C8SLoKb"

--------------xb0Qaq3CzA4Dop537C8SLoKb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDIuMjQgMTY6MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDMxLjAxLjI0
IDE2OjIwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMTUuMDEuMjQgMTY6MTQsIEFu
dGhvbnkgUEVSQVJEIHdyb3RlOg0KPj4+IE9uIFRodSwgSmFuIDA0LCAyMDI0IGF0IDEwOjAw
OjM5QU0gKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+IEBAIC0yMjQyLDYgKzIy
NTYsMjggQEAgdm9pZCBwYXJzZV9jb25maWdfZGF0YShjb25zdCBjaGFyICpjb25maWdfc291
cmNlLA0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsaWJ4bF9zdHJpbmdfbGlz
dF9kaXNwb3NlKCZwYWlycyk7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChw
OS0+dHlwZSA9PSBMSUJYTF9QOV9UWVBFX1VOS05PV04pIHsNCj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBwOS0+dHlwZSA9IExJQlhMX1A5X1RZUEVfUUVNVTsNCj4+
Pg0KPj4+IFRoZSBkZWZhdWx0aW5nIGlzIG5vcm1hbGx5IGRvbmUgaW4gbGlieGwsIHNvIHRo
YXQgaXQgd29ya3MgZm9yIGFsbCB1c2Vycw0KPj4+IG9mIGxpYnhsLiBDYW4gdGhpcyBiZSBk
b25lIGluc3RlYWQgaW4gbGlieGw/IEhvcGVmdWxseSwgaXQncyBlbm91Z2ggdG8NCj4+PiBk
byBpdCBpbiBsaWJ4bF9fZGV2aWNlX3A5X3NldGRlZmF1bHQoKS4NCj4+Pg0KPj4+IFNhbWUg
cXVlc3Rpb24gZm9yIHRoZSBmb2xsb3d1cCBjaGVja3MgYW5kIGRlZmF1bHQgdmFsdWVzLg0K
Pj4NCj4+IEknbGwgbG9vayBpbnRvIGl0Lg0KPiANCj4gVHVybnMgb3V0IHRoaXMgd291bGQg
bmVlZCBzb21lIGhhY2ssIGFzIEkgaGF2ZSBubyBhY2Nlc3MgdG8gdGhlIG5hbWUgb2YNCj4g
dGhlIGRvbWFpbiBiZWluZyBjcmVhdGVkIGluIGxpYnhsX19kZXZpY2VfcDlfc2V0ZGVmYXVs
dCgpLiBBbmQgdGhpcyBpcyBuZWVkZWQNCj4gZm9yIHNldHRpbmcgdGhlIHBhdGggZGVmYXVs
dCB2YWx1ZS4NCj4gDQo+IERvIHlvdSBoYXZlIGFueSBpZGVhIGhvdyB0byByZXNvbHZlIHRo
aXMgaXNzdWUsIG9yIGFyZSB5b3UgZmluZSB0byBrZWVwIHRoZQ0KPiBwYXRjaCBhcyBpcz8N
Cg0KSnVzdCBmb3VuZCBhIGhvcGVmdWxseSBhY2NlcHRhYmxlIHNvbHV0aW9uOiBpZiB0aGUg
dHlwZSBpcyBYRU5fOVBGU0QgYW5kIG5vDQpwYXRoIGhhcyBiZWVuIHNwZWNpZmllZCBJIHNl
dCBpdCBpbiB4bF9wYXJzZS5jLiBUaGUgcmVzdCBvZiB0aGUgZGVmYXVsdA0Kc2V0dGluZ3Mg
YW5kIGNvbnNpc3RlbmN5IGNoZWNrcyBhcmUgZG9uZSBpbiBsaWJ4bC4NCg0KSXMgdGhpcyBv
a2F5IGZvciB5b3U/DQoNCg0KSnVlcmdlbg0K
--------------xb0Qaq3CzA4Dop537C8SLoKb
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------xb0Qaq3CzA4Dop537C8SLoKb--

--------------udv00NbYVSiNj5QC2430E3ee--

--------------fNQKDuzUFvKKQrqZ3dNqzJwR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmW9Da8FAwAAAAAACgkQsN6d1ii/Ey8Q
Twf/dl5LI+KiNolT5sqqDDzuSdvUOc3hPq7NRfj6a9ISoF+A5GNlrHVVBESXcHENbR3piFXeQgvN
bMiqA6+dhKAqQcOVw5hk3zmje5AktD8qe4WDarmZtneWjDdF0gSe2gfb3ThRQw5O/x2klylv+UOs
phIbatkGI1dt0/cg1yYWYgTvRIE4TAdvHpWLSgYef6JF1X+4unTGN89SVQXTnSktoe06UD1riUiR
vmEu3xPvs74inevezqwuIjeHyOaqjSbfKrLI4Qrh0ZRMvocFqgaKVmKqgLsJh8hAhnFdTD6GWhiP
f90UUTWigKs6TJwKw3hxuUOPJDPIl54QE3JtTqri/Q==
=gOro
-----END PGP SIGNATURE-----

--------------fNQKDuzUFvKKQrqZ3dNqzJwR--

