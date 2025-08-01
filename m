Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D33B1879B
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 21:08:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067497.1432218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhv78-0002US-2j; Fri, 01 Aug 2025 19:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067497.1432218; Fri, 01 Aug 2025 19:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhv78-0002SF-09; Fri, 01 Aug 2025 19:08:22 +0000
Received: by outflank-mailman (input) for mailman id 1067497;
 Fri, 01 Aug 2025 19:08:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GtvS=2N=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhv76-0002S9-Em
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 19:08:20 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e253e0d0-6f0a-11f0-b897-0df219b8e170;
 Fri, 01 Aug 2025 21:08:18 +0200 (CEST)
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
X-Inumbo-ID: e253e0d0-6f0a-11f0-b897-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754075297; x=1754334497;
	bh=O/9rQTItbmmPiut5omOiVaAe3GzkJF9rX6QV5aKd9TE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JGeqDrZLNDKJxA7pVAJtE45wMS2WVXzob7DG7KM+WyP7L+ZOr8akvWm4w0EtxF0K4
	 MXKGGFOlpucoEm575UECc49b8Av3rGKQpoochzXeBnFAiuoZgbWAdddXZEQWOeFmFA
	 6crRlF1e80l8fiGFShnVk7EPPGJ9qxuUfJjDU5eRDmM08xm6UB2H19Ad3axN0ftl43
	 WLcy8krTtMSGssTRrvSnxn3iieKl0DZWirM1Z9hzRdj79drTAH9HRUVWCK8Xa5U9fh
	 VH2Xdop086hHUR3g8UG8K2EoMd+cztN92t9EHi6RiuyuwyZaiojpPmVtQaC2iSVpD3
	 vWhP7e2RURXdA==
Date: Fri, 01 Aug 2025 19:08:12 +0000
To: Grygorii Strashko <grygorii_strashko@epam.com>
From: dmkhn@proton.me
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Shawn Anastasio <sanastasio@raptorengineering.com>, Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN][PATCH 0/3] xen/arch: irq: drop unreachable pirq callbacks
Message-ID: <aI0QkuCAVYSUkFjN@kraken>
In-Reply-To: <20250801100852.1260544-1-grygorii_strashko@epam.com>
References: <20250801100852.1260544-1-grygorii_strashko@epam.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 66f93876a661dea359311dd98a898789654bbe5a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2025 at 10:08:54AM +0000, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>=20
> Hence prerequisite patch was merged [1] arch specific pIRQ callback can n=
ow
> be dropped for arches without pIRQ support as those callback become unrea=
chable.
>=20
> [1] commit 341f271cf86f ("xen/evtchn: fully restrict concept of pIRQ for =
arches with pIRQ support only")
>=20
> Grygorii Strashko (3):
>   xen/arm: irq: drop unreachable pirq callbacks
>   xen/ppc: irq: drop unreachable pirq callbacks
>   xen/riscv: irq: drop unreachable pirq callbacks

Please consider

Reviewed-by: Denis Mukhin <dmukhin@ford.com>=20

for the series with or without further corrections for commit messages
(there was a separate request).

>=20
>  xen/arch/arm/irq.c     | 29 -----------------------------
>  xen/arch/ppc/stubs.c   | 20 --------------------
>  xen/arch/riscv/stubs.c | 20 --------------------
>  3 files changed, 69 deletions(-)
>=20
> --
> 2.34.1
>=20


