Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAA7AABF8F
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 11:33:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976970.1364065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCEfU-0006hO-BB; Tue, 06 May 2025 09:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976970.1364065; Tue, 06 May 2025 09:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCEfU-0006eZ-8c; Tue, 06 May 2025 09:32:52 +0000
Received: by outflank-mailman (input) for mailman id 976970;
 Tue, 06 May 2025 09:32:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0mWQ=XW=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1uCEfS-0006eT-JX
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 09:32:50 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e1092d8-2a5d-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 11:32:40 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-acbb85ce788so10250966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 02:32:40 -0700 (PDT)
Received: from smtpclient.apple ([46.149.103.8])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1895402c7sm662621366b.164.2025.05.06.02.32.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 May 2025 02:32:39 -0700 (PDT)
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
X-Inumbo-ID: 0e1092d8-2a5d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746523960; x=1747128760; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvp3MsKGEBlhGL6z+rmvd9Ulc40wGOqRLMcLeinzkDs=;
        b=AuZxH0dyy0Ar+Mu+kz+CS77qPZCi7rSBhK63mh2HDkriFG6lJpt67lQks25PePpylz
         K3mFcLIxqlIsS/XHaOeX4MI7SlV7ku1p6qanHMtIyfl/yMoCsZrv2VOBouYQN6nf8+ru
         mrgAGRN8PzaEpDXYHsbl0FwXZkX9NpGPmmmys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523960; x=1747128760;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvp3MsKGEBlhGL6z+rmvd9Ulc40wGOqRLMcLeinzkDs=;
        b=uByIs7t6KZprBrwIy5y8abY7r94KGxDKaz27Sai+EXVtSJoee0OrwKNnJr297rXQsk
         PQG0ay/YQSt7u5JDcaqODz+w89nJr1K6aOvwmH1s1U4ooRdYnupSjzHRLP4I+fej4q/l
         dSiE2xlrdI1wU8R+uwhw2+DSay8sMv6++FCofjUzCPPRsa4KX1m9GxRO7rwOhMGmL6T7
         50VLdwf9Wi0cK4cqZWG+mUnVmOemAaNdXqJkqXzW489ZnG2DnfNvNl2ss7lufOJ4LGP4
         nYTwRm8BnmwwV+RCLYzjf7ZpudTDna6754b7WR6HYgGPeA+wqAFuZTYINOY9FYFiXJ+j
         jz4Q==
X-Gm-Message-State: AOJu0YwdEnctdl7+ygdYvJ8JrdBx8+QaFW9Ct196R+IbbWyKlrNx8kRA
	Wr/Bh+hsLbXrYiky3mcNujBASMv4JMB346Pr7Mes1Ks8GJiZWCP+NOXdmchTeDI=
X-Gm-Gg: ASbGncv1nbZLOz1JgOI7TLht9ZLh4GmRBaZOI+ktosiscJwa21qN6iWNUmoEF1iTNhR
	gUbFMpdji7/2M6oYMlmWwAbyjhJXA0TaaLWV+4zGmye30ZwIT+L7NpDpLaKS5jQLpoAwtce8rC2
	ReXkNyy34h/xGhPAMRpD80HZYufH3e21lwEmPmuDeo3x3OumQ03SAMV03WOUvq8BhQPVFOMnrPV
	QgsndJNGSJhqTsB4aVdMCbEAJnM1uzI/cCI2xTrywGzX7pbKckjGwXSYwRw0lo6fbHJLkz82VlJ
	MFNAs0+HHnNyJm2eLU2zSwRyG18Np3GtT+ih0cedxjd0f4Of/JsIhsKIFxJfxuBg6TFqWw==
X-Google-Smtp-Source: AGHT+IG3RVyMSlhTv05uiwA4OlXm0wrxoot/dtnfagAG6hyCYP+4Un9BzgMoJ+9zWwsKv7sMcDAZDQ==
X-Received: by 2002:a17:907:c01a:b0:ac7:66fb:6a07 with SMTP id a640c23a62f3a-ad1d44fb59emr213921566b.6.1746523959941;
        Tue, 06 May 2025 02:32:39 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH 0/8] xen: cache control improvements
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20250506083148.34963-1-roger.pau@citrix.com>
Date: Tue, 6 May 2025 10:32:28 +0100
Cc: xen-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 David Scott <dave@recoil.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Edwin Torok <edwin.torok@cloud.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <491870F7-DE91-46E6-AB96-A9A3478EA362@cloud.com>
References: <20250506083148.34963-1-roger.pau@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)

