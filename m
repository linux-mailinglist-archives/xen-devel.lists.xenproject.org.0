Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6B66EF048
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 10:32:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526575.818426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1praZV-0008DJ-7b; Wed, 26 Apr 2023 08:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526575.818426; Wed, 26 Apr 2023 08:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1praZV-0008Af-4y; Wed, 26 Apr 2023 08:32:17 +0000
Received: by outflank-mailman (input) for mailman id 526575;
 Wed, 26 Apr 2023 08:32:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JrF9=AR=tibco.com=tismith@srs-se1.protection.inumbo.net>)
 id 1praZT-0008AX-Fb
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 08:32:15 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7d08984-e40c-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 10:32:13 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2a8c30ac7e3so62768691fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Apr 2023 01:32:13 -0700 (PDT)
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
X-Inumbo-ID: d7d08984-e40c-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibco.com; s=googleworkspace; t=1682497933; x=1685089933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAG+xOASBWEyoJ95L+7VR6/AeiEj+lhH28fE7GiisHI=;
        b=Q2EmAqJ0z7ZZ3JG2zydIs5QSjQ4LZeXZprixf37Xsaq+NayOK+LOFhG3KmEqS9DYGo
         +GaMf0+YaOELAquJwJtIXWsWDuzzuqU0rVdlNwh3D4cKU+MBL42CPOPTkhWn9IE+8jXG
         YX4IxOtsO946q66afTq0TDolBTkt5xBpk9rsK9XhdAwI0Kw/1P0t4XQj+DznxkkMhvAw
         6eiWMl5kPlwkrGdQq9Of5i8M9svZH0IgMrWH+XO/xgGaXPCOIKNAyUZtZjg+1osLvnVZ
         48QS18GtP/p7SO9IbALxMP7nkU5zeR/Fz6f7ETvHiW3R9IQ1sElakKGUbGwTlUs4K+cc
         EGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682497933; x=1685089933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAG+xOASBWEyoJ95L+7VR6/AeiEj+lhH28fE7GiisHI=;
        b=Kf6R5SU+buJN+5TYjDVyvLwJo2e8MDnU6xUfOeuRpH/5GqdL1vNIbaqnqzivo2Nzd5
         PREr7AyGoCsZPjmmcYfV7fIYAe1FmIuMs3a19aGTA0UpEaqi2XOv1hZwtC+ZI8AW8vhT
         oh+Mxxb7dKwMIwbB8+SSZ2jLqYjAsc1xlGQ9rBYqFHdKpAtTUk+5fHxxzyUt2LTzNk8j
         39uG3PqegCBCdf1iKjnKvZjFdjYuIFokciXU0sAF+quHlBAwlzuJrl0lzTyyKEfv7tx3
         f4ckpJjqTLdGZdQRGdsTD4hEVB0DFSXhEksoPUrTbZDqMAkRL21ggoOKy+2BQ040yGf8
         Uw3A==
X-Gm-Message-State: AAQBX9fzdOSDGCKTg5btRfDIYvWDnJ9x7IdU4XSxab+g4iwj+lBpBoNw
	z49nGjF77e2VzE75qVu6z6IcaFlOSljARN6eGsjPGw==
X-Google-Smtp-Source: AKy350a51CbIJJguxBdXXfGOE0FWIwuFtCZZ62Rcqkvukt1rfuPtFG/noW8O+B6X0NzUCMuAN9WyuLoUzwn0/nyDIu4=
X-Received: by 2002:a2e:9d44:0:b0:2aa:43cd:57c9 with SMTP id
 y4-20020a2e9d44000000b002aa43cd57c9mr3541695ljj.36.1682497933062; Wed, 26 Apr
 2023 01:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230420110205.688689-1-mark.syms@citrix.com> <54a37172-cad5-3b27-36fc-3b7768e39df8@xen.org>
 <CAPYKksVtGyfv3TbAjLH1G=N6=pH-pH2-FTX5c3+E5PsOKo2aOQ@mail.gmail.com>
 <CALUK5G5T=8MkxaQxdeid_ypo1e4DJ-zBRAMb7D+dcHkVdJt2tQ@mail.gmail.com> <f1325cdb-9e0f-b955-7041-826fb6c78174@xen.org>
In-Reply-To: <f1325cdb-9e0f-b955-7041-826fb6c78174@xen.org>
From: Tim Smith <tismith@tibco.com>
Date: Wed, 26 Apr 2023 09:32:02 +0100
Message-ID: <CALUK5G4zgRqQrinibOf06vydR1AMwdp=jTvLrC9FWqg385Tw_g@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] xen: Fix SEGV on domain disconnect
To: paul@xen.org
Cc: Mark Syms <mark.syms@cloud.com>, mark.syms@citrix.com, qemu-devel@nongnu.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, 
	xen-devel@lists.xenproject.org, tim.smith@citrix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 24, 2023 at 2:51=E2=80=AFPM Paul Durrant <xadimgnik@gmail.com> =
wrote:
>
> So if you drop the ring drain then this patch should still stop the
> SEGVs, right?
>

I think that's worth a few test runs. I recall some coredumps in that
condition when I was investigating early on, but I don't have them in
my collection so maybe I'm misremembering.

Tim

