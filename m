Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F0C3B2A8D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 10:41:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146508.269572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwKvS-0006TH-No; Thu, 24 Jun 2021 08:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146508.269572; Thu, 24 Jun 2021 08:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwKvS-0006RS-KQ; Thu, 24 Jun 2021 08:41:30 +0000
Received: by outflank-mailman (input) for mailman id 146508;
 Thu, 24 Jun 2021 08:41:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3ax9=LS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lwKvR-0006RM-H8
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 08:41:29 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4434ccea-cb67-4e10-b7fb-a6e6adc43bd5;
 Thu, 24 Jun 2021 08:41:28 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9A07D1FD67;
 Thu, 24 Jun 2021 08:41:27 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 5A10111A97;
 Thu, 24 Jun 2021 08:41:27 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id oaKoFDdF1GBzKAAALh3uQQ
 (envelope-from <jgross@suse.com>); Thu, 24 Jun 2021 08:41:27 +0000
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
X-Inumbo-ID: 4434ccea-cb67-4e10-b7fb-a6e6adc43bd5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624524087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o2r/Dkb0dtVG4Ww86TtCZ1q0toL9021hGsxDUIoa0F0=;
	b=W8sE2X9PsQ3GjXw2LeZpa9aby3+SN8md+185/OCsWfnM1Twd4/SqdtPCLjuLTTP0G6E9Ey
	Ua+JOsrhoYdOLAPQ+OMPgBLn7VSWYU5PuCxcWTLZKY4ao+Ozl0YxPUwHtu0938jTysCEX/
	cEVwjAniOTZOynDt0qmMip1efaiyTS4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624524087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o2r/Dkb0dtVG4Ww86TtCZ1q0toL9021hGsxDUIoa0F0=;
	b=W8sE2X9PsQ3GjXw2LeZpa9aby3+SN8md+185/OCsWfnM1Twd4/SqdtPCLjuLTTP0G6E9Ey
	Ua+JOsrhoYdOLAPQ+OMPgBLn7VSWYU5PuCxcWTLZKY4ao+Ozl0YxPUwHtu0938jTysCEX/
	cEVwjAniOTZOynDt0qmMip1efaiyTS4=
Subject: Re: [PATCH 09/10] tools/xenstored: Dump delayed requests
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-10-julien@xen.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <5b6455f3-9b44-2cf3-e53d-1f235977a4e2@suse.com>
Date: Thu, 24 Jun 2021 10:41:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210616144324.31652-10-julien@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="F24buKIkETeVGiiMO6rPAYyMt4X1w0V81"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--F24buKIkETeVGiiMO6rPAYyMt4X1w0V81
Content-Type: multipart/mixed; boundary="akyuPgvLq5nNMJgZ5UnIGeFQmlt3Nyu13";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <5b6455f3-9b44-2cf3-e53d-1f235977a4e2@suse.com>
Subject: Re: [PATCH 09/10] tools/xenstored: Dump delayed requests
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-10-julien@xen.org>
In-Reply-To: <20210616144324.31652-10-julien@xen.org>

--akyuPgvLq5nNMJgZ5UnIGeFQmlt3Nyu13
Content-Type: multipart/mixed;
 boundary="------------DC70DE1E851EE4D8B4E1BD9C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------DC70DE1E851EE4D8B4E1BD9C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 16.06.21 16:43, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>=20
