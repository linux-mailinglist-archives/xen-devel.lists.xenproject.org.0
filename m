Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A365C3FC6FD
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 14:20:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175645.319888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL2ka-0004z5-S3; Tue, 31 Aug 2021 12:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175645.319888; Tue, 31 Aug 2021 12:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL2ka-0004x3-Os; Tue, 31 Aug 2021 12:20:24 +0000
Received: by outflank-mailman (input) for mailman id 175645;
 Tue, 31 Aug 2021 12:20:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DmOZ=NW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mL2kZ-0004wx-Qi
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 12:20:23 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d001f40a-0a55-11ec-ad2c-12813bfff9fa;
 Tue, 31 Aug 2021 12:20:22 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BAC631FE79;
 Tue, 31 Aug 2021 12:20:21 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8982213A96;
 Tue, 31 Aug 2021 12:20:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id FdI8H4UeLmF7GQAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 31 Aug 2021 12:20:21 +0000
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
X-Inumbo-ID: d001f40a-0a55-11ec-ad2c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1630412421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GJs/zWQ9xPKijKeT8UtJYEkZ5wLgdjRLUVhJTh9XaIk=;
	b=oz/OTo1TdzCWV3QYnjoDHoyGlysmZb23xBluIpB/lXiqFJCUze5Cto9j2oi2gLzCy4emGa
	LvFIjCEtTnfBA4nqUndiWXxrJxFNI/zqspC5ns2zekDy18+12LYlCwA8YmDZmSKqkSB9ES
	Z1opkg3t06Q+VbXnERwUOh0lK49NAn8=
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, Wei Liu <wl@xen.org>
References: <20210730122643.2043-1-jgross@suse.com>
 <20210730122643.2043-2-jgross@suse.com>
 <24835.65010.870849.479582@mariner.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 1/2] tools/xenstore: set oom score for xenstore daemon
 on Linux
Message-ID: <1f079107-4685-aa68-bed1-867b23e1fd32@suse.com>
Date: Tue, 31 Aug 2021 14:20:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <24835.65010.870849.479582@mariner.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="fvsErY0wAxUfSlGzRYWxfpeK7IApnSaZW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fvsErY0wAxUfSlGzRYWxfpeK7IApnSaZW
Content-Type: multipart/mixed; boundary="T36jqQuDzOEpdHI4fu3TGzflwZU3P3hJB";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, Wei Liu <wl@xen.org>
Message-ID: <1f079107-4685-aa68-bed1-867b23e1fd32@suse.com>
Subject: Re: [PATCH v3 1/2] tools/xenstore: set oom score for xenstore daemon
 on Linux
References: <20210730122643.2043-1-jgross@suse.com>
 <20210730122643.2043-2-jgross@suse.com>
 <24835.65010.870849.479582@mariner.uk.xensource.com>
In-Reply-To: <24835.65010.870849.479582@mariner.uk.xensource.com>

--T36jqQuDzOEpdHI4fu3TGzflwZU3P3hJB
Content-Type: multipart/mixed;
 boundary="------------24FC35AE9B9A532AC1371638"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------24FC35AE9B9A532AC1371638
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 30.07.21 15:26, Ian Jackson wrote:
> Juergen Gross writes ("[PATCH v3 1/2] tools/xenstore: set oom score for=
 xenstore daemon on Linux"):
>> Xenstored is absolutely mandatory for a Xen host and it can't be
>> restarted, so being killed by OOM-killer in case of memory shortage is=

>> to be avoided.
>>
>> Set /proc/$pid/oom_score_adj (if available) per default to -500 (this
>> translates to 50% of dom0 memory size) in order to allow xenstored to
>> use large amounts of memory without being killed.
> ...
>> +## Type: integer
>> +## Default: 50
>> +#
>> +# Percentage of dom0 memory size the xenstore daemon can use before t=
he
>> +# OOM killer is allowed to kill it.
>> +#XENSTORED_OOM_MEM_THRESHOLD=3D50
>> +
>>   ## Type: string
>>   ## Default: @LIBEXEC@/boot/xenstore-stubdom.gz
>=20
> Thanks for working on this.  I approve of the principle.
>=20
> I have one question about detail:
>=20
>>   	}
>> +	[ -z "$XENSTORED_OOM_MEM_THRESHOLD" ] || XENSTORED_OOM_MEM_THRESHOLD=
=3D50
>> +	XS_OOM_SCORE=3D-$(($XENSTORED_OOM_MEM_THRESHOLD * 10))
>> +
>> +	rm -f @XEN_RUN_DIR@/xenstored.pid
> ...
>> +	XS_PID=3D`cat @XEN_RUN_DIR@/xenstored.pid`
>> +	echo $XS_OOM_SCORE >/proc/$XS_PID/oom_score_adj
>=20
> The effect of all this is that the value specified in
> XENSTORED_OOM_MEM_THRESHOLD is transformed before being echoed into
> /proc, by being multiplied by -10.

Yes.

> Of course an alternative would be to ask the user to specify the
> tuneable directly but given its rather more obscure semantics I think
> it is reasonable to have this done by the script.

Correct. Otherwise the user would need to know about the oom_score_adj
ABI.

> But maybe we could add something to the doc comment ?
>=20
> Eg
>    # (The specified value is multiplied by -10 and echoed into
>    # /proc/PID/oom_score_adj.)
>=20
> ?

Why? This is an internal implementation detail. I don't see why the
user needs to know how this is accomplished. What is unclear with the
XENSTORED_OOM_MEM_THRESHOLD semantics as described?

There is no other parameter with an explanation how it's semantics are
being accomplished.


Juergen

--------------24FC35AE9B9A532AC1371638
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

--------------24FC35AE9B9A532AC1371638--

--T36jqQuDzOEpdHI4fu3TGzflwZU3P3hJB--

--fvsErY0wAxUfSlGzRYWxfpeK7IApnSaZW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEuHoQFAwAAAAAACgkQsN6d1ii/Ey9d
cwgAlvxnfgiezxaf2G9TuSTYY4fEPUClI/PvAEFcSqc0+mCmgvt+1W77NcgRfdIZlwY9VpNagQva
0mNC8WMxWsXnXudZPB51pIY1doGKd7osLB9VF6qMtAgxfy4HDpWhOMvpZJU2Pv0h4sj76Z6rOmX/
41nTb6kVk1WNW9nVX+NRcT0Ro/H9XzeC2BoCCW9MqGdsVjGvj9ak59AcoNzCmWyDyftL7ipVgXRl
cBbLSUYhrEBJuNmgW6p7yhuY+DXegUF8VmYc1SAi8tv3R9ExQNU2gEcCR3Uws5rhFViOsa1XJiVn
PBMpsO1JzwhTWJL3hI2FQ6hwi2jGAsDKn9z6TZS/3A==
=q+YB
-----END PGP SIGNATURE-----

--fvsErY0wAxUfSlGzRYWxfpeK7IApnSaZW--

