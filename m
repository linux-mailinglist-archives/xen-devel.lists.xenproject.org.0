Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5183B2A62
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 10:31:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146501.269560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwKkc-0004yI-Ji; Thu, 24 Jun 2021 08:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146501.269560; Thu, 24 Jun 2021 08:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwKkc-0004w5-GY; Thu, 24 Jun 2021 08:30:18 +0000
Received: by outflank-mailman (input) for mailman id 146501;
 Thu, 24 Jun 2021 08:30:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3ax9=LS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lwKkb-0004vz-9F
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 08:30:17 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 915b0a1b-cb7c-4b9d-90d0-5d2b542b89a5;
 Thu, 24 Jun 2021 08:30:16 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B3F0B1FD67;
 Thu, 24 Jun 2021 08:30:15 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 7F36D11A97;
 Thu, 24 Jun 2021 08:30:15 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id IFrsHZdC1GBBIgAALh3uQQ
 (envelope-from <jgross@suse.com>); Thu, 24 Jun 2021 08:30:15 +0000
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
X-Inumbo-ID: 915b0a1b-cb7c-4b9d-90d0-5d2b542b89a5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624523415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mK3FUXG2k5/h1Ahqklaxt7B6min4oXXkJXXL4DaF10g=;
	b=u3gbljfv4eIhcBpXB5k7yK55P0cm0staXFWCHluX16e/QV8MidS3FI+gdIJZzDk63HZonI
	nzjdr4yO5lhk4AWxjofHwuCBXjc0TPQCw9UZqZLYiTAwd44YzyaYvAi87MS97uBfb8T5t8
	LLTxtjTyE33wTV4Az8VyliJftQISG28=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624523415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mK3FUXG2k5/h1Ahqklaxt7B6min4oXXkJXXL4DaF10g=;
	b=u3gbljfv4eIhcBpXB5k7yK55P0cm0staXFWCHluX16e/QV8MidS3FI+gdIJZzDk63HZonI
	nzjdr4yO5lhk4AWxjofHwuCBXjc0TPQCw9UZqZLYiTAwd44YzyaYvAi87MS97uBfb8T5t8
	LLTxtjTyE33wTV4Az8VyliJftQISG28=
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-9-julien@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 08/10] tools/xenstored: Extend restore code to handle
 multiple input buffer
Message-ID: <444688a1-180f-7cf3-3461-0001030471d4@suse.com>
Date: Thu, 24 Jun 2021 10:30:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210616144324.31652-9-julien@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="g1GiBB6Hcv0S5hn0ktPZTtaOMSCx4n5CS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--g1GiBB6Hcv0S5hn0ktPZTtaOMSCx4n5CS
Content-Type: multipart/mixed; boundary="K1xUIfxrSeaTfzDNUDS9TfUbD14ptiP5m";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <444688a1-180f-7cf3-3461-0001030471d4@suse.com>
Subject: Re: [PATCH 08/10] tools/xenstored: Extend restore code to handle
 multiple input buffer
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-9-julien@xen.org>
In-Reply-To: <20210616144324.31652-9-julien@xen.org>

--K1xUIfxrSeaTfzDNUDS9TfUbD14ptiP5m
Content-Type: multipart/mixed;
 boundary="------------70D5279AF8A9D003712F5512"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------70D5279AF8A9D003712F5512
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 16.06.21 16:43, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>=20
> Currently, the restore code is considering the stream will contain at
> most one in-flight request per connection. In a follow-up changes, we
> will want to transfer multiple in-flight requests.
>=20
> The function read_state_buffered() is now extended to restore multiple
> in-flight request. Complete requests will be queued as delayed
> requests, if there a partial request (only the last one can) then it
> will used as the current in-flight request.
>=20
> Note that we want to bypass the quota check for delayed requests as
> the new Xenstore may have a lower limit.
>=20
> Lastly, there is no need to change the specification as there was
> no restriction on the number of in-flight requests preserved.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>   tools/xenstore/xenstored_core.c | 56 ++++++++++++++++++++++++++++----=
-
>   1 file changed, 48 insertions(+), 8 deletions(-)
>=20
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored=
_core.c
> index a5084a5b173d..5b7ab7f74013 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -1486,6 +1486,10 @@ static void process_message(struct connection *c=
onn, struct buffered_data *in)
>   	enum xsd_sockmsg_type type =3D in->hdr.msg.type;
>   	int ret;
>  =20
> +	/* At least send_error() and send_reply() expects conn->in =3D=3D in =
*/
> +	assert(conn->in =3D=3D in);
> +	trace_io(conn, in, 0);
> +
>   	if ((unsigned int)type >=3D XS_TYPE_COUNT || !wire_funcs[type].func)=20
{
>   		eprintf("Client unknown operation %i", type);
>   		send_error(conn, ENOSYS);
> @@ -1515,6 +1519,23 @@ static void process_message(struct connection *c=
onn, struct buffered_data *in)
>   	conn->transaction =3D NULL;
>   }
>  =20
> +static bool process_delayed_message(struct delayed_request *req)
> +{
> +	struct connection *conn =3D req->data;
> +	struct buffered_data *saved_in =3D conn->in;
> +
> +	/*
> +	 * Part of process_message() expects conn->in to contains the
> +	 * processed response. So save the current conn->in and restore it
> +	 * afterwards.
> +	 */
> +	conn->in =3D req->in;
> +	process_message(req->data, req->in);
> +	conn->in =3D saved_in;

This pattern was added to do_lu_start() already, and it will be needed
for each other function being called via call_delayed().

Maybe it would be better to add conn explicitly to struct
delayed_request (or even better: replace data with conn) and to do the
conn->in saving/setting/restoring in call_delayed() instead?

Other than that:

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

--------------70D5279AF8A9D003712F5512
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

--------------70D5279AF8A9D003712F5512--

--K1xUIfxrSeaTfzDNUDS9TfUbD14ptiP5m--

--g1GiBB6Hcv0S5hn0ktPZTtaOMSCx4n5CS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDUQpcFAwAAAAAACgkQsN6d1ii/Ey8k
rAf/dDC1Nmvh05Js1FmnBx8azJm9k8sYtgiS1sGUlJUxHWctiu4s253UIfKYkfYpQ2rdDgaxFDhJ
2vRRU5UCeVxSgb4n1bDcSEKoASqXWo2GbweBUdVU1d++ZDzJxf8IFDJuf7R2g9ICSN2Sa8bmK7iL
yWDM+YLfsUApOors0xfws5rQn79OVA6Vd68I1une0VDTXvyQq2pmWctTeuPRRE15ideHRVJ4yY9h
r6D0NLYzKRFezT8Akf5NnUXHBRAcI96BwqP8kKx/v/nI28LZCY9PqCXjdxvz34r9z7myEqJlDsED
sB/Xby6fj4eHwnhfWLHoe5hKNjSRUovaKWCfb5yA/g==
=Qly2
-----END PGP SIGNATURE-----

--g1GiBB6Hcv0S5hn0ktPZTtaOMSCx4n5CS--

