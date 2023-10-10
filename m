Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7517A7C0218
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 18:58:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615127.956343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqG41-00068q-Lh; Tue, 10 Oct 2023 16:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615127.956343; Tue, 10 Oct 2023 16:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqG41-00065U-Ij; Tue, 10 Oct 2023 16:58:33 +0000
Received: by outflank-mailman (input) for mailman id 615127;
 Tue, 10 Oct 2023 16:58:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMDy=FY=cloud.com=marcus.granado@srs-se1.protection.inumbo.net>)
 id 1qqG40-00065O-5e
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 16:58:32 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d44c598-678e-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 18:58:30 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5230a22cfd1so10418511a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Oct 2023 09:58:30 -0700 (PDT)
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
X-Inumbo-ID: 3d44c598-678e-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1696957110; x=1697561910; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCWuW4P+kvBvZNsMJgrMihuH8C66siFFEOKMDJDFNJk=;
        b=SxYdjfstmTTPuLaLF2P30GrsTEqbaHoPKc1KccR6EphfsN7Z4Y9Gu19DNzmUZuvDiB
         bMCh8eAPg3ps7qU9bPiGXWDfBmWwlEVxLFtPBmVQTt4tD/SDn4cRXwxlUG8jzwBrJ3iF
         ZieRk/qif9/r5agmB00lc/RqsI60k/eqyf2UM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696957110; x=1697561910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yCWuW4P+kvBvZNsMJgrMihuH8C66siFFEOKMDJDFNJk=;
        b=uLNe+Dm6N/3JFvoDNlZ1rN3X1PJwvB2oYqz2IVMfq2sZcDbGhksZPGkDJmbjXvcvCv
         p2LCMoK+r65WDxgG3TynozmjYpFPoXY4+5hJ91TmCQicNJkxm2JfLuaaPJvEg2WyjIrL
         yzbTHw6JVu5ZSV4uOqVYq3ghsH06OrHTh4NY69NPbjpPaBUGqeW1TxFymOZi7pYeMhlV
         lfZgquzZPYC1DXkdo14yehc5cAlZ4ZcJ98fyiHYTT1WN9URJ60pi2lUMDaT9xr/CACD/
         E3ORD9l0gqBurVXeCZy5LS0msFDm+7FT6lIwzbdgH1ubxU//4coTYsagbKuxgfpVtzGw
         3rFQ==
X-Gm-Message-State: AOJu0YzpUym2/WIY7eZYP/T0wGyFqUqjJlq/DZP8u8xzZkBHvKBwVj+S
	KwOvy4ZrcQn0W7+P1OxLo1YMb3Aen1oJyN9V2Bd9cA==
X-Google-Smtp-Source: AGHT+IHoclPOSJQGesXQRv8rpbXStvkuzXS6scYqLWHlq7jjSYIyPbCAnFNu2QFoJqZ7g6wfO2EBXqAaUIsBxgpLykY=
X-Received: by 2002:aa7:c302:0:b0:533:97c:8414 with SMTP id
 l2-20020aa7c302000000b00533097c8414mr17750476edq.7.1696957110200; Tue, 10 Oct
 2023 09:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230921122352.2307574-1-george.dunlap@cloud.com>
 <20230921122352.2307574-2-george.dunlap@cloud.com> <CA+zSX=bmb5c3LR4u63kaZCBuMK1tvzLxaw=yenerrsV0=61XVA@mail.gmail.com>
In-Reply-To: <CA+zSX=bmb5c3LR4u63kaZCBuMK1tvzLxaw=yenerrsV0=61XVA@mail.gmail.com>
From: Marcus Granado <marcus.granado@cloud.com>
Date: Tue, 10 Oct 2023 17:58:19 +0100
Message-ID: <CANNkNPJRP_m_G-dEo+rPrXg6EGanLtJhi5NEfSWjeULpUV9sRg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] credit: Don't steal vcpus which have yielded
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 21 Sept 2023 at 15:14, George Dunlap <george.dunlap@cloud.com> wrot=
e:
>
> On Thu, Sep 21, 2023 at 1:23=E2=80=AFPM George Dunlap <george.dunlap@clou=
d.com> wrote:
> >
> > On large systems with many vcpus yielding due to spinlock priority
> > inversion, it's not uncommon for a vcpu to yield its timeslice, only
> > to be immediately stolen by another pcpu looking for higher-priority
> > work.
> >
> > To prevent this:
> >
> > * Keep the YIELD flag until a vcpu is removed from a runqueue
> >
> > * When looking for work to steal, skip vcpus which have yielded
> >
>
> Marcus,
>
> Just wanted to verify my interpretation of the testing you did of this
> patch several months ago:
>
> 1. On the problematic workload, mean execution time for the task under
> heavy load was around 12 seconds
> 2. With only patch 2 of this series (0004 in your tests), mean
> execution time under heavy load was around 5 seconds
> 3. With only patch 1 of this series (0003 in your tests), mean
> execution time under heavy load was around 3 seconds
> 4. With both patch 1 and patch 2 of this series (0003+0004 in your
> tests), mean execution time under heavy load was also around 3 seconds
>
> So both patches independently exhibit an improvement; but the combined
> effect is about the same as the first patch.
>
Yes, thanks for the summary, that's pretty much it.
Marcus

