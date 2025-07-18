Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F64B09AE1
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 07:15:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047918.1418224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucdRi-0000rf-BT; Fri, 18 Jul 2025 05:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047918.1418224; Fri, 18 Jul 2025 05:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucdRi-0000pX-7T; Fri, 18 Jul 2025 05:15:46 +0000
Received: by outflank-mailman (input) for mailman id 1047918;
 Fri, 18 Jul 2025 05:15:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HzjL=Z7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ucdRg-0000pP-Fy
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 05:15:44 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40eaaaee-6396-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 07:15:43 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-455ecacfc32so7411245e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 22:15:43 -0700 (PDT)
Received: from ?IPV6:2003:e5:8709:f00:6357:915b:11f9:6d20?
 (p200300e587090f006357915b11f96d20.dip0.t-ipconnect.de.
 [2003:e5:8709:f00:6357:915b:11f9:6d20])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4563b5b8475sm9554765e9.12.2025.07.17.22.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 22:15:42 -0700 (PDT)
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
X-Inumbo-ID: 40eaaaee-6396-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752815743; x=1753420543; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hnWLSEsjgITAGo71eftmv4grI9iSHXs/OHBNiiWP2tk=;
        b=UskYbmBIxGRh3NQsKeTs6IaUb38BgBkF9SLnQpifRGNfix5kLXE+4RyBiQ8nqbViuq
         z3LhEvWx1xIGZriSYA2+Q+i0frAB+liOslroR5giawCr/OhemcRD/Kb6myPLMywDpjgJ
         D+P/0Ia3TaLlBRehPdlVGVxY0QaFek8FT1zBWUjPlJ5FZzurCKicCINrju7mB475Y+ah
         /ZqEI36e5AzluYKbZxp6ZPcUAPJS5R3Ce8KutLFtquggFTP7XZZ9wAuSLy/L4janom0n
         sqGwTIf2GjSP5lBwETWHKYeexr7cXZcZBv/dwUNnXPS6OWhSgtjQ+ebH48GKF5DRD1A2
         KYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752815743; x=1753420543;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hnWLSEsjgITAGo71eftmv4grI9iSHXs/OHBNiiWP2tk=;
        b=ftLakQv840pjv/16CdgHvSaC+LGc6Ti0KEAdkSWYla6q2uQ8ffZsiEW6kh6M6fGkiZ
         DYI9Tzdt0dmpPhmSXmsx2owd3VwgKo4DCmFVYuRDosk8IoLOXqjgveHzifkfprpnA3lm
         b7YOsWnBCJutv+xMo7TjSpGgODUsOhD9Q2Ww94ppK/xeQgg3dhOfjne4H7Z4K8kceh6Q
         1QkYOC3LgLhaXj1JAqkBrVYAiDRW/c2ZFS+dFzyu4Rf5QAt6+SeFWC4i3Uba9SXN/OzT
         pv4eEB0PbT6yA8HBhXqMBYeleII4nlatg/ETIjyhhrauV/vn9UYjnvsUqPzvmvF4DUVs
         lyJw==
X-Forwarded-Encrypted: i=1; AJvYcCXADMpN9Yp/nq80N/6PIdKSGXywf8iZkSzpAHQmQ+RjA0KR0HcmWgL0ipF8fP5iKo1FaYocBpoP+VI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyC7fh00eDDzSN217LjJSZ2qnMNR86aF63o/jai+dD5kvOrSAiQ
	uRyK+pcle+tRQZvTnVnfNdG5kJwr62QtI8JpW0kG38UjDornJyZg4BJU4mg5ILvY6Rc=
X-Gm-Gg: ASbGncvhzkSRBEf+6/ATNP9gkl/DE8W9XWU6RGFGbRAt9n+3ARf+ICIOBKu3WcWzmqX
	6BFcAS2H1d+jvZGPJTNRCOwG/ok7uyfey0nK8b91ZkFvJrR+LmJFimlwvUUwVptFxJ9dAdB4ugk
	NyiWd4PNSTT7wlfEYM1yRQ0KmpQQC3Qeuu3Ggk06bpuqJ15yW+JQBnEjpcB5uzu6u1PuB0dPJH8
	GZ/NA6PgoEHsF+49WwCIEq390IBg6EFxC/2KMMQgTWEr/NxCAm62KkaNytlLYWxtlOexVyqFmIG
	WBD4PAvrMQj0tjJI1l2wgl77jQ7OwbEcizpyCWcLLJzJ8OmEnyPhTZdAjmP2zrLC1d7BUi0ThqY
	B5gJc477hA07zhKeti/S91m8VMyx0QNLTEQ7gy8nEyanXFrxStkwI9wIN+fnN2cc2Qp9fR1WbYj
	/qcGCQcPVXXCl/IZn7iK2X0AvMHyrYsGLLDQlLUvNwvMq4
X-Google-Smtp-Source: AGHT+IFEiggM5XJu3GXtlzfD6mToeOo71CljbvIR8mTzCEuM7qYs9laEctWcHx1puLS7BB0njvsC5g==
X-Received: by 2002:a05:600c:64ca:b0:456:1d61:b0f2 with SMTP id 5b1f17b1804b1-45630b6d6dcmr84026565e9.30.1752815742913;
        Thu, 17 Jul 2025 22:15:42 -0700 (PDT)
