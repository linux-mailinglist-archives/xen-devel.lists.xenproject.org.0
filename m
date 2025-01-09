Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B618BA07F8D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 19:06:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869076.1280580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVwv4-0003Xa-RN; Thu, 09 Jan 2025 18:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869076.1280580; Thu, 09 Jan 2025 18:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVwv4-0003VD-OB; Thu, 09 Jan 2025 18:06:10 +0000
Received: by outflank-mailman (input) for mailman id 869076;
 Thu, 09 Jan 2025 18:06:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wQIl=UB=kernel.org=song@srs-se1.protection.inumbo.net>)
 id 1tVwv3-0003V4-3T
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 18:06:09 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 647d5c37-ceb4-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 19:06:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A0981A4253D
 for <xen-devel@lists.xenproject.org>; Thu,  9 Jan 2025 18:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9561C4CEE6
 for <xen-devel@lists.xenproject.org>; Thu,  9 Jan 2025 18:06:03 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-844e10ef3cfso79573939f.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 10:06:03 -0800 (PST)
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
X-Inumbo-ID: 647d5c37-ceb4-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736445963;
	bh=rp9xKD+8m1msQ0xxbCs9oZzFyU1GURrqUZhq3NbpvyQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hXJVC9TEna9TWYKbS9F02aIUvOHalq4E7m1+cvMk0ArDdbnyNkOQeESQ7Ur7QTEYq
	 oV3fJnNHiU6ugTU9/tuOjHdJ9qaR831jsML8BcJ2B2+uzRQfA4kpmr3AmZ+XqRvw70
	 BTN8HX8ggLtR2WOIhN2X2Ipa4OKa5qs1wwTNGfy1p+9su4jHqsiWIAwGFmgaxU7Nfw
	 H9Abn1fQ/2SPP2QU6lVw0EYHITfjtwSWp9wIQJbaVZRVNv4TDYE1jWwRNuescPEqI8
	 vYK392uOFALwuMqP1HoC1bERclFcBuYV7fmAeGJqkaXECHPwUoHQw9LVho0fFgK9tk
	 fJ+fXn+JQWXLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZSQW5bk4oATLhvsc1oDyAnG1SwggSZo+AjYaf7Tg3MeGsPkEhsm+TkHF+f7J+KN/272LGX/BIdhU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMlj+KvnQUV6T0abWrcFY0Fw84zaMPJDbfpx0bBDelusJm2pzv
	U24/UAQgp8yxrrWsdL5LV9WqfVHsujQAS1Y8xVKZamP7XnuEtS6lEbKymrJa3aMwCH56mmGfeQq
	xpc0pXK8aK+NioK5eof0cjFQkOco=
X-Google-Smtp-Source: AGHT+IHw82IqZn0L3vIWI2GRAE2/Fu1vkOzFuTOkK3ccul7HxPp7E2ac95iMCNTUN8mztI4YyZ2Kf9FZUsicSlonzfg=
X-Received: by 2002:a05:6e02:3048:b0:3a7:6a98:3fdf with SMTP id
 e9e14a558f8ab-3ce3a9da817mr60484875ab.14.1736445963152; Thu, 09 Jan 2025
 10:06:03 -0800 (PST)
MIME-Version: 1.0
References: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
In-Reply-To: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 9 Jan 2025 10:05:51 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5zpA28gkBQYMMuYCUbnDzdeq4pHsd0Mx=PBnDPiHKqHw@mail.gmail.com>
X-Gm-Features: AbW1kvZZD8oqcdTZ9DXv7tEUC7bpyqeBsuw6nnhXboAE2kNg_1eTiibnv93HXj8
Message-ID: <CAPhsuW5zpA28gkBQYMMuYCUbnDzdeq4pHsd0Mx=PBnDPiHKqHw@mail.gmail.com>
Subject: Re: [PATCH] treewide: const qualify ctl_tables where applicable
To: Joel Granados <joel.granados@kernel.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev, 
	codalist@coda.cs.cmu.edu, linux-mm@kvack.org, linux-nfs@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, fsverity@lists.linux.dev, 
	linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org, 
	kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, keyrings@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 5:16=E2=80=AFAM Joel Granados <joel.granados@kernel.=
org> wrote:
>
[...]
>  drivers/base/firmware_loader/fallback_table.c | 2 +-
>  drivers/cdrom/cdrom.c                         | 2 +-
>  drivers/char/hpet.c                           | 2 +-
>  drivers/char/ipmi/ipmi_poweroff.c             | 2 +-
>  drivers/char/random.c                         | 2 +-
>  drivers/gpu/drm/i915/i915_perf.c              | 2 +-
>  drivers/gpu/drm/xe/xe_observation.c           | 2 +-
>  drivers/hv/hv_common.c                        | 2 +-
>  drivers/infiniband/core/iwcm.c                | 2 +-
>  drivers/infiniband/core/ucma.c                | 2 +-
>  drivers/macintosh/mac_hid.c                   | 2 +-
>  drivers/md/md.c                               | 2 +-

For md bits:

Reviewed-by: Song Liu <song@kernel.org>

Thanks,
Song

[...]

