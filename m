Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFED3A98FE
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 13:18:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142874.263496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltTZ0-0002hZ-Mw; Wed, 16 Jun 2021 11:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142874.263496; Wed, 16 Jun 2021 11:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltTZ0-0002fj-Jr; Wed, 16 Jun 2021 11:18:30 +0000
Received: by outflank-mailman (input) for mailman id 142874;
 Wed, 16 Jun 2021 11:18:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=my07=LK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ltTYz-0002fd-BB
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 11:18:29 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc2ed7f2-86db-41c6-ba9a-07a3cb725144;
 Wed, 16 Jun 2021 11:18:28 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 414AD1FD49;
 Wed, 16 Jun 2021 11:18:27 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id F2AA5118DD;
 Wed, 16 Jun 2021 11:18:26 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id zkYeOgLeyWAbagAALh3uQQ
 (envelope-from <jgross@suse.com>); Wed, 16 Jun 2021 11:18:26 +0000
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
X-Inumbo-ID: dc2ed7f2-86db-41c6-ba9a-07a3cb725144
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623842307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vQnhy7epSoxBF0Q33jPWHaptTxsHKqQgS9prFbITaw8=;
	b=IS2BO4p9AeNfBtCzmJKOtn1kQfXZttWvhazm9fxd7yfRfJjGYxJqXvQYMTvOF6Bggiu1VJ
	33PDTgYPxLPNj59gnZqo2/t7sGQT225s34IfjqzDoZt4SdxySEWeCHCKFZYKRqmnpxKfdm
	t5Zl1X5Iy73Pg7UQqVSlz7NCuncGnAM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623842307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vQnhy7epSoxBF0Q33jPWHaptTxsHKqQgS9prFbITaw8=;
	b=IS2BO4p9AeNfBtCzmJKOtn1kQfXZttWvhazm9fxd7yfRfJjGYxJqXvQYMTvOF6Bggiu1VJ
	33PDTgYPxLPNj59gnZqo2/t7sGQT225s34IfjqzDoZt4SdxySEWeCHCKFZYKRqmnpxKfdm
	t5Zl1X5Iy73Pg7UQqVSlz7NCuncGnAM=
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 stable@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <20210616073007.5215-1-jgross@suse.com>
 <20210616073007.5215-2-jgross@suse.com>
 <a3674ab9-40d8-c365-d48c-0e1c88814942@suse.com>
 <97de842a-f095-3a12-ab16-beca0f97ba67@suse.com>
 <a5747064-cf3b-4ccb-5b46-3b6e069e7202@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] xen: fix setting of max_pfn in shared_info
Message-ID: <38b6ffe0-e737-b5ad-292e-4567169da2cd@suse.com>
Date: Wed, 16 Jun 2021 13:18:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <a5747064-cf3b-4ccb-5b46-3b6e069e7202@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IQylznpjmVJzclnnrAPlCY9QqLxMCmrJS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IQylznpjmVJzclnnrAPlCY9QqLxMCmrJS
Content-Type: multipart/mixed; boundary="OLR98vrvW4TVmJmg6eTytLC9R4elmdYdY";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 stable@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
Message-ID: <38b6ffe0-e737-b5ad-292e-4567169da2cd@suse.com>
Subject: Re: [PATCH 1/2] xen: fix setting of max_pfn in shared_info
References: <20210616073007.5215-1-jgross@suse.com>
 <20210616073007.5215-2-jgross@suse.com>
 <a3674ab9-40d8-c365-d48c-0e1c88814942@suse.com>
 <97de842a-f095-3a12-ab16-beca0f97ba67@suse.com>
 <a5747064-cf3b-4ccb-5b46-3b6e069e7202@suse.com>
In-Reply-To: <a5747064-cf3b-4ccb-5b46-3b6e069e7202@suse.com>

--OLR98vrvW4TVmJmg6eTytLC9R4elmdYdY
Content-Type: multipart/mixed;
 boundary="------------9763D726AC0B9F598954F6C1"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------9763D726AC0B9F598954F6C1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 16.06.21 12:56, Jan Beulich wrote:
> On 16.06.2021 12:37, Juergen Gross wrote:
>> On 16.06.21 11:52, Jan Beulich wrote:
>>> On 16.06.2021 09:30, Juergen Gross wrote:
>>>> Xen PV guests are specifying the highest used PFN via the max_pfn
>>>> field in shared_info. This value is used by the Xen tools when savin=
g
>>>> or migrating the guest.
>>>>
>>>> Unfortunately this field is misnamed, as in reality it is specifying=

>>>> the number of pages (including any memory holes) of the guest, so it=

>>>> is the highest used PFN + 1. Renaming isn't possible, as this is a
>>>> public Xen hypervisor interface which needs to be kept stable.
>>>>
>>>> The kernel will set the value correctly initially at boot time, but
>>>> when adding more pages (e.g. due to memory hotplug or ballooning) a
>>>> real PFN number is stored in max_pfn. This is done when expanding th=
e
>>>> p2m array, and the PFN stored there is even possibly wrong, as it
>>>> should be the last possible PFN of the just added P2M frame, and not=

>>>> one which led to the P2M expansion.
>>>>
>>>> Fix that by setting shared_info->max_pfn to the last possible PFN + =
1.
>>>>
>>>> Fixes: 98dd166ea3a3c3 ("x86/xen/p2m: hint at the last populated P2M =
entry")
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>
>>> The code change is fine, so
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> But I think even before the rename you would want to clarify the comm=
ent
>>> next to the variable's definition, to make clear what it really holds=
=2E
>>
>> It already says: "Number of valid entries in the p2m table(s) ..."
>> What do you think is unclear about that? Or do you mean another
>> variable?
>=20
> I mean the variable the value of which the patch corrects, i.e.
> xen_p2m_last_pfn. What I see in current source is
>=20
> /*
>   * Hint at last populated PFN.
>   *
>   * Used to set HYPERVISOR_shared_info->arch.max_pfn so the toolstack
>   * can avoid scanning the whole P2M (which may be sized to account for=

>   * hotplugged memory).
>   */
> static unsigned long xen_p2m_last_pfn;

Ah, okay.

I think only changing the comment without renaming the variable isn't
the way to go.

In order to keep the to be backported patch small I'd rather do the
comment adjustment and variable renaming in the followup patch.


Juergen

--------------9763D726AC0B9F598954F6C1
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

--------------9763D726AC0B9F598954F6C1--

--OLR98vrvW4TVmJmg6eTytLC9R4elmdYdY--

--IQylznpjmVJzclnnrAPlCY9QqLxMCmrJS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDJ3gIFAwAAAAAACgkQsN6d1ii/Ey9a
TQf/bibt2AbowpHgThmNOjzsPvI0Fp3dN7Jl7jetnuYN4jCYRmV2dqwUYxoNfiHKsk7Kxzy1mg5P
QuVkjPoYKxYRGFveAhHsowsMaB1Hx6jMvZiYBa3GdxK1Ii74j0u0RSC2xqwbsS+ra04xQ8h3s/6w
UHmni0j+SvJMgbUBpW/jvwd+fE6zaidjhRgw9sPFwMyfk3CLc0SPErT+xD6pmwu5hkwl/nLN3QQl
DIRCetps5EQvTgXTjEeR7dqShhC09obcBtdHZASZKGkC2ToSkqB/u1ysLwwgx2+WYGPKVfDatA6y
purErzPLK7l0ABvIrF1p+E0IVrnXsKOR6qiK+EIkeg==
=2F1H
-----END PGP SIGNATURE-----

--IQylznpjmVJzclnnrAPlCY9QqLxMCmrJS--

