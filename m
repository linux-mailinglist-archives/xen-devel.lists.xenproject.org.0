Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5781CA72FC5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 12:37:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929056.1331690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txlYB-0000eM-7i; Thu, 27 Mar 2025 11:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929056.1331690; Thu, 27 Mar 2025 11:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txlYB-0000bk-3p; Thu, 27 Mar 2025 11:37:31 +0000
Received: by outflank-mailman (input) for mailman id 929056;
 Thu, 27 Mar 2025 11:37:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFzh=WO=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1txlY9-0000be-J6
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 11:37:29 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc440d25-0aff-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 12:37:27 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-54af20849bbso938688e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 04:37:27 -0700 (PDT)
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
X-Inumbo-ID: dc440d25-0aff-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743075446; x=1743680246; darn=lists.xenproject.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWerdclphC3e3T8IBzggr60ci8Bx5F0xMS94MYGosvo=;
        b=EeMYZjgQ4uPutRjOmjsXIlYKEEMK4RWBIYYtX18Dy2J3KKoriP/hhHUuoJVouLJUnK
         j3AZT9ZvdjyNvkuXbrDjb8H7RrpFvyp2uHQe0BiZladJcPsPoXdS8CaE/AnbngZisf/U
         alzzaokUXrfj3K7dSlEijYRO68y22+XltmYlKWOyg9jtKVFyyBpmzmQRTT+suyacCM33
         rPd+AWSNanp8KjWpVVxK6RKjEEx/G06PIxzSqQ14k/lEaWMxTeuXBYOVFNQx+gMc7ihw
         shijqhuJbQUdgnRw/cvr1vP53xFMmmh7o6psIwEyxDSvzQeq9tIz0gvDNIkTdJfbzzGm
         wyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743075446; x=1743680246;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWerdclphC3e3T8IBzggr60ci8Bx5F0xMS94MYGosvo=;
        b=kH5IaCB12mRl9+60ESefThmUwuiTR6GkMlRZp1BkE48R6Wc3+J6Q03jgcyfygpAleU
         NrjHLrUNdlsm34RllnBBp+Sp7JzuFd42puNJuUJHwTAPr/obYsukl9FbkvVOiInPqZaD
         KLq4Nu/mnAqu6Vx9Tt+piDc1Og4O8xT9ZmYG9au4rGerzBBUUVDKiC97rTcci4ObR6gN
         7Ja6tMTxUthsgy8EMk/vM2mdzi6M3dlyEpCnXf3TQA9mHgxuaITkVENxI55c39IaB4xx
         u1zNpKuCQ/DlrXb4ITNBgxL/KOerbAxAq4IY0Ucdkn9UQiVoG799wyik2hNPZMmFqnhd
         V7+g==
X-Gm-Message-State: AOJu0YyVJ+uIW+OzlBkEBfY/jLKlrKSLNYRYgognoc3caxWNOtIsWm9p
	vu08mkP9OdKxNCXj3aGRN/O+rbbCJB637+IGWR15zU27aEfhzlWoWIu4JsGAZQixe+EMdbo7RoU
	e2mYSjhnUXlQcLGQ5F/p9BqCRn5QdXg==
X-Gm-Gg: ASbGncsdp15AA0Myr0OApiMUIMHls43X0xgYnBgDCTYfN7l2h7BUhlKEXfqRJyXi+xl
	L+CFltzvsOXEUwAZ7wIBYtr7jhT5/CNHFDB8970VCEuSkSNjybkT+U6tENQ2kWpaGosGerqZJYU
	VZZ2R4Y414Gin4qA8yJlQ0HOli
X-Google-Smtp-Source: AGHT+IEornTwNGU/XJSIJ1rYuhXHSDqkoK0sfYKjSyfhFiNm0WYqKQXanTioVCSjHzAlUgoaguwzyVyCeDx/jFZWEpI=
X-Received: by 2002:a05:6512:3d0c:b0:549:8cbb:5441 with SMTP id
 2adb3069b0e04-54b011d6250mr1452748e87.15.1743075446270; Thu, 27 Mar 2025
 04:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <7c3fece57a28462ae0c071c1cf72eb32541f1b91.1743074241.git.mykola_kvach@epam.com>
