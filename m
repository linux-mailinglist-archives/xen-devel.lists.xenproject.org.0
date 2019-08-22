Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2219A26F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 23:59:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0v3w-0004o0-75; Thu, 22 Aug 2019 21:56:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qpMN=WS=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1i0v3t-0004ni-9n
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 21:56:05 +0000
X-Inumbo-ID: a2338609-c527-11e9-addd-12813bfff9fa
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2338609-c527-11e9-addd-12813bfff9fa;
 Thu, 22 Aug 2019 21:56:03 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id C43E749C;
 Thu, 22 Aug 2019 17:56:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 22 Aug 2019 17:56:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=f8hbgg
 RikneF50gxf4+J64heZsRyHLDWbRyv0Nr0x28=; b=tV15cWe8U8gpomI1UAlLd/
 0aHaLuHkyJoMQlObQ8cIrXkonZ42mLuaVeYAQRpE8FjE9Te5ueg0MRsTKnnQY1Qu
 qFEBK8AYTr/eT07RwUK8OCeYyUzxY8iF0vcc9bfVBGCebPaHggSAdWuf3O9yxdLX
 GfJuT7dtKD2gxTV2w1DSZrFCVk6rm8ymnnLKCCB+gqYzWFQBJGocsRxLnJbM/ZUl
 8J9ztUX9s/oOrsyD7IxFxNK/8934YH/0Qk7kKB0nwl1ooPuf8M9h1RhwVyDX4Nt8
 1LaK7viuzWh4018MWTzl98haJfvIQD7AgoYftz/4AKm2yZoJ3gR/r7g28Vr0MrsQ
 ==
X-ME-Sender: <xms:cA9fXVEgivaNnbVEfCWvs1NCiIqlww17Dw3hH-BArOgk1S8WYPNkyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudegjedgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepjeejrddvgeefrddukeef
 rddvtdefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
 hisghlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:cA9fXeB7SrhkG2U39FMRUWmnqCCWtLJIiXQjgsDpmQPOApMmlElB7w>
 <xmx:cA9fXfxL-ZxLwqPzjDLPiQV4UHU2uogEorR8aRC588vaIt7xWw8-gg>
 <xmx:cA9fXccJOpUMFWcEv14w0r6uhMkzYPL5GMeFJrJo7esLBsHTagMd9g>
 <xmx:cQ9fXRZrxgraWA6wuSOdhsAdXfFoMKeMp_YhrFsg4tcu4mhm0a35ug>
Received: from mail-itl (unknown [77.243.183.203])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9ED5A80060;
 Thu, 22 Aug 2019 17:55:52 -0400 (EDT)
Date: Thu, 22 Aug 2019 23:55:42 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Pawel Wieczorkiewicz <wipawel@amazon.de>
Message-ID: <20190822215542.GN1457@mail-itl>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190821081931.90887-15-wipawel@amazon.de>
MIME-Version: 1.0
In-Reply-To: <20190821081931.90887-15-wipawel@amazon.de>
Subject: Re: [Xen-devel] [PATCH 14/14] livepatch: Add python bindings for
 livepatch operations
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: wipawel@amazon.com, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 xen-devel@lists.xen.org, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============0078297170006875131=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0078297170006875131==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TnYVF1hk1c8rpHiF"
Content-Disposition: inline


--TnYVF1hk1c8rpHiF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 14/14] livepatch: Add python bindings for livepatch
 operations

On Wed, Aug 21, 2019 at 08:19:31AM +0000, Pawel Wieczorkiewicz wrote:
> Extend the XC python bindings library to support also all common
> livepatch operations and actions.
>=20
> Add the python bindings for the following operations:
> - status (pyxc_livepatch_status):
>   Requires a payload name as an input.
>   Returns a status dict containing a state string and a return code
>   integer.
> - action (pyxc_livepatch_action):
>   Requires a payload name and an action id as an input. Timeout and
>   flags are optional parameters.
>   Returns a return code integer.
> - upload (pyxc_livepatch_upload):
>   Requires a payload name and a module's filename as an input.
>   Returns a return code integer.
> - list (pyxc_livepatch_list):
>   Takes no parameters.
>   Returns a list of dicts containing each payload's:
>   * name as a string
>   * state as a string
>   * return code as an integer
>   * list of metadata key=3Dvalue strings
>=20
> Each functions throws an exception error based on the errno value
> received from its corresponding libxc function call.
>=20
> Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
> Reviewed-by: Martin Mazein <amazein@amazon.de>
> Reviewed-by: Andra-Irina Paraschiv <andraprs@amazon.com>
> Reviewed-by: Leonard Foerster <foersleo@amazon.de>
> Reviewed-by: Norbert Manthey <nmanthey@amazon.de>
> ---
>  tools/python/xen/lowlevel/xc/xc.c | 273 ++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 273 insertions(+)
>=20
> diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowleve=
l/xc/xc.c
> index 7f0358ba9c..368739b996 100644
> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c

