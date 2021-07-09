Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEBD3C2375
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 14:35:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153640.283830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1piB-0002VX-DN; Fri, 09 Jul 2021 12:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153640.283830; Fri, 09 Jul 2021 12:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1piB-0002ST-AI; Fri, 09 Jul 2021 12:34:31 +0000
Received: by outflank-mailman (input) for mailman id 153640;
 Fri, 09 Jul 2021 12:34:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0kUe=MB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m1piA-0002SN-2g
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 12:34:30 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0076f9be-e0b2-11eb-85e4-12813bfff9fa;
 Fri, 09 Jul 2021 12:34:28 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D8218220D1;
 Fri,  9 Jul 2021 12:34:27 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id B025C137DD;
 Fri,  9 Jul 2021 12:34:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 3UkYKVNC6GCVXwAAGKfGzw
 (envelope-from <jgross@suse.com>); Fri, 09 Jul 2021 12:34:27 +0000
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
X-Inumbo-ID: 0076f9be-e0b2-11eb-85e4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1625834067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d3jtSJxPTb9P4Fv16k9KFkInAO1kGhVW/xm3J2BYf9I=;
	b=nYe05seQfIVUi89xCsJh4mGT0CINPajxsmHavDs8DDnW9fAKGtzDi5z242DeCHGoyM5tV5
	bGyEt+pctNbD8w3zn3URcVb/ce+rmkFUIeikIcrXTW+6iTFUg2zMbjjgqfCcAh630XmDkn
	aTOtCJV73+8Pq6ejcpeNO3FqGaI3pco=
Subject: Re: [PATCH v2 1/2] tools/xenstore: set oom score for xenstore daemon
 on Linux
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210608055839.10313-1-jgross@suse.com>
 <20210608055839.10313-2-jgross@suse.com>
 <467dc0c1-cf0a-2aaf-0c99-c1ca70b95912@xen.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <6c4b8bb2-56c0-e0ee-2eea-52f2925803c9@suse.com>
Date: Fri, 9 Jul 2021 14:34:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <467dc0c1-cf0a-2aaf-0c99-c1ca70b95912@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="35LkoPCyx7iHMswZz6xzX4aL2wDm7Hazv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--35LkoPCyx7iHMswZz6xzX4aL2wDm7Hazv
Content-Type: multipart/mixed; boundary="wg9e16dML2tcETP3SYd2ypPHjpWeDyylI";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <6c4b8bb2-56c0-e0ee-2eea-52f2925803c9@suse.com>
Subject: Re: [PATCH v2 1/2] tools/xenstore: set oom score for xenstore daemon
 on Linux
References: <20210608055839.10313-1-jgross@suse.com>
 <20210608055839.10313-2-jgross@suse.com>
 <467dc0c1-cf0a-2aaf-0c99-c1ca70b95912@xen.org>
In-Reply-To: <467dc0c1-cf0a-2aaf-0c99-c1ca70b95912@xen.org>

--wg9e16dML2tcETP3SYd2ypPHjpWeDyylI
Content-Type: multipart/mixed;
 boundary="------------C952ACE623DF1776165288A8"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C952ACE623DF1776165288A8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 08.07.21 19:40, Julien Grall wrote:
> Hi Juergen,
>=20
> On 08/06/2021 06:58, Juergen Gross wrote:
>> Xenstored is absolutely mandatory for a Xen host and it can't be
>> restarted, so being killed by OOM-killer in case of memory shortage is=

>> to be avoided.
>>
>> Set /proc/$pid/oom_score_adj (if available) to -500 in order to allow
>> xenstored to use large amounts of memory without being killed.
>>
>> Make sure the pid file isn't a left-over from a previous run delete it=

>> before starting xenstored.
>=20
> This sentence is a bit confusing to read. Do you mean "*To* make=20
> sure....*,* delete it before"?

Yes, will change it.

>=20
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V2:
>> - set oom score from launch script (Julien Grall)
>> - split off open file descriptor limit setting (Julien Grall)
>> ---
>> =C2=A0 tools/hotplug/Linux/launch-xenstore.in | 3 +++
>> =C2=A0 1 file changed, 3 insertions(+)
>>
>> diff --git a/tools/hotplug/Linux/launch-xenstore.in=20
>> b/tools/hotplug/Linux/launch-xenstore.in
>> index 019f9d6f4d..3ad71e3d08 100644
>> --- a/tools/hotplug/Linux/launch-xenstore.in
>> +++ b/tools/hotplug/Linux/launch-xenstore.in
>> @@ -59,11 +59,14 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons =

>> && . @CONFIG_DIR@/@CONFIG_LEAF
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "No xensto=
red found"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit 1
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 rm -f @XEN_RUN_DIR@/xenstored.pid
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo -n Starting $XENSTORED...
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $XENSTORED --pid-file @XEN_RUN_DIR@/xen=
stored.pid $XENSTORED_ARGS
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 systemd-notify --booted 2>/dev/null || =
timeout_xenstore=20
>> $XENSTORED || exit 1
>> +=C2=A0=C2=A0=C2=A0 XS_PID=3D`cat @XEN_RUN_DIR@/xenstored.pid`
>> +=C2=A0=C2=A0=C2=A0 echo -500 >/proc/$XS_PID/oom_score_adj
>=20
> NIT: It would be worth considering to introduce a variable so this can =

> be set from the configuration file.

Do you have any scenario in mind where this would be beneficial?

I'm not against it, but I'm wondering why anybody would want that
to be configurable.

>=20
> With or without it:
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>

Juergen

--------------C952ACE623DF1776165288A8
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

--------------C952ACE623DF1776165288A8--

--wg9e16dML2tcETP3SYd2ypPHjpWeDyylI--

--35LkoPCyx7iHMswZz6xzX4aL2wDm7Hazv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDoQlMFAwAAAAAACgkQsN6d1ii/Ey/r
fggAnv6no8aje6PS6TAXRcruQLsBI0WJjqqjg05sFbhOChhAcgtzCbUCex3fPG9+ixNgYjgY1q9r
llzT+UP1JkqTle//AxVoMfkMlXG1zLiVYvBAyqOqj+86Y7IvXF60JbFcmGzSC6NM6oPtYXpwIC+p
bLbTGkH/P/7N1cOTXvpzGp0EO+FrSApn07DCpuLak8BA8KsyIKfZIuSLmwQvbW4ffKdG7U+NijVO
FRj5AWg1tuj07D2wlK3E3ZqfJab3aergyy4tCb5mO+Y2DHknooc+HJgCd0/uqqmpausRywXYvelr
f8MR9r9JA9moeD1E/EAegfcs6tFULWpmkEgUYp4F9g==
=TcTi
-----END PGP SIGNATURE-----

--35LkoPCyx7iHMswZz6xzX4aL2wDm7Hazv--

