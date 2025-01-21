Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70935A17BBE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 11:31:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875337.1285784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBXk-0000ry-G3; Tue, 21 Jan 2025 10:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875337.1285784; Tue, 21 Jan 2025 10:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBXk-0000qJ-DL; Tue, 21 Jan 2025 10:31:36 +0000
Received: by outflank-mailman (input) for mailman id 875337;
 Tue, 21 Jan 2025 10:31:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abyW=UN=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1taBXi-0000qD-NO
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 10:31:34 +0000
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [2607:f8b0:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e22dbf30-d7e2-11ef-a0e4-8be0dac302b0;
 Tue, 21 Jan 2025 11:31:33 +0100 (CET)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3eb9a0a2089so3453943b6e.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 02:31:33 -0800 (PST)
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
X-Inumbo-ID: e22dbf30-d7e2-11ef-a0e4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737455492; x=1738060292; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Co/euGMbvZPpVD/aIJIvyVgoWh6IQMIsE/5p6Qufnrw=;
        b=XKhqt3x8wocvuZz2y6SjY92Vz7axQP7shK+uYWm7uYVludYBGxuQXL1N7OEZbVKxCP
         dCfHjiUUA0wbVTBK9mFFzIWVt8JiPepEz9MR7kSXTjZcpKQ5+XfjgyG3Q6IhAnpycb6n
         FbUd2a7NhiG/K64R/eb+mH24xs3mET++dW6Ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737455492; x=1738060292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Co/euGMbvZPpVD/aIJIvyVgoWh6IQMIsE/5p6Qufnrw=;
        b=nYiRBs+Qh84BvySgkhf2EWIJzixLGHn8ojvgNse3sN/18qQM2xOMGIhpC2x6W09LHt
         pc4dbhShLygp5ZrpG8lpwnkp+oujI0Xc3Bz58ooiLYvEYQ/o3fpcZRV8gcMybVjYs8Gq
         rLPUOB6+ox9+Xvz6SDNnfrALUNkff75d17NzMRsO4hDVkRokC/pF/AsW/G9CT7SjHGQt
         /+UmUVjDmyNwtIWCIXT4Zjya12JIr9wqu9mfWUqBw3GRb2RBltEXmC/vRS+gShiv4SOt
         rfuWjgdoZ8UDgIUCbCoH7oyTbCTmC5/MhqTXdIutHBzbVpWSdkMBnFjzRir71umwQaWS
         KqPA==
X-Gm-Message-State: AOJu0Yw4RwZKxz1fGki8pyLpNorv1N1B6swlu2vM0Di30Nav6mtXHfks
	caJPkLcXMNenOuAvYbOibnnttVb9b5Jo26AIheYOcEO4xVbX+hAA1ksDa3svD/m1NPxST0ISvaA
	Y95N/m8U13KeVm4LZ9NKvHP1IScisrQ+4oY4o
X-Gm-Gg: ASbGncuNIcu1Sg251G2t1FCTqm9p4R6Jl9X2Apxp2nX613ub0J7896b40HQYz2bEEIo
	JOKuEN73LaVOsqoQ4fGNYo/U2OQlU7sMkTsJ7eVqF8u7h0iBCFQ==
X-Google-Smtp-Source: AGHT+IHJJeR3bTH+6yG7GcYJ41sMdptddoz50cPKVxfRUbydK8XPGTonJf67eHUGaXvh0dxCojFNcGmp1LgIN+3d+vU=
X-Received: by 2002:a05:6871:4109:b0:29e:5aa6:2bb3 with SMTP id
 586e51a60fabf-2b1c084189emr8856779fac.1.1737455492389; Tue, 21 Jan 2025
 02:31:32 -0800 (PST)
MIME-Version: 1.0
References: <20241107151509.73621-1-roger.pau@citrix.com> <20241107151509.73621-3-roger.pau@citrix.com>
In-Reply-To: <20241107151509.73621-3-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Tue, 21 Jan 2025 10:31:21 +0000
X-Gm-Features: AbW1kvZpheZcKA8ggw7-07Zc_w8xthUpQCacK9Es59eCiULPTl_T1kTEqDxx9jE
Message-ID: <CAG7k0Erg1vuVrPgg8XvY_qcQFjKYXGu35c70CMucMSj=7ajpkw@mail.gmail.com>
Subject: Re: [PATCH 2/4] create-diff-object: update default alt_instr size
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 3:15=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.co=
m> wrote:
>
> The size of the alt_instr structure in Xen is 14 instead of 12 bytes, adj=
ust
> it.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  create-diff-object.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/create-diff-object.c b/create-diff-object.c
> index fed360a9aa68..d8a2afbf2774 100644
> --- a/create-diff-object.c
> +++ b/create-diff-object.c
> @@ -1000,7 +1000,7 @@ static int altinstructions_group_size(struct kpatch=
_elf *kelf, int offset)
>         char *str;
>         if (!size) {
>                 str =3D getenv("ALT_STRUCT_SIZE");
> -               size =3D str ? atoi(str) : 12;
> +               size =3D str ? atoi(str) : 14;
>         }
>
>         log_debug("altinstr_size=3D%d\n", size);
> --
> 2.46.0
>

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

