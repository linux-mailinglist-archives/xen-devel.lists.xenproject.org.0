Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9DAAFDC55
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 02:27:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037544.1410156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZIe0-0004DG-28; Wed, 09 Jul 2025 00:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037544.1410156; Wed, 09 Jul 2025 00:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZIdz-0004Bm-VQ; Wed, 09 Jul 2025 00:26:39 +0000
Received: by outflank-mailman (input) for mailman id 1037544;
 Wed, 09 Jul 2025 00:26:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YmHR=ZW=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uZIdy-0004Bg-0W
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 00:26:38 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ddd2b33-5c5b-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 02:26:33 +0200 (CEST)
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
X-Inumbo-ID: 5ddd2b33-5c5b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1752020792; x=1752279992;
	bh=vPgtjDY7cUdj/kmyyaKsF26tZQxm/qRby6rvlmUCX0Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Ff8H+FIHyAf+k/u298ZDaaK+SsJCF3TDe7QoxlNEukXoH32Z4ZPhBjBFIADdwIc4d
	 FwuHglzvLO9np71Unl7HSQuLDIOe7M3B4vrixSWOWpP0CTa+NNQyz0dCFMyS/nBWzN
	 9bNGXrAjMsuJavoHCfNdJQVCsMYnzUOj//HRIxwwNjoPecnGjN+2iLoxeWUrE3/5KI
	 QpSu1F5JmyqZsRRN/lT3UMwsKV88I4MF2Fc92uS8SD4pQn3DxKwKzDx9K3Gkq1Cd/p
	 0ntdMVbKfxwkOIZPDhruFYw1V/rbKNXi29Ci15QYSI9zvr6TyGdO8FwV7aWUZl9I9n
	 ttYTecPmS2C6w==
Date: Wed, 09 Jul 2025 00:26:27 +0000
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v6 01/11] xen: Conditionally compile out the boot_module.domU
Message-ID: <aG23L5M4qo4KsvMw@kraken>
In-Reply-To: <20250708180721.2338036-2-alejandro.garciavallejo@amd.com>
References: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com> <20250708180721.2338036-2-alejandro.garciavallejo@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 7c99c75abe01abdc1e30d75954e16a3e3b1c8d54
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 08, 2025 at 08:07:10PM +0200, Alejandro Vallejo wrote:
> ... based on CONFIG_X86. x86 won't depend on it, and it'll only be used
> by the domain builder in common/device-tree/
>=20
> Moving it to an arch-specific subfield (as introduced in a later patch)
> is unwieldy, because all other arches depend on it.
>=20
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Please consider

Reviewed-by: Denis Mukhin <dmukhin@ford.com>=20

for the series.

> ---
> My expectation is to remove the field altogether after we reach full
> integration in common code, by deducing this boolean from the domain
> capabilities given in the "capabilities" prop.
>=20
> That's not something I'm working at the moment though.
> ---
>  xen/include/xen/bootfdt.h | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index 236b456dd2..7f49d0ccdd 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -96,16 +96,18 @@ struct shared_meminfo {
>      struct shmem_membank_extra extra[NR_SHMEM_BANKS];
>  };
>=20
> -/*
> - * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
> - * The purpose of the domU flag is to avoid getting confused in
> - * kernel_probe, where we try to guess which is the dom0 kernel and
> - * initrd to be compatible with all versions of the multiboot spec.
> - */
>  #define BOOTMOD_MAX_CMDLINE 1024
>  struct boot_module {
>      boot_module_kind kind;
> +#ifndef CONFIG_X86
> +    /*
> +     * The domU flag is set for kernels and ramdisks of "xen,domain" nod=
es.
> +     * The purpose of the domU flag is to avoid getting confused in
> +     * kernel_probe, where we try to guess which is the dom0 kernel and
> +     * initrd to be compatible with all versions of the multiboot spec.
> +     */
>      bool domU;
> +#endif
>      paddr_t start;
>      paddr_t size;
>  };
> --
> 2.43.0
>=20
>=20


