Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EA7B1F58A
	for <lists+xen-devel@lfdr.de>; Sat,  9 Aug 2025 19:15:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076159.1437884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uknA3-0001uI-Fa; Sat, 09 Aug 2025 17:15:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076159.1437884; Sat, 09 Aug 2025 17:15:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uknA3-0001rH-Cf; Sat, 09 Aug 2025 17:15:15 +0000
Received: by outflank-mailman (input) for mailman id 1076159;
 Sat, 09 Aug 2025 17:15:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gHj1=2V=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uknA2-0001rB-0U
 for xen-devel@lists.xenproject.org; Sat, 09 Aug 2025 17:15:14 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6929d338-7544-11f0-a325-13f23c93f187;
 Sat, 09 Aug 2025 19:15:13 +0200 (CEST)
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
X-Inumbo-ID: 6929d338-7544-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754759712; x=1755018912;
	bh=thanlJuksLNx6tanpBgKgBiIGs9aSMKVMgh72IminGE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=b8+GPoqdm+/6I5vBnZUuonjTdbJ3Jxx/28dTIRk0/AXuKi7JaH1rPe2B2TxtZL68k
	 ZYqenzlENMJSNJIf/f1dNuefZx7ScarLbbsnzCen/ahMyF6SFQPE0K1cyV6lSe0kV0
	 nvq16NQR6Yupg3z062BjOnAz3HptGiITXjj0VvltVcnD5qDgiROYvsrFlDRcROXO7l
	 Cuocu9wv8r4JD4kVDVpXoNlCJ9zqCFGe9TVlcZAd8KBASDZvfN6f/+KeksWRqFqs9F
	 x0VzhN9jzhYfgIobktfuyH6oaiBJDy29m60UHjuAj3iVgqX5+W+G5itroHCkZ7o4JU
	 /qna6U3xgnGgA==
Date: Sat, 09 Aug 2025 17:15:04 +0000
To: Mykola Kvach <xakep.amatop@gmail.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: irq: add missing spin_unlock() in init_local_irq_data() error path
Message-ID: <aJeCElyVkGY8Ri3i@kraken>
In-Reply-To: <bd707bd0fd88fc53974a1214313a9b9103162bcc.1754749899.git.mykola_kvach@epam.com>
References: <bd707bd0fd88fc53974a1214313a9b9103162bcc.1754749899.git.mykola_kvach@epam.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 03b61940d2d15721c225bcebd61a236476080a71
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 09, 2025 at 05:32:41PM +0300, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
>=20
> If init_one_irq_desc() fails, init_local_irq_data() returns without
> releasing local_irqs_type_lock, leading to a possible deadlock.
>=20
> Release the lock before returning to ensure proper cleanup.
>=20
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Nice catch!

Please consider:

Reviewed-by: Denis Mukhin <dmukhin@ford.com>=20

> ---
>  xen/arch/arm/irq.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 4bbf0b0664..02ca82c089 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -94,7 +94,10 @@ static int init_local_irq_data(unsigned int cpu)
>          int rc =3D init_one_irq_desc(desc);
>=20
>          if ( rc )
> +        {
> +            spin_unlock(&local_irqs_type_lock);
>              return rc;
> +        }
>=20
>          desc->irq =3D irq;
>          desc->action  =3D NULL;
> --
> 2.48.1
>=20
>=20