In-Reply-To: <7c3fece57a28462ae0c071c1cf72eb32541f1b91.1743074241.git.mykola_kvach@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 27 Mar 2025 13:37:15 +0200
X-Gm-Features: AQ5f1Jo3hhtBRNVz-Ntec5sfWgEJb04qX7K-JzYZexdmJacrCAttygFbLXMGdSY
Message-ID: <CAGeoDV8LFsJEgZSYcUowTZ95hu6AQro92cQOZ8409ccAvHjTSQ@mail.gmail.com>
Subject: Re: [PATCH v2] xen/percpu: don't initialize percpu on resume
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 1:32=E2=80=AFPM Mykola Kvach <xakep.amatop@gmail.co=
m> wrote:
>

Hmm, looks like this line...

> From: Mykola Kvach <mykola_kvach@epam.com>

...shouldn't be here

>
> Invocation of the CPU_UP_PREPARE notification
> on ARM64 during resume causes a crash:
>
> (XEN) [  315.807606] Error bringing CPU1 up: -16
> (XEN) [  315.811926] Xen BUG at common/cpu.c:258
> [...]
> (XEN) [  316.142765] Xen call trace:
> (XEN) [  316.146048]    [<00000a0000202264>] enable_nonboot_cpus+0x128/0x=
1ac (PC)
> (XEN) [  316.153219]    [<00000a000020225c>] enable_nonboot_cpus+0x120/0x=
1ac (LR)
> (XEN) [  316.160391]    [<00000a0000278180>] suspend.c#system_suspend+0x4=
c/0x1a0
> (XEN) [  316.167476]    [<00000a0000206b70>] domain.c#continue_hypercall_=
tasklet_handler+0x54/0xd0
> (XEN) [  316.176117]    [<00000a0000226538>] tasklet.c#do_tasklet_work+0x=
b8/0x100
> (XEN) [  316.183288]    [<00000a0000226920>] do_tasklet+0x68/0xb0
> (XEN) [  316.189077]    [<00000a000026e120>] domain.c#idle_loop+0x7c/0x19=
4
> (XEN) [  316.195644]    [<00000a0000277638>] shutdown.c#halt_this_cpu+0/0=
x14
> (XEN) [  316.202383]    [<0000000000000008>] 0000000000000008
>
> Freeing per-CPU areas and setting __per_cpu_offset to INVALID_PERCPU_AREA
> only occur when !park_offline_cpus and system_state is not SYS_STATE_susp=
end.
> On ARM64, park_offline_cpus is always false, so setting __per_cpu_offset =
to
> INVALID_PERCPU_AREA depends solely on the system state.
>
> If the system is suspended, this area is not freed, and during resume, an=
 error
> occurs in init_percpu_area, causing a crash because INVALID_PERCPU_AREA i=
s not
> set and park_offline_cpus remains 0:
>
>     if ( __per_cpu_offset[cpu] !=3D INVALID_PERCPU_AREA )
>         return park_offline_cpus ? 0 : -EBUSY;
>
> The same crash can occur on x86 if park_offline_cpus is set
> to 0 during Xen resume.
>
> Fixes: f75780d26b2f ("xen: move per-cpu area management into common code"=
)
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes introduced in V2:
>  - cosmetic fixes after review
>  - chnages in a commit message: add "Fixes"
> ---
>  xen/common/percpu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/xen/common/percpu.c b/xen/common/percpu.c
> index e4e8b7bcab..b20f0460fc 100644
> --- a/xen/common/percpu.c
> +++ b/xen/common/percpu.c
> @@ -30,7 +30,9 @@ static int init_percpu_area(unsigned int cpu)
>      char *p;
>
>      if ( __per_cpu_offset[cpu] !=3D INVALID_PERCPU_AREA )
> -        return park_offline_cpus ? 0 : -EBUSY;
> +        return park_offline_cpus || system_state =3D=3D SYS_STATE_resume
> +            ? 0
> +            : -EBUSY;
>
>      if ( (p =3D alloc_xenheap_pages(PERCPU_ORDER, 0)) =3D=3D NULL )
>          return -ENOMEM;
> --
> 2.43.0
>

