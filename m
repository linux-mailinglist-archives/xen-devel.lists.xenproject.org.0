Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E2948D25A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 07:38:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256994.441357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7tjI-0000Pm-GR; Thu, 13 Jan 2022 06:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256994.441357; Thu, 13 Jan 2022 06:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7tjI-0000N8-DK; Thu, 13 Jan 2022 06:37:00 +0000
Received: by outflank-mailman (input) for mailman id 256994;
 Thu, 13 Jan 2022 06:36:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EULp=R5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7tjG-0000LK-EG
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 06:36:58 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 336f58f1-743b-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 07:36:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6BA0D1F3A3;
 Thu, 13 Jan 2022 06:36:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3B5BB13E27;
 Thu, 13 Jan 2022 06:36:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DgffC4fI32FfHAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 13 Jan 2022 06:36:55 +0000
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
X-Inumbo-ID: 336f58f1-743b-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642055815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZxsjFganuacB9OeNlazBrLYYfXGlAUe54bM8Y1M7NtM=;
	b=G5rFHox0kZaSJb5vMxj7Yv1Un9vXs9O8RicG4Soga3Zr75mZQgQ0nfBaG3AxR0dPiM8VjR
	VO+5cyf62+EXVgsZs7uvQzl38MiJ/hjm7+9aelwA9Pvm6LA4tBZLn7t/aXPsA0ksqkdHC2
	QCsC1YjVU0XaAiLzbKYQ+J8yhQWdRLU=
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.22.394.2201121647460.19362@ubuntu-linux-20-04-desktop>
 <20220113010002.1180463-1-sstabellini@kernel.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [LINUX PATCH v2 1/1] xen: add support for initializing xenstore
 later as HVM domain
Message-ID: <aa934840-0862-7246-4318-a049aedcf0c3@suse.com>
Date: Thu, 13 Jan 2022 07:36:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20220113010002.1180463-1-sstabellini@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="mZ5S6lf5dOeuvtHwfUzBgRIk2UoSAwzun"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mZ5S6lf5dOeuvtHwfUzBgRIk2UoSAwzun
Content-Type: multipart/mixed; boundary="EF9bm6cHUifxv6ksxNt69boz3qPlE7rJV";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Message-ID: <aa934840-0862-7246-4318-a049aedcf0c3@suse.com>
Subject: Re: [LINUX PATCH v2 1/1] xen: add support for initializing xenstore
 later as HVM domain
References: <alpine.DEB.2.22.394.2201121647460.19362@ubuntu-linux-20-04-desktop>
 <20220113010002.1180463-1-sstabellini@kernel.org>
In-Reply-To: <20220113010002.1180463-1-sstabellini@kernel.org>

