Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0F6914DC1
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 14:53:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746585.1153686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLjCL-0005r7-Fu; Mon, 24 Jun 2024 12:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746585.1153686; Mon, 24 Jun 2024 12:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLjCL-0005ot-Cj; Mon, 24 Jun 2024 12:53:29 +0000
Received: by outflank-mailman (input) for mailman id 746585;
 Mon, 24 Jun 2024 12:53:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xeV4=N2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sLjCK-0005on-4B
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 12:53:28 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf9e44ef-3228-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 14:53:27 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a72420e84feso218399266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 05:53:27 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7252a1a659sm123973266b.58.2024.06.24.05.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 05:53:25 -0700 (PDT)
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
X-Inumbo-ID: bf9e44ef-3228-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719233606; x=1719838406; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wXz95UoQ4ZT3JzRnjHnCYO8MDAQCCR9EPtoEcbcbnZM=;
        b=VF/SQqX7OlL7mv6lrGlZrXk+oM5KM4ZQqA5FcNdEEJH2HW166Rvne3xffq6jnUmrLG
         7WupfR4LcnW9WhQ9Aj+0fXnpiEMMP5TOnyjfklFiFqfFeihAriM9z/w003Vn5Aa3HAec
         tcIYU2eV6b8wKfl43088gQNpHZYaO8akd39Pev3kUYQXHpNeOrVFj4nMcu6i55x/nyXi
         RyW03A3wRAvjgfgAsM+qN/ZTKorNJKLz9UK/daBdEEquE3p13hhU7DF2VuzSJ8Ats5hG
         1nGI2nPrV3qlwQ2hti37wcC7BvwYZXI14ZZME6FvptBhSOW5OPX+Nq94pXaH/PF3SoI8
         gZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719233606; x=1719838406;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXz95UoQ4ZT3JzRnjHnCYO8MDAQCCR9EPtoEcbcbnZM=;
        b=WeCiwg+tcf4sushmNemvZ0AbkwEY8dDPUnq+loJOZez2sxz1+052AMoVsyR28Z0NzC
         Q5tckG8fIISbe3mAwgZupbiWdgF877MlOlu89MrVvVeYyNBO8FuNlzCW0HpJGF4bzyka
         TidjN2XMyCVy2jBJnJe7AbuD8ULT3yQD9oBUTW2Zc13PqdKem8nKTwsAYFfGyNmV+NP5
         yP55Lvb4SN/l53AbzQnsRmSYTptUZGtzxz3p0QeF3VynL35Sd2oE0kLnmrDiKFCBvgii
         i0qQ98i8HIMhm6FYaeDeTa7AsZ5ZaevOQusCYdzrZQgvU44Dv5cARIehWuEq88y7myAF
         jwIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8+ktIo+rhKLLnPbvbQb7dd3FrIVZlemEVbsAomOmkcGR4jLmUztz1NBMelNO364MPu2t1Fm8NroVc/XSGLuvhx8biZWiSiXEhL+aISPQ=
X-Gm-Message-State: AOJu0YzRqt/972y21akVx9ZWJVT/RHDHud3Fgw50pXx/pBEQwPRUW8rk
	HX63e+vt5sDEvCcgqVmvMfIqVjsWoQbGY5qJcLtnsQ7ik8k/zy26
X-Google-Smtp-Source: AGHT+IEubtp+ZXHHgFRvwddiCQXljp83TvnqEjraB3ZmVt7siu2rdIQPFVprQFhL4yt7KM/USDRv5A==
X-Received: by 2002:a17:906:19c4:b0:a6f:d423:23d with SMTP id a640c23a62f3a-a7245c80bd3mr330381366b.57.1719233606147;
        Mon, 24 Jun 2024 05:53:26 -0700 (PDT)
Message-ID: <365f48a0dba602131708bee3b20a16945508aa44.camel@gmail.com>
Subject: Re: [PATCH for-4.19 1/2] CHANGELOG.md: Fix indentation of "Removed"
 section
From: Oleksii <oleksii.kurochko@gmail.com>
To: George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>
Date: Mon, 24 Jun 2024 14:53:25 +0200
In-Reply-To: <20240624090411.1867850-1-george.dunlap@cloud.com>
References: <20240624090411.1867850-1-george.dunlap@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-06-24 at 10:04 +0100, George Dunlap wrote:
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
> ---
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Community Manager <community.manager@xenproject.org>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

> ---
> =C2=A0CHANGELOG.md | 12 ++++++------
> =C2=A01 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 1778419cae..f3c6c7954f 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -31,12 +31,12 @@ The format is based on [Keep a
> Changelog](https://keepachangelog.com/en/1.0.0/)
> =C2=A0 - libxl support for backendtype=3Dtap with tapback.
> =C2=A0
> =C2=A0### Removed
> -- caml-stubdom.=C2=A0 It hasn't built since 2014, was pinned to Ocaml
> 4.02, and has
> -=C2=A0 been superseded by the MirageOS/SOLO5 projects.
> -- /usr/bin/pygrub symlink.=C2=A0 This was deprecated in Xen 4.2 (2012)
> but left for
> -=C2=A0 compatibility reasons.=C2=A0 VMs configured with
> bootloader=3D"/usr/bin/pygrub"
> -=C2=A0 should be updated to just bootloader=3D"pygrub".
> -- The Xen gdbstub on x86.
> + - caml-stubdom.=C2=A0 It hasn't built since 2014, was pinned to Ocaml
> 4.02, and has
> +=C2=A0=C2=A0 been superseded by the MirageOS/SOLO5 projects.
> + - /usr/bin/pygrub symlink.=C2=A0 This was deprecated in Xen 4.2 (2012)
> but left for
> +=C2=A0=C2=A0 compatibility reasons.=C2=A0 VMs configured with
> bootloader=3D"/usr/bin/pygrub"
> +=C2=A0=C2=A0 should be updated to just bootloader=3D"pygrub".
> + - The Xen gdbstub on x86.
> =C2=A0
> =C2=A0##
> [4.18.0](https://xenbits.xenproject.org/gitweb/?p=3Dxen.git;a=3Dshortlog;
> h=3DRELEASE-4.18.0) - 2023-11-16
> =C2=A0


