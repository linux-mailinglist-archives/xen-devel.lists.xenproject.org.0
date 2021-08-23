Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEEB3F46A9
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 10:34:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170230.310952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI5OW-0001tB-4s; Mon, 23 Aug 2021 08:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170230.310952; Mon, 23 Aug 2021 08:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI5OW-0001qM-1P; Mon, 23 Aug 2021 08:33:24 +0000
Received: by outflank-mailman (input) for mailman id 170230;
 Mon, 23 Aug 2021 08:33:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bkyO=NO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mI5OU-0001qE-8s
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 08:33:22 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5a205aa-03ec-11ec-a868-12813bfff9fa;
 Mon, 23 Aug 2021 08:33:21 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2A7181FD90;
 Mon, 23 Aug 2021 08:33:20 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id C13FA13A12;
 Mon, 23 Aug 2021 08:33:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id tFkaLU9dI2FjZAAAGKfGzw
 (envelope-from <jgross@suse.com>); Mon, 23 Aug 2021 08:33:19 +0000
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
X-Inumbo-ID: c5a205aa-03ec-11ec-a868-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629707600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nVMmg5e/QybRQpHPqYsBXcYu4l9nPxKjI4xTD9R0cRk=;
	b=Ef2PSIlCeGvAodf6grsZpKsvFTUeAJ1E5vTZFZds5xEGAhzH1PYjLeHl8d88/2G9uFbURz
	K3st55j+5RGFUOyOEmsTTk1VboiikUY/Y2cc5mCFL+PUk/TmWe0TpWtnbre7b8365CvvVx
	36fz2TGTIZm7ZUKj1BWYKiVXBKA5jUo=
To: CGEL <cgel.zte@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, Jing Yangyang <jing.yangyang@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
References: <20210823021353.44391-1-jing.yangyang@zte.com.cn>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH linux-next] arch/x86/xen/time.c: fix bugon.cocci warnings
Message-ID: <b7bd47d4-c83d-7f2c-ef6c-a309bf101745@suse.com>
Date: Mon, 23 Aug 2021 10:33:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823021353.44391-1-jing.yangyang@zte.com.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="s6tNo8rdvM0JfkAmHNrGgrKFkwgMIWJ1v"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--s6tNo8rdvM0JfkAmHNrGgrKFkwgMIWJ1v
Content-Type: multipart/mixed; boundary="ya1C52Jif3LNEhUlrq2WyMKUkHDhK5PUz";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: CGEL <cgel.zte@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, Jing Yangyang <jing.yangyang@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Message-ID: <b7bd47d4-c83d-7f2c-ef6c-a309bf101745@suse.com>
Subject: Re: [PATCH linux-next] arch/x86/xen/time.c: fix bugon.cocci warnings
References: <20210823021353.44391-1-jing.yangyang@zte.com.cn>
In-Reply-To: <20210823021353.44391-1-jing.yangyang@zte.com.cn>

--ya1C52Jif3LNEhUlrq2WyMKUkHDhK5PUz
Content-Type: multipart/mixed;
 boundary="------------248CE5AC1254D59E682F13F6"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------248CE5AC1254D59E682F13F6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 23.08.21 04:13, CGEL wrote:
