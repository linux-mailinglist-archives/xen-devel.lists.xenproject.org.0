Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE51472FD9
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 15:56:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246145.424552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwmkc-0005em-EY; Mon, 13 Dec 2021 14:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246145.424552; Mon, 13 Dec 2021 14:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwmkc-0005aY-Ac; Mon, 13 Dec 2021 14:56:26 +0000
Received: by outflank-mailman (input) for mailman id 246145;
 Mon, 13 Dec 2021 14:56:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/ja4=Q6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mwmkb-0005YO-EB
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 14:56:25 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d65b574a-5c24-11ec-85d3-df6b77346a89;
 Mon, 13 Dec 2021 15:56:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5167921123;
 Mon, 13 Dec 2021 14:56:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2D53313DE2;
 Mon, 13 Dec 2021 14:56:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id l+q1CRZft2FWNwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Dec 2021 14:56:22 +0000
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
X-Inumbo-ID: d65b574a-5c24-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1639407382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j7cVxE04IfsTIEumjoh0h0K2JpqO07CGgJNiGKv+uYU=;
	b=rTwGDY9Uw5nUopNc2mxAT8fkgtxzs1B/+a6gkCcbxVvv6fX0JD/YwJxlI2sBomnSIB3cwX
	MpqMQBL+0u9yDAtWt9av48q3fFqmW3GhSwLF9m14U3nseQb48FiK6jNId1+9O3A+9cIqZQ
	0yfvDtB4AQlvH6rzj/d67Q+GB7eqv9Q=
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20211206072337.9517-1-jgross@suse.com>
 <20211206072337.9517-3-jgross@suse.com>
 <20211212000558.232nzs7k5lklpbym@begin>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 02/10] mini-os: sort and sanitize e820 memory map
Message-ID: <ab1b2e26-65c1-c877-cf88-0df50d38b925@suse.com>
Date: Mon, 13 Dec 2021 15:56:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20211212000558.232nzs7k5lklpbym@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IAFzW0f4rRLv6G6aH0YvjuKBDF6qBTSig"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IAFzW0f4rRLv6G6aH0YvjuKBDF6qBTSig
Content-Type: multipart/mixed; boundary="eYeR0dxD77OMlNuDhk2i5UNuo2LM5MmRq";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
Message-ID: <ab1b2e26-65c1-c877-cf88-0df50d38b925@suse.com>
Subject: Re: [PATCH 02/10] mini-os: sort and sanitize e820 memory map
References: <20211206072337.9517-1-jgross@suse.com>
 <20211206072337.9517-3-jgross@suse.com>
 <20211212000558.232nzs7k5lklpbym@begin>
In-Reply-To: <20211212000558.232nzs7k5lklpbym@begin>

--eYeR0dxD77OMlNuDhk2i5UNuo2LM5MmRq
Content-Type: multipart/mixed;
 boundary="------------9740D0F2639D38120BDF7612"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------9740D0F2639D38120BDF7612
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12.12.21 01:05, Samuel Thibault wrote:
> Hello,
>=20
> Juergen Gross, le lun. 06 d=C3=A9c. 2021 08:23:29 +0100, a ecrit:
>> - align the entries to page boundaries
>=20
>> +    /* Adjust map entries to page boundaries. */
>> +    for ( i =3D 0; i < e820_entries; i++ )
>> +    {
>> +        end =3D (e820_map[i].addr + e820_map[i].size + PAGE_SIZE - 1)=
 & PAGE_MASK;
>> +        e820_map[i].addr &=3D PAGE_MASK;
>> +        e820_map[i].size =3D end - e820_map[i].addr;
>> +    }
>=20
> Mmm, what if the previous entry ends after the aligned start?
>=20
> On real machines that does happen, and you'd rather round up the start
> address of usable areas, rather than rounding it down (and conversely
> for the end).

I think you are partially right. :-)

Entries for resources managed by Mini-OS (RAM, maybe NVME?) should be
rounded to cover only complete pages (start rounded up, end rounded
down), but all other entries should be rounded to cover the complete
area (start rounded down, end rounded up) in order not to use any
partial used page for e.g. mapping foreign pages.

>=20
>> +    /* Sort entries by start address. */
>> +    for ( i =3D 0; i < e820_entries - 1; i++ )
>> +    {
>> +        if ( e820_map[i].addr > e820_map[i + 1].addr )
>> +        {
>> +            e820_swap_entries(i, i + 1);
>> +            i =3D -1;
>> +        }
>> +    }
>=20
> This looks O(n^3) to me? A bubble sort like this should be fine:
>=20
>      /* Sort entries by start address. */
>      for ( last =3D e820_entries; last > 1; last-- )
>      {
>          for ( i =3D 0; i < last - 1; i++ )
>          {
>              if ( e820_map[i].addr > e820_map[i + 1].addr )
>              {
>                  e820_swap_entries(i, i + 1);
>              }
>          }
>      }

Hmm, depends.

Assuming a rather well sorted map my version is O(n), while yours
is still O(n^2).

In the end it won't matter that much, because a normal map will have
only very few entries (usually 5 before merging consecutive entries).

I'm fine both ways, whatever you prefer.


Juergen

--------------9740D0F2639D38120BDF7612
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

--------------9740D0F2639D38120BDF7612--

--eYeR0dxD77OMlNuDhk2i5UNuo2LM5MmRq--

--IAFzW0f4rRLv6G6aH0YvjuKBDF6qBTSig
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmG3XxUFAwAAAAAACgkQsN6d1ii/Ey/T
6Af/ffa1ro8nIoFT9rqUrMD4+zE0MDXNfA6ALAGIQgYN2C4K3CaBZQcObHjFxFtlKSuBhOgovOl9
cIpLS/aQHhQ3jw1rlGK5FeY6fc1XPqMq8nXvJbjL07pmpB2bwbFlyqpRttEc+Qsg5eUMtY2OLmMZ
zSTgo2BGFfhplkGkT/79ytvMS8k9Y0SeiNa+J1vVUrX7cN6Tltn/6KwKLxyiYYVL/6ph2bfqItwS
eFHNhHKFEIwOhED+fblcnjhVn3wM2qDzhWn+C79KbDUGOFG42fLRnM6xbFBIa4BgkOq4ZwW5tQUi
1488mBtZbBUliW7xrAfLKm4OEsYB6gVLibI7W99u0A==
=CHAl
-----END PGP SIGNATURE-----

--IAFzW0f4rRLv6G6aH0YvjuKBDF6qBTSig--

