Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6No+CPngpmkPYQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 14:24:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CB41F0218
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 14:24:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244739.1544114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxPjA-0007sn-T4; Tue, 03 Mar 2026 13:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244739.1544114; Tue, 03 Mar 2026 13:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxPjA-0007qL-QS; Tue, 03 Mar 2026 13:23:56 +0000
Received: by outflank-mailman (input) for mailman id 1244739;
 Tue, 03 Mar 2026 13:23:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SHXM=BD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vxPj9-0007qF-L3
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 13:23:55 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 398370cd-1704-11f1-b164-2bf370ae4941;
 Tue, 03 Mar 2026 14:23:53 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b8fb3c4bbc4so846592266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 05:23:54 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ae612f7sm611611366b.36.2026.03.03.05.23.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 05:23:52 -0800 (PST)
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
X-Inumbo-ID: 398370cd-1704-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772544233; x=1773149033; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D4jVGREkfXDvFUc3S6Y3ejso4Gwgqlhk3ArmnBljpb8=;
        b=LO0zqKw8uIZJk0tDJwxFUZLFhkyJ6PhDuUcWQtHiJsODBGQpYxH8CraiJUbfVl4ysW
         W4uxBXMIBlgM0yN/ccG1GjMdcyKwEVfrDhID4H40pXAgip6pN2hBhHh5LBeyfkMmVWfK
         vGYPyG+Jqa/APcLsa5wKTikaKSb2nukQ31IZbqGp3THZOfy0Agi4Ce65p8FPS3203bv5
         XDuYMyVctOBIKwJm03zwaSGjWLBPyI4B2TJGtdV3wA68T3MTOIXKxEQJC8/35x6b24i8
         nZwIOF5nvU4tTmDCrppAaQqyZx6oYOmSif9K9CHu0Lzw8NyWk2DFyCUWp0B/5WCI4vw8
         8qhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544233; x=1773149033;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4jVGREkfXDvFUc3S6Y3ejso4Gwgqlhk3ArmnBljpb8=;
        b=W3sVjtwlUXlhBCw3eSXAhDOunv+BlEDPximt9luk/vAlaKGj1UeRYREGBzsmrVpgGw
         YH5xES9bBLuqrqe6mzIIsnjyE7GaAptNg+DpyH2Whd/b5UquTAu9d6leq4j0aSr8kV39
         FelTPJRDZ2F06LtuOOMAP7cnoJtRazi/3I6Cpv5nCRDRixgfkUPhmTKMYMBlvs3djFXs
         CZW4Qa2x+5QnrOJMz9PKOXGfzf/tIgbzOJW3Ewd3kkPlRViddf9QULCP4sq3VV+SqoFF
         HimxRK+qLNJBaOLfK7jEsyuav/wrWzncADUNO0d4Mh3ZFHRhFwIhDol8FnIU/Vb0MPrQ
         9OcA==
X-Forwarded-Encrypted: i=1; AJvYcCWWXugF6iNi8yQvOIlJU6l+fAZDmHa48ST6KU/oorIYYoR7ToO44fXPsuYbQTFpqUw39LyOlB0yM4E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7KMW45cBCj8be5V6fhp5wQQBakPh1Ce/TVnGRF1bCB1vk1a3c
	Nitm/ic0LlcVLmeSESI/J1FbElrQpvtVos/ffvYxQkkXg8t83fhO8jRouLdzwcRUigE=
X-Gm-Gg: ATEYQzxizlXi2wSAy6qXamBvQzqGREcoRkXMvTRvAjeelN0JyERKmFR9cODABy4U/Nt
	1IQUf/7JbJglqpe9L03piWmN4Im9z0yugsn6bVr+A3odPVPWsQOL898sSlatk1Y3eR9GBrGTCq5
	svKM7HSSGig/u69xVsEq6v1X79Y8mepKitwv5G8cxkmnbzb0J8z6LRUw5lTQksAGAR2bPpp2OZ4
	ETuWJMW8rwO/zSLJ7Xj3RTOcMiEdJOJ1A1XbNh8/eeOSYCqYn3vgykr8QYdrXDZw+nCkQGf6D8q
	OT4cjXBFCmxOAYxTLMtjP/M4AsKsr35lBP5S3rj7NCh8vaFfu3eOLXx9E3HbUTbq9OgDW6vyU/c
	KYzJrYooO7HJgI2WOPWs7TMsIeWdxDUeN7w6LDyNqzqbEKja3SXKbctFM4qYxqpD8zLQNkA5ahO
	/qKFLTF6LVlFjyVMoCOPIeiuVv/yUS3dsJb4yatqaKEywJK2cn06qqQoZrDycVDIjid+EYrKGJ/
	XfHnjnXWYHf6fnYzzYG1DjaXqDmtgHGjkIdUr4aYc6X81hq0sKkhOeVzTWw2w8c