(...)
> +static PyObject *pyxc_livepatch_list(XcObject *self)
> +{
> +    PyObject *list;
> +    unsigned int nr, done, left, i;
> +    xen_livepatch_status_t *info =3D NULL;
> +    char *name =3D NULL;
> +    char *metadata =3D NULL;
> +    uint32_t *len =3D NULL;
> +    uint32_t *metadata_len =3D NULL;
> +    uint64_t name_total_size, metadata_total_size;
> +    off_t name_off, metadata_off;
> +    int rc;
> +
> +    rc =3D xc_livepatch_list_get_sizes(self->xc_handle, &nr,
> +                                     &name_total_size, &metadata_total_s=
ize);
> +    if ( rc )
> +        goto error;
> +
> +    if ( nr =3D=3D 0 )
> +        return PyList_New(0);
> +
> +    rc =3D ENOMEM;
> +    info =3D malloc(nr * sizeof(*info));
> +    if ( !info )
> +        goto error;
> +
> +    name =3D malloc(name_total_size * sizeof(*name));
> +    if ( !name )
> +        goto error;
> +
> +    len =3D malloc(nr * sizeof(*len));
> +    if ( !len )
> +        goto error;
> +
> +    metadata =3D malloc(metadata_total_size * sizeof(*metadata));
> +    if ( !metadata )
> +        goto error;
> +
> +    metadata_len =3D malloc(nr * sizeof(*metadata_len));
> +    if ( !metadata_len )
> +        goto error;
> +
> +    rc =3D xc_livepatch_list(self->xc_handle, nr, 0, info,
> +                           name, len, name_total_size,
> +                           metadata, metadata_len, metadata_total_size,
> +                           &done, &left);
> +    if ( rc )
> +        goto error;
> +
> +    list =3D PyList_New(0);

Previous remark stays:
Better use PyList_New(done) and later PyList_SetItem() instead of PyList_Ap=
pend().

> +    name_off =3D metadata_off =3D 0;
> +    for ( i =3D 0; i < done; i++ )
> +    {
> +        PyObject *info_dict, *metadata_list;
> +        char *name_str, *metadata_str;
> +
> +        name_str =3D name + name_off;
> +        metadata_str =3D metadata + metadata_off;
> +
> +        metadata_list =3D PyList_New(0);
> +        for ( char *s =3D metadata_str; s < metadata_str + metadata_len[=
i]; s +=3D strlen(s) + 1 )
> +        {
> +            PyObject *field =3D Py_BuildValue("s", s);
> +            if ( field =3D=3D NULL )
> +            {
> +                Py_DECREF(list);
> +                Py_DECREF(metadata_list);
> +                rc =3D EFAULT;
> +                goto error;
> +            }
> +
> +            PyList_Append(metadata_list, field);
> +            Py_DECREF(field);
> +        }
> +
> +        info_dict =3D Py_BuildValue(
> +            "{s:s,s:i,s:i,s:N}",
> +            "name",     name_str,
> +            "state",    info[i].state,
> +            "rc",       info[i].rc,
> +            "metadata", metadata_list);
> +
> +        if ( info_dict =3D=3D NULL )
> +        {
> +            Py_DECREF(list);
> +            Py_DECREF(metadata_list);
> +            rc =3D EFAULT;
> +            goto error;
> +        }
> +        PyList_Append(list, info_dict);
> +        Py_DECREF(info_dict);
> +
> +        name_off +=3D len[i];
> +        metadata_off +=3D metadata_len[i];
> +    }
> +
> +error:
> +    free(info);
> +    free(name);
> +    free(len);
> +    free(metadata);
> +    free(metadata_len);
> +    return rc ? pyxc_error_to_exception(self->xc_handle) : list;
> +}
> +
>  static PyMethodDef pyxc_methods[] =3D {
>      { "domain_create",=20
>        (PyCFunction)pyxc_domain_create,=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--TnYVF1hk1c8rpHiF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1fD1wACgkQ24/THMrX
1ywKmgf+JTmIFMTFRNornfVLeUgtbMcHMdrN5+HL5bOTHYz74HRhcCIQ2mgkBX7g
nZ3Y3JKk9MUd3tQ7KTdtzI8Er9X1Urde7tUVQBs7UX/Wjxb1ChRChhCncD75j0FH
cJWcCv/mxb8y2fx7uEUeO8FfHtbK6KDP/HtxsDW2MuDvpT8xpUK1a75fVq4jcS24
/BQnuT6HRILTprASCR3PQS7d9lfOd0YmegJV8EFiOR1KKvok908USQdUJSNjVEq4
2qAuZIOdI7U2lqXL0tac/4iVFPxtCZRH/9tYlEhZzHQiZRj9YxdSmb1sufzhu4sr
rKhn/8tuouCODPsx4jRXcVW55oRu/Q==
=ZNI/
-----END PGP SIGNATURE-----

--TnYVF1hk1c8rpHiF--


--===============0078297170006875131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0078297170006875131==--

