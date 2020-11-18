Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 627CA2B78F5
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 09:42:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29409.58779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJ1q-00069E-O2; Wed, 18 Nov 2020 08:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29409.58779; Wed, 18 Nov 2020 08:41:26 +0000
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
	id 1kfJ1q-00068p-Kk; Wed, 18 Nov 2020 08:41:26 +0000
Received: by outflank-mailman (input) for mailman id 29409;
 Wed, 18 Nov 2020 08:41:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RdwY=EY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kfJ1p-00068k-17
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:41:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67267c97-4aca-4604-ba16-8d575d54d979;
 Wed, 18 Nov 2020 08:41:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5E94BAE95;
 Wed, 18 Nov 2020 08:41:22 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=RdwY=EY=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kfJ1p-00068k-17
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:41:25 +0000
X-Inumbo-ID: 67267c97-4aca-4604-ba16-8d575d54d979
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 67267c97-4aca-4604-ba16-8d575d54d979;
	Wed, 18 Nov 2020 08:41:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605688883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LpwAH/GDaRA0BAynstm4DBtmv+8jvkwy3qqO+caih7o=;
	b=d9GRlPgYwr4CylEPH07DgUA5VMDqWtL805c6+h8nMrZA3HDF8+Mh7i6Ctp4g8SVXbtLdIe
	ShHNKXm+SGc737Gq8tT6zJ57Y3MafTrqTOHjgBQakvijLeeWHNKzuAJFTk1UHzv8Xx4vYW
	Joh5ebKsqSPOpXNt0+Qso9ypQKZtyqM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5E94BAE95;
	Wed, 18 Nov 2020 08:41:22 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "committers@xenproject.org" <committers@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20201109163826.13035-1-jgross@suse.com>
 <aaa3c26f-4bfa-d881-8e72-112e3108f4b5@xen.org>
 <1b54d0bb-deab-f4bd-b773-67a716a1fde1@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v6 0/3] XSA-343 followup patches
Message-ID: <4cb2e205-49e2-7dc6-9ae6-39e5335d5a66@suse.com>
Date: Wed, 18 Nov 2020 09:41:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1b54d0bb-deab-f4bd-b773-67a716a1fde1@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FXzOFNujxRUFWmQAKDJtTeDBpa00mZwMp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FXzOFNujxRUFWmQAKDJtTeDBpa00mZwMp
Content-Type: multipart/mixed; boundary="sEOoyfPY7Z5a1OnwlcqO1aeXveYQYLC1J";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "committers@xenproject.org" <committers@xenproject.org>,
 xen-devel@lists.xenproject.org
Message-ID: <4cb2e205-49e2-7dc6-9ae6-39e5335d5a66@suse.com>
Subject: Re: [PATCH v6 0/3] XSA-343 followup patches
References: <20201109163826.13035-1-jgross@suse.com>
 <aaa3c26f-4bfa-d881-8e72-112e3108f4b5@xen.org>
 <1b54d0bb-deab-f4bd-b773-67a716a1fde1@suse.com>
In-Reply-To: <1b54d0bb-deab-f4bd-b773-67a716a1fde1@suse.com>

--sEOoyfPY7Z5a1OnwlcqO1aeXveYQYLC1J
Content-Type: multipart/mixed;
 boundary="------------0B6C86B437E196B9BA7EBD76"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0B6C86B437E196B9BA7EBD76
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 18.11.20 09:22, Jan Beulich wrote:
> On 17.11.2020 19:13, Julien Grall wrote:
>> On 09/11/2020 16:38, Juergen Gross wrote:
>>> Juergen Gross (3):
>>>     xen/events: access last_priority and last_vcpu_id together
>>>     xen/evtchn: rework per event channel lock
>>>     xen/evtchn: revert 52e1fc47abc3a0123
>>
>> While looking at the list of commits, I noticed that the first patch
>> hasn't been committed. They were all acked/reviewed, so I am a bit
>> puzzled why this was omitted...
>>
>> I have nearly missed as I was expecting the 3 patches to be committed
>> together. May I suggest that in the future we reply to the cover lette=
r
>> and mention which patches are (or not) committed?
>>
>> Regarding patch #1, I will commit it tomorrow unless there are strong
>> objections against.
>=20
> Without a clear outline of what would break with the present logic,
> I had previously indicated I'm not convinced of the change. This
> isn't a strong objection, no, but I still wouldn't want to see my
> name associated with it in such a case. Furthermore I clearly view
> this as not a backporting candidate, while the other two are (as I
> did previously indicate). Hence the latter two patches wanted
> re-basing ahead of the first one anyway, to ease the backports.

Consider an NMI during evtchn_fifo_set_pending() between updating
last_vcpu_id and last_priority, while on another cpu a concurrent
evtchn_fifo_set_pending() is being called. On that other cpu
lock_old_queue() might return a wrong queue as it will read only
the new last_vcpu_id, but not the new last_priority value.


Juergen

--------------0B6C86B437E196B9BA7EBD76
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

--------------0B6C86B437E196B9BA7EBD76--

--sEOoyfPY7Z5a1OnwlcqO1aeXveYQYLC1J--

--FXzOFNujxRUFWmQAKDJtTeDBpa00mZwMp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+03jAFAwAAAAAACgkQsN6d1ii/Ey9t
CQf/bWpcfOx86E1Zj+iHp/oIvHSOGWJAu+TVpqOsWkgQG3uApnk03LtgjqZ+JeBj89tCI3XMxAPR
m1g92cD72l/zZQczkWZXHT73yL3q1WxQEKfqN3x/xDKm9ycOOZYDG0Sq4ibnjGHsL7eYAA/RhRgl
IXua0CFcMC5hTaT2V8cDYf6ynhEoGckWIqnhJ2rN/s84YAkxesoJpK1MX7RRPIGF3LI2esbhX2Ky
7J2SLZgSxrhi6vyC4Ug/dNzVudhwGyBdvhZ/oEWZjsLqn4VYsxc/+gMwbuf79cmeuPCeWyU8NIMY
TU0of/7QBTYoS4uk6b/3eJ8RjYt9zkDWBYBwCWdqNw==
=7oDf
-----END PGP SIGNATURE-----

--FXzOFNujxRUFWmQAKDJtTeDBpa00mZwMp--

