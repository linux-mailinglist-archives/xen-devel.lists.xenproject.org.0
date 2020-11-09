Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF95C2ABA32
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 14:16:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22556.48930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc729-0007I0-2L; Mon, 09 Nov 2020 13:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22556.48930; Mon, 09 Nov 2020 13:16:33 +0000
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
	id 1kc728-0007Hb-VP; Mon, 09 Nov 2020 13:16:32 +0000
Received: by outflank-mailman (input) for mailman id 22556;
 Mon, 09 Nov 2020 13:16:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kc728-0007HW-36
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 13:16:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3bb77c4-a158-459c-bf0d-eaff2031d350;
 Mon, 09 Nov 2020 13:16:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 55BFFAC53;
 Mon,  9 Nov 2020 13:16:29 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kc728-0007HW-36
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 13:16:32 +0000
X-Inumbo-ID: f3bb77c4-a158-459c-bf0d-eaff2031d350
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f3bb77c4-a158-459c-bf0d-eaff2031d350;
	Mon, 09 Nov 2020 13:16:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604927789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gl1mL6XKk1PigKKL1qPSLAB+qTnJhKQoMk3cDGCzrRw=;
	b=RwFVdgDDXeLCWcwe0GAjCI7XVWoff9HjuoSIIXBSGxLLC0fj3xBe96Xz64/4tr6pKhmXXC
	rtKc01EhehI/xhLT4zGlGEhmJ7vULHkpyXmyKz0UhqTNn7ggX/VMq28nSjPb66DJXHgqxP
	nlJjRfALSXPU/HWbpDJG9A25Uc0aU7s=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 55BFFAC53;
	Mon,  9 Nov 2020 13:16:29 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20201109064128.3908-1-jgross@suse.com>
 <20201109064128.3908-3-jgross@suse.com>
 <df9737a4-f90a-0498-b67d-ce254b835287@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v5 2/2] xen/evtchn: rework per event channel lock
Message-ID: <7fa67b64-4114-736b-660c-2ec5be8f7da1@suse.com>
Date: Mon, 9 Nov 2020 14:16:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <df9737a4-f90a-0498-b67d-ce254b835287@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ujqyC0L7ukV05M7it7xm6tKO1HlH9PU0H"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ujqyC0L7ukV05M7it7xm6tKO1HlH9PU0H
Content-Type: multipart/mixed; boundary="VcSeUsQIlUhnyUrCudpaPkVzEfCEcICbx";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <7fa67b64-4114-736b-660c-2ec5be8f7da1@suse.com>
Subject: Re: [PATCH v5 2/2] xen/evtchn: rework per event channel lock
References: <20201109064128.3908-1-jgross@suse.com>
 <20201109064128.3908-3-jgross@suse.com>
 <df9737a4-f90a-0498-b67d-ce254b835287@suse.com>
In-Reply-To: <df9737a4-f90a-0498-b67d-ce254b835287@suse.com>

--VcSeUsQIlUhnyUrCudpaPkVzEfCEcICbx
Content-Type: multipart/mixed;
 boundary="------------9003C3690CB30519C6B53FDD"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------9003C3690CB30519C6B53FDD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 09.11.20 12:58, Jan Beulich wrote:
> On 09.11.2020 07:41, Juergen Gross wrote:
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
>> - normal operations use read_trylock(), in case of not obtaining the
>>    lock the operation is omitted or a default state is returned
>>
>> - closing an event channel is using write_lock(), with ASSERT()ing tha=
t
>>    the lock is taken as writer only when the state of the event channe=
l
>>    is either before or after the locked region appropriate (either fre=
e
>>    or unbound).
>=20
> This has become stale, and may have been incomplete already before:
> - Normal operations now may use two diffeent approaches. Which one
> is to be used when would want writing down here.
> - write_lock() use goes beyond closing.

Yes, you are right.

