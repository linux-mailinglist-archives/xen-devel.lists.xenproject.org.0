Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007392C2A62
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 15:49:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36495.68419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khZdA-000871-7e; Tue, 24 Nov 2020 14:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36495.68419; Tue, 24 Nov 2020 14:49:20 +0000
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
	id 1khZdA-00086c-4U; Tue, 24 Nov 2020 14:49:20 +0000
Received: by outflank-mailman (input) for mailman id 36495;
 Tue, 24 Nov 2020 14:49:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KyA6=E6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1khZd9-00086X-46
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 14:49:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db6b45ca-5f51-4651-8939-e40ad7d25bc4;
 Tue, 24 Nov 2020 14:49:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1613EAC2D;
 Tue, 24 Nov 2020 14:49:17 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=KyA6=E6=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1khZd9-00086X-46
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 14:49:19 +0000
X-Inumbo-ID: db6b45ca-5f51-4651-8939-e40ad7d25bc4
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id db6b45ca-5f51-4651-8939-e40ad7d25bc4;
	Tue, 24 Nov 2020 14:49:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606229357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YYMk9Rdl/wr+gMPPVKevwp+N4vIbEHzR3njBJiV+0EA=;
	b=LsL7J7L1EeIHCA/D2vL+i05p7rpItPjIAIGO4UMidz0LTitpP2RKdlQrI7K+LvkRCt/L18
	02iM4AfF71fv+2Ij7KDfvgW9KunWg40Hvbv60yIpeBsohp9VRSGWE2IubiohBRe6FOZvvm
	MRPUkfivv47hLS6jieK2mqTSx/Q33mw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1613EAC2D;
	Tue, 24 Nov 2020 14:49:17 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201124070106.26854-1-jgross@suse.com>
 <20201124070106.26854-4-jgross@suse.com>
 <c627b42b-1e1f-b83a-2db8-b9e5fa5dce10@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v7 3/3] xen/events: rework fifo queue locking
Message-ID: <8e2853c3-9f84-2fd6-0e41-1f1d9172f236@suse.com>
Date: Tue, 24 Nov 2020 15:49:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <c627b42b-1e1f-b83a-2db8-b9e5fa5dce10@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zF9bznTrzkn7YH1WubmVMo7GOk6grn6c6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zF9bznTrzkn7YH1WubmVMo7GOk6grn6c6
Content-Type: multipart/mixed; boundary="AV9jh2wWkKyjo8tMpC7oODGClK0EpbYqo";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <8e2853c3-9f84-2fd6-0e41-1f1d9172f236@suse.com>
Subject: Re: [PATCH v7 3/3] xen/events: rework fifo queue locking
References: <20201124070106.26854-1-jgross@suse.com>
 <20201124070106.26854-4-jgross@suse.com>
 <c627b42b-1e1f-b83a-2db8-b9e5fa5dce10@suse.com>
In-Reply-To: <c627b42b-1e1f-b83a-2db8-b9e5fa5dce10@suse.com>

--AV9jh2wWkKyjo8tMpC7oODGClK0EpbYqo
Content-Type: multipart/mixed;
 boundary="------------15168547E2B60BB61346328D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------15168547E2B60BB61346328D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 24.11.20 15:02, Jan Beulich wrote:
> On 24.11.2020 08:01, Juergen Gross wrote:
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
> Ah yes, but then also only for inter-domain channels, as it was
> only in that case that the "wrong" domain's event lock was held.
> IOW there was a much earlier change already where this issue
> got widened (when the per-channel locking got introduced). This
> then got reduced to the original scope by XSA-343's adding of
> locking to evtchn_unmask(). (Not sure how much of this history
> wants actually adding here. I'm writing it down not the least to
> make sure I have a complete enough picture.)

I think we both agree that this race was possible for quite some time.
And I even think one customer bug I've been looking into recently
might be exactly this problem (a dom0 was occasionally hanging in
cross-cpu function calls, but switching to 2-level events made the
problem disappear).

>=20
>> For avoiding this race the queue locking in evtchn_fifo_set_pending()
>> needs to be reworked to cover the test of EVTCHN_FIFO_PENDING,
>> EVTCHN_FIFO_MASKED and EVTCHN_FIFO_LINKED, too.
>=20
> Perhaps mention the prior possible (and imo more natural)
> alternative of taking consistent per-channel locks would have
> been an alternative, until they got converted to rw ones?

Okay (with reasoning why this is no simple option due to the lock
needed to be taken with interrupts on and off).

>=20
>> Additionally when an
>> event channel needs to change queues both queues need to be locked
>> initially.
>=20
> Since this was (afaict) intentionally not the case before, I
> think I would want to see a word spent on the "why", perhaps
> better in a code comment than here. Even more so that you
> delete a respective comment justifying the possible race as
> permissible. And I have to admit right now I'm still uncertain
> both ways, i.e. I neither have a clear understanding of why it
> would have been considered fine the other way around before,
> nor why the double locking is strictly needed.

I need the double locking to avoid someone entering the locked region
when dropping the lock for the old queue and taking the one for the
new queue, as this would open the same race window again.

