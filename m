Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D614146F5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 12:47:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192489.342959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzlq-0005Ud-EV; Wed, 22 Sep 2021 10:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192489.342959; Wed, 22 Sep 2021 10:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzlq-0005Ru-AM; Wed, 22 Sep 2021 10:46:34 +0000
Received: by outflank-mailman (input) for mailman id 192489;
 Wed, 22 Sep 2021 10:46:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U2Du=OM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mSzlo-0005Ro-Hg
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 10:46:32 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 029b3dc5-3605-4715-a014-fdb8f0e4ca17;
 Wed, 22 Sep 2021 10:46:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 85A9B1FD6B;
 Wed, 22 Sep 2021 10:46:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4A52F13D69;
 Wed, 22 Sep 2021 10:46:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id odObEIYJS2H2YAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Sep 2021 10:46:30 +0000
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
X-Inumbo-ID: 029b3dc5-3605-4715-a014-fdb8f0e4ca17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632307590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xnjyJyHNhItsF8+WIk68P8ksbrihtfulOtnZqaeuDFU=;
	b=O3D76MKm2/yJYcrbjXqdjOF7m9WAxD/sbkoXKtoVnBxc7lHXxda2n4OxzXYutHuQsU2gbc
	gCAcFpCHfO2huB/5atTGPNjz/+8pGu4KwE58D1TfgNBkz2zkt0krbd3rW5o8LQIPOYK1ac
	hrhtRlj4dRLv3+6UFXf/LAGNWXV8K18=
Subject: Re: [PATCH] x86/xen: remove unneeded preempt_disable() from
 xen_irq_enable()
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
References: <20210921070226.32021-1-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <72919edf-8b8c-25f6-ee44-61463f41e188@suse.com>
Date: Wed, 22 Sep 2021 12:46:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210921070226.32021-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tk7Uw5Ml2QvPQThroYrAiWGF7iRiGlEmE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tk7Uw5Ml2QvPQThroYrAiWGF7iRiGlEmE
Content-Type: multipart/mixed; boundary="UzaC1WicFCVVaYrpliaphlh34sfFknQWx";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <72919edf-8b8c-25f6-ee44-61463f41e188@suse.com>
Subject: Re: [PATCH] x86/xen: remove unneeded preempt_disable() from
 xen_irq_enable()
References: <20210921070226.32021-1-jgross@suse.com>
In-Reply-To: <20210921070226.32021-1-jgross@suse.com>

--UzaC1WicFCVVaYrpliaphlh34sfFknQWx
Content-Type: multipart/mixed;
 boundary="------------B7FB63FD456F690A5AC1297F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------B7FB63FD456F690A5AC1297F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 21.09.21 09:02, Juergen Gross wrote:
> Disabling preemption in xen_irq_enable() is not needed. There is no
> risk of missing events due to preemption, as preemption can happen
> only in case an event is being received, which is just the opposite
> of missing an event.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>

Please ignore this patch, it is superseded now by

"[PATCH v2 0/2] x86/xen: simplify irq pvops"


Juergen

> ---
>   arch/x86/xen/irq.c | 18 +++++++-----------
>   1 file changed, 7 insertions(+), 11 deletions(-)
>=20
> diff --git a/arch/x86/xen/irq.c b/arch/x86/xen/irq.c
> index dfa091d79c2e..ba9b14a97109 100644
> --- a/arch/x86/xen/irq.c
> +++ b/arch/x86/xen/irq.c
> @@ -57,24 +57,20 @@ asmlinkage __visible void xen_irq_enable(void)
>   {
>   	struct vcpu_info *vcpu;
>  =20
> -	/*
> -	 * We may be preempted as soon as vcpu->evtchn_upcall_mask is
> -	 * cleared, so disable preemption to ensure we check for
> -	 * events on the VCPU we are still running on.
> -	 */
> -	preempt_disable();
> -
>   	vcpu =3D this_cpu_read(xen_vcpu);
>   	vcpu->evtchn_upcall_mask =3D 0;
>  =20
> -	/* Doesn't matter if we get preempted here, because any
> -	   pending event will get dealt with anyway. */
> +	/*
> +	 * Now preemption could happen, but this is only possible if an event=

> +	 * was handled, so missing an event due to preemption is not
> +	 * possible at all.
> +	 * The worst possible case is to be preempted and then check events
> +	 * pending on the old vcpu, but this is not problematic.
> +	 */
>  =20
>   	barrier(); /* unmask then check (avoid races) */
>   	if (unlikely(vcpu->evtchn_upcall_pending))
>   		xen_force_evtchn_callback();
> -
> -	preempt_enable();
>   }
>   PV_CALLEE_SAVE_REGS_THUNK(xen_irq_enable);
>  =20
>=20


--------------B7FB63FD456F690A5AC1297F
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

--------------B7FB63FD456F690A5AC1297F--

--UzaC1WicFCVVaYrpliaphlh34sfFknQWx--

--tk7Uw5Ml2QvPQThroYrAiWGF7iRiGlEmE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFLCYUFAwAAAAAACgkQsN6d1ii/Ey+4
4wf/R6dXrtGfTz152XMdP13VtgyhlKk8j7CgiFnPfu3DbHQoI/zUv8DMDe12v8+PbbkmTvBj2X0c
jSkCWxxx3qN356IwmDATYTsM6rWFgEL37nJJgjIg5nBnNrhDC37X1C1k5hW9qYp32lVSKHS2v1Io
rAlZctdZE6NRr4j13yK5ApuVnpy+AId4Lhekt4IyqSWeZyQParYhF+Hyt4vzHb9EFa9whKQIOyaQ
uuFdAiuAMkwSAfScbdSYWC9WvnDa5aDJS9H74R415AA5yZ+TjUrbFF2c6s5CJa2Nqnqmz6NDtacj
6lu9KiXaClcr4TOt92ISKnXSSJxeMktndx+Jq+OmDw==
=2vVr
-----END PGP SIGNATURE-----

--tk7Uw5Ml2QvPQThroYrAiWGF7iRiGlEmE--