Message-ID: <53c5e64d-c379-4ed1-834b-584448fbe0a4@suse.com>
Date: Fri, 18 Jul 2025 07:15:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/17] tools/manage: Expose domain capabilities
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-13-jason.andryuk@amd.com>
 <47a5f34c-7d69-4094-8c60-df1a007713e1@suse.com>
 <319ce63b-fd4b-47ba-b970-9d2d2939da81@amd.com>
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
In-Reply-To: <319ce63b-fd4b-47ba-b970-9d2d2939da81@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3PWf1vML828wWhXU6gTUy8LA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3PWf1vML828wWhXU6gTUy8LA
Content-Type: multipart/mixed; boundary="------------qKbCdNi2XvZi1hfXjyJLEGv0";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>
Message-ID: <53c5e64d-c379-4ed1-834b-584448fbe0a4@suse.com>
Subject: Re: [PATCH v2 12/17] tools/manage: Expose domain capabilities
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-13-jason.andryuk@amd.com>
 <47a5f34c-7d69-4094-8c60-df1a007713e1@suse.com>
 <319ce63b-fd4b-47ba-b970-9d2d2939da81@amd.com>
In-Reply-To: <319ce63b-fd4b-47ba-b970-9d2d2939da81@amd.com>

--------------qKbCdNi2XvZi1hfXjyJLEGv0
Content-Type: multipart/mixed; boundary="------------bIw95DfjuTVt0TuYuppLYgsG"

--------------bIw95DfjuTVt0TuYuppLYgsG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDcuMjUgMjI6MjMsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjUtMDct
MTcgMDI6MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBPbiAxNi4wNy4yNSAyMzoxNCwg
SmFzb24gQW5kcnl1ayB3cm90ZToNCj4+PiBBZGQgYW4gYWRkaXRpb25hbCAiY2FwcyIgYXJn
dW1lbnQgdG8gdGhlIGxpYnhlbm1hbmFnZSBmdW5jdGlvbnMgdG8NCj4+PiBvYnRhaW4gYSBk
b21haW5zIGNhcGFiaWxpdGllcyAtIGNvbnRyb2wsIGhhcmR3YXJlLCBhbmQgeGVuc3RvcmUu
DQo+Pj4NCj4+PiBVcGRhdGUgdGhlIHhlbnN0b3JlZCBjYWxsZXJzIGF0IHRoZSBzYW1lIHRp
bWUuDQo+Pg0KPj4gTHVja2lseSB0aGUgaW50ZXJmYWNlIHdhcyBvbmx5IGludHJvZHVjZWQg
aW4gdGhlIGN1cnJlbnQgZGV2ZWwgY3ljbGUsDQo+PiBzbyBubyBuZWVkIGZvciBwbGF5aW5n
ICJzdGFibGUgaW50ZXJmYWNlIiBnYW1lcy4gOi0pDQo+IA0KPiBZZXMgOikNCj4gDQo+IEhh
dmluZyBzYWlkIHRoYXQsIGZvciBjb21wYXRpYmlsaXR5LCB3aWxsIHdlIG5lZWQgc29tZSB3
YXkgdG8gcXVlcnkgWGVuIGZvciBhIA0KPiBtYXNrIG9mIHZhbGlkIGNhcGFiaWxpdHkgYml0
cz/CoCBUaGF0IHdheSBhIGNhbGxlciBjYW4gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIA0KPiAi
dGhpcyBkb21haW4gZG9lc24ndCBoYXZlIGEgY2FwYWJpbGl0eSIgYW5kICJ0aGlzIGh5cGVy
dmlzb3IgZG9lc24ndCBzdXBwb3J0IGEgDQo+IGNhcGFiaWxpdHkuIg0KDQpOb3QgZm9yIG5v
dywgYnV0IGluIGZ1dHVyZSB0aGlzIHdpbGwgcHJvYmFibHkgYmUgbmVlZGVkLCB3aGVuZXZl
ciBuZXcgc3RhdGVzDQphbmQvb3IgY2FwYWJpbGl0aWVzIGFyZSBhZGRlZC4NCg0KDQpKdWVy
Z2VuDQo=
--------------bIw95DfjuTVt0TuYuppLYgsG
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------bIw95DfjuTVt0TuYuppLYgsG--

--------------qKbCdNi2XvZi1hfXjyJLEGv0--

--------------3PWf1vML828wWhXU6gTUy8LA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmh52H4FAwAAAAAACgkQsN6d1ii/Ey8D
EQgAit48ME5FAOO5Sg7VF/YANDGcp2k1lcykJlwkp9xJtckjWF4NQ0kKt0CMQ08idzlfZGxuvG+R
xfYQpsU6v9DWlHoAQLJxnP9Lv/xbJvkpkdEjpsfdGYPJ7rufabxTDw53HkxDtue0Kl2zI9Xv1B+6
gchufSanhBA6B20VVN70DRYxfAFTwGizx9EluDFBAj28R6H6zjAjCv0kUX5VxeMCPrGTImdK82t6
NoSRwXbjgWB/rRlsaoCTcQmexcRIPBFUKaKizg0uS0kernq9yeIACnfMB/17c0U1Xjt7eRzCl3PK
1uHs7OA+aR0GyxcOkMdzx9r4/DL9GoPq88UTZPFM3g==
=zDRT
-----END PGP SIGNATURE-----

--------------3PWf1vML828wWhXU6gTUy8LA--

