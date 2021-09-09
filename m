Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD09404599
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 08:28:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182624.330277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mODXU-0005kr-6K; Thu, 09 Sep 2021 06:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182624.330277; Thu, 09 Sep 2021 06:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mODXU-0005j0-34; Thu, 09 Sep 2021 06:28:00 +0000
Received: by outflank-mailman (input) for mailman id 182624;
 Thu, 09 Sep 2021 06:27:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vCZp=N7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mODXS-0005iu-Es
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 06:27:58 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 121b110e-1137-11ec-b1a4-12813bfff9fa;
 Thu, 09 Sep 2021 06:27:57 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4659B2230C;
 Thu,  9 Sep 2021 06:27:56 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 0B9CE13A61;
 Thu,  9 Sep 2021 06:27:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id e7xIAWypOWGHXAAAGKfGzw
 (envelope-from <jgross@suse.com>); Thu, 09 Sep 2021 06:27:56 +0000
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
X-Inumbo-ID: 121b110e-1137-11ec-b1a4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631168876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=KVvxTR/WFnUlWyEGIAHkydWApcA2cjZ3/tqAIpuxxZ0=;
	b=Do3yIESp8p9pE8E7SBDcL3+qKBkVvQy+5XukpRBbqj5dJp02oC3bcnJLTJ21FICl4D5Mjj
	6jdCQeMExmhIZ2qqPe7pvI+GCv40ap1wcXfTTERczYaYxMVJXKlCWp8htEwRlfNWQXV/Hq
	4B9InQrrhkoxrAN379njG8rCiBti04w=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>
Subject: Introduction of stable interface between Xenstore and hypervisor
Message-ID: <f7c54683-75d1-ded1-54d6-823dd76db030@suse.com>
Date: Thu, 9 Sep 2021 08:27:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="fzSR67JHUtEPKSIwAP8omhVzYar2VS9yj"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fzSR67JHUtEPKSIwAP8omhVzYar2VS9yj
Content-Type: multipart/mixed; boundary="EjUglcClrXlVesDqQOeguf8gQKBuNrQ7l";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>
Message-ID: <f7c54683-75d1-ded1-54d6-823dd76db030@suse.com>
Subject: Introduction of stable interface between Xenstore and hypervisor

--EjUglcClrXlVesDqQOeguf8gQKBuNrQ7l
Content-Type: multipart/mixed;
 boundary="------------125A8F04F6718D3FDD1681A0"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------125A8F04F6718D3FDD1681A0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Today Xenstore is using one unstable interface to retrieve the state
of a domain (existing, dying).

In order to decouple Xenstore further from the hypervisor, a stable
interface should be established. This new interface should cover the
following functionality:

- get the needed state of a domain (existing, dying)
- get a unique identifier per domain telling Xenstore that a domid
   has been reused (today Xenstore could in theory miss this)
- provide a way to avoid having to get the state of all domains when
   a state change of a domain has been signaled (there is only an event
   "some domain has changed state" today: VIRQ_DOM_EXC)

I'm suggesting the following hypervisor modifications:

- Addition of a global 64 bit domain sequence counter. This counter
   will be incremented each time a new domain is created.
- Addition of a sequence count to struct domain. It will be set to
   the value of the new global domain sequence counter when the domain
   is being created.
- Addition of a global bitmap with one bit for each possible domid
   (resulting in a 4 kB page). Each time the state of a domain is changed=

   (domain creation, shutdown, deletion) the related bit is set.
   When the VIRQ_DOM_EXC event is being registered the bitmap is reset to=

   have the bits set for all existing domains.
- Addition of a new stable hypercall ("get domain state") returning the
   following information:
   + domid of a domain having the bit set in above bitmap
   + state of that domain (existing, dying)
   + sequence count of that domain
   The related bit is reset in the bitmap as a side effect of the call.

Xenstore should be changed as follows:

- At startup of Xenstore the state of all domains is being queried via
   the new hypercall. This will cover all existing domains as the bitmap
   in the hypervisor has been reset to flag all existing domains to have
   a changed state when the VIRQ_DOM_EXC has been registered by Xenstore.=

- When receiving a VIRQ_DOM_EXC event the changed states of domains are
   queried via the new hypercall.

I think those modifications will cover all requirements while being
rather limited in the needed effort.

Thoughts?


Juergen

--------------125A8F04F6718D3FDD1681A0
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

--------------125A8F04F6718D3FDD1681A0--

--EjUglcClrXlVesDqQOeguf8gQKBuNrQ7l--

--fzSR67JHUtEPKSIwAP8omhVzYar2VS9yj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmE5qWsFAwAAAAAACgkQsN6d1ii/Ey+h
vgf/er3BLPxaJ84BzwaUcU+a/0Za4yLpJDjkbahAzhbyTSAh7AdOM2xwaFJLalJnOv4p/D5BrobC
KWDx2vFZBS5tXiI7HSrEiTfo2fIQZFpQ0JbSYK5Er50EaADoIHnVG1HfV+NVRdeMf3HEoz31j/fs
BZupoGfSw3a7Vq4QRKhX3LxpQAnQ4AsqR0ivwN/OxkbtK5Urf29tW9/SYMb66quefqWEDCSo8l60
4FEfIjSO9TSUf6O+uXFughHl2CefOjzKj7K6FJ3ezbT3V7T5zuHXm8GP1+dEf/U7ZzwULw7xA4y3
jsGKJDc3PwJkiyUXz8//BLSCIe0Fp7xeuvYaqllZkA==
=Khw1
-----END PGP SIGNATURE-----

--fzSR67JHUtEPKSIwAP8omhVzYar2VS9yj--

