Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2701884EF33
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 04:09:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678531.1055903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYHGB-0006Q8-6N; Fri, 09 Feb 2024 03:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678531.1055903; Fri, 09 Feb 2024 03:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYHGB-0006Nx-2M; Fri, 09 Feb 2024 03:09:03 +0000
Received: by outflank-mailman (input) for mailman id 678531;
 Fri, 09 Feb 2024 03:09:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vW4Z=JS=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rYHG9-0006Nr-Tn
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 03:09:01 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92792d0d-c6f8-11ee-8a4b-1f161083a0e0;
 Fri, 09 Feb 2024 04:09:00 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5600c43caddso597357a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 19:09:00 -0800 (PST)
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
X-Inumbo-ID: 92792d0d-c6f8-11ee-8a4b-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707448140; x=1708052940; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OcjvyFdFfN0YTA7X6657JNcd4izQVcCS3w/UHKd7y4=;
        b=i4KCilLpH//ky8A8F5KKrGWlS1yqa9ZAzLMzF3TG4ycDnTDtXopLMNsxZ/HbHelvVL
         IHRR6Ho6Xa7d8KXiJTIh9YwIiKBk+c4DTEMbvw9/kGdu17U9nOWQBffpvxpXciwHUDqF
         J88Ns/aHUvfX1IGgfui1QbROyj0ig86PY3qo1Pv22tPMQoOKMVCG0/T4OdXoSsn9ibkv
         s8y76uSpC0MWH8JXzk2mUXR3LOcdkT7CP77TzAASjPIWuTfArsbo9a6etLxpWYxbZDVw
         fZp5N+VxIaVJKXekr6bt4QXT9imoIn4FmiuZyiGW0IUVqCjL+0dZxd3AtOXVq2ntMb3d
         brWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707448140; x=1708052940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2OcjvyFdFfN0YTA7X6657JNcd4izQVcCS3w/UHKd7y4=;
        b=LIklZ3EX1M1kZZ2FsJFDk9FpQdC9rRVIgJ1nPpWwGP2sIowJ2Q7LV16cyDgkoV+d5k
         RX3E0dqg4NdpuAiMWD/akKmAAZd0bzRrkqA4REw9On1u9B+CU/lP9B/jHJPh4bFGme3z
         15CHPPx0psIXnTW49Dv14P00ER+Cd4nqWARhalCz7jOjlO6LyKfY3s0XOyzx93FRq0g/
         fMwcpkm7CNcw88sdm3LzntV7b0wt73dSKX1C2QNy1lxIIc43e7H96jqUiQiPcOwpmqSa
         x6MkTu8C/5McXTN4EvGbqLEqxdbkbQHzigITsR4QDHKOS2iguz3y5NXzWwNIIWB78e5y
         oM3w==
X-Gm-Message-State: AOJu0YyeuPKzo8D0QOth6I1OZQarRUg968Fk1jPGwCOgjQtJ4oqhXDfL
	WB/GUCEa7NZITGwaudiyv7D4PBbYJWN7emrFFVrHFMGts1mJYywz+EqNOfnrVEfXk8eNMAOF99k
	VVpehbSOHpkJ+VnU6kPeLk9iO0Fg=
X-Google-Smtp-Source: AGHT+IFe0FeP/dxtCtFwA+vo7bxsfEYQJghTdKjDR9nRJtyHL9gqBtUqdRPjRy+vC1C7XXhQU9g87Xx8iCskyGcGKO0=
X-Received: by 2002:aa7:d692:0:b0:55f:c5b7:5855 with SMTP id
 d18-20020aa7d692000000b0055fc5b75855mr285211edr.6.1707448140092; Thu, 08 Feb
 2024 19:09:00 -0800 (PST)
MIME-Version: 1.0
References: <20240208165546.5715-1-jgross@suse.com> <20240208165546.5715-19-jgross@suse.com>
In-Reply-To: <20240208165546.5715-19-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 8 Feb 2024 22:08:44 -0500
Message-ID: <CAKf6xpv-77WjgXFcJz_WgwRxetO3mACAM+uagb6V1OgWKd__-Q@mail.gmail.com>
Subject: Re: [PATCH v5 18/22] tools: add 9pfs device to xenstore-stubdom
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 12:10=E2=80=AFPM Juergen Gross <jgross@suse.com> wro=
te:
>
> Add a 9pfs device to Xenstore stubdom in order to allow it to do e.g.
> logging into a dom0 file.
>
> Use the following parameters for the new device:
>
> - tag =3D "Xen"
> - type =3D "xen_9pfsd"
> - path =3D "/var/lib/xen/xenstore"
> - security-model =3D "none"
>
> For now don't limit allowed file space or number of files.
>
> Add a new libxl function for adding it similar to the function for
> adding the console device.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

