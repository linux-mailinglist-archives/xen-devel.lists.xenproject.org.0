Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3D3A1269B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 15:56:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872650.1283626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY4nv-0008VO-0x; Wed, 15 Jan 2025 14:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872650.1283626; Wed, 15 Jan 2025 14:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY4nu-0008Sf-TW; Wed, 15 Jan 2025 14:55:34 +0000
Received: by outflank-mailman (input) for mailman id 872650;
 Wed, 15 Jan 2025 14:55:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IgWj=UH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tY4nt-0008SZ-NF
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 14:55:33 +0000
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [2001:4860:4864:20::30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3c9867c-d350-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 15:55:31 +0100 (CET)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-29fe7ff65e6so2442946fac.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 06:55:31 -0800 (PST)
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
X-Inumbo-ID: c3c9867c-d350-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736952930; x=1737557730; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lH4HvbP72tXI20f7Q5FuOMRplx3WULjkOFfrQE0VGtc=;
        b=bujWJZxGfII55fT2P9h5Ipm4kK6VDQGm8bo/c0uPqp3NE70jreBgyRn8MTD7kyA/DZ
         6OLGadqXTP4qgNZU5ztzYpzHou9nATw8X+4w/tKoiZxTZTbcjz6xDWfgkJsCpSjVMnCL
         elVNg7/LARShCBK4VMpa+cSDjSP+ajokszYIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736952930; x=1737557730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lH4HvbP72tXI20f7Q5FuOMRplx3WULjkOFfrQE0VGtc=;
        b=UBH1rD1WeyHm8Ou88e6XA441MyOizwkhOInzFHZz10jd8AgSF6yLJYnHeldKdVXULT
         CZ4RpwLNdI2yTAeUrW27xFZaMDHXGYOt7HzXeDa4OkHcrz1Jk2s7DvtQkWv4eo32Xzuk
         XcdeDqjtYoL8NKy2z1weraNOMNj29Ki+mfZkNk2qtM1DJyWZaLY7Q2TUD7VyD6bhSwGc
         67OG+WopbPTsO5Ge3vwITN07sH6lWgB2beC53K9jwU1gZc6SLd3oFf1+bZDUElqwkwWJ
         +vtfvGodltuRn/Y6I44AR/I1uYV9TbG8kQHASHN1d2yQWbCwO3SIWGgWmQcADy4iP3D+
         JSwA==
X-Gm-Message-State: AOJu0YyG397uK+uzmpaXf00RQP1Mh1/tXnvqHJZa/R2KciueiMZzJeWZ
	tlF7DtfJn133i1wQ4lvpY9fZ4kd7T1yZiMcxXXGNLtXtBkF1VF1SG5uf90IppAcGJki3bLT2Fvx
	79doWJci00PdPj0LKHwLYYDkdS6Y4epsnZ+QSNg==
X-Gm-Gg: ASbGncu79UqTfeHjF6KEdneveFgsnYrMQjKC4cpa3Vqns3JdeFo40mxOOluXLuC2H3F
	Fi74BIJUBKnySfn2IdgRbmLkamCNVZQKHb+Fs+ipe
X-Google-Smtp-Source: AGHT+IFW8GHGlmE7c2n9H34hEj3KYMkRZaErmvd6Hr7R0ezAWD1t4iaVAlY1ADgjVLqSKRc0GSFsllHMYELet8Cf0tQ=
X-Received: by 2002:a05:6870:2dc9:b0:29f:f1cc:12a5 with SMTP id
 586e51a60fabf-2aa06922d18mr17574654fac.31.1736952930090; Wed, 15 Jan 2025
 06:55:30 -0800 (PST)
MIME-Version: 1.0
References: <692dabc63953fb0d33536f87e4c5c147ba6ce11c.1736948633.git.bernhard.kaindl@cloud.com>
In-Reply-To: <692dabc63953fb0d33536f87e4c5c147ba6ce11c.1736948633.git.bernhard.kaindl@cloud.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 15 Jan 2025 14:55:19 +0000
X-Gm-Features: AbW1kvYgZ5JcRSI-PosffDfZftCmvnHqB8uzkwtPgICHiU2n9Oq3o9EFhZKi7vE
Message-ID: <CACHz=ZjgkDUsxSL1vS09A6E3QmPXQTYO3aaoijNUTdoyBK7abg@mail.gmail.com>
Subject: Re: [PATCH] Design docs: Fix some typos in the design docs
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 1:45=E2=80=AFPM Bernhard Kaindl
<bernhard.kaindl@cloud.com> wrote:
>
> Skimming through the design docs, I saw some typos that needed fixing.
>
> ---
> Comments for reviewers (not for the commit message itself):
>
> Sample typos (some are not easy to spot):
> - heirarchical: (ei->ie)
> - implementaiton: (it->ti)
> - comprimised: (i->o)
> - contol->control (r)
>
> PS: I did the fixes using LTeX in an IDE and re-checked the mail too.
>
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
> ---
>  docs/designs/argo.pandoc                |  4 ++--
>  docs/designs/nested-svm-cpu-features.md | 12 ++++++------
>  docs/designs/qemu-deprivilege.md        |  8 ++++----
>  docs/designs/xenstore-migration.md      |  2 +-
>  docs/features/qemu-deprivilege.pandoc   |  2 +-
>  5 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/docs/designs/argo.pandoc b/docs/designs/argo.pandoc
> index e18aacea7c..cd854d2a7a 100644
> --- a/docs/designs/argo.pandoc
> +++ b/docs/designs/argo.pandoc
> @@ -58,7 +58,7 @@ concurrency.
>
>  Avoidance of deadlock is essential and since state must frequently be up=
dated
>  that pertains to more than one domain, a locking protocol defines which =
locks
> -are needed and the order of their acquistion.
> +are needed and the order of their acquisition.
>
>  ## Structure
>
> @@ -127,7 +127,7 @@ by the domain.
>
>  ## Hierarchical Locking Model and Protocol
>
> -The locking discipline within the Argo code is heirarchical and utilizes
> +The locking discipline within the Argo code is hierarchical and utilizes
>  reader/writer locks to enable increased concurrency when operations do n=
ot
>  conflict. None of the Argo locks are reentrant.
>
> diff --git a/docs/designs/nested-svm-cpu-features.md b/docs/designs/neste=
d-svm-cpu-features.md
> index 837a96df05..c855748141 100644
> --- a/docs/designs/nested-svm-cpu-features.md
> +++ b/docs/designs/nested-svm-cpu-features.md
> @@ -22,7 +22,7 @@ leaf 8000000A:edx
>    from the L1 hypervisor's perspective to be as close as possible to
>    the original hardware.  In particular, the behavior of the hardware
>    on error paths 1) is not easy to understand or test, 2) can be the
> -  source of surprising vulnerabiliies.  (See XSA-7 for an example of a
> +  source of surprising vulnerabilities.  (See XSA-7 for an example of a
>    case where subtle error-handling differences can open up a privilege
>    escalation.)  We should avoid emulating any bit of the hardware with
>    complex error paths if we can at all help it.
> @@ -59,11 +59,11 @@ leaf 8000000A:edx
>
>  - 2 `SVML` *SVM Lock*: Not required for L0, not provided to L1
>
> -  Seems to be aboult enabling an operating system to prevent "blue
> +  Seems to be about enabling an operating system to prevent "blue
>    pill" attacks against itself.
>
>    Xen doesn't use it, nor provide it; so it would need to be
> -  implementend.  The best way to protect a guest OS is to leave nested
> +  implemented.  The best way to protect a guest OS is to leave nested
>    virt disabled in the tools.
>
>  - 3 `NRIPS` NRIP Save: Require for both L0 and L1
> @@ -78,8 +78,8 @@ leaf 8000000A:edx
>    The main putative use for this would be trying to maintain an
>    invariant TSC across cores with different clock speeds, or after a
>    migrate.  Unlike others, this doesn't have an error path to worry
> -  about compatibility-wise; and according to tests done when nestedSVM
> -  was first implemented, it's actually faster to emliate TscRateMSR in
> +  about compatibility-wise; and according to tests done when nested SVM
> +  was first implemented, it's actually faster to emulate TscRateMSR in
>    the L0 hypervisor than for L1 to attempt to emulate it itself.
>
>    However, using this properly in L0 will take some implementation
> @@ -89,7 +89,7 @@ leaf 8000000A:edx
>   - 5 `VmcbClean`: VMCB Clean Bits: Not required by L0, provide to L1
>
>    This is a pure optimization, both on the side of the L0 and L1.  The
> -  implementaiton for L1 is entirely Xen-side, so can be provided even
> +  implementation for L1 is entirely Xen-side, so can be provided even
>    on hardware that doesn't provide it.  And it's purely an
>    optimization, so could be "implemented" by ignoring the bits
>    entirely.
> diff --git a/docs/designs/qemu-deprivilege.md b/docs/designs/qemu-deprivi=
lege.md
> index f12b1a3ae3..603491f24d 100644
> --- a/docs/designs/qemu-deprivilege.md
> +++ b/docs/designs/qemu-deprivilege.md
> @@ -22,7 +22,7 @@ The following restrictions are currently implemented.
>  '''Description''': As mentioned above, having QEMU switch to a
>  non-root user, one per domain id.  Not being the root user limits what
>  a compromised QEMU process can do to the system, and having one user
> -per domain id limits what a comprimised QEMU process can do to the
> +per domain id limits what a compromised QEMU process can do to the
>  QEMU processes of other VMs.
>
>  '''Implementation''': The toolstack adds the following to the qemu comma=
nd-line:
> @@ -79,8 +79,8 @@ Then adds the following to the qemu command-line:
>  ## Namespaces for unused functionality (Linux only)
>
>  '''Description''': QEMU doesn't use the functionality associated with
> -mount and IPC namespaces. (IPC namespaces contol non-file-based IPC
> -mechanisms within the kernel; unix and network sockets are not
> +mount and IPC namespaces. (IPC namespaces control non-file-based IPC
> +mechanisms within the kernel; Unix and network sockets are not
>  affected by this.)  Making separate namespaces for these for QEMU
>  won't affect normal operation, but it does mean that even if other
>  restrictions fail, the process won't be able to even name system mount
> @@ -251,7 +251,7 @@ executing QEMU.  (But this would then require other c=
hanges to create
>  the QMP socket, VNC socket, and so on).
>
>  It should be noted that `-sandbox` is implemented as a blacklist, not
> -a whitelist; that is, it disables known-unsed functionality which may
> +a whitelist; that is, it disables known-unused functionality which may
>  be harmful, rather than disabling all functionality except that known
>  to be safe and needed.  This is unfortunately necessary since qemu
>  doesn't know what system calls libraries might end up making.  (See
> diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-m=
igration.md
> index 5022268386..082314bf72 100644
> --- a/docs/designs/xenstore-migration.md
> +++ b/docs/designs/xenstore-migration.md
> @@ -372,7 +372,7 @@ or modified by a transaction for which there is also =
a `TRANSACTION_DATA`
>  record previously present).
>
>  Each _committed_ node in the stream is required to have an already known=
 parent
> -node. A parent node is known if it was either in the node data base befo=
re the
> +node. A parent node is known if it was either in the node database befor=
e the
>  stream was started to be processed, or if a `NODE_DATA` record for that =
parent
>  node has already been processed in the stream.
>
> diff --git a/docs/features/qemu-deprivilege.pandoc b/docs/features/qemu-d=
eprivilege.pandoc
> index 4ef119c821..915e38d8c9 100644
> --- a/docs/features/qemu-deprivilege.pandoc
> +++ b/docs/features/qemu-deprivilege.pandoc
> @@ -25,7 +25,7 @@ dm_restrict is a set of operations to restrict QEMU run=
ning in domain
>
>   1. Mechanisms to restrict QEMU to only being able to affect its own
>  domain
> - 2. Mechanisms to restruct QEMU's ability to interact with domain 0.
> + 2. Mechanisms to restrict QEMU's ability to interact with domain 0.
>
>  # User details
>

Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Frediano

