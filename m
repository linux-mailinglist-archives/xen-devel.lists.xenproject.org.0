Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8C52B6760
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 15:30:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29028.58209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf1zX-0008S8-A9; Tue, 17 Nov 2020 14:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29028.58209; Tue, 17 Nov 2020 14:29:55 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf1zX-0008Rj-6k; Tue, 17 Nov 2020 14:29:55 +0000
Received: by outflank-mailman (input) for mailman id 29028;
 Tue, 17 Nov 2020 14:29:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J6Lq=EX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kf1zV-0008Re-EK
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 14:29:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87103953-48bb-45bd-86d0-e9a68d1f67fe;
 Tue, 17 Nov 2020 14:29:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 938DEAC2E;
 Tue, 17 Nov 2020 14:29:51 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=J6Lq=EX=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kf1zV-0008Re-EK
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 14:29:53 +0000
X-Inumbo-ID: 87103953-48bb-45bd-86d0-e9a68d1f67fe
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 87103953-48bb-45bd-86d0-e9a68d1f67fe;
	Tue, 17 Nov 2020 14:29:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605623391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hnVuomKx40WMf4cquvKgXgKksdZX6y8pUMWsfmeaJ5Y=;
	b=QwUN/DygWdq6BlnfeD1V7xnwMMHUXIzP/fqlkURzzu907ZPXbZzcOR02T9OFRoPhIP93K9
	TSpuiHciPEp2opM4wsbEks5DWHtsMk9H6WKK7LZXZ0Xde5Vg+uxt/qlVqR+0WvF6N3b1Y1
	EwGGdwoTc9F18hR4CmMyzLBGkG1pX04=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 938DEAC2E;
	Tue, 17 Nov 2020 14:29:51 +0000 (UTC)
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-9-jgross@suse.com>
 <d8653200-fbee-4e87-3e2d-7062879d7b4e@suse.com>
Subject: [PATCH 08/12] xen/hypfs: support dynamic hypfs nodes
Message-ID: <6fe809d5-09c1-28d3-61ec-10244b2d7d5f@suse.com>
Date: Tue, 17 Nov 2020 15:29:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d8653200-fbee-4e87-3e2d-7062879d7b4e@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hFCjskmoi0gjnp7B2YhiBYfebIBqtFjQc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hFCjskmoi0gjnp7B2YhiBYfebIBqtFjQc
Content-Type: multipart/mixed; boundary="XX7YNifh0uwWq4sHqsQyz91Ny5fmrfHRo";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <6fe809d5-09c1-28d3-61ec-10244b2d7d5f@suse.com>
Subject: [PATCH 08/12] xen/hypfs: support dynamic hypfs nodes
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-9-jgross@suse.com>
 <d8653200-fbee-4e87-3e2d-7062879d7b4e@suse.com>
In-Reply-To: <d8653200-fbee-4e87-3e2d-7062879d7b4e@suse.com>

--XX7YNifh0uwWq4sHqsQyz91Ny5fmrfHRo
Content-Type: multipart/mixed;
 boundary="------------C506B9991BCDEFDCABE781B3"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C506B9991BCDEFDCABE781B3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.11.20 13:37, Jan Beulich wrote:
> On 26.10.2020 10:13, Juergen Gross wrote:
>> Add a getsize() function pointer to struct hypfs_funcs for being able
>> to have dynamically filled entries without the need to take the hypfs
>> lock each time the contents are being generated.
>=20
> But a dynamic update causing a change in size will require _some_
> lock, won't it?

Yes, of course.

e.g. the getsize() function returning the size of a directory holding an
entry for each cpupool will need to take the cpupool lock in order to
avoid a cpupool being created or deleted in parallel.

But the cpupool create/destroy functions don't need to take the hypfs
lock.

>=20
>> --- a/xen/common/hypfs.c
>> +++ b/xen/common/hypfs.c
>> @@ -19,28 +19,29 @@
>>   CHECK_hypfs_dirlistentry;
>>   #endif
>>  =20
>> -#define DIRENTRY_NAME_OFF offsetof(struct xen_hypfs_dirlistentry, nam=
e)
>> -#define DIRENTRY_SIZE(name_len) \
>> -    (DIRENTRY_NAME_OFF +        \
>> -     ROUNDUP((name_len) + 1, alignof(struct xen_hypfs_direntry)))
>> -
>>   struct hypfs_funcs hypfs_dir_funcs =3D {
>>       .read =3D hypfs_read_dir,
>> +    .getsize =3D hypfs_getsize,
>> +    .findentry =3D hypfs_dir_findentry,
>>   };
>>   struct hypfs_funcs hypfs_leaf_ro_funcs =3D {
>>       .read =3D hypfs_read_leaf,
>> +    .getsize =3D hypfs_getsize,
>>   };
>>   struct hypfs_funcs hypfs_leaf_wr_funcs =3D {
>>       .read =3D hypfs_read_leaf,
>>       .write =3D hypfs_write_leaf,
>> +    .getsize =3D hypfs_getsize,
>>   };
>>   struct hypfs_funcs hypfs_bool_wr_funcs =3D {
>>       .read =3D hypfs_read_leaf,
>>       .write =3D hypfs_write_bool,
>> +    .getsize =3D hypfs_getsize,
>>   };
>>   struct hypfs_funcs hypfs_custom_wr_funcs =3D {
>>       .read =3D hypfs_read_leaf,
>>       .write =3D hypfs_write_custom,
>> +    .getsize =3D hypfs_getsize,
>>   };
>=20
> With the increasing number of fields that may (deliberately or
> by mistake) be NULL, should we gain some form of proactive
> guarding against calls through such pointers?