> From: Jing Yangyang <jing.yangyang@zte.com.cn>
>=20
> Use BUG_ON instead of a if condition followed by BUG.
>=20
> Generated by: scripts/coccinelle/misc/bugon.cocci
>=20
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
> ---
>   arch/x86/xen/time.c | 20 ++++++++------------
>   1 file changed, 8 insertions(+), 12 deletions(-)
>=20
> diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
> index d9c945e..6e29b69 100644
> --- a/arch/x86/xen/time.c
> +++ b/arch/x86/xen/time.c
> @@ -210,8 +210,7 @@ static int xen_timerop_set_next_event(unsigned long=
 delta,
>   {
>   	WARN_ON(!clockevent_state_oneshot(evt));
>  =20
> -	if (HYPERVISOR_set_timer_op(get_abs_timeout(delta)) < 0)
> -		BUG();
> +	BUG_ON(HYPERVISOR_set_timer_op(get_abs_timeout(delta)) < 0);
>  =20
>   	/* We may have missed the deadline, but there's no real way of
>   	   knowing for sure.  If the event was in the past, then we'll
> @@ -241,11 +240,10 @@ static int xen_vcpuop_shutdown(struct clock_event=
_device *evt)
>   {
>   	int cpu =3D smp_processor_id();
>  =20
> -	if (HYPERVISOR_vcpu_op(VCPUOP_stop_singleshot_timer, xen_vcpu_nr(cpu)=
,
> +	BUG_ON(HYPERVISOR_vcpu_op(VCPUOP_stop_singleshot_timer, xen_vcpu_nr(c=
pu),
>   			       NULL) ||

Please adjust the alignment of the continuation line (i.e. insert 2
blanks). Same below.

Even better would be to avoid the repeated "xen_vcpu_nr(cpu)" by
using "int vcpu =3D xen_vcpu_nr(smp_processor_id());" leading to the
possibility to not need the continuation lines at all.

> -	    HYPERVISOR_vcpu_op(VCPUOP_stop_periodic_timer, xen_vcpu_nr(cpu),
> -			       NULL))
> -		BUG();
> +		HYPERVISOR_vcpu_op(VCPUOP_stop_periodic_timer, xen_vcpu_nr(cpu),
> +			       NULL));
>  =20
>   	return 0;
>   }
> @@ -254,9 +252,8 @@ static int xen_vcpuop_set_oneshot(struct clock_even=
t_device *evt)
>   {
>   	int cpu =3D smp_processor_id();
>  =20
> -	if (HYPERVISOR_vcpu_op(VCPUOP_stop_periodic_timer, xen_vcpu_nr(cpu),
> -			       NULL))
> -		BUG();
> +	BUG_ON(HYPERVISOR_vcpu_op(VCPUOP_stop_periodic_timer, xen_vcpu_nr(cpu=
),
> +			       NULL));

See above.

>  =20
>   	return 0;
>   }
> @@ -373,9 +370,8 @@ void xen_timer_resume(void)
>   		return;
>  =20
>   	for_each_online_cpu(cpu) {
> -		if (HYPERVISOR_vcpu_op(VCPUOP_stop_periodic_timer,
> -				       xen_vcpu_nr(cpu), NULL))
> -			BUG();
> +		BUG_ON(HYPERVISOR_vcpu_op(VCPUOP_stop_periodic_timer,
> +				       xen_vcpu_nr(cpu), NULL));

See above.


Juergen

--------------248CE5AC1254D59E682F13F6
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

--------------248CE5AC1254D59E682F13F6--

--ya1C52Jif3LNEhUlrq2WyMKUkHDhK5PUz--

--s6tNo8rdvM0JfkAmHNrGgrKFkwgMIWJ1v
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEjXU8FAwAAAAAACgkQsN6d1ii/Ey8f
Dwf8D84OgGeNV0bi06jFlOyMYbS7AGSU05dH/UGTMEB60geoI5dcI7ZDmiPQF/JRkiXPBTdO8auh
v1EI6TvOhBc09P6Sq9cMQz+DiWZgarxibaxXoP9XyPh8lNll69GlKk+briE6wanmaCcVROLnuOoU
GsGH8KslsfjqylqqJGIbvKNVY2yvh8qCYPNUbN0TW2vYTySKlCcl6NsGU3l0QNyBwkfPSZW5Uovp
Fze7bXXGOTzH/S4zP9+Agvzf6bBmfwPHJ2BTDdadKLlMnvIPmpOKdMHXs3AFG8E4FXIIFHDxco5j
TwO/dVB1D58hzGmfGeR8xsI2ao/SUDvtlb5JwyyP2w==
=fZCz
-----END PGP SIGNATURE-----

--s6tNo8rdvM0JfkAmHNrGgrKFkwgMIWJ1v--