>=20
>> Fixes: 5f2df45ead7c1195 ("xen/evtchn: rework per event channel lock")
>> Fixes: 88910061ec615b2d ("evtchn: add FIFO-based event channel hyperca=
lls and port ops")
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> I guess at least this one wants a Reported-by.

Oh, right. Sorry for missing that.

>=20
>> @@ -204,6 +175,48 @@ static void evtchn_fifo_set_pending(struct vcpu *=
v, struct evtchn *evtchn)
>>           return;
>>       }
>>  =20
>> +    for ( try =3D 0; ; try++ )
>> +    {
>> +        union evtchn_fifo_lastq lastq;
>> +        struct vcpu *old_v;
>=20
> I think this one can have const added.

Yes.

>=20
>> +        lastq.raw =3D read_atomic(&evtchn->fifo_lastq);
>> +        old_v =3D d->vcpu[lastq.last_vcpu_id];
>> +
>> +        q =3D &v->evtchn_fifo->queue[evtchn->priority];
>> +        old_q =3D &old_v->evtchn_fifo->queue[lastq.last_priority];
>> +
>> +        if ( q <=3D old_q )
>> +        {
>> +            spin_lock_irqsave(&q->lock, flags);
>> +            if ( q !=3D old_q )
>> +                spin_lock(&old_q->lock);
>> +        }
>> +        else
>> +        {
>> +            spin_lock_irqsave(&old_q->lock, flags);
>> +            spin_lock(&q->lock);
>> +        }
>=20
> Since the vast majority of cases is going to be q =3D=3D old_q, would
> it be worth structuring this like
>=20
>          if ( q =3D=3D old_q )
>              spin_lock_irqsave(&q->lock, flags);
>          else if ( q < old_q )
>          {
>              spin_lock_irqsave(&q->lock, flags);
>              spin_lock(&old_q->lock);
>          }
>          else
>          {
>              spin_lock_irqsave(&old_q->lock, flags);
>              spin_lock(&q->lock);
>          }
>=20
> saving (on average) half a conditional in this most common
> case? (This is specifically different from the double locking in

Fine with me.

> event_channel.c, where the common case is to have different
> entities. In fact double_evtchn_{,un}lock() look to pointlessly
> check for chn1 =3D=3D chn2 - I guess I'll make a patch.)
>=20
>> +        lastq.raw =3D read_atomic(&evtchn->fifo_lastq);
>> +        old_v =3D d->vcpu[lastq.last_vcpu_id];
>> +        if ( q =3D=3D &v->evtchn_fifo->queue[evtchn->priority] &&
>> +             old_q =3D=3D &old_v->evtchn_fifo->queue[lastq.last_prior=
ity] )
>> +            break;
>> +
>> +        if ( q !=3D old_q )
>> +            spin_unlock(&old_q->lock);
>> +        spin_unlock_irqrestore(&q->lock, flags);
>> +
>> +        if ( try =3D=3D 3 )
>> +        {
>> +            gprintk(XENLOG_WARNING,
>> +                    "dom%d port %d lost event (too many queue changes=
)\n",
>> +                    d->domain_id, evtchn->port);
>> +            return;
>=20
> Originally evtchn_check_pollers() would still have been called
> in this case. Wouldn't you better retain this, or else justify
> the possibly observable change in behavior?

I could retain it, but without having set the event to be pending
I don't see the value in doing so.

>=20
>> @@ -228,22 +239,8 @@ static void evtchn_fifo_set_pending(struct vcpu *=
v, struct evtchn *evtchn)
>>               goto done;
>>           }
>=20
> This if() right above here can, aiui, in principle be moved out
> of the surrounding if(), at which point ...

It can even be moved out of the locked region.

>=20
>> -        /*
>> -         * No locking around getting the queue. This may race with
>> -         * changing the priority but we are allowed to signal the
>> -         * event once on the old priority.
>> -         */
>> -        q =3D &v->evtchn_fifo->queue[evtchn->priority];
>> -
>> -        old_q =3D lock_old_queue(d, evtchn, &flags);
>> -        if ( !old_q )
>> -            goto done;
>=20
> ... with all of this gone ...
>=20
>>           if ( guest_test_and_set_bit(d, EVTCHN_FIFO_LINKED, word) )
>> -        {
>> -            spin_unlock_irqrestore(&old_q->lock, flags);
>>               goto done;
>> -        }
>=20
> ... this could become part of the outer if(), replacing the 2nd
> guest_test_bit() there. (Possibly, if deemed worthwhile at all,
> to be carried out in a separate follow-on patch, to keep focus
> here on the actual goal.)

Will add a patch doing that.


Juergen

--------------15168547E2B60BB61346328D
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

--------------15168547E2B60BB61346328D--

--AV9jh2wWkKyjo8tMpC7oODGClK0EpbYqo--

--zF9bznTrzkn7YH1WubmVMo7GOk6grn6c6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+9HWwFAwAAAAAACgkQsN6d1ii/Ey8t
8Qf/dUdcxSnITZ6E3wUE8tfrGl9MhSKWtlvKLpFJ/GvzO5GUogcb/KYsXHTtYlZUKZlrAOWd155i
DvNev46nVsdqzZ2icyneHxwiQFsQa5GK6lM5xKlvZZ3RUUbTp522U01BkTYQuZTVRZhjCLYHBFd9
ZBXQERq/8NYSdP2qlyFWYVL2gpy2FS8CLMzkyZOxsagvNfTDdN/aK3N934qRcAjyn6PYGaUC20ux
Lpsc/uRJVbbdBedj6sQm28lNwcZ2oYY11Me/VHqmRRrEpl9SpBryVBkL56FVYyAd3wKKO+hTM/1Q
AeyqmVsZQ7CHey6fuA1PEsVuctoQKXjqQekd7mYMGw==
=9C+d
-----END PGP SIGNATURE-----

--zF9bznTrzkn7YH1WubmVMo7GOk6grn6c6--

