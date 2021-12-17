Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B452478F98
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 16:27:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248761.429081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myF7Z-0007NP-MW; Fri, 17 Dec 2021 15:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248761.429081; Fri, 17 Dec 2021 15:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myF7Z-0007Jz-Hy; Fri, 17 Dec 2021 15:26:09 +0000
Received: by outflank-mailman (input) for mailman id 248761;
 Fri, 17 Dec 2021 15:26:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NBDy=RC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1myF7X-0007Jt-QS
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 15:26:08 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a622008c-5f4d-11ec-85d3-df6b77346a89;
 Fri, 17 Dec 2021 16:26:04 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 608011F389;
 Fri, 17 Dec 2021 15:26:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 12DF513BF1;
 Fri, 17 Dec 2021 15:26:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lfJAAwysvGGsPQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 17 Dec 2021 15:26:04 +0000
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
X-Inumbo-ID: a622008c-5f4d-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1639754764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m7vbYo/MipNzFzK88GLr+dHK8w930a4ZnGRjRgwTsnE=;
	b=n126FRULMw85dtfxqWBXoVIN5njrALXFyXeIHtp4SY70ofGsqNp/m5/vA/3vuxx6g2isqL
	0wGcL9WVIX7RRtAjBuuoH+bJCGZ3QNuF7Xbt03hQd+BzMjzw0pvnI3Cofp8qlh5Soq3lY8
	BiiMWYTEagkWrP/7EcMUxMYQNJj4KOQ=
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
 <813684b0-df71-c18b-cf4c-106cc286c035@suse.com>
 <8348ef52-701b-e1f9-2d9b-226ac97e8e2f@gmail.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH V6 1/2] libxl: Add support for Virtio disk configuration
Message-ID: <15b837ba-25cf-7e4c-4729-f82bffe02fed@suse.com>
Date: Fri, 17 Dec 2021 16:26:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <8348ef52-701b-e1f9-2d9b-226ac97e8e2f@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zfdQqTAeHA5DSQuydaXayzq8Td61s5NeY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zfdQqTAeHA5DSQuydaXayzq8Td61s5NeY
Content-Type: multipart/mixed; boundary="xju9h4oIXBxCmCgwm6EXMekceuVOtZlVG";
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
Message-ID: <15b837ba-25cf-7e4c-4729-f82bffe02fed@suse.com>
Subject: Re: [PATCH V6 1/2] libxl: Add support for Virtio disk configuration
References: <1638982784-14390-1-git-send-email-olekstysh@gmail.com>
 <1638982784-14390-2-git-send-email-olekstysh@gmail.com>
 <YbjANCjAUGe4BAar@perard> <bce10079-abd6-c033-6273-ac0ea9f51668@gmail.com>
 <4c89e55d-4bf1-506e-d620-4a0ff18ef308@suse.com>
 <dc1b70ac-079d-5de8-cb13-6be4944cef0a@gmail.com>
 <813684b0-df71-c18b-cf4c-106cc286c035@suse.com>
 <8348ef52-701b-e1f9-2d9b-226ac97e8e2f@gmail.com>
In-Reply-To: <8348ef52-701b-e1f9-2d9b-226ac97e8e2f@gmail.com>

--xju9h4oIXBxCmCgwm6EXMekceuVOtZlVG
Content-Type: multipart/mixed;
 boundary="------------762C6C5BDD49D64352C970DE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------762C6C5BDD49D64352C970DE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 15.12.21 22:36, Oleksandr wrote:
>=20
> On 15.12.21 17:58, Juergen Gross wrote:
>=20
>=20
> Hi Juergen
>=20
>=20
>> On 15.12.21 16:02, Oleksandr wrote:
>>>
>>> On 15.12.21 08:08, Juergen Gross wrote:
>>>
>>> Hi Juergen
>>>
>>>> On 14.12.21 18:44, Oleksandr wrote:
>>>>>
>>>>> On 14.12.21 18:03, Anthony PERARD wrote:
>>>>>
>>>>> Hi Anthony
>>>>>
>>>>>
>>>>>> On Wed, Dec 08, 2021 at 06:59:43PM +0200, Oleksandr Tyshchenko wro=
te:
>>>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>>>
>>>>>>> This patch adds basic support for configuring and assisting=20
>>>>>>> virtio-disk
>>>>>>> backend (emualator) which is intended to run out of Qemu and=20
>>>>>>> could be
>>>>>>> run in any domain.
>>>>>>> Although the Virtio block device is quite different from traditio=
nal
>>>>>>> Xen PV block device (vbd) from the toolstack point of view:
>>>>>>> =C2=A0 - as the frontend is virtio-blk which is not a Xenbus driv=
er,=20
>>>>>>> nothing
>>>>>>> =C2=A0=C2=A0=C2=A0 written to Xenstore are fetched by the fronten=
d (the vdev is not
>>>>>>> =C2=A0=C2=A0=C2=A0 passed to the frontend)
>>>>>>> =C2=A0 - the ring-ref/event-channel are not used for the=20
>>>>>>> backend<->frontend
>>>>>>> =C2=A0=C2=A0=C2=A0 communication, the proposed IPC for Virtio is =
IOREQ/DM
>>>>>>> it is still a "block device" and ought to be integrated in existi=
ng
>>>>>>> "disk" handling. So, re-use (and adapt) "disk" parsing/configurat=
ion
>>>>>>> logic to deal with Virtio devices as well.
>>>>>> How backend are intended to be created? Is there something=20
>>>>>> listening on
>>>>>> xenstore?
>>>>>>
>>>>>> You mention QEMU as been the backend, do you intend to have QEMU
>>>>>> listening on xenstore to create a virtio backend? Or maybe it is=20
>>>>>> on the
>>>>>> command line? There is QMP as well, but it's probably a lot more
>>>>>> complicated as I think libxl needs refactoring for that.
>>>>>
>>>>>
>>>>> No, QEMU is not involved there. The backend is a standalone=20
>>>>> application,
>>>>> it is launched from the command line. The backend reads the=20
>>>>> Xenstore to get
>>>>> the configuration and to detect when guest with the frontend is=20
>>>>> created/destroyed.
>>>>
>>>> I think this should be reflected somehow in the configuration, as I
>>>> expect qemu might gain this functionality in the future.
>>>
>>> I understand this and agree in general (however I am wondering=20
>>> whether this can be postponed until it is actually needed), but ...
>>
>> This might lead to the need to support some "legacy" options in future=
=2E
>> I think we should at least think whether these scheme will cover (or
>> prohibit) extensions which are already on the horizon.
>=20
> ok
>=20
>=20
>>
>>
>>>> I'm wondering whether we shouldn't split the backend from the protoc=
ol
>>>> (or specification?). Something like "protocol=3Dvirtio" (default wou=
ld be
>>>> e.g. "xen") and then you could add "backend=3Dexternal" for your use=
=20
>>>> case?
>>>
>>> ... I am afraid, I didn't get the idea. Are we speaking about the=20
>>> (new?) disk configuration options
>>> here or these are not disk specific things at all and to be=20
>>> applicable for all possible backends?
>>
>> I was talking of a general approach using the disk as an example. For
>> disks it is just rather obvious.
>>
>>> If the former, then could the new backendtype simply do the job? For =

