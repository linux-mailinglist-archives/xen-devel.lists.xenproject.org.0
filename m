Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5583B2B44
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 11:20:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146535.269622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwLXK-0003um-QW; Thu, 24 Jun 2021 09:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146535.269622; Thu, 24 Jun 2021 09:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwLXK-0003sK-MT; Thu, 24 Jun 2021 09:20:38 +0000
Received: by outflank-mailman (input) for mailman id 146535;
 Thu, 24 Jun 2021 09:20:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3ax9=LS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lwLXJ-0003sE-8X
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 09:20:37 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69bbb48e-e750-40b5-b74d-62c367985ada;
 Thu, 24 Jun 2021 09:20:35 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BD7101FD6C;
 Thu, 24 Jun 2021 09:20:34 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 8DD3D11A97;
 Thu, 24 Jun 2021 09:20:34 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Le1zIWJO1GBiPgAALh3uQQ
 (envelope-from <jgross@suse.com>); Thu, 24 Jun 2021 09:20:34 +0000
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
X-Inumbo-ID: 69bbb48e-e750-40b5-b74d-62c367985ada
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624526434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T0Mxx5S8QM5qjHZ3fVFo6cdp1/NgSAT6Ti1PrhRyrvw=;
	b=m8pZwMkR6ohSRlUlB7BCsYS8snSCSgsTX6UX2Xd547bkPrcBcJ22XsjO0RneE2L3JNnr3Q
	g++T9u4gEb2GBiIhS08T43zVxQ917S7IhjPntQmDOi1HWK+Po38zkIf9xqweoJSdU5r62x
	iOA/RvUjnLvQ1LHLSRdh2uoCysuJWsA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624526434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T0Mxx5S8QM5qjHZ3fVFo6cdp1/NgSAT6Ti1PrhRyrvw=;
	b=m8pZwMkR6ohSRlUlB7BCsYS8snSCSgsTX6UX2Xd547bkPrcBcJ22XsjO0RneE2L3JNnr3Q
	g++T9u4gEb2GBiIhS08T43zVxQ917S7IhjPntQmDOi1HWK+Po38zkIf9xqweoJSdU5r62x
	iOA/RvUjnLvQ1LHLSRdh2uoCysuJWsA=
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-9-julien@xen.org>
 <444688a1-180f-7cf3-3461-0001030471d4@suse.com>
 <c6ad91cd-f531-5c19-e246-bb8c4ce304f2@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 08/10] tools/xenstored: Extend restore code to handle
 multiple input buffer
Message-ID: <5d641d86-53ce-27d6-6a54-c58d85164204@suse.com>
Date: Thu, 24 Jun 2021 11:20:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <c6ad91cd-f531-5c19-e246-bb8c4ce304f2@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oLJydyKWJTsKaXRP0iN12efFxPFM5U8w5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oLJydyKWJTsKaXRP0iN12efFxPFM5U8w5
Content-Type: multipart/mixed; boundary="mnaGEKbA9tN1bXRQi5TepbglzPA5OLbNX";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <5d641d86-53ce-27d6-6a54-c58d85164204@suse.com>
Subject: Re: [PATCH 08/10] tools/xenstored: Extend restore code to handle
 multiple input buffer
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-9-julien@xen.org>
 <444688a1-180f-7cf3-3461-0001030471d4@suse.com>
 <c6ad91cd-f531-5c19-e246-bb8c4ce304f2@xen.org>
In-Reply-To: <c6ad91cd-f531-5c19-e246-bb8c4ce304f2@xen.org>

--mnaGEKbA9tN1bXRQi5TepbglzPA5OLbNX
Content-Type: multipart/mixed;
 boundary="------------C8187A122C89074DAA432785"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C8187A122C89074DAA432785
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 24.06.21 10:42, Julien Grall wrote:
> Hi Juergen,
>=20
> On 24/06/2021 10:30, Juergen Gross wrote:
>> On 16.06.21 16:43, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Currently, the restore code is considering the stream will contain at=

>>> most one in-flight request per connection. In a follow-up changes, we=