> Currently, only Live-Update request can be delayed. In a follow-up,
> we will want to delay more requests (e.g. transaction start).
> Therefore we want to preserve delayed requests across Live-Update.
>=20
> Delayed requests are just complete "in" buffer. So the code is
> refactored to allow sharing the code to dump "in" buffer.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>   tools/xenstore/xenstored_core.c | 42 +++++++++++++++++++++++++-------=
-
>   1 file changed, 32 insertions(+), 10 deletions(-)
>=20
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored=
_core.c
> index 5b7ab7f74013..9eca58682b51 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -2403,25 +2403,47 @@ const char *dump_state_global(FILE *fp)
>   	return NULL;
>   }
>  =20
> +static const char *dump_input_buffered_data(FILE *fp,
> +					    const struct buffered_data *in,
> +					    unsigned int *total_len)
> +{
> +	unsigned int hlen =3D in->inhdr ? in->used : sizeof(in->hdr);
> +
> +	*total_len +=3D hlen;
> +	if (fp && fwrite(&in->hdr, hlen, 1, fp) !=3D 1)
> +		return "Dump read data error";
> +	if (!in->inhdr && in->used) {
> +		*total_len +=3D in->used;
> +		if (fp && fwrite(in->buffer, in->used, 1, fp) !=3D 1)
> +			return "Dump read data error";
> +	}
> +
> +	return NULL;
> +}
> +
>   /* Called twice: first with fp =3D=3D NULL to get length, then for wr=
iting data. */
>   const char *dump_state_buffered_data(FILE *fp, const struct connectio=
n *c,
>   				     struct xs_state_connection *sc)
>   {
>   	unsigned int len =3D 0, used;
> -	struct buffered_data *out, *in =3D c->in;
> +	struct buffered_data *out;
>   	bool partial =3D true;
> +	struct delayed_request *req;
> +	const char *ret;
>  =20
> -	if (in) {
> -		len =3D in->inhdr ? in->used : sizeof(in->hdr);
> -		if (fp && fwrite(&in->hdr, len, 1, fp) !=3D 1)
> -			return "Dump read data error";
> -		if (!in->inhdr && in->used) {
> -			len +=3D in->used;
> -			if (fp && fwrite(in->buffer, in->used, 1, fp) !=3D 1)
> -				return "Dump read data error";
> -		}
> +	/* Dump any command that was delayed */
> +	list_for_each_entry(req, &c->delayed, list) {

Please add a comment here that the following if() serves especially to
avoid dumping the data for do_lu_start().

> +		if (req->func !=3D process_delayed_message)
> +			continue;
> +
> +		assert(!req->in->inhdr);
> +		if ((ret =3D dump_input_buffered_data(fp, req->in, &len)))
> +			return ret;
>   	}
>  =20
> +	if (c->in && (ret =3D dump_input_buffered_data(fp, c->in, &len)))
> +		return ret;
> +
>   	if (sc) {
>   		sc->data_in_len =3D len;
>   		sc->data_resp_len =3D 0;
>=20

Juergen

--------------DC70DE1E851EE4D8B4E1BD9C
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

--------------DC70DE1E851EE4D8B4E1BD9C--

--akyuPgvLq5nNMJgZ5UnIGeFQmlt3Nyu13--

--F24buKIkETeVGiiMO6rPAYyMt4X1w0V81
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDURTYFAwAAAAAACgkQsN6d1ii/Ey8Y
wgf/dzRBwdCjDSnPU9hX9XxWNZwzshiTo2ZYCoUqsJIYFeNTEx70W/ZIYmZgS9SFWJIcHi78WcqC
RizfUinXrh+uPrOUm2Jk6qChvotSi/RGRQCeDwkh8/fgNv6wKziMlQptvJhQDk1BFNAKt4TAze6z
O7rvyZRa++UcyN+bJ2lYrVcwqvXTh7WTv2qG5wnoROn7AIF3s5Yt/j/V0KzpToaRpIWzKPSCD8Jv
vVs5skuY00KgQdodyDx5w2OfUYDTFLCjN2M/ZuCcMDIopxaBR8p4Y9fkbBERUr9M/kxkdlGNqZgM
7Qy5J0iGGHsf36xnVVM7DDge2OFf/J3oInW1ScTX7w==
=VZsT
-----END PGP SIGNATURE-----

--F24buKIkETeVGiiMO6rPAYyMt4X1w0V81--