>=20
>> --- a/xen/arch/x86/irq.c
>> +++ b/xen/arch/x86/irq.c
>> @@ -2495,14 +2495,12 @@ static void dump_irqs(unsigned char key)
>>                   pirq =3D domain_irq_to_pirq(d, irq);
>>                   info =3D pirq_info(d, pirq);
>>                   evtchn =3D evtchn_from_port(d, info->evtchn);
>> -                local_irq_disable();
>> -                if ( spin_trylock(&evtchn->lock) )
>> +                if ( evtchn_read_trylock(evtchn) )
>>                   {
>>                       pending =3D evtchn_is_pending(d, evtchn);
>>                       masked =3D evtchn_is_masked(d, evtchn);
>> -                    spin_unlock(&evtchn->lock);
>> +                    evtchn_read_unlock(evtchn);
>>                   }
>> -                local_irq_enable();
>>                   printk("d%d:%3d(%c%c%c)%c",
>>                          d->domain_id, pirq, "-P?"[pending],
>>                          "-M?"[masked], info->masked ? 'M' : '-',
>=20
> Using trylock here has a reason different from that in sending
> functions, aiui. Please say so in the description, to justify
> exposure of evtchn_read_lock().

Okay.

>=20
>> --- a/xen/arch/x86/pv/shim.c
>> +++ b/xen/arch/x86/pv/shim.c
>> @@ -660,11 +660,12 @@ void pv_shim_inject_evtchn(unsigned int port)
>>       if ( port_is_valid(guest, port) )
>>       {
>>           struct evtchn *chn =3D evtchn_from_port(guest, port);
>> -        unsigned long flags;
>>  =20
>> -        spin_lock_irqsave(&chn->lock, flags);
>> -        evtchn_port_set_pending(guest, chn->notify_vcpu_id, chn);
>> -        spin_unlock_irqrestore(&chn->lock, flags);
>> +        if ( evtchn_read_trylock(chn) )
>> +        {
>> +            evtchn_port_set_pending(guest, chn->notify_vcpu_id, chn);=

>> +            evtchn_read_unlock(chn);
>> +        }
>=20
> Does this need trylock?

It is called directly from the event upcall, so interrupts should be
off here. Without trylock this would result in check_lock() triggering.

>=20
>> @@ -1068,15 +1088,16 @@ int evtchn_unmask(unsigned int port)
>>   {
>>       struct domain *d =3D current->domain;
>>       struct evtchn *evtchn;
>> -    unsigned long flags;
>>  =20
>>       if ( unlikely(!port_is_valid(d, port)) )
>>           return -EINVAL;
>>  =20
>>       evtchn =3D evtchn_from_port(d, port);
>> -    spin_lock_irqsave(&evtchn->lock, flags);
>> -    evtchn_port_unmask(d, evtchn);
>> -    spin_unlock_irqrestore(&evtchn->lock, flags);
>> +    if ( evtchn_read_trylock(evtchn) )
>> +    {
>> +        evtchn_port_unmask(d, evtchn);
>> +        evtchn_read_unlock(evtchn);
>> +    }
>=20
> I think this one could as well use plain read_lock().

Oh, indeed.

>=20
>> @@ -234,12 +244,13 @@ static inline bool evtchn_is_masked(const struct=
 domain *d,
>>   static inline bool evtchn_port_is_masked(struct domain *d, evtchn_po=
rt_t port)
>>   {
>>       struct evtchn *evtchn =3D evtchn_from_port(d, port);
>> -    bool rc;
>> -    unsigned long flags;
>> +    bool rc =3D true;
>>  =20
>> -    spin_lock_irqsave(&evtchn->lock, flags);
>> -    rc =3D evtchn_is_masked(d, evtchn);
>> -    spin_unlock_irqrestore(&evtchn->lock, flags);
>> +    if ( evtchn_read_trylock(evtchn) )
>> +    {
>> +        rc =3D evtchn_is_masked(d, evtchn);
>> +        evtchn_read_unlock(evtchn);
>> +    }
>>  =20
>>       return rc;
>>   }
>> @@ -252,12 +263,13 @@ static inline int evtchn_port_poll(struct domain=
 *d, evtchn_port_t port)
>>       if ( port_is_valid(d, port) )
>>       {
>>           struct evtchn *evtchn =3D evtchn_from_port(d, port);
>> -        unsigned long flags;
>>  =20
>> -        spin_lock_irqsave(&evtchn->lock, flags);
>> -        if ( evtchn_usable(evtchn) )
>> -            rc =3D evtchn_is_pending(d, evtchn);
>> -        spin_unlock_irqrestore(&evtchn->lock, flags);
>> +        if ( evtchn_read_trylock(evtchn) )
>> +        {
>> +            if ( evtchn_usable(evtchn) )
>> +                rc =3D evtchn_is_pending(d, evtchn);
>> +            evtchn_read_unlock(evtchn);
>> +        }
>>       }
>>  =20
>>       return rc;
>=20
> At least for the latter I suppose it should also be plain read_lock().
> We ought to keep the exceptions to where they're actually needed, I
> think.

I think both instances can be switched.


Juergen

--------------9003C3690CB30519C6B53FDD
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

--------------9003C3690CB30519C6B53FDD--

--VcSeUsQIlUhnyUrCudpaPkVzEfCEcICbx--

--ujqyC0L7ukV05M7it7xm6tKO1HlH9PU0H
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+pQSwFAwAAAAAACgkQsN6d1ii/Ey/K
eQf/V/7Vds2iI9uq8R2B4QLX2xntYjn9TbrEQb8jsIy6kyALr02UR7L8gmOFTbNUY4t/m4dGnadR
bN7mFcfIMm9/EugR5ICqTsBUVa/Q5ChTqpcw2p4fZs03MD8ABwcXO6Y7V6BkdzDDz6VTHle9IG59
peMZnz+IVW2vJfo/s/MU2k1+hPK327rFl4VoGEd1l05WWhEhpnqaaFMkNU0aBn4x5ndxqNSnPt0k
9frOB69RW7+8GUOGMeWfx2kUDmTDhFkPGpaePgtnekBon/Tut61lvzwku2YJTzHfS5U+of7dMk7G
D0OkQ+bkz1q9GgXfW6jtGXKJvyfUc7eXG7xWLIw6PA==
=gTDz
-----END PGP SIGNATURE-----

--ujqyC0L7ukV05M7it7xm6tKO1HlH9PU0H--