--EF9bm6cHUifxv6ksxNt69boz3qPlE7rJV
Content-Type: multipart/mixed;
 boundary="------------B8B6A75117437674C9A54D78"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------B8B6A75117437674C9A54D78
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 13.01.22 02:00, Stefano Stabellini wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
>=20
> When running as dom0less guest (HVM domain on ARM) the xenstore event
> channel is available at domain creation but the shared xenstore
> interface page only becomes available later on.
>=20
> In that case, wait for a notification on the xenstore event channel,
> then complete the xenstore initialization later, when the shared page
> is actually available.
>=20
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
> Changes in v2:
> - remove XENFEAT_xenstore_late_init
> ---
>   drivers/xen/xenbus/xenbus_probe.c | 80 +++++++++++++++++++++++-------=
-
>   1 file changed, 61 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xen=
bus_probe.c
> index fe360c33ce71..51e52e175892 100644
> --- a/drivers/xen/xenbus/xenbus_probe.c
> +++ b/drivers/xen/xenbus/xenbus_probe.c
> @@ -65,6 +65,7 @@
>   #include "xenbus.h"
>  =20
>  =20
> +static int xs_init_irq;
>   int xen_store_evtchn;
>   EXPORT_SYMBOL_GPL(xen_store_evtchn);
>  =20
> @@ -750,6 +751,17 @@ static void xenbus_probe(void)
>   {
>   	xenstored_ready =3D 1;
>  =20
> +	if (!xen_store_interface) {
> +		xen_store_interface =3D xen_remap(xen_store_gfn << XEN_PAGE_SHIFT,
> +						XEN_PAGE_SIZE);
> +		/*
> +		 * Now it is safe to free the IRQ used for xenstore late
> +		 * initialization. No need to unbind: it is about to be
> +		 * bound again.
> +		 */
> +		free_irq(xs_init_irq, &xb_waitq);
> +	}
> +
>   	/*
>   	 * In the HVM case, xenbus_init() deferred its call to
>   	 * xs_init() in case callbacks were not operational yet.
> @@ -798,20 +810,22 @@ static int __init xenbus_probe_initcall(void)
>   {
>   	/*
>   	 * Probe XenBus here in the XS_PV case, and also XS_HVM unless we
> -	 * need to wait for the platform PCI device to come up.
> +	 * need to wait for the platform PCI device to come up or
> +	 * xen_store_interface is not ready.
>   	 */
>   	if (xen_store_domain_type =3D=3D XS_PV ||
>   	    (xen_store_domain_type =3D=3D XS_HVM &&
> -	     !xs_hvm_defer_init_for_callback()))
> +	     !xs_hvm_defer_init_for_callback() &&
> +	     xen_store_interface !=3D NULL))
>   		xenbus_probe();
>  =20
>   	/*
> -	 * For XS_LOCAL, spawn a thread which will wait for xenstored
> -	 * or a xenstore-stubdom to be started, then probe. It will be
> -	 * triggered when communication starts happening, by waiting
> -	 * on xb_waitq.
> +	 * For XS_LOCAL or when xen_store_interface is not ready, spawn a
> +	 * thread which will wait for xenstored or a xenstore-stubdom to be
> +	 * started, then probe.  It will be triggered when communication
> +	 * starts happening, by waiting on xb_waitq.
>   	 */
> -	if (xen_store_domain_type =3D=3D XS_LOCAL) {
> +	if (xen_store_domain_type =3D=3D XS_LOCAL || xen_store_interface =3D=3D=
 NULL) {
>   		struct task_struct *probe_task;
>  =20
>   		probe_task =3D kthread_run(xenbus_probe_thread, NULL,
> @@ -907,6 +921,20 @@ static struct notifier_block xenbus_resume_nb =3D =
{
>   	.notifier_call =3D xenbus_resume_cb,
>   };
>  =20
> +static irqreturn_t xenbus_late_init(int irq, void *unused)
> +{
> +	int err =3D 0;
> +	uint64_t v =3D 0;
> +
> +	err =3D hvm_get_parameter(HVM_PARAM_STORE_PFN, &v);
> +	if (err || !v || !~v)
> +		return IRQ_HANDLED;
> +	xen_store_gfn =3D (unsigned long)v;
> +
> +	wake_up(&xb_waitq);
> +	return IRQ_HANDLED;
> +}
> +

Hmm, wouldn't it be easier to use a static key in the already existing
irq handler instead of switching the handler?


Juergen

--------------B8B6A75117437674C9A54D78
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

--------------B8B6A75117437674C9A54D78--

--EF9bm6cHUifxv6ksxNt69boz3qPlE7rJV--

--mZ5S6lf5dOeuvtHwfUzBgRIk2UoSAwzun
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHfyIYFAwAAAAAACgkQsN6d1ii/Ey+W
fwf+OHLK8sNZ5oVIZpL9Rt/dBLNqUX714/bOqyWtwySdRY3d+fuQjOYaufGtmgiFYWiuACAxr3Nc
JGPuS6otx4zqUatSeYD4OIK3P+9i5hC32UhrKrLBSIWen8lWdVpcNDpNxKB7WqQXBN1QEiqxIKRG
EK1LGYPA/pfB0pLXxtItCgJnoetyU2XfYACnnn+J3vChz4wZfAdDMZXjkh8fgSFCHklS02DO5tgv
pgFfCdfPWOP+uzkQt3YwVuzLtG4WSET8eHb0XMFgic+RFDNBCGHdPewjUh32002utoxrxAQTdIRJ
VpsnqwcrBnnwG/IqjAun5lhJ9c24E3dlTB+vgbfgtQ==
=Tbru
-----END PGP SIGNATURE-----

--mZ5S6lf5dOeuvtHwfUzBgRIk2UoSAwzun--

