Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D48B9A3EAA
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 14:43:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821852.1235810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1mJv-0003Gr-4i; Fri, 18 Oct 2024 12:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821852.1235810; Fri, 18 Oct 2024 12:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1mJv-0003Dh-1l; Fri, 18 Oct 2024 12:43:07 +0000
Received: by outflank-mailman (input) for mailman id 821852;
 Fri, 18 Oct 2024 12:43:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SHZo=RO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t1mJt-0003Db-Ai
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 12:43:05 +0000
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [2607:f8b0:4864:20::c32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 838e9299-8d4e-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 14:43:03 +0200 (CEST)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-5eb6981dfd4so1077327eaf.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 05:43:03 -0700 (PDT)
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
X-Inumbo-ID: 838e9299-8d4e-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729255382; x=1729860182; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7jhY+MTXbNLwrkLEL0/wm7GDbSFjVkqyXX0cDg5mQA=;
        b=aiwrz42xemRn2Eq3QMDb5O4JOHDrxQqgN+mf6KM3FbSBpoCxUNvVZlmjs+nC6wILzV
         eAB9u19E7eSeHeTZ85H/2yr3IWPe0xiOjIoOjkyQcBNalnjk40dwPZ4j+QKR424XUYBf
         Rpr3wnzzCxpA4aNOdgWhHkehQCp4w+3UKMi08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729255382; x=1729860182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7jhY+MTXbNLwrkLEL0/wm7GDbSFjVkqyXX0cDg5mQA=;
        b=bWpNk374+ZGvpVCzK84soT0lEkB3CfBq2B1v4WH9NFEaoEVg2TdIng5XGrpw1+3h4x
         SSzwV4wq7pZawKAHXyv+O97xuVBD15h79WE4J9DK6VLgFvmSVCHt4qrFoc6gS0lIVFiL
         +ZGD1tEyNiz2DJAoSy1pS/1LU+2J/kogZi+adK18UI+64Uy7osk4gNJlgkMfKbSEhP3u
         hKS/K4vrbU8fI2fA7MhmillIsfDGqUu45gcC5l7JSIOr2t1b1h8RAMMEKyfosNyW5UK4
         6B0XLolxIr+OnctCqZy+x8x3lPalwiffy9cQf/R+ghcLETBKbUExKYOU3SgHVNeQHfAC
         zIFw==
X-Gm-Message-State: AOJu0YyFubinyq4QTDVtW18G6vLDO9AZjmIsIV1Rn+t0Z2TSetCaMAR9
	fAA8pLqKa1NC5NBUagMrHfTmzEqN2pDKm6ssud1pNW4/y/kqtTnSqYAA0h99W6vPmGL5GBVeBE9
	hoGpJNVlWGGJeyXaFI2h/zk4EF2PfCBxvugz4XA==
X-Google-Smtp-Source: AGHT+IE36QNrX5h5DfwiOih3Vytnd0K/5Z+KkG+Pq0mTYnz7BYWb/2XVjpKKJP7SDi7a3e2woQoYYgZPoQSQrTGDSuk=
X-Received: by 2002:a05:6820:822:b0:5e5:7086:ebed with SMTP id
 006d021491bc7-5eb8b6cb95fmr1498354eaf.7.1729255382160; Fri, 18 Oct 2024
 05:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
 <20241017133123.1946204-2-frediano.ziglio@cloud.com> <ZxE0slUwETDK83PD@l14>
In-Reply-To: <ZxE0slUwETDK83PD@l14>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 18 Oct 2024 13:42:51 +0100
Message-ID: <CACHz=ZjCQUKqRbwNPGR8JDVV=Cy07zWisn5G7OgmQiaEBQnpQw@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] x86/boot: create a C bundle for 32 bit boot code
 and use it
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 5:00=E2=80=AFPM Anthony PERARD
<anthony.perard@vates.tech> wrote:
>
> On Thu, Oct 17, 2024 at 02:31:19PM +0100, Frediano Ziglio wrote:
> > +$(obj)/build32.base.lds: AFLAGS-y +=3D -DGAP=3D$(text_gap) -DTEXT_DIFF=
=3D$(text_diff)
> > +$(obj)/build32.offset.lds: AFLAGS-y +=3D -DGAP=3D$(text_gap) -DTEXT_DI=
FF=3D$(text_diff) -DFINAL
>
> I was somehow expecting "base" and "offset" to be the other way around,

That's weird. I mean, the "base" uses a GAP and TEXT_START of 0 while
for "offset" they are not zero adding some offset to the code/data.

> but that's fine. And by the way, -DFINAL cancel changes to GAP and
> TEXT_DIFF ;-).
>

Yes, and potentially the first like added above can be removed. On the
other hand, they are values used for the algorithm despite them being
used in some cases or not.

> But overall, the changes looks nice as is,
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
>
> Thanks,
>
Thanks,

Frediano

