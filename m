Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2A0828E56
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 21:02:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664950.1035108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNIIA-0002bR-Hh; Tue, 09 Jan 2024 20:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664950.1035108; Tue, 09 Jan 2024 20:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNIIA-0002Yk-EM; Tue, 09 Jan 2024 20:01:42 +0000
Received: by outflank-mailman (input) for mailman id 664950;
 Tue, 09 Jan 2024 20:01:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qgrd=IT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rNII9-0002Yc-Af
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 20:01:41 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e73c169b-af29-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 21:01:40 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50e7c6f0487so3303842e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 12:01:40 -0800 (PST)
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
X-Inumbo-ID: e73c169b-af29-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704830500; x=1705435300; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOO4ayKK2UoK28WAEDe31K//qfuYSZXi6pXJh+a7zjI=;
        b=T/KXLiSJQyGbE3Y6C9jupHYXQFgZwxq5MGR6TRH0Ee0+kkrgLm4RUC+wqgl405s+Mv
         AC5FJU2brxXAKMLLQuqdbIuHGAfF6nvSGbLL6jvYSaAhGGP5Z1jhPpIHxLUGOem1ZDLz
         rgpr52G8AqP5IEwQIIhH7hROR5HSaB4HD7Vsss15Ng7KCcHbkbIYB+1FfhYPypsstBSc
         q8UsppJSJ1yCnLloc5Ko+SjWgNR/fBR4Q735XZUz/KmZDQX+4DzQH+WF0sZt0k+qWi4J
         p/rABEZUYJ1tREAdil6P0qT5z28gidABlhxAiBPFpY7xuacm//1XME1LrG2cnxeQKNOQ
         5Lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704830500; x=1705435300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOO4ayKK2UoK28WAEDe31K//qfuYSZXi6pXJh+a7zjI=;
        b=ZgOzGiHdVx9D5H2RzRRrhSnDXKao+Ewz1u6ngtKfMFyVTHOP3MPYCXLm1KkbikZGvu
         lcJF0ITCwtGcE388V+b/UVuVbKDDEEI5RRujTZGIJs0umXCJAgQaFnPJExzhyJazpNLZ
         lyPe12p2FTz4ZuHWl4LuW/GcDdgtrgC8q9SyQg2I/aYlH2hXidm/2AYHSJ4ZBmXj9/EZ
         yg04L5tTEQLN54WdgcBjMUadzkSPAwQWiVM3klQZ9CS2QghU7wHA43vW63PEvlLw7ksK
         LWzgaP5l9RZBL0jtKpPHUvZS5uITH08eVkvRjn3jrRtsxboHkLenzFhmZRdZ1tJ4FZVD
         ID0w==
X-Gm-Message-State: AOJu0Yx+HZ0SoIVzxu7kRc8ZcoIbKqPdEa+yYjt+8Vl8eCe//5XPI6AK
	xvgpUg/kNfUbqHlHuNjWl4irVwRs+MGZjwlOjbo=
X-Google-Smtp-Source: AGHT+IHR4vNJxHw5RAm73g4WkkHX8vdiEczvgO0a2ey+LGawUvLtYqJbYwnQRRFw0YgpFy9VdlbW8snQ3iNxXeFkMQo=
X-Received: by 2002:ac2:59d9:0:b0:50e:8e94:bcfe with SMTP id
 x25-20020ac259d9000000b0050e8e94bcfemr1634466lfn.64.1704830499831; Tue, 09
 Jan 2024 12:01:39 -0800 (PST)
MIME-Version: 1.0
References: <20240104090055.27323-1-jgross@suse.com> <20240104090055.27323-18-jgross@suse.com>
In-Reply-To: <20240104090055.27323-18-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 9 Jan 2024 15:01:28 -0500
Message-ID: <CAKf6xptpjVyQ3Jhg1rCa6AJXrv9DEUZVS+jYZPMwN69CXP=ZdQ@mail.gmail.com>
Subject: Re: [PATCH v3 17/33] tools/xl: support new 9pfs backend xen-9pfsd
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 4:02=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add support for the new 9pfs backend "xen-9pfsd". For this backend type
> the tag defaults to "Xen" and the host side path to
> "/var/log/xen/guests/<dom-name>".
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> V2:
> - test max_files and max_open_files, too (Jason Andryuk)
> ---
>  docs/man/xl.cfg.5.pod.in | 36 ++++++++++++++++++++++++++++++++++--
>  tools/xl/xl_parse.c      | 36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 70 insertions(+), 2 deletions(-)
>
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 2e234b450e..80011adbf3 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -772,10 +772,16 @@ settings, from the following list:
>
>  =3Dover 4
>
> +=3Ditem B<type=3DTYPE>
> +
> +The backendtype for the PV device. Supported values are B<qemu> and
> +B<xen-9pfsd>.  The default is B<qemu>.
> +
>  =3Ditem B<tag=3DSTRING>
>
>  9pfs tag to identify the filesystem share. The tag is needed on the
> -guest side to mount it.
> +guest side to mount it. For the backendtype of B<xen-9pfsd> the tag defa=
ults to
> +"Xen".

Here and below it's "xen_9pfsd" as the type.

I tried mounting a xen-9pfsd export in Linux, but mount failed:
mount: /mnt/9p-b: mount(2) system call failed: Remove I/O error.
dmesg(1) may have more information after failed mount system call.

dmesg doesn't have any other details.
/sys/bus/xen/devices/9pfs-2/state shows Connected.

Regards,
Jason

