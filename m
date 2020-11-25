Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B082C3876
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 06:24:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37264.69533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khnHZ-00089R-09; Wed, 25 Nov 2020 05:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37264.69533; Wed, 25 Nov 2020 05:23:56 +0000
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
	id 1khnHY-000892-Sb; Wed, 25 Nov 2020 05:23:56 +0000
Received: by outflank-mailman (input) for mailman id 37264;
 Wed, 25 Nov 2020 05:23:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X3kr=E7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1khnHX-00088w-Am
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 05:23:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de01df1e-9119-415d-a1e8-897040311881;
 Wed, 25 Nov 2020 05:23:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 27C72AC2F;
 Wed, 25 Nov 2020 05:23:53 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X3kr=E7=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1khnHX-00088w-Am
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 05:23:55 +0000
X-Inumbo-ID: de01df1e-9119-415d-a1e8-897040311881
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id de01df1e-9119-415d-a1e8-897040311881;
	Wed, 25 Nov 2020 05:23:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606281833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U8qXYd9PB9mHD56RdIm1vJxk80bxdwKT3Ikw2dfLbp4=;
	b=UgqVcqL1R+rXsSOUzPtCE+LhZD4/cd7ZDp1ofejH0KhoHE1CzwnHAlaQE34Q8dLOe5MvW0
	tZAR2zAX8N3xFbktVnAiEqAM72hp/8A3oGxruMS8ufY9RjcSwvNNxx7lwO9PhEtNx/bccj
	an0ghHHNUhd1PyJcubV1HFvvn9IPjAU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 27C72AC2F;
	Wed, 25 Nov 2020 05:23:53 +0000 (UTC)
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
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v7 3/3] xen/events: rework fifo queue locking
Message-ID: <cce1b71c-aa37-a3b7-990e-bd2f0437d074@suse.com>
Date: Wed, 25 Nov 2020 06:23:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <9eada207-9880-b2fe-054c-f3218d2034b2@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zpw0yUJnh4PXtxncz4e90AvFrVDexK14S"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zpw0yUJnh4PXtxncz4e90AvFrVDexK14S
Content-Type: multipart/mixed; boundary="EaevYunMTJ8F9bWn6k33TwxLSYzPWyxls";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <cce1b71c-aa37-a3b7-990e-bd2f0437d074@suse.com>
Subject: Re: [PATCH v7 3/3] xen/events: rework fifo queue locking
References: <20201124070106.26854-1-jgross@suse.com>
 <20201124070106.26854-4-jgross@suse.com>
 <c627b42b-1e1f-b83a-2db8-b9e5fa5dce10@suse.com>
 <8e2853c3-9f84-2fd6-0e41-1f1d9172f236@suse.com>
 <9eada207-9880-b2fe-054c-f3218d2034b2@suse.com>
In-Reply-To: <9eada207-9880-b2fe-054c-f3218d2034b2@suse.com>

