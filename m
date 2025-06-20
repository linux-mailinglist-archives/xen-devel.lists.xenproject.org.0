Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82726AE183C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 11:50:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020715.1396859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSYNx-0006OP-LL; Fri, 20 Jun 2025 09:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020715.1396859; Fri, 20 Jun 2025 09:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSYNx-0006Ki-Gj; Fri, 20 Jun 2025 09:50:13 +0000
Received: by outflank-mailman (input) for mailman id 1020715;
 Fri, 20 Jun 2025 09:50:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc6x=ZD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uSYNw-0006II-4O
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 09:50:12 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4820272-4dbb-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 11:50:10 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-60794c43101so2396373a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jun 2025 02:50:10 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b?
 (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de.
 [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae05420a5fasm134077666b.181.2025.06.20.02.50.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jun 2025 02:50:09 -0700 (PDT)
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
X-Inumbo-ID: f4820272-4dbb-11f0-a30e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750413010; x=1751017810; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wu2XdBLUTD/JkCBRH0B2g43bjtpoBodRhTuNrAEojDs=;
        b=NwNPxIl0VMKLBil1ETMBDGjF2VPVzoEM/f5rXvg9FeUdvxfwMWl4uHVfLSELQhX+oU
         U+THTBVabxKDwVDRB378qD5uy98IEo58q9eYBK09MTpLnUDt3n7DxyvQV3p0C6ey9HEA
         Il1pUtikn5Yl5hmHbZkAAwejzazihf+htN5DLB69Mc7rbBcDBi98nEjTwGJWjDzKGWVf
         OavRattlQqu21MTuWZkwCA/A2Xqu/wP+8JmTInLSV55k4Wcucwsg3AiFcBU2L2hdzFc8
         e51g4y4Jynq81Az0npAT7oJza4tVf9TmxfwwWWW7iTQuWQMoZ1fp32iU1DyifVxqmP1m
         hCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750413010; x=1751017810;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wu2XdBLUTD/JkCBRH0B2g43bjtpoBodRhTuNrAEojDs=;
        b=XDR2JhG/KqeOKACyVs1R/xYwxQi/aBcnWVkM9+gKQPDVL3HpReN+08bTOKsmnekv6S
         8agpDh6YgvA7tbhXLYQbcqFTR1ZjNYDqQqBmPXIR+eINtsRrSS9AUz8Ys4MziIWKjO+n
         hT7NSyswB6TnfBxWXeIxpXaEv619PLf28CysFOSrYzrXUTfV0eFhAY9Hdtcl4J2TNSB7
         m7lG1iJOir2MJ7LVH4GSuNG/6oes7IhFsI/C/js/oH7SpTjpL13ShTbFxGhCCZ2sojoI
         lpO4fufBEmbCu8NkGaTRCrdkrAOtsJSip+ItK5iLVRnzXb10c3f61C3BDUMQcZQ6Q4iN
         uRpg==
X-Forwarded-Encrypted: i=1; AJvYcCXQOUuX8iwy8ZAOo9M+I+4WpnlYQzFehiZy8TloZYqeQndC//R7MBODqiRgywZQKHmnZOSW99E3P58=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwIjQlHUlg+k0F1WhC09Kz9W70Ot/KMENjrD/eO0n6nODeRDa1
	t4jr73f9vwBeRuLzc81gBpT2iHYF4LpazUKg751BkIvEDQ1861WKRkzh8FMeWzOXKdg=
X-Gm-Gg: ASbGncuq80gV/OvmJhp6NLjfpPWb+0zq1TN99nt53G+aKLSAorZiRUSHp6LFsdouK+M
	EXQM05T13jugSKGSUfs9GgGV3pc+ZbR/B1HINstVLzHjoQj75Jaj5Cbegd75yH6LpHwvuSkzrmm
	YFuyHgeq/DBQ89HMJZDAPezkYZVumiT0dxp0YxU0C9FYOw2hAZarnb31NLN7gyi5/te+0vZBl8Z
	P1TO3M3CH9isVMyNmcu6TvFXbQN1VjUtRo+Cdh7VOCvefs6czlshkueZXo3gsbCiBoQwBovzB9A
	I/1uzTkh1u0AVufTz7QQu+SbuO6h3soj8+GX87mHcFZxO4LngBDUymSlAxYDNleOWz6bjp8arb9
	FgaEkdXcLGkawk/HYdOb8gjHjN9g9OtQHNDTdTNXpksmzn2EUjg99Hy/H+0FxfmoFoY62x/yP2l
	a2Ao8SRzCO3ww=
X-Google-Smtp-Source: AGHT+IE6QNgq8N9m77mGWq1gslHyy5HrK0GB1Ws3zGc0uZ4W4vHoZEm0zIfPwbc6t8mh1lUzVD5LqQ==
X-Received: by 2002:a17:906:6a1a:b0:ad2:1cd6:aacf with SMTP id a640c23a62f3a-ae057c0d793mr190191466b.47.1750413009954;
        Fri, 20 Jun 2025 02:50:09 -0700 (PDT)
Message-ID: <62eb6d8a-7759-46b1-b06b-e7c6bc4f9a11@suse.com>
Date: Fri, 20 Jun 2025 11:50:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/xenbus: fix W=1 build warning in
 xenbus_va_dev_error function
To: jiang.peng9@zte.com.cn
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 xu.xin16@zte.com.cn, yang.yang29@zte.com.cn
References: <20250620084104786r5xoR16_AmYZMJLnno3_Q@zte.com.cn>
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
In-Reply-To: <20250620084104786r5xoR16_AmYZMJLnno3_Q@zte.com.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NtA1j85D0sd5rJotB6iLDmbT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NtA1j85D0sd5rJotB6iLDmbT
Content-Type: multipart/mixed; boundary="------------kdp5ScXAbPSzFIR8UvMpL0pR";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: jiang.peng9@zte.com.cn
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 xu.xin16@zte.com.cn, yang.yang29@zte.com.cn
Message-ID: <62eb6d8a-7759-46b1-b06b-e7c6bc4f9a11@suse.com>
Subject: Re: [PATCH v2] xen/xenbus: fix W=1 build warning in
 xenbus_va_dev_error function
References: <20250620084104786r5xoR16_AmYZMJLnno3_Q@zte.com.cn>
In-Reply-To: <20250620084104786r5xoR16_AmYZMJLnno3_Q@zte.com.cn>

--------------kdp5ScXAbPSzFIR8UvMpL0pR
Content-Type: multipart/mixed; boundary="------------c3s8ua8KPaJdFvjCgEcsQum8"

--------------c3s8ua8KPaJdFvjCgEcsQum8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDYuMjUgMDI6NDEsIGppYW5nLnBlbmc5QHp0ZS5jb20uY24gd3JvdGU6DQo+IEZy
b206IFBlbmcgSmlhbmcgPGppYW5nLnBlbmc5QHp0ZS5jb20uY24+DQo+IA0KPiBUaGlzIHBh
dGNoIGZpeGVzIGEgVz0xIGZvcm1hdC1zdHJpbmcgd2FybmluZyByZXBvcnRlZCBieSBHQ0Mg
MTIuMy4wDQo+IGJ5IGFubm90YXRpbmcgeGVuYnVzX3N3aXRjaF9mYXRhbCgpIGFuZCB4ZW5i
dXNfdmFfZGV2X2Vycm9yKCkNCj4gd2l0aCB0aGUgX19wcmludGYgYXR0cmlidXRlLiBUaGUg
YXR0cmlidXRlIGVuYWJsZXMgY29tcGlsZS10aW1lDQo+IHZhbGlkYXRpb24gb2YgcHJpbnRm
LXN0eWxlIGZvcm1hdCBzdHJpbmdzIGluIHRoZXNlIGZ1bmN0aW9ucy4NCj4gDQo+IFRoZSBv
cmlnaW5hbCB3YXJuaW5nIHRyYWNlOg0KPiBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX2Ns
aWVudC5jOjMwNDo5OiB3YXJuaW5nOiBmdW5jdGlvbiAneGVuYnVzX3ZhX2Rldl9lcnJvcicg
bWlnaHQgYmUNCj4gYSBjYW5kaWRhdGUgZm9yICdnbnVfcHJpbnRmJyBmb3JtYXQgYXR0cmli
dXRlIFstV3N1Z2dlc3QtYXR0cmlidXRlPWZvcm1hdF0NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFBlbmcgSmlhbmcgPGppYW5nLnBlbmc5QHp0ZS5jb20uY24+DQoNClJldmlld2VkLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0KDQpQUzogTmV4
dCB0aW1lIHBsZWFzZSBkb24ndCBzZW5kIGFub3RoZXIgdmVyc2lvbiBvZiBhIHBhdGNoIGFz
IGEgcmVwbHksDQogICAgIGJ1dCBhcyBhIG5ldyBlbWFpbCB0aHJlYWQuDQo=
--------------c3s8ua8KPaJdFvjCgEcsQum8
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

--------------c3s8ua8KPaJdFvjCgEcsQum8--

--------------kdp5ScXAbPSzFIR8UvMpL0pR--

--------------NtA1j85D0sd5rJotB6iLDmbT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhVLtAFAwAAAAAACgkQsN6d1ii/Ey+m
Pwf+PgPfDUz9sPAG3hxG59OF6zm7TCAsLq/a2lQ6ShXfeqzPjSH7dZOm51VYCkVQKWGwSLCaVI0t
cXqIRRVob/0zQn+jIu4irFcRuwRTl4UJZwy/EZ2vcVr8GuJimL/DtEXwCDvkVQm/9mA4PhGBApJB
9zIxZ+Efmvz1f2v3EjfFhAXd8b5Hf2ihy05HneYT9yOEhOgyU4d/rBFuxwOKQi3rW1SHnIMaXpYy
VSmKHDBwM1/S4BmO0pdg4XXGj19M0cNAkinONkHcS38vWxUEnmj745ebXGZen0zhWSFutrVeKw3o
IGbHDMye78JRKcp22J+Du2HyDMii+4UKW+AiOW+MGQ==
=KDQS
-----END PGP SIGNATURE-----

--------------NtA1j85D0sd5rJotB6iLDmbT--

