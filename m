Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30F7486139
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 09:07:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253845.435118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5NnZ-0005WC-MK; Thu, 06 Jan 2022 08:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253845.435118; Thu, 06 Jan 2022 08:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5NnZ-0005To-JF; Thu, 06 Jan 2022 08:07:01 +0000
Received: by outflank-mailman (input) for mailman id 253845;
 Thu, 06 Jan 2022 08:07:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kr4l=RW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n5NnY-0005Ti-2q
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 08:07:00 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e1e263f-6ec7-11ec-9ce5-af14b9085ebd;
 Thu, 06 Jan 2022 09:06:59 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 90AC4210E0;
 Thu,  6 Jan 2022 08:06:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3757F1376E;
 Thu,  6 Jan 2022 08:06:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1CW3CyCj1mHCSQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 06 Jan 2022 08:06:56 +0000
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
X-Inumbo-ID: 9e1e263f-6ec7-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641456416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vdnLjQYIjUcKfecVaXOPWVeyFjng0GZi2EGIqD+0PNs=;
	b=nYi6hTVYlU7xiexKToyb1jar3k6LL/EtS6wa6R9ScBXsgakb50S/n118hsuqQH0vSh5iMk
	LQrCZUJSXF3v7O1+AG3tgDYSzPWB6d8pn66QjXallieQBeg6mzxz2pgi32CgnHjb6iJKwz
	GhVvcRs4la/6VR3faLPYix8cwI7Cryg=
Subject: Re: [PATCH V6 1/2] libxl: Add support for Virtio disk configuration
To: Anthony PERARD <anthony.perard@citrix.com>,
 Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
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
 <15b837ba-25cf-7e4c-4729-f82bffe02fed@suse.com>
 <44885d7e-c5a0-5b7c-144d-b9e6c7e54715@gmail.com> <YcIE5rv5vwxwSvKd@perard>
From: Juergen Gross <jgross@suse.com>
Message-ID: <e2a5b2e1-a0ce-6481-8789-4e380afbea0e@suse.com>
Date: Thu, 6 Jan 2022 09:06:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YcIE5rv5vwxwSvKd@perard>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nh7P4vTlh7WBGmhTqJcS6lUcYdSUSh9MI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nh7P4vTlh7WBGmhTqJcS6lUcYdSUSh9MI
Content-Type: multipart/mixed; boundary="g2UkN9WRdPSKYkhyL6EFeorpfvidJ3Ith";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>,
 Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Message-ID: <e2a5b2e1-a0ce-6481-8789-4e380afbea0e@suse.com>
Subject: Re: [PATCH V6 1/2] libxl: Add support for Virtio disk configuration
References: <1638982784-14390-1-git-send-email-olekstysh@gmail.com>
 <1638982784-14390-2-git-send-email-olekstysh@gmail.com>
 <YbjANCjAUGe4BAar@perard> <bce10079-abd6-c033-6273-ac0ea9f51668@gmail.com>
 <4c89e55d-4bf1-506e-d620-4a0ff18ef308@suse.com>
 <dc1b70ac-079d-5de8-cb13-6be4944cef0a@gmail.com>
 <813684b0-df71-c18b-cf4c-106cc286c035@suse.com>
 <8348ef52-701b-e1f9-2d9b-226ac97e8e2f@gmail.com>
 <15b837ba-25cf-7e4c-4729-f82bffe02fed@suse.com>
 <44885d7e-c5a0-5b7c-144d-b9e6c7e54715@gmail.com> <YcIE5rv5vwxwSvKd@perard>
In-Reply-To: <YcIE5rv5vwxwSvKd@perard>

--g2UkN9WRdPSKYkhyL6EFeorpfvidJ3Ith
Content-Type: multipart/mixed;
 boundary="------------1299747EB8C200722FC16A43"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1299747EB8C200722FC16A43
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 21.12.21 17:46, Anthony PERARD wrote:
> On Fri, Dec 17, 2021 at 06:50:02PM +0200, Oleksandr wrote:
>> On 17.12.21 17:26, Juergen Gross wrote:
>>> On 15.12.21 22:36, Oleksandr wrote:
>>>> On 15.12.21 17:58, Juergen Gross wrote:
>>>>> In practice we are having something like the "protocol" already tod=
ay:
>>>>> the disk device name is encoding that ("xvd*" is a Xen PV disk, whi=
le
>>>>> "sd*" is an emulated SCSI disk, which happens to be presented to th=
e
>>>>> guest as "xvd*", too). And this is an additional information not
>>>>> related to the backendtype.
>=20
> You mean in theory? ;-) In practice, xvd* is the same as hd* (or sd*?).=

> I tried once to have xvd* mean PV disk only, but the patch was rejected=
=2E
> So at the moment, we always get an emulated disk, we can't have PV disk=

> alone, at least on x86.

What?

Of course we can. Take any PV or PVH guest excluding dom0, and you'll
see that.


Juergen

--------------1299747EB8C200722FC16A43
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

--------------1299747EB8C200722FC16A43--

--g2UkN9WRdPSKYkhyL6EFeorpfvidJ3Ith--

--nh7P4vTlh7WBGmhTqJcS6lUcYdSUSh9MI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHWox8FAwAAAAAACgkQsN6d1ii/Ey8Y
vwgAgoiE2T6kAhT/W8/8cCvaYiZ8EYi4hKaGxkUEsZheyBdrXVmyHA/8B7/9GEYB8X+2dWZNFXka
i9Sxt1Y1wguGjFc/uQchszZj7fIPWSoHQTqteFhoEP1Sj9xaeBRDWd+/f6Cpooqn2o5f8Zw6tZLx
ndnO7JYgpQYaII6n0mK4pHy6GqTOOHitBt+0o8KDl5hRhpfA/ScOAFHUR99Nun1r4xrcv92B5fqV
HYign/J5ErG6hxFo6ftR54cYnJJbmBxgxQURSdqNqLQ1luwNLqk6Lzrh8Z5L9VF1guOR+VwrAw1B
AYB5gz/gXOwefeXZ6ynim1+zXWElNO026sVJMaFLWA==
=50Gq
-----END PGP SIGNATURE-----

--nh7P4vTlh7WBGmhTqJcS6lUcYdSUSh9MI--

