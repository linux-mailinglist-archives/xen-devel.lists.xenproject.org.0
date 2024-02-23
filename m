Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0C2860F55
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 11:31:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684762.1064855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdSpV-0004Oc-Jy; Fri, 23 Feb 2024 10:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684762.1064855; Fri, 23 Feb 2024 10:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdSpV-0004Mn-G9; Fri, 23 Feb 2024 10:30:57 +0000
Received: by outflank-mailman (input) for mailman id 684762;
 Fri, 23 Feb 2024 10:30:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8H=KA=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rdSpU-0004Mg-B7
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 10:30:56 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a010a0bc-d236-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 11:30:55 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-412897a2f9eso4166575e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 02:30:55 -0800 (PST)
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
X-Inumbo-ID: a010a0bc-d236-11ee-8a57-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708684255; x=1709289055; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCWjiNDCj+h0MsE3wlX/EEpGpaYvh60VyHnAyqQMKss=;
        b=XkjPUMagFFkeNpj5kgPK1kQf4x4DrRSbmf+ry8JqPryxuzpisxd5VSI1l6R+e1Hk+J
         +1dzBgv0ZMq56ifEwzQCuF/ratjsoAgFmX3mjBsDZ0ZcVYY+l/zimmYlvBgYbGCKPT7G
         lEUau1fDrqnXA28AtaJ6BjQNmBk0bKnGlV1Uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708684255; x=1709289055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCWjiNDCj+h0MsE3wlX/EEpGpaYvh60VyHnAyqQMKss=;
        b=YSPq/gvNJs1aewL8R+OM/Jz3uurz/6g/cClZa89LafXULP7XdwjgOX/O+EZip9i034
         O0hQpTxRoJjX7kzl3rrs8qcfBq4whsEX5lzAEnRIheSW7HHR7X4z6CI+Lik9ji88H+z5
         6Ia0h84Dt7VB9zNAEBnDjV3JfqMaRbimFT253jZZ+idlk2uLHgG3GZZUMT5nx4vwVwTh
         LU/ZBSCwccq6x05e1w/TNAs0O7QWvvGL5EMNQFnZLTo1OgafH6QxiPglIxdf1Q421l6M
         aQM44F0FqAKscy3Mu0VzxFI2zSd6vKgy5IuiFcglskEvZcEe3LYGslxdBeD1M7V2glIo
         KWSA==
X-Gm-Message-State: AOJu0Yz6kP0wQ8R/sob4beqkQj5CN9s7ySSDjpP5X67MbulqLwPc1sVA
	JbwqXdIw9oduNWy3TF157JgKaiI8/LipRCuGwvj9P1Iw0qKUeyeqK65PuzNQ3nOfXRH4AbBSK+v
	z1qUav0GMZaba7/j6FJqKj04rI6PLYwDZf941
X-Google-Smtp-Source: AGHT+IEmeol1KnsaUNNTUhza2l7R+0Xs3TeLmYz3KnK0XbgAo78Pwom1mSXIosnMJPZ59Dsros5Na5Eyw/EYAiIiFSw=
X-Received: by 2002:a05:600c:3ca6:b0:411:c8a7:7b09 with SMTP id
 bg38-20020a05600c3ca600b00411c8a77b09mr1353538wmb.10.1708684254679; Fri, 23
 Feb 2024 02:30:54 -0800 (PST)
MIME-Version: 1.0
References: <20231130142944.46322-1-roger.pau@citrix.com> <20231130142944.46322-6-roger.pau@citrix.com>
In-Reply-To: <20231130142944.46322-6-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Fri, 23 Feb 2024 10:30:43 +0000
Message-ID: <CAG7k0EpCJ9h=d4VF8GycrmxbVRQwT+=bB0GfPE_R=dcFRh7uBQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] xen/livepatch: properly build the noapply and
 norevert tests
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 2:31=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> It seems the build variables for those tests where copy-pasted from
> xen_action_hooks_marker-objs and not adjusted to use the correct source f=
iles.
>
> Fixes: 6047104c3ccc ('livepatch: Add per-function applied/reverted state =
tracking marker')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/test/livepatch/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/xen/test/livepatch/Makefile b/xen/test/livepatch/Makefile
> index c258ab0b5940..d987a8367f15 100644
> --- a/xen/test/livepatch/Makefile
> +++ b/xen/test/livepatch/Makefile
> @@ -118,12 +118,12 @@ xen_action_hooks_marker-objs :=3D xen_action_hooks_=
marker.o xen_hello_world_func.o
>  $(obj)/xen_action_hooks_noapply.o: $(obj)/config.h
>
>  extra-y +=3D xen_action_hooks_noapply.livepatch
> -xen_action_hooks_noapply-objs :=3D xen_action_hooks_marker.o xen_hello_w=
orld_func.o note.o xen_note.o
> +xen_action_hooks_noapply-objs :=3D xen_action_hooks_noapply.o xen_hello_=
world_func.o note.o xen_note.o
>
>  $(obj)/xen_action_hooks_norevert.o: $(obj)/config.h
>
>  extra-y +=3D xen_action_hooks_norevert.livepatch
> -xen_action_hooks_norevert-objs :=3D xen_action_hooks_marker.o xen_hello_=
world_func.o note.o xen_note.o
> +xen_action_hooks_norevert-objs :=3D xen_action_hooks_norevert.o xen_hell=
o_world_func.o note.o xen_note.o
>
>  EXPECT_BYTES_COUNT :=3D 8
>  CODE_GET_EXPECT=3D$(shell $(OBJDUMP) -d --insn-width=3D1 $(1) | sed -n -=
e '/<'$(2)'>:$$/,/^$$/ p' | tail -n +2 | head -n $(EXPECT_BYTES_COUNT) | aw=
k '{$$0=3D$$2; printf "%s", substr($$0,length-1)}' | sed 's/.\{2\}/0x&,/g' =
| sed 's/^/{/;s/,$$/}/g')
> --

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

