Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC4E2C679D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 15:15:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39448.72368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kieWJ-00066v-Gd; Fri, 27 Nov 2020 14:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39448.72368; Fri, 27 Nov 2020 14:14:43 +0000
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
	id 1kieWJ-00066W-DP; Fri, 27 Nov 2020 14:14:43 +0000
Received: by outflank-mailman (input) for mailman id 39448;
 Fri, 27 Nov 2020 14:14:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hQCY=FB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kieWI-00066R-IH
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:14:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3c6a597-7eab-4853-ae5a-18c82f6f59e7;
 Fri, 27 Nov 2020 14:14:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D786AE59;
 Fri, 27 Nov 2020 14:14:39 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hQCY=FB=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kieWI-00066R-IH
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:14:42 +0000
X-Inumbo-ID: c3c6a597-7eab-4853-ae5a-18c82f6f59e7
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c3c6a597-7eab-4853-ae5a-18c82f6f59e7;
	Fri, 27 Nov 2020 14:14:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606486479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H5+j1VjDw3rrB9Y/+RHthiScLa1UYvpUqJE4Gf0S3c8=;
	b=ZZv7G1rel6+JicX1h3L7eZiGoJfdjE+fR9vMYivS52mViznlH5kZPcq9UlZALTZnpPnGIJ
	yVtDLZKtAgf/hvRYOBnDipA2PwkCWBe+f9ZC/zzC1rhR7bhxNJ5v7sC+aiTp8qNhm9cnxF
	0Uf9Fq9kz9rU8BpFUFgGcJeTYF0uTq0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7D786AE59;
	Fri, 27 Nov 2020 14:14:39 +0000 (UTC)
Subject: Re: [PATCH v8 2/3] xen/events: rework fifo queue locking
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201125105122.3650-1-jgross@suse.com>
 <20201125105122.3650-3-jgross@suse.com>
 <e60e4fce-8c1b-013a-9ec2-20bd2c930619@xen.org>
 <2b099865-647c-3d47-1510-d429c2a4b6c6@suse.com>
 <5f04e881-915f-e2b7-6af3-459af614f8ca@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c9a8e879-ff55-3fbc-41ab-df836c76be9f@suse.com>
Date: Fri, 27 Nov 2020 15:14:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <5f04e881-915f-e2b7-6af3-459af614f8ca@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JiVqM4SgNy2AnUH7mGNfPgRFTpbJhjfKn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JiVqM4SgNy2AnUH7mGNfPgRFTpbJhjfKn
Content-Type: multipart/mixed; boundary="eAbuZ8bV7zg10jJcjKm4fWQLNyHd3MJez";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <c9a8e879-ff55-3fbc-41ab-df836c76be9f@suse.com>
Subject: Re: [PATCH v8 2/3] xen/events: rework fifo queue locking
References: <20201125105122.3650-1-jgross@suse.com>
 <20201125105122.3650-3-jgross@suse.com>
 <e60e4fce-8c1b-013a-9ec2-20bd2c930619@xen.org>
 <2b099865-647c-3d47-1510-d429c2a4b6c6@suse.com>
 <5f04e881-915f-e2b7-6af3-459af614f8ca@xen.org>
In-Reply-To: <5f04e881-915f-e2b7-6af3-459af614f8ca@xen.org>

