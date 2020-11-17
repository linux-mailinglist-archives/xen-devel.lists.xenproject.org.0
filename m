Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A60992B67A3
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 15:39:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29033.58221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf289-00012l-7B; Tue, 17 Nov 2020 14:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29033.58221; Tue, 17 Nov 2020 14:38:49 +0000
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
	id 1kf289-00012M-3h; Tue, 17 Nov 2020 14:38:49 +0000
Received: by outflank-mailman (input) for mailman id 29033;
 Tue, 17 Nov 2020 14:38:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J6Lq=EX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kf287-00011d-Qx
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 14:38:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ef65306-d06e-431d-8500-8244a451cb44;
 Tue, 17 Nov 2020 14:38:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 28986AC1F;
 Tue, 17 Nov 2020 14:38:46 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=J6Lq=EX=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kf287-00011d-Qx
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 14:38:47 +0000
X-Inumbo-ID: 7ef65306-d06e-431d-8500-8244a451cb44
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7ef65306-d06e-431d-8500-8244a451cb44;
	Tue, 17 Nov 2020 14:38:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605623926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zFq0mNEnNGQQbJQ5eWMnQX3fnZHSAeNPY7v15vUs1iY=;
	b=kvvth0b4KbiIPp5RRRi1o+388AjmPqMJV9wcrSxmwSc9kmysIUYRyuQ+AHFxWFg7RAzQnw
	jk1yvYI50LXjyq9okM79d6bcPmzgmwwF9dVx1kHxqHknic0GjC31gHlNFEpGCtyD0j7UAj
	gNXO5JTdekopgCc2+Nfz4yPZErEmIys=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 28986AC1F;
	Tue, 17 Nov 2020 14:38:46 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-10-jgross@suse.com>
 <6f8c0d3d-73f6-d10f-182a-8bf76856bf09@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH 09/12] xen/hypfs: add support for id-based dynamic
 directories
Message-ID: <95f673e5-90a8-0fe9-3842-bdb9de5c4aa4@suse.com>
Date: Tue, 17 Nov 2020 15:38:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <6f8c0d3d-73f6-d10f-182a-8bf76856bf09@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iRTqzNAF16dzDUUORWQDukyLXID908L9w"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iRTqzNAF16dzDUUORWQDukyLXID908L9w
Content-Type: multipart/mixed; boundary="zq09cQFK2MztX650FX9PfZqne4pUChG4T";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <95f673e5-90a8-0fe9-3842-bdb9de5c4aa4@suse.com>
Subject: Re: [PATCH 09/12] xen/hypfs: add support for id-based dynamic
 directories
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-10-jgross@suse.com>
 <6f8c0d3d-73f6-d10f-182a-8bf76856bf09@suse.com>
In-Reply-To: <6f8c0d3d-73f6-d10f-182a-8bf76856bf09@suse.com>

