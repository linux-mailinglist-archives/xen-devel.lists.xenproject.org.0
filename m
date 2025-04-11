Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFFBA85D21
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 14:35:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947317.1344970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3DbY-0003VM-2S; Fri, 11 Apr 2025 12:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947317.1344970; Fri, 11 Apr 2025 12:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3DbX-0003Tu-W6; Fri, 11 Apr 2025 12:35:31 +0000
Received: by outflank-mailman (input) for mailman id 947317;
 Fri, 11 Apr 2025 12:35:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JDlf=W5=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1u3DbW-0003To-BV
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 12:35:30 +0000
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [2607:f8b0:4864:20::c2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72751003-16d1-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 14:35:28 +0200 (CEST)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-60288fd4169so880189eaf.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 05:35:28 -0700 (PDT)
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
X-Inumbo-ID: 72751003-16d1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1744374927; x=1744979727; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mD/6pScuA/dZyup7zZPwm3zOTuyrMzpCPVf7lykThh0=;
        b=R2L+2yTZIcD8BTkNnY8VI41jt3uifis+WhqdldrYo2KF0kuIZJmoTcrb4OchD+kEPp
         6NQT79Z44OiJ73x4dA/naoLqhLwHsFsux7dwWWFKadpXwmddMrd0+Fz9r7v29kfSmk1i
         SKcUwUCKokcKxf4T6DfvoblcYapLHS94oDDHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744374927; x=1744979727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mD/6pScuA/dZyup7zZPwm3zOTuyrMzpCPVf7lykThh0=;
        b=aJNrhB0GOEVFGmZgflib8N+EjNSQ1nOqtV1LTTA+CgXVwZS4KxCzQ7jnNQzZ1+AVO/
         Vyh+EZ0R3r3cXrmr/poiJlYoal+Tu2avDaWRrOXMhaKNyjZSbECna32DXVE0MK8/inQt
         KVw+9MWH/1AeQscdjlQPt18RJE9FV2i0s5gIFYGHm678Gfwn2SNRLUd1tBtcjE/8yuYe
         qkAvW9RhcZA89hwe6bOPx/oxF+z3Z0gnPo993HGXdJ6jGWaMs9R9aL93qxwlYQOVN10m
         XHeiNaGgBJpwFeX1IqD14C6NHqGN2TXFPQqkrQnaHkRQJHdDhiK9lxI7rKtZF/kbsUwH
         iHlg==
X-Gm-Message-State: AOJu0YwcYH9SbL0o5oJKeU05PwFVJWv87gOmjhJ3Js4WTWVaRbZ03+ua
	NEux6LHGLIiRt6QVJc4yjiXUpmzi3PpMYGB//QLjlFzEKcd0UfkZPgdclCwQz12yU74xjyWTMsB
	ldWPEf6ao0GV7qhcXVwqZwEV0qWMkDP3jO2ItgCHpqMhSV87Wjco=
X-Gm-Gg: ASbGncshriD60p3NY/Zc1yUQ+nCFDEnT1eYfKtvNJFeoqWhq55YZLPYIhEoyYqFeEsg
	P1AqHD/wJC4g2qHjYr0eQhM4lQaPwRuYEDNxDx5UuP/p+1nJHuSFBt7mjaPqINcNcCDOLGu/jwk
	dyQdJs4T23QJXVylmJxWUgFQ==
X-Google-Smtp-Source: AGHT+IGvxnWmvdGRD/uFlEA2VHHt2vsJFHmB61lGYyVZkfLOtO4B4z3scq0f1kftLg9MzUI2ua0fELXDIuz84ZM1UZ8=
X-Received: by 2002:a05:6820:1b88:b0:5fc:e026:f073 with SMTP id
 006d021491bc7-6046f5bfc02mr1101933eaf.8.1744374926977; Fri, 11 Apr 2025
 05:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250411105217.2141356-1-andrew.cooper3@citrix.com> <20250411105217.2141356-3-andrew.cooper3@citrix.com>
In-Reply-To: <20250411105217.2141356-3-andrew.cooper3@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 11 Apr 2025 13:35:15 +0100
X-Gm-Features: ATxdqUErlj4Y4svNPRbB1vFZhdLfXHJiRJLDDxrFPgcgRB7rn_SE01GZEw7GfVI
Message-ID: <CACHz=Zj22AhquDYVk-TttfUqvnMyQ-BEgUK5sggxuW_RzPXkqA@mail.gmail.com>
Subject: Re: [PATCH 2/3] Shrink the rootfs substantially
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>, 
	Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 11:52=E2=80=AFAM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> bash, busybox, musl and zlib are all in the base container.
>
> python3 and ncurses are in principle used by bits of Xen, but not in anyt=
hing
> we test in CI.  argp-standlone, curl, dbus, libfdt, libgcc and sudo aren'=
t
> used at all (for x86 at least).
>
> libbz2 and libuuid were pulled in transitively before, and need to be inc=
luded
> explicitly now.
>
> Use apk --no-cache to avoid keeping a ~2M package index on disk.
>
> Remove the modules scan on boot.  We don't have or build any.  This remov=
es a
> chunk of warnings on boot.
>
> This shrinks the rootfs from ~30M down to ~8M.
>
> No practical change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
>
> I'm still working on the integration of the new rootfs's int Xen, and wil=
l
> hold off until committing that's ready but
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/176351016=
4
> shows good early progress.
> ---
>  scripts/alpine-rootfs.sh | 60 +++++++++++++++++++++++-----------------
>  1 file changed, 34 insertions(+), 26 deletions(-)
>
> diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
> index c29c92d1c682..30d426d6e88f 100755
> --- a/scripts/alpine-rootfs.sh
> +++ b/scripts/alpine-rootfs.sh
> @@ -4,33 +4,42 @@ set -eu
>
>  WORKDIR=3D"${PWD}"
>  COPYDIR=3D"${WORKDIR}/binaries"
> +UNAME=3D$(uname -m)
>

Minor: maybe ARCH/MACHINE ?

> -apk update
> +apk --no-cache update
>
> -# xen runtime deps
> -apk add musl
> -apk add libgcc
> -apk add openrc
> -apk add busybox
> -apk add sudo
> -apk add dbus
> -apk add bash
> -apk add python3
> -apk add zlib
> -apk add lzo
> -apk add ncurses
> -apk add yajl
> -apk add libaio
> -apk add xz
> -apk add util-linux
> -apk add argp-standalone
> -apk add libfdt
> -apk add glib
> -apk add pixman
> -apk add curl
> -apk add udev
> -apk add pciutils
> -apk add libelf
> +PKGS=3D(
> +    # System
> +    openrc
> +    udev
> +    util-linux
> +
> +    # Xen toolstack runtime deps
> +    libbz2
> +    libuuid
> +    lzo
> +    xz
> +    yajl
> +
> +    # QEMU
> +    glib
> +    libaio
> +    pixman
> +    )

Minor: indent with "PKGS" ?

> +
> +case $UNAME in
> +    x86_64)
> +        PKGS+=3D(
> +            # System
> +            pciutils
> +
> +            # QEMU
> +            libelf
> +            )
> +        ;;
> +esac
> +
> +apk add --no-cache "${PKGS[@]}"
>
>  # Xen
>  cd /
> @@ -45,7 +54,6 @@ rc-update add dmesg sysinit
>  rc-update add hostname boot
>  rc-update add hwclock boot
>  rc-update add hwdrivers sysinit
> -rc-update add modules boot
>  rc-update add killprocs shutdown
>  rc-update add mount-ro shutdown
>  rc-update add savecache shutdown
> --
> 2.39.5
>
>

It looks good to me.

Frediano

