Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D6E312EDA
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 11:23:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82697.152747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l93h4-0006sq-1c; Mon, 08 Feb 2021 10:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82697.152747; Mon, 08 Feb 2021 10:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l93h3-0006sV-Us; Mon, 08 Feb 2021 10:22:57 +0000
Received: by outflank-mailman (input) for mailman id 82697;
 Mon, 08 Feb 2021 10:22:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q0oM=HK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l93h2-0006sQ-2B
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 10:22:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 051ba6f2-065d-4349-b088-ec8421c0aabc;
 Mon, 08 Feb 2021 10:22:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CF675AC6E;
 Mon,  8 Feb 2021 10:22:53 +0000 (UTC)
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
X-Inumbo-ID: 051ba6f2-065d-4349-b088-ec8421c0aabc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612779774; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=60lHO1XdO2ZdH7NjubMLgmwlciqf0fRY8xZgW51WUbU=;
	b=cCI1lUOYefv5w41g8IqFaarOQrGRW26S9XVaZ29zU2W7zMtAY1e/8OPD1HsVNd0SF1KGZP
	7uBpXw8t/QrqYEkkhBLbir6WydP7kc60yyp0laO62qF5Sl11MUWmCs2GJWT84gTGeCuSpY
	vhJ0nhQHlfe1bXiekrN6PlHfZg+Rr7I=
Subject: Re: [PATCH 0/7] xen/events: bug fixes and some diagnostic aids
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Wei Liu <wei.liu@kernel.org>,
 Paul Durrant <paul@xen.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
References: <20210206104932.29064-1-jgross@suse.com>
 <bd63694e-ac0c-7954-ec00-edad05f8da1c@xen.org>
 <eeb62129-d9fc-2155-0e0f-aff1fbb33fbc@suse.com>
 <fcf3181b-3efc-55f5-687c-324937b543e6@xen.org>
 <7aaeeb3d-1e1b-6166-84e9-481153811b62@suse.com>
 <6f547bb5-777a-6fc2-eba2-cccb4adfca87@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0d623c98-a714-1639-cc53-f58ba3f08212@suse.com>
Date: Mon, 8 Feb 2021 11:22:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <6f547bb5-777a-6fc2-eba2-cccb4adfca87@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="arpr7hQ62FH49b0XyzuGqHY5LdYWp7uWP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--arpr7hQ62FH49b0XyzuGqHY5LdYWp7uWP
Content-Type: multipart/mixed; boundary="8PGsFlUGasLxMz28nEmjrpbMjwk7PLL4D";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Wei Liu <wei.liu@kernel.org>,
 Paul Durrant <paul@xen.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Message-ID: <0d623c98-a714-1639-cc53-f58ba3f08212@suse.com>
Subject: Re: [PATCH 0/7] xen/events: bug fixes and some diagnostic aids
References: <20210206104932.29064-1-jgross@suse.com>
 <bd63694e-ac0c-7954-ec00-edad05f8da1c@xen.org>
 <eeb62129-d9fc-2155-0e0f-aff1fbb33fbc@suse.com>
 <fcf3181b-3efc-55f5-687c-324937b543e6@xen.org>
 <7aaeeb3d-1e1b-6166-84e9-481153811b62@suse.com>
 <6f547bb5-777a-6fc2-eba2-cccb4adfca87@xen.org>
In-Reply-To: <6f547bb5-777a-6fc2-eba2-cccb4adfca87@xen.org>

--8PGsFlUGasLxMz28nEmjrpbMjwk7PLL4D
Content-Type: multipart/mixed;
 boundary="------------4E6A363ECAD742BE1796000E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4E6A363ECAD742BE1796000E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 08.02.21 10:54, Julien Grall wrote:
>=20
>=20
> On 08/02/2021 09:41, J=C3=BCrgen Gro=C3=9F wrote:
>> On 08.02.21 10:11, Julien Grall wrote:
>>> Hi Juergen,
>>>
>>> On 07/02/2021 12:58, J=C3=BCrgen Gro=C3=9F wrote:
>>>> On 06.02.21 19:46, Julien Grall wrote:
>>>>> Hi Juergen,
>>>>>
>>>>> On 06/02/2021 10:49, Juergen Gross wrote:
>>>>>> The first three patches are fixes for XSA-332. The avoid WARN spla=
ts
>>>>>> and a performance issue with interdomain events.
>>>>>
>>>>> Thanks for helping to figure out the problem. Unfortunately, I=20
>>>>> still see reliably the WARN splat with the latest Linux master=20
>>>>> (1e0d27fce010) + your first 3 patches.
>>>>>
>>>>> I am using Xen 4.11 (1c7d984645f9) and dom0 is forced to use the 2L=
=20
>>>>> events ABI.
>>>>>
>>>>> After some debugging, I think I have an idea what's went wrong. The=
=20
>>>>> problem happens when the event is initially bound from vCPU0 to a=20
>>>>> different vCPU.
>>>>>
>>>>> =C2=A0From the comment in xen_rebind_evtchn_to_cpu(), we are maskin=
g the=20
>>>>> event to prevent it being delivered on an unexpected vCPU. However,=
=20
>>>>> I believe the following can happen:
>>>>>
>>>>> vCPU0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | vCPU1
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Call xen_rebind_evtchn_to_cpu()
>>>>> receive event X=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | mask event X
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | bind to vCPU1
>>>>> <vCPU descheduled>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | unma=
sk event X
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | receive event X
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | handle_edge_irq(X)
>>>>> handle_edge_irq(X)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 -> handle_irq_event()
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 -> set IRQD_IN_PROGRESS
>>>>> =C2=A0=C2=A0-> set IRQS_PENDING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 -> evtchn_interrupt()
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 -> clear IRQD_IN_PROGRESS
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 -> IRQS_PENDING is set
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 -> handle_irq_event()
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 -> evtchn_interrupt()
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 -> WARN()
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>>>
>>>>> All the lateeoi handlers expect a ONESHOT semantic and=20
>>>>> evtchn_interrupt() is doesn't tolerate any deviation.
>>>>>
>>>>> I think the problem was introduced by 7f874a0447a9 ("xen/events:=20
>>>>> fix lateeoi irq acknowledgment") because the interrupt was disabled=
=20
>>>>> previously. Therefore we wouldn't do another iteration in=20
>>>>> handle_edge_irq().
>>>>
>>>> I think you picked the wrong commit for blaming, as this is just
>>>> the last patch of the three patches you were testing.
>>>
>>> I actually found the right commit for blaming but I copied the=20
>>> information from the wrong shell :/. The bug was introduced by:
>>>
>>> c44b849cee8c ("xen/events: switch user event channels to lateeoi mode=
l")
>>>
>>>>
>>>>> Aside the handlers, I think it may impact the defer EOI mitigation =

>>>>> because in theory if a 3rd vCPU is joining the party (let say vCPU =

>>>>> A migrate the event from vCPU B to vCPU C). So info->{eoi_cpu,=20
>>>>> irq_epoch, eoi_time} could possibly get mangled?
>>>>>
>>>>> For a fix, we may want to consider to hold evtchn_rwlock with the=20
>>>>> write permission. Although, I am not 100% sure this is going to=20
>>>>> prevent everything.
>>>>
>>>> It will make things worse, as it would violate the locking hierarchy=

>>>> (xen_rebind_evtchn_to_cpu() is called with the IRQ-desc lock held).
>>>
>>> Ah, right.
>>>
>>>>
>>>> On a first glance I think we'll need a 3rd masking state ("temporari=
ly
>>>> masked") in the second patch in order to avoid a race with lateeoi.
>>>>
>>>> In order to avoid the race you outlined above we need an "event is=20
>>>> being
>>>> handled" indicator checked via test_and_set() semantics in
>>>> handle_irq_for_port() and reset only when calling clear_evtchn().
>>>
>>> It feels like we are trying to workaround the IRQ flow we are using=20
>>> (i.e. handle_edge_irq()).
>>
>> I'm not really sure this is the main problem here. According to your
>> analysis the main problem is occurring when handling the event, not wh=
en
>> handling the IRQ: the event is being received on two vcpus.
>=20
> I don't think we can easily divide the two because we rely on the IRQ=20
> framework to handle the lifecycle of the event. So...
>=20
>>
>> Our problem isn't due to the IRQ still being pending, but due it being=

>> raised again, which should happen for a one shot IRQ the same way.
>=20
> ... I don't really see how the difference matter here. The idea is to=20
> re-use what's already existing rather than trying to re-invent the whee=
l=20
> with an extra lock (or whatever we can come up).

The difference is that the race is occurring _before_ any IRQ is
involved. So I don't see how modification of IRQ handling would help.


Juergen

--------------4E6A363ECAD742BE1796000E
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

--------------4E6A363ECAD742BE1796000E--

--8PGsFlUGasLxMz28nEmjrpbMjwk7PLL4D--

--arpr7hQ62FH49b0XyzuGqHY5LdYWp7uWP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAhEPwFAwAAAAAACgkQsN6d1ii/Ey+8
+gf/fYUiahBXkyaFYti/fdacT0KA4crdiz1HFIWfzYd6aE7hnhLSA9cgayDoTMzZ1ixUOP4Dg8zA
RPsvIfz1HR433Qtn/LalZSRn3VdOV9UMQpCZeGptlLCUp7PYmVflhau47UZKdb12bXn2yAxHJ1nT
80zX9Tq0gi5hsIfy/uoPeVL27XIP89Ze7IKn6x4vCBJ/r02tTNNz2jaYKDkenC0vO1y0CFP3rL9g
cP3scoA+dEH9ZErOV4g9YsEpAliAZeVzEdjpNTUSE3Jj07rZccD83UNQRgUoIQqOkeNiShTzugbD
ScMv4YjK2ItFjbV9x/8b4YpBDtNoYQV6j0+fd628QA==
=7tk+
-----END PGP SIGNATURE-----

--arpr7hQ62FH49b0XyzuGqHY5LdYWp7uWP--

