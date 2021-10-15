Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AAF42EB14
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 10:08:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209872.366444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbIFh-0000mA-3D; Fri, 15 Oct 2021 08:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209872.366444; Fri, 15 Oct 2021 08:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbIFg-0000jt-VU; Fri, 15 Oct 2021 08:07:40 +0000
Received: by outflank-mailman (input) for mailman id 209872;
 Fri, 15 Oct 2021 08:07:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=esao=PD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mbIFf-0000jn-O5
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 08:07:39 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4fe7bbf-2d8e-11ec-8227-12813bfff9fa;
 Fri, 15 Oct 2021 08:07:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B00791FD39;
 Fri, 15 Oct 2021 08:07:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 82C3713A9C;
 Fri, 15 Oct 2021 08:07:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FlS4Hsg2aWGgfgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 15 Oct 2021 08:07:36 +0000
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
X-Inumbo-ID: f4fe7bbf-2d8e-11ec-8227-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634285256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3zgN+myWPBqYFRmvK+j+wUzYK3zNb9TBfy2y3lYjKJI=;
	b=gjUxZbM3h8p6m0v8VUa78NvOx1WeoO2Jo9IELK51tdyGS0XP+1oBmhC0bv5zMQnUkrb1nd
	5/1EAHDjo8e3ONZxVAZhvg+JGPfWDlhHkAO/zJE+sHKIpg6RimAO21mgS9LgQrmfb8RPt2
	lMNvNFiQgaurL4ecXpMvDy0CYWYhvj8=
Subject: Re: [PATCH v6 1/3] usb: Add Xen pvUSB protocol description
To: Greg KH <greg@kroah.com>
Cc: linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20211013075207.13910-1-jgross@suse.com>
 <20211013075207.13910-2-jgross@suse.com> <YWbKnEMvHGU/rv96@kroah.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <54da6414-4183-2d0c-cc24-a9471ed8332b@suse.com>
Date: Fri, 15 Oct 2021 10:07:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YWbKnEMvHGU/rv96@kroah.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1AL0cPpr5ivk43VHNW6HPPQSETbcwK4QV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1AL0cPpr5ivk43VHNW6HPPQSETbcwK4QV
Content-Type: multipart/mixed; boundary="VIW7wmtVR3xkM2QJxXfKkqFg4bP298XiF";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Greg KH <greg@kroah.com>
Cc: linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <54da6414-4183-2d0c-cc24-a9471ed8332b@suse.com>
Subject: Re: [PATCH v6 1/3] usb: Add Xen pvUSB protocol description
References: <20211013075207.13910-1-jgross@suse.com>
 <20211013075207.13910-2-jgross@suse.com> <YWbKnEMvHGU/rv96@kroah.com>
In-Reply-To: <YWbKnEMvHGU/rv96@kroah.com>

--VIW7wmtVR3xkM2QJxXfKkqFg4bP298XiF
Content-Type: multipart/mixed;
 boundary="------------14B33D5C604B74B5090F9B0A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------14B33D5C604B74B5090F9B0A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 13.10.21 14:01, Greg KH wrote:
> On Wed, Oct 13, 2021 at 09:52:05AM +0200, Juergen Gross wrote:
>> Add the definition of pvUSB protocol used between the pvUSB frontend i=
n
>> a Xen domU and the pvUSB backend in a Xen driver domain (usually Dom0)=
=2E
>>
>> This header was originally provided by Fujitsu for Xen based on Linux
>> 2.6.18.
>>
>> Changes are:
>> - adapt to Linux kernel style guide
>> - use Xen namespace
>> - add lots of comments
>> - don't use kernel internal defines
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>> ---
>>   include/xen/interface/io/usbif.h | 421 +++++++++++++++++++++++++++++=
++
>>   1 file changed, 421 insertions(+)
>>   create mode 100644 include/xen/interface/io/usbif.h
>>
>> diff --git a/include/xen/interface/io/usbif.h b/include/xen/interface/=
io/usbif.h
>> new file mode 100644
>> index 000000000000..9494b1c9be99
>> --- /dev/null
>> +++ b/include/xen/interface/io/usbif.h
>> @@ -0,0 +1,421 @@
>> +/*
>> + * usbif.h
>> + *
>> + * USB I/O interface for Xen guest OSes.
>> + *
>> + * Copyright (C) 2009, FUJITSU LABORATORIES LTD.
>> + * Author: Noboru Iwamatsu <n_iwamatsu@jp.fujitsu.com>
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtain=
ing a copy
>> + * of this software and associated documentation files (the "Software=
"), to
>> + * deal in the Software without restriction, including without limita=
tion the
>> + * rights to use, copy, modify, merge, publish, distribute, sublicens=
e, and/or
>> + * sell copies of the Software, and to permit persons to whom the Sof=
tware is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be inc=
luded in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT =
SHALL THE
>> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR O=
THER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING
>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHE=
R
>> + * DEALINGS IN THE SOFTWARE.
>> + */
>=20
> Please use a SPDX line and not license "boilerplate" text like this :(

Okay. Is this your only concern for this series? Or is it a blocking
point for you before looking into it in more detail?

IOW: does it make sense for me to wait for further comments before
sending a new version of the series?


Juergen

--------------14B33D5C604B74B5090F9B0A
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------14B33D5C604B74B5090F9B0A--

--VIW7wmtVR3xkM2QJxXfKkqFg4bP298XiF--

--1AL0cPpr5ivk43VHNW6HPPQSETbcwK4QV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFpNscFAwAAAAAACgkQsN6d1ii/Ey9I
oQf+JHfh17hWBy1gUj3DRKyBJD5Y3mI+TOUvtyUzxOTKkfrJCL9PhsxKNU9Fk79GhrCuwsjNRxiA
1u4TNChP5ejQn8ohgQ/jCQlq5hvvSblEixbMXOzf8U4Mu66+fSPUofu3AF2awHlrBRM9GSFFlb0n
UAMgXt+DYjAywwI4jkyDosYXscBiBybZtPYNmuIlRZxtwsz53Knh3cdT8rugoXGyq1C/Salepf++
nS8XzgZg/QfRcuuS3wNKp0NC8QxlKOTc9w6zPa1rwT828dHjayiY0YtjV6XE8ncocmhpd+j+us1c
u04/VwImDRDChbK69ujnfeXBmBi6NHC3HscdedQhdA==
=bvvE
-----END PGP SIGNATURE-----

--1AL0cPpr5ivk43VHNW6HPPQSETbcwK4QV--

