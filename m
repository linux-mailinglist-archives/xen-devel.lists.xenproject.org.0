Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6213F756E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 14:53:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172186.314011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIsPL-00045R-2U; Wed, 25 Aug 2021 12:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172186.314011; Wed, 25 Aug 2021 12:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIsPK-00043c-VZ; Wed, 25 Aug 2021 12:53:30 +0000
Received: by outflank-mailman (input) for mailman id 172186;
 Wed, 25 Aug 2021 12:53:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pqDN=NQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mIsPJ-00043W-OS
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 12:53:29 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfb9b0ea-b574-4d27-9baf-d6c9035c797d;
 Wed, 25 Aug 2021 12:53:28 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BD9822216D;
 Wed, 25 Aug 2021 12:53:27 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 6707013887;
 Wed, 25 Aug 2021 12:53:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 2DD5Fkc9JmGVMgAAGKfGzw
 (envelope-from <jgross@suse.com>); Wed, 25 Aug 2021 12:53:27 +0000
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
X-Inumbo-ID: bfb9b0ea-b574-4d27-9baf-d6c9035c797d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629896007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2SfjGcm1HuoM3CeFm12Qr9ZG4hUuOx/+CkPo6RSmnA0=;
	b=dLrmPd4wdn3pB+DJdb9G9KwYMf9RN5jnB7xQEa6y+VJzKqmpsPHMsvviiuxU29hMu2sCAC
	RRkIi4SMZiWAdJzEYdVrZcxQHC0nmeB3BHgdpOmU6C44QcJEqUa98fjy6LJ2Kr7rSbxMyu
	PjsAHrdVkS/DKR6vDlhb9VMr2gG/sNI=
Subject: Re: [PATCH linux-next] drivers/xen/events/events_base.c: fix
 bugon.cocci warnings
To: CGEL <cgel.zte@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Wei Liu <wei.liu@kernel.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, Jing Yangyang <jing.yangyang@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
References: <20210825062222.69936-1-deng.changcheng@zte.com.cn>
From: Juergen Gross <jgross@suse.com>
Message-ID: <1dca78e6-a75c-4918-f901-23b5cec777fe@suse.com>
Date: Wed, 25 Aug 2021 14:53:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210825062222.69936-1-deng.changcheng@zte.com.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IlpedywfmCkLoMf1IHADgzPswdTIkqihH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IlpedywfmCkLoMf1IHADgzPswdTIkqihH
Content-Type: multipart/mixed; boundary="Wz5p7El1rcjvRvf7l75EYY94uAItMXZLp";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: CGEL <cgel.zte@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Wei Liu <wei.liu@kernel.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, Jing Yangyang <jing.yangyang@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Message-ID: <1dca78e6-a75c-4918-f901-23b5cec777fe@suse.com>
Subject: Re: [PATCH linux-next] drivers/xen/events/events_base.c: fix
 bugon.cocci warnings
References: <20210825062222.69936-1-deng.changcheng@zte.com.cn>
In-Reply-To: <20210825062222.69936-1-deng.changcheng@zte.com.cn>

--Wz5p7El1rcjvRvf7l75EYY94uAItMXZLp
Content-Type: multipart/mixed;
 boundary="------------2B83BFF24BE5051433BBF49A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2B83BFF24BE5051433BBF49A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 25.08.21 08:22, CGEL wrote:
> From: Jing Yangyang <jing.yangyang@zte.com.cn>
>=20
> Use BUG_ON instead of a if condition followed by BUG.
>=20
> Generated by: scripts/coccinelle/misc/bugon.cocci
>=20
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>

I already gave you feedback for another patch asking you to adjust
the continuation line indentations.

Same here.


Juergen