>>> example, "backendtype=3Dvirtio_external" for our current use-case and=
=20
>>> "backendtype=3Dvirtio_qemu"
>>> for the possible future use-cases? Could you please clarify the idea.=

>>
>> I want to avoid overloading the backendtype with information which is
>> in general not really related by the backend. You can have a qemu base=
d
>> qdisk backend serving a Xen PV-disk (like today) or a virtio disk.
>>
>> A similar approach has been chosen for the disk format: it is not part=

>> of the backend, but a parameter of its own. This way e.g. the qdisk
>> backend can use the original qdisk format, or the qcow format.
>>
>> In practice we are having something like the "protocol" already today:=

>> the disk device name is encoding that ("xvd*" is a Xen PV disk, while
>> "sd*" is an emulated SCSI disk, which happens to be presented to the
>> guest as "xvd*", too). And this is an additional information not
>> related to the backendtype.
>>
>> So we have basically the following configuration items, which are
>> orthogonal to each other (some combinations might not make sense,
>> but in theory most would be possible):
>>
>> 1. protocol: emulated (not PV), Xen (like today), virtio
>>
>> 2. backendtype: phy (blkback), qdisk (qemu), other (e.g. a daemon)
>>
>> 3. format: raw, qcow, qcow2, vhd, qed
>>
>> The combination virtio+phy would be equivalent to vhost, BTW. And
>> virtio+other might even use vhost-user, depending on the daemon.
> yes, BTW the combination virtio+other is close to our use-case.
>=20
>=20
> Thank you for the detailed explanation, now I see your point why using =

> backendtype=3Dvirtio is not flexible option in the long term
> and why we would want/need to an extra configuration option such as=20
> protocol, etc. I think, it makes sense and would be correct.
>=20
> If we take a disk as an example, then from the configuration PoV we wil=
l=20
> need to:
> - add an optional "protocol" option

I'm not sure regarding the name of the option. "protocol" was just a
suggestion by me.

> - add new backendtype: external/other/daemon/etc.
> This seems to cover all possible combinations describe above (although =
I=20
> agree that some of them might not make sense). Is my understanding corr=
ect?

Yes.

> Unfortunately, disk configuration/management code is spread over=20
> multiple sources (including auto-generated) in the toolstack which is=20
> not so easy to follow (at least to me
> who is not familiar enough with all this stuff), but anyway may I pleas=
e=20
> clarify what is the minimum required amount of things that I need to do=
=20
> in order to get this basic virtio-mmio
> support series accepted?

I'd say we should first get consensus that others agree with my
suggestion. If so, I guess adding a general "protocol" (or whatever
the name will be) attribute to struct libxl_device_disk (and maybe
to other devices, too?) should be the first step.

It might even be a godd idea to use "virtio-mmio" as the protocol string
for differentiating it from e.g. "virtio-pci".

The rest should be rather straight forward similar to your current
approach.


Juergen

--------------762C6C5BDD49D64352C970DE
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

--------------762C6C5BDD49D64352C970DE--

--xju9h4oIXBxCmCgwm6EXMekceuVOtZlVG--

--zfdQqTAeHA5DSQuydaXayzq8Td61s5NeY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmG8rAsFAwAAAAAACgkQsN6d1ii/Ey85
qwf9FHqrmV/RNdN8KjKbvbGEX2XR2E2EFyZN8K0WCPS0IJrl5eH/bbPZ/dnxM8uwJLdRa1VfkBhG
ZZHgHIWTQTgDA79XNeInc6bJExNgtSxwbYMdTvkmCFAGmMtueuFPqyz6eGKIaJOh4GuRfD0hIgPV
N1rhDy5hnBl8UQhtIXdXod6W1PsSmItQ5WVPcjhknod5eroAB9NrJ/pw8UBffpOA3iWmdZSeRkPG
NoqnEowuVeZhRSMZ8HjgS9j1mAl4PElS5VkMpeFuqC5yjVPCcOFSLLjWeJJYtjEelECQG+ToYzM0
paNHfd0w4C2k/o8VglV6rb8UIvwSVhyvKClP6YLiyQ==
=gqIh
-----END PGP SIGNATURE-----

--zfdQqTAeHA5DSQuydaXayzq8Td61s5NeY--

