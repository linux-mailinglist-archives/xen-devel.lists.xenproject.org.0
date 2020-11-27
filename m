Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCD72C6730
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 14:49:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39384.72272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kie7f-0002UJ-Ef; Fri, 27 Nov 2020 13:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39384.72272; Fri, 27 Nov 2020 13:49:15 +0000
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
	id 1kie7f-0002Tu-Ah; Fri, 27 Nov 2020 13:49:15 +0000
Received: by outflank-mailman (input) for mailman id 39384;
 Fri, 27 Nov 2020 13:49:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hQCY=FB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kie7d-0002Tp-Uf
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:49:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5eb8aff6-ef61-4b54-893e-dadc61cb0ea4;
 Fri, 27 Nov 2020 13:49:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7CC80AC23;
 Fri, 27 Nov 2020 13:49:11 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hQCY=FB=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kie7d-0002Tp-Uf
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:49:13 +0000
X-Inumbo-ID: 5eb8aff6-ef61-4b54-893e-dadc61cb0ea4
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5eb8aff6-ef61-4b54-893e-dadc61cb0ea4;
	Fri, 27 Nov 2020 13:49:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606484951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yy6jqs2Qy45tVq7pWE5Gfy9Kpou3UWJhCYvaI7gOaO4=;
	b=QrHQKqJIcRoFY0zHjEfx4kmy1NrmpfRuEZb4Gb9kgTPN8x9Z9hn0nRN7aP3+8VJXkhsFBT
	9rgP4o457EMPpv2ug94ASmEoENv0g1AgdB9hLHjKQg0nShu9jP8h4TdEMdW2YIhg0crlpW
	AKloTvzF9sbnSEvzinoXlxMhsDkNl5E=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7CC80AC23;
	Fri, 27 Nov 2020 13:49:11 +0000 (UTC)
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
To: Jan Beulich <jbeulich@suse.com>, Manuel Bouyer <bouyer@antioche.eu.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201124160914.GQ2020@antioche.eu.org>
 <20201126133444.r2oi24i3umh7shb3@Air-de-Roger>
 <20201126141608.GA4123@antioche.eu.org>
 <20201126142635.uzi643co3mxp5h42@Air-de-Roger>
 <20201126150937.jhbfp7iefkmtedx7@Air-de-Roger>
 <20201126172034.GA7642@antioche.eu.org>
 <20201127105948.ji5gxv4e7axrvgpo@Air-de-Roger>
 <e9610278-84e5-dc32-b568-8867011de4e4@suse.com>
 <20201127131324.GJ1717@antioche.eu.org>
 <714e9393-d7f4-ed47-d1ed-aff79f3552a0@suse.com>
 <20201127133121.GN1717@antioche.eu.org>
 <96aa5a9b-3f4a-ce9d-0f41-4a24d409ed55@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <cb87ed52-e9c1-ad27-4c89-82f5b519b83c@suse.com>
Date: Fri, 27 Nov 2020 14:49:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <96aa5a9b-3f4a-ce9d-0f41-4a24d409ed55@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nRefgtBdgfjzBGxfvXj8vUS8E9Zes41Yn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nRefgtBdgfjzBGxfvXj8vUS8E9Zes41Yn
Content-Type: multipart/mixed; boundary="emswArTsDVtaTLp3oTl0LQv33kxUnwAfH";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Manuel Bouyer <bouyer@antioche.eu.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Message-ID: <cb87ed52-e9c1-ad27-4c89-82f5b519b83c@suse.com>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
References: <20201124160914.GQ2020@antioche.eu.org>
 <20201126133444.r2oi24i3umh7shb3@Air-de-Roger>
 <20201126141608.GA4123@antioche.eu.org>
 <20201126142635.uzi643co3mxp5h42@Air-de-Roger>
 <20201126150937.jhbfp7iefkmtedx7@Air-de-Roger>
 <20201126172034.GA7642@antioche.eu.org>
 <20201127105948.ji5gxv4e7axrvgpo@Air-de-Roger>
 <e9610278-84e5-dc32-b568-8867011de4e4@suse.com>
 <20201127131324.GJ1717@antioche.eu.org>
 <714e9393-d7f4-ed47-d1ed-aff79f3552a0@suse.com>
 <20201127133121.GN1717@antioche.eu.org>
 <96aa5a9b-3f4a-ce9d-0f41-4a24d409ed55@suse.com>
In-Reply-To: <96aa5a9b-3f4a-ce9d-0f41-4a24d409ed55@suse.com>

