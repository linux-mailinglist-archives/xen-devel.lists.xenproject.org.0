Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0F02C3B14
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 09:29:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37420.69773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khqAr-0001Dw-QY; Wed, 25 Nov 2020 08:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37420.69773; Wed, 25 Nov 2020 08:29:13 +0000
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
	id 1khqAr-0001DX-NO; Wed, 25 Nov 2020 08:29:13 +0000
Received: by outflank-mailman (input) for mailman id 37420;
 Wed, 25 Nov 2020 08:29:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X3kr=E7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1khqAq-0001DS-FM
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 08:29:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3db7e83-8a91-44c4-bff5-eeef9972e782;
 Wed, 25 Nov 2020 08:29:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B8592AC75;
 Wed, 25 Nov 2020 08:29:10 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X3kr=E7=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1khqAq-0001DS-FM
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 08:29:12 +0000
X-Inumbo-ID: c3db7e83-8a91-44c4-bff5-eeef9972e782
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c3db7e83-8a91-44c4-bff5-eeef9972e782;
	Wed, 25 Nov 2020 08:29:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606292950; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZKd5ZCt572UnVzRaw3rZZd4bRDi06Pu84QgiIKlcDrE=;
	b=dYfl5veH5H7GujeAD/9br1q5udpUiVVcwP/i3jOBp6o2wS7hzaaOeaoM4chf3xlj4JeBTT
	rmwJE24qvhVUHSKK33Qe/lhLiOfpvwwz691QVw/gunFkCj+DZVTysg9auydJ10ekr1AK5w
	y04EQuUkfchsQvB4jhqxA6ehZ1Mdbm8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B8592AC75;
	Wed, 25 Nov 2020 08:29:10 +0000 (UTC)
Subject: Re: [PATCH v7 3/3] xen/events: rework fifo queue locking
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201124070106.26854-1-jgross@suse.com>
 <20201124070106.26854-4-jgross@suse.com>
 <c627b42b-1e1f-b83a-2db8-b9e5fa5dce10@suse.com>
 <8e2853c3-9f84-2fd6-0e41-1f1d9172f236@suse.com>
 <9eada207-9880-b2fe-054c-f3218d2034b2@suse.com>
 <cce1b71c-aa37-a3b7-990e-bd2f0437d074@suse.com>
 <c3091b91-b594-7a5e-f008-6df10db227ec@suse.com>
 <a1b7307a-f825-091f-8499-10e47046ff07@suse.com>
 <10293fd3-2893-2dee-c022-a36bec3fc87f@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <49be5ba9-edba-7486-dde2-2a557a51017f@suse.com>
Date: Wed, 25 Nov 2020 09:29:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <10293fd3-2893-2dee-c022-a36bec3fc87f@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TPVb0wBsWxS3PtiQYRuZ0umk97OmgpAx1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TPVb0wBsWxS3PtiQYRuZ0umk97OmgpAx1
Content-Type: multipart/mixed; boundary="Rzj1t93VqeDJMAlQS92MFWtsAidJv3o1L";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <49be5ba9-edba-7486-dde2-2a557a51017f@suse.com>
Subject: Re: [PATCH v7 3/3] xen/events: rework fifo queue locking
References: <20201124070106.26854-1-jgross@suse.com>
 <20201124070106.26854-4-jgross@suse.com>
 <c627b42b-1e1f-b83a-2db8-b9e5fa5dce10@suse.com>
 <8e2853c3-9f84-2fd6-0e41-1f1d9172f236@suse.com>
 <9eada207-9880-b2fe-054c-f3218d2034b2@suse.com>
 <cce1b71c-aa37-a3b7-990e-bd2f0437d074@suse.com>
 <c3091b91-b594-7a5e-f008-6df10db227ec@suse.com>
 <a1b7307a-f825-091f-8499-10e47046ff07@suse.com>
 <10293fd3-2893-2dee-c022-a36bec3fc87f@suse.com>
In-Reply-To: <10293fd3-2893-2dee-c022-a36bec3fc87f@suse.com>

