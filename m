Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BABB448BEF6
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 08:22:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256245.439604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Xxy-0000Qb-HE; Wed, 12 Jan 2022 07:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256245.439604; Wed, 12 Jan 2022 07:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Xxy-0000Nx-E3; Wed, 12 Jan 2022 07:22:42 +0000
Received: by outflank-mailman (input) for mailman id 256245;
 Wed, 12 Jan 2022 07:22:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSVc=R4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7Xxw-0000Nr-TS
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 07:22:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bfaf912-7378-11ec-9ce5-af14b9085ebd;
 Wed, 12 Jan 2022 08:22:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 44ED9212C9;
 Wed, 12 Jan 2022 07:22:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 18B2013B32;
 Wed, 12 Jan 2022 07:22:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +3RVBL6B3mHRCQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 12 Jan 2022 07:22:38 +0000
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
X-Inumbo-ID: 6bfaf912-7378-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641972158; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pr15ENFrPkHQEzNUZZLhSTiQ56HcSSAL+FkUKEftUSU=;
	b=opsytZL088kjwiF0VMglZ6JEWTBhHvELXuiTkbxfamahordfleQl34PBthV0kbJh9AinEc
	ELGx6Z3Jdiaix+aLvNlCqQB3AbrfRT5bAcGvxFssoYL6LKr19U3jvuAqX1Rxjeq5CwqZXJ
	Y0efURr7RYG04OVz4iRuxZPCICGQ9MA=
To: Andrew Cooper <amc96@srcf.net>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220111150318.22570-1-jgross@suse.com>
 <20220111150318.22570-2-jgross@suse.com>
 <a73bd0c2-44ee-c984-9c72-15d36afc8aa5@srcf.net>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/3] tools/libs/evtchn: decouple more from mini-os
Message-ID: <152c1627-e8e1-4f98-abe6-ee45a2fdebe0@suse.com>
Date: Wed, 12 Jan 2022 08:22:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <a73bd0c2-44ee-c984-9c72-15d36afc8aa5@srcf.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1FLIRTKkFocVjw4bH2R0znb9sVBjklTPu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1FLIRTKkFocVjw4bH2R0znb9sVBjklTPu
Content-Type: multipart/mixed; boundary="925mLoogs0xtUNuTzGrUwSLRDNLX9DAmS";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <amc96@srcf.net>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <152c1627-e8e1-4f98-abe6-ee45a2fdebe0@suse.com>
Subject: Re: [PATCH v2 1/3] tools/libs/evtchn: decouple more from mini-os
References: <20220111150318.22570-1-jgross@suse.com>
 <20220111150318.22570-2-jgross@suse.com>
 <a73bd0c2-44ee-c984-9c72-15d36afc8aa5@srcf.net>
In-Reply-To: <a73bd0c2-44ee-c984-9c72-15d36afc8aa5@srcf.net>

--925mLoogs0xtUNuTzGrUwSLRDNLX9DAmS
Content-Type: multipart/mixed;
 boundary="------------D34776A65E72BC8C4FC31F41"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D34776A65E72BC8C4FC31F41
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11.01.22 20:56, Andrew Cooper wrote:
> On 11/01/2022 15:03, Juergen Gross wrote:
>> diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
>> index e5dfdc5ef5..c3a5ce3b98 100644
>> --- a/tools/libs/evtchn/minios.c
>> +++ b/tools/libs/evtchn/minios.c
>> @@ -38,29 +38,40 @@
>>  =20
>>   #include "private.h"
>>  =20
>> -extern void minios_evtchn_close_fd(int fd);
>> +LIST_HEAD(port_list, port_info);
>> +
>> +struct port_info {
>> +    LIST_ENTRY(port_info) list;
>> +    evtchn_port_t port;
>> +    bool pending;
>> +    bool bound;
>> +};
>>  =20
>>   extern struct wait_queue_head event_queue;
>=20
> Yuck.=C2=A0 This should come from minios's evtchn header, rather than b=
eing
> extern'd like this, but lets consider that future cleanup work.

I think I should do that rather sooner than later.

>=20
>> +int minios_evtchn_close_fd(int fd);
>=20
> You don't need this forward declaration, because nothing in this file
> calls minios_evtchn_close_fd().=C2=A0 The extern should simply be delet=
ed,
> and it removes a hunk from your later xen.git series.

Without it I get a build error due to no prototype defined.

