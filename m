Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6205C41AE8A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 14:16:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197970.351242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVC1R-0002Hl-5D; Tue, 28 Sep 2021 12:15:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197970.351242; Tue, 28 Sep 2021 12:15:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVC1R-0002Fy-1z; Tue, 28 Sep 2021 12:15:45 +0000
Received: by outflank-mailman (input) for mailman id 197970;
 Tue, 28 Sep 2021 12:15:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TiGH=OS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mVC1P-0002Fs-Fz
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 12:15:43 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc92a241-2055-11ec-bc86-12813bfff9fa;
 Tue, 28 Sep 2021 12:15:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6789820202;
 Tue, 28 Sep 2021 12:15:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3CFEB13A82;
 Tue, 28 Sep 2021 12:15:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AaQgDW0HU2EhfwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 28 Sep 2021 12:15:41 +0000
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
X-Inumbo-ID: cc92a241-2055-11ec-bc86-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632831341; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NUNiFLtAHLJUOzZDI5flM+QhBET7pJWEcR1eZ9Iuzto=;
	b=ML6ZW73YQdOWb6vihX4NED7+SKLZtlxQbN5DzB0E4UnV+JFPqB0EjK+NUviaxNP0aCeXlA
	niGLFJHf9jda3/CwauSg4fv/XYW9pIbAvcBTDgzPBusSatuOP9qd7UrjxjXVmgZa/kNGsY
	LFGzQWSM0Nq4E+jmkk65C/nvun9tPgA=
Subject: Re: [PATCH v5 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20210928091517.9761-1-jgross@suse.com>
 <20210928091517.9761-3-jgross@suse.com>
 <24915.1121.8356.288414@mariner.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <0bd81ff3-a7ac-4000-4c0c-d7127b1c1985@suse.com>
Date: Tue, 28 Sep 2021 14:15:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <24915.1121.8356.288414@mariner.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="d0wtOka4OxLM2Z4Gskn4hq5a1mmazPunv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--d0wtOka4OxLM2Z4Gskn4hq5a1mmazPunv
Content-Type: multipart/mixed; boundary="JkvvaZn0wjfzVLkfML8Y2dXLPDLdgBca1";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Message-ID: <0bd81ff3-a7ac-4000-4c0c-d7127b1c1985@suse.com>
Subject: Re: [PATCH v5 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
References: <20210928091517.9761-1-jgross@suse.com>
 <20210928091517.9761-3-jgross@suse.com>
 <24915.1121.8356.288414@mariner.uk.xensource.com>
In-Reply-To: <24915.1121.8356.288414@mariner.uk.xensource.com>

--JkvvaZn0wjfzVLkfML8Y2dXLPDLdgBca1
Content-Type: multipart/mixed;
 boundary="------------7AA3DD2ABEF0A7F217775343"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7AA3DD2ABEF0A7F217775343
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 28.09.21 14:02, Ian Jackson wrote:
> Juergen Gross writes ("[PATCH v5 2/2] tools/xenstore: set open file des=
criptor limit for xenstored"):
>> Add a configuration item for the maximum number of open file
>> descriptors xenstored should be allowed to have.
>>
>> The default should be "unlimited" in order not to restrict xenstored
>> in the number of domains it can support, but unfortunately the kernel
>> is normally limiting the maximum value via /proc/sys/fs/nr_open [1],
>> [2]. So check that file to exist and if it does, limit the maximum
>> value to the one specified by /proc/sys/fs/nr_open.
>>
>> As an aid for the admin configuring the value add a comment specifying=

>> the common needs of xenstored for the different domain types.
> ...
>>   	echo -n Starting $XENSTORED...
>> @@ -70,6 +89,7 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons &&=
 . @CONFIG_DIR@/@CONFIG_LEAF
>>   	systemd-notify --booted 2>/dev/null || timeout_xenstore $XENSTORED =
|| exit 1
>>   	XS_PID=3D`cat @XEN_RUN_DIR@/xenstored.pid`
>>   	echo $XS_OOM_SCORE >/proc/$XS_PID/oom_score_adj
>> +	prlimit --pid $XS_PID --nofile=3D$XENSTORED_MAX_OPEN_FDS
>=20
> Thanks for this.  I have one comment/question, which I regret making
> rather late:
>=20
> I am uncomfortable with the use of prlimit here, because identifying
> processes by pid is typically inherently not 100% reliable.
>=20
> AIUI you are using it here because perhaps otherwise you would have to
> mess about with both systemd and non-systemd approaches.  But in fact
> this script "launch-xenstore" is simply a parent of xenstore.  It is
> run either by systemd or from the init script, and it runs $XENSTORED
> directly (so not via systemd or another process supervisor).
>=20
> fd limits are inherited, so I think you can use ulimit rather than
> prlimit ?
>=20
> If you use ulimit I think you must set the hard and soft limits,
> which requires two calls.
>=20
> If you can't use ulimit then we should try to make some argument that
> the prlimit can't target the wrong process eg due to a
> misconfiguration or stale pid file or soemthing.  I think I see a way
> that such an argument could be construted but it would be better just
> to use ulimit.

Hmm, maybe I should just use:

prlimit --nofile=3D$XENSTORED_MAX_OPEN_FDS \
    $XENSTORED --pid-file @XEN_RUN_DIR@/xenstored.pid $XENSTORED_ARGS


Juergen

--------------7AA3DD2ABEF0A7F217775343
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

--------------7AA3DD2ABEF0A7F217775343--

--JkvvaZn0wjfzVLkfML8Y2dXLPDLdgBca1--

--d0wtOka4OxLM2Z4Gskn4hq5a1mmazPunv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFTB2wFAwAAAAAACgkQsN6d1ii/Ey82
QQf/Ux//Nw4xu2jJNrGCIvY5KKLz1vsVwXgxJf3lhNt3idaxHf2eJYVqkCzFlKw1J5pbaYon4jeK
XhrvNOK9Yktz14BhDMXk+bCxEDAZLxEV0mtebuVb8zwEZJ+51d0t5zr5Fj6DdiLVSlSeFMiozre3
7coJmCj/u3A5Ay9QWK2336GyzSaQHYhOA3+Kfb+EyvCeyEmhD8KrAcm85a/czK93z3ywrp1f5kTM
FqTT7Bm0+CIk9qC+l9W118xnkKw6KsRNOOXRvzHu1xJmT8RKT2u0kkaS7uQfgaLHmgquOu8tD6ia
VWhv4xT4AfPvRX6N5Qj+nv4F8fPGHo4azQ8lLdZDaQ==
=DtiI
-----END PGP SIGNATURE-----

--d0wtOka4OxLM2Z4Gskn4hq5a1mmazPunv--

