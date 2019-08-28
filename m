Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 667D1A031A
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 15:24:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2xtQ-0001ub-Rj; Wed, 28 Aug 2019 13:21:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bgln=WY=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1i2xtP-0001uM-Hj
 for xen-devel@lists.xen.org; Wed, 28 Aug 2019 13:21:43 +0000
X-Inumbo-ID: c5d75cbb-c996-11e9-ae47-12813bfff9fa
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5d75cbb-c996-11e9-ae47-12813bfff9fa;
 Wed, 28 Aug 2019 13:21:41 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 2ECF549F;
 Wed, 28 Aug 2019 09:21:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 28 Aug 2019 09:21:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xvf2sO
 4Rc3Qaxktx9O3SwMdr2Mp7aRnNLEOcZunM5Lg=; b=enI5GoeweeIpJ39fjlHPTK
 yZmnzj7c8T1HrL1irhiZB3r+xheUrA/5AcKoVrNudIYkECNShzNHLdBuBUQhrlZe
 mY2GxIFXI1QggQgRbvjuf00wQ4HGvl5UpWivbUsVDaMNeC+/YZIblEoRgmWVth0a
 VTaaZJfxfl0WQB59pwvptmAHl3jBLWp56Ms7h2FSGJANM582r+tDKIWz4jrdFP4O
 xuhCEu4SzyeIIE+H3JJuPB1vz7rsK1EsrB0nDzt80/auKm4EGBAPmJ/MjqntPR/9
 dFVk90e7FJijyYkZCXDnXjpN9OvEUJiBpgMwyY08bghAvVXnC9G66I9zM/Txt9CQ
 ==
X-ME-Sender: <xms:439mXS3gjKWPU4Vtdoyz6-4pC3Y9K5neXolzVKHToxn6Vj9uoemwPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeitddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:439mXfjueIeFGxbzEMrqACU2NcdCZ1H2h3kYLsCkjbw2thBSfvDDfw>
 <xmx:439mXSYOOwR61vGv7Hz_qAHb3VEyUEVXhmlNkEqgJxr20ud7AcIzcg>
 <xmx:439mXbVL01dZ5SLTD0WYKik4G4Djj1VeWjwsg4VCCSN3zJGLUNNJkw>
 <xmx:439mXUyUdwtjEqZMjJvk_DCRbfTrCAFxrfeHVIUcO_3VK3ULpYNtnw>