>>> will want to transfer multiple in-flight requests.
>>>
>>> The function read_state_buffered() is now extended to restore multipl=
e
>>> in-flight request. Complete requests will be queued as delayed
>>> requests, if there a partial request (only the last one can) then it
>>> will used as the current in-flight request.
>>>
>>> Note that we want to bypass the quota check for delayed requests as
>>> the new Xenstore may have a lower limit.
>>>
>>> Lastly, there is no need to change the specification as there was
>>> no restriction on the number of in-flight requests preserved.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>> ---
>>> =C2=A0 tools/xenstore/xenstored_core.c | 56 +++++++++++++++++++++++++=
+++-----
>>> =C2=A0 1 file changed, 48 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/tools/xenstore/xenstored_core.c=20
>>> b/tools/xenstore/xenstored_core.c
>>> index a5084a5b173d..5b7ab7f74013 100644
>>> --- a/tools/xenstore/xenstored_core.c
>>> +++ b/tools/xenstore/xenstored_core.c
>>> @@ -1486,6 +1486,10 @@ static void process_message(struct connection =

>>> *conn, struct buffered_data *in)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum xsd_sockmsg_type type =3D in->hdr=
=2Emsg.type;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>> +=C2=A0=C2=A0=C2=A0 /* At least send_error() and send_reply() expects=20
conn->in =3D=3D in */
>>> +=C2=A0=C2=A0=C2=A0 assert(conn->in =3D=3D in);
>>> +=C2=A0=C2=A0=C2=A0 trace_io(conn, in, 0);
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((unsigned int)type >=3D XS_TYPE_CO=
UNT|| !wire_funcs[type].func)=20
>> {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eprintf("Clien=
t unknown operation %i", type);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 send_error(con=
n, ENOSYS);
>>> @@ -1515,6 +1519,23 @@ static void process_message(struct connection =

>>> *conn, struct buffered_data *in)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 conn->transaction =3D NULL;
>>> =C2=A0 }
>>> +static bool process_delayed_message(struct delayed_request *req)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct connection *conn =3D req->data;
>>> +=C2=A0=C2=A0=C2=A0 struct buffered_data *saved_in =3D conn->in;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Part of process_message() expects conn->i=
n to contains the
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * processed response. So save the current c=
onn->in and restore it
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * afterwards.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 conn->in =3D req->in;
>>> +=C2=A0=C2=A0=C2=A0 process_message(req->data, req->in);
>>> +=C2=A0=C2=A0=C2=A0 conn->in =3D saved_in;
>>
>> This pattern was added to do_lu_start() already, and it will be needed=

>> for each other function being called via call_delayed().
>>
>> Maybe it would be better to add conn explicitly to struct
>> delayed_request (or even better: replace data with conn) and to do the=

>> conn->in saving/setting/restoring in call_delayed() instead?
>=20
> This was my original approach, but I abandoned it because in the case o=
f=20
> do_lu_start() we need to save the original conn->in in the stream (see =

> patch #3 for more details).
>=20
> If we overwrite conn->in in call_delayed(), then we need a different wa=
y=20
> to find the original conn->in. I couldn't find a nice way and decided t=
o=20
> settle with the duplication.

Ah, okay, understood. Even in case we'd be able to restore conn->in it
would be the same amount of code again, but harder to follow.


Juergen

--------------C8187A122C89074DAA432785
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
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

--------------C8187A122C89074DAA432785--

--mnaGEKbA9tN1bXRQi5TepbglzPA5OLbNX--

--oLJydyKWJTsKaXRP0iN12efFxPFM5U8w5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDUTmIFAwAAAAAACgkQsN6d1ii/Ey94
Vgf+IyKi5hj+OGWlxFUHaZ3aBfTOSJ9mn6AF07x+2AtXPfeuItG9JbTzoghVWyMNlM4wXbo4MGp3
e2eAkx6cbyDj1/6AiuySiQE/Gyzggfj5/vkxi0ctPPMkHpEqzVGChnM1i8s1bvcjy9WGoHUuB3pc
PD/V3gfoYzt3CbS7SA2MATyfku9NxxssyWSaBl1PpaPvYQpH74BWLbBAQJulPM1G8FBjWqiD3Ogb
QU3nDpEZObvT+P3afhp5nbnWTm9ieNiZnZxGwQ2xqDYXZ57srQrJcurDC9M9d+/nLpsgFyn6aMTO
sW/1h1xtsQfPaTeWEChxOSzElRpTSLhftgpp8lG4cQ==
=6shL
-----END PGP SIGNATURE-----

--oLJydyKWJTsKaXRP0iN12efFxPFM5U8w5--