>=20
>> @@ -69,18 +80,54 @@ static void port_dealloc(struct evtchn_port_info *=
port_info)
>>       free(port_info);
>>   }
>>  =20
>> +int minios_evtchn_close_fd(int fd)
>> +{
>> +    struct port_info *port_info, *tmp;
>> +    struct file *file =3D get_file_from_fd(fd);
>> +    struct port_list *port_list =3D file->dev;
>=20
> Looking at this, the file_ops don't need to have the C ABI.
>=20
> The single caller already needs access to the file structure, so could
> pass both file and fd in to the ops->close() function.=C2=A0 Thoughts?

If we do this for close(), we should do it for all callbacks. I think we
don't need fd at all in the callbacks, so switching to file seems to be
the way to go.

>=20
>> +
>> +    LIST_FOREACH_SAFE(port_info, port_list, list, tmp)
>> +        port_dealloc(port_info);
>> +    free(port_list);
>> +
>> +    return 0;
>> +}
>> +
>> +static struct file_ops evtchn_ops =3D {
>=20
> This wants to become const, when alloc_file_type() has been
> appropriately const'd.

Yes.

>=20
>> +    .name =3D "evtchn",
>> +    .close =3D minios_evtchn_close_fd,
>> +    .select_rd =3D select_read_flag,
>> +};
>> +
>>   /*
>>    * XENEVTCHN_NO_CLOEXEC is being ignored, as there is no exec() call=
 supported
>>    * in Mini-OS.
>>    */
>>   int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
>>   {
>> -    int fd =3D alloc_fd(FTYPE_EVTCHN);
>> +    int fd;
>> +    struct file *file;
>> +    struct port_list *list;
>> +    static unsigned int ftype_evtchn;
>>  =20
>> -    if ( fd =3D=3D -1 )
>> +    if ( !ftype_evtchn )
>> +        ftype_evtchn =3D alloc_file_type(&evtchn_ops);
>=20
> Hmm.=C2=A0 MiniOS doesn't appear to support __attribute__((constructor)=
) but
> this would be an ideal candidate.
>=20
> It would remove a non-threadsafe singleton from a (largely unrelated)
> codepath.
>=20
> Should be very simple to add to MiniOS.=C2=A0 See Xen's init_constructo=
rs(),
> and add CONSTRUCTORS to the linker file.

I'll look into this.

>=20
>> @@ -134,42 +171,43 @@ int xenevtchn_notify(xenevtchn_handle *xce, evtc=
hn_port_t port)
>>  =20
>>   static void evtchn_handler(evtchn_port_t port, struct pt_regs *regs,=
 void *data)
>>   {
>> -    int fd =3D (int)(intptr_t)data;
>> -    struct evtchn_port_info *port_info;
>> +    xenevtchn_handle *xce =3D data;
>> +    struct file *file =3D get_file_from_fd(xce->fd);
>> +    struct port_info *port_info;
>> +    struct port_list *port_list;
>>  =20
>> -    assert(files[fd].type =3D=3D FTYPE_EVTCHN);
>> +    assert(file);
>> +    port_list =3D file->dev;
>>       mask_evtchn(port);
>> -    LIST_FOREACH(port_info, &files[fd].evtchn.ports, list)
>> +    LIST_FOREACH(port_info, port_list, list)
>>       {
>>           if ( port_info->port =3D=3D port )
>>               goto found;
>>       }
>>  =20
>> -    printk("Unknown port for handle %d\n", fd);
>> +    printk("Unknown port for handle %d\n", xce->fd);
>=20
> As you're editing this line anyway, it really wants to become "Unknown
> port %d for handle %d\n".

Okay.


Juergen

--------------D34776A65E72BC8C4FC31F41
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

--------------D34776A65E72BC8C4FC31F41--

--925mLoogs0xtUNuTzGrUwSLRDNLX9DAmS--

--1FLIRTKkFocVjw4bH2R0znb9sVBjklTPu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHegb0FAwAAAAAACgkQsN6d1ii/Ey86
dgf/aHJqb8STJT5vTnb1Fq9bHSwGACBhvkTdPct1oKOgwDb7H24U1A8VpV51DpwLe5+kEUwmC5kC
cPcytm8ny4VHiUPaWgwpSRFCCd7plfigMCzx6CGOTN09Bkm9dYH877XOm0z8SgsGyCVhnAHJn3Sy
UVsKWZ+5hDaJETEBG+8+qZP8wp4YC8Qh9BnGCLra0IjzgdRRfbxVJr6Ae0clRYHk6h9AGbO7B66E
U8MPA3rGQOlXcSqEmB/oiBMWLKeUwtovHFAaK3hC5wXjcWhlVqKr3CoyurFcNgU7KjboE0tAvcQ5
wuoPKtnvLC80odstZnbYgpyn5PxypF8AS//w5onMnw==
=Obvl
-----END PGP SIGNATURE-----

--1FLIRTKkFocVjw4bH2R0znb9sVBjklTPu--

