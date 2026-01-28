Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Bf/ASQqemmi3gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 16:24:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D24A3B93
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 16:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215830.1525948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl7Ok-00021w-El; Wed, 28 Jan 2026 15:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215830.1525948; Wed, 28 Jan 2026 15:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl7Ok-0001yh-BV; Wed, 28 Jan 2026 15:24:02 +0000
Received: by outflank-mailman (input) for mailman id 1215830;
 Wed, 28 Jan 2026 15:24:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MrbJ=AB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vl7Oj-0001U4-0U
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 15:24:01 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ecb8afb-fc5d-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 16:24:00 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b883787268fso1091712566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jan 2026 07:24:00 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1?
 (2a00-12d0-af5b-2f01-4042-c03-ce4d-a5a1.ip.tng.de.
 [2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dbf184e5dsm140514066b.43.2026.01.28.07.23.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 07:23:59 -0800 (PST)
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
X-Inumbo-ID: 5ecb8afb-fc5d-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769613840; x=1770218640; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iJXtJX3rf4c+Lnh7iULjxbkDmhdgdy/uWHLPN+e2hvY=;
        b=crwIg1OK7es97KQJ/6jhi0Z6R4W6Ma+amwBXwlxlq2dhoMlyGPXey1EWYw6qGvdmpM
         cu4bPb+h4sDwVkNJHybZ41QWO1mZvIccgEgr2f0Gf+O8pDVgjBJL0cRbhzXJux0SymLp
         IFLP4kYP00ZcxpNemNtpVLucEcQ0g0k9bkgBXxTyYa2536xi27ejs91vZuYzHs24fnuO
         iXRF77C/dzUlo8cMTZSSDXIktCLmkVcTQ8hykhjwTOmv7isJuL/RaqnC9+I87A0FRulA
         5yq/Ex4aEx7Okf3YD/lcpAgTEHgWGutxJC6eoAo1MEUByFRgDlwPrKbgXEOdQIYFVwRF
         XkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769613840; x=1770218640;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJXtJX3rf4c+Lnh7iULjxbkDmhdgdy/uWHLPN+e2hvY=;
        b=hnbiAFzqjiZ9isxCZRSlq3WMM1aN5RtEJXVA5Sq/SbrwyoN8c1ORD/TSssGd+8RRg3
         cx6EaoE/AfXXsh+m16C+vr4mlf7g5iNou3C5eK1U76sEhqBAeP8f0Gh8mcRfwY8sqidU
         bjQoVgNJtad7h2egmAJUYlEwnuzGqQkMB5Q2CCeeTmxDBzldn2nqP2WatQ+X++ooJRMh
         dEOIpkz4Zzq9nlxh4aL7Wbd9TUZJMShsVX/zv4Fn4vWo5jyFYWYbyI1l7QXcVXPd1cuM
         wH02hd648GNuIi5PKLL+MByjXjgcgAs9CEpVkvtKpAEhX45pJF/Ibx5JsHmXoHiw+W5V
         6Xpw==
X-Forwarded-Encrypted: i=1; AJvYcCV/jNH7gGE2b7KahSlvWs/GW1xNkFAx8oJnHJfAPcv/POafW6M4IwqMU6w3yGgC9CTRRuE4rwXdqcg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPeTGLRuJjbNI30nE8HluuNw2auwBCNO4PYdKgXQFqfJzkgyAy
	tRZe5AI6V7sXIIdB9uqKcRxT7N0YDgP9RDYvWLMfDgqDnl64nt1Y87bFR0TTxKQK4bE=
X-Gm-Gg: AZuq6aKZwu9EcheJxGAFrQncMdVK4IgQoSYwDmB8J3HyBKmEbDNR9IN6OOlO8MdgKh8
	oO4ZBxWpu+ePnn/HfuxEob974lqeSbiRceM3OflYIi4b4RxHJ5mot/7Gb06xLv6Ddnkbbp+qKM2
	uzwWlb94xwK0mfPm+0nh77EK3K76Ly+86jbStyC0t1swPXm8tF3I6b0THN2ScsxkIXx1vCSegkd
	NTismus37qzB42L+ArnDNoz4cvsG1CFrZfeJfGslsKWwfGAjZ+z7gMEc1sz2XwhWETj/ZIG8Xh+
	hGdWt33CcbGdb6vMErjbTpCCX8I0gjRISNFWYmuvHsBxnWZGEMeicIgt7WhTAxl6eKzzPHRRSyK
	TlBAVPIezoBqUmNGuNOsU0yC6aneqD7N+iRpCoapDt2QkaslY6xnXy3aUSgFeLJNdsC9w19LbBT
	LiXZonQmzvMj9/uEJ06YWbJKuvX4U8gtpw8MOGBe6eKg2v7M+QmVVwzzz0Q8cX7cuq15E76yhO6
	NhtKMeMaJ72KhVxkU7bDUI+vfBMZjSlNDanSA==
X-Received: by 2002:a17:906:ee8c:b0:b8d:9d60:d591 with SMTP id a640c23a62f3a-b8dab37d75fmr436073266b.46.1769613839639;
        Wed, 28 Jan 2026 07:23:59 -0800 (PST)
Message-ID: <7c05accc-91b7-45cf-b470-d8e134f2c99c@suse.com>
Date: Wed, 28 Jan 2026 16:23:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/balloon: improve accuracy of initial balloon
 target for dom0
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20260128110510.46425-1-roger.pau@citrix.com>
 <20260128110510.46425-3-roger.pau@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
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
In-Reply-To: <20260128110510.46425-3-roger.pau@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CI6UjaK7JgqygaxTat1t8RdG"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.50 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.59)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: C3D24A3B93
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CI6UjaK7JgqygaxTat1t8RdG
Content-Type: multipart/mixed; boundary="------------yVlsGI4j6R0aVz9NU0LV8ycf";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <7c05accc-91b7-45cf-b470-d8e134f2c99c@suse.com>
Subject: Re: [PATCH 2/2] xen/balloon: improve accuracy of initial balloon
 target for dom0
References: <20260128110510.46425-1-roger.pau@citrix.com>
 <20260128110510.46425-3-roger.pau@citrix.com>
In-Reply-To: <20260128110510.46425-3-roger.pau@citrix.com>

--------------yVlsGI4j6R0aVz9NU0LV8ycf
Content-Type: multipart/mixed; boundary="------------CVK1EZwURNtcAL1UnuOQ0P8B"

--------------CVK1EZwURNtcAL1UnuOQ0P8B
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDEuMjYgMTI6MDUsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gVGhlIGRvbTAg
YmFsbG9vbiB0YXJnZXQgc2V0IGJ5IHRoZSB0b29sc3RhY2sgaXMgdGhlIHZhbHVlIHJldHVy
bmVkIGJ5DQo+IFhFTk1FTV9jdXJyZW50X3Jlc2VydmF0aW9uLiAgRG8gdGhlIHNhbWUgaW4g
dGhlIGtlcm5lbCBiYWxsb29uIGRyaXZlciBhbmQNCj4gc2V0IHRoZSBjdXJyZW50IGFsbG9j
YXRpb24gdG8gdGhlIHZhbHVlIHJldHVybmVkIGJ5DQo+IFhFTk1FTV9jdXJyZW50X3Jlc2Vy
dmF0aW9uLiAgT24gbXkgdGVzdCBzeXN0ZW0gdGhpcyBjYXVzZXMgdGhlIGtlcm5lbA0KPiBi
YWxsb29uIGRyaXZlciB0YXJnZXQgdG8gZXhhY3RseSBtYXRjaCB0aGUgdmFsdWUgc2V0IGJ5
IHRoZSB0b29sc3RhY2sgaW4NCj4geGVuc3RvcmUuDQo+IA0KPiBOb3RlIHRoaXMgYXBwcm9h
Y2ggY2FuIGJlIHVzZWQgYnkgYm90aCBQViBhbmQgUFZIIGRvbTBzLCBhcyB0aGUgdG9vbHN0
YWNrDQo+IGFsd2F5cyB1c2VzIFhFTk1FTV9jdXJyZW50X3Jlc2VydmF0aW9uIHRvIHNldCB0
aGUgaW5pdGlhbCB0YXJnZXQgcmVnYXJkbGVzcw0KPiBvZiB0aGUgZG9tMCB0eXBlLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoN
Cg0KSnVlcmdlbg0K
--------------CVK1EZwURNtcAL1UnuOQ0P8B
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------CVK1EZwURNtcAL1UnuOQ0P8B--

--------------yVlsGI4j6R0aVz9NU0LV8ycf--

--------------CI6UjaK7JgqygaxTat1t8RdG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAml6Kg8FAwAAAAAACgkQsN6d1ii/Ey8l
wwf+IGEu9R+nYG1/mZ+AccvgftL0SHWpiACf42nCnQRRCxJ2ZXFyV/LCQlcKojt2d0b+w9BEMhWX
Nedo0ufwbtimWozY3ycdO81orJayQtJ5jxvcBHkuicJp8BN6Tzg4Q2nlkr4lO0szCJc6tuIU6Fss
+Vbsrtai4QUtFbn5yZq+mIiQeyBCKQ1GWwyBEmNzWoczwZV4Gseqlf21wvNF9Q5iPTtNW+p4OLfo
seGlNT3fbkQYFwzyCG5ceQjqG71owGMs1s+vslCKC9jXHdGd50++Z3bE2n5EC5zzn8WOfbojTZ5a
o5Aco+twhAROtVcetspz7R516KIAZc9QwXOa9qtErw==
=7CzO
-----END PGP SIGNATURE-----

--------------CI6UjaK7JgqygaxTat1t8RdG--