Received: from mail-itl (unknown [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 70A13D60057;
 Wed, 28 Aug 2019 09:21:38 -0400 (EDT)
Date: Wed, 28 Aug 2019 15:21:35 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Pawel Wieczorkiewicz <wipawel@amazon.de>
Message-ID: <20190828132135.GB7015@mail-itl>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190827084624.116917-1-wipawel@amazon.de>
 <20190827084624.116917-13-wipawel@amazon.de>
MIME-Version: 1.0
In-Reply-To: <20190827084624.116917-13-wipawel@amazon.de>
Subject: Re: [Xen-devel] [PATCH v2 12/12] livepatch: Add python bindings for
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
Content-Type: multipart/mixed; boundary="===============2932151397739471502=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2932151397739471502==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
Content-Disposition: inline


--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 12/12] livepatch: Add python bindings for livepatch
 operations

On Tue, Aug 27, 2019 at 08:46:24AM +0000, Pawel Wieczorkiewicz wrote:
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

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> Changed since v1:
>   * changed PyList_Append() with PyList_SetItem() as requested by
>     Marek
>=20
>  tools/python/xen/lowlevel/xc/xc.c | 273 ++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 273 insertions(+)
>=20
> diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowleve=
l/xc/xc.c
> index 7f0358ba9c..d64b9372b6 100644
> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c
> @@ -2011,6 +2011,230 @@ static PyObject *pyflask_access(PyObject *self, P=
yObject *args,
>      return Py_BuildValue("i",ret);
>  }
> =20
> +static PyObject *pyxc_livepatch_status(XcObject *self,
> +                                       PyObject *args,
> +                                       PyObject *kwds)
> +{
> +    xen_livepatch_status_t status;
> +    PyObject *info_dict =3D NULL;
> +    char *name;
> +    int rc;
> +
> +    static char *kwd_list[] =3D { "name", NULL };
> +
> +    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "s", kwd_list, &name) )
> +        goto error;
> +
> +    rc =3D xc_livepatch_get(self->xc_handle, name, &status);
> +    if ( rc )
> +        goto error;
> +
> +    info_dict =3D Py_BuildValue(
> +            "{s:i,s:i}",
> +            "state",    status.state,
> +            "rc",       status.rc);
> +
> +error:
> +    return info_dict ?: pyxc_error_to_exception(self->xc_handle);
> +}
> +
> +static PyObject *pyxc_livepatch_action(XcObject *self,
> +                                       PyObject *args,
> +                                       PyObject *kwds)
> +{
> +    int (*action_func)(xc_interface *xch, char *name, uint32_t timeout, =
uint64_t flags);
> +    char *name;
> +    unsigned int action;
> +    uint32_t timeout;
> +    uint64_t flags;
> +    int rc;
> +
> +    static char *kwd_list[] =3D { "name", "action", "timeout", "flags", =
NULL };
> +
> +    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "sI|Ik", kwd_list,
> +                                      &name, &action, &timeout, &flags) )
> +        goto error;
> +
> +    switch (action)
> +    {
> +    case LIVEPATCH_ACTION_UNLOAD:
> +        action_func =3D xc_livepatch_unload;
> +        break;
> +    case LIVEPATCH_ACTION_REVERT:
> +        action_func =3D xc_livepatch_revert;
> +        break;
> +    case LIVEPATCH_ACTION_APPLY:
> +        action_func =3D xc_livepatch_apply;
> +        break;
> +    case LIVEPATCH_ACTION_REPLACE:
> +        action_func =3D xc_livepatch_replace;
> +        break;
> +    default:
> +        goto error;
> +    }
> +
> +    rc =3D action_func(self->xc_handle, name, timeout, flags);
> +    if ( rc )
> +        goto error;
> +
> +    return Py_BuildValue("i", rc);
> +error:
> +    return pyxc_error_to_exception(self->xc_handle);
> +}
> +
> +static PyObject *pyxc_livepatch_upload(XcObject *self,
> +                                       PyObject *args,
> +                                       PyObject *kwds)
> +{
> +    unsigned char *fbuf =3D MAP_FAILED;
> +    char *name, *filename;
> +    struct stat buf;
> +    int fd =3D 0, rc;
> +    ssize_t len;
> +
> +    static char *kwd_list[] =3D { "name", "filename", NULL };
> +
> +    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "ss", kwd_list,
> +                                      &name, &filename))
> +        goto error;
> +
> +    fd =3D open(filename, O_RDONLY);
> +    if ( fd < 0 )
> +        goto error;
> +
> +    if ( stat(filename, &buf) !=3D 0 )
> +        goto error;
> +
> +    len =3D buf.st_size;
> +    fbuf =3D mmap(0, len, PROT_READ, MAP_PRIVATE, fd, 0);
> +    if ( fbuf =3D=3D MAP_FAILED )
> +        goto error;
> +
> +    rc =3D xc_livepatch_upload(self->xc_handle, name, fbuf, len);
> +    if ( rc )
> +        goto error;
> +
> +    if ( munmap(fbuf, len) )
> +    {
> +        fbuf =3D MAP_FAILED;
> +        goto error;
> +    }
> +    close(fd);
> +
> +    return Py_BuildValue("i", rc);;
> +error:
> +    if ( fbuf !=3D MAP_FAILED )
> +        munmap(fbuf, len);
> +    if ( fd >=3D 0 )
> +        close(fd);
> +    return pyxc_error_to_exception(self->xc_handle);
> +}
> +
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
> +    list =3D PyList_New(done);
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
> +        PyList_SetItem(list, i, info_dict);
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
> @@ -2587,6 +2811,44 @@ static PyMethodDef pyxc_methods[] =3D {
>        "Returns: [int]: 0 on all permission granted; -1 if any permission=
s are \
>         denied\n" },=20
> =20
> +    { "livepatch_status",
> +      (PyCFunction)pyxc_livepatch_status,
> +      METH_KEYWORDS, "\n"
> +      "Gets current state and return code for a specified module.\n"
> +      " name     [str]: Module name to be used\n"
> +      "Returns: [dict] on success; throwing an exception on error\n"
> +      " state    [int]: Module current state: CHECKED or APPLIED\n"
> +      " rc       [int]: Return code of last module's operation\n" },
> +
> +    { "livepatch_upload",
> +      (PyCFunction)pyxc_livepatch_upload,
> +      METH_KEYWORDS, "\n"
> +      "Uploads a module with specified name from filename.\n"
> +      " name     [str]: Module name to be used\n"
> +      " filename [str]: Filename of a module to be uploaded\n"
> +      "Returns: [int] 0 on success; throwing an exception on error\n" },
> +
> +    { "livepatch_action",
> +      (PyCFunction)pyxc_livepatch_action,
> +      METH_KEYWORDS, "\n"
> +      "Performs an action (unload, revert, apply or replace) on a specif=
ied \
> +       module.\n"
> +      " name      [str]: Module name to be used\n"
> +      " action   [uint]: Action enum id\n"
> +      " timeout  [uint]: Action scheduled execution timeout\n"
> +      " flags   [ulong]: Flags specifying action's extra parameters\n"
> +      "Returns: [int] 0 on success; throwing an exception on error\n" },
> +
> +    { "livepatch_list",
> +      (PyCFunction)pyxc_livepatch_list,
> +      METH_NOARGS, "\n"
> +      "List all uploaded livepatch modules with their current state and =
metadata.\n"
> +      "Returns: [list of dicts] on success; throwing an exception on err=
or\n"
> +      " name     [str]: Module name\n"
> +      " state    [int]: Module current state: CHECKED or APPLIED\n"
> +      " rc       [int]: Return code of last module's operation\n"
> +      " metadata [list]: List of module's metadata 'key=3Dvalue' strings=
\n" },
> +
>      { NULL, NULL, 0, NULL }
>  };
> =20
> @@ -2698,6 +2960,17 @@ PyMODINIT_FUNC initxc(void)
>      PyModule_AddIntConstant(m, "XEN_SCHEDULER_CREDIT", XEN_SCHEDULER_CRE=
DIT);
>      PyModule_AddIntConstant(m, "XEN_SCHEDULER_CREDIT2", XEN_SCHEDULER_CR=
EDIT2);
> =20
> +    /* Expose livepatch constants to Python */
> +    PyModule_AddIntConstant(m, "LIVEPATCH_ACTION_UNLOAD", LIVEPATCH_ACTI=
ON_UNLOAD);
> +    PyModule_AddIntConstant(m, "LIVEPATCH_ACTION_REVERT", LIVEPATCH_ACTI=
ON_REVERT);
> +    PyModule_AddIntConstant(m, "LIVEPATCH_ACTION_APPLY", LIVEPATCH_ACTIO=
N_APPLY);
> +    PyModule_AddIntConstant(m, "LIVEPATCH_ACTION_REPLACE", LIVEPATCH_ACT=
ION_REPLACE);
> +
> +    PyModule_AddIntConstant(m, "LIVEPATCH_ACTION_APPLY_NODEPS", LIVEPATC=
H_ACTION_APPLY_NODEPS);
> +
> +    PyModule_AddIntConstant(m, "LIVEPATCH_STATE_APPLIED", LIVEPATCH_STAT=
E_APPLIED);
> +    PyModule_AddIntConstant(m, "LIVEPATCH_STATE_CHECKED", LIVEPATCH_STAT=
E_CHECKED);
> +
>  #if PY_MAJOR_VERSION >=3D 3
>      return m;
>  #endif

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1mf98ACgkQ24/THMrX
1yyqjgf/fSOMYe+M26J0ZQQA9c/QmO6YWBLGhwYVJWq7prwbY+Jp0d/mIOKlVDlr
3oTSkH8LI3CxtTpS+Y6kc9aRubmy0hWHpUoMOjMfZUgii6IcA+5tI6+8grJarrd7
dWFyXmAQs1VX6cwxL9YCpe16YtJczc8VGhT0JdxqZyblHp6BDsSdenFyZto6Sv91
xWCbbKNF8al6P6sTWyi1mPsM9ThA93JvCovpqtu3lS96mIfHzD7aVKGaIvsc7uyA
6zOg1sAqGLNq8aayJIlRuRiCinj6HcbyKtELH2C9DA2qN+intLu9IP8Ykxju/ep1
SoTcndDEJU5wjiwN0rnAdnDBoA7thA==
=mU/M
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--


--===============2932151397739471502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2932151397739471502==--