--zq09cQFK2MztX650FX9PfZqne4pUChG4T
Content-Type: multipart/mixed;
 boundary="------------17B76CAA08B0E581952F3F76"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------17B76CAA08B0E581952F3F76
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.11.20 14:33, Jan Beulich wrote:
> On 26.10.2020 10:13, Juergen Gross wrote:
>> --- a/xen/common/hypfs.c
>> +++ b/xen/common/hypfs.c
>> @@ -257,6 +257,82 @@ unsigned int hypfs_getsize(const struct hypfs_ent=
ry *entry)
>>       return entry->size;
>>   }
>>  =20
>> +int hypfs_read_dyndir_id_entry(struct hypfs_entry_dir *template,
>> +                               unsigned int id, bool is_last,
>> +                               XEN_GUEST_HANDLE_PARAM(void) *uaddr)
>> +{
>> +    struct xen_hypfs_dirlistentry direntry;
>> +    char name[12];
>=20
> Perhaps better tie this literal 12 to the one used for declaring
> struct hypfs_dyndir_id's name[] field, such that an eventual
> change will need making in exactly one place?

Yes.

>=20
>> +    unsigned int e_namelen, e_len;
>> +
>> +    e_namelen =3D snprintf(name, sizeof(name), "%u", id);
>> +    e_len =3D HYPFS_DIRENTRY_SIZE(e_namelen);
>> +    direntry.e.pad =3D 0;
>> +    direntry.e.type =3D template->e.type;
>> +    direntry.e.encoding =3D template->e.encoding;
>> +    direntry.e.content_len =3D template->e.funcs->getsize(&template->=
e);
>> +    direntry.e.max_write_len =3D template->e.max_size;
>> +    direntry.off_next =3D is_last ? 0 : e_len;
>> +    if ( copy_to_guest(*uaddr, &direntry, 1) )
>> +        return -EFAULT;
>> +    if ( copy_to_guest_offset(*uaddr, HYPFS_DIRENTRY_NAME_OFF, name,
>> +                              e_namelen + 1) )
>> +        return -EFAULT;
>> +
>> +    guest_handle_add_offset(*uaddr, e_len);
>> +
>> +    return 0;
>> +}
>> +
>> +static struct hypfs_entry *hypfs_dyndir_findentry(struct hypfs_entry_=
dir *dir,
>> +                                                  const char *name,
>> +                                                  unsigned int name_l=
en)
>> +{
>> +    struct hypfs_dyndir_id *data;
>=20
> const? (also in read_dyndir below)

Okay.

>=20
>> +    data =3D hypfs_get_dyndata();
>> +    if ( !data )
>> +        return ERR_PTR(-ENOENT);
>> +
>> +    /* Use template with original findentry function. */
>> +    return data->template->e.funcs->findentry(data->template, name, n=
ame_len);
>=20
> Why does this pass the address of the template? If it truly is
> (just) a template, then its dirlist ought to be empty at all
> times? If otoh the "template" indeed gets used as a node in the
> tree then perhaps it wants naming differently? "Stem" would come
> to mind, but likely there are better alternatives. I've also
> considered the German "Statthalter", but its English translations
> don't seem reasonable to me here. And "placeholder" has kind of a
> negative touch. (Also in this case some of my "const?" remarks
> may be irrelevant.)

It is basically a template tree.

In the current use case (cpupool/<id>/sched-gran) the template is
<id> with the leaf "sched-gran" which is the template for the per
cpupool incarnation.

If you like it better I can use stem.

>=20
> Further this and ...
>=20
>> +static int hypfs_read_dyndir(const struct hypfs_entry *entry,
>> +                             XEN_GUEST_HANDLE_PARAM(void) uaddr)
>> +{
>> +    struct hypfs_dyndir_id *data;
>> +
>> +    data =3D hypfs_get_dyndata();
>> +    if ( !data )
>> +        return -ENOENT;
>> +
>> +    /* Use template with original read function. */
>> +    return data->template->e.funcs->read(&data->template->e, uaddr);
>=20
> ... this using the template's funcs is somewhat unexpected, but
> with the functions acting as the entry's .findentry() / .read()
> hooks is obviously the right thing (and if the template is more
> that what the word says, the consideration may become
> inapplicable anyway). The implication is that the hooks
> themselves can't be replaced, if need be down the road.

Correct. In case this is needed the related node must be really
completely dynamical instead.

>=20
>> +struct hypfs_entry *hypfs_gen_dyndir_entry_id(struct hypfs_entry_dir =
*template,
>> +                                              unsigned int id)
>> +{
>> +    struct hypfs_dyndir_id *data;
>> +
>> +    data =3D hypfs_alloc_dyndata(sizeof(*data), alignof(*data));
>> +    if ( !data )
>> +        return ERR_PTR(-ENOMEM);
>> +
>> +    data->template =3D template;
>> +    data->id =3D id;
>=20
> I can't seem to spot any consumer of this field: Is it really
> needed?

Yes. It will be used by the specific read/write functions, e.g.
cpupool_gran_read().

>=20
>> --- a/xen/include/xen/hypfs.h
>> +++ b/xen/include/xen/hypfs.h
>> @@ -50,6 +50,15 @@ struct hypfs_entry_dir {
>>       struct list_head dirlist;
>>   };
>>  =20
>> +struct hypfs_dyndir_id {
>> +    struct hypfs_entry_dir dir;       /* Modified copy of template. *=
/
>> +    struct hypfs_funcs funcs;         /* Dynamic functions. */
>> +    struct hypfs_entry_dir *template; /* Template used. */
>=20
> const?

Yes.

>=20
>> @@ -150,6 +159,11 @@ struct hypfs_entry *hypfs_dir_findentry(struct hy=
pfs_entry_dir *dir,
>>                                           unsigned int name_len);
>>   void *hypfs_alloc_dyndata(unsigned long size, unsigned long align);
>>   void *hypfs_get_dyndata(void);
>> +int hypfs_read_dyndir_id_entry(struct hypfs_entry_dir *template,
>=20
> const?

Yes.

>=20
>> +                               unsigned int id, bool is_last,
>> +                               XEN_GUEST_HANDLE_PARAM(void) *uaddr);
>> +struct hypfs_entry *hypfs_gen_dyndir_entry_id(struct hypfs_entry_dir =
*template,
>=20
> const?

Yes.


Juergen



--------------17B76CAA08B0E581952F3F76
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

--------------17B76CAA08B0E581952F3F76--

--zq09cQFK2MztX650FX9PfZqne4pUChG4T--

--iRTqzNAF16dzDUUORWQDukyLXID908L9w
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+z4HUFAwAAAAAACgkQsN6d1ii/Ey+3
bQf9FoBvPni/+o59RJvMDOYMJKzs3LQGy4bVSA3wK0p+/RZDFknbZPz/u+F+BXXOj0PTeSKqxbHa
W/v1HE7Cr8gKoeiFG04fS1C/J9ICGujrTjPrwwCJh8C8qoxhPddgNhv67Npq212Bj1L2avjDr7of
SjV/GVbHvj4zx1ZjPKtrwIbLYajX0j7Pl5A7G0PEv/unUotN/dEfSK+5jHVyqS0S22PLyUdsKvrr
CinNz618KD5XLQ0JLQFx6ooBiRfKZBUvj1jLylbddmu46qFUZVSxkEGocvBoS1c67M/xvtdW2KJn
6DcNL6i4V7emcVcNVOj7KTkTIeHYNOcHxLl9mU2aEQ==
=1nGL
-----END PGP SIGNATURE-----

--iRTqzNAF16dzDUUORWQDukyLXID908L9w--

