Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D01E9B51CF
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 19:30:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827843.1242589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qya-0005Vv-E7; Tue, 29 Oct 2024 18:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827843.1242589; Tue, 29 Oct 2024 18:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qya-0005Ts-BH; Tue, 29 Oct 2024 18:29:56 +0000
Received: by outflank-mailman (input) for mailman id 827843;
 Tue, 29 Oct 2024 18:29:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mpqm=RZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5qyZ-0005Tm-6D
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 18:29:55 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c90c410d-9623-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 19:29:51 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5cbb6166c06so5470099a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 11:29:51 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb6349364sm4108632a12.96.2024.10.29.11.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 11:29:48 -0700 (PDT)
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
X-Inumbo-ID: c90c410d-9623-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmMiLCJoZWxvIjoibWFpbC1lZDEteDUyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM5MGM0MTBkLTk2MjMtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjI2NTkxLjU3MTY1NCwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730226591; x=1730831391; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62XfKts/jlV6wAkk/iXygJQPo4JNfIIsvlIE+iio9oA=;
        b=bWKXuzvblqVntJ7vL1/4GsZYA6r0NISlWSvj6LYZ7TlQmIGvfDqc65yplRnlVNq2p6
         2FHjpnq87SZvwKxizjGceJ0Rq+iiX+gwhNrcDygfs53dQc4P/L8mOkCkdNT9gmvf/pd0
         i2NIFhjl4dm1m+wodAvYRBMVRL8TWxEHJQewI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730226591; x=1730831391;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=62XfKts/jlV6wAkk/iXygJQPo4JNfIIsvlIE+iio9oA=;
        b=ENj1ZNilAWyUokLz+HDB5tPdw/xoSN4ANIsJUr3m6uB9PQY77w/qn8ajAmnI3yRRpe
         H/lpv9OPc/3uFAAGl1MwWln7W6FPPi+9n4E2MA1pUwXBSPf3ihpL7QyoyHI42i/kT8ww
         zXMbnl191QC2lXJ5ebiuVo5BdMYBnZPKXAkn6V4MhaCxzwXEgG1IJlVxuhuCPjJ1gTR8
         v7gplCqGs+haGchNOegiTh02wjrRUvbRB5ZhhVj/yfbZ8jJzzzQeHu7Rfx0GtIXYqBJ5
         cO6R4lZ86PtqKltoNJloEBaxZZF3XP8a43VsJUKVx6tUE2Ws3dxxJkoFyiiDPenx9foQ
         ZS9A==
X-Forwarded-Encrypted: i=1; AJvYcCWI8PdLClpV7qT9Lv7vZ6pBNuLcvGIUMBzDDTOeWBJ0G6gKeTn3s4hggWY1eNOsxPjDpu/IzOXW9a4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJdVkDmtwRQVw0rVrGzXyxFeHiHNoCNXQV5LmKH0/rQbB8rmzo
	hC2qtyHI45gKGL98PSfbj9GiuZy1uXVf+gurAmMHJxqxNlz/6cvMZ5+jZHiweuU=
X-Google-Smtp-Source: AGHT+IHAwfQtFagKdNnvOcHDs1in53j1395r/FYNsDLL2oun9r8JYBY74PFAnyoc/R76AO3lNdGkgQ==
X-Received: by 2002:a05:6402:2712:b0:5c9:4281:4515 with SMTP id 4fb4d7f45d1cf-5cbbf8c2866mr11825924a12.17.1730226589879;
        Tue, 29 Oct 2024 11:29:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Oct 2024 18:29:46 +0000
Message-Id: <D58I4WS083OC.3JTJQC57GIDXT@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich"
 <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini"
 <sstabellini@kernel.org>, "Juergen Gross" <jgross@suse.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>,
 =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, "Christian Lindig"
 <christian.lindig@citrix.com>, "David Scott" <dave@recoil.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, "Michal Orzel" <michal.orzel@amd.com>,
 "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 0/6] xen/abi: On wide bitfields inside primitive
 types
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
In-Reply-To: <20241029181632.69600-1-alejandro.vallejo@cloud.com>

On Tue Oct 29, 2024 at 6:16 PM GMT, Alejandro Vallejo wrote:
> Non-boolean bitfields in the hypercall ABI make it fairly inconvenient to
> create bindings for any language because (a) they are always ad-hoc and a=
re
> subject to restrictions regular fields are not (b) require boilerplate th=
at
> regular fields do not and (c) might not even be part of the core language=
,
> forcing avoidable external libraries into any sort of generic library.
>
> This patch (it's a series merely to split roughly by maintainer) is one s=
uch
> case that I happened to spot while playing around. It's the grant_version
> field, buried under an otherwise empty grant_opts.
>
> The invariant I'd like to (slowly) introduce and discuss is that fields m=
ay
> have bitflags (e.g: a packed array of booleans indexed by some enumerated
> type), but not be mixed with wider fields in the same primitive type. Thi=
s
> ensures any field containing an integer of any kind can be referred by po=
inter
> and treated the same way as any other with regards to sizeof() and the li=
ke.
>
> I'd like to have a certain consensus about this general point before goin=
g
> establishing this restriction in the IDL system I'm working on.
>
> My preference would be to fold everything into a single patch if we decid=
e to
> follow through with this particular case. As I said before, the split is
> artificial for review.
>
> Alejandro Vallejo (6):
>   xen/domctl: Refine grant_opts into grant_version
>   tools: Rename grant_opts to grant_version
>   tools/ocaml: Rename grant_opts to grant_version
>   xen/arm: Rename grant_opts to grant_version
>   xen/x86: Rename grant_opts to grant_version
>   xen/common: Rename grant_opts to grant_version
>
>  tools/helpers/init-xenstore-domain.c             |  2 +-
>  tools/libs/light/libxl_create.c                  |  2 +-
>  tools/ocaml/libs/xc/xenctrl_stubs.c              |  3 +--
>  tools/python/xen/lowlevel/xc/xc.c                |  2 +-
>  tools/tests/paging-mempool/test-paging-mempool.c |  2 +-
>  tools/tests/resource/test-resource.c             |  6 +++---
>  tools/tests/tsx/test-tsx.c                       |  4 ++--
>  xen/arch/arm/dom0less-build.c                    |  4 ++--
>  xen/arch/arm/domain_build.c                      |  2 +-
>  xen/arch/x86/setup.c                             |  2 +-
>  xen/common/domain.c                              |  6 +++---
>  xen/common/grant_table.c                         |  3 +--
>  xen/include/public/domctl.h                      | 15 +++++++++++----
>  xen/include/xen/grant_table.h                    |  4 ++--
>  14 files changed, 31 insertions(+), 26 deletions(-)

Bah. I sent it too early. The new field in patches 2-6 ought to be
max_grant_version. Regardless, the general point still holds, I hope.

Cheers,
Alejandro

