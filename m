Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 431C548C334
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 12:32:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256571.440425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7brg-0004dA-TM; Wed, 12 Jan 2022 11:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256571.440425; Wed, 12 Jan 2022 11:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7brg-0004aJ-QI; Wed, 12 Jan 2022 11:32:28 +0000
Received: by outflank-mailman (input) for mailman id 256571;
 Wed, 12 Jan 2022 11:32:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSVc=R4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7brf-0004Xt-BY
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 11:32:27 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50d4f2f1-739b-11ec-9c70-5536b2d1e4e1;
 Wed, 12 Jan 2022 12:32:25 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6797E218E6;
 Wed, 12 Jan 2022 11:32:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4094913B42;
 Wed, 12 Jan 2022 11:32:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 46WADkm83mE/FQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 12 Jan 2022 11:32:25 +0000
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
X-Inumbo-ID: 50d4f2f1-739b-11ec-9c70-5536b2d1e4e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641987145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eMvdzorta42Ya0fr9SWXzplMPwcOKwBhZz6kh21VkQU=;
	b=b9Xw1tC0hijT0OlGyuWRQGsdVRHpSmvt6PPLqckJFshju5KPF2bVKw4LA54ZAMTPLIpRdL
	/x57MBscChsIL4+j4+/2KAodD9W4gNOX/pR20fL1XKAnbgzxqe8kKqtg5MkmoRJxCJNq0k
	7xtjhkBoWEsnpNz2plfm+rNbss3n4eA=
Subject: Re: [PATCH v2 10/12] mini-os: add struct file_ops for file type
 socket
To: Andrew Cooper <amc96@srcf.net>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-11-jgross@suse.com>
 <659743cb-abc9-31b5-d6b2-0a21aa76bbb4@srcf.net>
From: Juergen Gross <jgross@suse.com>
Message-ID: <cf84e6f4-efcb-e206-5cc0-769fe6399de5@suse.com>
Date: Wed, 12 Jan 2022 12:32:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <659743cb-abc9-31b5-d6b2-0a21aa76bbb4@srcf.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GcR583zDw8ysJBNlY1wNTSt8p40QHj58M"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GcR583zDw8ysJBNlY1wNTSt8p40QHj58M
Content-Type: multipart/mixed; boundary="rxS368b4vpEaeEMrVpCx481MrTpmO0jXa";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <amc96@srcf.net>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
Message-ID: <cf84e6f4-efcb-e206-5cc0-769fe6399de5@suse.com>
Subject: Re: [PATCH v2 10/12] mini-os: add struct file_ops for file type
 socket
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-11-jgross@suse.com>
 <659743cb-abc9-31b5-d6b2-0a21aa76bbb4@srcf.net>
In-Reply-To: <659743cb-abc9-31b5-d6b2-0a21aa76bbb4@srcf.net>

--rxS368b4vpEaeEMrVpCx481MrTpmO0jXa
Content-Type: multipart/mixed;
 boundary="------------A1FDA99D8985E049B4B30829"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A1FDA99D8985E049B4B30829
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12.01.22 12:28, Andrew Cooper wrote:
> On 11/01/2022 15:12, Juergen Gross wrote:
>> diff --git a/lib/sys.c b/lib/sys.c
>> index 3a8aa68..12deaed 100644
>> --- a/lib/sys.c
>> +++ b/lib/sys.c
>> @@ -99,11 +99,70 @@ static struct file_ops file_ops_none =3D {
>>       .name =3D "none",
>>   };
>>  =20
>> +#ifdef HAVE_LWIP
>> +static int socket_read(int fd, void *buf, size_t nbytes)
>> +{
>> +    return lwip_read(fd, buf, nbytes);
>> +}
>> +
>> +static int socket_write(int fd, const void *buf, size_t nbytes)
>> +{
>> +    return lwip_write(fd, (void *)buf, nbytes);
>> +}
>> +
>> +static int close_socket_fd(int fd)
>> +{
>> +    struct file *file =3D get_file_from_fd(fd);
>> +
>> +    return lwip_close(file->fd);
>> +}
>=20
> Actually, on further thoughts...
>=20
>> +static struct file_ops socket_ops =3D {
>> +    .name =3D "socket",
>> +    .read =3D socket_read,
>> +    .write =3D socket_write,
>> +    .close =3D close_socket_fd,
>> +    .fstat =3D socket_fstat,
>> +    .fcntl =3D socket_fcntl,
>> +};
>=20
> read, write and close should dispatch directly to lwip_* and not bounce=

> through a no-op local function.

Not with changing the first parameter to struct file *.

BTW, this patch had a bug, as the calls need to use file->fd instead of
fd.


Juergen

--------------A1FDA99D8985E049B4B30829
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

--------------A1FDA99D8985E049B4B30829--

--rxS368b4vpEaeEMrVpCx481MrTpmO0jXa--

--GcR583zDw8ysJBNlY1wNTSt8p40QHj58M
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHevEgFAwAAAAAACgkQsN6d1ii/Ey/0
+wf+KvhMxYFTHIudZ+A2MSKm5mzsrcOgcVsxcnVB3usK4t0o1h+tPNrxfviTmo89wwX7Z2gYKBXp
E9WCYuDxQfQI5wThLrsc4uKBJkKr2gU2xz0Xk8QS2y13QJRzrXFIAuxvVM+WaBRyaoVQTp6cpfcr
CZWTNbsmeHkr3to2AdYmNjRvGs5RIJPz+CAJwEkLpVMWa86nq1D3xiTmYDUPUScFG5Yv1v9yBWvr
O8FDU3q6k3zDnPkVOSNXUGX1QgxrgLhD67CPPe+m/1J5OCmzg2NrFPb8s2EtyH6qQPXTh6W1HhkZ
uAxfPfcs+N+VYjNCLZYSETmWMPHqDkrM8JwSNp0bpQ==
=OvWj
-----END PGP SIGNATURE-----

--GcR583zDw8ysJBNlY1wNTSt8p40QHj58M--

