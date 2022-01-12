Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B3848BFC4
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 09:22:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256372.439885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Ytl-0002Eh-Jv; Wed, 12 Jan 2022 08:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256372.439885; Wed, 12 Jan 2022 08:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Ytl-0002CG-Gs; Wed, 12 Jan 2022 08:22:25 +0000
Received: by outflank-mailman (input) for mailman id 256372;
 Wed, 12 Jan 2022 08:22:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSVc=R4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7Ytk-0002Bn-63
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 08:22:24 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c44b9c79-7380-11ec-9ce5-af14b9085ebd;
 Wed, 12 Jan 2022 09:22:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A06F9212FE;
 Wed, 12 Jan 2022 08:22:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 72DB713B2D;
 Wed, 12 Jan 2022 08:22:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ++xEGr6P3mG7JwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 12 Jan 2022 08:22:22 +0000
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
X-Inumbo-ID: c44b9c79-7380-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641975742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FKItPEUI7pf6sItCPZzvaufN4aoECeCfTQdu9BEtzxg=;
	b=FhoCGUQFpboG5Ol1sypP9cR5OH0DLxYw06PAde3hwX5rkFpfFDobMYY8yipoWDg5Q3NAOp
	WrD02r6xpUVytltk220gAOf8ZuUSdKS6gYpVeka4zWgmz63m3x2xkZyKpDYkgmEKu2UNYt
	6cXQFVByHS7ox2QUI6GiVmoSd5bvi/Y=
Subject: Re: [PATCH v2 17/18] mini-os: use function vectors instead of switch
 for file operations
To: Andrew Cooper <amc96@srcf.net>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220111145817.22170-1-jgross@suse.com>
 <20220111145817.22170-18-jgross@suse.com>
 <a2d4c905-c477-8553-85a7-90168d914b6e@srcf.net>
 <08672989-53be-1551-f001-0d2c0435b586@suse.com>
 <559223b1-68c1-87fb-7b7b-190f8671b4c2@srcf.net>
From: Juergen Gross <jgross@suse.com>
Message-ID: <d46a971c-d1d3-3b34-a7ed-72993794cff8@suse.com>
Date: Wed, 12 Jan 2022 09:22:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <559223b1-68c1-87fb-7b7b-190f8671b4c2@srcf.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="W22var4iBcFz7w8czGU65G56eXkO74ClW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--W22var4iBcFz7w8czGU65G56eXkO74ClW
Content-Type: multipart/mixed; boundary="bBdyGxgh5A6HGnH8u5mhYkpn79SDPVquS";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <amc96@srcf.net>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
Message-ID: <d46a971c-d1d3-3b34-a7ed-72993794cff8@suse.com>
Subject: Re: [PATCH v2 17/18] mini-os: use function vectors instead of switch
 for file operations
References: <20220111145817.22170-1-jgross@suse.com>
 <20220111145817.22170-18-jgross@suse.com>
 <a2d4c905-c477-8553-85a7-90168d914b6e@srcf.net>
 <08672989-53be-1551-f001-0d2c0435b586@suse.com>
 <559223b1-68c1-87fb-7b7b-190f8671b4c2@srcf.net>
In-Reply-To: <559223b1-68c1-87fb-7b7b-190f8671b4c2@srcf.net>

--bBdyGxgh5A6HGnH8u5mhYkpn79SDPVquS
Content-Type: multipart/mixed;
 boundary="------------2F50F40C2F1CACFB0E92204E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2F50F40C2F1CACFB0E92204E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12.01.22 09:19, Andrew Cooper wrote:
