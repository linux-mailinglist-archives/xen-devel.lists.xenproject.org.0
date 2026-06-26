Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fFDrIRloPmoIFgkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 13:52:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F34796CCA8B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 13:52:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Uu9kYEYn;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1346053.1604604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd573-0003cB-RE; Fri, 26 Jun 2026 11:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346053.1604604; Fri, 26 Jun 2026 11:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd573-0003ZK-OI; Fri, 26 Jun 2026 11:52:49 +0000
Received: by outflank-mailman (input) for mailman id 1346053;
 Fri, 26 Jun 2026 11:52:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wd571-0003YP-Kg
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 11:52:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd570-006ygC-JY
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 13:52:46 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a3e6809-e002-0a2a0a5209dd-0a2a4508ac5e-8
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 13:52:46 +0200
Received: from [209.85.218.41] (helo=mail-ej1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a3e680e-edec-0a2a45080019-d155da29b012-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 13:52:46 +0200
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-c07c246ad7bso109490566b.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 04:52:46 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c11fbba6787sm334829166b.6.2026.06.26.04.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2026 04:52:45 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782474766; x=1783079566; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c89OcFty665nGDoq/xn8y9QUgDtjJCH7NIYa287PBjA=;
        b=Uu9kYEYnhWAjZAHlebtDAgiNVr+/SRSxF7E80ocZxZiA8wd3Aha6Lt3mbJphzBSedJ
         A06BNhfpdtNuksXIg4rY92Egyx+NcS85tX7PdBOy31RS0GZGUt4CBIhvD7xLVqHa3WK4
         RCRwCTxafuZEMQL3yTVjPnHFsoKlszAEIm4VpXFKuojicCsPWi1E8IYKeVBv/srd4tzZ
         hXHhtN7imf3/NGJVka5YkmUE+IIPeyXbJO8jhxQyqWGOSC1puUc7DTnRiUKFYIOcfm1a
         YZbarnivfjobVq4J7t58MprrSUaOahFD42GlXGIzazjKl3evslQBC6BccSf53le0XGQ1
         7vkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782474766; x=1783079566;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c89OcFty665nGDoq/xn8y9QUgDtjJCH7NIYa287PBjA=;
        b=gZh/bIxD6CGKKrrGhn68Yd1Bhlt5TugyWn0vtvlcxBVUvAHKmG/DJoF6v/RpFbMxzf
         pcNQUQWe69fgwt6rWZwbi8umJa9e501amMuFH11WdmuULnHnY1AV5vSrzLsdZ5L9hXSj
         ik5oN4dNZBGL3ET4zsbULpPSoH0VUuR3Onjoj2D94MsimYMRobZyCKdAhScSXS7Pc3nN
         5aWbe0oQIRD6/Wx8kSiQHu642jpn4hCVwUF42a85ED7DOwtM5Vxvvk2eOobUpobOmrF/
         EWtIM5oF4XhFsRzFebr4F7jpD2liz8kbW8XGgFPrKJ2Iyi6Hmsxv/b/HKvs/LkcaGlsg
         KdHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMVIP6MAUnZZVCVJQ5WP0FyOJMdNiuFJRaEcTER/r5qKVMcNaOorzDa5J8DlAsGBlpqhPe1mzdEkY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqMv8UPYG6xVgSiR2+IF57n9EIT4+i9RDhBMWhOXLpivSut4Mz
	vIdY01G+fM893g/DXpI1IVoyPLkh+4GO59M5aYVhuAnvgnge5+BaePW6qj4c5lkm9/o=
X-Gm-Gg: AfdE7cmDe6Bp6TbD1DerZDN/zjpIxTVteNlh16PugTLvv+bV9waW9AF2lvAkKAtVhAG
	70R1lHpvjaFhLHwX2GAnERwN3hpAv1KJdnDM+6jp7q5UZ0JpK8Wlsp5ejU6BHl8RZEkuTB/S9FU
	Zjl3q6UpvgzaXFiIbg1UxghW/7vmt8JW0o4YtVzuPHi1RxEzANfxOLW3sWx+9s03jsHnmxvbwPm
	J25euFw6o54B4ZkRiko3CzB9FWsMq///7Ws9YCKKpCFmcJLnflTSbO9EU5T6uAHnBXJkj0n+v0Q
	xj0+Q4dE7Y8P5QsZQucWzuEBz/1fXKZKTGdQSPS1MdsgRL/KRHFNXTfuTDbKP54oymSiEMzjPBr
	JAAanM4JKwY0hr4l0Oolcc/w7kmTREVlSG5F5RDs9hooxzWbJG0mThMMJIYHbqM9dDMVhabOxjj
	wOUCPW36MjkYabftc+26O5njt+w5LU+BCe5QIadPiOZtd7X/2+LsYUOS5ysO23/E6tQpKrK++Mu
	LOmNSyfbYk1ttWbtEpK9AhgCJG7TS8IGqsU0jYzzJk=
X-Received: by 2002:a17:907:3f9b:b0:bf4:9f78:8399 with SMTP id a640c23a62f3a-c12336a25e3mr18976366b.42.1782474765953;
        Fri, 26 Jun 2026 04:52:45 -0700 (PDT)
Message-ID: <26ccc18e-bbea-4e44-a776-715f1b61787e@suse.com>
Date: Fri, 26 Jun 2026 13:52:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Replace __ASSEMBLY__ with __ASSEMBLER__ in header
 files
To: Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20260619114547.159637-1-thuth@redhat.com>
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
In-Reply-To: <20260619114547.159637-1-thuth@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZmaYmuooSHqDpT0IedoLl6KF"
X-purgate-ID: tlsNG-c1860d/1782474766-A31393FC-81B0D9CC/0/0
X-purgate-type: clean
X-purgate-size: 6879
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thuth@redhat.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F34796CCA8B

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZmaYmuooSHqDpT0IedoLl6KF
Content-Type: multipart/mixed; boundary="------------r9MfxUQznoC1pwxXPee4Z2gR";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <26ccc18e-bbea-4e44-a776-715f1b61787e@suse.com>
Subject: Re: [PATCH] xen: Replace __ASSEMBLY__ with __ASSEMBLER__ in header
 files
References: <20260619114547.159637-1-thuth@redhat.com>
In-Reply-To: <20260619114547.159637-1-thuth@redhat.com>

--------------r9MfxUQznoC1pwxXPee4Z2gR
Content-Type: multipart/mixed; boundary="------------KpFUSKwjuIzvbDgtPCNlHOAM"

--------------KpFUSKwjuIzvbDgtPCNlHOAM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDYuMjYgMTM6NDUsIFRob21hcyBIdXRoIHdyb3RlOg0KPiBGcm9tOiBUaG9tYXMg
SHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4NCj4gDQo+IFdoaWxlIHRoZSBHQ0MgYW5kIENsYW5n
IGNvbXBpbGVycyBhbHJlYWR5IGRlZmluZSBfX0FTU0VNQkxFUl9fDQo+IGF1dG9tYXRpY2Fs
bHkgd2hlbiBjb21waWxpbmcgYXNzZW1ibHkgY29kZSwgX19BU1NFTUJMWV9fIGlzIGENCj4g
bWFjcm8gdGhhdCBvbmx5IGdldHMgZGVmaW5lZCBieSB0aGUgTWFrZWZpbGVzIGluIHRoZSBr
ZXJuZWwuDQo+IFRoaXMgY2FuIGJlIHZlcnkgY29uZnVzaW5nIHdoZW4gc3dpdGNoaW5nIGJl
dHdlZW4gdXNlcnNwYWNlDQo+IGFuZCBrZXJuZWxzcGFjZSBjb2RpbmcsIG9yIHdoZW4gZGVh
bGluZyB3aXRoIHVhcGkgaGVhZGVycyB0aGF0DQo+IHJhdGhlciBzaG91bGQgdXNlIF9fQVNT
RU1CTEVSX18gaW5zdGVhZC4gU28gbGV0J3Mgc3RhbmRhcmRpemUgbm93DQo+IG9uIHRoZSBf
X0FTU0VNQkxFUl9fIG1hY3JvIHRoYXQgaXMgcHJvdmlkZWQgYnkgdGhlIGNvbXBpbGVycy4N
Cj4gDQo+IFRoaXMgaXMgYSBjb21wbGV0ZWx5IG1lY2hhbmljYWwgcGF0Y2ggKGRvbmUgd2l0
aCBhIHNpbXBsZSAic2VkIC1pIg0KPiBzdGF0ZW1lbnQpLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogVGhvbWFzIEh1dGggPHRodXRoQHJlZGhhdC5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------KpFUSKwjuIzvbDgtPCNlHOAM
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------KpFUSKwjuIzvbDgtPCNlHOAM--

--------------r9MfxUQznoC1pwxXPee4Z2gR--

--------------ZmaYmuooSHqDpT0IedoLl6KF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmo+aA0FAwAAAAAACgkQsN6d1ii/Ey8j
/Qf/Q77FNhq5msBivsCNFrJZjXj5EbQTdF8uLE2TUQGIKR+jjPwKg5Q7xGMz+Im6q2vo4XlAOzDF
Q/4y5h2nBl93eaCYhwG9g8p+jX058S8/azsbe5hrqgOdhyvAAiDmCeD9hUtDItJBVYuImjp6Kqgd
FjW6oVuu0J2iDQAS8JUgYvaXmw7JLJCYap3gUHoWGtZCQVSVQwqV+eifYf/VjNhs7I7IQmiIk+9p
BNyWbbOUIy2AU4VUvDDzLDXnbjOWk2OYDbW3tyRY5Zmhs6YuHOGYNgrW947LRbDF8mAMI9t28iwT
H0nHBr8skvfbJJ8EwEYD0Z7YSeI33u/v2KGFWf4v8g==
=B5+E
-----END PGP SIGNATURE-----

--------------ZmaYmuooSHqDpT0IedoLl6KF--

