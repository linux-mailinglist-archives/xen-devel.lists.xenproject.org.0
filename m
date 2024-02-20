Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1709A85B70B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 10:17:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683347.1062811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcMFM-0003pG-Os; Tue, 20 Feb 2024 09:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683347.1062811; Tue, 20 Feb 2024 09:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcMFM-0003m4-Ll; Tue, 20 Feb 2024 09:17:04 +0000
Received: by outflank-mailman (input) for mailman id 683347;
 Tue, 20 Feb 2024 09:17:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g8eU=J5=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rcMFL-0003ly-1k
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 09:17:03 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd8a3cfe-cfd0-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 10:17:00 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-563cb3ba9daso5131764a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 01:17:00 -0800 (PST)
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
X-Inumbo-ID: cd8a3cfe-cfd0-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1708420620; x=1709025420; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rXxwlzcWHZiy1kRayV9wJT5zpZnSf9Kb/rmAxXTYWY=;
        b=X6so+6oYcMX9wCrAN4YxZUXiMO2ZuC/O6ktI0e31dRsWwbWNX2mnt/dinUtHeeNnyd
         YYPGKp4kfA6iZBpd3YJN6qtVtHHi8epDZFkq6PyaztmBmIHPBrpE5p0fGf46SQqnYEAz
         n6FdsNlySt0aFPv1IsZk/tlHf8trpd3m4i8czo0frwhoJr1NefKTog+bTm8wamcAETVD
         jxH2FKfvpuIAWHFmz1M+jmCP7BiQvD4lRfallj2UqRj3xdjTCm64B9nKpIsVy6ekXPWp
         av0e2eRmBS8Ju1spfOEDO6nRL9omVuHPyxsLqSPGTDW7TnhgEi3X3OXlNwqXy2y1zQBQ
         gjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708420620; x=1709025420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rXxwlzcWHZiy1kRayV9wJT5zpZnSf9Kb/rmAxXTYWY=;
        b=rHl9/GlCXrJtHRqMC6Iya77wpALB8oQU+fEURgPBj+Zi+hRiU4Bal5K0UcLfY2ce2W
         C+xGT2VuRpve38tuIpDHN+o/2DvFHSKxc1rEQCx40HuffR+6frlLWvZTl7KSrvxQDKqo
         J/QPAwOVQIV9dM1QTpFu3n3GiafJGFE4ZfGMz8ccql+VNNSk4SZ6l0Vn0Rongb4I79bs
         RrdYCazArn/dTHIztEXW6sZIWYb/igBakjYAbe0PCe9I/5bM/0kiqE3m0bQ0XCNkEua5
         DQ6r4uAmlvJHfE1m4wn1+uAKIPu8WDAFONyZxDKxaXdW+tphkbyt+nNsWj4xaMP90sdh
         SZ1A==
X-Forwarded-Encrypted: i=1; AJvYcCUndNFKCdBEpPyrGSLSl+w9lWjhDoywxYweOz6sdPjhFFkxSWpa8Sb+hg+BC7VBazyqSY5XbUkvwkkFm5Ezd0llQ5b0VnKMie2ia+gtddQ=
X-Gm-Message-State: AOJu0YyXT8nX38+PhWn/BtLiXesfo4BVvHxgBsSEQMiWKsy3Z0d9ZFez
	2Py7M90Y/MmGdK7PlU4YT41P8Ym92on9EC1FtnfYyyWhBAl8eqzD6qeDnwxVfNmgckbtpQYz8yG
	fIZVdGgGigKujBsxDjcfdG51lgymlcXqm7WsWsw==
X-Google-Smtp-Source: AGHT+IHGqZmj1XoE92SgXdaiZwPbtwJ8uCEiXeV9KzQ1mzqCmHl9rgTyCxLODj5gKNiWMWXNClsXIHVLsfRe6UceBc8=
X-Received: by 2002:aa7:d697:0:b0:564:56ce:5570 with SMTP id
 d23-20020aa7d697000000b0056456ce5570mr3726037edr.33.1708420619889; Tue, 20
 Feb 2024 01:16:59 -0800 (PST)
MIME-Version: 1.0
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-3-carlo.nonato@minervasys.tech> <bb28c8a2-c2bd-4e1d-ad28-9bc632e3e474@amd.com>
 <CAG+AhRXsZC7Pjdce42yYTvBy7MyjS1axrDGsY0U=o+APNyxdYA@mail.gmail.com> <5d2f6be2-020d-4003-ad47-b20ef07ffefc@xen.org>
In-Reply-To: <5d2f6be2-020d-4003-ad47-b20ef07ffefc@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Tue, 20 Feb 2024 10:16:49 +0100
Message-ID: <CAG+AhRX96RBCc0n750K3t+c3j_fKQLrg1K5kLceHig401wS+Ng@mail.gmail.com>
Subject: Re: [PATCH v6 02/15] xen/arm: add initial support for LLC coloring on arm64
To: Julien Grall <julien@xen.org>
Cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
	andrea.bastoni@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien

On Tue, Feb 20, 2024 at 12:06=E2=80=AFAM Julien Grall <julien@xen.org> wrot=
e:
>
> Hi,
>
> On 14/02/2024 13:52, Carlo Nonato wrote:
> > On Wed, Feb 14, 2024 at 11:14=E2=80=AFAM Michal Orzel <michal.orzel@amd=
.com> wrote:
> >>> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/incl=
ude/asm/processor.h
> >>> index 8e02410465..336933ee62 100644
> >>> --- a/xen/arch/arm/include/asm/processor.h
> >>> +++ b/xen/arch/arm/include/asm/processor.h
> >>> @@ -18,6 +18,22 @@
> >>>   #define CTR_IDC_SHIFT       28
> >>>   #define CTR_DIC_SHIFT       29
> >>>
> >>> +/* CCSIDR Current Cache Size ID Register */
> >>> +#define CCSIDR_LINESIZE_MASK            _AC(0x7, ULL)
> >> Why ULL and not UL? ccsidr is of register_t type
> >
> > Julien, while reviewing an earlier version:
> >
> >> Please use ULL here otherwise someone using MASK << SHIFT will have th=
e
> >> expected result.
> >
> > https://patchew.org/Xen/20220826125111.152261-1-carlo.nonato@minervasys=
.tech/20220826125111.152261-2-carlo.nonato@minervasys.tech/#08956082-c194-8=
bae-cb25-44e4e3227689@xen.org
>
> Michal is right. This should be UL. Not sure why I suggested ULL back
> then. Sorry.

No problem.

If there aren't any other comments I will proceed with sending the v7.
Do you guys want to add something on the arm part?

Thanks to both.

> Cheers,
>
> --
> Julien Grall

