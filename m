Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC972BDFDD8
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 19:31:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143853.1477452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v95LQ-0004yH-0f; Wed, 15 Oct 2025 17:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143853.1477452; Wed, 15 Oct 2025 17:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v95LP-0004vf-Ti; Wed, 15 Oct 2025 17:31:23 +0000
Received: by outflank-mailman (input) for mailman id 1143853;
 Wed, 15 Oct 2025 17:31:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wenR=4Y=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1v95LP-0004vX-DX
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 17:31:23 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c499161c-a9ec-11f0-9d15-b5c5bf9af7f9;
 Wed, 15 Oct 2025 19:31:22 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-57e36125e8aso2984069e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 Oct 2025 10:31:22 -0700 (PDT)
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
X-Inumbo-ID: c499161c-a9ec-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760549482; x=1761154282; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gE76BkH4GZQ4fS7qoTNXoLhC1V6HX9wpiQEVi5CYbxE=;
        b=JLRrwoMAdP6qJ1nkRJuoKxCcHTYNwJrJhVwYirbSYikJqrPNCYFR+Fzo83kXe9NeZG
         csw7rZitoBSISE46cb3rGryh1qdKnLTxmJuBR0HscPlRDcuxdqh8wWD6EWQBKkaYsUaY
         dXCr1mMd4h6jqmNcbLWK788rSgng1bYTtbkeesJB/pcQjvd5RxIVy8haZRwESPtzwdvO
         vZL4OR/FUt43F8fSRMGmqdeMOzJCNqCgTyiWRS59OOjGpW7jOnSTxi25rYy7RJ4gxvHS
         577f8HpEJi9SQnM4+SuOdAoXmd/mYh0kM39uFSxucozTGsgFCSlprPKghvuqSA7ffuvW
         k9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760549482; x=1761154282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gE76BkH4GZQ4fS7qoTNXoLhC1V6HX9wpiQEVi5CYbxE=;
        b=qk+D2YXe/hNYzYXJ9Zi4E9gdsbZjmxES85zusVksrPZHtlRkcA/sc+EOtRGtcT0Rpw
         594oNeEUiWHXrP5es9hNbn0KvTDOiyCgBWUuwipCYJBU4JQveq10KSMDRahGygSHJSV8
         ML6V8jaGQN7fx32ZF0RVRYel0bdZBTk4RMaajL+Y9IVjAa2jyymGi5hhvkGBgWRMwUK6
         /7bOT98/ps1vkWknZnvmMmffdFBAm34ls1GdUnBCOsuPxvxZ6nXDbLIKnBY3kCQZCFvB
         q7hWmsVrHPcBp6SRkNGe93r09SHBGR7/llaw6OIdGbx7nxLDe6m1ZIjmDfU/7I6pMsxo
         DMAg==
X-Gm-Message-State: AOJu0YwVdEzdB1dEDwSkGyVH/4CxFvNNa9ZNXbTVooRSs8Ez+dQ4OPQq
	RmCnKOySQuqsH4L9vRqzWz/59yPd/lrr0VOaY/nUedEL23U+KbjuvPPdGzQG3QO+XPbkkuOU3L3
	TpMCKzNxdkp+Iwn3H/Y7YA90a/E4ggQycbIVp
X-Gm-Gg: ASbGncu5FlxHP4CMlg6e1wga3PVIuOvjoo3ElqC0VnGXmgLS/OVVaROMxGHrXUSDir6
	rblRrEWcCs4t8YuDcBPDsGvuxqHgnDIcLHFrsTsKevr8hFXXXo1iCHirkEIONOa4j3sS4mLipxr
	4dTBoKUdc+n3zAgVN3FfiT59K28QlTJFbaTGxyGz0YJvOsaPC443iidA6mCnaUtplTttjyp0x/6
	Su79oOswNLPbMqXBl0GERV553Udo8OB4Pw=
X-Google-Smtp-Source: AGHT+IEBP0ld7KXIGNEMcrCAFqf/A8BakJYMP5BpG1UxupqecVwJXbmx1tdDKQimO4oHl4DQD8Qg+QuUbkquTJ87pIM=
X-Received: by 2002:a05:6512:10d4:b0:58b:2b:ac7b with SMTP id
 2adb3069b0e04-5906de8dbd1mr8799742e87.57.1760549481681; Wed, 15 Oct 2025
 10:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1760083684.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1760083684.git.mykyta_poturai@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 15 Oct 2025 20:30:00 +0300
X-Gm-Features: AS18NWBbnmcZGwHh8lD5hVahKPcMQYGUmShzImQMSwFiCQa4eIyHmoK4v2F4LEk
Message-ID: <CAGeoDV-=ON+WSvCQnjaa9zU_74RuFHXrqa5+p8dAjM9fxpomxw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Implement CPU hotplug on Arm
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mykyta,

Thanks for the series.

It seems there might be issues here -- please take a look and let me
know if my concerns are valid:

1. FF-A notification IRQ: after a CPU down->up cycle the IRQ
configuration may be lost.

2. GICv3 LPIs: a CPU may fail to come back up unless its LPI pending
table exists (is allocated) on bring-up. See
gicv3_lpi_allocate_pendtable() and its call chain.

3. IRQ migration on CPU down: if an IRQ targets a CPU being offlined,
its affinity should be moved to an online CPU before completing the
offlining.

4. Race between the new hypercalls and disable/enable_nonboot_cpus():
disable_nonboot_cpus is called, enable_nonboot_cpus() reads
frozen_cpus, and before it calls cpu_up() a hypercall onlines the CPU.
cpu_up() then fails as "already online", but the CPU_RESUME_FAILED
path may still run for an already-online CPU, risking use-after-free
of per-CPU state (e.g. via free_percpu_area()) and other issues
related to CPU_RESUME_FAILED notification.



On Fri, Oct 10, 2025 at 12:36=E2=80=AFPM Mykyta Poturai <Mykyta_Poturai@epa=
m.com> wrote:
>
> This series implements support for CPU hotplug/unplug on Arm. To achieve =
this,
> several things need to be done:
>
> 1. XEN_SYSCTL_CPU_HOTPLUG_* calls implemented.
> 2. timer and GIC maintenance interrupts switched to static irqactions to =
remove
> the need for freeing them during release_irq.
> 3. Enabled the build of xen-hptool on Arm.
>
> Tested on QEMU.
>
> v2->v3:
> * add docs
>
> v1->v2:
> * see individual patches
>
> Mykyta Poturai (5):
>   arm/time: Use static irqaction
>   arm/gic: Use static irqaction
>   arm/sysctl: Implement cpu hotplug ops
>   tools: Allow building xen-hptool without CONFIG_MIGRATE
>   docs: Document CPU hotplug
>
>  config/Tools.mk.in               |  1 +
>  docs/misc/cpu-hotplug.txt        | 51 ++++++++++++++++++++++++++++++++
>  tools/configure                  | 30 +++++++++++++++++++
>  tools/configure.ac               |  1 +
>  tools/libs/guest/Makefile.common |  4 +++
>  tools/misc/Makefile              |  2 +-
>  xen/arch/arm/gic.c               | 11 +++++--
>  xen/arch/arm/sysctl.c            | 45 ++++++++++++++++++++++++++++
>  xen/arch/arm/time.c              | 21 ++++++++++---
>  9 files changed, 159 insertions(+), 7 deletions(-)
>  create mode 100644 docs/misc/cpu-hotplug.txt
>  mode change 100755 =3D> 100644 tools/configure
>
> --
> 2.34.1
>

Best regards,
Mykola

