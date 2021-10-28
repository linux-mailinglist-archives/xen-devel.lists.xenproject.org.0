Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B525E43E3DA
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 16:35:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218117.378430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg6Uu-0003ME-Kn; Thu, 28 Oct 2021 14:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218117.378430; Thu, 28 Oct 2021 14:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg6Uu-0003KE-GF; Thu, 28 Oct 2021 14:35:16 +0000
Received: by outflank-mailman (input) for mailman id 218117;
 Thu, 28 Oct 2021 14:35:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vfrR=PQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mg6Ut-0003K6-FI
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 14:35:15 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42e9df40-37fc-11ec-84a5-12813bfff9fa;
 Thu, 28 Oct 2021 14:35:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 484FE21971;
 Thu, 28 Oct 2021 14:35:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2391213E9D;
 Thu, 28 Oct 2021 14:35:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Hb57ByG1emF0IAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Oct 2021 14:35:13 +0000
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
X-Inumbo-ID: 42e9df40-37fc-11ec-84a5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635431713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gXW6zl0c3Hc/TgIXbImSMoNAWWb2v5ChOXsCMwT6ZuU=;
	b=ufycYvLdsVrS3wrHeOK5rYG8nk/sHQvI3TGq7b8VtomXb6dDFaOYSg6I1e5fy5+8IuWWl8
	dyr/wQoChFqkulUjrvZ5yuqL8KkaH+yGivU2E94MMosQsSKQq8D10M4jQSeghnLS+P9wO7
	amSJdWyfvLTNYYmpird1vCnEW1bbqsc=
Subject: Re: [PATCH 12/12] xen/x86: add hypercall performance counters for
 hvm, correct pv
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-13-jgross@suse.com>
 <6570b0b9-0cde-a262-937c-b4e2e3f8e1e4@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <ef18a8ad-460f-b4fd-2d8e-7cdc8b1fe980@suse.com>
Date: Thu, 28 Oct 2021 16:35:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <6570b0b9-0cde-a262-937c-b4e2e3f8e1e4@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lUvt0gcmM4E3dpvRm2tfk1m0BLe5mnDAx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lUvt0gcmM4E3dpvRm2tfk1m0BLe5mnDAx
Content-Type: multipart/mixed; boundary="LVwgB13r4EzE68ZrTEvUQa77dyAWAtcED";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <ef18a8ad-460f-b4fd-2d8e-7cdc8b1fe980@suse.com>
Subject: Re: [PATCH 12/12] xen/x86: add hypercall performance counters for
 hvm, correct pv
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-13-jgross@suse.com>
 <6570b0b9-0cde-a262-937c-b4e2e3f8e1e4@suse.com>
In-Reply-To: <6570b0b9-0cde-a262-937c-b4e2e3f8e1e4@suse.com>

--LVwgB13r4EzE68ZrTEvUQa77dyAWAtcED
Content-Type: multipart/mixed;
 boundary="------------1C287D2BB2F17978B3ECE6C9"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1C287D2BB2F17978B3ECE6C9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 21.10.21 17:19, Jan Beulich wrote:
> On 15.10.2021 14:51, Juergen Gross wrote:
>> The HVM hypercall handler is missing incrementing the per hypercall
>> counters. Add that.
>>
>> The counters for PV are handled wrong, as they are not using
>> perf_incra() with the number of the hypercall as index, but are
>> incrementing the total number of hypercalls only. Fix that.
>=20
> Why do you say "total number"? Isn't it that all accounting goes into
> set_trap_table's slot, effectively making that slot a "total number"
> despite not being labeled that way?

Oh, right. Will correct.

> Also this fix renders largely redundant the calls_to_multicall counter.=

> Could I talk you into deleting that at the same time? (As to the "not
> fully redundant": I consider it suspicious that this counter gets
> incremented at the bottom of the function, not at the top.)

I think I'll just another patch doing that.

> Finally I take it that with the Kconfig setting being under DEBUG, we
> don't consider security supported builds with PERF_COUNTERS enabled.
> Otherwise as a prereq I would think perfc_incra() would need teaching
> of array_index_nospec().

I agree.

> In any event, preferably with at least the description slightly
> adjusted,
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.


Juergen


--------------1C287D2BB2F17978B3ECE6C9
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

--------------1C287D2BB2F17978B3ECE6C9--

--LVwgB13r4EzE68ZrTEvUQa77dyAWAtcED--

--lUvt0gcmM4E3dpvRm2tfk1m0BLe5mnDAx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmF6tSAFAwAAAAAACgkQsN6d1ii/Ey9H
tAf/WijgbrR9C89hehAwaFMXvZjMdj0KA3xASiqb/ZDUsIq8RWnntJ4cSOAH/1xVoKho3J2mte1V
ikGlo74ITXHYSPtYtpoz7QX7PpAEQ9m9rIddy4IZ50hg+dl+/LCpGJGqZdoq6CbdcqiUotzVhL04
mR0/fDYO3qG1mCg2ERkJ/2HEyPqKnvbXdm/Vkv2uEru5j1pWRELLKC6wkyAIgzeDfTbg0L0OzZNi
bwGOUMuRNuvl1Tf3iWsuMXlyXsKDIUt9tQdLFln9XnEiEqGn1VYmmEoOoA4LPQGawYj/EKebPKTU
bc8/hM0d0QF6tSWu95dLQkIvLDgWG/IILopXLB92kA==
=ydGK
-----END PGP SIGNATURE-----

--lUvt0gcmM4E3dpvRm2tfk1m0BLe5mnDAx--