> On 12/01/2022 07:34, Juergen Gross wrote:
>> On 11.01.22 19:08, Andrew Cooper wrote:
>>> On 11/01/2022 14:58, Juergen Gross wrote:
>>>> +
>>>> +off_t lseek_default(int fd, off_t offset, int whence);
>>>> +bool select_yes(int fd);
>>>> +bool select_read_flag(int fd);
>>>> +
>>>>  =C2=A0 LIST_HEAD(evtchn_port_list, evtchn_port_info);
>>>>  =C2=A0 =C2=A0 struct evtchn_port_info {
>>>> @@ -183,7 +210,7 @@ struct evtchn_port_info {
>>>>  =C2=A0 };
>>>>  =C2=A0 =C2=A0 struct file {
>>>> -=C2=A0=C2=A0=C2=A0 enum fd_type type;
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int type;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool read;=C2=A0=C2=A0=C2=A0 /* mayb=
e available for read */
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 off_t offset;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union {
>>>> @@ -199,7 +226,7 @@ struct file {
>>>>  =C2=A0 extern struct file files[];
>>>>  =C2=A0 =C2=A0 struct file *get_file_from_fd(int fd);
>>>> -int alloc_fd(enum fd_type type);
>>>> +int alloc_fd(unsigned int type);
>>>>  =C2=A0 void close_all_files(void);
>>>>  =C2=A0 extern struct thread *main_thread;
>>>>  =C2=A0 void sparse(unsigned long data, size_t size);
>>>> diff --git a/lib/sys.c b/lib/sys.c
>>>> index 323a7cd..c327247 100644
>>>> --- a/lib/sys.c
>>>> +++ b/lib/sys.c
>>>> @@ -98,6 +98,39 @@ struct file files[NOFILE] =3D {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { .type =3D FTYPE_CONSOLE }, /* stde=
rr */
>>>>  =C2=A0 };
>>>>  =C2=A0 +static struct file_ops file_ops_none =3D {
>>>> +=C2=A0=C2=A0=C2=A0 .name =3D "none",
>>>> +};
>>>> +
>>>> +static struct file_ops *file_ops[FTYPE_N + FTYPE_SPARE] =3D {
>>>> +=C2=A0=C2=A0=C2=A0 [FTYPE_NONE] =3D &file_ops_none,
>>>> +};
>>>
>>> Both want to be const, because all file_ops ought to live in rodata.
>>
>> file_ops[] can't be const, it will just point to const data.
>=20
> Oh, of course.
>=20
>>>> @@ -709,6 +805,18 @@ static void dump_pollfds(struct pollfd *pfd,
>>>> int nfds, int timeout)
>>>>  =C2=A0 #define dump_pollfds(pfds, nfds, timeout)
>>>>  =C2=A0 #endif
>>>>  =C2=A0 +bool select_yes(int fd)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 return true;
>>>> +}
>>>> +
>>>> +bool select_read_flag(int fd)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct file *file =3D get_file_from_fd(fd);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return file->read;
>>>> +}
>>>
>>> I don't see these getting used, even in a fallback case.
>>
>> They will be used in later patches.
>=20
> Yeah - I found them in later patches.=C2=A0 It's probably worth a note =
in the
> commit message saying "provide some functions useful for file_ops in
> future patches", particularly as it's actually a later series which
> takes them (due to the ordering constraints).

Okay, will add that note.


Juergen

--------------2F50F40C2F1CACFB0E92204E
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

--------------2F50F40C2F1CACFB0E92204E--

--bBdyGxgh5A6HGnH8u5mhYkpn79SDPVquS--

--W22var4iBcFz7w8czGU65G56eXkO74ClW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHej70FAwAAAAAACgkQsN6d1ii/Ey9R
bQf+LoVbc17nessp8jx2KgiOsajmotA3/TMu6v7vaiIlxdAsQH3Rx8QkJVp0rBNf6kkKU/K2E2NG
5i2wGnMV/8QSMnps4KRXR7lOp3wXL4mVgJWGuKx2MBMhu8yO3y60yB6UWidUWwL+sk3pyEv+WXrn
5h8r57lTcQEXvUe53EEDHp7XE/eRjdMUEek+r6Pd4lAuCMT6PpciOU7Y23VOIGOZh7mAibilSro9
UNPLl7TWoNxlkQdy9mt2KyObPLJrhbxYwcAQxFe7Er0ZGZ5UDq9vdHoAcZ+wlHRfMbbLr3UY8BnW
N3G4Ok1i+DhKueiTlstH9aCuDdKHt4a3iG9D0tgw7g==
=Y03c
-----END PGP SIGNATURE-----

--W22var4iBcFz7w8czGU65G56eXkO74ClW--

