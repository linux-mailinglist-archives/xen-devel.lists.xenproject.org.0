Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A51EA458EA3
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 13:47:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228863.396072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp8i0-0000D3-Py; Mon, 22 Nov 2021 12:46:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228863.396072; Mon, 22 Nov 2021 12:46:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp8i0-0000Ah-Mm; Mon, 22 Nov 2021 12:46:08 +0000
Received: by outflank-mailman (input) for mailman id 228863;
 Mon, 22 Nov 2021 12:46:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fXQY=QJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mp8i0-0000Aa-16
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 12:46:08 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 261572d6-4b92-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 13:46:02 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 90FB21FCA3;
 Mon, 22 Nov 2021 12:46:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5A65413B44;
 Mon, 22 Nov 2021 12:46:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id R6TRFAmRm2GSQAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 22 Nov 2021 12:46:01 +0000
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
X-Inumbo-ID: 261572d6-4b92-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637585161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iY4pIDoIqsZKILf62Hom/2rBYD4KllARaTuy3u+d2Nw=;
	b=bblxAREhZc69XZdVMQwpW81A70vf/0pPrVM2OkRMGu7FA8bV0KlD1Gjm92kE7ZUujSLBQm
	P4Nus6t1PgXTuwghHZTPV+7LIRD9qujqpa/jUFa2Fu4DVtv/Gwe6tvHizLPw71b9H0BHui
	G8G0fBklz6KI8IJRimt6jrsGQCGMQsM=
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210914123600.1626-1-jgross@suse.com>
 <20210914123600.1626-3-jgross@suse.com>
 <578438ad-dfb2-314c-6514-a2e72aeed091@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 2/4] xen: add bitmap to indicate per-domain state
 changes
Message-ID: <e31fd752-a170-f169-5557-ec593b7a27e2@suse.com>
Date: Mon, 22 Nov 2021 13:46:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <578438ad-dfb2-314c-6514-a2e72aeed091@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nxHRDCYKIDrTy2MKl9Zg6E7OTpYY7noEq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nxHRDCYKIDrTy2MKl9Zg6E7OTpYY7noEq
Content-Type: multipart/mixed; boundary="qw7Vf2twF69kUqhXRmgKToSaUL5IAdQTn";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <e31fd752-a170-f169-5557-ec593b7a27e2@suse.com>
Subject: Re: [PATCH RFC 2/4] xen: add bitmap to indicate per-domain state
 changes
References: <20210914123600.1626-1-jgross@suse.com>
 <20210914123600.1626-3-jgross@suse.com>
 <578438ad-dfb2-314c-6514-a2e72aeed091@suse.com>
In-Reply-To: <578438ad-dfb2-314c-6514-a2e72aeed091@suse.com>

--qw7Vf2twF69kUqhXRmgKToSaUL5IAdQTn
Content-Type: multipart/mixed;
 boundary="------------25F0B4CF8B552107F73EC8F0"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------25F0B4CF8B552107F73EC8F0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 22.11.21 11:41, Jan Beulich wrote:
> On 14.09.2021 14:35, Juergen Gross wrote:
>> Add a bitmap with one bit per possible domid indicating the respective=

>> domain has changed its state (created, deleted, dying, crashed,
>> shutdown).
>>
>> Registering the VIRQ_DOM_EXC event will result in setting the bits for=

>> all existing domains and resetting all other bits.
>=20
> Generally I view VIRQ_DOM_EXC as overly restrictive already - what if b=
oth
> a xenstore domain and a control domain want respective notification? He=
nce

The general idea was that in this case the control domain should
register a related Xenstore watch.

> similarly I'm not convinced a single, global instance will do here. Whi=
ch
> in turn raises the question whether the approach chosen may not take us=

> far enough, and we wouldn't instead want a more precise notification mo=
del
> (i.e. not just "something has changed").

Yes, that would be the job of Xenstore. It would provide the more
fine grained watches for that purpose.

>=20
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -87,6 +87,22 @@ bool __read_mostly vmtrace_available;
>>   /* Unique domain identifier, protected by domctl lock. */
>>   static uint64_t unique_id;
>>  =20
>> +static DECLARE_BITMAP(dom_state_changed, DOMID_MASK + 1);
>=20
> While not really making a difference to the size of the bitmap, afaict =
up
> to DOMID_FIRST_RESERVED would do. Neither system domains nor idle ones
> will reach, in particular, the set_bit() in domain_create(). And none o=
f
> them can be subject to destruction.

I'd be fine either way.

> Also I think this could do with a brief comment as to what causes bits
> to be set. This would avoid readers having to go hunt down all the
> set_bit() (or the commit introducing the bitmap).

Okay.

>=20
>> +void domain_reset_states(void)
>> +{
>> +    struct domain *d;
>> +
>> +    bitmap_zero(dom_state_changed, DOMID_MASK + 1);
>=20
> While this looks to be fine with the present updates of the bitmap, I
> still wonder about the non-atomicity here vs the atomic updates
> everywhere else. It feels like there's some locking needed to be future=

> proof. Since you come here from VIRQ_DOM_EXC binding, it could be that
> domain's per-domain lock.

Fine with me.

>=20
>> @@ -1141,6 +1161,8 @@ static void complete_domain_destroy(struct rcu_h=
ead *head)
>>  =20
>>       xfree(d->vcpu);
>>  =20
>> +    set_bit(d->domain_id, dom_state_changed);
>> +
>>       _domain_destroy(d);
>>  =20
>>       send_global_virq(VIRQ_DOM_EXC);
>=20
> Wouldn't this better be in domain_destroy() immediately after the domai=
n
> has been taken off the list, and hence is no longer "discoverable"?

In this case the call of send_global_virq() should be moved, too,
I guess?


Juergen

--------------25F0B4CF8B552107F73EC8F0
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

--------------25F0B4CF8B552107F73EC8F0--

--qw7Vf2twF69kUqhXRmgKToSaUL5IAdQTn--

--nxHRDCYKIDrTy2MKl9Zg6E7OTpYY7noEq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGbkQgFAwAAAAAACgkQsN6d1ii/Ey/C
qQf+PQuww7DLwmK5LQPIxAixnRuv5Bum50OwTqKQtu+xa1nQens2wCHPJDgH6DMZ53qFLswcWXIl
R97cIDY+M7cXg5mziPWZFzUHngQlvP9eDHouKV+pAjgEax8pkAFrCqhs9blT3bXhVRMdMY7P/5AO
EEmhc+O0RrwSXh04OpjPHplnU8SBNfErxUDRQ6th1XfqoCC3uVqA4yRcpLFEn0dAmQgq5+1NDuBC
uMxBtlJOpTfNTXYXm7e2oIA7rNETj0+0d/63AMN0m/TrhKTpF8K843ipc2V+t5Hd7ZWpuIj496Ka
dkLD2m9EzfxfiSa6t4vXHpgI0F82WpFaE79wZhl33Q==
=CxZq
-----END PGP SIGNATURE-----

--nxHRDCYKIDrTy2MKl9Zg6E7OTpYY7noEq--

