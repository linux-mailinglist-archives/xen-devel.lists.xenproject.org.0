Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8455D475C7B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 16:59:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247454.426703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxWfT-0001Ex-If; Wed, 15 Dec 2021 15:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247454.426703; Wed, 15 Dec 2021 15:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxWfT-0001CO-El; Wed, 15 Dec 2021 15:58:11 +0000
Received: by outflank-mailman (input) for mailman id 247454;
 Wed, 15 Dec 2021 15:58:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kH8z=RA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mxWfR-0001CI-HW
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 15:58:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb3d14ad-5dbf-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 16:58:07 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 51FDF210E8;
 Wed, 15 Dec 2021 15:58:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0AAE313B75;
 Wed, 15 Dec 2021 15:58:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id r4ZwAY8QumHrEwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 15 Dec 2021 15:58:07 +0000
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
X-Inumbo-ID: cb3d14ad-5dbf-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1639583887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jYr7j45kf3CVDPqQWgTjhGPwDBfSwHjT7cvkuVL6Pgo=;
	b=XkNGnL7pZZ6w5cs1CV0CkgjhW7kMGYW9/U7FUJq0XX4TsEjdsbCcvt4eNIJ6zvQZNGLA4P
	q3zMpTsGB8XmhtTvG4awnMzW1T9fVlmQ06+yo50Ibq/nqvky1ex2JldNS1Fgs6vWXZ06Kf
	M83cePallsEmJobaH8c/omnEN96oPYM=
To: Oleksandr <olekstysh@gmail.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <1638982784-14390-1-git-send-email-olekstysh@gmail.com>
 <1638982784-14390-2-git-send-email-olekstysh@gmail.com>
 <YbjANCjAUGe4BAar@perard> <bce10079-abd6-c033-6273-ac0ea9f51668@gmail.com>
 <4c89e55d-4bf1-506e-d620-4a0ff18ef308@suse.com>
 <dc1b70ac-079d-5de8-cb13-6be4944cef0a@gmail.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH V6 1/2] libxl: Add support for Virtio disk configuration
Message-ID: <813684b0-df71-c18b-cf4c-106cc286c035@suse.com>
Date: Wed, 15 Dec 2021 16:58:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <dc1b70ac-079d-5de8-cb13-6be4944cef0a@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VeOjrmomgssEjMMOywE0wIhp0gRv3Sn8d"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VeOjrmomgssEjMMOywE0wIhp0gRv3Sn8d
Content-Type: multipart/mixed; boundary="xxLXFWYBRL1QSwkGyBQNnNYre2XMJP89u";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksandr <olekstysh@gmail.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Message-ID: <813684b0-df71-c18b-cf4c-106cc286c035@suse.com>
Subject: Re: [PATCH V6 1/2] libxl: Add support for Virtio disk configuration
References: <1638982784-14390-1-git-send-email-olekstysh@gmail.com>
 <1638982784-14390-2-git-send-email-olekstysh@gmail.com>
 <YbjANCjAUGe4BAar@perard> <bce10079-abd6-c033-6273-ac0ea9f51668@gmail.com>
 <4c89e55d-4bf1-506e-d620-4a0ff18ef308@suse.com>
 <dc1b70ac-079d-5de8-cb13-6be4944cef0a@gmail.com>
In-Reply-To: <dc1b70ac-079d-5de8-cb13-6be4944cef0a@gmail.com>

--xxLXFWYBRL1QSwkGyBQNnNYre2XMJP89u
Content-Type: multipart/mixed;
 boundary="------------A23C7142272FCC8AC239F321"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A23C7142272FCC8AC239F321
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 15.12.21 16:02, Oleksandr wrote:
>=20
> On 15.12.21 08:08, Juergen Gross wrote:
>=20
> Hi Juergen
>=20
>> On 14.12.21 18:44, Oleksandr wrote:
>>>
>>> On 14.12.21 18:03, Anthony PERARD wrote:
>>>
>>> Hi Anthony
>>>
>>>
>>>> On Wed, Dec 08, 2021 at 06:59:43PM +0200, Oleksandr Tyshchenko wrote=
:
>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>
>>>>> This patch adds basic support for configuring and assisting=20
>>>>> virtio-disk
>>>>> backend (emualator) which is intended to run out of Qemu and could =
be
>>>>> run in any domain.
>>>>> Although the Virtio block device is quite different from traditiona=
l
>>>>> Xen PV block device (vbd) from the toolstack point of view:
>>>>> =C2=A0 - as the frontend is virtio-blk which is not a Xenbus driver=
,=20
>>>>> nothing
>>>>> =C2=A0=C2=A0=C2=A0 written to Xenstore are fetched by the frontend =
(the vdev is not
>>>>> =C2=A0=C2=A0=C2=A0 passed to the frontend)
>>>>> =C2=A0 - the ring-ref/event-channel are not used for the backend<->=
frontend
>>>>> =C2=A0=C2=A0=C2=A0 communication, the proposed IPC for Virtio is IO=
REQ/DM
>>>>> it is still a "block device" and ought to be integrated in existing=