Hmm, up to now I think such a bug would be detected rather fast.

I can add some ASSERT()s for mandatory functions not being NULL when
a node is added dynamically or during hypfs initialization for the
static nodes.

>=20
>> @@ -88,6 +93,23 @@ static void hypfs_unlock(void)
>>       }
>>   }
>>  =20
>> +void *hypfs_alloc_dyndata(unsigned long size, unsigned long align)
>=20
> Will callers really need to specify (high) alignment values? IOW ...
>=20
>> +{
>> +    unsigned int cpu =3D smp_processor_id();
>> +
>> +    ASSERT(per_cpu(hypfs_locked, cpu) !=3D hypfs_unlocked);
>> +    ASSERT(per_cpu(hypfs_dyndata, cpu) =3D=3D NULL);
>> +
>> +    per_cpu(hypfs_dyndata, cpu) =3D _xzalloc(size, align);
>=20
> ... is xzalloc_bytes() not suitable for use here?

Good question.

Up to now I think we could get away without specific alignment.

I can drop that parameter for now if you'd like that better.

>=20
>> @@ -171,15 +193,34 @@ static int hypfs_get_path_user(char *buf,
>>       return 0;
>>   }
>>  =20
>> +struct hypfs_entry *hypfs_dir_findentry(struct hypfs_entry_dir *dir,
>> +                                        const char *name,
>> +                                        unsigned int name_len)
>> +{
>> +    struct hypfs_entry *entry;
>> +
>> +    list_for_each_entry ( entry, &dir->dirlist, list )
>> +    {
>> +        int cmp =3D strncmp(name, entry->name, name_len);
>> +
>> +        if ( cmp < 0 )
>> +            return ERR_PTR(-ENOENT);
>> +
>> +        if ( !cmp && strlen(entry->name) =3D=3D name_len )
>> +            return entry;
>> +    }
>> +
>> +    return ERR_PTR(-ENOENT);
>> +}
>> +
>>   static struct hypfs_entry *hypfs_get_entry_rel(struct hypfs_entry_di=
r *dir,
>>                                                  const char *path)
>>   {
>>       const char *end;
>>       struct hypfs_entry *entry;
>>       unsigned int name_len;
>> -    bool again =3D true;
>>  =20
>> -    while ( again )
>> +    for ( ;; )
>=20
> Nit: Strictly speaking another blank is needed between the two
> semicolons.

Okay.

>=20
>> @@ -275,22 +305,25 @@ int hypfs_read_leaf(const struct hypfs_entry *en=
try,
>>  =20
>>       l =3D container_of(entry, const struct hypfs_entry_leaf, e);
>>  =20
>> -    return copy_to_guest(uaddr, l->u.content, entry->size) ? -EFAULT:=
 0;
>> +    return copy_to_guest(uaddr, l->u.content, entry->funcs->getsize(e=
ntry)) ?
>> +                                              -EFAULT : 0;
>=20
> With the intended avoiding of locking, how is this ->getsize()
> guaranteed to not ...
>=20
>> @@ -298,7 +331,7 @@ static int hypfs_read(const struct hypfs_entry *en=
try,
>>           goto out;
>>  =20
>>       ret =3D -ENOBUFS;
>> -    if ( ulen < entry->size + sizeof(e) )
>> +    if ( ulen < size + sizeof(e) )
>>           goto out;
>=20
> ... invalidate the checking done here? (A similar risk looks to
> exist on the write path, albeit there we have at least the
> ->max_size checks, where I hope that field isn't mean to become
> dynamic as well.)

I think you are right. I should add the size value as a parameter to the
read and write functions.

And no, max_size should not be dynamic.


Juergen

--------------C506B9991BCDEFDCABE781B3
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
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

--------------C506B9991BCDEFDCABE781B3--

--XX7YNifh0uwWq4sHqsQyz91Ny5fmrfHRo--

--hFCjskmoi0gjnp7B2YhiBYfebIBqtFjQc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+z3l4FAwAAAAAACgkQsN6d1ii/Ey+y
mAf/ey8H4fxbNemcTS8JfA8BVjkH/ax6rUuAmR0yWh2sKbtsSiyDzHusKWSDySOSXDVU52PrJWjn
4D+xg72E9s/XvhL7jR3DgyUkdPwjT5Va5tf2/ZZap6pCidkC1Cfe6G/boI4ONb+Mw06eyhnset8V
e9dHHq0XdWKFOSeIGKIzOQo2CjoJnoo6IKFuXVwQBxD3XMhCEFxFLYJOfrlI5cMo79VVdvULkseg
+AVZSkK4mdjSE51N1cjGRRfo/p/Rwcbq4a6MljfQG38d8jMbuCRNYuW/5bj928rp4J7mHjBd+gxF
j4CYUeDtc5Q6cj2zDq4nRQB0JPuVDkO0d1e8wD6WPQ==
=FVDl
-----END PGP SIGNATURE-----

--hFCjskmoi0gjnp7B2YhiBYfebIBqtFjQc--