> ---
>   drivers/xen/events/events_base.c | 21 ++++++++-------------
>   1 file changed, 8 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/even=
ts_base.c
> index a78704a..dd44019 100644
> --- a/drivers/xen/events/events_base.c
> +++ b/drivers/xen/events/events_base.c
> @@ -818,8 +818,7 @@ static void xen_evtchn_close(evtchn_port_t port)
>   	struct evtchn_close close;
>  =20
>   	close.port =3D port;
> -	if (HYPERVISOR_event_channel_op(EVTCHNOP_close, &close) !=3D 0)
> -		BUG();
> +	BUG_ON(HYPERVISOR_event_channel_op(EVTCHNOP_close, &close) !=3D 0);
>   }
>  =20
>   /* Not called for lateeoi events. */
> @@ -1270,9 +1269,8 @@ static int bind_ipi_to_irq(unsigned int ipi, unsi=
gned int cpu)
>   					      handle_percpu_irq, "ipi");
>  =20
>   		bind_ipi.vcpu =3D xen_vcpu_nr(cpu);
> -		if (HYPERVISOR_event_channel_op(EVTCHNOP_bind_ipi,
> -						&bind_ipi) !=3D 0)
> -			BUG();
> +		BUG_ON(HYPERVISOR_event_channel_op(EVTCHNOP_bind_ipi,
> +						&bind_ipi) !=3D 0);
>   		evtchn =3D bind_ipi.port;
>  =20
>   		ret =3D xen_irq_info_ipi_setup(cpu, irq, evtchn, ipi);
> @@ -1983,9 +1981,8 @@ static void restore_cpu_virqs(unsigned int cpu)
>   		/* Get a new binding from Xen. */
>   		bind_virq.virq =3D virq;
>   		bind_virq.vcpu =3D xen_vcpu_nr(cpu);
> -		if (HYPERVISOR_event_channel_op(EVTCHNOP_bind_virq,
> -						&bind_virq) !=3D 0)
> -			BUG();
> +		BUG_ON(HYPERVISOR_event_channel_op(EVTCHNOP_bind_virq,
> +						&bind_virq) !=3D 0);
>   		evtchn =3D bind_virq.port;
>  =20
>   		/* Record the new mapping. */
> @@ -2009,9 +2006,8 @@ static void restore_cpu_ipis(unsigned int cpu)
>  =20
>   		/* Get a new binding from Xen. */
>   		bind_ipi.vcpu =3D xen_vcpu_nr(cpu);
> -		if (HYPERVISOR_event_channel_op(EVTCHNOP_bind_ipi,
> -						&bind_ipi) !=3D 0)
> -			BUG();
> +		BUG_ON(HYPERVISOR_event_channel_op(EVTCHNOP_bind_ipi,
> +						&bind_ipi) !=3D 0);
>   		evtchn =3D bind_ipi.port;
>  =20
>   		/* Record the new mapping. */
> @@ -2063,8 +2059,7 @@ void xen_poll_irq_timeout(int irq, u64 timeout)
>   		poll.timeout =3D timeout;
>   		set_xen_guest_handle(poll.ports, &evtchn);
>  =20
> -		if (HYPERVISOR_sched_op(SCHEDOP_poll, &poll) !=3D 0)
> -			BUG();
> +		BUG_ON(HYPERVISOR_sched_op(SCHEDOP_poll, &poll) !=3D 0);
>   	}
>   }
>   EXPORT_SYMBOL(xen_poll_irq_timeout);
>=20


--------------2B83BFF24BE5051433BBF49A
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

--------------2B83BFF24BE5051433BBF49A--

--Wz5p7El1rcjvRvf7l75EYY94uAItMXZLp--

--IlpedywfmCkLoMf1IHADgzPswdTIkqihH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEmPUYFAwAAAAAACgkQsN6d1ii/Ey9t
OQf8CSw+aY2dkHlnkjprUicXqHnR/kB8MdwEH33TrPHCTYPDaEU3h38greki4YQgWJ4SUXP7hcBD
jpOI57EbsiKNU/KepJ4wclJWRbAxED39hw6Uwu0wBCvwphmxI57ssad2qE1WAWjZnv0xMFUTtM1N
YkY/BGxr/acSSvYx+vi8Me0YbctUCwXivW1+NdUEdPNqMzUZdW5Ij+uUNqjCYi5gz/wVLxts9P5M
jcmMQk3PdlNg6uJEFd7CDe95kNbhGCU2zFjFj1dmtmpUNsRoTBiw+4mnIgrsC9xY94TU+0nbGhsG
ONt/e0F6dVSPd83cEGz6PKxVTLLDusGUvRSXWod5qA==
=gFIh
-----END PGP SIGNATURE-----

--IlpedywfmCkLoMf1IHADgzPswdTIkqihH--