--Rzj1t93VqeDJMAlQS92MFWtsAidJv3o1L
Content-Type: multipart/mixed;
 boundary="------------E5E54DD56807CFCFDAE07E50"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E5E54DD56807CFCFDAE07E50
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 25.11.20 09:25, Jan Beulich wrote:
> On 25.11.2020 09:08, J=C3=BCrgen Gro=C3=9F wrote:
>> On 25.11.20 08:42, Jan Beulich wrote:
>>> On 25.11.2020 06:23, J=C3=BCrgen Gro=C3=9F wrote:
>>>> On 24.11.20 17:32, Jan Beulich wrote:
>>>>> On 24.11.2020 15:49, J=C3=BCrgen Gro=C3=9F wrote:
>>>>>> On 24.11.20 15:02, Jan Beulich wrote:
>>>>>>> On 24.11.2020 08:01, Juergen Gross wrote:
>>>>>>>> Two cpus entering evtchn_fifo_set_pending() for the same event c=
hannel
>>>>>>>> can race in case the first one gets interrupted after setting
>>>>>>>> EVTCHN_FIFO_PENDING and when the other one manages to set
>>>>>>>> EVTCHN_FIFO_LINKED before the first one is testing that bit. Thi=
s can
>>>>>>>> lead to evtchn_check_pollers() being called before the event is =
put
>>>>>>>> properly into the queue, resulting eventually in the guest not s=
eeing
>>>>>>>> the event pending and thus blocking forever afterwards.
>>>>>>>>
>>>>>>>> Note that commit 5f2df45ead7c1195 ("xen/evtchn: rework per event=
 channel
>>>>>>>> lock") made the race just more obvious, while the fifo event cha=
nnel
>>>>>>>> implementation had this race from the beginning when an unmask o=
peration
>>>>>>>> was running in parallel with an event channel send operation.
>>>>>>>
>>>>>>> Ah yes, but then also only for inter-domain channels, as it was
>>>>>>> only in that case that the "wrong" domain's event lock was held.
>>>>>>> IOW there was a much earlier change already where this issue
>>>>>>> got widened (when the per-channel locking got introduced). This
>>>>>>> then got reduced to the original scope by XSA-343's adding of
>>>>>>> locking to evtchn_unmask(). (Not sure how much of this history
>>>>>>> wants actually adding here. I'm writing it down not the least to
>>>>>>> make sure I have a complete enough picture.)
>>>>>>
>>>>>> I think we both agree that this race was possible for quite some t=
ime.
>>>>>> And I even think one customer bug I've been looking into recently
>>>>>> might be exactly this problem (a dom0 was occasionally hanging in
>>>>>> cross-cpu function calls, but switching to 2-level events made the=

>>>>>> problem disappear).
>>>>>
>>>>> IPIs weren't affected earlier on (i.e. in any released version),
>>>>> if my analysis above is correct.
>>>>
>>>> I don't think it is correct.
>>>>
>>>> An unmask operation in parallel with set_pending will have had the
>>>> same race for IPIs.
>>>
>>> Why? When FIFO locks were introduced, the event lock got acquired
>>> around the call to evtchn_unmask(), and IPIs got sent with that
>>> lock similarly held. Likewise after XSA-343 evtchn_unmask() as
>>> well as the sending of IPIs acquire the per-channel lock (which at
>>> that point was still an ordinary spin lock).
>>
>> Oh, I think we are talking about different paths.
>>
>> I'm talking about EVTCHNOP_unmask. There is no lock involved when
>> calling evtchn_unmask().
>=20
> Above I said "When FIFO locks were introduced, the event lock got
> acquired around the call to evtchn_unmask()" and further "Likewise
> after XSA-343 evtchn_unmask() ..." I can't see how we're talking
> of different paths here. The situation has changed from back then
> (lock in the callers of evtchn_unmask()) to after XSA-343 (lock in
> evtchn_unmask()), but there was suitable locking. There was a
> (large) window in time prior to XSA-343 where there was indeed no
> locking, but that was introduced by the conversion to per-channel
> locks and addressed by one of the XSA-343 changes. The issue then
> got re-introduced by converting spin_lock() to read_lock().

Okay, then I misunderstood your claim. I thought you meant there was
always suitable locking before the rwlock change. So I need to modify
the Fixes: tag.


Juergen

--------------E5E54DD56807CFCFDAE07E50
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

--------------E5E54DD56807CFCFDAE07E50--

--Rzj1t93VqeDJMAlQS92MFWtsAidJv3o1L--

--TPVb0wBsWxS3PtiQYRuZ0umk97OmgpAx1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl++FdYFAwAAAAAACgkQsN6d1ii/Ey+l
ygf/RHCQk3EXiHGSicg6J4nW8ZVlIQuDjg5rVsJTlb+1LITPiF9a83eBVfDQyRvKKNw76xBJs+b1
7wL+5Si+1EqQ4nwLIXW0aik/lZGggaKflz7dWM42fWUz92Rn1BlQn+/dGj0PDX2J01o8bCqLstPO
4nb1B1AZAtKd2A/oxFUJDNHfOP/W3S9UKDA2IHZ05izjeCsJuqkDZ5cVeha/891hrn76sq3TqdrQ
/YOWy7UYr4edYf27PiELL8H8Z76iWql00gjSWBRfciLjpXrVWwYNH0t7u8boZE4jvBG6roCDbQtR
UsEkPCZF01nEC4SXE3xs1mEYUH0s9GtvwlaxfLJRFw==
=2Ypl
-----END PGP SIGNATURE-----

--TPVb0wBsWxS3PtiQYRuZ0umk97OmgpAx1--

