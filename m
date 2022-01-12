Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A28B48BF4F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 08:55:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256332.439810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7YT2-00049d-Ne; Wed, 12 Jan 2022 07:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256332.439810; Wed, 12 Jan 2022 07:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7YT2-000466-Jh; Wed, 12 Jan 2022 07:54:48 +0000
Received: by outflank-mailman (input) for mailman id 256332;
 Wed, 12 Jan 2022 07:54:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSVc=R4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7YT1-00045Y-EC
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 07:54:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e85964f5-737c-11ec-9ce5-af14b9085ebd;
 Wed, 12 Jan 2022 08:54:45 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3EAE01F3BB;
 Wed, 12 Jan 2022 07:54:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0FED613B2D;
 Wed, 12 Jan 2022 07:54:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id G62NAkWJ3mHyFwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 12 Jan 2022 07:54:45 +0000
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
X-Inumbo-ID: e85964f5-737c-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641974085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SRiBEagExziOY6AGzH3ykhtfCA+oYAzxbQdZEWcOKgk=;
	b=tQpqo6oaBI0tWjQSbRb6O7yp2JkrNMe4xIIjE2PMD0SLSvrZ6HTD4XPd82AUVNMsYrZyWr
	a+eoevh/XuSETM+HY0xNJFU4qOm1JYplEm/EM6q11/a+sDTn+nkUKtPQFynXP7+93LgeOV
	re8OdX8SU9P0rVrZBClA89qGyKA/JdE=
Subject: Re: [PATCH v2 04/12] mini-os: use alloc_file_type() and
 get_file_from_fd() in tpm_tis
To: Andrew Cooper <amc96@srcf.net>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org,
 Jason Andryuk <jandryuk@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-5-jgross@suse.com>
 <95614df8-c22d-3e1e-b976-84bbed1b30be@srcf.net>
From: Juergen Gross <jgross@suse.com>
Message-ID: <5dba49ab-e901-3ee2-daee-5758eccdd474@suse.com>
Date: Wed, 12 Jan 2022 08:54:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <95614df8-c22d-3e1e-b976-84bbed1b30be@srcf.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ZQFXopqQNJMKD1MOjysciLQ1rGKvqhrEl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ZQFXopqQNJMKD1MOjysciLQ1rGKvqhrEl
Content-Type: multipart/mixed; boundary="aXhJojt8iFn7yoAcRreqoTKFyybsYvxik";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <amc96@srcf.net>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org,
 Jason Andryuk <jandryuk@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
Message-ID: <5dba49ab-e901-3ee2-daee-5758eccdd474@suse.com>
Subject: Re: [PATCH v2 04/12] mini-os: use alloc_file_type() and
 get_file_from_fd() in tpm_tis
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-5-jgross@suse.com>
 <95614df8-c22d-3e1e-b976-84bbed1b30be@srcf.net>
In-Reply-To: <95614df8-c22d-3e1e-b976-84bbed1b30be@srcf.net>

--aXhJojt8iFn7yoAcRreqoTKFyybsYvxik
Content-Type: multipart/mixed;
 boundary="------------D1D33A2092A6A1CA84D4F5D7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D1D33A2092A6A1CA84D4F5D7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11.01.22 21:29, Andrew Cooper wrote:
> On 11/01/2022 15:12, Juergen Gross wrote:
>> diff --git a/tpm_tis.c b/tpm_tis.c
>> index 477f555..abea7a1 100644
>> --- a/tpm_tis.c
>> +++ b/tpm_tis.c
>> @@ -1093,6 +1097,23 @@ ssize_t tpm_getcap(struct tpm_chip *chip, uint3=
2_t subcap_id, cap_t *cap,
>>           return rc;
>>   }
>>  =20
>> +static void shutdown_tpm_tis(struct tpm_chip* tpm){
>=20
> Style, as you're moving it.=C2=A0 Also in the function.
>=20
>> @@ -1360,6 +1369,35 @@ int tpm_tis_posix_fstat(int fd, struct stat* bu=
f)
>>      return 0;
>>   }
>>  =20
>> +static struct file_ops tpm_tis_ops =3D {
>> +    .name =3D "tpm_tis",
>> +    .read =3D tpm_tis_posix_read,
>> +    .write =3D tpm_tis_posix_write,
>> +    .lseek =3D lseek_default,
>> +    .close =3D tpm_tis_close,
>> +    .fstat =3D tpm_tis_posix_fstat,
>> +};
>> +
>> +int tpm_tis_open(struct tpm_chip* tpm)
>=20
> Style.

Ah, yes I should have corrected this while moving the function.

>=20
>> +{
>> +   struct file *file;
>> +   static unsigned int ftype_tis;
>> +
>> +   /* Silently prevent multiple opens */
>> +   if(tpm->fd !=3D -1) {
>> +      return tpm->fd;
>> +   }
>=20
> Another WTF moment.=C2=A0 We silently swallow multiple open()s, but don=
't
> refcout close()s ?
>=20
> This cannot be correct, or sensible, behaviour.
>=20
> Jason/Daniel - thoughts?

I just moved the function, but I can change this, of course.


Juergen

--------------D1D33A2092A6A1CA84D4F5D7
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

--------------D1D33A2092A6A1CA84D4F5D7--

--aXhJojt8iFn7yoAcRreqoTKFyybsYvxik--

--ZQFXopqQNJMKD1MOjysciLQ1rGKvqhrEl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHeiUQFAwAAAAAACgkQsN6d1ii/Ey/p
oggAnZkFKpvDP7SDKPNwET5ol194uwLJSMsKmC0mTvl5FptiwWTzcVqoRxGv1rOBueTZA2c57JXi
a66vdN/pnUWoGw7byCKt6edGGeasvfwMYjTxgnaThT9KEHU1XUxz9VpcsMqDlQ5+qygMpjOfNEkV
GSBANAcHnYNKQNjSkN64rlEVLtvVEqFkXW7WVgEl1z6AIjd5Tl0xHQ9GCSarilPnBTxBusUxWSrY
pkaaRYpMEJPxMYo/eCBUcdVu5Itwqvjo+38a8NHnuAxRU3AytNx6c3Pm6bTkjXkzWfnaL1nZasXl
Wpc84sF/+SWYIxZ+P92L9IpttH7kyIR1ZedYC0ClpA==
=Oxid
-----END PGP SIGNATURE-----

--ZQFXopqQNJMKD1MOjysciLQ1rGKvqhrEl--

