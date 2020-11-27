Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2711E2C66DC
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 14:31:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39333.72208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kidqe-0000ht-UU; Fri, 27 Nov 2020 13:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39333.72208; Fri, 27 Nov 2020 13:31:40 +0000
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
	id 1kidqe-0000hQ-R7; Fri, 27 Nov 2020 13:31:40 +0000
Received: by outflank-mailman (input) for mailman id 39333;
 Fri, 27 Nov 2020 13:31:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hQCY=FB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kidqd-0000hD-Vn
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:31:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a92843e-e17a-47c7-a52a-b7cb9a48a700;
 Fri, 27 Nov 2020 13:31:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00AE4AC90;
 Fri, 27 Nov 2020 13:31:37 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hQCY=FB=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kidqd-0000hD-Vn
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:31:40 +0000
X-Inumbo-ID: 4a92843e-e17a-47c7-a52a-b7cb9a48a700
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4a92843e-e17a-47c7-a52a-b7cb9a48a700;
	Fri, 27 Nov 2020 13:31:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606483898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LN3Ob1rDFoFX3TlASGbBlsqWYmGkMsYCozvzQ697bjU=;
	b=GFRhAQvKJt9IwsE9cBena4hdJa24dGO+iNcFFIBNiv3NpS5zqAOxToqua6EnxfCrFO0Z/M
	mrx0c4FenpV8vJ6TWI2Gfi0M9hnYe8gLZj+kfdhJ4mvhKO4su4zpqkjYpTNu/lwIjpdNoR
	hcOcBN0FYbKXhGwDAFze2eRvceRJX40=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 00AE4AC90;
	Fri, 27 Nov 2020 13:31:37 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201125105122.3650-1-jgross@suse.com>
 <20201125105122.3650-3-jgross@suse.com>
 <68bbc88a-075e-327b-47e1-1dca1f9a3772@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v8 2/3] xen/events: rework fifo queue locking
Message-ID: <65eaa8b6-601f-e522-9ad9-2d88e905d447@suse.com>
Date: Fri, 27 Nov 2020 14:31:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <68bbc88a-075e-327b-47e1-1dca1f9a3772@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2rHiV5LjUhONZVLnswYGHrQTfEeZp1OpH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2rHiV5LjUhONZVLnswYGHrQTfEeZp1OpH
Content-Type: multipart/mixed; boundary="SWmKRM9IfMPz2noWTThsUTRu6sebOSi82";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <65eaa8b6-601f-e522-9ad9-2d88e905d447@suse.com>
Subject: Re: [PATCH v8 2/3] xen/events: rework fifo queue locking
References: <20201125105122.3650-1-jgross@suse.com>
 <20201125105122.3650-3-jgross@suse.com>
 <68bbc88a-075e-327b-47e1-1dca1f9a3772@suse.com>
In-Reply-To: <68bbc88a-075e-327b-47e1-1dca1f9a3772@suse.com>

--SWmKRM9IfMPz2noWTThsUTRu6sebOSi82
Content-Type: multipart/mixed;
 boundary="------------CFC6A8A3632F14E22D795896"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------CFC6A8A3632F14E22D795896
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 27.11.20 14:11, Jan Beulich wrote:
> On 25.11.2020 11:51, Juergen Gross wrote:
>> Two cpus entering evtchn_fifo_set_pending() for the same event channel=

>> can race in case the first one gets interrupted after setting
>> EVTCHN_FIFO_PENDING and when the other one manages to set
>> EVTCHN_FIFO_LINKED before the first one is testing that bit. This can
>> lead to evtchn_check_pollers() being called before the event is put
>> properly into the queue, resulting eventually in the guest not seeing
>> the event pending and thus blocking forever afterwards.
>>
>> Note that commit 5f2df45ead7c1195 ("xen/evtchn: rework per event chann=
el
>> lock") made the race just more obvious, while the fifo event channel
>> implementation had this race from the beginning when an unmask operati=
on
>> was running in parallel with an event channel send operation.
>=20
> I notice you've altered the Fixes: tag, but you still say "from
> the beginning" here.

Oh, indeed. Thanks for spotting.

>=20
>> Using a spinlock for the per event channel lock is problematic due to
>> some paths needing to take the lock are called with interrupts off, so=

>> the lock would need to disable interrupts, which in turn breaks some
>> use cases related to vm events.
>=20
> This reads as if it got put here by mistake. May I suggest to start
> with "Using ... had turned out problematic ..." and then add
> something like "Therefore that lock was switched to an rw one"?

Fine with me.

>=20
>> For avoiding this race the queue locking in evtchn_fifo_set_pending()
>> needs to be reworked to cover the test of EVTCHN_FIFO_PENDING,
>> EVTCHN_FIFO_MASKED and EVTCHN_FIFO_LINKED, too. Additionally when an
>> event channel needs to change queues both queues need to be locked
>> initially.
>=20
> "... in order to avoid having a window with no lock held at all"?

Yes, this is better.

>=20
>> @@ -204,17 +175,67 @@ static void evtchn_fifo_set_pending(struct vcpu =
*v, struct evtchn *evtchn)
>>           return;
>>       }
>>  =20
>> +    /*
>> +     * Lock all queues related to the event channel (in case of a que=
ue change
>> +     * this might be two).
>> +     * It is mandatory to do that before setting and testing the PEND=
ING bit
>> +     * and to hold the current queue lock until the event has put int=
o the
>=20
> "has been" or "was" I think?

"has been".

>=20
> With adjustments along these lines (which I guess could again be
> done while committing) or reasons against supplied
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>=20
> One aspect which I wonder whether it wants adding to the description
> is that this change makes a bad situation worse: Back at the time
> per-channel locks were added to avoid the bottleneck of the per-
> domain event lock. While a per-queue lock's scope at least isn't the
> entire domain, their use on the send path still has been preventing
> full parallelism here. And this patch widens the lock holding region.

As the description already says that additional operations are to be
guarded by the lock I think it is rather clear that the lock holding
region is being widened.

OTOH I wouldn't reject such an addition to the commit message if you
think it is required.


Juergen

--------------CFC6A8A3632F14E22D795896
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

--------------CFC6A8A3632F14E22D795896--

--SWmKRM9IfMPz2noWTThsUTRu6sebOSi82--

--2rHiV5LjUhONZVLnswYGHrQTfEeZp1OpH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/A/7kFAwAAAAAACgkQsN6d1ii/Ey+0
Bwf/Zzu4iY5rX6AjXpNr5+v2c7p96VUsjfWpB4wDxwhPfYKGwEnujG89v5rrepZFAZxA0cd1xOon
h3t07ccYWwe/uEXgfk4WNzy9xoUKb36TcXZlclJkS96PBKUwLUfdNcINGAM8XWQlzj8kDTIIwODh
Pk0a/abTxMmvDdI+RJNi78W5X9s7VXeKDpJCAITbG+VFWJAKrIPh3B0cz8s9QwDheeMXEYO2jafX
6drX9h8U3NxIR5ThYuN6vpQSH1D3LlhNmnlBfj5uve8iiMKNpesckkyTJ0RqPk7XZfQ3Zk5CPzii
xRWPS2KxybF9ZNTA1Z15IJEKTUsOGT6UzbmMnK0Bcw==
=MJEs
-----END PGP SIGNATURE-----

--2rHiV5LjUhONZVLnswYGHrQTfEeZp1OpH--

