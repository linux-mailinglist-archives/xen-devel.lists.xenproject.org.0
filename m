Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F47A17BAF
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 11:30:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875328.1285774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBW9-0007UQ-6y; Tue, 21 Jan 2025 10:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875328.1285774; Tue, 21 Jan 2025 10:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBW9-0007RY-3e; Tue, 21 Jan 2025 10:29:57 +0000
Received: by outflank-mailman (input) for mailman id 875328;
 Tue, 21 Jan 2025 10:29:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abyW=UN=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1taBW7-0007Fn-RH
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 10:29:55 +0000
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [2001:4860:4864:20::2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6d609f6-d7e2-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 11:29:54 +0100 (CET)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-2addd5053c0so3398842fac.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 02:29:54 -0800 (PST)
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
X-Inumbo-ID: a6d609f6-d7e2-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737455393; x=1738060193; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWiYWjwnCXUKr9k4usiiB0rss/xJcUGQqbM6feFrsug=;
        b=cnEaoMuJg/ixS4axvfmQBYfwH0jCIhdS6nJr18/0/8sF1L27o8QCh1GmOH/wtiQTcu
         LPQIzDd0ZwlS3AhsfU6LazaXY51Vod4KX443dBl0XsZo1PnoJlTVnzO8tHDabbpreucq
         4Ju++iUdQLylSV4qcztfTm6YQ9vUD5PWV4L5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737455393; x=1738060193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWiYWjwnCXUKr9k4usiiB0rss/xJcUGQqbM6feFrsug=;
        b=OZT1RshJzfYT42ZkrKLg8AxwHJkljgPT8PpNUBGQhsFYKQXodTAT9RRR9u3XN5sYCg
         9kdgLVwatli8f8oRM7Dz0H+zYoffQukBOcxaFmF2mHXLJSHd4noQ9bkJFin7uHIfzKe4
         9HIVAn7mitTVlHuA+r4o7vE41VWQ+fEzUJOgd7Hn3dSK1V6qQFutNZZ+JIZR2Lt76kJk
         N7ptNPI6m68wUtdmhq2C3SY7L1x+4RSJFSx4q3gTBzn40oOTOyyjJ/AEYEr7wtdoVI5R
         G5PSLjG01cnRXLTOAWqiNSckjKd0JPZAnByugP03heeoj/6Wktdvd6IA8WiPcFaEoOqS
         +iPg==
X-Gm-Message-State: AOJu0Yw/xGfg5bwQiOYjKx5VZURl31vZTVvaUZ6nb3UVKforXU+JiWcg
	0C5gZEZ/9dJR1r4FUahLdA3aUcrOg7mRaT02Jo5tBv5cdA4MsdQOPFrO2HOY8UeYs4KUonT+6WZ
	zelikgwuxRsc++8/gnwnLAMxNtPAktbNZNo8N
X-Gm-Gg: ASbGncvaAerOPzdKYdexk7rvViK7F37GVOF4iEv2uFi+5TMHat+SjEIC+1M4RTbBY8q
	9pjpaUX0HbbW0fwZpuF9sPuWeNpo6a9Y07GSH831iyFel3fVjQA==
X-Google-Smtp-Source: AGHT+IGaruOW/5zSMu2hyoQWZXuQ5XCBUG4Vv51k8BwSY9sKGHEXq80WCeEZAnxH4Rro1NWmL+thvOgwKk+z+FtEPfQ=
X-Received: by 2002:a05:6870:e2cf:b0:29e:76c8:be2e with SMTP id
 586e51a60fabf-2b1c0b08182mr10701735fac.28.1737455392787; Tue, 21 Jan 2025
 02:29:52 -0800 (PST)
MIME-Version: 1.0
References: <20241107151509.73621-1-roger.pau@citrix.com> <20241107151509.73621-2-roger.pau@citrix.com>
In-Reply-To: <20241107151509.73621-2-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Tue, 21 Jan 2025 10:29:42 +0000
X-Gm-Features: AbW1kvbNEHrIjVeApohhmIFZ25M0TGPc25YkDyxr3G-xCDZgOtMIIKs-uGrJycI
Message-ID: <CAG7k0EoemEjzaHnDSnDhLAeuJOiuJBu9QxsimSXrA9Nu3FNktw@mail.gmail.com>
Subject: Re: [PATCH 1/4] livepatch-build: allow patch file name sizes up to
 127 characters
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 3:15=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.co=
m> wrote:
>
> XenServer uses quite long Xen version names, and encode such in the livep=
atch
> filename, and it's currently running out of space in the file name.
>
> Bump max filename size to 127, so it also matches the patch name length i=
n the
> hypervisor interface.  Note the size of the buffer is 128 characters, and=
 the
> last one is reserved for the null terminator.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Take into account the null terminator.
> ---
>  livepatch-build | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/livepatch-build b/livepatch-build
> index 948b2acfc2f6..f3ca9399d149 100755
> --- a/livepatch-build
> +++ b/livepatch-build
> @@ -72,8 +72,9 @@ function make_patch_name()
>      fi
>
>      # Only allow alphanumerics and '_' and '-' in the patch name.  Every=
thing
> -    # else is replaced with '-'.  Truncate to 48 chars.
> -    echo ${PATCHNAME//[^a-zA-Z0-9_-]/-} |cut -c 1-48
> +    # else is replaced with '-'.  Truncate to 127 chars
> +    # (XEN_LIVEPATCH_NAME_SIZE - 1).
> +    echo ${PATCHNAME//[^a-zA-Z0-9_-]/-} |cut -c -127
>  }

I think this 48 char limit erroneously came from kpatch / Linux's module
name length limit and is therefore not relevant.

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Thanks

