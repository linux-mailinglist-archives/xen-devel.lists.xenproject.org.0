Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2561D85F591
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 11:23:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684311.1064073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd6Dx-0006TG-Rn; Thu, 22 Feb 2024 10:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684311.1064073; Thu, 22 Feb 2024 10:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd6Dx-0006Rk-P2; Thu, 22 Feb 2024 10:22:41 +0000
Received: by outflank-mailman (input) for mailman id 684311;
 Thu, 22 Feb 2024 10:22:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E4eK=J7=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rd6Dw-0006Re-TL
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 10:22:40 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dd335ab-d16c-11ee-98f5-efadbce2ee36;
 Thu, 22 Feb 2024 11:22:38 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d180d6bd32so88656451fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 02:22:38 -0800 (PST)
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
X-Inumbo-ID: 4dd335ab-d16c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708597358; x=1709202158; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPki2FRl4cYglDmI6UvFuJHMZb7WqNcD7CgJmC/747Q=;
        b=ajMxWy0/nAdJ5MwEK/lrxmmB04334eDKMtWvuglVogCReqDKAVax5qhCel2HT1Knvx
         TPb8hjFaTXsmKVZ0oa5Jbrwr5irpWR1jlqq0gb+rynPeGkfwZFausUqYTFIqtdAin7CG
         voHP8AMzjsJYjuoFp1Lh3E0sIY//1sJf8XcmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708597358; x=1709202158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPki2FRl4cYglDmI6UvFuJHMZb7WqNcD7CgJmC/747Q=;
        b=pZjM4PoFMInrhhQvMBPf++CAYlyl6abVGzLA6Ngb+hIOfyakWGgihVxFD2yb+m/AOk
         G9nmV3C0/p6yWBtod9PuD4iGwSLSjTr6j/ge3U2TeG5RrhamCO1PD+aJ6vtTrpct9gN1
         SbbjPAmEPvXGeIygkIA2YkAIKublmpIfR0QhqGkkhgu1y5AKXWwpJClVbjIGDdyAEFrD
         uUPFQAAXkJb22I0j5OZrjdmLARXsX7yYGzd1vifl6YBYVB+juaNXqg0t+bQ3OsZvWosp
         es8ZQFwBOOoCXsKCE9nzfqP4f/McSh+5qz36vwZyvU6oex5jOVRWqkMJhapPJGr3Kujo
         A1MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbitw97yhuQrVlyiEjlQX9Gzk6bn/WhQea2G1q/bLzKdrHnqfJmXLU5tg2PqV4Uz8eFyyji7xlZFp8v2YJO0awtGdmHk8T5AqlDxAE1sg=
X-Gm-Message-State: AOJu0YxateENTBxNBtUgzMaDpMmaMxhdvliRrHC50/w+8qmoSycwp6gR
	gRLa9yepBYfSNMylT3TRKs5vR+xdl43X0/k1wnh4+SbWlg68qjsR0QGtOiIeIO1cod5dOb6ZouW
	Y/SdOip8R+p1wcZPdeHuLF2E4KLE26uoxMe5r8mU6BzckhxCR
X-Google-Smtp-Source: AGHT+IHu9b79I7PtKnmK849UopJkbaTTyB6PvraeFfpanfMU6TlvwcJR/7+mqaHZmK7LgiEkgV5LmkKlMliFbxgWkC8=
X-Received: by 2002:a2e:b70e:0:b0:2d2:3e9c:18db with SMTP id
 j14-20020a2eb70e000000b002d23e9c18dbmr6999960ljo.14.1708597358331; Thu, 22
 Feb 2024 02:22:38 -0800 (PST)
MIME-Version: 1.0
References: <osstest-184722-mainreport@xen.org> <6d6646ce-be79-4d7c-bca6-0d44262d30b5@suse.com>
In-Reply-To: <6d6646ce-be79-4d7c-bca6-0d44262d30b5@suse.com>
From: Anthony PERARD <anthony.perard@cloud.com>
Date: Thu, 22 Feb 2024 10:22:27 +0000
Message-ID: <CAKoJhMRdZ1mJucuHOdBfM1VvpaQFjcEEtEBZzfjUXaD6Hcv0YQ@mail.gmail.com>
Subject: Re: [linux-linus test] 184722: regressions - FAIL
To: Juergen Gross <jgross@suse.com>
Cc: osstest service owner <osstest-admin@xenproject.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 8:28=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >   build-arm64-pvops             6 kernel-build   fail in 184721 REGR. v=
s. 184719
>
> Log says:
>
> gcc: internal compiler error: Segmentation fault signal terminated progra=
m cc1
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <file:///usr/share/doc/gcc-8/README.Bugs> for instructions.
> make[5]: *** [scripts/Makefile.build:243: drivers/iio/adc/max9611.o] Erro=
r 4
> make[5]: *** Waiting for unfinished jobs....

Yeah, that happens from time to time. My plan to fix this is to
upgrade to a newer version of Debian, it just takes time.

Cheers,

--=20
Anthony PERARD

