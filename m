Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB419315CB
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 15:30:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758887.1168409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTLmD-0000e3-OA; Mon, 15 Jul 2024 13:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758887.1168409; Mon, 15 Jul 2024 13:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTLmD-0000b1-LE; Mon, 15 Jul 2024 13:30:01 +0000
Received: by outflank-mailman (input) for mailman id 758887;
 Mon, 15 Jul 2024 13:29:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/7M=OP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sTLmB-0000Ys-SN
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 13:29:59 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54f5489a-42ae-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 15:29:59 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a77cc44f8aaso242917666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 06:29:59 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59b26f61f62sm3350924a12.82.2024.07.15.06.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 06:29:57 -0700 (PDT)
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
X-Inumbo-ID: 54f5489a-42ae-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721050198; x=1721654998; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BwdOuYXhYyq01hfQeUAROIU2sYwv+dhNfF6a540e6Ew=;
        b=mr52ZaCA6cXyUidtsgp3Ycqeabf2/QuGKBhKmM5dFsk0ZbZ/77scxJtRoGTr31mEVv
         1QVYUDE+SerTdWel1ZGquWjImsS2g7DnJaW2IgvI2V7mVtUlPt5BNUd/fTS0jB5TGdJ9
         a5qp9PZZT2uxE5meEQG4p8A/ToLU1JQJ3+ZlAqpTensoYiww5mYLjqog8NM8UOwUsMYm
         5Wph35vTJyL6heTWnS2X8mXUriw2pRLP+LH0OJS2xsonxI0NdT6pffQk6bae8f4gv42B
         OuuinaMoX6vIQ/ZFq5dqoPITOhpmzFtetCAKa13NmjbvPuhkJrcByBQJFNE2CZlI0TWm
         CqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721050198; x=1721654998;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BwdOuYXhYyq01hfQeUAROIU2sYwv+dhNfF6a540e6Ew=;
        b=fO3nTnIcuG9CQs0l9HuGW5GWv9jmcXZrtKG3xuorSGPo4UOE4SiS3Zqrw4brxWs80T
         o0iHeIdd9X6KkIpXa3B9JmxdUGvfmLokgMbA1S7W4eKRrEJalyCicyvloGw9wKmFO4Y9
         Lirf9R0yhgGB4onbo5EXv2Y6qnwgoa+Eb3eccEK5MXWba4kEPsiojnBu2eHoxQChn90V
         O/iuC/1zZWptZkLW9bUy+qnXLhnOu5EPXVsA4+T0VVPGibMcvTZQLNvExgNtYwy2ZwZF
         HkFIo+W8uoC2CMoWmqJonoPuspekfrBaGbsYvD5RSgR87RzaKMdeh2+OdclB/WUkQIek
         IQmg==
X-Forwarded-Encrypted: i=1; AJvYcCX0wlsgWfmReQqpUVOE8kOCTO8Ml9Wt+GAl3ZW+0IWaQs3hFwRLW49//CMfkQ9RPhkvmXR+xgSLOa5fRi/o/oDqsKrAHMmotIMe1sV6VN0=
X-Gm-Message-State: AOJu0YzHj43W89nCtemcFtUTc0bQCW/8PSxyG9l1PqdhBFEG4bFmdmKU
	02znHiVT56OWWZlKKk6qbAqx30HqoPMbSwDnM5ugTjuIUYF7a0Ea
X-Google-Smtp-Source: AGHT+IHkiaf/+hDlY3F6mc6cPg3gLRyQRbSUiKh0LYNJqitdfjPp2Hg2X5jQkNcmmEcn/CpBnpLLXg==
X-Received: by 2002:a05:6402:348c:b0:58f:2087:7983 with SMTP id 4fb4d7f45d1cf-594bcba842bmr16677605a12.40.1721050198096;
        Mon, 15 Jul 2024 06:29:58 -0700 (PDT)
Message-ID: <433345965599d1db98e3fb0023777269cf24184f.camel@gmail.com>
Subject: Re: [PATCH 10/12] CI: Introduce debian:11/12-riscv64 containers
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
 <jgross@suse.com>,  Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Shawn Anastasio
 <sanastasio@raptorengineering.com>
Date: Mon, 15 Jul 2024 15:29:56 +0200
In-Reply-To: <0c03dff1-e68c-4660-b2cb-471958708daa@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
	 <20240711111517.3064810-11-andrew.cooper3@citrix.com>
	 <1b6c7e57ea331d3ea9aeea7fafc9a0733f6e9147.camel@gmail.com>
	 <0c03dff1-e68c-4660-b2cb-471958708daa@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-07-12 at 13:30 +0100, Andrew Cooper wrote:
> On 12/07/2024 12:39 pm, Oleksii wrote:
> > On Thu, 2024-07-11 at 12:15 +0100, Andrew Cooper wrote:
> > > For starters, they're slightly smaller:
> > >=20
> > > =C2=A0 $ docker image list <snip>
> > > =C2=A0 registry.gitlab.com/xen-project/xen/debian=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 12-
> > > riscv64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > 772MB
> > > =C2=A0 registry.gitlab.com/xen-project/xen/debian=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 11-
> > > riscv64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > 422MB
> > Do we really need both 11-riscv64 and 12-riscv64?
>=20
> Need? No, not strictly.
>=20
> Want? Yes, absolutely.
>=20
> You always want at least 2 different toolchains worth of testing, or
> what you will find happens is that you end up accidentally depending
> on
> a quirk of the single compiler your using, and that you discover this
> at
> some point in the future, rather than now(ish) when CI says no.
>=20
> At the moment, the RISC-V builds are very trivial and quick, so it
> makes
> a lot of sense to have a second toolchain.=C2=A0 Before too much longer,
> you'll want to get Clang working too.
Agree, I should consider to add Clang. I will do that in the one of my
nearest patch series.

~ Oleksii