This looks fine from an OCaml perspective, which is my focus. I didn't =
review the logical aspect of this.

=E2=80=94 Christian

Acked-by: Christian Lindig <christian.lindig@cloud.com>


> On 6 May 2025, at 09:31, Roger Pau Monne <roger.pau@citrix.com> wrote:
>=20
> Hello,
>=20
> Following series contain some fixes for cache control operations, the
> main focus is to reduce the load on big systems when cache control
> operations are executed.
>=20
> Patches 1-4 are bugfixes, while patches starting from 5 are =
improvements
> to the current code.  Patch 9 is an optimization to avoid having to
> broadcast cache flushes on all pCPUs on x86.
>=20
> Thanks, Roger.
>=20
> Roger Pau Monne (9):
>  x86/pv: fix MMUEXT_FLUSH_CACHE to flush all pCPU caches
>  x86/pv: fix emulation of wb{,no}invd to flush all pCPU caches
>  xen/gnttab: limit cache flush operation to guests allowed cache
>    control
>  x86/gnttab: do not implement GNTTABOP_cache_flush
>  x86/mtrr: use memory_type_changed() in hvm_set_mem_pinned_cacheattr()
>  x86/p2m: limit cache flush in memory_type_changed()
>  xen/x86: rename cache_flush_permitted() to has_arch_io_resources()
>  xen: introduce flag when a domain requires cache control
>  xen/x86: track dirty pCPU caches for a given vCPU
>=20
> docs/man/xl.cfg.5.pod.in            | 10 +++++++
> tools/include/libxl.h               |  7 +++++
> tools/libs/light/libxl_create.c     |  6 ++++
> tools/libs/light/libxl_types.idl    |  3 ++
> tools/ocaml/libs/xc/xenctrl.ml      |  1 +
> tools/ocaml/libs/xc/xenctrl.mli     |  1 +
> tools/xl/xl_parse.c                 |  2 ++
> xen/arch/arm/dom0less-build.c       | 12 ++++++--
> xen/arch/arm/domain.c               |  3 +-
> xen/arch/arm/domain_build.c         |  6 ++++
> xen/arch/x86/domain.c               | 43 +++++++++++++++++++++++++++++
> xen/arch/x86/hvm/hvm.c              |  2 +-
> xen/arch/x86/hvm/mtrr.c             | 29 ++++---------------
> xen/arch/x86/hvm/svm/svm.c          |  6 ++--
> xen/arch/x86/hvm/vmx/vmcs.c         |  3 +-
> xen/arch/x86/hvm/vmx/vmx.c          |  6 ++--
> xen/arch/x86/include/asm/domain.h   |  9 ++++++
> xen/arch/x86/include/asm/flushtlb.h | 15 ----------
> xen/arch/x86/include/asm/iocap.h    | 19 ++-----------
> xen/arch/x86/include/asm/p2m.h      |  2 +-
> xen/arch/x86/mm.c                   | 21 ++++----------
> xen/arch/x86/mm/p2m-ept.c           |  7 +----
> xen/arch/x86/mm/p2m-pod.c           |  4 +--
> xen/arch/x86/mm/p2m.c               | 13 ++++++++-
> xen/arch/x86/pv/emul-priv-op.c      | 19 ++++++-------
> xen/arch/x86/setup.c                |  7 +++++
> xen/common/domain.c                 |  3 +-
> xen/common/grant_table.c            | 11 ++++++++
> xen/common/memory.c                 |  2 +-
> xen/include/asm-generic/iocap.h     |  2 +-
> xen/include/public/domctl.h         |  4 ++-
> xen/include/xen/iocap.h             | 25 ++---------------
> xen/include/xen/sched.h             |  6 ++++
> 33 files changed, 181 insertions(+), 128 deletions(-)
>=20
> --=20
> 2.48.1
>=20


