Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDEE48BF5C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 08:57:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256338.439824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7YVN-0004v0-AO; Wed, 12 Jan 2022 07:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256338.439824; Wed, 12 Jan 2022 07:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7YVN-0004sw-7I; Wed, 12 Jan 2022 07:57:13 +0000
Received: by outflank-mailman (input) for mailman id 256338;
 Wed, 12 Jan 2022 07:57:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSVc=R4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7YVL-0004qf-6D
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 07:57:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e337b6e-737d-11ec-9ce5-af14b9085ebd;
 Wed, 12 Jan 2022 08:57:09 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 23B9C21123;
 Wed, 12 Jan 2022 07:57:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 018CF13E10;
 Wed, 12 Jan 2022 07:57:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hm8SOtSJ3mEIGQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 12 Jan 2022 07:57:08 +0000
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
X-Inumbo-ID: 3e337b6e-737d-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641974229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DoxsaNjgHsTESg7pJau2nkw4GFuS687AqbBCr4DynRM=;
	b=Z8+yFintsw0+tq8SiWnAVE5FgwH7N9GQuxip/gv64vNwCT7RHrADS/ocRdT5VVYizDr48z
	i/1LC6vNm22HnhGKVt1esEQMvdq2lHS9fzKVqp1zQfbe9wzryPQxe+t2XEYf401AZzAy8W
	oMxiZ1BmWIjmvfSWRm7+wLFcQEzSmPs=
Subject: Re: [PATCH v2 09/12] mini-os: use file_ops and get_file_from_fd() for
 console
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-10-jgross@suse.com>
 <20220111203501.tywfn4czhwavhgrf@begin>
From: Juergen Gross <jgross@suse.com>
Message-ID: <bb7d4313-2500-3e60-8a51-93e909739c90@suse.com>
Date: Wed, 12 Jan 2022 08:57:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20220111203501.tywfn4czhwavhgrf@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PLvpBkRijSY4uPCJ9lGjFLYi4wXmC9nb6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PLvpBkRijSY4uPCJ9lGjFLYi4wXmC9nb6
Content-Type: multipart/mixed; boundary="0W2V7LbSkIGyKqt9FNI0Fx5UhfeFO4NjS";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
Message-ID: <bb7d4313-2500-3e60-8a51-93e909739c90@suse.com>
Subject: Re: [PATCH v2 09/12] mini-os: use file_ops and get_file_from_fd() for
 console
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-10-jgross@suse.com>
 <20220111203501.tywfn4czhwavhgrf@begin>
In-Reply-To: <20220111203501.tywfn4czhwavhgrf@begin>

--0W2V7LbSkIGyKqt9FNI0Fx5UhfeFO4NjS
Content-Type: multipart/mixed;
 boundary="------------3F6770108827E3580B54194D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------3F6770108827E3580B54194D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11.01.22 21:35, Samuel Thibault wrote:
> Juergen Gross, le mar. 11 janv. 2022 16:12:12 +0100, a ecrit:
>> +static int consfront_fstat(int fd, struct stat *buf)
>> +{
>> +    struct file *file =3D get_file_from_fd(fd);
>> +
>> +    buf->st_mode =3D S_IRUSR | S_IWUSR;
>> +    buf->st_mode |=3D (file->type =3D=3D FTYPE_CONSOLE) ? S_IFCHR : S=
_IFREG;
>> +    buf->st_atime =3D buf->st_mtime =3D buf->st_ctime =3D time(NULL);=

>> +
>> +    return 0;
>> +}
>=20
> This seems to be missing filling st_uid, st_gid, etc.?

Not really. Those are set to zero via the call of init_stat()
in fstat().


Juergen

--------------3F6770108827E3580B54194D
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

--------------3F6770108827E3580B54194D--

--0W2V7LbSkIGyKqt9FNI0Fx5UhfeFO4NjS--

--PLvpBkRijSY4uPCJ9lGjFLYi4wXmC9nb6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHeidMFAwAAAAAACgkQsN6d1ii/Ey8C
Lwf+PYUVsUVFwvyJ8uBpkwccVOCnT/OuRV2iS6p7iaQ0rCUi/4joHE97NCYmE16z6oCiFLECOqLD
ne8ehDaFI2UYK+9OeHX7oCK9a+XKosJwiG7P24RwP2grFiwGGOx96y8cejKMmlrNEsbww4ZWJX4I
avkh9s789Qk6Nci3mQPwvB9f840myFsNfD/Re+WPzA64355nfeRyY01ioGd7MI5rr0u+R4FLq2h3
Yeub6/NqZlePDzwcUTYd5G8JKvwYsTnfiVxHBAbTMvFXE8ENN+iD0pibjALRKaE5bD+rdiQmxlgu
cwPsQi7e3l82RDevt5cCWForkKFIvauWUtrP7+1CnQ==
=2X8o
-----END PGP SIGNATURE-----

--PLvpBkRijSY4uPCJ9lGjFLYi4wXmC9nb6--

