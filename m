Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF097F5377
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 23:36:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639246.996325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5vp0-0000N3-Fb; Wed, 22 Nov 2023 22:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639246.996325; Wed, 22 Nov 2023 22:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5vp0-0000Ky-Cq; Wed, 22 Nov 2023 22:35:50 +0000
Received: by outflank-mailman (input) for mailman id 639246;
 Wed, 22 Nov 2023 22:35:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q+k4=HD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r5voy-0000Jd-GG
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 22:35:48 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7af759fd-8987-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 23:35:47 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4084de32db5so1746255e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 14:35:47 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a05600c4e9200b00403b63e87f2sm40521wmq.32.2023.11.22.14.35.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 14:35:46 -0800 (PST)
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
X-Inumbo-ID: 7af759fd-8987-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibco.com; s=googleworkspace; t=1700692547; x=1701297347; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cxwBEItUcZsrg5eAe3C4X1FSVhfqBB7ITeGtM8ovgX8=;
        b=ne94HwtjMHJrJxZLtoFUbH1PtxJulpEjJpv1Jj9gCHjZ5rsUs3A/trsMTwSs8RJ0rj
         ZeAAZL3O6Gh5hZDpug1/5qf4BGg6C5wITE8ME+YAfaZ/PY11ciOA33y1Ej2ven/Eu9p6
         x9yo4u9YOf11UThdmIhqNM8Ri6KqctUv50WpRA8SewgXu7XPTBdjj1MiLZ0V31n44dkI
         PRpqk5ugt9Hh/kIXslgR/ZFoXpm+3nxhlsO2pmd+oXwSTGgr1G0F7R+kT4gOA1p7qMuI
         B6jGmnUOg0paSbVn5BEpdy4g47bCxrC7AJQTgmYVCQmFlUsnB+41/qICexQ8TIuzVvHq
         t0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700692547; x=1701297347;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cxwBEItUcZsrg5eAe3C4X1FSVhfqBB7ITeGtM8ovgX8=;
        b=gcdnKp4N/BlVR9xclTRqEAtEmGMBVmI1tgs3qFW2TfW5IYNs1eyV9U05umKGgCyxU9
         6Gt2iAgF7hfuB5Xft2cfJ15/yBbF68jcmOeUJxvJJ8M8FdoUBH2NPIJ2VnL7qik8dMiy
         CMvD42TbL2OLhYpVcxhnAhKUwlLkSduiUZq3HuvJ8gpkMAqEZGa6fpnhgIz8deA/f+ts
         lYdN/EI0cVeX0CLJgHXZrbVAujseYgfKs6gZ+Iy/XvBvuVi76xHP1QaeX+30M7XdBNQL
         X0IgtdXnK5foqCqbzWtOyBdFx9xCWowoeshAoCwKVCJY/v/kg1fYeCdTaEnvLvXB9qSx
         dvlA==
X-Gm-Message-State: AOJu0Yw/eZiAYvmWWTJS0aHQzFTKbNwkEP3hZ0RByp4ELE2PRY8Oh7oW
	FRVa5dVrwLjYfTDybe458EekkqZtFoO/tf+NCM4=
X-Google-Smtp-Source: AGHT+IG5HNygPkQQKMMQaiMgR88CNdn/bH0hggezZV1y7Bn4FBsYZN2by4CgyicXvm7gPzQnGdOutA==
X-Received: by 2002:a05:600c:4453:b0:404:4b6f:d705 with SMTP id v19-20020a05600c445300b004044b6fd705mr2791079wmn.17.1700692546798;
        Wed, 22 Nov 2023 14:35:46 -0800 (PST)
Message-ID: <48d6adeb-eb2d-40ac-949b-b6676dcab4f9@tibco.com>
Date: Wed, 22 Nov 2023 22:35:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] tools/pygrub: Expose libfsimage's fdopen() to python
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
 <20231106150508.22665-6-alejandro.vallejo@cloud.com>
From: Andrew Cooper <andcooper@tibco.com>
In-Reply-To: <20231106150508.22665-6-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/11/2023 3:05 pm, Alejandro Vallejo wrote:
> Create a wrapper for the new fdopen() function of libfsimage.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

I'd appreciate it if Marek would cast his eye (as python maintainer)
over it.

That said, ...

> diff --git a/tools/pygrub/src/fsimage/fsimage.c b/tools/pygrub/src/fsimage/fsimage.c
> index 12dfcff6e3..216f265331 100644
> --- a/tools/pygrub/src/fsimage/fsimage.c
> +++ b/tools/pygrub/src/fsimage/fsimage.c
> @@ -270,6 +270,30 @@ fsimage_open(PyObject *o, PyObject *args, PyObject *kwargs)
>  	return (PyObject *)fs;
>  }
>  
> +static PyObject *
> +fsimage_fdopen(PyObject *o, PyObject *args, PyObject *kwargs)
> +{
> +	static char *kwlist[] = { "fd", "offset", "options", NULL };
> +	int fd;
> +	char *options = NULL;
> +	uint64_t offset = 0;
> +	fsimage_fs_t *fs;
> +
> +	if (!PyArg_ParseTupleAndKeywords(args, kwargs, "i|Ls", kwlist,
> +	    &fd, &offset, &options))
> +		return (NULL);
> +
> +	if ((fs = PyObject_NEW(fsimage_fs_t, &fsimage_fs_type)) == NULL)
> +		return (NULL);
> +
> +	if ((fs->fs = fsi_fdopen_fsimage(fd, offset, options)) == NULL) {
> +		PyErr_SetFromErrno(PyExc_IOError);

Don't we need a Py_DECREF(fs) here to avoid leaking it?

~Andrew

> +		return (NULL);
> +	}
> +
> +	return (PyObject *)fs;
> +}
> +
>  static PyObject *
>  fsimage_getbootstring(PyObject *o, PyObject *args)
>  {
> @@ -302,6 +326,13 @@ PyDoc_STRVAR(fsimage_open__doc__,
>      "offset - offset of file system within file image.\n"
>      "options - mount options string.\n");
>  
> +PyDoc_STRVAR(fsimage_fdopen__doc__,
> +    "fdopen(fd, [offset=off]) - Use the file provided by the given fd as a filesystem image.\n"
> +    "\n"
> +    "fd - File descriptor to use.\n"
> +    "offset - offset of file system within file image.\n"
> +    "options - mount options string.\n");
> +
>  PyDoc_STRVAR(fsimage_getbootstring__doc__,
>      "getbootstring(fs) - Return the boot string needed for this file system "
>      "or NULL if none is needed.\n");
> @@ -315,6 +346,8 @@ static struct PyMethodDef fsimage_module_methods[] = {
>  	    METH_VARARGS, fsimage_init__doc__ },
>  	{ "open", (PyCFunction)fsimage_open,
>  	    METH_VARARGS|METH_KEYWORDS, fsimage_open__doc__ },
> +	{ "fdopen", (PyCFunction)fsimage_fdopen,
> +	    METH_VARARGS|METH_KEYWORDS, fsimage_fdopen__doc__ },
>  	{ "getbootstring", (PyCFunction)fsimage_getbootstring,
>  	    METH_VARARGS, fsimage_getbootstring__doc__ },
>  	{ NULL, NULL, 0, NULL }


