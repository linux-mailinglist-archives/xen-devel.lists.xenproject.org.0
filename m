Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD1D48A797
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 07:09:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255605.438036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ALI-0003A8-O3; Tue, 11 Jan 2022 06:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255605.438036; Tue, 11 Jan 2022 06:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ALI-000379-KQ; Tue, 11 Jan 2022 06:09:12 +0000
Received: by outflank-mailman (input) for mailman id 255605;
 Tue, 11 Jan 2022 06:09:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7ALH-000373-VG
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 06:09:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fde9932a-72a4-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 07:09:10 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DAFC421119;
 Tue, 11 Jan 2022 06:09:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B804313A42;
 Tue, 11 Jan 2022 06:09:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bP96KwUf3WFxWgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 06:09:09 +0000
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
X-Inumbo-ID: fde9932a-72a4-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641881349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2v6txgZcVQz/rHaqrvBny9JYlM1CC7PomD7hUvKuLnI=;
	b=a1kjwjYA6MVZRT0UDAkh9aVfhhkZGnjHUpl5pbiyZKw+1uVr93Qjl/uw2LHCquqLDCyxj7
	CYzpzmr9XyXLn5QtOL49L2p5xHs4GZQbFCwSX9O2IH1w1vnlG9TjTA572j4xiRv8Lw4HCe
	wZejFxBDiJj7Cfehq1l/xZyRaBz4Zuo=
To: Andrew Cooper <amc96@srcf.net>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220107103544.9271-1-jgross@suse.com>
 <20220107103544.9271-2-jgross@suse.com>
 <06bcb18f-5e85-0fc1-86e8-857cb296645f@srcf.net>
 <afa9ce9e-e85d-3886-98db-1e99203c9c89@suse.com>
 <6df1ee3f-c14c-8016-397e-0ed12b9e3a82@srcf.net>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] tools/libs/evtchn: decouple more from mini-os
Message-ID: <b07c6b84-53c8-0556-413c-dba3a8d3941b@suse.com>
Date: Tue, 11 Jan 2022 07:09:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <6df1ee3f-c14c-8016-397e-0ed12b9e3a82@srcf.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nh1buaIk0zd5H3RkViUvCMD6LCazJZfFk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nh1buaIk0zd5H3RkViUvCMD6LCazJZfFk
Content-Type: multipart/mixed; boundary="dT1hx8HK6jUmkpIelu6l4sp5y4BsDeHWL";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <amc96@srcf.net>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <b07c6b84-53c8-0556-413c-dba3a8d3941b@suse.com>
Subject: Re: [PATCH 1/2] tools/libs/evtchn: decouple more from mini-os
References: <20220107103544.9271-1-jgross@suse.com>
 <20220107103544.9271-2-jgross@suse.com>
 <06bcb18f-5e85-0fc1-86e8-857cb296645f@srcf.net>
 <afa9ce9e-e85d-3886-98db-1e99203c9c89@suse.com>
 <6df1ee3f-c14c-8016-397e-0ed12b9e3a82@srcf.net>
In-Reply-To: <6df1ee3f-c14c-8016-397e-0ed12b9e3a82@srcf.net>

--dT1hx8HK6jUmkpIelu6l4sp5y4BsDeHWL
Content-Type: multipart/mixed;
 boundary="------------08844A3C5D0BA4E4CF648DE4"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------08844A3C5D0BA4E4CF648DE4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10.01.22 19:51, Andrew Cooper wrote:
> On 10/01/2022 12:49, Juergen Gross wrote:
>> On 10.01.22 13:25, Andrew Cooper wrote:
>>> On 07/01/2022 10:35, Juergen Gross wrote:
>>>> @@ -75,12 +86,25 @@ static void port_dealloc(struct evtchn_port_info=

>>>> *port_info)
>>>>  =C2=A0=C2=A0 */
>>>>  =C2=A0 int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int fl=
ags)
>>>>  =C2=A0 {
>>>> -=C2=A0=C2=A0=C2=A0 int fd =3D alloc_fd(FTYPE_EVTCHN);
>>>> +=C2=A0=C2=A0=C2=A0 int fd;
>>>> +=C2=A0=C2=A0=C2=A0 struct file *file;
>>>> +=C2=A0=C2=A0=C2=A0 struct port_list *list;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 list =3D malloc(sizeof(*list));
>>>> +=C2=A0=C2=A0=C2=A0 if ( !list )
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 fd =3D alloc_fd(FTYPE_EVTCHN);
>>>> +=C2=A0=C2=A0=C2=A0 file =3D get_file_from_fd(fd);
>>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 if ( fd =3D=3D -1 )
>>>> +=C2=A0=C2=A0=C2=A0 if ( !file )
>>>> +=C2=A0=C2=A0=C2=A0 {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free(list);
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>
>>> This wants rearranging to keep alloc_fd() ahead of malloc().=C2=A0 Wi=
th that,
>>> there is no need for free(list) in this error path.
>>
>> Yeah, but the error path of malloc() having failed is quite nasty then=
=2E
>=20
> Oh yeah.=C2=A0 This is ugly, but I guess it is better this way around.

Please define "this way around". Do you mean like it is in my patch, or
with the malloc() after alloc_fd()?

With your suggestion I'm basically having an error path with close() in
it, while with my variant I'm having one with free() in it. I'd rather
have a local handling doing free(), than to use another external call to
close() for a half opened file.


Juergen

--------------08844A3C5D0BA4E4CF648DE4
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

--------------08844A3C5D0BA4E4CF648DE4--

--dT1hx8HK6jUmkpIelu6l4sp5y4BsDeHWL--

--nh1buaIk0zd5H3RkViUvCMD6LCazJZfFk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHdHwUFAwAAAAAACgkQsN6d1ii/Ey//
nQf/Sk/DsNdF5DRJ2iu+OIAGVwW6s0G7ccqzfbxg/HM8sDftYqUkqRuhargU5nMXwiJDy78WNFu3
OqVGo9pOE9aBVZ1X3t05feZpzLuW5ME2a6CZxkJa9NBy+p2vhr/3bmPEtCuFGvwySDUvKQyp0URP
ny7dLMW4GdXWgTqlSXVpOPbJmxC3mlDGa/QriPArAjxUG0BD2VvSVdMxj8wb1QPHEkP+nuJ/ujoq
61FrbK6ApNr4iXVJw/3wi7rhlXWlUfLzBHm99czOqidwYnKTWmQ8kAeRNb63WVGuLKb1BKhSEY8C
Gwoffh+dtgbhoSyCyfNn74bG5DOrYdNV3A+CixPESw==
=F828
-----END PGP SIGNATURE-----

--nh1buaIk0zd5H3RkViUvCMD6LCazJZfFk--

