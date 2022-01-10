Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE674898DA
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 13:49:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255344.437518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6u74-0001mD-Ss; Mon, 10 Jan 2022 12:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255344.437518; Mon, 10 Jan 2022 12:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6u74-0001jj-Pz; Mon, 10 Jan 2022 12:49:26 +0000
Received: by outflank-mailman (input) for mailman id 255344;
 Mon, 10 Jan 2022 12:49:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MsG/=R2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n6u73-0001jd-C1
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 12:49:25 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc988592-7213-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 13:49:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ACF3B2113D;
 Mon, 10 Jan 2022 12:49:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8D9CE13B04;
 Mon, 10 Jan 2022 12:49:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PGhMIVMr3GEaIQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 10 Jan 2022 12:49:23 +0000
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
X-Inumbo-ID: bc988592-7213-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641818963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+D3bRxWIH0WMv/xyHMAqfxBxtSYLVoFKUI5ox4GXMTM=;
	b=SVF7CNUJCvUjKG3tpURXDnnqxt8wA+FPQL1RwU4xWsRSXU5ssmHZthbxxOSVsg7OlkYWZJ
	iFXVhZ59i0PiYK7teBna0yTVjsPq1yyqgceCr9J2tQNc0THb6F1lJpsPuWi4u3Ikdyq9dd
	Iod8U32HyfvRz+lVkkZhynPtmMd4vB4=
Subject: Re: [PATCH 1/2] tools/libs/evtchn: decouple more from mini-os
To: Andrew Cooper <amc96@srcf.net>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220107103544.9271-1-jgross@suse.com>
 <20220107103544.9271-2-jgross@suse.com>
 <06bcb18f-5e85-0fc1-86e8-857cb296645f@srcf.net>
From: Juergen Gross <jgross@suse.com>
Message-ID: <afa9ce9e-e85d-3886-98db-1e99203c9c89@suse.com>
Date: Mon, 10 Jan 2022 13:49:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <06bcb18f-5e85-0fc1-86e8-857cb296645f@srcf.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ItYcMFRolmfGULAmheMFTp4uyap4hF4In"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ItYcMFRolmfGULAmheMFTp4uyap4hF4In
Content-Type: multipart/mixed; boundary="XqERSVA1it8JaBH873i7ksSFGgalrI6GZ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <amc96@srcf.net>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <afa9ce9e-e85d-3886-98db-1e99203c9c89@suse.com>
Subject: Re: [PATCH 1/2] tools/libs/evtchn: decouple more from mini-os
References: <20220107103544.9271-1-jgross@suse.com>
 <20220107103544.9271-2-jgross@suse.com>
 <06bcb18f-5e85-0fc1-86e8-857cb296645f@srcf.net>
In-Reply-To: <06bcb18f-5e85-0fc1-86e8-857cb296645f@srcf.net>

--XqERSVA1it8JaBH873i7ksSFGgalrI6GZ
Content-Type: multipart/mixed;
 boundary="------------1B17F3FB4840E231B01CF670"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1B17F3FB4840E231B01CF670
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10.01.22 13:25, Andrew Cooper wrote:
> On 07/01/2022 10:35, Juergen Gross wrote:
>> diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
>> index e5dfdc5ef5..3305102f22 100644
>> --- a/tools/libs/evtchn/minios.c
>> +++ b/tools/libs/evtchn/minios.c
>> @@ -38,16 +38,27 @@
>>  =20
>>   #include "private.h"
>>  =20
>> +LIST_HEAD(port_list, port_info);
>> +
>> +struct port_info {
>> +    LIST_ENTRY(port_info) list;
>> +    evtchn_port_t port;
>> +    unsigned long pending;
>> +    int bound;
>=20
> Now this is private, it's even more clear that pending and bound are bo=
ol's.
>=20
> Making this adjustment drops 16 bytes from the structure.

Already done in V2. :-)