>>>>> "disk" handling. So, re-use (and adapt) "disk" parsing/configuratio=
n
>>>>> logic to deal with Virtio devices as well.
>>>> How backend are intended to be created? Is there something listening=
 on
>>>> xenstore?
>>>>
>>>> You mention QEMU as been the backend, do you intend to have QEMU
>>>> listening on xenstore to create a virtio backend? Or maybe it is on =
the
>>>> command line? There is QMP as well, but it's probably a lot more
>>>> complicated as I think libxl needs refactoring for that.
>>>
>>>
>>> No, QEMU is not involved there. The backend is a standalone applicati=
on,
>>> it is launched from the command line. The backend reads the Xenstore =

>>> to get
>>> the configuration and to detect when guest with the frontend is=20
>>> created/destroyed.
>>
>> I think this should be reflected somehow in the configuration, as I
>> expect qemu might gain this functionality in the future.
>=20
> I understand this and agree in general (however I am wondering whether =

> this can be postponed until it is actually needed), but ...

This might lead to the need to support some "legacy" options in future.
I think we should at least think whether these scheme will cover (or
prohibit) extensions which are already on the horizon.

>> I'm wondering whether we shouldn't split the backend from the protocol=

>> (or specification?). Something like "protocol=3Dvirtio" (default would=
 be
>> e.g. "xen") and then you could add "backend=3Dexternal" for your use c=
ase?
>=20
> ... I am afraid, I didn't get the idea. Are we speaking about the (new?=
)=20
> disk configuration options
> here or these are not disk specific things at all and to be applicable =

> for all possible backends?

I was talking of a general approach using the disk as an example. For
disks it is just rather obvious.

> If the former, then could the new backendtype simply do the job? For=20
> example, "backendtype=3Dvirtio_external" for our current use-case and=20
> "backendtype=3Dvirtio_qemu"
> for the possible future use-cases? Could you please clarify the idea.

I want to avoid overloading the backendtype with information which is
in general not really related by the backend. You can have a qemu based
qdisk backend serving a Xen PV-disk (like today) or a virtio disk.

A similar approach has been chosen for the disk format: it is not part
of the backend, but a parameter of its own. This way e.g. the qdisk
backend can use the original qdisk format, or the qcow format.

In practice we are having something like the "protocol" already today:
the disk device name is encoding that ("xvd*" is a Xen PV disk, while
"sd*" is an emulated SCSI disk, which happens to be presented to the
guest as "xvd*", too). And this is an additional information not
related to the backendtype.

So we have basically the following configuration items, which are
orthogonal to each other (some combinations might not make sense,
but in theory most would be possible):

1. protocol: emulated (not PV), Xen (like today), virtio

2. backendtype: phy (blkback), qdisk (qemu), other (e.g. a daemon)

3. format: raw, qcow, qcow2, vhd, qed

The combination virtio+phy would be equivalent to vhost, BTW. And
virtio+other might even use vhost-user, depending on the daemon.


Juergen

--------------A23C7142272FCC8AC239F321
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

--------------A23C7142272FCC8AC239F321--

--xxLXFWYBRL1QSwkGyBQNnNYre2XMJP89u--

--VeOjrmomgssEjMMOywE0wIhp0gRv3Sn8d
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmG6EI4FAwAAAAAACgkQsN6d1ii/Ey8I
twgAlw6MP7MLov3vc6X+VCcVcW63Bg2ubPBgVO4gISFh+dRob2YBuZed2EymBz5DIExvIcJd5M63
3xPMzWjOQyhxysyv3or37O0SfUFTGYf2jPwSercPtwi0aDBIjzVUvIo3YGlCD1Tz+f3bQUa0pLlo
rCHIwG1P6Crx78+R+EgH+5v5Au9XC35WCtzpUKRJFQ1bA2JpA27blK4It4H67ndeBgePGZar6cvN
wHbrI0WIGXNrRbscM6P5vFNWuckWwgst56xYn2Q5XydOwAJ/EUCMpPQN9UjZPFVv9DtHO4rjEKs+
Ko5ur4SbVs1B2OaNGB1uKvjSDFgoTH3qZuKdGoHr+g==
=DcRg
-----END PGP SIGNATURE-----

--VeOjrmomgssEjMMOywE0wIhp0gRv3Sn8d--

