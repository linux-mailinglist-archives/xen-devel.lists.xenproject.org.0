Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A53A2C0098
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 08:30:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.33632.64760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kh6Hg-00023o-QR; Mon, 23 Nov 2020 07:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33632.64760; Mon, 23 Nov 2020 07:29:12 +0000
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
	id 1kh6Hg-00023P-NB; Mon, 23 Nov 2020 07:29:12 +0000
Received: by outflank-mailman (input) for mailman id 33632;
 Mon, 23 Nov 2020 07:29:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xOkN=E5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kh6He-00023K-S2
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 07:29:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d2eae3d-3400-4d94-a564-a9f22a0bfcd8;
 Mon, 23 Nov 2020 07:29:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9B892ABCE;
 Mon, 23 Nov 2020 07:29:08 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xOkN=E5=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kh6He-00023K-S2
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 07:29:10 +0000
X-Inumbo-ID: 2d2eae3d-3400-4d94-a564-a9f22a0bfcd8
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2d2eae3d-3400-4d94-a564-a9f22a0bfcd8;
	Mon, 23 Nov 2020 07:29:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606116548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i09SCvlePJ2J/OPXmW03ImaqfNDdSHiM7gHhLVc0sAE=;
	b=drX6B+4WzXHC6ZlBxsWb0tsYNdZVzjP//rp8+kt67jiJmKBel8HfI+VOjUFhA+WtAwT9+X
	Ia7lLtNiDN4o6vKmzptkuen14hUiHs5SOI3C+pteEjR/+xROTHldKi5yfzqt8LWwGlvxbw
	Y7xlaUA0ysrHyaI2Ikkgo64K1zxZQyA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9B892ABCE;
	Mon, 23 Nov 2020 07:29:08 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20201109163826.13035-1-jgross@suse.com>
 <20201109163826.13035-3-jgross@suse.com>
 <77067fa0-d902-9091-50e0-d6e15e34b159@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v6 2/3] xen/evtchn: rework per event channel lock
Message-ID: <70b4c68e-4131-1543-fa66-0efd743a055a@suse.com>
Date: Mon, 23 Nov 2020 08:29:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <77067fa0-d902-9091-50e0-d6e15e34b159@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Hd5XsRLGsgwwVLZo82mlVFTJfc1TcY5Pl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Hd5XsRLGsgwwVLZo82mlVFTJfc1TcY5Pl
Content-Type: multipart/mixed; boundary="vqkhtjnuIxrozriPkBil9AOpzBexo3UD3";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <70b4c68e-4131-1543-fa66-0efd743a055a@suse.com>
Subject: Re: [PATCH v6 2/3] xen/evtchn: rework per event channel lock
References: <20201109163826.13035-1-jgross@suse.com>
 <20201109163826.13035-3-jgross@suse.com>
 <77067fa0-d902-9091-50e0-d6e15e34b159@suse.com>
In-Reply-To: <77067fa0-d902-9091-50e0-d6e15e34b159@suse.com>

--vqkhtjnuIxrozriPkBil9AOpzBexo3UD3
Content-Type: multipart/mixed;
 boundary="------------578FAFE8DF50A2D49AE1D294"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------578FAFE8DF50A2D49AE1D294
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 18.11.20 14:19, Jan Beulich wrote:
> On 09.11.2020 17:38, Juergen Gross wrote:
>> Currently the lock for a single event channel needs to be taken with
>> interrupts off, which causes deadlocks in some cases.
>>
>> Rework the per event channel lock to be non-blocking for the case of
>> sending an event and removing the need for disabling interrupts for
>> taking the lock.
>>
>> The lock is needed for avoiding races between event channel state
>> changes (creation, closing, binding) against normal operations (set
>> pending, [un]masking, priority changes).
>>
>> Use a rwlock, but with some restrictions:
>>
>> - Changing the state of an event channel (creation, closing, binding)
>>    needs to use write_lock(), with ASSERT()ing that the lock is taken =
as
>>    writer only when the state of the event channel is either before or=

>>    after the locked region appropriate (either free or unbound).
>>
>> - Sending an event needs to use read_trylock() mostly, in case of not
>>    obtaining the lock the operation is omitted. This is needed as
>>    sending an event can happen with interrupts off (at least in some
>>    cases).
>>
>> - Dumping the event channel state for debug purposes is using
>>    read_trylock(), too, in order to avoid blocking in case the lock is=

>>    taken as writer for a long time.
>>
>> - All other cases can use read_lock().
>=20
> One of the implications is that racing invocations of ->set_pending()
> are now possible for the same port. Beyond what I said in reply to
> 0/3 already, I'm afraid there are (latent) issues:
>=20
> 1) The update of ->pending (or basically any bitfield in struct
> evtchn, or yet more generically any field getting updated in a read-
> modify-write fashion) is no longer generally safe in any of the
> hooks called with just a read lock held. ->pending itself is not an
> issue now merely because it shares storage only with xen_consumer,
> which won't get updated once a port was bound.

This is fragile.

We should put the pending indicator into a dedicated byte.

> 2) Of two racing sends, one may now complete without the port
> actually having got fully recorded as linked in the FIFO code. This
> is because the party losing the race of setting EVTCHN_FIFO_LINKED
> will return early, without regard to whether the winner has made
> enough progress. (Of course this is possible only with an
> intermediate queue change, as only then the lock would become
> available to the second of the senders early enough.)

No, I don't think this is limited to a queue change. If a caller of
evtchn_fifo_set_pending() is being interrupted after setting
EVTCHN_FIFO_PENDING, and then a second caller can make it to setting
EVTCHN_FIFO_LINKED, the first caller won't even try to take the queue
lock, resulting in evtchn_check_pollers() being called before the
event might have been put properly into the queue.

I'd suggest to extend the fifo queue lock region in order to mitigate
this problem.

>=20
> I've gone through other functions called from this path and didn't
> find any further race potential there, but I'm not entirely certain
> I didn't miss anything.

I can prepare a patch if you agree my ideas.


Juergen

--------------578FAFE8DF50A2D49AE1D294
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

--------------578FAFE8DF50A2D49AE1D294--

--vqkhtjnuIxrozriPkBil9AOpzBexo3UD3--

--Hd5XsRLGsgwwVLZo82mlVFTJfc1TcY5Pl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+7ZMMFAwAAAAAACgkQsN6d1ii/Ey+Y
owf/XRhml7vg/AN5HHVWcom+FP9smUNe5+HQP0aQCqukx+Q2wuXyD8vmS8S05zUn82lqjEPYFbbi
7dHq9uUpIawxiAWHrdaPD3DEABklJLYUtW/pwp8QOjBoLEWqknFn7KGNW+u0FoXVg9knFUvCnfpM
hkSOUhsIv0LSs1m19ylOwhH5B9QH+pHvAsk/OFPjnsDeaoBbzzVkFs2RwJsWWo7afZQUf3QZYRH4
5zK9mKa137gm7/lYM9Xx2H4329cPeOSXjG3lXIizNLI2s6CwM/4uTJ64qdIsV2Fg/G4UO3Ba8ZZm
CYzfpHqB1EpZU0izeLIW+KdGSy9/Rc/7WFolqS8obQ==
=z5CC
-----END PGP SIGNATURE-----

--Hd5XsRLGsgwwVLZo82mlVFTJfc1TcY5Pl--