>=20
>> +};
>> +
>>   extern void minios_evtchn_close_fd(int fd);
>>  =20
>>   extern struct wait_queue_head event_queue;
>>  =20
>>   /* XXX Note: This is not threadsafe */
>> -static struct evtchn_port_info *port_alloc(int fd)
>> +static struct port_info *port_alloc(int fd)
>>   {
>> -    struct evtchn_port_info *port_info;
>> +    struct port_info *port_info;
>> +    struct file *file =3D get_file_from_fd(fd);
>> +    struct port_list *port_list =3D file->dev;
>=20
> This would be rather more obviously correct if port_alloc() took xce
> rather than fd.
>=20
> It is reasonable to assume that xce->fd is good, and that
> get_file_from_fd(xce->fd) will be non-null, but the current logic makes=

> this very opaque.

Good point. Will change.

>=20
>> @@ -75,12 +86,25 @@ static void port_dealloc(struct evtchn_port_info *=
port_info)
>>    */
>>   int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
>>   {
>> -    int fd =3D alloc_fd(FTYPE_EVTCHN);
>> +    int fd;
>> +    struct file *file;
>> +    struct port_list *list;
>> +
>> +    list =3D malloc(sizeof(*list));
>> +    if ( !list )
>> +        return -1;
>> +
>> +    fd =3D alloc_fd(FTYPE_EVTCHN);
>> +    file =3D get_file_from_fd(fd);
>>  =20
>> -    if ( fd =3D=3D -1 )
>> +    if ( !file )
>> +    {
>> +        free(list);
>>           return -1;
>> +    }
>=20
> This wants rearranging to keep alloc_fd() ahead of malloc().=C2=A0 With=
 that,
> there is no need for free(list) in this error path.

Yeah, but the error path of malloc() having failed is quite nasty then.

>> -    LIST_INIT(&files[fd].evtchn.ports);
>> +    file->dev =3D list;
>> +    LIST_INIT(list);
>>       xce->fd =3D fd;
>>       printf("evtchn_open() -> %d\n", fd);
>>  =20
>> @@ -104,12 +128,15 @@ int osdep_evtchn_restrict(xenevtchn_handle *xce,=
 domid_t domid)
>>  =20
>>   void minios_evtchn_close_fd(int fd)
>=20
> Something very broken is going on here.=C2=A0 The top of evtchn.c decla=
res:
>=20
> extern void minios_evtchn_close_fd(int fd);
>=20
> I'm surprised that the compiler doesn't object to instantiating a
> function which has previously been declared extern.

Will be gone in V2, by making it static.

> Furthermore, in minios itself.
>=20
> lib/sys.c:91:extern void minios_evtchn_close_fd(int fd);
> lib/sys.c:447:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minios_evtchn_close_fd(fd)=
;
>=20
> So lib/sys.c locally extern's this function too.=C2=A0 It needs to be i=
n the
> public API if it is used like this, but surely the better thing is to
> wire up xenevtchn_close() properly.
>=20
>>   {
>> -    struct evtchn_port_info *port_info, *tmp;
>> +    struct port_info *port_info, *tmp;
>> +    struct file *file =3D get_file_from_fd(fd);
>> +    struct port_list *port_list =3D file->dev;
>=20
> Is it safe to assume that fd is good here?

Yes.

>=20
>> @@ -273,15 +305,17 @@ xenevtchn_port_or_error_t xenevtchn_bind_virq(xe=
nevtchn_handle *xce,
>>   xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
>>   {
>>       int fd =3D xce->fd;
>> -    struct evtchn_port_info *port_info;
>> +    struct file *file =3D get_file_from_fd(fd);
>=20
> You've dropped all uses of 'fd' from this function, so why not drop the=

> local variable and use xce->fd here?

Yes.


Juergen


--------------1B17F3FB4840E231B01CF670
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

--------------1B17F3FB4840E231B01CF670--

--XqERSVA1it8JaBH873i7ksSFGgalrI6GZ--

--ItYcMFRolmfGULAmheMFTp4uyap4hF4In
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHcK1MFAwAAAAAACgkQsN6d1ii/Ey/o
qgf7BRQfgIqQZXy0xpB1IzXh2oHr6m5SHibpx7CHlqiGwbtb7Z/HKV02q5SbTAN7teoe9FLQm2gZ
Yqy49lOr8oDqkv4h1jf1WZg9WmTDKXS0SXSrjX6vLL6BEdD3245bGf5yIhMnPVowe3PpY9XDkOxF
PKZymZnB5DBSYhJWYqLlocejX0/jj8KDOTDo7Hoza1pAN5Bs0IGGs3Qvk17WfvDxQd+xVw9wNzyS
Qi047qe1iomhmj2EGhAO93x7OOYjWLb9IcQQMk0VsJVR/rkbSTJZyDCRXcmjdC1GBAhYZw+5Cq7t
ylNMppJwsEG0qo7BxiZYJXmiopWshKZOG0vFZ53AMw==
=ULFU
-----END PGP SIGNATURE-----

--ItYcMFRolmfGULAmheMFTp4uyap4hF4In--

