Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E544A38A12
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 17:52:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890726.1299861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk4MU-0004ot-ND; Mon, 17 Feb 2025 16:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890726.1299861; Mon, 17 Feb 2025 16:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk4MU-0004mL-Kd; Mon, 17 Feb 2025 16:52:50 +0000
Received: by outflank-mailman (input) for mailman id 890726;
 Mon, 17 Feb 2025 16:52:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IPKs=VI=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tk4MT-0004mD-Q5
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 16:52:49 +0000
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [2001:4860:4864:20::33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d68a85e-ed4f-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 17:52:47 +0100 (CET)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-2bcceee7a5eso587478fac.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 08:52:47 -0800 (PST)
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
X-Inumbo-ID: 9d68a85e-ed4f-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1739811166; x=1740415966; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWcTbyJ0tsdDP+JvjwiHvS1z30Z5ks7poUV0LuDeRUo=;
        b=Cxh71EJ73QGT9MS/Q17Lril8lcBWQ8DzoC+9b1MqulE8jcjYVC61Ri3m+TYCLDYtT1
         e+xgEuRaSJqeZ2knzvkBDQ/XJHzvDwMCNmpzryXABIBD4bYEk9c0PfvuuUbcpXnwj08/
         rsHCnS7JwdDY2NqssrvObXreQlL8BLXzl9b/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739811166; x=1740415966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWcTbyJ0tsdDP+JvjwiHvS1z30Z5ks7poUV0LuDeRUo=;
        b=TJ9vv30FGowIYplSE9T4Nm7UCJEBqWsRYeAxpun96fTHf+GpefK57p3EQ0jJcf0eGu
         kosCWA4oHiaDftIa9/gJp7nKDYPx0PrC4JjSyP4p1kJdvtyYGmlA+W2/uKht+gkS7oe4
         Ck52Xv+K9G9+FDdLOT3KkDo5GgRy/eYruockgbxWHqSm5RjPR+khERrs0x7BPVQL88c/
         IEbwn/EZj01RmoowajMJCXht39TzwzAlQGuY1BaRb15D2S9iYNvr/uNy1lgmTClc/0Fh
         NAByS3/0SMwFT9m7hvE9Vzqu1BWlb/BcJpq10SRWfw501OeCWRQh2N+9Q/eIzR0HVwIe
         ZhSg==
X-Forwarded-Encrypted: i=1; AJvYcCWiEARHUQ7xke+nctRp/6+AcvUfatfqNdYlUSYHTH3GsqP6oZvAv05uXELovLx6KIYAWRZV1/7KFHc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw17DmlY2rqUBROcKAvzaTx8+A78QQh9dsGEjiJV+omXz+R9GtY
	e1Hjh1QTAH3j8YF1GeK81Rpa1be7+I3+RcCSD+9Ur0jMWjVGqaddFsA6660pCxxb9UGokgmBpZ0
	wxfjG5XuhOFwfopP8t5C+Zp1hO9HEPOvfiQ9bgg==
X-Gm-Gg: ASbGnct6B30V/1wI5wsZ7r9i9lZepK+J1DiXbeDL+udtTUTe4NMZTBKIxvBEtm+WAMQ
	3dm7Ztce0y3fR/ba3JJEGp4XmdLcSv5W9bsL4H+f1J5KVqYff8P6tmDS52drbMDJMBlDtpII=
X-Google-Smtp-Source: AGHT+IGa6s1P7cSlZ9B03hqKpW/IcoZP+3tpBpFfTIPWthetUGQf2g1t39Mehr9FaPWTsLx5KGAVmp4aGyvQbbGiOYU=
X-Received: by 2002:a05:6870:8a0c:b0:29f:b1d4:7710 with SMTP id
 586e51a60fabf-2bc99d3fba2mr6051637fac.24.1739811166571; Mon, 17 Feb 2025
 08:52:46 -0800 (PST)
MIME-Version: 1.0
References: <20250217162659.151232-1-frediano.ziglio@cloud.com>
 <77eb149c-bb1e-4f77-85ba-c44b173a5c1e@suse.com> <ddfee078-409e-4253-9d51-b2f512b41e63@citrix.com>
In-Reply-To: <ddfee078-409e-4253-9d51-b2f512b41e63@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 17 Feb 2025 16:52:35 +0000
X-Gm-Features: AWEUYZni2cdBDGEHDwMCF5odVOzC6rp6pjSjOx376T5VL_Xy1my5qPhyf5eCNMA
Message-ID: <CACHz=ZhuOL3Le=+y0zFRaWBDEdLO_faLKZ83072Z0e88wZMpPw@mail.gmail.com>
Subject: Re: [PATCH v6] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2025 at 4:41=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 17/02/2025 4:31 pm, Jan Beulich wrote:
> > On 17.02.2025 17:26, Frediano Ziglio wrote:
> >> --- a/xen/common/efi/efi-common.mk
> >> +++ b/xen/common/efi/efi-common.mk
> >> @@ -2,6 +2,7 @@ EFIOBJ-y :=3D boot.init.o pe.init.o ebmalloc.o runtime=
.o
> >>  EFIOBJ-$(CONFIG_COMPAT) +=3D compat.o
> >>
> >>  CFLAGS-y +=3D -fshort-wchar
> >> +CFLAGS-y +=3D -fno-jump-tables
> >>  CFLAGS-y +=3D -iquote $(srctree)/common/efi
> >>  CFLAGS-y +=3D -iquote $(srcdir)
> > Do source files other than boot.c really need this? Do any other files =
outside
> > of efi/ maybe also need this (iirc this point was made along with the v=
5 comment
> > you got)?
>
> Every TU reachable from efi_multiboot2() needs this, because all of
> those have logic executed at an incorrect virtual address.
>
> ~Andrew

I assume all the files in efi directory will deal with EFI boot so
it's good to have the option enabled for the files inside the
directory. The only exception seems runtime.c file.
About external dependencies not sure how to detect them (beside
looking at all symbols).

Frediano