--EaevYunMTJ8F9bWn6k33TwxLSYzPWyxls
Content-Type: multipart/mixed;
 boundary="------------54EF68A2A444426C4D6CC124"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------54EF68A2A444426C4D6CC124
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 24.11.20 17:32, Jan Beulich wrote:
> On 24.11.2020 15:49, J=C3=BCrgen Gro=C3=9F wrote:
>> On 24.11.20 15:02, Jan Beulich wrote:
>>> On 24.11.2020 08:01, Juergen Gross wrote:
>>>> Two cpus entering evtchn_fifo_set_pending() for the same event chann=
el
>>>> can race in case the first one gets interrupted after setting
>>>> EVTCHN_FIFO_PENDING and when the other one manages to set
>>>> EVTCHN_FIFO_LINKED before the first one is testing that bit. This ca=
n
>>>> lead to evtchn_check_pollers() being called before the event is put
>>>> properly into the queue, resulting eventually in the guest not seein=
g
>>>> the event pending and thus blocking forever afterwards.
>>>>
>>>> Note that commit 5f2df45ead7c1195 ("xen/evtchn: rework per event cha=
nnel
>>>> lock") made the race just more obvious, while the fifo event channel=

>>>> implementation had this race from the beginning when an unmask opera=
tion
>>>> was running in parallel with an event channel send operation.
>>>
>>> Ah yes, but then also only for inter-domain channels, as it was
>>> only in that case that the "wrong" domain's event lock was held.
>>> IOW there was a much earlier change already where this issue
>>> got widened (when the per-channel locking got introduced). This
>>> then got reduced to the original scope by XSA-343's adding of
>>> locking to evtchn_unmask(). (Not sure how much of this history
>>> wants actually adding here. I'm writing it down not the least to
>>> make sure I have a complete enough picture.)
>>
>> I think we both agree that this race was possible for quite some time.=

>> And I even think one customer bug I've been looking into recently
>> might be exactly this problem (a dom0 was occasionally hanging in
>> cross-cpu function calls, but switching to 2-level events made the
>> problem disappear).
>=20
> IPIs weren't affected earlier on (i.e. in any released version),
> if my analysis above is correct.

I don't think it is correct.

An unmask operation in parallel with set_pending will have had the
same race for IPIs.

>=20
>>>> Additionally when an
>>>> event channel needs to change queues both queues need to be locked
>>>> initially.
>>>
>>> Since this was (afaict) intentionally not the case before, I
>>> think I would want to see a word spent on the "why", perhaps
>>> better in a code comment than here. Even more so that you
>>> delete a respective comment justifying the possible race as
>>> permissible. And I have to admit right now I'm still uncertain
>>> both ways, i.e. I neither have a clear understanding of why it
>>> would have been considered fine the other way around before,
>>> nor why the double locking is strictly needed.
>>
>> I need the double locking to avoid someone entering the locked region
>> when dropping the lock for the old queue and taking the one for the
>> new queue, as this would open the same race window again.
>=20
> Well, that's what have already said. Thing is that the code
> prior to your change gives the impression as if this race was
> benign.

The race regarding a queue change, yes. But not the race I'm fixing with
this patch. I need to make sure that only one caller is inside the big
if clause for a specific event. And dropping the lock inside this clause
would violate that assumption.

>=20
>>>> +        lastq.raw =3D read_atomic(&evtchn->fifo_lastq);
>>>> +        old_v =3D d->vcpu[lastq.last_vcpu_id];
>>>> +        if ( q =3D=3D &v->evtchn_fifo->queue[evtchn->priority] &&
>>>> +             old_q =3D=3D &old_v->evtchn_fifo->queue[lastq.last_pri=
ority] )
>>>> +            break;
>>>> +
>>>> +        if ( q !=3D old_q )
>>>> +            spin_unlock(&old_q->lock);
>>>> +        spin_unlock_irqrestore(&q->lock, flags);
>>>> +
>>>> +        if ( try =3D=3D 3 )
>>>> +        {
>>>> +            gprintk(XENLOG_WARNING,
>>>> +                    "dom%d port %d lost event (too many queue chang=
es)\n",
>>>> +                    d->domain_id, evtchn->port);
>>>> +            return;
>>>
>>> Originally evtchn_check_pollers() would still have been called
>>> in this case. Wouldn't you better retain this, or else justify
>>> the possibly observable change in behavior?
>>
>> I could retain it, but without having set the event to be pending
>> I don't see the value in doing so.
>=20
> But that's part of my concern - you now don't set PENDING when
> bailing here.

Hmm, I'm not sure this will really help, as the event still won't be
LINKED, what is necessary for the guest to recognize the event to be
pending.

OTOH if the event is masked setting the PENDING bit would ensure
proper handling later, so it is better to do that, even with the risk
to have the same old race again in this case (which might have the
same effect as not setting PENDING, but with a much lower probability).

I'll change the locking to handle that properly.


Juergen

--------------54EF68A2A444426C4D6CC124
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

--------------54EF68A2A444426C4D6CC124--

--EaevYunMTJ8F9bWn6k33TwxLSYzPWyxls--

--zpw0yUJnh4PXtxncz4e90AvFrVDexK14S
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+96mgFAwAAAAAACgkQsN6d1ii/Ey+q
9wf/TsMxcGF9sM3ubJaQtnqozl3eDEr4qYrj2dAygZZ5udrLfISTvd93a9o2yphAlRvr2Nbmy95o
BfYFe3FIIfAaK4S75cA+RpCMlzAehQSFJtClIrja4CIbp1n8HG2vfUjuGCDiQHCnWXftO9zRSeqB
yfec8H0g6dt73ujdmWtVO+COGZ1WqEyXWY6IpOmX1dSJcHPwiONCgVTkEA9YqC3rB+PXO5EFuJIk
HHNtvRG0NwPJR4qN4qP5T88dhpKKePIIOs/HfLltMGPsWGbmRgsQInbX/1FIUvxNaLn0g0kIMoF9
9fCXAJNjxWtmvMdRhs6VDchI/StL244xLSnsm2s8Yg==
=C/mj
-----END PGP SIGNATURE-----

--zpw0yUJnh4PXtxncz4e90AvFrVDexK14S--