--eAbuZ8bV7zg10jJcjKm4fWQLNyHd3MJez
Content-Type: multipart/mixed;
 boundary="------------143C760AC2AC5CBECD35C408"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------143C760AC2AC5CBECD35C408
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 27.11.20 15:11, Julien Grall wrote:
> Hi Juergen,
>=20
> On 27/11/2020 14:05, J=C3=BCrgen Gro=C3=9F wrote:
>> On 27.11.20 14:58, Julien Grall wrote:
>>> Hi Juergen,
>>>
>>> On 25/11/2020 10:51, Juergen Gross wrote:
>>>> -static struct evtchn_fifo_queue *lock_old_queue(const struct domain=
=20
>>>> *d,
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ev=
tchn *evtchn,
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned =
long *flags)
>>>> -{
>>>> -=C2=A0=C2=A0=C2=A0 struct vcpu *v;
>>>> -=C2=A0=C2=A0=C2=A0 struct evtchn_fifo_queue *q, *old_q;
>>>> -=C2=A0=C2=A0=C2=A0 unsigned int try;
>>>> -=C2=A0=C2=A0=C2=A0 union evtchn_fifo_lastq lastq;
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0 for ( try =3D 0; try < 3; try++ )
>>>> -=C2=A0=C2=A0=C2=A0 {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lastq.raw =3D read_atomi=
c(&evtchn->fifo_lastq);
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v =3D d->vcpu[lastq.last=
_vcpu_id];
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 old_q =3D &v->evtchn_fif=
o->queue[lastq.last_priority];
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock_irqsave(&old_q=
->lock, *flags);
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v =3D d->vcpu[lastq.last=
_vcpu_id];
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 q =3D &v->evtchn_fifo->q=
ueue[lastq.last_priority];
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( old_q =3D=3D q )
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return old_q;
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock_irqrestore(&=
old_q->lock, *flags);
>>>> -=C2=A0=C2=A0=C2=A0 }
>>>> -
>>>> -=C2=A0=C2=A0=C2=A0 gprintk(XENLOG_WARNING,
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"dom%d port %d lost event (too many queue changes)\n",
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
d->domain_id, evtchn->port);
>>>> -=C2=A0=C2=A0=C2=A0 return NULL;
>>>> -}
>>>> -
>>>> =C2=A0 static int try_set_link(event_word_t *word, event_word_t *w, =

>>>> uint32_t link)
>>>> =C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 event_word_t new, old;
>>>> @@ -190,6 +158,9 @@ static void evtchn_fifo_set_pending(struct vcpu =

>>>> *v, struct evtchn *evtchn)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 event_word_t *word;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long flags;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool_t was_pending;
>>>> +=C2=A0=C2=A0=C2=A0 struct evtchn_fifo_queue *q, *old_q;
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int try;
>>>> +=C2=A0=C2=A0=C2=A0 bool linked =3D true;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 port =3D evtchn->port;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 word =3D evtchn_fifo_word_from_port(d=
, port);
>>>> @@ -204,17 +175,67 @@ static void evtchn_fifo_set_pending(struct=20
>>>> vcpu *v, struct evtchn *evtchn)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Lock all queues related to the event cha=
nnel (in case of a=20
>>>> queue change
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * this might be two).
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * It is mandatory to do that before settin=
g and testing the=20
>>>> PENDING bit
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * and to hold the current queue lock until=
 the event has put=20
>>>> into the
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * list of pending events in order to avoid=
 waking up a guest=20
>>>> without the
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * event being visibly pending in the guest=
=2E
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +=C2=A0=C2=A0=C2=A0 for ( try =3D 0; try < 4; try++ )
>>>
>>> May I ask why the number of try is 4 rather than the original 3?
>>
>> Oh, I think this is just a typo. OTOH it doesn't really matter.
>=20
> I agree that the number of try was likely random and therefore using a =

> different number should not matter.
>=20
> However, this is making more difficult to review the patch because this=
=20
> is an unexplained change.
>=20
> I would prefer if this is dropped. But if you want to keep this change,=
=20
> then it should be explained in the commit message.

Well, I could argue that there is potentially one lock more to take, so
the retry number is increased by one, too. ;-)

I think we can just switch back to 3.


Juergen

--------------143C760AC2AC5CBECD35C408
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

--------------143C760AC2AC5CBECD35C408--

--eAbuZ8bV7zg10jJcjKm4fWQLNyHd3MJez--

--JiVqM4SgNy2AnUH7mGNfPgRFTpbJhjfKn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/BCc4FAwAAAAAACgkQsN6d1ii/Ey9E
Uwf/fznCn1xClre4A8zUceBm2gQNev5LV/VCLvNP+UiO3u/iDc8sJUxRtPn6guWNZi8q9i0WCQB4
ehfkKC/YPEZD70OrDAYv3U/edIuEWp+GpdvpZiDkhmJOBTnu/qZ1AGNje9lHpRJ6l7abd+QZndhl
qtKiiAow80BvdtL78k4EyxFTYFBqAZvERcMCndkRjdQiMZSe2FSzqSr/iU8P2T+KVdSkMm9uv1uO
ADDx3Tfzkrz6yB8NStZfT3SToFkQOEWM/ei3cBkjGMioIaAWuleohL0TgZwqZ1OvvMiSq7p7jpRV
64Z8BvDcaYhxS5G9cpyxzqVfqIX60RIxWpyIXd42vA==
=jEZn
-----END PGP SIGNATURE-----

--JiVqM4SgNy2AnUH7mGNfPgRFTpbJhjfKn--

