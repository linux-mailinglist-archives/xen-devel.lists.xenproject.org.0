Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 720636EF58A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 15:32:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526706.818596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prfFX-0005TW-1R; Wed, 26 Apr 2023 13:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526706.818596; Wed, 26 Apr 2023 13:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prfFW-0005RI-V1; Wed, 26 Apr 2023 13:31:58 +0000
Received: by outflank-mailman (input) for mailman id 526706;
 Wed, 26 Apr 2023 13:31:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+pP=AR=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1prfFV-0005RC-T4
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 13:31:57 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6e5dc1a-e436-11ed-b224-6b7b168915f2;
 Wed, 26 Apr 2023 15:31:56 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5051abd03a7so10565120a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Apr 2023 06:31:56 -0700 (PDT)
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
X-Inumbo-ID: b6e5dc1a-e436-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682515916; x=1685107916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh9Vbgenoi7pBVLRqb4wkaa7EhG9aGhaNmdC+ps2G/Y=;
        b=Kk7+jCJIkUEbJkRkR3E1eeZE+I20yrjDxznKEa9Tl2blPOG+GKfapp1YFG7pcFXHP1
         PfvLRbYmEK9Lvz7x1iHP7qfTtiK7esHuBIEcdS9Fuzp+YgUVG0flY0EdCTaRdU+rlYTZ
         zRJvnt32lhsHxCbMrYjrQRjp/V2MMkWYQIx3AZuXkJjvXh6y+9ZQsZ3RspJoQ4xxHxEt
         31UqMQ2EtgQU/DGGbkriaPVgi6ndvpLJgBPqKj+976dBkyDqtAKK0oFtRdFs2w72xakI
         ESY6OOJWgQti2QzsqSyP2Sjl52/WesvxEPCd317wpiCMMTKrnDWJ+LR4cQYMM6dsuGI9
         lkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682515916; x=1685107916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vh9Vbgenoi7pBVLRqb4wkaa7EhG9aGhaNmdC+ps2G/Y=;
        b=ApgZiUjOgDiWSjQJ7KPye6IVlDSzsYrCkzah5gDgX5fKgy1jjxAa3QnHvGQud8E7o+
         cZYN/lAP+42aANmnILN4+I9i4nMiRzRenYzbekLh+/7mJTNWrorJqIFKQQm2qYLwG0Ee
         o4yZuk3AzcU1lfdUAp7MWB3lfJMalXBYu9f4sfWkNapYDOnOI8DkuNoSJiHndyF0L7oq
         6QN9bZT+trX4sL3B+N25SSBHiryyrQSyIylaRZRxP+y6vi17lnvLUioU+bf964pKoaB9
         gUDAjfMHvCdbQAsaVArBk50TRoVjdGlPkyNmaKnQlhcecOSA5octlpCbDtHg8KhQrA2A
         4G6Q==
X-Gm-Message-State: AAQBX9fhn0n6ZfcLRYWVOoyq5F3gN9CTn1DaB8T3ab/PjT7468bwSNpg
	fXSYVWuRyf57athYRNnBSuWTb4nbdV8uHqN3DFM=
X-Google-Smtp-Source: AKy350Y+1ij1zZ0w9hJ+OQ3tF/S3KJ/LT5RS12kvUNPvfxUf5h11+Kh/EuhdiSyQzTflDId9aUjyQSV6Xk+/vP7nicQ=
X-Received: by 2002:aa7:da41:0:b0:505:4391:398 with SMTP id
 w1-20020aa7da41000000b0050543910398mr19234209eds.33.1682515916052; Wed, 26
 Apr 2023 06:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230425194622.114869-1-jandryuk@gmail.com> <20230426091533.68324d8d.olaf@aepfle.de>
 <650a7f6e-be82-0312-05f2-bb69e51e828d@suse.com> <20230426104754.78845a19.olaf@aepfle.de>
 <9dfb4f01-979e-e225-214e-34ddb51a9199@suse.com> <20230426124051.24c2a9a6.olaf@aepfle.de>
In-Reply-To: <20230426124051.24c2a9a6.olaf@aepfle.de>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 26 Apr 2023 09:31:44 -0400
Message-ID: <CAKf6xpt-h7sMjznhbn1RvdT_kn1iri5oXq+_ugjWib6YyuCx+w@mail.gmail.com>
Subject: Re: [PATCH] Fix install.sh for systemd
To: Olaf Hering <olaf@aepfle.de>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 26, 2023 at 6:40=E2=80=AFAM Olaf Hering <olaf@aepfle.de> wrote:
>
> Wed, 26 Apr 2023 11:07:17 +0200 Jan Beulich <jbeulich@suse.com>:
>
> > On 26.04.2023 10:47, Olaf Hering wrote:
> > > XEN_RUN_DIR and most likely also XEN_RUN_STORED have to be removed fr=
om make install.
> > ... this suggests to me that you really mean the change doesn't go far
> > enough, but that's then different from nack-ing a change. Can you pleas=
e
> > clarify this for me (and maybe also for Jason, depending on how he has
> > read your replies)?
>
> I think the change should look like this, the runtime directories have to=
 be created at runtime.

Thanks, Olaf.  Yes, I think your approach is better.  Will you submit
it as a formal patch?  I'm happy to test it.

> --- a/tools/hotplug/Linux/init.d/xendriverdomain.in
> +++ b/tools/hotplug/Linux/init.d/xendriverdomain.in
> @@ -49,6 +49,7 @@ fi
>
>  do_start () {
>         echo Starting xl devd...
> +       mkdir -m700 -p ${XEN_RUN_DIR}

This one should be "@XEN_RUN_DIR@"?

Thanks,
Jason

