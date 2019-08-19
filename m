Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 089D795007
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 23:44:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzpNq-0004hn-8u; Mon, 19 Aug 2019 21:40:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=saCH=WP=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hzpNo-0004hd-F3
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 21:40:08 +0000
X-Inumbo-ID: e8f8183e-c2c9-11e9-a661-bc764e2007e4
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8f8183e-c2c9-11e9-a661-bc764e2007e4;
 Mon, 19 Aug 2019 21:40:07 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 3E4DD484;
 Mon, 19 Aug 2019 17:40:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 19 Aug 2019 17:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=2AmWqq
 IWJbNu/T8EW/5JJiHkSHqQvtGiXUYGsfgW2zM=; b=SQsljv71Lb3bPgV8vV0XKg
 al3O3XO4vF00I+cbK5pNnOgYF87DiX4ugzoTftUIXTBWrcLGv3opBYEMFP8vVujm
 VZa+TQlOP4troFAFSPqz4BKBnaKF1YMjbrpLqZA/rxu0YkFMDJhoM0qgWk2WgRAh
 LpqeU/gj+F04roQdz4wepX1/yyvKI+ekXnWyM2byGAvDO0SR+TXrNHPZr7kJsHVi
 3BZ0S+rGUfvIyzkHoZ605zr03YVbq6GntMlD+97Rs4DczaiWaf0r+vp4JJj4qH/5
 G5NvcrDsujzPTs3xfHQDrtHWrNWsQ1KKAXi6zJeQdVH118eDjyH287n9kMFUX1mQ
 ==
X-ME-Sender: <xms:MxdbXUnRK-mw6DVIWmfys9DJGZzf9UKhnBVNBGSjcR5-JRmdSOgszA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudegtddgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepphihthhhohhn
 rdhorhhgnecukfhppeeluddrieehrdefgedrfeefnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmnecu
 vehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:MxdbXfpRwo_i4qWg_wlGn-mOjYyYHkNKNzt02Cb7P7svZjBOl78OuQ>
 <xmx:MxdbXZGnQkUm2eh36M5li8pCFPuuoZtvIEiRHb8IMAUkwNQrS0r__g>
 <xmx:MxdbXdSjxCtpLz0OPVr6POrsuzqQ1eCERT7Aq2aLoAZN0WwBhrCKKw>
 <xmx:NBdbXdqAtIO3Edvf8j4VFyUgDu76UeCmke1--nBo0a4syNtviXjajw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id B383F8005A;
 Mon, 19 Aug 2019 17:40:01 -0400 (EDT)
Date: Mon, 19 Aug 2019 23:39:57 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Pawel Wieczorkiewicz <wipawel@amazon.de>
Message-ID: <20190819213957.GD1457@mail-itl>
References: <20190815113646.12918-1-wipawel@amazon.de>
MIME-Version: 1.0
In-Reply-To: <20190815113646.12918-1-wipawel@amazon.de>
Subject: Re: [Xen-devel] [PATCH livepatch-python 1/1] livepatch: Add python
 bindings for livepatch operations
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
Cc: Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 xen-devel@lists.xen.org, mpohlack@amazon.de, amazein@amazon.de,
 xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============4651722725079352031=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4651722725079352031==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d01dLTUuW90fS44H"
Content-Disposition: inline


--d01dLTUuW90fS44H
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH livepatch-python 1/1] livepatch: Add python bindings for
 livepatch operations

On Thu, Aug 15, 2019 at 11:36:46AM +0000, Pawel Wieczorkiewicz wrote:
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
> index 5459d6834d..87e3b8cacc 100644
> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c
> @@ -2008,6 +2008,230 @@ static PyObject *pyflask_access(PyObject *self, P=
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

This makes it dependent on "livepatch: Allow to override inter-modules
buildid dependency" patch. Since it's part of a different series, if
there is going to be v2, please name the dependency explicitly in the
commit message or at least after ---.

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

It would be nice to support Path-like objects on python >=3D 3.6. See
note about "s" format here:
https://docs.python.org/3/c-api/arg.html#strings-and-buffers

But since it's python 3 only, that would need to be under #if
PY_MAJOR_VERSION >=3D 3.

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

This makes it dependent on lp-metadata series. Same note as previously.
BTW for some reason your patch series are not handled as a mail threads,
which makes it harder to look for other patches in the series. Is it
only me?

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
> @@ -2584,6 +2808,44 @@ static PyMethodDef pyxc_methods[] =3D {
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
> @@ -2695,6 +2957,17 @@ PyMODINIT_FUNC initxc(void)
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

--d01dLTUuW90fS44H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1bFy4ACgkQ24/THMrX
1yzewggAklLAhz7VBCr+i0cxt8snsq2OQFRTrgIzsHyQjZoOViCMzs8txdgCrW8S
0eArKvV0EuWURHGSMR0eWIm9Er2TyHZqJLdSewhDk9wl8+uuyDUEds7+2VhOAObO
fAxGKPaz7aqK/gdqVRe4rjXQi0m0lQDAQ8Y7DaqjVkeXgzE3x5CPEdDKUTkgiQkq
f9Vgq/qOzohzP0Q7pkkv/3lRXCdx/N7npZ1aXqImb3t9SMQvtezW/p7B7fRMUo58
Jl7XwaY2vw3L8N6GTTJmfiXPj3PtLlZGNZyEvfjyryt5kF6LobMkziiU8hPO7Tth
YfkJN/8jV1mDHulM9NmDMFfaYEnCkw==
=dqHT
-----END PGP SIGNATURE-----

--d01dLTUuW90fS44H--


--===============4651722725079352031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4651722725079352031==--

