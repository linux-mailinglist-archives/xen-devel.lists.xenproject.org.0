Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077D9828CE6
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 19:49:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664910.1035037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNH9j-0003Yp-UQ; Tue, 09 Jan 2024 18:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664910.1035037; Tue, 09 Jan 2024 18:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNH9j-0003Wh-RZ; Tue, 09 Jan 2024 18:48:55 +0000
Received: by outflank-mailman (input) for mailman id 664910;
 Tue, 09 Jan 2024 18:48:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qgrd=IT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rNH9j-0003WN-2O
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 18:48:55 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcf977b2-af1f-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 19:48:54 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-55822753823so849514a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 10:48:54 -0800 (PST)
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
X-Inumbo-ID: bcf977b2-af1f-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704826134; x=1705430934; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8BUJrymoqoqnWLjATv//fzdi5296zc26zx1D/fqfvA=;
        b=hI6PAGA/Mcf8+OnIRxHY3r5omUIQPAJkircr4OCrVDwpKWeTBFosAP+/vnh3il3kUP
         udlyIDp0CZZfgFCGXY7qDMew/gStYWpjsqvkDBDZrwJb4zw9QClkbsz4rII22Mxan7O0
         KfrHH1nKJiAlHBOqWTUQGdxmoC1Alc/w+Pil5M1Wg7yHgyoXKefBTvSXKydCrj683Bnx
         D2dViPeN2By1Fpu6F1UF4ypTl3uGd8g/2MNwejsUkdx1Y8UQg9B8ogQUHlMufeKIG8NR
         EcxRMJeHh+J7jJdRMsWVdd79he5FpR84PV5LiYuAK8Qx7wl/Il3NylS6t6AmnwUv5iHQ
         hT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704826134; x=1705430934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I8BUJrymoqoqnWLjATv//fzdi5296zc26zx1D/fqfvA=;
        b=n3ti4c9Tz5y6xP20uvVXkLWWryNXlFPtG0tnW3crv8bOUqpqrQl9+wx8X7C2Cx8kcn
         jxY8rbxhHESXzFO6o23QJ3R9rFmGxBw26AjSmVssdK0/tiw/7kCdqs1nuN9OZhq2ly0J
         FrbWKnJTqfQJg6GKlHQtZneONWPJVcj7AvLY8Uiuzgf23eB0XZ5EqCeUzATt2wWfMWAX
         2x0ByR3WrJPeX/ITt8MbS3zBQ/B2UXInYpFOQ5xnpoFBugiEX60gLcwOTqJ6sKXu2S/6
         /E/WfblJFRny+ym/nYv3gBfO7ZlsVzO1i2B0+ormv7QpaGMlXHIud2bRRRCTaZHzXK4n
         CyTQ==
X-Gm-Message-State: AOJu0YzDy51PhaSMqBrnivtYsk/5BqsDaFYEBvaz55sWPYM8xLkPsKEa
	5h6A3rCyylgZoTNpLIg1lBDcW4N/MesINDFV6vY=
X-Google-Smtp-Source: AGHT+IGHNEOC+knSGePDZCVE5hsEllBBm+xegjK69r4jMHP1FMziAfG1G1Pr+3EAJ3N7+ldwK9Bpaasl4dJTnOP9jjc=
X-Received: by 2002:a50:9353:0:b0:552:8534:2a53 with SMTP id
 n19-20020a509353000000b0055285342a53mr2252198eda.23.1704826133894; Tue, 09
 Jan 2024 10:48:53 -0800 (PST)
MIME-Version: 1.0
References: <20240104090055.27323-1-jgross@suse.com> <20240104090055.27323-9-jgross@suse.com>
In-Reply-To: <20240104090055.27323-9-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 9 Jan 2024 13:48:41 -0500
Message-ID: <CAKf6xpv2BHy_8qomwfFJq2dePFf8bB19NZQ4dmw-eFDj5+hdng@mail.gmail.com>
Subject: Re: [PATCH v3 08/33] tools/xenlogd: add 9pfs attach request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 4:12=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the attach request of the 9pfs protocol. This introduces the "fid"
> scheme of the 9pfs protocol.
>
> As this will be needed later, use a dedicated memory allocation
> function in alloc_fid() and prepare a fid reference count.
>
> For filling the qid data take the approach from the qemu 9pfs backend
> implementation.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - make fill_qid() parameter stbuf const (Jason Andryuk)
> - free fids after disconnecting guest (Jason Andryuk)
> V3:
> - only store relative path in fid (Jason Andryuk)

The code looks good.  I did have a thought though.

> +static struct p9_fid *alloc_fid_mem(device *device, unsigned int fid,
> +                                    const char *path)
> +{
> +    struct p9_fid *fidp;
> +    size_t pathlen;
> +
> +    /* Paths always start with "/" as they are starting at the mount poi=
nt. */
> +    assert(path[0] =3D=3D '/');
> +

...

> +
> +static const char *relpath_from_path(const char *path)
> +{
> +    if (!strcmp(path, "/"))
> +        return ".";
> +
> +    return (path[0] =3D=3D '/') ? path + 1 : path;
> +}

You've carefully written the code to ensure the *at() functions are
not called with paths starting with "/".  What do you think about
storing the converted paths when storing into the p9_fid?  That way
the code doesn't have to worry about always going through
relpath_from_path() before use.  Another option beside performing the
relpath_from_path() conversion, would be to save fidp->path with "./"
at the start to eliminate absolute paths that way.  My thinking is
it's more robust to not have any absolute paths that could be passed
to a *at() function.

Having written that, I don't see any issue with the code as-is, so if
you don't want to make any further change:
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Regards,
Jason