X-Received: by 2002:a17:906:6a14:b0:b88:6542:86a0 with SMTP id a640c23a62f3a-b9376594b7emr1067333866b.54.1772544233283;
        Tue, 03 Mar 2026 05:23:53 -0800 (PST)
Message-ID: <ce7f4fce-644a-48e1-9ac2-e426f2d1d42e@suse.com>
Date: Tue, 3 Mar 2026 14:23:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: update outdated comment
To: kexinsun <kexinsun@smail.nju.edu.cn>
Cc: boris.ostrovsky@oracle.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 julia.lawall@inria.fr, xutong.ma@inria.fr, yunbolyu@smu.edu.sg,
 ratnadiraw@smu.edu.sg
References: <20260224022424.1718-1-kexinsun@smail.nju.edu.cn>
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
In-Reply-To: <20260224022424.1718-1-kexinsun@smail.nju.edu.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PbxofBzZ6nVHpzmTLSw0E58S"
X-Rspamd-Queue-Id: 81CB41F0218
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,nju.edu.cn:email];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:kexinsun@smail.nju.edu.cn,m:boris.ostrovsky@oracle.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:julia.lawall@inria.fr,m:xutong.ma@inria.fr,m:yunbolyu@smu.edu.sg,m:ratnadiraw@smu.edu.sg,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PbxofBzZ6nVHpzmTLSw0E58S
Content-Type: multipart/mixed; boundary="------------jRByJlNJhbPitDNg6CPM8PKG";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: kexinsun <kexinsun@smail.nju.edu.cn>
Cc: boris.ostrovsky@oracle.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 julia.lawall@inria.fr, xutong.ma@inria.fr, yunbolyu@smu.edu.sg,
 ratnadiraw@smu.edu.sg
Message-ID: <ce7f4fce-644a-48e1-9ac2-e426f2d1d42e@suse.com>
Subject: Re: [PATCH] x86/xen: update outdated comment
References: <20260224022424.1718-1-kexinsun@smail.nju.edu.cn>
In-Reply-To: <20260224022424.1718-1-kexinsun@smail.nju.edu.cn>

--------------jRByJlNJhbPitDNg6CPM8PKG
Content-Type: multipart/mixed; boundary="------------xV60sHF8B10z2V0QneIrwen0"

--------------xV60sHF8B10z2V0QneIrwen0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDIuMjYgMDM6MjQsIGtleGluc3VuIHdyb3RlOg0KPiBUaGUgZnVuY3Rpb24geGVu
X2ZsdXNoX3RsYl9vdGhlcnMoKSB3YXMgcmVuYW1lZCB4ZW5fZmx1c2hfdGxiX211bHRpKCkN
Cj4gYnkgY29tbWl0IDRjZTk0ZWFiYWMxNiAoIng4Ni9tbS90bGI6IEZsdXNoIHJlbW90ZSBh
bmQgbG9jYWwgVExCcw0KPiBjb25jdXJyZW50bHkiKS4gIFVwZGF0ZSB0aGUgY29tbWVudCBh
Y2NvcmRpbmdseS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IGtleGluc3VuIDxrZXhpbnN1bkBz
bWFpbC5uanUuZWR1LmNuPg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------xV60sHF8B10z2V0QneIrwen0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------xV60sHF8B10z2V0QneIrwen0--

--------------jRByJlNJhbPitDNg6CPM8PKG--

--------------PbxofBzZ6nVHpzmTLSw0E58S
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmm4OgFAwAAAAAACgkQsN6d1ii/Ey/c
RAf+PlfQCnYZcOW1+JZipL6agNuExGtzLEhA3WiWB7N2ft+O7M+y6ztNvsDm0ZRa0+9CdfrombrW
AN7P90jD4hHFcvOFVS4o9gWh4epqZ+01ybJgFCIF9MMClHYOv/idq3JhObzhhXISdehAUkJp+NZt
UwecYAUg2lDf8BEhNfenLUwyc8y3O866I/JFab0lLAI195VasPmDUPLzha5bIEZogVI4se961L3Y
S/aEUe/rSGXi+pU7ICkfqCjsgFEQ9f9DzVUb6p/t+liNYPBBlWMRtfWCyHeOLLH2X1UlPfn8ILz7
f+vTFSVZ3GcudXGZdDDilj5QNI8mzrzad/G22GhIhw==
=txub
-----END PGP SIGNATURE-----

--------------PbxofBzZ6nVHpzmTLSw0E58S--

