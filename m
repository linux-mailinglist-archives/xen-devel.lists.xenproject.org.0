Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 920E66AB800
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 09:11:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506753.779898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5vp-0003RM-V4; Mon, 06 Mar 2023 08:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506753.779898; Mon, 06 Mar 2023 08:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5vp-0003OW-Rs; Mon, 06 Mar 2023 08:10:53 +0000
Received: by outflank-mailman (input) for mailman id 506753;
 Mon, 06 Mar 2023 08:10:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kIMi=66=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pZ5vo-0003OQ-HG
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 08:10:52 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69072678-bbf6-11ed-96b4-2f268f93b82a;
 Mon, 06 Mar 2023 09:10:51 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5DEEA22370;
 Mon,  6 Mar 2023 08:10:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7789E13A66;
 Mon,  6 Mar 2023 08:10:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id P9ajGwqgBWQDPQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Mar 2023 08:10:50 +0000
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
X-Inumbo-ID: 69072678-bbf6-11ed-96b4-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678090251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eqsn968J0cCVrLZWYWjZfL9JRrTtcZJUf2GKxlH4pcQ=;
	b=PdpeJ3+WlkwHUCyDxfOU4oUlyi45jTM8bCwD1xRH7VogqLYwkFHHuTujXj7Nn5ducCF3U4
	MsX7DKbaXKWZmNwGt21FRnTv0JidlNvKGRIBDBgF70SokY3yIqdPIerI03XxfSaVse6b6N
	cxhKcHEIGqChRAkLHqUaRvN+hEuBXaI=
Message-ID: <453a66f5-5443-01a5-7161-8c888eea1957@suse.com>
Date: Mon, 6 Mar 2023 09:10:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 7/7] xen: simplify sysctl registration for balloon
Content-Language: en-US
To: Luis Chamberlain <mcgrof@kernel.org>, ebiederm@xmission.com,
 keescook@chromium.org, yzaikin@google.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, minyard@acm.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 song@kernel.org, robinmholt@gmail.com, steve.wahl@hpe.com,
 mike.travis@hpe.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org
Cc: j.granados@samsung.com, zhangpeng362@huawei.com, tangmeng@uniontech.com,
 willy@infradead.org, nixiaoming@huawei.com, sujiaxun@uniontech.com,
 patches@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-raid@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-hyperv@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20230302204612.782387-1-mcgrof@kernel.org>
 <20230302204612.782387-8-mcgrof@kernel.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230302204612.782387-8-mcgrof@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cK08nbi0V3641a7DHkBg1e2W"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cK08nbi0V3641a7DHkBg1e2W
Content-Type: multipart/mixed; boundary="------------DF6mDcbQeAPh0wqxZibFzCd0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luis Chamberlain <mcgrof@kernel.org>, ebiederm@xmission.com,
 keescook@chromium.org, yzaikin@google.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, minyard@acm.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 song@kernel.org, robinmholt@gmail.com, steve.wahl@hpe.com,
 mike.travis@hpe.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org
Cc: j.granados@samsung.com, zhangpeng362@huawei.com, tangmeng@uniontech.com,
 willy@infradead.org, nixiaoming@huawei.com, sujiaxun@uniontech.com,
 patches@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-raid@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-hyperv@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-ID: <453a66f5-5443-01a5-7161-8c888eea1957@suse.com>
Subject: Re: [PATCH 7/7] xen: simplify sysctl registration for balloon
References: <20230302204612.782387-1-mcgrof@kernel.org>
 <20230302204612.782387-8-mcgrof@kernel.org>
In-Reply-To: <20230302204612.782387-8-mcgrof@kernel.org>

--------------DF6mDcbQeAPh0wqxZibFzCd0
Content-Type: multipart/mixed; boundary="------------MsaV4p6uFuvvpR0Tnh9bv8Z8"

--------------MsaV4p6uFuvvpR0Tnh9bv8Z8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDMuMjMgMjE6NDYsIEx1aXMgQ2hhbWJlcmxhaW4gd3JvdGU6DQo+IHJlZ2lzdGVy
X3N5c2N0bF90YWJsZSgpIGlzIGEgZGVwcmVjYXRlZCBjb21wYXRpYmlsaXR5IHdyYXBwZXIu
DQo+IHJlZ2lzdGVyX3N5c2N0bF9pbml0KCkgY2FuIGRvIHRoZSBkaXJlY3RvcnkgY3JlYXRp
b24gZm9yIHlvdSBzbyBqdXN0DQo+IHVzZSB0aGF0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
THVpcyBDaGFtYmVybGFpbiA8bWNncm9mQGtlcm5lbC5vcmc+DQoNClJldmlld2VkLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0KDQo=
--------------MsaV4p6uFuvvpR0Tnh9bv8Z8
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

--------------MsaV4p6uFuvvpR0Tnh9bv8Z8--

--------------DF6mDcbQeAPh0wqxZibFzCd0--

--------------cK08nbi0V3641a7DHkBg1e2W
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQFoAoFAwAAAAAACgkQsN6d1ii/Ey/O
cQf/UgUlm7Jf2BZLvJhuDsq9O+IW6Npn1h2rQdo60ZYboq1o5TQYMejnC1JeUpLLrC4U2R6d5miv
5qdjYRtM6HEuoeibfi+fZQsn1QOhlIo42hVx1l2pCW4EMasDGDYyYiHBz9knt8nEXXBKNVejiIWK
vHTAI9eelFBkaCs4VWAYByv/g5A2LZ3k4FIi1Ns6qYztfXY2wGEh2D2usSG9qqTh3uGXbf4+wrLZ
n+iGnhXZhK9sScOuypGb94iOCUNHFBo/F0gtDqyIIXvqR50NvxOcZWx5HVH8PJOoMcsfLRQ/K2us
rQKj/rLlj+U4DbCEmuCSdLIV9MJ+iqfEiRlC8ppxEg==
=b1HF
-----END PGP SIGNATURE-----

--------------cK08nbi0V3641a7DHkBg1e2W--