--emswArTsDVtaTLp3oTl0LQv33kxUnwAfH
Content-Type: multipart/mixed;
 boundary="------------95E40551A22C7F7DB50B9513"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------95E40551A22C7F7DB50B9513
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 27.11.20 14:40, Jan Beulich wrote:
> On 27.11.2020 14:31, Manuel Bouyer wrote:
>> On Fri, Nov 27, 2020 at 02:18:54PM +0100, Jan Beulich wrote:
>>> On 27.11.2020 14:13, Manuel Bouyer wrote:
>>>> On Fri, Nov 27, 2020 at 12:29:35PM +0100, Jan Beulich wrote:
>>>>> On 27.11.2020 11:59, Roger Pau Monn=C3=A9 wrote:
>>>>>> --- a/xen/arch/x86/hvm/irq.c
>>>>>> +++ b/xen/arch/x86/hvm/irq.c
>>>>>> @@ -187,6 +187,10 @@ void hvm_gsi_assert(struct domain *d, unsigne=
d int gsi)
>>>>>>        * to know if the GSI is pending or not.
>>>>>>        */
>>>>>>       spin_lock(&d->arch.hvm.irq_lock);
>>>>>> +    if ( gsi =3D=3D TRACK_IRQ )
>>>>>> +        debugtrace_printk("hvm_gsi_assert irq %u trig %u assert c=
ount %u\n",
>>>>>> +                          gsi, trig, hvm_irq->gsi_assert_count[gs=
i]);
>>>>>
>>>>> This produces
>>>>>
>>>>> 81961 hvm_gsi_assert irq 34 trig 1 assert count 1
>>>>>
>>>>> Since the logging occurs ahead of the call to assert_gsi(), it
>>>>> means we don't signal anything to Dom0, because according to our
>>>>> records there's still an IRQ in flight. Unfortunately we only
>>>>> see the tail of the trace, so it's not possible to tell how / when
>>>>> we got into this state.
>>>>>
>>>>> Manuel - is this the only patch you have in place? Or did you keep
>>>>> any prior ones? Iirc there once was one where Roger also suppressed=

>>>>> some de-assert call.
>>>>
>>>> Yes, I have some of the previous patches (otherwise Xen panics).
>>>> Attached is the diffs I currently have
>>>
>>> I think you want to delete the hunk dropping the call to
>>> hvm_gsi_deassert() from pt_irq_time_out(). Iirc it was that
>>> addition which changed the behavior to just a single IRQ ever
>>> making it into Dom0. And it ought to be only the change to
>>> msix_write() which is needed to avoid the panic.
>>
>> yes, I did keep the hvm_gsi_deassert() patch because I expected it
>> to make things easier, as it allows to interract with Xen without chan=
ging
>> interrupt states.
>=20
> Right, but then we'd need to see the beginning of the trace,
> rather than it starting at (in this case) about 95,000. Yet ...
>=20
>> I removed it, here's a new trace
>>
>> http://www-soc.lip6.fr/~bouyer/xen-log12.txt
>=20
> ... hmm, odd - no change at all:
>=20
> 95572 hvm_gsi_assert irq 34 trig 1 assert count 1
>=20
> I was sort of expecting that this might be where we fail to
> set the assert count back to zero. Will need further
> thinking, if nothing else than how to turn down the verbosity
> without hiding crucial information. Or maybe Roger has got
> some idea ...

Set debugtrace buffer size to something huge?

Panic when the buffer is full?

It should be noted that the debugtrace in being printed in case of a
panic.


Juergen


--------------95E40551A22C7F7DB50B9513
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

--------------95E40551A22C7F7DB50B9513--

--emswArTsDVtaTLp3oTl0LQv33kxUnwAfH--

--nRefgtBdgfjzBGxfvXj8vUS8E9Zes41Yn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/BA9YFAwAAAAAACgkQsN6d1ii/Ey/V
DAf/QfhvI8GsqykXmV/pfBGjilhDBSm29uHEBAmQACse1lqDncdPUmgAtNCh1pfSyRQnNUZPspy2
Pww5GvtSGsI/4BVSVx1Fm/DZvn0MR2CkSVD+NLwADWqBmuc6dkJd7msBSresx8/jhDpJigVj2ZaZ
0fpyA+qu1GDH6kpipRnTDucuv3JSx4ojEPvVOrIW2lRS8AYYYSUBT5NSmyLCS/7i/aJp6meLkH72
zmHTXyHqoDvgrxdaDEMr/5myXHjyIbR4Ebc6Ukd/7OzvOyxFpTfxJb+m2jcf8HsEQ94bS1TkXYew
pYmdLWRyqWkXd7TqFwI3zKsKCJfnJdo3ew/Rv4fMuw==
=pu52
-----END PGP SIGNATURE-----

--nRefgtBdgfjzBGxfvXj8vUS8E9Zes41Yn--

